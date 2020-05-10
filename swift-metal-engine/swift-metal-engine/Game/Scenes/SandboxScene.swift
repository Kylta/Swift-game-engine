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
        let count: Int = 5
        for y in -count..<count {
            for x in -count..<count {
                let player = Player()
                let y = (Float(y) + 0.5) / Float(count)
                let x = (Float(x) + 0.5) / Float(count)
                player.update(position: float2(y, x))
                player.update(scale: float3(repeating: 0.1))
                self.addChild(player)
            }
        }
    }
}
