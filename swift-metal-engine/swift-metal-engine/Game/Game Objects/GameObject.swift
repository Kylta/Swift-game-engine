//
//  GameObject.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class GameObject: Node {
    private let renderPipelineState: MTLRenderPipelineState
    private let mesh: Mesh
    
    init(meshType: MeshType, shaderType: ShaderType) {
        self.renderPipelineState = RenderPipelineStateLibrary.shared.pipelineState(shaderType)
        self.mesh = MeshLibrary.shared.mesh(meshType)
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(self.renderPipelineState)
        renderCommandEncoder.setVertexBuffer(self.mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: self.mesh.vertexCount)

    }
}
