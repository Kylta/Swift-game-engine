//
//  Shaders.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

protocol Shader {
    var name: String { get }
    var functionName: String { get }
    var function: MTLFunction { get }
}

struct BasicVertexShader: Shader {
    var name: String {
        return "Basic Vertex Shader"
    }
    
    var functionName: String {
        return "basic_vertex_shader"
    }
    
    var function: MTLFunction {
        let function = ShaderLibrary.shared.library.makeFunction(name: functionName)!
        function.label = name
        return function
    }
}

struct BasicFragmentShader: Shader {
    var name: String {
        return "Basic Fragment Shader"
    }
    
    var functionName: String {
        return "basic_fragment_shader"
    }
    
    var function: MTLFunction {
        let function = ShaderLibrary.shared.library.makeFunction(name: functionName)!
        function.label = name
        return function
    }
}
