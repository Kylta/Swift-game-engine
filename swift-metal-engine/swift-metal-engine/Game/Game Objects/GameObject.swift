//
//  GameObject.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class GameObject: Node {
    private let mesh: Mesh
    private var modelConstants: ModelConstants
    private var material: Material
    
    private var time: Float = 0
    
    init(meshType: MeshType) {
        self.mesh = MeshLibrary.shared.mesh(meshType)
        self.modelConstants = ModelConstants()
        self.material = Material()
    }
    
    override func update(deltaTime: Float) {
        self.updateModelConstants()
    }
    
    private func updateModelConstants() {
        self.modelConstants.modelMatrix = self.modelMatrix
    }
}

extension GameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.shared.pipelineState(.basic))
        renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.shared.depthStencilState(.less))
        
        // Vertex Shader
        renderCommandEncoder.setVertexBuffer(self.mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.setVertexBytes(&self.modelConstants, length: ModelConstants.size(), index: 2)
        
        // Fragment Shader
        renderCommandEncoder.setFragmentBytes(&self.material, length: Material.stride(), index: 0)
        
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: self.mesh.vertexCount)
    }
}

//MARK: -- Material properties
extension GameObject {
    func setColor(_ color: UIColor) {
        self.material.color = color.toFloat4
        self.material.useMaterialColor = true
    }
}
