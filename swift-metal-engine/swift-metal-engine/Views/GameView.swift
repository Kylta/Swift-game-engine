//
//  GameView.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class GameView: MTKView {
    private(set) static var position: float2 = float2(0,0)
    
    private let renderer: Renderer
    
    required init(coder: NSCoder) {
        self.renderer = Renderer()
        
        super.init(coder: coder)
        
        self.delegate = renderer
        
        self.device = Engine.shared.device
        self.clearColor = Preferences.clearColor
        self.colorPixelFormat = Preferences.pixelFormat
    }
        
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let loc = touches.first!.location(in: self)
        let x: Float = Float(loc.x / self.frame.width).lerp(min: 0.5, max: 1)
        let y: Float = -Float(loc.y / self.frame.height).lerp(min: 0.5, max: 1)
        
        GameView.position = float2(x,y)
    }
}

extension Float {
    func lerp(min: Float, max: Float) -> Float {
        return (self - min) * (1 / (max - min))
    }
}
