//
//  RenderPipelineState.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

protocol RenderPipelineState {
    var name: String { get }
    var renderPipelineState: MTLRenderPipelineState { get }
}

struct BasicRenderPipelineState: RenderPipelineState {
    var name: String {
        return "Basic Render Pipeline State"
    }
    
    var renderPipelineState: MTLRenderPipelineState {
        let desc = RenderPipelineDescriptorLibrary.shared.descriptor(.basic)
        return try! Engine.shared.device.makeRenderPipelineState(descriptor: desc)
    }
}
