//
//  Renderer.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class Renderer: NSObject, MTKViewDelegate {
    private(set) static var position: float2 = float2(repeating: 0)
    private static var screenSize: float2 = float2(repeating: 0)
    private(set) static var aspectRatio: Float = 0
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        Renderer.aspectRatio = Float(size.width / size.height)
    }
    
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable,
            let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
        
        let commandBuffer = Engine.shared.commandQueue.makeCommandBuffer()!
        let renderCommandEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor)!
        
        SceneManager.shared.tickScene(renderCommandEncoder: renderCommandEncoder,
                                      deltaTime: 1 / Float(view.preferredFramesPerSecond))
        
        renderCommandEncoder.endEncoding()
        
        commandBuffer.present(drawable)
        commandBuffer.commit()
    }
    
    func update(position: float2) {
        Renderer.position = position
    }
}
