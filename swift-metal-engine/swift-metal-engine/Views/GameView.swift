//
//  GameView.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class GameView: MTKView {
    
    struct Vertex {
        var position: float3
        var color: float4
    }
    
    private var commandQueue: MTLCommandQueue!
    private var renderPipelineState: MTLRenderPipelineState!
    private var vertexBuffer: MTLBuffer!
    
    private let vertices: [Vertex] = [
        Vertex(position: float3(0, 0.5, 0), color: float4(1, 0, 0, 1)),         // Top Middle
        Vertex(position: float3(-0.5, -0.5, 0), color: float4(0, 1, 0, 1)),     // Bottom Left
        Vertex(position: float3(0.5, -0.5, 0), color: float4(0, 0, 1, 1))       // Bottom right
    ]
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        
        self.device = MTLCreateSystemDefaultDevice()
        self.clearColor = MTLClearColor(red: 0.43, green: 0.73, blue: 0.35, alpha: 1)
        self.colorPixelFormat = .bgra8Unorm
        
        self.commandQueue = self.device?.makeCommandQueue()
        
        self.createBuffers()
        
        self.createRenderPipelineState()
    }
    
    override func draw(_ rect: CGRect) {
        guard let drawable = self.currentDrawable,
            let renderPassDescriptor = self.currentRenderPassDescriptor else { return }
        
        let commandBuffer = self.commandQueue.makeCommandBuffer()
        let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
        
        renderCommandEncoder?.setRenderPipelineState(self.renderPipelineState)
        renderCommandEncoder?.setVertexBuffer(self.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: self.vertices.count)
        
        renderCommandEncoder?.endEncoding()
        
        commandBuffer?.present(drawable)
        commandBuffer?.commit()
    }
    
    private func createBuffers() {
        self.vertexBuffer = self.device?.makeBuffer(bytes: self.vertices,
                                                    length: MemoryLayout<Vertex>.stride * self.vertices.count,
                                                    options: [])
    }
    
    private func createRenderPipelineState() {
        let library = self.device?.makeDefaultLibrary()
        let vertexFunction = library?.makeFunction(name: "basic_vertex_shader")
        let fragmentFunction = library?.makeFunction(name: "basic_fragment_shader")
        
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = self.colorPixelFormat
        renderPipelineDescriptor.vertexFunction = vertexFunction
        renderPipelineDescriptor.fragmentFunction = fragmentFunction
        
        self.renderPipelineState = try! self.device?.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
    }
}
