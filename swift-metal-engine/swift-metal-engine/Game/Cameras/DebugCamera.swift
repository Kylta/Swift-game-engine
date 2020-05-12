//
//  DebugCamera.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/12/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import Foundation

class DebugCamera: Camera {
    var cameraType: CameraType
    var x: Float = 0
    var y: Float = 0
    
    var position: float3
    
    init() {
        self.cameraType = .debug
        self.position = float3(repeating: 0)
    }
    
    func update(deltaTime: Float) {
        self.position.x = GameView.position.x
        self.position.y = GameView.position.y
    }
}
