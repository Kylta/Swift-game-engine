//
//  Scene.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/10/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class Scene: Node {
    private var cameraManager: CameraManager
    private(set) var sceneConstants: SceneConstants
    
    override init() {
        self.cameraManager = CameraManager()
        self.sceneConstants = SceneConstants()
        
        super.init()
        
        self.buildScene()
    }
    
    func buildScene() {}
    
    func addCamera(_ camera: Camera, isCurrentCamera: Bool = true) {
        self.cameraManager.registerCamera(camera)
        
        if isCurrentCamera {
            self.cameraManager.setCamera(camera.cameraType)
        }
    }
    
    func updateCameras(deltaTime: Float) {
        self.cameraManager.update(deltaTime: deltaTime)
    }
    
    override func update(deltaTime: Float) {
        self.updateSceneConstants()
        super.update(deltaTime: deltaTime)
    }
    
    override func render(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&sceneConstants, length: SceneConstants.size(), index: 1)
        super.render(renderCommandEncoder)
    }
    
    private func updateSceneConstants() {
        self.sceneConstants.viewMatrix = self.cameraManager.currentCamera.viewMatrix
        self.sceneConstants.projectionMatrix = self.cameraManager.currentCamera.projectionMatrix
    }
}
