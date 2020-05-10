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
}

class CustomMesh: Mesh {
    var vertices: [Vertex]!
    var vertexBuffer: MTLBuffer!
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
