//
//  RenderPipelineDescriptor.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

protocol RenderPipelineDescriptor {
    var name: String { get }
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor { get }
}

struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor {
    var name: String {
        return "Basic Render Pipeline Descriptor"
    }
    
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor {
        let rpd = MTLRenderPipelineDescriptor()
        rpd.colorAttachments[0].pixelFormat = Preferences.pixelFormat
        rpd.vertexFunction = ShaderLibrary.shared.vertexFunction(.basic)
        rpd.fragmentFunction = ShaderLibrary.shared.fragmentFunction(.basic)
        rpd.vertexDescriptor = VertexDescriptorLibrary.shared.descriptor(.basic)
        return rpd
    }
}
