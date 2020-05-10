//
//  Player.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class Player: GameObject {
    
    init() {
        super.init(meshType: .triangle, shaderType: .basic)
    }
    
    override func update(deltaTime: Float) {
        self.update(rotation: -atan2f(GameView.position.x - position.x, GameView.position.y - position.y))
        super.update(deltaTime: deltaTime)
    }
}
