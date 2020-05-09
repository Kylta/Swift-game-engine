//
//  Node.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class Node {
    func render(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        guard let renderable = self as? Renderable else { return }
        renderable.doRender(renderCommandEncoder)
    }
}
