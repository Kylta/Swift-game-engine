//
//  Node.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class Node {
    private var position: float3
    private var scale: float3
    private var rotation: float3
    
    var modelMatrix: matrix_float4x4 {
        var matrix = matrix_identity_float4x4
        matrix.translate(direction: self.position)
        matrix.scale(axis: self.scale)
        matrix.rotate(angle: rotation.x, axis: X_AXIS)
        matrix.rotate(angle: rotation.y, axis: Y_AXIS)
        matrix.rotate(angle: rotation.z, axis: Z_AXIS)
        return matrix
    }
    
    init() {
        self.position = float3(repeating: 0)
        self.scale = float3(repeating: 1)
        self.rotation = float3(repeating: 0)
    }
    
    func render(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        guard let renderable = self as? Renderable else { return }
        renderable.doRender(renderCommandEncoder)
    }
    
    func update(position: float2) {
        self.position.x = position.x
        self.position.y = position.y
    }
    
    func update(scale: float3) {
        self.scale = scale
    }
    
    func update(rotation: Float) {
        self.rotation.z = rotation
    }
}
