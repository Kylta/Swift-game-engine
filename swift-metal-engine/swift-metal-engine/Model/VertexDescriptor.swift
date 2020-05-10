//
//  VertexDescriptor.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

protocol VertexDescriptor {
    var name: String { get }
    var vertexDescriptor: MTLVertexDescriptor! { get }
}

struct BasicVertexDescriptor: VertexDescriptor {
    var name: String {
        return "Basic Vertex Descriptor"
    }
    
    private(set) var vertexDescriptor: MTLVertexDescriptor!
    
    init() {
        self.vertexDescriptor = MTLVertexDescriptor()
        
        // Position
        self.vertexDescriptor.attributes[0].format = .float3
        self.vertexDescriptor.attributes[0].bufferIndex = 0
        self.vertexDescriptor.attributes[0].offset = 0
        
        // Color
        self.vertexDescriptor.attributes[1].format = .float4
        self.vertexDescriptor.attributes[1].bufferIndex = 0
        self.vertexDescriptor.attributes[1].offset = float3.size()
        
        self.vertexDescriptor.layouts[0].stride = Vertex.stride()
    }
}
