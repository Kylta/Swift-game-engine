//
//  MeshLibrary.swift
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

import MetalKit

enum MeshType {
    case triangle
    case quad
}

class MeshLibrary {
    private var meshes: [MeshType: Mesh] = [:]
    
    static let shared = MeshLibrary()
    
    private init() {
        self.meshes.updateValue(TriangleCustomMesh(), forKey: .triangle)
        self.meshes.updateValue(QuadCustomMesh(), forKey: .quad)
    }
    
    func mesh(_ type: MeshType) -> Mesh {
        return self.meshes[type]!
    }
}
