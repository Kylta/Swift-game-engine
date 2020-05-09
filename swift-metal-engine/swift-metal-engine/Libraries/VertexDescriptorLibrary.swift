//
//  VertexDescriptorLibrary.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class VertexDescriptorLibrary {
    private var descriptors: [ShaderType: VertexDescriptor] = [:]
    
    static let shared = VertexDescriptorLibrary()
    
    private init() {
        self.descriptors.updateValue(BasicVertexDescriptor(), forKey: .basic)
    }
    
    func descriptor(_ shaderType: ShaderType) -> MTLVertexDescriptor {
        return descriptors[shaderType]!.vertexDescriptor
    }
}
