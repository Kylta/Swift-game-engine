//
//  Engine.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class Engine {
    private(set) var device: MTLDevice!
    private(set) var commandQueue: MTLCommandQueue!
    
    static let shared = Engine()
    
    private init() {
        self.device = MTLCreateSystemDefaultDevice()
        self.commandQueue = self.device.makeCommandQueue()
    }
}
