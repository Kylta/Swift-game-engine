//
//  ShaderLibrary.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

enum ShaderType {
    case basic
}

class ShaderLibrary {
    private(set) var shaders: [ShaderType: (vertex: Shader, fragment: Shader)] = [:]
    private(set) var library: MTLLibrary!
    
    static let shared = ShaderLibrary()
    
    private init() {
        self.library = Engine.shared.device.makeDefaultLibrary()
        let basicVertex = BasicVertexShader()
        let basicFragment = BasicFragmentShader()
        self.shaders.updateValue((basicVertex, basicFragment), forKey: .basic)
    }
    
    func vertexFunction(_ shaderType: ShaderType) -> MTLFunction {
        return shaders[shaderType]!.vertex.function
    }
    
    func fragmentFunction(_ shaderType: ShaderType) -> MTLFunction {
        return shaders[shaderType]!.fragment.function
    }
}
