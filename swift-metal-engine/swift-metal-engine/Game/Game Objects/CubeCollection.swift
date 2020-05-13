//
//  CubeCollection.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/12/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class CubeCollection: InstancedGameObject {
    var cubesWide: Int = 0
    var cubesHigh: Int = 0
    var cubesBack: Int = 0
    
    var time: Float = 0.0
    
    init(cubesWide: Int, cubesHigh: Int, cubesBack: Int) {
        super.init(meshType: .cube, instanceCount: cubesWide * cubesHigh * cubesBack)
        self.cubesWide = cubesWide
        self.cubesHigh = cubesHigh
        self.cubesBack = cubesBack
        
        self.setColor(.randomColor)
    }
    
    override func update(deltaTime: Float) {
        self.time += deltaTime
        
        let hw: Float = Float(self.cubesWide / 2)
        let hh: Float = Float(self.cubesHigh / 2)
        let hb: Float = Float(self.cubesBack / 2)
        
        var i: Int = 0
        let gap: Float = cos(self.time / 2) * 10
        
        for y in stride(from: -hh, to: hh, by: 1.0) {
            let posY = Float(y * gap)
            for x in stride(from: -hw, to: hw, by: 1.0) {
                let posX = Float(x * gap)
                for z in stride(from: -hb, to: hb, by: 1.0) {
                    let posZ = Float(z * gap)
                    
                    self.nodes[i].position.y = posY
                    self.nodes[i].position.x = posX
                    self.nodes[i].position.z = posZ
                    self.nodes[i].rotation.z -= deltaTime * 2
                    self.nodes[i].rotation.y -= deltaTime * 2
                    self.nodes[i].scale = float3(repeating: 0.3)
                    
                    i += 1
                }
            }
        }
        super.update(deltaTime: deltaTime)
    }
}
