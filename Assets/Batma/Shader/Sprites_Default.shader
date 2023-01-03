//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Sprites/Default" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
_RendererColor ("RendererColor", Color) = (1,1,1,1)
_Flip ("Flip", Vector) = (1,1,1,1)
_AlphaTex ("External Alpha", 2D) = "white" { }
_EnableExternalAlpha ("Enable External Alpha", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 61654
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 114
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %91 %101 %104 %106 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate vs_TEXCOORD0 Location 104 
                                                      OpDecorate %106 Location 106 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 0 
                                          i32 %34 = OpConstant 1 
                                              %35 = OpTypePointer Uniform %7 
                                          i32 %46 = OpConstant 2 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                 Input f32_4* %91 = OpVariable Input 
                                          i32 %93 = OpConstant 4 
                               Output f32_4* %101 = OpVariable Output 
                                             %103 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %105 = OpTypePointer Input %12 
                                Input f32_2* %106 = OpVariable Input 
                                             %108 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %21 %33 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpFMul %32 %37 
                                                      OpStore %30 %38 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %33 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %55 = OpAccessChain %21 %33 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFAdd %54 %56 
                                                      OpStore %9 %57 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %34 %34 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %30 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %34 %33 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %30 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %30 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %34 %46 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %30 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %30 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %34 %23 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %30 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %33 
                                                      OpStore %90 %88 
                                        f32_4 %92 = OpLoad %91 
                               Uniform f32_4* %94 = OpAccessChain %21 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpFMul %92 %95 
                                                      OpStore %9 %96 
                                        f32_4 %97 = OpLoad %9 
                               Uniform f32_4* %98 = OpAccessChain %21 %46 
                                        f32_4 %99 = OpLoad %98 
                                       f32_4 %100 = OpFMul %97 %99 
                                                      OpStore %9 %100 
                                       f32_4 %102 = OpLoad %9 
                                                      OpStore %101 %102 
                                       f32_2 %107 = OpLoad %106 
                                                      OpStore vs_TEXCOORD0 %107 
                                 Output f32* %109 = OpAccessChain %81 %33 %77 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                 Output f32* %112 = OpAccessChain %81 %33 %77 
                                                      OpStore %112 %111 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 49
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 %32 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 Location 32 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypePointer Input %7 
                        Input f32_4* %28 = OpVariable Input 
                                     %31 = OpTypePointer Output %7 
                       Output f32_4* %32 = OpVariable Output 
                                     %33 = OpTypeVector %6 3 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 3 
                                     %43 = OpTypePointer Private %6 
                                     %46 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_4 %29 = OpLoad %28 
                               f32_4 %30 = OpFMul %26 %29 
                                             OpStore %25 %30 
                               f32_4 %34 = OpLoad %25 
                               f32_3 %35 = OpVectorShuffle %34 %34 3 3 3 
                               f32_4 %36 = OpLoad %25 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                               f32_3 %38 = OpFMul %35 %37 
                               f32_4 %39 = OpLoad %32 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %32 %40 
                        Private f32* %44 = OpAccessChain %25 %42 
                                 f32 %45 = OpLoad %44 
                         Output f32* %47 = OpAccessChain %32 %42 
                                             OpStore %47 %45 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 114
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %91 %101 %104 %106 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate vs_TEXCOORD0 Location 104 
                                                      OpDecorate %106 Location 106 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 0 
                                          i32 %34 = OpConstant 1 
                                              %35 = OpTypePointer Uniform %7 
                                          i32 %46 = OpConstant 2 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                 Input f32_4* %91 = OpVariable Input 
                                          i32 %93 = OpConstant 4 
                               Output f32_4* %101 = OpVariable Output 
                                             %103 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %105 = OpTypePointer Input %12 
                                Input f32_2* %106 = OpVariable Input 
                                             %108 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %21 %33 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpFMul %32 %37 
                                                      OpStore %30 %38 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %33 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %55 = OpAccessChain %21 %33 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFAdd %54 %56 
                                                      OpStore %9 %57 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %34 %34 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %30 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %34 %33 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %30 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %30 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %34 %46 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %30 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %30 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %34 %23 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %30 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %33 
                                                      OpStore %90 %88 
                                        f32_4 %92 = OpLoad %91 
                               Uniform f32_4* %94 = OpAccessChain %21 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpFMul %92 %95 
                                                      OpStore %9 %96 
                                        f32_4 %97 = OpLoad %9 
                               Uniform f32_4* %98 = OpAccessChain %21 %46 
                                        f32_4 %99 = OpLoad %98 
                                       f32_4 %100 = OpFMul %97 %99 
                                                      OpStore %9 %100 
                                       f32_4 %102 = OpLoad %9 
                                                      OpStore %101 %102 
                                       f32_2 %107 = OpLoad %106 
                                                      OpStore vs_TEXCOORD0 %107 
                                 Output f32* %109 = OpAccessChain %81 %33 %77 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                 Output f32* %112 = OpAccessChain %81 %33 %77 
                                                      OpStore %112 %111 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 49
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 %32 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 Location 32 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypePointer Input %7 
                        Input f32_4* %28 = OpVariable Input 
                                     %31 = OpTypePointer Output %7 
                       Output f32_4* %32 = OpVariable Output 
                                     %33 = OpTypeVector %6 3 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 3 
                                     %43 = OpTypePointer Private %6 
                                     %46 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_4 %29 = OpLoad %28 
                               f32_4 %30 = OpFMul %26 %29 
                                             OpStore %25 %30 
                               f32_4 %34 = OpLoad %25 
                               f32_3 %35 = OpVectorShuffle %34 %34 3 3 3 
                               f32_4 %36 = OpLoad %25 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                               f32_3 %38 = OpFMul %35 %37 
                               f32_4 %39 = OpLoad %32 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %32 %40 
                        Private f32* %44 = OpAccessChain %25 %42 
                                 f32 %45 = OpLoad %44 
                         Output f32* %47 = OpAccessChain %32 %42 
                                             OpStore %47 %45 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 114
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %91 %101 %104 %106 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate vs_TEXCOORD0 Location 104 
                                                      OpDecorate %106 Location 106 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 0 
                                          i32 %34 = OpConstant 1 
                                              %35 = OpTypePointer Uniform %7 
                                          i32 %46 = OpConstant 2 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                 Input f32_4* %91 = OpVariable Input 
                                          i32 %93 = OpConstant 4 
                               Output f32_4* %101 = OpVariable Output 
                                             %103 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %105 = OpTypePointer Input %12 
                                Input f32_2* %106 = OpVariable Input 
                                             %108 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %21 %33 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpFMul %32 %37 
                                                      OpStore %30 %38 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %33 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %55 = OpAccessChain %21 %33 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFAdd %54 %56 
                                                      OpStore %9 %57 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %34 %34 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %30 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %34 %33 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %30 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %30 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %34 %46 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %30 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %30 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %34 %23 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %30 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %33 
                                                      OpStore %90 %88 
                                        f32_4 %92 = OpLoad %91 
                               Uniform f32_4* %94 = OpAccessChain %21 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpFMul %92 %95 
                                                      OpStore %9 %96 
                                        f32_4 %97 = OpLoad %9 
                               Uniform f32_4* %98 = OpAccessChain %21 %46 
                                        f32_4 %99 = OpLoad %98 
                                       f32_4 %100 = OpFMul %97 %99 
                                                      OpStore %9 %100 
                                       f32_4 %102 = OpLoad %9 
                                                      OpStore %101 %102 
                                       f32_2 %107 = OpLoad %106 
                                                      OpStore vs_TEXCOORD0 %107 
                                 Output f32* %109 = OpAccessChain %81 %33 %77 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                 Output f32* %112 = OpAccessChain %81 %33 %77 
                                                      OpStore %112 %111 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 49
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 %32 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 Location 32 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypePointer Input %7 
                        Input f32_4* %28 = OpVariable Input 
                                     %31 = OpTypePointer Output %7 
                       Output f32_4* %32 = OpVariable Output 
                                     %33 = OpTypeVector %6 3 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 3 
                                     %43 = OpTypePointer Private %6 
                                     %46 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_4 %29 = OpLoad %28 
                               f32_4 %30 = OpFMul %26 %29 
                                             OpStore %25 %30 
                               f32_4 %34 = OpLoad %25 
                               f32_3 %35 = OpVectorShuffle %34 %34 3 3 3 
                               f32_4 %36 = OpLoad %25 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                               f32_3 %38 = OpFMul %35 %37 
                               f32_4 %39 = OpLoad %32 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %32 %40 
                        Private f32* %44 = OpAccessChain %25 %42 
                                 f32 %45 = OpLoad %44 
                         Output f32* %47 = OpAccessChain %32 %42 
                                             OpStore %47 %45 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "PIXELSNAP_ON" }
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "PIXELSNAP_ON" }
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "PIXELSNAP_ON" }
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_0 = u_xlat16_0 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Local Keywords { "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %123 %138 %148 %151 %153 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %121 0 BuiltIn 121 
                                                      OpMemberDecorate %121 1 BuiltIn 121 
                                                      OpMemberDecorate %121 2 BuiltIn 121 
                                                      OpDecorate %121 Block 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate vs_TEXCOORD0 Location 151 
                                                      OpDecorate %153 Location 153 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 1 
                                              %34 = OpTypePointer Uniform %7 
                                          i32 %38 = OpConstant 0 
                                          i32 %46 = OpConstant 2 
                                          i32 %55 = OpConstant 3 
                                          f32 %95 = OpConstant 3.674022E-40 
                                        f32_2 %96 = OpConstantComposite %95 %95 
                                         u32 %119 = OpConstant 1 
                                             %120 = OpTypeArray %6 %119 
                                             %121 = OpTypeStruct %7 %6 %120 
                                             %122 = OpTypePointer Output %121 
        Output struct {f32_4; f32; f32[1];}* %123 = OpVariable Output 
                                             %129 = OpTypePointer Output %7 
                                Input f32_4* %138 = OpVariable Input 
                                         i32 %140 = OpConstant 5 
                               Output f32_4* %148 = OpVariable Output 
                                             %150 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %152 = OpTypePointer Input %12 
                                Input f32_2* %153 = OpVariable Input 
                                             %155 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %21 %33 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpFMul %32 %36 
                                                      OpStore %30 %37 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %56 = OpAccessChain %21 %33 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFAdd %54 %57 
                                                      OpStore %9 %58 
                                        f32_4 %59 = OpLoad %9 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %21 %46 %33 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpFMul %60 %62 
                                                      OpStore %30 %63 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %38 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpVectorShuffle %66 %66 0 0 0 0 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %30 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %30 %70 
                               Uniform f32_4* %71 = OpAccessChain %21 %46 %46 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_4 %74 = OpVectorShuffle %73 %73 2 2 2 2 
                                        f32_4 %75 = OpFMul %72 %74 
                                        f32_4 %76 = OpLoad %30 
                                        f32_4 %77 = OpFAdd %75 %76 
                                                      OpStore %30 %77 
                               Uniform f32_4* %78 = OpAccessChain %21 %46 %55 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %80 3 3 3 3 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %30 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpLoad %9 
                                        f32_2 %88 = OpVectorShuffle %87 %87 3 3 
                                        f32_2 %89 = OpFDiv %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                      OpStore %9 %91 
                               Uniform f32_4* %92 = OpAccessChain %21 %38 
                                        f32_4 %93 = OpLoad %92 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                        f32_2 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %30 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %30 %99 
                                       f32_4 %100 = OpLoad %9 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_4 %102 = OpLoad %30 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                                       f32_4 %107 = OpLoad %9 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpExtInst %1 2 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                      OpStore %9 %111 
                                       f32_4 %112 = OpLoad %9 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %30 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                       f32_2 %116 = OpFDiv %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 2 3 
                                                      OpStore %9 %118 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 3 3 
                                       f32_4 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_2 %128 = OpFMul %125 %127 
                               Output f32_4* %130 = OpAccessChain %123 %38 
                                       f32_4 %131 = OpLoad %130 
                                       f32_4 %132 = OpVectorShuffle %131 %128 4 5 2 3 
                                                      OpStore %130 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                               Output f32_4* %135 = OpAccessChain %123 %38 
                                       f32_4 %136 = OpLoad %135 
                                       f32_4 %137 = OpVectorShuffle %136 %134 0 1 4 5 
                                                      OpStore %135 %137 
                                       f32_4 %139 = OpLoad %138 
                              Uniform f32_4* %141 = OpAccessChain %21 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %139 %142 
                                                      OpStore %9 %143 
                                       f32_4 %144 = OpLoad %9 
                              Uniform f32_4* %145 = OpAccessChain %21 %55 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpFMul %144 %146 
                                                      OpStore %9 %147 
                                       f32_4 %149 = OpLoad %9 
                                                      OpStore %148 %149 
                                       f32_2 %154 = OpLoad %153 
                                                      OpStore vs_TEXCOORD0 %154 
                                 Output f32* %156 = OpAccessChain %123 %38 %119 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                 Output f32* %159 = OpAccessChain %123 %38 %119 
                                                      OpStore %159 %158 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 49
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 %32 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 Location 32 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypePointer Input %7 
                        Input f32_4* %28 = OpVariable Input 
                                     %31 = OpTypePointer Output %7 
                       Output f32_4* %32 = OpVariable Output 
                                     %33 = OpTypeVector %6 3 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 3 
                                     %43 = OpTypePointer Private %6 
                                     %46 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_4 %29 = OpLoad %28 
                               f32_4 %30 = OpFMul %26 %29 
                                             OpStore %25 %30 
                               f32_4 %34 = OpLoad %25 
                               f32_3 %35 = OpVectorShuffle %34 %34 3 3 3 
                               f32_4 %36 = OpLoad %25 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                               f32_3 %38 = OpFMul %35 %37 
                               f32_4 %39 = OpLoad %32 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %32 %40 
                        Private f32* %44 = OpAccessChain %25 %42 
                                 f32 %45 = OpLoad %44 
                         Output f32* %47 = OpAccessChain %32 %42 
                                             OpStore %47 %45 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %123 %138 %148 %151 %153 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %121 0 BuiltIn 121 
                                                      OpMemberDecorate %121 1 BuiltIn 121 
                                                      OpMemberDecorate %121 2 BuiltIn 121 
                                                      OpDecorate %121 Block 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate vs_TEXCOORD0 Location 151 
                                                      OpDecorate %153 Location 153 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 1 
                                              %34 = OpTypePointer Uniform %7 
                                          i32 %38 = OpConstant 0 
                                          i32 %46 = OpConstant 2 
                                          i32 %55 = OpConstant 3 
                                          f32 %95 = OpConstant 3.674022E-40 
                                        f32_2 %96 = OpConstantComposite %95 %95 
                                         u32 %119 = OpConstant 1 
                                             %120 = OpTypeArray %6 %119 
                                             %121 = OpTypeStruct %7 %6 %120 
                                             %122 = OpTypePointer Output %121 
        Output struct {f32_4; f32; f32[1];}* %123 = OpVariable Output 
                                             %129 = OpTypePointer Output %7 
                                Input f32_4* %138 = OpVariable Input 
                                         i32 %140 = OpConstant 5 
                               Output f32_4* %148 = OpVariable Output 
                                             %150 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %152 = OpTypePointer Input %12 
                                Input f32_2* %153 = OpVariable Input 
                                             %155 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %21 %33 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpFMul %32 %36 
                                                      OpStore %30 %37 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %56 = OpAccessChain %21 %33 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFAdd %54 %57 
                                                      OpStore %9 %58 
                                        f32_4 %59 = OpLoad %9 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %21 %46 %33 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpFMul %60 %62 
                                                      OpStore %30 %63 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %38 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpVectorShuffle %66 %66 0 0 0 0 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %30 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %30 %70 
                               Uniform f32_4* %71 = OpAccessChain %21 %46 %46 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_4 %74 = OpVectorShuffle %73 %73 2 2 2 2 
                                        f32_4 %75 = OpFMul %72 %74 
                                        f32_4 %76 = OpLoad %30 
                                        f32_4 %77 = OpFAdd %75 %76 
                                                      OpStore %30 %77 
                               Uniform f32_4* %78 = OpAccessChain %21 %46 %55 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %80 3 3 3 3 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %30 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpLoad %9 
                                        f32_2 %88 = OpVectorShuffle %87 %87 3 3 
                                        f32_2 %89 = OpFDiv %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                      OpStore %9 %91 
                               Uniform f32_4* %92 = OpAccessChain %21 %38 
                                        f32_4 %93 = OpLoad %92 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                        f32_2 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %30 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %30 %99 
                                       f32_4 %100 = OpLoad %9 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_4 %102 = OpLoad %30 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                                       f32_4 %107 = OpLoad %9 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpExtInst %1 2 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                      OpStore %9 %111 
                                       f32_4 %112 = OpLoad %9 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %30 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                       f32_2 %116 = OpFDiv %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 2 3 
                                                      OpStore %9 %118 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 3 3 
                                       f32_4 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_2 %128 = OpFMul %125 %127 
                               Output f32_4* %130 = OpAccessChain %123 %38 
                                       f32_4 %131 = OpLoad %130 
                                       f32_4 %132 = OpVectorShuffle %131 %128 4 5 2 3 
                                                      OpStore %130 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                               Output f32_4* %135 = OpAccessChain %123 %38 
                                       f32_4 %136 = OpLoad %135 
                                       f32_4 %137 = OpVectorShuffle %136 %134 0 1 4 5 
                                                      OpStore %135 %137 
                                       f32_4 %139 = OpLoad %138 
                              Uniform f32_4* %141 = OpAccessChain %21 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %139 %142 
                                                      OpStore %9 %143 
                                       f32_4 %144 = OpLoad %9 
                              Uniform f32_4* %145 = OpAccessChain %21 %55 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpFMul %144 %146 
                                                      OpStore %9 %147 
                                       f32_4 %149 = OpLoad %9 
                                                      OpStore %148 %149 
                                       f32_2 %154 = OpLoad %153 
                                                      OpStore vs_TEXCOORD0 %154 
                                 Output f32* %156 = OpAccessChain %123 %38 %119 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                 Output f32* %159 = OpAccessChain %123 %38 %119 
                                                      OpStore %159 %158 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 49
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 %32 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 Location 32 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypePointer Input %7 
                        Input f32_4* %28 = OpVariable Input 
                                     %31 = OpTypePointer Output %7 
                       Output f32_4* %32 = OpVariable Output 
                                     %33 = OpTypeVector %6 3 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 3 
                                     %43 = OpTypePointer Private %6 
                                     %46 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_4 %29 = OpLoad %28 
                               f32_4 %30 = OpFMul %26 %29 
                                             OpStore %25 %30 
                               f32_4 %34 = OpLoad %25 
                               f32_3 %35 = OpVectorShuffle %34 %34 3 3 3 
                               f32_4 %36 = OpLoad %25 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                               f32_3 %38 = OpFMul %35 %37 
                               f32_4 %39 = OpLoad %32 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %32 %40 
                        Private f32* %44 = OpAccessChain %25 %42 
                                 f32 %45 = OpLoad %44 
                         Output f32* %47 = OpAccessChain %32 %42 
                                             OpStore %47 %45 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %123 %138 %148 %151 %153 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %121 0 BuiltIn 121 
                                                      OpMemberDecorate %121 1 BuiltIn 121 
                                                      OpMemberDecorate %121 2 BuiltIn 121 
                                                      OpDecorate %121 Block 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate vs_TEXCOORD0 Location 151 
                                                      OpDecorate %153 Location 153 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 1 
                                              %34 = OpTypePointer Uniform %7 
                                          i32 %38 = OpConstant 0 
                                          i32 %46 = OpConstant 2 
                                          i32 %55 = OpConstant 3 
                                          f32 %95 = OpConstant 3.674022E-40 
                                        f32_2 %96 = OpConstantComposite %95 %95 
                                         u32 %119 = OpConstant 1 
                                             %120 = OpTypeArray %6 %119 
                                             %121 = OpTypeStruct %7 %6 %120 
                                             %122 = OpTypePointer Output %121 
        Output struct {f32_4; f32; f32[1];}* %123 = OpVariable Output 
                                             %129 = OpTypePointer Output %7 
                                Input f32_4* %138 = OpVariable Input 
                                         i32 %140 = OpConstant 5 
                               Output f32_4* %148 = OpVariable Output 
                                             %150 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %152 = OpTypePointer Input %12 
                                Input f32_2* %153 = OpVariable Input 
                                             %155 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %21 %33 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpFMul %32 %36 
                                                      OpStore %30 %37 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %56 = OpAccessChain %21 %33 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFAdd %54 %57 
                                                      OpStore %9 %58 
                                        f32_4 %59 = OpLoad %9 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %21 %46 %33 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpFMul %60 %62 
                                                      OpStore %30 %63 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %38 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpVectorShuffle %66 %66 0 0 0 0 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %30 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %30 %70 
                               Uniform f32_4* %71 = OpAccessChain %21 %46 %46 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_4 %74 = OpVectorShuffle %73 %73 2 2 2 2 
                                        f32_4 %75 = OpFMul %72 %74 
                                        f32_4 %76 = OpLoad %30 
                                        f32_4 %77 = OpFAdd %75 %76 
                                                      OpStore %30 %77 
                               Uniform f32_4* %78 = OpAccessChain %21 %46 %55 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %80 3 3 3 3 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %30 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpLoad %9 
                                        f32_2 %88 = OpVectorShuffle %87 %87 3 3 
                                        f32_2 %89 = OpFDiv %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                      OpStore %9 %91 
                               Uniform f32_4* %92 = OpAccessChain %21 %38 
                                        f32_4 %93 = OpLoad %92 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                        f32_2 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %30 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %30 %99 
                                       f32_4 %100 = OpLoad %9 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_4 %102 = OpLoad %30 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                                       f32_4 %107 = OpLoad %9 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpExtInst %1 2 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                      OpStore %9 %111 
                                       f32_4 %112 = OpLoad %9 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %30 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                       f32_2 %116 = OpFDiv %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 2 3 
                                                      OpStore %9 %118 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 3 3 
                                       f32_4 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_2 %128 = OpFMul %125 %127 
                               Output f32_4* %130 = OpAccessChain %123 %38 
                                       f32_4 %131 = OpLoad %130 
                                       f32_4 %132 = OpVectorShuffle %131 %128 4 5 2 3 
                                                      OpStore %130 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                               Output f32_4* %135 = OpAccessChain %123 %38 
                                       f32_4 %136 = OpLoad %135 
                                       f32_4 %137 = OpVectorShuffle %136 %134 0 1 4 5 
                                                      OpStore %135 %137 
                                       f32_4 %139 = OpLoad %138 
                              Uniform f32_4* %141 = OpAccessChain %21 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %139 %142 
                                                      OpStore %9 %143 
                                       f32_4 %144 = OpLoad %9 
                              Uniform f32_4* %145 = OpAccessChain %21 %55 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpFMul %144 %146 
                                                      OpStore %9 %147 
                                       f32_4 %149 = OpLoad %9 
                                                      OpStore %148 %149 
                                       f32_2 %154 = OpLoad %153 
                                                      OpStore vs_TEXCOORD0 %154 
                                 Output f32* %156 = OpAccessChain %123 %38 %119 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                 Output f32* %159 = OpAccessChain %123 %38 %119 
                                                      OpStore %159 %158 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 49
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 %32 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 Location 32 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypePointer Input %7 
                        Input f32_4* %28 = OpVariable Input 
                                     %31 = OpTypePointer Output %7 
                       Output f32_4* %32 = OpVariable Output 
                                     %33 = OpTypeVector %6 3 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 3 
                                     %43 = OpTypePointer Private %6 
                                     %46 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                               f32_4 %29 = OpLoad %28 
                               f32_4 %30 = OpFMul %26 %29 
                                             OpStore %25 %30 
                               f32_4 %34 = OpLoad %25 
                               f32_3 %35 = OpVectorShuffle %34 %34 3 3 3 
                               f32_4 %36 = OpLoad %25 
                               f32_3 %37 = OpVectorShuffle %36 %36 0 1 2 
                               f32_3 %38 = OpFMul %35 %37 
                               f32_4 %39 = OpLoad %32 
                               f32_4 %40 = OpVectorShuffle %39 %38 4 5 6 3 
                                             OpStore %32 %40 
                        Private f32* %44 = OpAccessChain %25 %42 
                                 f32 %45 = OpLoad %44 
                         Output f32* %47 = OpAccessChain %32 %42 
                                             OpStore %47 %45 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
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
uniform 	float _EnableExternalAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
void main()
{
    u_xlat16_0.x = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0.x + (-u_xlat1.w);
    u_xlat1.w = _EnableExternalAlpha * u_xlat0 + u_xlat1.w;
    u_xlat16_0 = u_xlat1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
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
uniform 	float _EnableExternalAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
void main()
{
    u_xlat16_0.x = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0.x + (-u_xlat1.w);
    u_xlat1.w = _EnableExternalAlpha * u_xlat0 + u_xlat1.w;
    u_xlat16_0 = u_xlat1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
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
uniform 	float _EnableExternalAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
void main()
{
    u_xlat16_0.x = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0.x + (-u_xlat1.w);
    u_xlat1.w = _EnableExternalAlpha * u_xlat0 + u_xlat1.w;
    u_xlat16_0 = u_xlat1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 114
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %91 %101 %104 %106 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate vs_TEXCOORD0 Location 104 
                                                      OpDecorate %106 Location 106 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 0 
                                          i32 %34 = OpConstant 1 
                                              %35 = OpTypePointer Uniform %7 
                                          i32 %46 = OpConstant 2 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                 Input f32_4* %91 = OpVariable Input 
                                          i32 %93 = OpConstant 4 
                               Output f32_4* %101 = OpVariable Output 
                                             %103 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %105 = OpTypePointer Input %12 
                                Input f32_2* %106 = OpVariable Input 
                                             %108 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %21 %33 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpFMul %32 %37 
                                                      OpStore %30 %38 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %33 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %55 = OpAccessChain %21 %33 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFAdd %54 %56 
                                                      OpStore %9 %57 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %34 %34 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %30 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %34 %33 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %30 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %30 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %34 %46 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %30 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %30 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %34 %23 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %30 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %33 
                                                      OpStore %90 %88 
                                        f32_4 %92 = OpLoad %91 
                               Uniform f32_4* %94 = OpAccessChain %21 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpFMul %92 %95 
                                                      OpStore %9 %96 
                                        f32_4 %97 = OpLoad %9 
                               Uniform f32_4* %98 = OpAccessChain %21 %46 
                                        f32_4 %99 = OpLoad %98 
                                       f32_4 %100 = OpFMul %97 %99 
                                                      OpStore %9 %100 
                                       f32_4 %102 = OpLoad %9 
                                                      OpStore %101 %102 
                                       f32_2 %107 = OpLoad %106 
                                                      OpStore vs_TEXCOORD0 %107 
                                 Output f32* %109 = OpAccessChain %81 %33 %77 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                 Output f32* %112 = OpAccessChain %81 %33 %77 
                                                      OpStore %112 %111 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 79
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %61 %65 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
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
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpMemberDecorate %44 0 Offset 44 
                                             OpDecorate %44 Block 
                                             OpDecorate %46 DescriptorSet 46 
                                             OpDecorate %46 Binding 46 
                                             OpDecorate %58 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                             OpDecorate %61 Location 61 
                                             OpDecorate %62 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %65 Location 65 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %69 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %75 RelaxedPrecision 
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
                                 u32 %26 = OpConstant 0 
                                     %28 = OpTypePointer Private %23 
                      Private f32_4* %29 = OpVariable Private 
UniformConstant read_only Texture2D* %30 = OpVariable UniformConstant 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                        Private f32* %37 = OpVariable Private 
                                 u32 %39 = OpConstant 3 
                                     %44 = OpTypeStruct %6 
                                     %45 = OpTypePointer Uniform %44 
              Uniform struct {f32;}* %46 = OpVariable Uniform 
                                     %47 = OpTypeInt 32 1 
                                 i32 %48 = OpConstant 0 
                                     %49 = OpTypePointer Uniform %6 
                      Private f32_4* %58 = OpVariable Private 
                                     %60 = OpTypePointer Input %23 
                        Input f32_4* %61 = OpVariable Input 
                                     %64 = OpTypePointer Output %23 
                       Output f32_4* %65 = OpVariable Output 
                                     %66 = OpTypeVector %6 3 
                                     %76 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %31 = OpLoad %30 
                             sampler %33 = OpLoad %32 
          read_only Texture2DSampled %34 = OpSampledImage %31 %33 
                               f32_2 %35 = OpLoad vs_TEXCOORD0 
                               f32_4 %36 = OpImageSampleImplicitLod %34 %35 
                                             OpStore %29 %36 
                                 f32 %38 = OpLoad %8 
                        Private f32* %40 = OpAccessChain %29 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFNegate %41 
                                 f32 %43 = OpFAdd %38 %42 
                                             OpStore %37 %43 
                        Uniform f32* %50 = OpAccessChain %46 %48 
                                 f32 %51 = OpLoad %50 
                                 f32 %52 = OpLoad %37 
                                 f32 %53 = OpFMul %51 %52 
                        Private f32* %54 = OpAccessChain %29 %39 
                                 f32 %55 = OpLoad %54 
                                 f32 %56 = OpFAdd %53 %55 
                        Private f32* %57 = OpAccessChain %29 %39 
                                             OpStore %57 %56 
                               f32_4 %59 = OpLoad %29 
                               f32_4 %62 = OpLoad %61 
                               f32_4 %63 = OpFMul %59 %62 
                                             OpStore %58 %63 
                               f32_4 %67 = OpLoad %58 
                               f32_3 %68 = OpVectorShuffle %67 %67 3 3 3 
                               f32_4 %69 = OpLoad %58 
                               f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               f32_3 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %65 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                             OpStore %65 %73 
                        Private f32* %74 = OpAccessChain %58 %39 
                                 f32 %75 = OpLoad %74 
                         Output f32* %77 = OpAccessChain %65 %39 
                                             OpStore %77 %75 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 114
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %91 %101 %104 %106 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate vs_TEXCOORD0 Location 104 
                                                      OpDecorate %106 Location 106 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 0 
                                          i32 %34 = OpConstant 1 
                                              %35 = OpTypePointer Uniform %7 
                                          i32 %46 = OpConstant 2 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                 Input f32_4* %91 = OpVariable Input 
                                          i32 %93 = OpConstant 4 
                               Output f32_4* %101 = OpVariable Output 
                                             %103 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %105 = OpTypePointer Input %12 
                                Input f32_2* %106 = OpVariable Input 
                                             %108 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %21 %33 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpFMul %32 %37 
                                                      OpStore %30 %38 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %33 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %55 = OpAccessChain %21 %33 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFAdd %54 %56 
                                                      OpStore %9 %57 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %34 %34 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %30 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %34 %33 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %30 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %30 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %34 %46 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %30 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %30 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %34 %23 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %30 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %33 
                                                      OpStore %90 %88 
                                        f32_4 %92 = OpLoad %91 
                               Uniform f32_4* %94 = OpAccessChain %21 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpFMul %92 %95 
                                                      OpStore %9 %96 
                                        f32_4 %97 = OpLoad %9 
                               Uniform f32_4* %98 = OpAccessChain %21 %46 
                                        f32_4 %99 = OpLoad %98 
                                       f32_4 %100 = OpFMul %97 %99 
                                                      OpStore %9 %100 
                                       f32_4 %102 = OpLoad %9 
                                                      OpStore %101 %102 
                                       f32_2 %107 = OpLoad %106 
                                                      OpStore vs_TEXCOORD0 %107 
                                 Output f32* %109 = OpAccessChain %81 %33 %77 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                 Output f32* %112 = OpAccessChain %81 %33 %77 
                                                      OpStore %112 %111 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 79
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %61 %65 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
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
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpMemberDecorate %44 0 Offset 44 
                                             OpDecorate %44 Block 
                                             OpDecorate %46 DescriptorSet 46 
                                             OpDecorate %46 Binding 46 
                                             OpDecorate %58 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                             OpDecorate %61 Location 61 
                                             OpDecorate %62 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %65 Location 65 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %69 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %75 RelaxedPrecision 
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
                                 u32 %26 = OpConstant 0 
                                     %28 = OpTypePointer Private %23 
                      Private f32_4* %29 = OpVariable Private 
UniformConstant read_only Texture2D* %30 = OpVariable UniformConstant 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                        Private f32* %37 = OpVariable Private 
                                 u32 %39 = OpConstant 3 
                                     %44 = OpTypeStruct %6 
                                     %45 = OpTypePointer Uniform %44 
              Uniform struct {f32;}* %46 = OpVariable Uniform 
                                     %47 = OpTypeInt 32 1 
                                 i32 %48 = OpConstant 0 
                                     %49 = OpTypePointer Uniform %6 
                      Private f32_4* %58 = OpVariable Private 
                                     %60 = OpTypePointer Input %23 
                        Input f32_4* %61 = OpVariable Input 
                                     %64 = OpTypePointer Output %23 
                       Output f32_4* %65 = OpVariable Output 
                                     %66 = OpTypeVector %6 3 
                                     %76 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %31 = OpLoad %30 
                             sampler %33 = OpLoad %32 
          read_only Texture2DSampled %34 = OpSampledImage %31 %33 
                               f32_2 %35 = OpLoad vs_TEXCOORD0 
                               f32_4 %36 = OpImageSampleImplicitLod %34 %35 
                                             OpStore %29 %36 
                                 f32 %38 = OpLoad %8 
                        Private f32* %40 = OpAccessChain %29 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFNegate %41 
                                 f32 %43 = OpFAdd %38 %42 
                                             OpStore %37 %43 
                        Uniform f32* %50 = OpAccessChain %46 %48 
                                 f32 %51 = OpLoad %50 
                                 f32 %52 = OpLoad %37 
                                 f32 %53 = OpFMul %51 %52 
                        Private f32* %54 = OpAccessChain %29 %39 
                                 f32 %55 = OpLoad %54 
                                 f32 %56 = OpFAdd %53 %55 
                        Private f32* %57 = OpAccessChain %29 %39 
                                             OpStore %57 %56 
                               f32_4 %59 = OpLoad %29 
                               f32_4 %62 = OpLoad %61 
                               f32_4 %63 = OpFMul %59 %62 
                                             OpStore %58 %63 
                               f32_4 %67 = OpLoad %58 
                               f32_3 %68 = OpVectorShuffle %67 %67 3 3 3 
                               f32_4 %69 = OpLoad %58 
                               f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               f32_3 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %65 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                             OpStore %65 %73 
                        Private f32* %74 = OpAccessChain %58 %39 
                                 f32 %75 = OpLoad %74 
                         Output f32* %77 = OpAccessChain %65 %39 
                                             OpStore %77 %75 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 114
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %81 %91 %101 %104 %106 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %79 0 BuiltIn 79 
                                                      OpMemberDecorate %79 1 BuiltIn 79 
                                                      OpMemberDecorate %79 2 BuiltIn 79 
                                                      OpDecorate %79 Block 
                                                      OpDecorate %91 Location 91 
                                                      OpDecorate %95 RelaxedPrecision 
                                                      OpDecorate %99 RelaxedPrecision 
                                                      OpDecorate %101 RelaxedPrecision 
                                                      OpDecorate %101 Location 101 
                                                      OpDecorate vs_TEXCOORD0 Location 104 
                                                      OpDecorate %106 Location 106 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 0 
                                          i32 %34 = OpConstant 1 
                                              %35 = OpTypePointer Uniform %7 
                                          i32 %46 = OpConstant 2 
                                          u32 %77 = OpConstant 1 
                                              %78 = OpTypeArray %6 %77 
                                              %79 = OpTypeStruct %7 %6 %78 
                                              %80 = OpTypePointer Output %79 
         Output struct {f32_4; f32; f32[1];}* %81 = OpVariable Output 
                                              %89 = OpTypePointer Output %7 
                                 Input f32_4* %91 = OpVariable Input 
                                          i32 %93 = OpConstant 4 
                               Output f32_4* %101 = OpVariable Output 
                                             %103 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %105 = OpTypePointer Input %12 
                                Input f32_2* %106 = OpVariable Input 
                                             %108 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %36 = OpAccessChain %21 %33 %34 
                                        f32_4 %37 = OpLoad %36 
                                        f32_4 %38 = OpFMul %32 %37 
                                                      OpStore %30 %38 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %33 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %55 = OpAccessChain %21 %33 %23 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpFAdd %54 %56 
                                                      OpStore %9 %57 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 1 1 1 1 
                               Uniform f32_4* %60 = OpAccessChain %21 %34 %34 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpFMul %59 %61 
                                                      OpStore %30 %62 
                               Uniform f32_4* %63 = OpAccessChain %21 %34 %33 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %30 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %30 %69 
                               Uniform f32_4* %70 = OpAccessChain %21 %34 %46 
                                        f32_4 %71 = OpLoad %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpVectorShuffle %72 %72 2 2 2 2 
                                        f32_4 %74 = OpFMul %71 %73 
                                        f32_4 %75 = OpLoad %30 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %30 %76 
                               Uniform f32_4* %82 = OpAccessChain %21 %34 %23 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 3 3 3 3 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %30 
                                        f32_4 %88 = OpFAdd %86 %87 
                                Output f32_4* %90 = OpAccessChain %81 %33 
                                                      OpStore %90 %88 
                                        f32_4 %92 = OpLoad %91 
                               Uniform f32_4* %94 = OpAccessChain %21 %93 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpFMul %92 %95 
                                                      OpStore %9 %96 
                                        f32_4 %97 = OpLoad %9 
                               Uniform f32_4* %98 = OpAccessChain %21 %46 
                                        f32_4 %99 = OpLoad %98 
                                       f32_4 %100 = OpFMul %97 %99 
                                                      OpStore %9 %100 
                                       f32_4 %102 = OpLoad %9 
                                                      OpStore %101 %102 
                                       f32_2 %107 = OpLoad %106 
                                                      OpStore vs_TEXCOORD0 %107 
                                 Output f32* %109 = OpAccessChain %81 %33 %77 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFNegate %110 
                                 Output f32* %112 = OpAccessChain %81 %33 %77 
                                                      OpStore %112 %111 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 79
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %61 %65 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
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
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpMemberDecorate %44 0 Offset 44 
                                             OpDecorate %44 Block 
                                             OpDecorate %46 DescriptorSet 46 
                                             OpDecorate %46 Binding 46 
                                             OpDecorate %58 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                             OpDecorate %61 Location 61 
                                             OpDecorate %62 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %65 Location 65 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %69 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %75 RelaxedPrecision 
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
                                 u32 %26 = OpConstant 0 
                                     %28 = OpTypePointer Private %23 
                      Private f32_4* %29 = OpVariable Private 
UniformConstant read_only Texture2D* %30 = OpVariable UniformConstant 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                        Private f32* %37 = OpVariable Private 
                                 u32 %39 = OpConstant 3 
                                     %44 = OpTypeStruct %6 
                                     %45 = OpTypePointer Uniform %44 
              Uniform struct {f32;}* %46 = OpVariable Uniform 
                                     %47 = OpTypeInt 32 1 
                                 i32 %48 = OpConstant 0 
                                     %49 = OpTypePointer Uniform %6 
                      Private f32_4* %58 = OpVariable Private 
                                     %60 = OpTypePointer Input %23 
                        Input f32_4* %61 = OpVariable Input 
                                     %64 = OpTypePointer Output %23 
                       Output f32_4* %65 = OpVariable Output 
                                     %66 = OpTypeVector %6 3 
                                     %76 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %31 = OpLoad %30 
                             sampler %33 = OpLoad %32 
          read_only Texture2DSampled %34 = OpSampledImage %31 %33 
                               f32_2 %35 = OpLoad vs_TEXCOORD0 
                               f32_4 %36 = OpImageSampleImplicitLod %34 %35 
                                             OpStore %29 %36 
                                 f32 %38 = OpLoad %8 
                        Private f32* %40 = OpAccessChain %29 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFNegate %41 
                                 f32 %43 = OpFAdd %38 %42 
                                             OpStore %37 %43 
                        Uniform f32* %50 = OpAccessChain %46 %48 
                                 f32 %51 = OpLoad %50 
                                 f32 %52 = OpLoad %37 
                                 f32 %53 = OpFMul %51 %52 
                        Private f32* %54 = OpAccessChain %29 %39 
                                 f32 %55 = OpLoad %54 
                                 f32 %56 = OpFAdd %53 %55 
                        Private f32* %57 = OpAccessChain %29 %39 
                                             OpStore %57 %56 
                               f32_4 %59 = OpLoad %29 
                               f32_4 %62 = OpLoad %61 
                               f32_4 %63 = OpFMul %59 %62 
                                             OpStore %58 %63 
                               f32_4 %67 = OpLoad %58 
                               f32_3 %68 = OpVectorShuffle %67 %67 3 3 3 
                               f32_4 %69 = OpLoad %58 
                               f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               f32_3 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %65 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                             OpStore %65 %73 
                        Private f32* %74 = OpAccessChain %58 %39 
                                 f32 %75 = OpLoad %74 
                         Output f32* %77 = OpAccessChain %65 %39 
                                             OpStore %77 %75 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
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
uniform 	float _EnableExternalAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
void main()
{
    u_xlat16_0.x = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0.x + (-u_xlat1.w);
    u_xlat1.w = _EnableExternalAlpha * u_xlat0 + u_xlat1.w;
    u_xlat16_0 = u_xlat1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
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
uniform 	float _EnableExternalAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
void main()
{
    u_xlat16_0.x = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0.x + (-u_xlat1.w);
    u_xlat1.w = _EnableExternalAlpha * u_xlat0 + u_xlat1.w;
    u_xlat16_0 = u_xlat1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _RendererColor;
uniform 	mediump vec2 _Flip;
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xy = in_POSITION0.xy * _Flip.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
    u_xlat0 = in_COLOR0 * _Color;
    u_xlat0 = u_xlat0 * _RendererColor;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
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
uniform 	float _EnableExternalAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
void main()
{
    u_xlat16_0.x = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0.x + (-u_xlat1.w);
    u_xlat1.w = _EnableExternalAlpha * u_xlat0 + u_xlat1.w;
    u_xlat16_0 = u_xlat1 * vs_COLOR0;
    SV_Target0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    SV_Target0.w = u_xlat16_0.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %123 %138 %148 %151 %153 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %121 0 BuiltIn 121 
                                                      OpMemberDecorate %121 1 BuiltIn 121 
                                                      OpMemberDecorate %121 2 BuiltIn 121 
                                                      OpDecorate %121 Block 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate vs_TEXCOORD0 Location 151 
                                                      OpDecorate %153 Location 153 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 1 
                                              %34 = OpTypePointer Uniform %7 
                                          i32 %38 = OpConstant 0 
                                          i32 %46 = OpConstant 2 
                                          i32 %55 = OpConstant 3 
                                          f32 %95 = OpConstant 3.674022E-40 
                                        f32_2 %96 = OpConstantComposite %95 %95 
                                         u32 %119 = OpConstant 1 
                                             %120 = OpTypeArray %6 %119 
                                             %121 = OpTypeStruct %7 %6 %120 
                                             %122 = OpTypePointer Output %121 
        Output struct {f32_4; f32; f32[1];}* %123 = OpVariable Output 
                                             %129 = OpTypePointer Output %7 
                                Input f32_4* %138 = OpVariable Input 
                                         i32 %140 = OpConstant 5 
                               Output f32_4* %148 = OpVariable Output 
                                             %150 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %152 = OpTypePointer Input %12 
                                Input f32_2* %153 = OpVariable Input 
                                             %155 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %21 %33 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpFMul %32 %36 
                                                      OpStore %30 %37 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %56 = OpAccessChain %21 %33 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFAdd %54 %57 
                                                      OpStore %9 %58 
                                        f32_4 %59 = OpLoad %9 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %21 %46 %33 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpFMul %60 %62 
                                                      OpStore %30 %63 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %38 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpVectorShuffle %66 %66 0 0 0 0 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %30 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %30 %70 
                               Uniform f32_4* %71 = OpAccessChain %21 %46 %46 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_4 %74 = OpVectorShuffle %73 %73 2 2 2 2 
                                        f32_4 %75 = OpFMul %72 %74 
                                        f32_4 %76 = OpLoad %30 
                                        f32_4 %77 = OpFAdd %75 %76 
                                                      OpStore %30 %77 
                               Uniform f32_4* %78 = OpAccessChain %21 %46 %55 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %80 3 3 3 3 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %30 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpLoad %9 
                                        f32_2 %88 = OpVectorShuffle %87 %87 3 3 
                                        f32_2 %89 = OpFDiv %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                      OpStore %9 %91 
                               Uniform f32_4* %92 = OpAccessChain %21 %38 
                                        f32_4 %93 = OpLoad %92 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                        f32_2 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %30 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %30 %99 
                                       f32_4 %100 = OpLoad %9 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_4 %102 = OpLoad %30 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                                       f32_4 %107 = OpLoad %9 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpExtInst %1 2 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                      OpStore %9 %111 
                                       f32_4 %112 = OpLoad %9 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %30 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                       f32_2 %116 = OpFDiv %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 2 3 
                                                      OpStore %9 %118 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 3 3 
                                       f32_4 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_2 %128 = OpFMul %125 %127 
                               Output f32_4* %130 = OpAccessChain %123 %38 
                                       f32_4 %131 = OpLoad %130 
                                       f32_4 %132 = OpVectorShuffle %131 %128 4 5 2 3 
                                                      OpStore %130 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                               Output f32_4* %135 = OpAccessChain %123 %38 
                                       f32_4 %136 = OpLoad %135 
                                       f32_4 %137 = OpVectorShuffle %136 %134 0 1 4 5 
                                                      OpStore %135 %137 
                                       f32_4 %139 = OpLoad %138 
                              Uniform f32_4* %141 = OpAccessChain %21 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %139 %142 
                                                      OpStore %9 %143 
                                       f32_4 %144 = OpLoad %9 
                              Uniform f32_4* %145 = OpAccessChain %21 %55 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpFMul %144 %146 
                                                      OpStore %9 %147 
                                       f32_4 %149 = OpLoad %9 
                                                      OpStore %148 %149 
                                       f32_2 %154 = OpLoad %153 
                                                      OpStore vs_TEXCOORD0 %154 
                                 Output f32* %156 = OpAccessChain %123 %38 %119 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                 Output f32* %159 = OpAccessChain %123 %38 %119 
                                                      OpStore %159 %158 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 79
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %61 %65 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
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
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpMemberDecorate %44 0 Offset 44 
                                             OpDecorate %44 Block 
                                             OpDecorate %46 DescriptorSet 46 
                                             OpDecorate %46 Binding 46 
                                             OpDecorate %58 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                             OpDecorate %61 Location 61 
                                             OpDecorate %62 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %65 Location 65 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %69 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %75 RelaxedPrecision 
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
                                 u32 %26 = OpConstant 0 
                                     %28 = OpTypePointer Private %23 
                      Private f32_4* %29 = OpVariable Private 
UniformConstant read_only Texture2D* %30 = OpVariable UniformConstant 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                        Private f32* %37 = OpVariable Private 
                                 u32 %39 = OpConstant 3 
                                     %44 = OpTypeStruct %6 
                                     %45 = OpTypePointer Uniform %44 
              Uniform struct {f32;}* %46 = OpVariable Uniform 
                                     %47 = OpTypeInt 32 1 
                                 i32 %48 = OpConstant 0 
                                     %49 = OpTypePointer Uniform %6 
                      Private f32_4* %58 = OpVariable Private 
                                     %60 = OpTypePointer Input %23 
                        Input f32_4* %61 = OpVariable Input 
                                     %64 = OpTypePointer Output %23 
                       Output f32_4* %65 = OpVariable Output 
                                     %66 = OpTypeVector %6 3 
                                     %76 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %31 = OpLoad %30 
                             sampler %33 = OpLoad %32 
          read_only Texture2DSampled %34 = OpSampledImage %31 %33 
                               f32_2 %35 = OpLoad vs_TEXCOORD0 
                               f32_4 %36 = OpImageSampleImplicitLod %34 %35 
                                             OpStore %29 %36 
                                 f32 %38 = OpLoad %8 
                        Private f32* %40 = OpAccessChain %29 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFNegate %41 
                                 f32 %43 = OpFAdd %38 %42 
                                             OpStore %37 %43 
                        Uniform f32* %50 = OpAccessChain %46 %48 
                                 f32 %51 = OpLoad %50 
                                 f32 %52 = OpLoad %37 
                                 f32 %53 = OpFMul %51 %52 
                        Private f32* %54 = OpAccessChain %29 %39 
                                 f32 %55 = OpLoad %54 
                                 f32 %56 = OpFAdd %53 %55 
                        Private f32* %57 = OpAccessChain %29 %39 
                                             OpStore %57 %56 
                               f32_4 %59 = OpLoad %29 
                               f32_4 %62 = OpLoad %61 
                               f32_4 %63 = OpFMul %59 %62 
                                             OpStore %58 %63 
                               f32_4 %67 = OpLoad %58 
                               f32_3 %68 = OpVectorShuffle %67 %67 3 3 3 
                               f32_4 %69 = OpLoad %58 
                               f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               f32_3 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %65 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                             OpStore %65 %73 
                        Private f32* %74 = OpAccessChain %58 %39 
                                 f32 %75 = OpLoad %74 
                         Output f32* %77 = OpAccessChain %65 %39 
                                             OpStore %77 %75 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %123 %138 %148 %151 %153 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %121 0 BuiltIn 121 
                                                      OpMemberDecorate %121 1 BuiltIn 121 
                                                      OpMemberDecorate %121 2 BuiltIn 121 
                                                      OpDecorate %121 Block 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate vs_TEXCOORD0 Location 151 
                                                      OpDecorate %153 Location 153 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 1 
                                              %34 = OpTypePointer Uniform %7 
                                          i32 %38 = OpConstant 0 
                                          i32 %46 = OpConstant 2 
                                          i32 %55 = OpConstant 3 
                                          f32 %95 = OpConstant 3.674022E-40 
                                        f32_2 %96 = OpConstantComposite %95 %95 
                                         u32 %119 = OpConstant 1 
                                             %120 = OpTypeArray %6 %119 
                                             %121 = OpTypeStruct %7 %6 %120 
                                             %122 = OpTypePointer Output %121 
        Output struct {f32_4; f32; f32[1];}* %123 = OpVariable Output 
                                             %129 = OpTypePointer Output %7 
                                Input f32_4* %138 = OpVariable Input 
                                         i32 %140 = OpConstant 5 
                               Output f32_4* %148 = OpVariable Output 
                                             %150 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %152 = OpTypePointer Input %12 
                                Input f32_2* %153 = OpVariable Input 
                                             %155 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %21 %33 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpFMul %32 %36 
                                                      OpStore %30 %37 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %56 = OpAccessChain %21 %33 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFAdd %54 %57 
                                                      OpStore %9 %58 
                                        f32_4 %59 = OpLoad %9 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %21 %46 %33 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpFMul %60 %62 
                                                      OpStore %30 %63 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %38 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpVectorShuffle %66 %66 0 0 0 0 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %30 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %30 %70 
                               Uniform f32_4* %71 = OpAccessChain %21 %46 %46 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_4 %74 = OpVectorShuffle %73 %73 2 2 2 2 
                                        f32_4 %75 = OpFMul %72 %74 
                                        f32_4 %76 = OpLoad %30 
                                        f32_4 %77 = OpFAdd %75 %76 
                                                      OpStore %30 %77 
                               Uniform f32_4* %78 = OpAccessChain %21 %46 %55 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %80 3 3 3 3 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %30 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpLoad %9 
                                        f32_2 %88 = OpVectorShuffle %87 %87 3 3 
                                        f32_2 %89 = OpFDiv %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                      OpStore %9 %91 
                               Uniform f32_4* %92 = OpAccessChain %21 %38 
                                        f32_4 %93 = OpLoad %92 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                        f32_2 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %30 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %30 %99 
                                       f32_4 %100 = OpLoad %9 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_4 %102 = OpLoad %30 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                                       f32_4 %107 = OpLoad %9 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpExtInst %1 2 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                      OpStore %9 %111 
                                       f32_4 %112 = OpLoad %9 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %30 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                       f32_2 %116 = OpFDiv %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 2 3 
                                                      OpStore %9 %118 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 3 3 
                                       f32_4 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_2 %128 = OpFMul %125 %127 
                               Output f32_4* %130 = OpAccessChain %123 %38 
                                       f32_4 %131 = OpLoad %130 
                                       f32_4 %132 = OpVectorShuffle %131 %128 4 5 2 3 
                                                      OpStore %130 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                               Output f32_4* %135 = OpAccessChain %123 %38 
                                       f32_4 %136 = OpLoad %135 
                                       f32_4 %137 = OpVectorShuffle %136 %134 0 1 4 5 
                                                      OpStore %135 %137 
                                       f32_4 %139 = OpLoad %138 
                              Uniform f32_4* %141 = OpAccessChain %21 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %139 %142 
                                                      OpStore %9 %143 
                                       f32_4 %144 = OpLoad %9 
                              Uniform f32_4* %145 = OpAccessChain %21 %55 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpFMul %144 %146 
                                                      OpStore %9 %147 
                                       f32_4 %149 = OpLoad %9 
                                                      OpStore %148 %149 
                                       f32_2 %154 = OpLoad %153 
                                                      OpStore vs_TEXCOORD0 %154 
                                 Output f32* %156 = OpAccessChain %123 %38 %119 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                 Output f32* %159 = OpAccessChain %123 %38 %119 
                                                      OpStore %159 %158 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 79
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %61 %65 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
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
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpMemberDecorate %44 0 Offset 44 
                                             OpDecorate %44 Block 
                                             OpDecorate %46 DescriptorSet 46 
                                             OpDecorate %46 Binding 46 
                                             OpDecorate %58 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                             OpDecorate %61 Location 61 
                                             OpDecorate %62 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %65 Location 65 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %69 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %75 RelaxedPrecision 
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
                                 u32 %26 = OpConstant 0 
                                     %28 = OpTypePointer Private %23 
                      Private f32_4* %29 = OpVariable Private 
UniformConstant read_only Texture2D* %30 = OpVariable UniformConstant 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                        Private f32* %37 = OpVariable Private 
                                 u32 %39 = OpConstant 3 
                                     %44 = OpTypeStruct %6 
                                     %45 = OpTypePointer Uniform %44 
              Uniform struct {f32;}* %46 = OpVariable Uniform 
                                     %47 = OpTypeInt 32 1 
                                 i32 %48 = OpConstant 0 
                                     %49 = OpTypePointer Uniform %6 
                      Private f32_4* %58 = OpVariable Private 
                                     %60 = OpTypePointer Input %23 
                        Input f32_4* %61 = OpVariable Input 
                                     %64 = OpTypePointer Output %23 
                       Output f32_4* %65 = OpVariable Output 
                                     %66 = OpTypeVector %6 3 
                                     %76 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %31 = OpLoad %30 
                             sampler %33 = OpLoad %32 
          read_only Texture2DSampled %34 = OpSampledImage %31 %33 
                               f32_2 %35 = OpLoad vs_TEXCOORD0 
                               f32_4 %36 = OpImageSampleImplicitLod %34 %35 
                                             OpStore %29 %36 
                                 f32 %38 = OpLoad %8 
                        Private f32* %40 = OpAccessChain %29 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFNegate %41 
                                 f32 %43 = OpFAdd %38 %42 
                                             OpStore %37 %43 
                        Uniform f32* %50 = OpAccessChain %46 %48 
                                 f32 %51 = OpLoad %50 
                                 f32 %52 = OpLoad %37 
                                 f32 %53 = OpFMul %51 %52 
                        Private f32* %54 = OpAccessChain %29 %39 
                                 f32 %55 = OpLoad %54 
                                 f32 %56 = OpFAdd %53 %55 
                        Private f32* %57 = OpAccessChain %29 %39 
                                             OpStore %57 %56 
                               f32_4 %59 = OpLoad %29 
                               f32_4 %62 = OpLoad %61 
                               f32_4 %63 = OpFMul %59 %62 
                                             OpStore %58 %63 
                               f32_4 %67 = OpLoad %58 
                               f32_3 %68 = OpVectorShuffle %67 %67 3 3 3 
                               f32_4 %69 = OpLoad %58 
                               f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               f32_3 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %65 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                             OpStore %65 %73 
                        Private f32* %74 = OpAccessChain %58 %39 
                                 f32 %75 = OpLoad %74 
                         Output f32* %77 = OpAccessChain %65 %39 
                                             OpStore %77 %75 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 161
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %123 %138 %148 %151 %153 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 RelaxedPrecision 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 RelaxedPrecision 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpMemberDecorate %121 0 BuiltIn 121 
                                                      OpMemberDecorate %121 1 BuiltIn 121 
                                                      OpMemberDecorate %121 2 BuiltIn 121 
                                                      OpDecorate %121 Block 
                                                      OpDecorate %138 Location 138 
                                                      OpDecorate %142 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %148 RelaxedPrecision 
                                                      OpDecorate %148 Location 148 
                                                      OpDecorate vs_TEXCOORD0 Location 151 
                                                      OpDecorate %153 Location 153 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 2 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %7 %17 %18 %7 %12 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_2; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %12 
                               Private f32_4* %30 = OpVariable Private 
                                          i32 %33 = OpConstant 1 
                                              %34 = OpTypePointer Uniform %7 
                                          i32 %38 = OpConstant 0 
                                          i32 %46 = OpConstant 2 
                                          i32 %55 = OpConstant 3 
                                          f32 %95 = OpConstant 3.674022E-40 
                                        f32_2 %96 = OpConstantComposite %95 %95 
                                         u32 %119 = OpConstant 1 
                                             %120 = OpTypeArray %6 %119 
                                             %121 = OpTypeStruct %7 %6 %120 
                                             %122 = OpTypePointer Output %121 
        Output struct {f32_4; f32; f32[1];}* %123 = OpVariable Output 
                                             %129 = OpTypePointer Output %7 
                                Input f32_4* %138 = OpVariable Input 
                                         i32 %140 = OpConstant 5 
                               Output f32_4* %148 = OpVariable Output 
                                             %150 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %152 = OpTypePointer Input %12 
                                Input f32_2* %153 = OpVariable Input 
                                             %155 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 1 
                               Uniform f32_2* %25 = OpAccessChain %21 %23 
                                        f32_2 %26 = OpLoad %25 
                                        f32_2 %27 = OpFMul %14 %26 
                                        f32_4 %28 = OpLoad %9 
                                        f32_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                                      OpStore %9 %29 
                                        f32_4 %31 = OpLoad %9 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %21 %33 %33 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpFMul %32 %36 
                                                      OpStore %30 %37 
                               Uniform f32_4* %39 = OpAccessChain %21 %33 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %9 
                                        f32_4 %42 = OpVectorShuffle %41 %41 0 0 0 0 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %30 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %47 = OpAccessChain %21 %33 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpLoad %11 
                                        f32_4 %50 = OpVectorShuffle %49 %49 2 2 2 2 
                                        f32_4 %51 = OpFMul %48 %50 
                                        f32_4 %52 = OpLoad %9 
                                        f32_4 %53 = OpFAdd %51 %52 
                                                      OpStore %9 %53 
                                        f32_4 %54 = OpLoad %9 
                               Uniform f32_4* %56 = OpAccessChain %21 %33 %55 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFAdd %54 %57 
                                                      OpStore %9 %58 
                                        f32_4 %59 = OpLoad %9 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                               Uniform f32_4* %61 = OpAccessChain %21 %46 %33 
                                        f32_4 %62 = OpLoad %61 
                                        f32_4 %63 = OpFMul %60 %62 
                                                      OpStore %30 %63 
                               Uniform f32_4* %64 = OpAccessChain %21 %46 %38 
                                        f32_4 %65 = OpLoad %64 
                                        f32_4 %66 = OpLoad %9 
                                        f32_4 %67 = OpVectorShuffle %66 %66 0 0 0 0 
                                        f32_4 %68 = OpFMul %65 %67 
                                        f32_4 %69 = OpLoad %30 
                                        f32_4 %70 = OpFAdd %68 %69 
                                                      OpStore %30 %70 
                               Uniform f32_4* %71 = OpAccessChain %21 %46 %46 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpLoad %9 
                                        f32_4 %74 = OpVectorShuffle %73 %73 2 2 2 2 
                                        f32_4 %75 = OpFMul %72 %74 
                                        f32_4 %76 = OpLoad %30 
                                        f32_4 %77 = OpFAdd %75 %76 
                                                      OpStore %30 %77 
                               Uniform f32_4* %78 = OpAccessChain %21 %46 %55 
                                        f32_4 %79 = OpLoad %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %80 3 3 3 3 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %83 = OpLoad %30 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %9 %84 
                                        f32_4 %85 = OpLoad %9 
                                        f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                        f32_4 %87 = OpLoad %9 
                                        f32_2 %88 = OpVectorShuffle %87 %87 3 3 
                                        f32_2 %89 = OpFDiv %86 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                                      OpStore %9 %91 
                               Uniform f32_4* %92 = OpAccessChain %21 %38 
                                        f32_4 %93 = OpLoad %92 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                        f32_2 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %30 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %30 %99 
                                       f32_4 %100 = OpLoad %9 
                                       f32_2 %101 = OpVectorShuffle %100 %100 0 1 
                                       f32_4 %102 = OpLoad %30 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFMul %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                                       f32_4 %107 = OpLoad %9 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpExtInst %1 2 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                      OpStore %9 %111 
                                       f32_4 %112 = OpLoad %9 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 1 
                                       f32_4 %114 = OpLoad %30 
                                       f32_2 %115 = OpVectorShuffle %114 %114 0 1 
                                       f32_2 %116 = OpFDiv %113 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 5 2 3 
                                                      OpStore %9 %118 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 3 3 
                                       f32_4 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                       f32_2 %128 = OpFMul %125 %127 
                               Output f32_4* %130 = OpAccessChain %123 %38 
                                       f32_4 %131 = OpLoad %130 
                                       f32_4 %132 = OpVectorShuffle %131 %128 4 5 2 3 
                                                      OpStore %130 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 2 3 
                               Output f32_4* %135 = OpAccessChain %123 %38 
                                       f32_4 %136 = OpLoad %135 
                                       f32_4 %137 = OpVectorShuffle %136 %134 0 1 4 5 
                                                      OpStore %135 %137 
                                       f32_4 %139 = OpLoad %138 
                              Uniform f32_4* %141 = OpAccessChain %21 %140 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpFMul %139 %142 
                                                      OpStore %9 %143 
                                       f32_4 %144 = OpLoad %9 
                              Uniform f32_4* %145 = OpAccessChain %21 %55 
                                       f32_4 %146 = OpLoad %145 
                                       f32_4 %147 = OpFMul %144 %146 
                                                      OpStore %9 %147 
                                       f32_4 %149 = OpLoad %9 
                                                      OpStore %148 %149 
                                       f32_2 %154 = OpLoad %153 
                                                      OpStore vs_TEXCOORD0 %154 
                                 Output f32* %156 = OpAccessChain %123 %38 %119 
                                         f32 %157 = OpLoad %156 
                                         f32 %158 = OpFNegate %157 
                                 Output f32* %159 = OpAccessChain %123 %38 %119 
                                                      OpStore %159 %158 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 79
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %61 %65 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
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
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %30 DescriptorSet 30 
                                             OpDecorate %30 Binding 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpMemberDecorate %44 0 Offset 44 
                                             OpDecorate %44 Block 
                                             OpDecorate %46 DescriptorSet 46 
                                             OpDecorate %46 Binding 46 
                                             OpDecorate %58 RelaxedPrecision 
                                             OpDecorate %61 RelaxedPrecision 
                                             OpDecorate %61 Location 61 
                                             OpDecorate %62 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %65 Location 65 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %69 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %75 RelaxedPrecision 
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
                                 u32 %26 = OpConstant 0 
                                     %28 = OpTypePointer Private %23 
                      Private f32_4* %29 = OpVariable Private 
UniformConstant read_only Texture2D* %30 = OpVariable UniformConstant 
            UniformConstant sampler* %32 = OpVariable UniformConstant 
                        Private f32* %37 = OpVariable Private 
                                 u32 %39 = OpConstant 3 
                                     %44 = OpTypeStruct %6 
                                     %45 = OpTypePointer Uniform %44 
              Uniform struct {f32;}* %46 = OpVariable Uniform 
                                     %47 = OpTypeInt 32 1 
                                 i32 %48 = OpConstant 0 
                                     %49 = OpTypePointer Uniform %6 
                      Private f32_4* %58 = OpVariable Private 
                                     %60 = OpTypePointer Input %23 
                        Input f32_4* %61 = OpVariable Input 
                                     %64 = OpTypePointer Output %23 
                       Output f32_4* %65 = OpVariable Output 
                                     %66 = OpTypeVector %6 3 
                                     %76 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %31 = OpLoad %30 
                             sampler %33 = OpLoad %32 
          read_only Texture2DSampled %34 = OpSampledImage %31 %33 
                               f32_2 %35 = OpLoad vs_TEXCOORD0 
                               f32_4 %36 = OpImageSampleImplicitLod %34 %35 
                                             OpStore %29 %36 
                                 f32 %38 = OpLoad %8 
                        Private f32* %40 = OpAccessChain %29 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFNegate %41 
                                 f32 %43 = OpFAdd %38 %42 
                                             OpStore %37 %43 
                        Uniform f32* %50 = OpAccessChain %46 %48 
                                 f32 %51 = OpLoad %50 
                                 f32 %52 = OpLoad %37 
                                 f32 %53 = OpFMul %51 %52 
                        Private f32* %54 = OpAccessChain %29 %39 
                                 f32 %55 = OpLoad %54 
                                 f32 %56 = OpFAdd %53 %55 
                        Private f32* %57 = OpAccessChain %29 %39 
                                             OpStore %57 %56 
                               f32_4 %59 = OpLoad %29 
                               f32_4 %62 = OpLoad %61 
                               f32_4 %63 = OpFMul %59 %62 
                                             OpStore %58 %63 
                               f32_4 %67 = OpLoad %58 
                               f32_3 %68 = OpVectorShuffle %67 %67 3 3 3 
                               f32_4 %69 = OpLoad %58 
                               f32_3 %70 = OpVectorShuffle %69 %69 0 1 2 
                               f32_3 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %65 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                             OpStore %65 %73 
                        Private f32* %74 = OpAccessChain %58 %39 
                                 f32 %75 = OpLoad %74 
                         Output f32* %77 = OpAccessChain %65 %39 
                                             OpStore %77 %75 
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
SubProgram "gles3 hw_tier00 " {
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "vulkan hw_tier00 " {
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
Local Keywords { "PIXELSNAP_ON" }
""
}
}
}
}
}