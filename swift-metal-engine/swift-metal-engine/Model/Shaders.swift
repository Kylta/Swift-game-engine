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
    var function: MTLFunction! { get }
}

struct BasicVertexShader: Shader {
    var name: String {
        return "Basic Vertex Shader"
    }
    
    var functionName: String {
        return "basic_vertex_shader"
    }
    
    private(set) var function: MTLFunction!
    
    init(library: MTLLibrary){
        self.function = library.makeFunction(name: functionName)!
        function.label = name
    }
}

struct BasicFragmentShader: Shader {
    var name: String {
        return "Basic Fragment Shader"
    }
    
    var functionName: String {
        return "basic_fragment_shader"
    }
    
    private(set) var function: MTLFunction!
    
    init(library: MTLLibrary) {
        self.function = library.makeFunction(name: functionName)!
        function.label = name
    }
}

struct InstancedVertexShader: Shader {
    var name: String {
        return "Instanced Vertex Shader"
    }
    
    var functionName: String {
        return "instanced_vertex_shader"
    }
    
    private(set) var function: MTLFunction!
    
    init(library: MTLLibrary) {
        self.function = library.makeFunction(name: functionName)!
        function.label = name
    }
}
