//
//  GameObject.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class GameObject {
    private var renderPipelineState: MTLRenderPipelineState
    private let vertices: [Vertex]
    private let buffer: MTLBuffer
    
    init() {
        self.vertices = [
            Vertex(position: float3(0, 0.5, 0), color: float4(1, 0, 0, 1)),         // Top Middle
            Vertex(position: float3(-0.5, -0.5, 0), color: float4(0, 1, 0, 1)),     // Bottom Left
            Vertex(position: float3(0.5, -0.5, 0), color: float4(0, 0, 1, 1))       // Bottom right
        ]
        
        self.buffer = Engine.shared.device!.makeBuffer(bytes: self.vertices,
                                                length: Vertex.stride(self.vertices.count),
                                                options: [])!
        
        self.renderPipelineState = RenderPipelineStateLibrary.shared.pipelineState(.basic)
    }
    
    func render(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(self.renderPipelineState)
        renderCommandEncoder.setVertexBuffer(self.buffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: self.vertices.count)
    }
}
