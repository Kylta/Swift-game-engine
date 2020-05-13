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
    float4x4 projectionMatrix;
};

struct Material {
    float4 color;
    bool useMaterialColor;
};

vertex VertexOut basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                     constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                     constant ModelConstants &modelConstants [[ buffer(2) ]]) {
    VertexOut vout;
    vout.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstants.modelMatrix * float4(vIn.position, 1);
    vout.color = vIn.color;
    return vout;
}

vertex VertexOut instanced_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                         constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                         constant ModelConstants *modelConstants [[ buffer(2) ]],
                                         uint instanceID [[ instance_id ]]) {
    VertexOut vout;
    ModelConstants modelConstant = modelConstants[instanceID];
    
    vout.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstant.modelMatrix * float4(vIn.position, 1);
    vout.color = vIn.color;
    return vout;
}

fragment half4 basic_fragment_shader(VertexOut vOut [[ stage_in ]],
                                     constant Material &material [[ buffer(0) ]]) {
    float4 color = material.useMaterialColor ? material.color : vOut.color;
    
    return half4(color);
}
