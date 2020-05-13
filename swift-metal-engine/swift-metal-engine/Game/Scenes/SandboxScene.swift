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
    var cubeCollection1: CubeCollection!
    var cubeCollection2: CubeCollection!
    
    override func buildScene() {
        self.addCamera(self.debugCamera)
        self.debugCamera.position.z = 50
        
        self.addCubes()
    }

    func addCubes() {
        self.cubeCollection1 = CubeCollection(cubesWide: 10, cubesHigh: 10, cubesBack: 10)
        self.cubeCollection1.position.x = -5
        self.addChild(self.cubeCollection1)
        
        self.cubeCollection2 = CubeCollection(cubesWide: 10, cubesHigh: 10, cubesBack: 10)
        self.cubeCollection2.position.x = 5 
        self.addChild(self.cubeCollection2)
    }
    
    override func update(deltaTime: Float) {
        self.cubeCollection1.rotation.z += deltaTime
        self.cubeCollection2.rotation.z -= deltaTime
        
        super.update(deltaTime: deltaTime)
    }
}
