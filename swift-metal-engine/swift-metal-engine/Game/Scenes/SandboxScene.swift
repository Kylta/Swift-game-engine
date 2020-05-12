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
    
    override func buildScene() {
        self.addCamera(self.debugCamera)
        self.debugCamera.position.z = 10
        
        self.addCubes()
    }

    func addCubes() {
        for y in -5..<5 {
            let posY = Float(y) + 0.5
            for x in -5..<5 {
                let posX = Float(x) + 0.5
                let cube = Cube()
                cube.position.y = posY
                cube.position.x = posX
                cube.scale = float3(repeating: 0.3)
                cube.setColor(.randomColor)
                self.addChild(cube)
            }
        }
    }
}
