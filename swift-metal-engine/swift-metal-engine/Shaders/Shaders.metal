//
//  Shaders.metal
//  swift-metal-engine
//
//  Created by Christophe Bugnon on 5/9/20.
//  Copyright © 2020 Christophe Bugnon. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

struct VertexIn {
    float3 position;
    float4 color;
};

struct VertexOut {
    float4 position [[position]];
    float4 color;
};

vertex VertexOut basic_vertex_shader(const device VertexIn *vIn [[ buffer(0) ]],
                                  uint vid [[ vertex_id ]]) {
    VertexOut vout;
    vout.position = float4(vIn[vid].position, 1);
    vout.color = vIn[vid].color;
    return vout;
}

fragment half4 basic_fragment_shader(VertexOut vOut [[ stage_in ]]) {
    return half4(vOut.color);
}
