//
//  SceneManager.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/10/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

enum SceneType {
    case sandbox
}

class SceneManager {
    private var currentScene: Scene!
    
    static let shared = SceneManager()
    
    private init() {
        self.currentScene = SandboxScene()
    }
    
    func setScene(_ sceneType: SceneType) {
        switch sceneType {
        case .sandbox:
            self.currentScene = SandboxScene()
        }
    }
    
    func tickScene(renderCommandEncoder: MTLRenderCommandEncoder, deltaTime: Float) {
        self.currentScene.update(deltaTime: deltaTime)
        self.currentScene.render(renderCommandEncoder)
    }
}
