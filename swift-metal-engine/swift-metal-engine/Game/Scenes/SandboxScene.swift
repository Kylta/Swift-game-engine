//
//  SandoxScene.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/10/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class SandboxScene: Scene {
    private var debugCamera = DebugCamera()
    private var cube = Cube()
    
    override func buildScene() {
        self.addCamera(self.debugCamera)
        self.debugCamera.position.z = 10
        self.addChild(self.cube)
    }
    
    override func update(deltaTime: Float) {
        self.cube.rotation.x += deltaTime
        self.cube.rotation.y += deltaTime
        
        super.update(deltaTime: deltaTime)
    }
}
