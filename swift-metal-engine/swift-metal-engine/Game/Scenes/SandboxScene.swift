//
//  SandoxScene.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/10/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class SandboxScene: Scene {
    override func buildScene() {
        for y in -5..<5 {
            for x in -5..<5 {
                let player = Player()
                let y = (Float(y) + 0.5) / 5
                let x = (Float(x) + 0.5) / 5
                player.update(position: float2(y, x))
                player.update(scale: float3(repeating: 0.1))
                self.addChild(player)
            }
        }
    }
}
