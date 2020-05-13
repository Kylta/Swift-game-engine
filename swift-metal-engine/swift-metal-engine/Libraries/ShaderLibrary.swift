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
    case instanced
}

class ShaderLibrary {
    private var vertexShaders: [ShaderType: Shader] = [:]
    private var fragmentShaders: [ShaderType: Shader] = [:]
    private(set) var library: MTLLibrary!
    
    static let shared = ShaderLibrary()
    
    private init() {
        self.library = Engine.shared.device.makeDefaultLibrary()
        
        // Vertex
        self.vertexShaders.updateValue(BasicVertexShader(library: library), forKey: .basic)
        self.vertexShaders.updateValue(InstancedVertexShader(library: library), forKey: .instanced)
        
        // Fragments
        self.fragmentShaders.updateValue(BasicFragmentShader(library: library), forKey: .basic)
    }
    
    func vertexFunction(_ shaderType: ShaderType) -> MTLFunction {
        return self.vertexShaders[shaderType]!.function
    }
    
    func fragmentFunction(_ shaderType: ShaderType) -> MTLFunction {
        return self.fragmentShaders[shaderType]!.function
    }
}
