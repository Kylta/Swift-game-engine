//
//  MTLClearColors+extensions.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

extension MTLClearColor {
    static let white: MTLClearColor = MTLClearColor(red: 1, green: 1, blue: 1, alpha: 1)
    static let green: MTLClearColor = MTLClearColor(red: 0.22, green: 0.55, blue: 0.34, alpha: 1)
    static let gray: MTLClearColor = MTLClearColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1)
    static let black: MTLClearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 1)
}
