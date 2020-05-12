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
    var renderPipelineDescriptor: MTLRenderPipelineDescriptor! { get }
}

struct BasicRenderPipelineDescriptor: RenderPipelineDescriptor {
    var name: String {
        return "Basic Render Pipeline Descriptor"
    }
    
    private(set) var renderPipelineDescriptor: MTLRenderPipelineDescriptor!
    
    init() {
        self.renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        self.renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.pixelFormat
        self.renderPipelineDescriptor.depthAttachmentPixelFormat = Preferences.depthPixelFormat
        self.renderPipelineDescriptor.vertexFunction = ShaderLibrary.shared.vertexFunction(.basic)
        self.renderPipelineDescriptor.fragmentFunction = ShaderLibrary.shared.fragmentFunction(.basic)
        self.renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.shared.descriptor(.basic)
    }
}
