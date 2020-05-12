//
//  Node.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class Node {
    var position: float3
    var scale: float3
    var rotation: float3
    
    var modelMatrix: matrix_float4x4 {
        var matrix = matrix_identity_float4x4
        matrix.translate(direction: self.position)
        matrix.scale(axis: self.scale)
        matrix.rotate(angle: rotation.x, axis: X_AXIS)
        matrix.rotate(angle: rotation.y, axis: Y_AXIS)
        matrix.rotate(angle: rotation.z, axis: Z_AXIS)
        return matrix
    }
    
    private(set) var children: [Node]
    
    init() {
        self.position = float3(repeating: 0)
        self.scale = float3(repeating: 1)
        self.rotation = float3(repeating: 0)
        self.children = []
    }
    
    func addChild(_ child: Node) {
        self.children.append(child)
    }
    
    func render(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        self.children.forEach { $0.render(renderCommandEncoder) }
        
        if let renderable = self as? Renderable {
            renderable.doRender(renderCommandEncoder)
        }
    }
    
    func update(deltaTime: Float) {
        self.children.forEach { $0.update(deltaTime: deltaTime) }
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
