//
//  Pointer.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class Pointer: GameObject {
    private var camera: Camera
    
    init(camera: Camera) {
        self.camera = camera
        
        super.init(meshType: .triangle, shaderType: .basic)
    }
    
    override func update(deltaTime: Float) {
        self.update(rotation: -atan2f(GameView.position.x - self.position.x + self.camera.position.x,
                                      GameView.position.y - self.position.y + self.camera.position.y))
        super.update(deltaTime: deltaTime)
    }
}
