//
//  Meshes.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

protocol Mesh {
    var vertexBuffer: MTLBuffer! { get }
    var vertexCount: Int! { get }
    
    func setInstanceCount(_ count: Int)
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder)
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
    var instanceCount: Int = 1
    var vertexCount: Int! {
        return self.vertices.count
    }
    
    init() {
        self.createVertices()
        self.vertexBuffer = Engine.shared.device!.makeBuffer(bytes: self.vertices,
                                                length: Vertex.stride(self.vertices.count),
                                                options: [])!
    }
    
    func createVertices() {}
    
    func setInstanceCount(_ count: Int) {
        self.instanceCount = count
    }
    
    func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBuffer(self.vertexBuffer, offset: 0, index: 0)
        
        renderCommandEncoder.drawPrimitives(type: .triangle,
                                            vertexStart: 0,
                                            vertexCount: self.vertexCount,
                                            instanceCount: self.instanceCount)
    }
}

class CubeCustomMesh: CustomMesh {
    override func createVertices() {
        self.vertices = [
            //Left
            Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: float3(-1.0,-1.0, 1.0), color: float4(0.0, 1.0, 0.5, 1.0)),
            Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(0.0, 0.5, 1.0, 1.0)),
            Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
            Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(1.0, 0.0, 1.0, 1.0)),
            
            //RIGHT
            Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 0.0, 0.5, 1.0)),
            Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(0.0, 1.0, 0.0, 1.0)),
            Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(0.0, 0.5, 1.0, 1.0)),
            Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
            Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 0.5, 1.0, 1.0)),
            
            //TOP
            Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 0.0, 0.0, 1.0)),
            Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(0.0, 1.0, 0.0, 1.0)),
            Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(0.0, 0.0, 1.0, 1.0)),
            Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
            Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(0.5, 1.0, 1.0, 1.0)),
            Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(1.0, 0.0, 1.0, 1.0)),
            
            //BOTTOM
            Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(0.5, 1.0, 0.0, 1.0)),
            Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(0.0, 0.0, 1.0, 1.0)),
            Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 1.0, 0.5, 1.0)),
            Vertex(position: float3(-1.0,-1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 0.5, 1.0, 1.0)),
            
            //BACK
            Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(0.5, 1.0, 0.0, 1.0)),
            Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(0.0, 0.0, 1.0, 1.0)),
            Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
            Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 0.5, 1.0, 1.0)),
            
            //FRONT
            Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
            Vertex(position: float3(-1.0,-1.0, 1.0), color: float4(0.0, 1.0, 0.0, 1.0)),
            Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(0.5, 0.0, 1.0, 1.0)),
            Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 1.0, 0.5, 1.0)),
            Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
            Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 0.0, 1.0, 1.0))
        ]
    }
}

class TriangleCustomMesh: CustomMesh {
    override func createVertices() {
        self.vertices = [
            Vertex(position: float3(0, 1, 0), color: float4(1, 0, 0, 1)),         // Top Middle
            Vertex(position: float3(-1, -1, 0), color: float4(0, 1, 0, 1)),     // Bottom Left
            Vertex(position: float3(1, -1, 0), color: float4(0, 0, 1, 1))       // Bottom right
        ]
    }
}

class QuadCustomMesh: CustomMesh {
    override func createVertices() {
        self.vertices = [            
            Vertex(position: float3(1,1,0), color: float4(1,0,0,1)),        // Top Right
            Vertex(position: float3(-1,1,0), color: float4(0,1,0,1)),       // Top Left
            Vertex(position: float3(-1,-1,0), color: float4(0,0,1,1)),      // Bot Left
            
            Vertex(position: float3(1,1,0), color: float4(1,0,0,1)),        // Top Right
            Vertex(position: float3(-1,-1,0), color: float4(0,0,1,1)),      // Bot Left
            Vertex(position: float3(1,-1,0), color: float4(1,0,1,1)),       // Bot Right
        ]
    }
}
