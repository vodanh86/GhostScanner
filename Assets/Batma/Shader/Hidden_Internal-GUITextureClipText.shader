//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-GUITextureClipText" {
Properties {
_MainTex ("Texture", 2D) = "white" { }
}
SubShader {
 Pass {
  Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 30865
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0 * _Color;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_1 * u_xlat16_0;
    u_xlat0 = u_xlat0 * vs_COLOR0.w;
    SV_Target0.w = u_xlat0;
    SV_Target0.xyz = vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0 * _Color;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_1 * u_xlat16_0;
    u_xlat0 = u_xlat0 * vs_COLOR0.w;
    SV_Target0.w = u_xlat0;
    SV_Target0.xyz = vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0 * _Color;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_1 * u_xlat16_0;
    u_xlat0 = u_xlat0 * vs_COLOR0.w;
    SV_Target0.w = u_xlat0;
    SV_Target0.xyz = vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 178
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %153 %160 %162 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 RelaxedPrecision 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 153 
                                                      OpDecorate vs_TEXCOORD0 Location 160 
                                                      OpDecorate %162 Location 162 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                             %133 = OpTypePointer Private %91 
                              Private f32_2* %134 = OpVariable Private 
                                         i32 %137 = OpConstant 5 
                                             %152 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %161 = OpTypePointer Input %91 
                                Input f32_2* %162 = OpVariable Input 
                                             %172 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %22 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_4 %92 = OpLoad %9 
                                        f32_2 %93 = OpVectorShuffle %92 %92 1 1 
                               Uniform f32_4* %94 = OpAccessChain %22 %25 %25 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %93 %96 
                                        f32_4 %98 = OpLoad %50 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %50 %99 
                              Uniform f32_4* %100 = OpAccessChain %22 %25 %24 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_4 %103 = OpLoad %9 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 0 
                                       f32_2 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %50 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFAdd %105 %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 2 3 
                                                      OpStore %9 %110 
                              Uniform f32_4* %111 = OpAccessChain %22 %25 %37 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %9 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 2 
                                       f32_2 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_2 %119 = OpFAdd %116 %118 
                                       f32_4 %120 = OpLoad %9 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 2 3 
                                                      OpStore %9 %121 
                              Uniform f32_4* %122 = OpAccessChain %22 %25 %46 
                                       f32_4 %123 = OpLoad %122 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_4 %125 = OpLoad %9 
                                       f32_2 %126 = OpVectorShuffle %125 %125 3 3 
                                       f32_2 %127 = OpFMul %124 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %135 = OpLoad %9 
                                       f32_2 %136 = OpVectorShuffle %135 %135 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %137 %25 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                                                      OpStore %134 %141 
                              Uniform f32_4* %142 = OpAccessChain %22 %137 %24 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                                       f32_4 %145 = OpLoad %9 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 0 
                                       f32_2 %147 = OpFMul %144 %146 
                                       f32_2 %148 = OpLoad %134 
                                       f32_2 %149 = OpFAdd %147 %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 2 3 
                                                      OpStore %9 %151 
                                       f32_4 %154 = OpLoad %9 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 1 
                              Uniform f32_4* %156 = OpAccessChain %22 %137 %46 
                                       f32_4 %157 = OpLoad %156 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_2 %159 = OpFAdd %155 %158 
                                                      OpStore vs_TEXCOORD1 %159 
                                       f32_2 %163 = OpLoad %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
                                       f32_2 %167 = OpFMul %163 %166 
                              Uniform f32_4* %168 = OpAccessChain %22 %46 
                                       f32_4 %169 = OpLoad %168 
                                       f32_2 %170 = OpVectorShuffle %169 %169 2 3 
                                       f32_2 %171 = OpFAdd %167 %170 
                                                      OpStore vs_TEXCOORD0 %171 
                                 Output f32* %173 = OpAccessChain %74 %24 %70 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFNegate %174 
                                 Output f32* %176 = OpAccessChain %74 %24 %70 
                                                      OpStore %176 %175 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 60
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %34 %44 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %8 RelaxedPrecision 
                                             OpDecorate %11 RelaxedPrecision 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %15 RelaxedPrecision 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD1 Location 34 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %44 Location 44 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %10 = OpTypePointer UniformConstant %9 
UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
                                     %13 = OpTypeSampler 
                                     %14 = OpTypePointer UniformConstant %13 
            UniformConstant sampler* %15 = OpVariable UniformConstant 
                                     %17 = OpTypeSampledImage %9 
                                     %19 = OpTypeVector %6 2 
                                     %20 = OpTypePointer Input %19 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypePointer Input %23 
                        Input f32_4* %44 = OpVariable Input 
                                     %45 = OpTypePointer Input %6 
                                     %49 = OpTypePointer Output %23 
                       Output f32_4* %50 = OpVariable Output 
                                     %52 = OpTypePointer Output %6 
                                     %54 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %35 = OpLoad vs_TEXCOORD1 
                               f32_4 %36 = OpImageSampleImplicitLod %33 %35 
                                 f32 %37 = OpCompositeExtract %36 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpLoad %8 
                                 f32 %41 = OpFMul %39 %40 
                                             OpStore %38 %41 
                                 f32 %42 = OpLoad %38 
                          Input f32* %46 = OpAccessChain %44 %26 
                                 f32 %47 = OpLoad %46 
                                 f32 %48 = OpFMul %42 %47 
                                             OpStore %38 %48 
                                 f32 %51 = OpLoad %38 
                         Output f32* %53 = OpAccessChain %50 %26 
                                             OpStore %53 %51 
                               f32_4 %55 = OpLoad %44 
                               f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               f32_4 %57 = OpLoad %50 
                               f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                             OpStore %50 %58 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 178
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %153 %160 %162 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 RelaxedPrecision 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 153 
                                                      OpDecorate vs_TEXCOORD0 Location 160 
                                                      OpDecorate %162 Location 162 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                             %133 = OpTypePointer Private %91 
                              Private f32_2* %134 = OpVariable Private 
                                         i32 %137 = OpConstant 5 
                                             %152 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %161 = OpTypePointer Input %91 
                                Input f32_2* %162 = OpVariable Input 
                                             %172 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %22 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_4 %92 = OpLoad %9 
                                        f32_2 %93 = OpVectorShuffle %92 %92 1 1 
                               Uniform f32_4* %94 = OpAccessChain %22 %25 %25 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %93 %96 
                                        f32_4 %98 = OpLoad %50 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %50 %99 
                              Uniform f32_4* %100 = OpAccessChain %22 %25 %24 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_4 %103 = OpLoad %9 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 0 
                                       f32_2 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %50 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFAdd %105 %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 2 3 
                                                      OpStore %9 %110 
                              Uniform f32_4* %111 = OpAccessChain %22 %25 %37 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %9 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 2 
                                       f32_2 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_2 %119 = OpFAdd %116 %118 
                                       f32_4 %120 = OpLoad %9 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 2 3 
                                                      OpStore %9 %121 
                              Uniform f32_4* %122 = OpAccessChain %22 %25 %46 
                                       f32_4 %123 = OpLoad %122 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_4 %125 = OpLoad %9 
                                       f32_2 %126 = OpVectorShuffle %125 %125 3 3 
                                       f32_2 %127 = OpFMul %124 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %135 = OpLoad %9 
                                       f32_2 %136 = OpVectorShuffle %135 %135 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %137 %25 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                                                      OpStore %134 %141 
                              Uniform f32_4* %142 = OpAccessChain %22 %137 %24 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                                       f32_4 %145 = OpLoad %9 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 0 
                                       f32_2 %147 = OpFMul %144 %146 
                                       f32_2 %148 = OpLoad %134 
                                       f32_2 %149 = OpFAdd %147 %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 2 3 
                                                      OpStore %9 %151 
                                       f32_4 %154 = OpLoad %9 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 1 
                              Uniform f32_4* %156 = OpAccessChain %22 %137 %46 
                                       f32_4 %157 = OpLoad %156 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_2 %159 = OpFAdd %155 %158 
                                                      OpStore vs_TEXCOORD1 %159 
                                       f32_2 %163 = OpLoad %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
                                       f32_2 %167 = OpFMul %163 %166 
                              Uniform f32_4* %168 = OpAccessChain %22 %46 
                                       f32_4 %169 = OpLoad %168 
                                       f32_2 %170 = OpVectorShuffle %169 %169 2 3 
                                       f32_2 %171 = OpFAdd %167 %170 
                                                      OpStore vs_TEXCOORD0 %171 
                                 Output f32* %173 = OpAccessChain %74 %24 %70 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFNegate %174 
                                 Output f32* %176 = OpAccessChain %74 %24 %70 
                                                      OpStore %176 %175 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 60
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %34 %44 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %8 RelaxedPrecision 
                                             OpDecorate %11 RelaxedPrecision 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %15 RelaxedPrecision 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD1 Location 34 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %44 Location 44 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %10 = OpTypePointer UniformConstant %9 
UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
                                     %13 = OpTypeSampler 
                                     %14 = OpTypePointer UniformConstant %13 
            UniformConstant sampler* %15 = OpVariable UniformConstant 
                                     %17 = OpTypeSampledImage %9 
                                     %19 = OpTypeVector %6 2 
                                     %20 = OpTypePointer Input %19 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypePointer Input %23 
                        Input f32_4* %44 = OpVariable Input 
                                     %45 = OpTypePointer Input %6 
                                     %49 = OpTypePointer Output %23 
                       Output f32_4* %50 = OpVariable Output 
                                     %52 = OpTypePointer Output %6 
                                     %54 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %35 = OpLoad vs_TEXCOORD1 
                               f32_4 %36 = OpImageSampleImplicitLod %33 %35 
                                 f32 %37 = OpCompositeExtract %36 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpLoad %8 
                                 f32 %41 = OpFMul %39 %40 
                                             OpStore %38 %41 
                                 f32 %42 = OpLoad %38 
                          Input f32* %46 = OpAccessChain %44 %26 
                                 f32 %47 = OpLoad %46 
                                 f32 %48 = OpFMul %42 %47 
                                             OpStore %38 %48 
                                 f32 %51 = OpLoad %38 
                         Output f32* %53 = OpAccessChain %50 %26 
                                             OpStore %53 %51 
                               f32_4 %55 = OpLoad %44 
                               f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               f32_4 %57 = OpLoad %50 
                               f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                             OpStore %50 %58 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 178
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %153 %160 %162 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 RelaxedPrecision 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 153 
                                                      OpDecorate vs_TEXCOORD0 Location 160 
                                                      OpDecorate %162 Location 162 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                             %133 = OpTypePointer Private %91 
                              Private f32_2* %134 = OpVariable Private 
                                         i32 %137 = OpConstant 5 
                                             %152 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %161 = OpTypePointer Input %91 
                                Input f32_2* %162 = OpVariable Input 
                                             %172 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %22 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_4 %92 = OpLoad %9 
                                        f32_2 %93 = OpVectorShuffle %92 %92 1 1 
                               Uniform f32_4* %94 = OpAccessChain %22 %25 %25 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %93 %96 
                                        f32_4 %98 = OpLoad %50 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %50 %99 
                              Uniform f32_4* %100 = OpAccessChain %22 %25 %24 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_4 %103 = OpLoad %9 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 0 
                                       f32_2 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %50 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFAdd %105 %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 2 3 
                                                      OpStore %9 %110 
                              Uniform f32_4* %111 = OpAccessChain %22 %25 %37 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %9 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 2 
                                       f32_2 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_2 %119 = OpFAdd %116 %118 
                                       f32_4 %120 = OpLoad %9 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 2 3 
                                                      OpStore %9 %121 
                              Uniform f32_4* %122 = OpAccessChain %22 %25 %46 
                                       f32_4 %123 = OpLoad %122 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_4 %125 = OpLoad %9 
                                       f32_2 %126 = OpVectorShuffle %125 %125 3 3 
                                       f32_2 %127 = OpFMul %124 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %135 = OpLoad %9 
                                       f32_2 %136 = OpVectorShuffle %135 %135 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %137 %25 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                                                      OpStore %134 %141 
                              Uniform f32_4* %142 = OpAccessChain %22 %137 %24 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                                       f32_4 %145 = OpLoad %9 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 0 
                                       f32_2 %147 = OpFMul %144 %146 
                                       f32_2 %148 = OpLoad %134 
                                       f32_2 %149 = OpFAdd %147 %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 2 3 
                                                      OpStore %9 %151 
                                       f32_4 %154 = OpLoad %9 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 1 
                              Uniform f32_4* %156 = OpAccessChain %22 %137 %46 
                                       f32_4 %157 = OpLoad %156 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_2 %159 = OpFAdd %155 %158 
                                                      OpStore vs_TEXCOORD1 %159 
                                       f32_2 %163 = OpLoad %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
                                       f32_2 %167 = OpFMul %163 %166 
                              Uniform f32_4* %168 = OpAccessChain %22 %46 
                                       f32_4 %169 = OpLoad %168 
                                       f32_2 %170 = OpVectorShuffle %169 %169 2 3 
                                       f32_2 %171 = OpFAdd %167 %170 
                                                      OpStore vs_TEXCOORD0 %171 
                                 Output f32* %173 = OpAccessChain %74 %24 %70 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFNegate %174 
                                 Output f32* %176 = OpAccessChain %74 %24 %70 
                                                      OpStore %176 %175 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 60
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %34 %44 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %8 RelaxedPrecision 
                                             OpDecorate %11 RelaxedPrecision 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %15 RelaxedPrecision 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD1 Location 34 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %44 Location 44 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %10 = OpTypePointer UniformConstant %9 
UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
                                     %13 = OpTypeSampler 
                                     %14 = OpTypePointer UniformConstant %13 
            UniformConstant sampler* %15 = OpVariable UniformConstant 
                                     %17 = OpTypeSampledImage %9 
                                     %19 = OpTypeVector %6 2 
                                     %20 = OpTypePointer Input %19 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypePointer Input %23 
                        Input f32_4* %44 = OpVariable Input 
                                     %45 = OpTypePointer Input %6 
                                     %49 = OpTypePointer Output %23 
                       Output f32_4* %50 = OpVariable Output 
                                     %52 = OpTypePointer Output %6 
                                     %54 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %35 = OpLoad vs_TEXCOORD1 
                               f32_4 %36 = OpImageSampleImplicitLod %33 %35 
                                 f32 %37 = OpCompositeExtract %36 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpLoad %8 
                                 f32 %41 = OpFMul %39 %40 
                                             OpStore %38 %41 
                                 f32 %42 = OpLoad %38 
                          Input f32* %46 = OpAccessChain %44 %26 
                                 f32 %47 = OpLoad %46 
                                 f32 %48 = OpFMul %42 %47 
                                             OpStore %38 %48 
                                 f32 %51 = OpLoad %38 
                         Output f32* %53 = OpAccessChain %50 %26 
                                             OpStore %53 %51 
                               f32_4 %55 = OpLoad %44 
                               f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               f32_4 %57 = OpLoad %50 
                               f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                             OpStore %50 %58 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "vulkan hw_tier00 " {
""
}
SubProgram "vulkan hw_tier01 " {
""
}
SubProgram "vulkan hw_tier02 " {
""
}
}
}
}
SubShader {
 Pass {
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 94468
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0 * _Color;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_1 * u_xlat16_0;
    u_xlat0 = u_xlat0 * vs_COLOR0.w;
    SV_Target0.w = u_xlat0;
    SV_Target0.xyz = vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0 * _Color;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_1 * u_xlat16_0;
    u_xlat0 = u_xlat0 * vs_COLOR0.w;
    SV_Target0.w = u_xlat0;
    SV_Target0.xyz = vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	mediump vec4 _Color;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0 * _Color;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_1 * u_xlat16_0;
    u_xlat0 = u_xlat0 * vs_COLOR0.w;
    SV_Target0.w = u_xlat0;
    SV_Target0.xyz = vs_COLOR0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 178
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %153 %160 %162 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 RelaxedPrecision 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 153 
                                                      OpDecorate vs_TEXCOORD0 Location 160 
                                                      OpDecorate %162 Location 162 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                             %133 = OpTypePointer Private %91 
                              Private f32_2* %134 = OpVariable Private 
                                         i32 %137 = OpConstant 5 
                                             %152 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %161 = OpTypePointer Input %91 
                                Input f32_2* %162 = OpVariable Input 
                                             %172 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %22 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_4 %92 = OpLoad %9 
                                        f32_2 %93 = OpVectorShuffle %92 %92 1 1 
                               Uniform f32_4* %94 = OpAccessChain %22 %25 %25 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %93 %96 
                                        f32_4 %98 = OpLoad %50 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %50 %99 
                              Uniform f32_4* %100 = OpAccessChain %22 %25 %24 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_4 %103 = OpLoad %9 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 0 
                                       f32_2 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %50 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFAdd %105 %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 2 3 
                                                      OpStore %9 %110 
                              Uniform f32_4* %111 = OpAccessChain %22 %25 %37 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %9 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 2 
                                       f32_2 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_2 %119 = OpFAdd %116 %118 
                                       f32_4 %120 = OpLoad %9 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 2 3 
                                                      OpStore %9 %121 
                              Uniform f32_4* %122 = OpAccessChain %22 %25 %46 
                                       f32_4 %123 = OpLoad %122 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_4 %125 = OpLoad %9 
                                       f32_2 %126 = OpVectorShuffle %125 %125 3 3 
                                       f32_2 %127 = OpFMul %124 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %135 = OpLoad %9 
                                       f32_2 %136 = OpVectorShuffle %135 %135 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %137 %25 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                                                      OpStore %134 %141 
                              Uniform f32_4* %142 = OpAccessChain %22 %137 %24 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                                       f32_4 %145 = OpLoad %9 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 0 
                                       f32_2 %147 = OpFMul %144 %146 
                                       f32_2 %148 = OpLoad %134 
                                       f32_2 %149 = OpFAdd %147 %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 2 3 
                                                      OpStore %9 %151 
                                       f32_4 %154 = OpLoad %9 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 1 
                              Uniform f32_4* %156 = OpAccessChain %22 %137 %46 
                                       f32_4 %157 = OpLoad %156 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_2 %159 = OpFAdd %155 %158 
                                                      OpStore vs_TEXCOORD1 %159 
                                       f32_2 %163 = OpLoad %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
                                       f32_2 %167 = OpFMul %163 %166 
                              Uniform f32_4* %168 = OpAccessChain %22 %46 
                                       f32_4 %169 = OpLoad %168 
                                       f32_2 %170 = OpVectorShuffle %169 %169 2 3 
                                       f32_2 %171 = OpFAdd %167 %170 
                                                      OpStore vs_TEXCOORD0 %171 
                                 Output f32* %173 = OpAccessChain %74 %24 %70 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFNegate %174 
                                 Output f32* %176 = OpAccessChain %74 %24 %70 
                                                      OpStore %176 %175 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 60
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %34 %44 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %8 RelaxedPrecision 
                                             OpDecorate %11 RelaxedPrecision 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %15 RelaxedPrecision 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD1 Location 34 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %44 Location 44 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %10 = OpTypePointer UniformConstant %9 
UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
                                     %13 = OpTypeSampler 
                                     %14 = OpTypePointer UniformConstant %13 
            UniformConstant sampler* %15 = OpVariable UniformConstant 
                                     %17 = OpTypeSampledImage %9 
                                     %19 = OpTypeVector %6 2 
                                     %20 = OpTypePointer Input %19 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypePointer Input %23 
                        Input f32_4* %44 = OpVariable Input 
                                     %45 = OpTypePointer Input %6 
                                     %49 = OpTypePointer Output %23 
                       Output f32_4* %50 = OpVariable Output 
                                     %52 = OpTypePointer Output %6 
                                     %54 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %35 = OpLoad vs_TEXCOORD1 
                               f32_4 %36 = OpImageSampleImplicitLod %33 %35 
                                 f32 %37 = OpCompositeExtract %36 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpLoad %8 
                                 f32 %41 = OpFMul %39 %40 
                                             OpStore %38 %41 
                                 f32 %42 = OpLoad %38 
                          Input f32* %46 = OpAccessChain %44 %26 
                                 f32 %47 = OpLoad %46 
                                 f32 %48 = OpFMul %42 %47 
                                             OpStore %38 %48 
                                 f32 %51 = OpLoad %38 
                         Output f32* %53 = OpAccessChain %50 %26 
                                             OpStore %53 %51 
                               f32_4 %55 = OpLoad %44 
                               f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               f32_4 %57 = OpLoad %50 
                               f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                             OpStore %50 %58 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 178
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %153 %160 %162 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 RelaxedPrecision 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 153 
                                                      OpDecorate vs_TEXCOORD0 Location 160 
                                                      OpDecorate %162 Location 162 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                             %133 = OpTypePointer Private %91 
                              Private f32_2* %134 = OpVariable Private 
                                         i32 %137 = OpConstant 5 
                                             %152 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %161 = OpTypePointer Input %91 
                                Input f32_2* %162 = OpVariable Input 
                                             %172 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %22 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_4 %92 = OpLoad %9 
                                        f32_2 %93 = OpVectorShuffle %92 %92 1 1 
                               Uniform f32_4* %94 = OpAccessChain %22 %25 %25 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %93 %96 
                                        f32_4 %98 = OpLoad %50 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %50 %99 
                              Uniform f32_4* %100 = OpAccessChain %22 %25 %24 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_4 %103 = OpLoad %9 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 0 
                                       f32_2 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %50 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFAdd %105 %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 2 3 
                                                      OpStore %9 %110 
                              Uniform f32_4* %111 = OpAccessChain %22 %25 %37 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %9 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 2 
                                       f32_2 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_2 %119 = OpFAdd %116 %118 
                                       f32_4 %120 = OpLoad %9 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 2 3 
                                                      OpStore %9 %121 
                              Uniform f32_4* %122 = OpAccessChain %22 %25 %46 
                                       f32_4 %123 = OpLoad %122 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_4 %125 = OpLoad %9 
                                       f32_2 %126 = OpVectorShuffle %125 %125 3 3 
                                       f32_2 %127 = OpFMul %124 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %135 = OpLoad %9 
                                       f32_2 %136 = OpVectorShuffle %135 %135 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %137 %25 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                                                      OpStore %134 %141 
                              Uniform f32_4* %142 = OpAccessChain %22 %137 %24 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                                       f32_4 %145 = OpLoad %9 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 0 
                                       f32_2 %147 = OpFMul %144 %146 
                                       f32_2 %148 = OpLoad %134 
                                       f32_2 %149 = OpFAdd %147 %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 2 3 
                                                      OpStore %9 %151 
                                       f32_4 %154 = OpLoad %9 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 1 
                              Uniform f32_4* %156 = OpAccessChain %22 %137 %46 
                                       f32_4 %157 = OpLoad %156 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_2 %159 = OpFAdd %155 %158 
                                                      OpStore vs_TEXCOORD1 %159 
                                       f32_2 %163 = OpLoad %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
                                       f32_2 %167 = OpFMul %163 %166 
                              Uniform f32_4* %168 = OpAccessChain %22 %46 
                                       f32_4 %169 = OpLoad %168 
                                       f32_2 %170 = OpVectorShuffle %169 %169 2 3 
                                       f32_2 %171 = OpFAdd %167 %170 
                                                      OpStore vs_TEXCOORD0 %171 
                                 Output f32* %173 = OpAccessChain %74 %24 %70 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFNegate %174 
                                 Output f32* %176 = OpAccessChain %74 %24 %70 
                                                      OpStore %176 %175 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 60
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %34 %44 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %8 RelaxedPrecision 
                                             OpDecorate %11 RelaxedPrecision 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %15 RelaxedPrecision 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD1 Location 34 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %44 Location 44 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %10 = OpTypePointer UniformConstant %9 
UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
                                     %13 = OpTypeSampler 
                                     %14 = OpTypePointer UniformConstant %13 
            UniformConstant sampler* %15 = OpVariable UniformConstant 
                                     %17 = OpTypeSampledImage %9 
                                     %19 = OpTypeVector %6 2 
                                     %20 = OpTypePointer Input %19 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypePointer Input %23 
                        Input f32_4* %44 = OpVariable Input 
                                     %45 = OpTypePointer Input %6 
                                     %49 = OpTypePointer Output %23 
                       Output f32_4* %50 = OpVariable Output 
                                     %52 = OpTypePointer Output %6 
                                     %54 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %35 = OpLoad vs_TEXCOORD1 
                               f32_4 %36 = OpImageSampleImplicitLod %33 %35 
                                 f32 %37 = OpCompositeExtract %36 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpLoad %8 
                                 f32 %41 = OpFMul %39 %40 
                                             OpStore %38 %41 
                                 f32 %42 = OpLoad %38 
                          Input f32* %46 = OpAccessChain %44 %26 
                                 f32 %47 = OpLoad %46 
                                 f32 %48 = OpFMul %42 %47 
                                             OpStore %38 %48 
                                 f32 %51 = OpLoad %38 
                         Output f32* %53 = OpAccessChain %50 %26 
                                             OpStore %53 %51 
                               f32_4 %55 = OpLoad %44 
                               f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               f32_4 %57 = OpLoad %50 
                               f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                             OpStore %50 %58 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 178
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %153 %160 %162 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 RelaxedPrecision 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 153 
                                                      OpDecorate vs_TEXCOORD0 Location 160 
                                                      OpDecorate %162 Location 162 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %14 = OpTypeInt 32 0 
                                          u32 %15 = OpConstant 4 
                                              %16 = OpTypeArray %7 %15 
                                              %17 = OpTypeArray %7 %15 
                                              %18 = OpTypeArray %7 %15 
                                              %19 = OpTypeArray %7 %15 
                                              %20 = OpTypeStruct %16 %17 %18 %7 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                          i32 %87 = OpConstant 4 
                                              %91 = OpTypeVector %6 2 
                                             %133 = OpTypePointer Private %91 
                              Private f32_2* %134 = OpVariable Private 
                                         i32 %137 = OpConstant 5 
                                             %152 = OpTypePointer Output %91 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %161 = OpTypePointer Input %91 
                                Input f32_2* %162 = OpVariable Input 
                                             %172 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %88 = OpAccessChain %22 %87 
                                        f32_4 %89 = OpLoad %88 
                                        f32_4 %90 = OpFMul %86 %89 
                                                      OpStore %84 %90 
                                        f32_4 %92 = OpLoad %9 
                                        f32_2 %93 = OpVectorShuffle %92 %92 1 1 
                               Uniform f32_4* %94 = OpAccessChain %22 %25 %25 
                                        f32_4 %95 = OpLoad %94 
                                        f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                                        f32_2 %97 = OpFMul %93 %96 
                                        f32_4 %98 = OpLoad %50 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %50 %99 
                              Uniform f32_4* %100 = OpAccessChain %22 %25 %24 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 0 1 
                                       f32_4 %103 = OpLoad %9 
                                       f32_2 %104 = OpVectorShuffle %103 %103 0 0 
                                       f32_2 %105 = OpFMul %102 %104 
                                       f32_4 %106 = OpLoad %50 
                                       f32_2 %107 = OpVectorShuffle %106 %106 0 1 
                                       f32_2 %108 = OpFAdd %105 %107 
                                       f32_4 %109 = OpLoad %9 
                                       f32_4 %110 = OpVectorShuffle %109 %108 4 5 2 3 
                                                      OpStore %9 %110 
                              Uniform f32_4* %111 = OpAccessChain %22 %25 %37 
                                       f32_4 %112 = OpLoad %111 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %9 
                                       f32_2 %115 = OpVectorShuffle %114 %114 2 2 
                                       f32_2 %116 = OpFMul %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                       f32_2 %119 = OpFAdd %116 %118 
                                       f32_4 %120 = OpLoad %9 
                                       f32_4 %121 = OpVectorShuffle %120 %119 4 5 2 3 
                                                      OpStore %9 %121 
                              Uniform f32_4* %122 = OpAccessChain %22 %25 %46 
                                       f32_4 %123 = OpLoad %122 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_4 %125 = OpLoad %9 
                                       f32_2 %126 = OpVectorShuffle %125 %125 3 3 
                                       f32_2 %127 = OpFMul %124 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %135 = OpLoad %9 
                                       f32_2 %136 = OpVectorShuffle %135 %135 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %137 %25 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_2 %141 = OpFMul %136 %140 
                                                      OpStore %134 %141 
                              Uniform f32_4* %142 = OpAccessChain %22 %137 %24 
                                       f32_4 %143 = OpLoad %142 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 1 
                                       f32_4 %145 = OpLoad %9 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 0 
                                       f32_2 %147 = OpFMul %144 %146 
                                       f32_2 %148 = OpLoad %134 
                                       f32_2 %149 = OpFAdd %147 %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %149 4 5 2 3 
                                                      OpStore %9 %151 
                                       f32_4 %154 = OpLoad %9 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 1 
                              Uniform f32_4* %156 = OpAccessChain %22 %137 %46 
                                       f32_4 %157 = OpLoad %156 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_2 %159 = OpFAdd %155 %158 
                                                      OpStore vs_TEXCOORD1 %159 
                                       f32_2 %163 = OpLoad %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 0 1 
                                       f32_2 %167 = OpFMul %163 %166 
                              Uniform f32_4* %168 = OpAccessChain %22 %46 
                                       f32_4 %169 = OpLoad %168 
                                       f32_2 %170 = OpVectorShuffle %169 %169 2 3 
                                       f32_2 %171 = OpFAdd %167 %170 
                                                      OpStore vs_TEXCOORD0 %171 
                                 Output f32* %173 = OpAccessChain %74 %24 %70 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFNegate %174 
                                 Output f32* %176 = OpAccessChain %74 %24 %70 
                                                      OpStore %176 %175 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 60
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %34 %44 %50 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpDecorate %8 RelaxedPrecision 
                                             OpDecorate %11 RelaxedPrecision 
                                             OpDecorate %11 DescriptorSet 11 
                                             OpDecorate %11 Binding 11 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %15 RelaxedPrecision 
                                             OpDecorate %15 DescriptorSet 15 
                                             OpDecorate %15 Binding 15 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 DescriptorSet 31 
                                             OpDecorate %31 Binding 31 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD1 Location 34 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %44 Location 44 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypePointer Private %6 
                         Private f32* %8 = OpVariable Private 
                                      %9 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %10 = OpTypePointer UniformConstant %9 
UniformConstant read_only Texture2D* %11 = OpVariable UniformConstant 
                                     %13 = OpTypeSampler 
                                     %14 = OpTypePointer UniformConstant %13 
            UniformConstant sampler* %15 = OpVariable UniformConstant 
                                     %17 = OpTypeSampledImage %9 
                                     %19 = OpTypeVector %6 2 
                                     %20 = OpTypePointer Input %19 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypePointer Input %23 
                        Input f32_4* %44 = OpVariable Input 
                                     %45 = OpTypePointer Input %6 
                                     %49 = OpTypePointer Output %23 
                       Output f32_4* %50 = OpVariable Output 
                                     %52 = OpTypePointer Output %6 
                                     %54 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %35 = OpLoad vs_TEXCOORD1 
                               f32_4 %36 = OpImageSampleImplicitLod %33 %35 
                                 f32 %37 = OpCompositeExtract %36 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpLoad %8 
                                 f32 %41 = OpFMul %39 %40 
                                             OpStore %38 %41 
                                 f32 %42 = OpLoad %38 
                          Input f32* %46 = OpAccessChain %44 %26 
                                 f32 %47 = OpLoad %46 
                                 f32 %48 = OpFMul %42 %47 
                                             OpStore %38 %48 
                                 f32 %51 = OpLoad %38 
                         Output f32* %53 = OpAccessChain %50 %26 
                                             OpStore %53 %51 
                               f32_4 %55 = OpLoad %44 
                               f32_3 %56 = OpVectorShuffle %55 %55 0 1 2 
                               f32_4 %57 = OpLoad %50 
                               f32_4 %58 = OpVectorShuffle %57 %56 4 5 6 3 
                                             OpStore %50 %58 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "vulkan hw_tier00 " {
""
}
SubProgram "vulkan hw_tier01 " {
""
}
SubProgram "vulkan hw_tier02 " {
""
}
}
}
}
}