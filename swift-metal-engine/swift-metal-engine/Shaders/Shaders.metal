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
    float3 position [[attribute(0)]];
    float4 color [[attribute(1)]];
};

struct VertexOut {
    float4 position [[position]];
    float4 color;
};

struct ModelConstants {
    float4x4 modelMatrix;
};

struct SceneConstants {
    float4x4 viewMatrix;
};

vertex VertexOut basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                     constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                     constant ModelConstants &modelConstants [[ buffer(2) ]]) {
    VertexOut vout;
    vout.position = sceneConstants.viewMatrix * modelConstants.modelMatrix * float4(vIn.position, 1);
    vout.color = vIn.color;
    return vout;
}

fragment half4 basic_fragment_shader(VertexOut vOut [[ stage_in ]]) {
    return half4(vOut.color);
}
