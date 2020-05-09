//
//  Shaders.metal
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

vertex float4 basic_vertex_shader(const device float3 *vertices [[ buffer(0) ]],
                                  uint vid [[ vertex_id ]]) {
    return float4(vertices[vid], 1);
}

fragment half4 basic_fragment_shader() {
    return half4(1);
}
