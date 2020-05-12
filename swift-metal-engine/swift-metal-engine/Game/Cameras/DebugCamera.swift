//
//  DebugCamera.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/12/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import Foundation
import simd

class DebugCamera: Camera {
    var cameraType: CameraType
    var position: float3
    var projectionMatrix: matrix_float4x4 {
        return matrix_float4x4.perspectiveProjection(fieldOfViewY: 45,
                                                     aspect: Renderer.aspectRatio,
                                                     near: 0.1,
                                                     far: 1000)
    }
    
    init() {
        self.cameraType = .debug
        self.position = float3(repeating: 0)
    }
    
    func update(deltaTime: Float) {
        self.position.x = Renderer.position.x
        self.position.y = Renderer.position.y
    }
}
