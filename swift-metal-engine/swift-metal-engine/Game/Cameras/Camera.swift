//
//  Camera.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/12/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import Foundation
import simd

enum CameraType {
    case debug
}

protocol Camera {
    var cameraType: CameraType { get }
    var position: float3 { get set }
    
    func update(deltaTime: Float)
}

extension Camera {
    var viewMatrix: matrix_float4x4 {
        var matrix = matrix_identity_float4x4
        matrix.translate(direction: -position)
        return matrix
    }
}
