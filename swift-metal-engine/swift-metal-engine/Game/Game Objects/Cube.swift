//
//  Cube.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/12/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class Cube: GameObject {

    init() {
        super.init(meshType: .cube)
    }
    
    override func update(deltaTime: Float) {
        self.rotation.x += Float.random * deltaTime
        self.rotation.y += Float.random * deltaTime
        
        super.update(deltaTime: deltaTime)
    }
}
