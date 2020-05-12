//
//  CameraManager.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/12/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import Foundation

class CameraManager {
    private var cameras: [CameraType: Camera]
    private(set) var currentCamera: Camera!
    
    init() {
        self.cameras = [:]
    }
    
    func registerCamera(_ camera: Camera) {
        if self.cameras.keys.contains(camera.cameraType) { return }
        self.cameras.updateValue(camera, forKey: camera.cameraType)
    }
    
    func setCamera(_ cameraType: CameraType) {
        self.currentCamera = self.cameras[cameraType]
    }
    
    func update(deltaTime: Float) {
        self.cameras.values.forEach { $0.update(deltaTime: deltaTime) }
    }
}
