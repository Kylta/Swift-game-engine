//
//  SIMD+extensions.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import simd

typealias float2 = SIMD2<Float>
typealias float3 = SIMD3<Float>
typealias float4 = SIMD4<Float>

protocol Sizeable {
    static func size(_ count: Int) -> Int
    static func stride(_ count: Int) -> Int
}

extension SIMD {    
    static func size() -> Int {
        return MemoryLayout<Self>.size
    }
    
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    
    static func stride() -> Int {
        return MemoryLayout<Self>.stride
    }
    
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
}

extension Float: Sizeable {}

extension Sizeable {
    static func size() -> Int {
        return MemoryLayout<Self>.size
    }
    
    static func size(_ count: Int) -> Int {
        return MemoryLayout<Self>.size * count
    }
    
    static func stride() -> Int {
        return MemoryLayout<Self>.stride
    }
    
    static func stride(_ count: Int) -> Int {
        return MemoryLayout<Self>.stride * count
    }
}

struct ModelConstants: Sizeable {
    var modelMatrix = matrix_identity_float4x4
}

struct SceneConstants: Sizeable {
    var viewMatrix = matrix_identity_float4x4
    var projectionMatrix = matrix_identity_float4x4
}

struct Material: Sizeable {
    var color = float4(0.8,0.8,0.8,1)
    var useMaterialColor: Bool = false
}
