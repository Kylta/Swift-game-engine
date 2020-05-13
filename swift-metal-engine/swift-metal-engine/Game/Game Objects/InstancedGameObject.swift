//
//  InstancedGameObject.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/12/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

class InstancedGameObject: Node {
    private var mesh: Mesh
    private var material: Material
    var nodes: [Node]
    private var modelConstants: ModelConstants
    
    private var modelConstantBuffer: MTLBuffer!
    
    init(meshType: MeshType, instanceCount: Int) {
        self.mesh = MeshLibrary.shared.mesh(meshType)
        self.mesh.setInstanceCount(instanceCount)
        self.modelConstants = ModelConstants()
        self.material = Material()
        self.nodes = []
        
        super.init()
        
        self.generateInstances(instanceCount)
        self.createBuffers(instanceCount)
    }
    
    private func generateInstances(_ instanceCount: Int) {
        for _ in 0..<instanceCount {
            let node = Node()
            self.nodes.append(node)
        }
    }
    
    private func createBuffers(_ instanceCount: Int) {
        self.modelConstantBuffer = Engine.shared.device.makeBuffer(length: ModelConstants.stride(instanceCount), options: [])
    }
    
    private func updateModelConstantsBuffer() {
        var pointer = modelConstantBuffer.contents().bindMemory(to: ModelConstants.self, capacity: self.nodes.count)
        
        self.nodes.forEach { node in
            pointer.pointee.modelMatrix = matrix_multiply(self.modelMatrix, node.modelMatrix)
            pointer = pointer.advanced(by: 1)
        }
    }
    
    override func update(deltaTime: Float) {
        self.updateModelConstantsBuffer()
        
        super.update(deltaTime: deltaTime)
    }
}

extension InstancedGameObject: Renderable {
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.shared.pipelineState(.instanced))
        renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.shared.depthStencilState(.less))
        
        // Vertex Shader
        renderCommandEncoder.setVertexBuffer(self.modelConstantBuffer, offset: 0, index: 2)
        
        // Fragment Shader
        renderCommandEncoder.setFragmentBytes(&self.material, length: Material.stride(), index: 0)
        
        self.mesh.drawPrimitives(renderCommandEncoder)
    }
}

//MARK: -- Material properties
extension InstancedGameObject {
    func setColor(_ color: UIColor) {
        self.material.color = color.toFloat4
        self.material.useMaterialColor = true
    }
}
