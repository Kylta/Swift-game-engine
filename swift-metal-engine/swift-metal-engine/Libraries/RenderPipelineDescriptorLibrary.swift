//
//  RenderPipelineDescriptorLibrary.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class RenderPipelineDescriptorLibrary {
    private(set) var renderPipelineDescriptors: [ShaderType: RenderPipelineDescriptor] = [:]
    
    static let shared = RenderPipelineDescriptorLibrary()
    
    private init() {
        self.renderPipelineDescriptors.updateValue(BasicRenderPipelineDescriptor(), forKey: .basic)
    }
    
    func descriptor(_ shaderType: ShaderType) -> MTLRenderPipelineDescriptor {
        return renderPipelineDescriptors[shaderType]!.renderPipelineDescriptor
    }
}
