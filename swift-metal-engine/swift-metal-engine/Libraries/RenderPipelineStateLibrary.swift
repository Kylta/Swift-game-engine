//
//  RenderPipelineStateLibrary.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class RenderPipelineStateLibrary {
    private(set) var renderPipelineState: [ShaderType: RenderPipelineState] = [:]
    
    static let shared = RenderPipelineStateLibrary()
    
    private init() {
        self.renderPipelineState.updateValue(BasicRenderPipelineState(), forKey: .basic)
    }
    
    func pipelineState(_ shaderType: ShaderType) -> MTLRenderPipelineState {
        return renderPipelineState[shaderType]!.renderPipelineState
    }
}
