//
//  DepthStencilStateLibrary.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/12/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

enum DepthStencilStateType {
    case less
}

class DepthStencilStateLibrary {
    private var depthStencilStates: [DepthStencilStateType: DepthStencilState] = [:]
    
    static let shared = DepthStencilStateLibrary()
    
    private init() {
        self.depthStencilStates.updateValue(LessDepthStencilState(), forKey: .less)
    }
    
    func depthStencilState(_ depthStencilStateType: DepthStencilStateType) -> MTLDepthStencilState {
        return self.depthStencilStates[depthStencilStateType]!.depthStencilState
    }
}
