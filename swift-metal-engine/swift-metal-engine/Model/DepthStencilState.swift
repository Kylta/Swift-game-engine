//
//  DepthStencilState.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/12/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

protocol DepthStencilState {
    var depthStencilState: MTLDepthStencilState! { get }
}

class LessDepthStencilState: DepthStencilState {
    private(set) var depthStencilState: MTLDepthStencilState!
    
    init() {
        let desc = MTLDepthStencilDescriptor()
        desc.isDepthWriteEnabled = true
        desc.depthCompareFunction = .less
        self.depthStencilState = Engine.shared.device.makeDepthStencilState(descriptor: desc)
    }
}
