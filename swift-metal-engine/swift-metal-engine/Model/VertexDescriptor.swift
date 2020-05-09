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
    var vertexDescriptor: MTLVertexDescriptor { get }
}

struct BasicVertexDescriptor: VertexDescriptor {
    var name: String {
        return "Basic Vertex Descriptor"
    }
    
    var vertexDescriptor: MTLVertexDescriptor {
        let desc = MTLVertexDescriptor()
        
        // Position
        desc.attributes[0].format = .float3
        desc.attributes[0].bufferIndex = 0
        desc.attributes[0].offset = 0
        
        // Color
        desc.attributes[1].format = .float4
        desc.attributes[1].bufferIndex = 0
        desc.attributes[1].offset = float3.size()
        
        desc.layouts[0].stride = Vertex.stride()
        return desc
    }
}
