//
//  GameView.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class GameView: MTKView {
    private let renderer: Renderer
    
    required init(coder: NSCoder) {
        self.renderer = Renderer()
        
        super.init(coder: coder)
        
        self.delegate = renderer
        
        self.device = Engine.shared.device
        self.clearColor = Preferences.clearColor
        self.colorPixelFormat = Preferences.pixelFormat
    }
}
