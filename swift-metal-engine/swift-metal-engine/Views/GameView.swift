//
//  GameView.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class GameView: MTKView {
    private var renderPipelineState: MTLRenderPipelineState!
    private var vertexBuffer: MTLBuffer!
    
    private let vertices: [Vertex] = [
        Vertex(position: float3(0, 0.5, 0), color: float4(1, 0, 0, 1)),         // Top Middle
        Vertex(position: float3(-0.5, -0.5, 0), color: float4(0, 1, 0, 1)),     // Bottom Left
        Vertex(position: float3(0.5, -0.5, 0), color: float4(0, 0, 1, 1))       // Bottom right
    ]
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = Engine.shared.device
        self.clearColor = Preferences.clearColor
        self.colorPixelFormat = Preferences.pixelFormat
        
        self.vertexBuffer = self.device?.makeBuffer(bytes: self.vertices,
                                                    length: Vertex.stride(self.vertices.count),
                                                    options: [])
        
        self.renderPipelineState = RenderPipelineStateLibrary.shared.pipelineState(.basic)
    }
    
    override func draw(_ rect: CGRect) {
        guard let drawable = self.currentDrawable,
            let renderPassDescriptor = self.currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.shared.commandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        renderCommandEncoder?.setRenderPipelineState(self.renderPipelineState)
        renderCommandEncoder?.setVertexBuffer(self.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: self.vertices.count)
        
        renderCommandEncoder?.endEncoding()
        
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
}
