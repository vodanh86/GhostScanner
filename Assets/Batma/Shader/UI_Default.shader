//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/Default" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_ColorMask ("Color Mask", Float) = 15
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Name "Default"
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask 0 0
  ZTest Off
  ZWrite Off
  Cull Off
  Stencil {
   ReadMask 0
   WriteMask 0
   Comp Disabled
   Pass Keep
   Fail Keep
   ZFail Keep
  }
  GpuProgramID 29562
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 45
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %38 %42 
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
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %38 Location 38 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %42 Location 42 
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
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %37 = OpTypePointer Input %7 
                        Input f32_4* %38 = OpVariable Input 
                                     %41 = OpTypePointer Output %7 
                       Output f32_4* %42 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                               f32_4 %36 = OpLoad %25 
                               f32_4 %39 = OpLoad %38 
                               f32_4 %40 = OpFMul %36 %39 
                                             OpStore %25 %40 
                               f32_4 %43 = OpLoad %25 
                                             OpStore %42 %43 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 45
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %38 %42 
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
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %38 Location 38 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %42 Location 42 
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
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %37 = OpTypePointer Input %7 
                        Input f32_4* %38 = OpVariable Input 
                                     %41 = OpTypePointer Output %7 
                       Output f32_4* %42 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                               f32_4 %36 = OpLoad %25 
                               f32_4 %39 = OpLoad %38 
                               f32_4 %40 = OpFMul %36 %39 
                                             OpStore %25 %40 
                               f32_4 %43 = OpLoad %25 
                                             OpStore %42 %43 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 45
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %38 %42 
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
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %38 Location 38 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %42 Location 42 
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
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %37 = OpTypePointer Input %7 
                        Input f32_4* %38 = OpVariable Input 
                                     %41 = OpTypePointer Output %7 
                       Output f32_4* %42 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                               f32_4 %36 = OpLoad %25 
                               f32_4 %39 = OpLoad %38 
                               f32_4 %40 = OpFMul %36 %39 
                                             OpStore %25 %40 
                               f32_4 %43 = OpLoad %25 
                                             OpStore %42 %43 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 72
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %43 %54 
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
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %43 Location 43 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %54 Location 54 
                                             OpDecorate %59 RelaxedPrecision 
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
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %36 = OpTypePointer Private %6 
                        Private f32* %37 = OpVariable Private 
                                     %38 = OpTypeInt 32 0 
                                 u32 %39 = OpConstant 3 
                                     %42 = OpTypePointer Input %7 
                        Input f32_4* %43 = OpVariable Input 
                                     %44 = OpTypePointer Input %6 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %53 = OpTypePointer Output %7 
                       Output f32_4* %54 = OpVariable Output 
                                     %56 = OpTypeBool 
                                     %57 = OpTypePointer Private %56 
                       Private bool* %58 = OpVariable Private 
                                 f32 %60 = OpConstant 3.674022E-40 
                                 i32 %63 = OpConstant 1 
                                 i32 %65 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                        Private f32* %40 = OpAccessChain %25 %39 
                                 f32 %41 = OpLoad %40 
                          Input f32* %45 = OpAccessChain %43 %39 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFMul %41 %46 
                                 f32 %49 = OpFAdd %47 %48 
                                             OpStore %37 %49 
                               f32_4 %50 = OpLoad %25 
                               f32_4 %51 = OpLoad %43 
                               f32_4 %52 = OpFMul %50 %51 
                                             OpStore %25 %52 
                               f32_4 %55 = OpLoad %25 
                                             OpStore %54 %55 
                                 f32 %59 = OpLoad %37 
                                bool %61 = OpFOrdLessThan %59 %60 
                                             OpStore %58 %61 
                                bool %62 = OpLoad %58 
                                 i32 %64 = OpSelect %62 %63 %31 
                                 i32 %66 = OpIMul %64 %65 
                                bool %67 = OpINotEqual %66 %31 
                                             OpSelectionMerge %69 None 
                                             OpBranchConditional %67 %68 %69 
                                     %68 = OpLabel 
                                             OpKill
                                     %69 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 72
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %43 %54 
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
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %43 Location 43 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %54 Location 54 
                                             OpDecorate %59 RelaxedPrecision 
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
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %36 = OpTypePointer Private %6 
                        Private f32* %37 = OpVariable Private 
                                     %38 = OpTypeInt 32 0 
                                 u32 %39 = OpConstant 3 
                                     %42 = OpTypePointer Input %7 
                        Input f32_4* %43 = OpVariable Input 
                                     %44 = OpTypePointer Input %6 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %53 = OpTypePointer Output %7 
                       Output f32_4* %54 = OpVariable Output 
                                     %56 = OpTypeBool 
                                     %57 = OpTypePointer Private %56 
                       Private bool* %58 = OpVariable Private 
                                 f32 %60 = OpConstant 3.674022E-40 
                                 i32 %63 = OpConstant 1 
                                 i32 %65 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                        Private f32* %40 = OpAccessChain %25 %39 
                                 f32 %41 = OpLoad %40 
                          Input f32* %45 = OpAccessChain %43 %39 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFMul %41 %46 
                                 f32 %49 = OpFAdd %47 %48 
                                             OpStore %37 %49 
                               f32_4 %50 = OpLoad %25 
                               f32_4 %51 = OpLoad %43 
                               f32_4 %52 = OpFMul %50 %51 
                                             OpStore %25 %52 
                               f32_4 %55 = OpLoad %25 
                                             OpStore %54 %55 
                                 f32 %59 = OpLoad %37 
                                bool %61 = OpFOrdLessThan %59 %60 
                                             OpStore %58 %61 
                                bool %62 = OpLoad %58 
                                 i32 %64 = OpSelect %62 %63 %31 
                                 i32 %66 = OpIMul %64 %65 
                                bool %67 = OpINotEqual %66 %31 
                                             OpSelectionMerge %69 None 
                                             OpBranchConditional %67 %68 %69 
                                     %68 = OpLabel 
                                             OpKill
                                     %69 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 72
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %43 %54 
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
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %43 Location 43 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %54 Location 54 
                                             OpDecorate %59 RelaxedPrecision 
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
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %36 = OpTypePointer Private %6 
                        Private f32* %37 = OpVariable Private 
                                     %38 = OpTypeInt 32 0 
                                 u32 %39 = OpConstant 3 
                                     %42 = OpTypePointer Input %7 
                        Input f32_4* %43 = OpVariable Input 
                                     %44 = OpTypePointer Input %6 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %53 = OpTypePointer Output %7 
                       Output f32_4* %54 = OpVariable Output 
                                     %56 = OpTypeBool 
                                     %57 = OpTypePointer Private %56 
                       Private bool* %58 = OpVariable Private 
                                 f32 %60 = OpConstant 3.674022E-40 
                                 i32 %63 = OpConstant 1 
                                 i32 %65 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                        Private f32* %40 = OpAccessChain %25 %39 
                                 f32 %41 = OpLoad %40 
                          Input f32* %45 = OpAccessChain %43 %39 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFMul %41 %46 
                                 f32 %49 = OpFAdd %47 %48 
                                             OpStore %37 %49 
                               f32_4 %50 = OpLoad %25 
                               f32_4 %51 = OpLoad %43 
                               f32_4 %52 = OpFMul %50 %51 
                                             OpStore %25 %52 
                               f32_4 %55 = OpLoad %25 
                                             OpStore %54 %55 
                                 f32 %59 = OpLoad %37 
                                bool %61 = OpFOrdLessThan %59 %60 
                                             OpStore %58 %61 
                                bool %62 = OpLoad %58 
                                 i32 %64 = OpSelect %62 %63 %31 
                                 i32 %66 = OpIMul %64 %65 
                                bool %67 = OpINotEqual %66 %31 
                                             OpSelectionMerge %69 None 
                                             OpBranchConditional %67 %68 %69 
                                     %68 = OpLabel 
                                             OpKill
                                     %69 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0.w = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0.w = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0.w = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %30 %76 %85 %89 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 RelaxedPrecision 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD2 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %64 RelaxedPrecision 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %71 DescriptorSet 71 
                                             OpDecorate %71 Binding 71 
                                             OpDecorate %72 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 76 
                                             OpDecorate %79 RelaxedPrecision 
                                             OpDecorate %82 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %85 RelaxedPrecision 
                                             OpDecorate %85 Location 85 
                                             OpDecorate %86 RelaxedPrecision 
                                             OpDecorate %89 RelaxedPrecision 
                                             OpDecorate %89 Location 89 
                                             OpDecorate %90 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %7 %7 
                                     %11 = OpTypePointer Uniform %10 
     Uniform struct {f32_4; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 1 
                                     %15 = OpTypeVector %6 2 
                                     %16 = OpTypePointer Uniform %7 
                                     %29 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %54 = OpTypePointer Private %6 
                        Private f32* %55 = OpVariable Private 
                                     %56 = OpTypeInt 32 0 
                                 u32 %57 = OpConstant 1 
                                 u32 %60 = OpConstant 0 
                      Private f32_4* %64 = OpVariable Private 
                                     %65 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %66 = OpTypePointer UniformConstant %65 
UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
                                     %69 = OpTypeSampler 
                                     %70 = OpTypePointer UniformConstant %69 
            UniformConstant sampler* %71 = OpVariable UniformConstant 
                                     %73 = OpTypeSampledImage %65 
                                     %75 = OpTypePointer Input %15 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %80 = OpConstant 0 
                        Input f32_4* %85 = OpVariable Input 
                                     %88 = OpTypePointer Output %7 
                       Output f32_4* %89 = OpVariable Output 
                                 u32 %91 = OpConstant 3 
                                     %95 = OpTypePointer Output %6 
                                     %97 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %17 = OpAccessChain %12 %14 
                               f32_4 %18 = OpLoad %17 
                               f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                               f32_2 %20 = OpFNegate %19 
                      Uniform f32_4* %21 = OpAccessChain %12 %14 
                               f32_4 %22 = OpLoad %21 
                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
                               f32_2 %24 = OpFAdd %20 %23 
                               f32_4 %25 = OpLoad %9 
                               f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                             OpStore %9 %26 
                               f32_4 %27 = OpLoad %9 
                               f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                               f32_4 %31 = OpLoad vs_TEXCOORD2 
                               f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                               f32_2 %33 = OpExtInst %1 4 %32 
                               f32_2 %34 = OpFNegate %33 
                               f32_2 %35 = OpFAdd %28 %34 
                               f32_4 %36 = OpLoad %9 
                               f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                             OpStore %9 %37 
                               f32_4 %38 = OpLoad %9 
                               f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                               f32_4 %40 = OpLoad vs_TEXCOORD2 
                               f32_2 %41 = OpVectorShuffle %40 %40 2 3 
                               f32_2 %42 = OpFMul %39 %41 
                               f32_4 %43 = OpLoad %9 
                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                             OpStore %9 %44 
                               f32_4 %45 = OpLoad %9 
                               f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                               f32_2 %49 = OpCompositeConstruct %47 %47 
                               f32_2 %50 = OpCompositeConstruct %48 %48 
                               f32_2 %51 = OpExtInst %1 43 %46 %49 %50 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpVectorShuffle %52 %51 4 5 2 3 
                                             OpStore %9 %53 
                        Private f32* %58 = OpAccessChain %9 %57 
                                 f32 %59 = OpLoad %58 
                        Private f32* %61 = OpAccessChain %9 %60 
                                 f32 %62 = OpLoad %61 
                                 f32 %63 = OpFMul %59 %62 
                                             OpStore %55 %63 
                 read_only Texture2D %68 = OpLoad %67 
                             sampler %72 = OpLoad %71 
          read_only Texture2DSampled %74 = OpSampledImage %68 %72 
                               f32_2 %77 = OpLoad vs_TEXCOORD0 
                               f32_4 %78 = OpImageSampleImplicitLod %74 %77 
                                             OpStore %64 %78 
                               f32_4 %79 = OpLoad %64 
                      Uniform f32_4* %81 = OpAccessChain %12 %80 
                               f32_4 %82 = OpLoad %81 
                               f32_4 %83 = OpFAdd %79 %82 
                                             OpStore %9 %83 
                               f32_4 %84 = OpLoad %9 
                               f32_4 %86 = OpLoad %85 
                               f32_4 %87 = OpFMul %84 %86 
                                             OpStore %9 %87 
                                 f32 %90 = OpLoad %55 
                        Private f32* %92 = OpAccessChain %9 %91 
                                 f32 %93 = OpLoad %92 
                                 f32 %94 = OpFMul %90 %93 
                         Output f32* %96 = OpAccessChain %89 %91 
                                             OpStore %96 %94 
                               f32_4 %98 = OpLoad %9 
                               f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              f32_4 %100 = OpLoad %89 
                              f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                             OpStore %89 %101 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %30 %76 %85 %89 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 RelaxedPrecision 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD2 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %64 RelaxedPrecision 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %71 DescriptorSet 71 
                                             OpDecorate %71 Binding 71 
                                             OpDecorate %72 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 76 
                                             OpDecorate %79 RelaxedPrecision 
                                             OpDecorate %82 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %85 RelaxedPrecision 
                                             OpDecorate %85 Location 85 
                                             OpDecorate %86 RelaxedPrecision 
                                             OpDecorate %89 RelaxedPrecision 
                                             OpDecorate %89 Location 89 
                                             OpDecorate %90 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %7 %7 
                                     %11 = OpTypePointer Uniform %10 
     Uniform struct {f32_4; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 1 
                                     %15 = OpTypeVector %6 2 
                                     %16 = OpTypePointer Uniform %7 
                                     %29 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %54 = OpTypePointer Private %6 
                        Private f32* %55 = OpVariable Private 
                                     %56 = OpTypeInt 32 0 
                                 u32 %57 = OpConstant 1 
                                 u32 %60 = OpConstant 0 
                      Private f32_4* %64 = OpVariable Private 
                                     %65 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %66 = OpTypePointer UniformConstant %65 
UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
                                     %69 = OpTypeSampler 
                                     %70 = OpTypePointer UniformConstant %69 
            UniformConstant sampler* %71 = OpVariable UniformConstant 
                                     %73 = OpTypeSampledImage %65 
                                     %75 = OpTypePointer Input %15 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %80 = OpConstant 0 
                        Input f32_4* %85 = OpVariable Input 
                                     %88 = OpTypePointer Output %7 
                       Output f32_4* %89 = OpVariable Output 
                                 u32 %91 = OpConstant 3 
                                     %95 = OpTypePointer Output %6 
                                     %97 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %17 = OpAccessChain %12 %14 
                               f32_4 %18 = OpLoad %17 
                               f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                               f32_2 %20 = OpFNegate %19 
                      Uniform f32_4* %21 = OpAccessChain %12 %14 
                               f32_4 %22 = OpLoad %21 
                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
                               f32_2 %24 = OpFAdd %20 %23 
                               f32_4 %25 = OpLoad %9 
                               f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                             OpStore %9 %26 
                               f32_4 %27 = OpLoad %9 
                               f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                               f32_4 %31 = OpLoad vs_TEXCOORD2 
                               f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                               f32_2 %33 = OpExtInst %1 4 %32 
                               f32_2 %34 = OpFNegate %33 
                               f32_2 %35 = OpFAdd %28 %34 
                               f32_4 %36 = OpLoad %9 
                               f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                             OpStore %9 %37 
                               f32_4 %38 = OpLoad %9 
                               f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                               f32_4 %40 = OpLoad vs_TEXCOORD2 
                               f32_2 %41 = OpVectorShuffle %40 %40 2 3 
                               f32_2 %42 = OpFMul %39 %41 
                               f32_4 %43 = OpLoad %9 
                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                             OpStore %9 %44 
                               f32_4 %45 = OpLoad %9 
                               f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                               f32_2 %49 = OpCompositeConstruct %47 %47 
                               f32_2 %50 = OpCompositeConstruct %48 %48 
                               f32_2 %51 = OpExtInst %1 43 %46 %49 %50 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpVectorShuffle %52 %51 4 5 2 3 
                                             OpStore %9 %53 
                        Private f32* %58 = OpAccessChain %9 %57 
                                 f32 %59 = OpLoad %58 
                        Private f32* %61 = OpAccessChain %9 %60 
                                 f32 %62 = OpLoad %61 
                                 f32 %63 = OpFMul %59 %62 
                                             OpStore %55 %63 
                 read_only Texture2D %68 = OpLoad %67 
                             sampler %72 = OpLoad %71 
          read_only Texture2DSampled %74 = OpSampledImage %68 %72 
                               f32_2 %77 = OpLoad vs_TEXCOORD0 
                               f32_4 %78 = OpImageSampleImplicitLod %74 %77 
                                             OpStore %64 %78 
                               f32_4 %79 = OpLoad %64 
                      Uniform f32_4* %81 = OpAccessChain %12 %80 
                               f32_4 %82 = OpLoad %81 
                               f32_4 %83 = OpFAdd %79 %82 
                                             OpStore %9 %83 
                               f32_4 %84 = OpLoad %9 
                               f32_4 %86 = OpLoad %85 
                               f32_4 %87 = OpFMul %84 %86 
                                             OpStore %9 %87 
                                 f32 %90 = OpLoad %55 
                        Private f32* %92 = OpAccessChain %9 %91 
                                 f32 %93 = OpLoad %92 
                                 f32 %94 = OpFMul %90 %93 
                         Output f32* %96 = OpAccessChain %89 %91 
                                             OpStore %96 %94 
                               f32_4 %98 = OpLoad %9 
                               f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              f32_4 %100 = OpLoad %89 
                              f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                             OpStore %89 %101 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %30 %76 %85 %89 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 RelaxedPrecision 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD2 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %64 RelaxedPrecision 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %71 DescriptorSet 71 
                                             OpDecorate %71 Binding 71 
                                             OpDecorate %72 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 76 
                                             OpDecorate %79 RelaxedPrecision 
                                             OpDecorate %82 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %85 RelaxedPrecision 
                                             OpDecorate %85 Location 85 
                                             OpDecorate %86 RelaxedPrecision 
                                             OpDecorate %89 RelaxedPrecision 
                                             OpDecorate %89 Location 89 
                                             OpDecorate %90 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %7 %7 
                                     %11 = OpTypePointer Uniform %10 
     Uniform struct {f32_4; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 1 
                                     %15 = OpTypeVector %6 2 
                                     %16 = OpTypePointer Uniform %7 
                                     %29 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %54 = OpTypePointer Private %6 
                        Private f32* %55 = OpVariable Private 
                                     %56 = OpTypeInt 32 0 
                                 u32 %57 = OpConstant 1 
                                 u32 %60 = OpConstant 0 
                      Private f32_4* %64 = OpVariable Private 
                                     %65 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %66 = OpTypePointer UniformConstant %65 
UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
                                     %69 = OpTypeSampler 
                                     %70 = OpTypePointer UniformConstant %69 
            UniformConstant sampler* %71 = OpVariable UniformConstant 
                                     %73 = OpTypeSampledImage %65 
                                     %75 = OpTypePointer Input %15 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %80 = OpConstant 0 
                        Input f32_4* %85 = OpVariable Input 
                                     %88 = OpTypePointer Output %7 
                       Output f32_4* %89 = OpVariable Output 
                                 u32 %91 = OpConstant 3 
                                     %95 = OpTypePointer Output %6 
                                     %97 = OpTypeVector %6 3 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %17 = OpAccessChain %12 %14 
                               f32_4 %18 = OpLoad %17 
                               f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                               f32_2 %20 = OpFNegate %19 
                      Uniform f32_4* %21 = OpAccessChain %12 %14 
                               f32_4 %22 = OpLoad %21 
                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
                               f32_2 %24 = OpFAdd %20 %23 
                               f32_4 %25 = OpLoad %9 
                               f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                             OpStore %9 %26 
                               f32_4 %27 = OpLoad %9 
                               f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                               f32_4 %31 = OpLoad vs_TEXCOORD2 
                               f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                               f32_2 %33 = OpExtInst %1 4 %32 
                               f32_2 %34 = OpFNegate %33 
                               f32_2 %35 = OpFAdd %28 %34 
                               f32_4 %36 = OpLoad %9 
                               f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                             OpStore %9 %37 
                               f32_4 %38 = OpLoad %9 
                               f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                               f32_4 %40 = OpLoad vs_TEXCOORD2 
                               f32_2 %41 = OpVectorShuffle %40 %40 2 3 
                               f32_2 %42 = OpFMul %39 %41 
                               f32_4 %43 = OpLoad %9 
                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                             OpStore %9 %44 
                               f32_4 %45 = OpLoad %9 
                               f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                               f32_2 %49 = OpCompositeConstruct %47 %47 
                               f32_2 %50 = OpCompositeConstruct %48 %48 
                               f32_2 %51 = OpExtInst %1 43 %46 %49 %50 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpVectorShuffle %52 %51 4 5 2 3 
                                             OpStore %9 %53 
                        Private f32* %58 = OpAccessChain %9 %57 
                                 f32 %59 = OpLoad %58 
                        Private f32* %61 = OpAccessChain %9 %60 
                                 f32 %62 = OpLoad %61 
                                 f32 %63 = OpFMul %59 %62 
                                             OpStore %55 %63 
                 read_only Texture2D %68 = OpLoad %67 
                             sampler %72 = OpLoad %71 
          read_only Texture2DSampled %74 = OpSampledImage %68 %72 
                               f32_2 %77 = OpLoad vs_TEXCOORD0 
                               f32_4 %78 = OpImageSampleImplicitLod %74 %77 
                                             OpStore %64 %78 
                               f32_4 %79 = OpLoad %64 
                      Uniform f32_4* %81 = OpAccessChain %12 %80 
                               f32_4 %82 = OpLoad %81 
                               f32_4 %83 = OpFAdd %79 %82 
                                             OpStore %9 %83 
                               f32_4 %84 = OpLoad %9 
                               f32_4 %86 = OpLoad %85 
                               f32_4 %87 = OpFMul %84 %86 
                                             OpStore %9 %87 
                                 f32 %90 = OpLoad %55 
                        Private f32* %92 = OpAccessChain %9 %91 
                                 f32 %93 = OpLoad %92 
                                 f32 %94 = OpFMul %90 %93 
                         Output f32* %96 = OpAccessChain %89 %91 
                                             OpStore %96 %94 
                               f32_4 %98 = OpLoad %9 
                               f32_3 %99 = OpVectorShuffle %98 %98 0 1 2 
                              f32_4 %100 = OpLoad %89 
                              f32_4 %101 = OpVectorShuffle %100 %99 4 5 6 3 
                                             OpStore %89 %101 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat16_3 = u_xlat0.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_1 = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3<0.0);
#else
    u_xlatb0 = u_xlat16_3<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat16_3 = u_xlat0.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_1 = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3<0.0);
#else
    u_xlatb0 = u_xlat16_3<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
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
uniform 	vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	vec4 _ClipRect;
uniform 	float _MaskSoftnessX;
uniform 	float _MaskSoftnessY;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    u_xlat0.xy = _ScreenParams.yy * hlslcc_mtx4x4glstate_matrix_projection[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4glstate_matrix_projection[0].xy * _ScreenParams.xx + u_xlat0.xy;
    u_xlat0.xy = u_xlat0.ww / abs(u_xlat0.xy);
    u_xlat0.xy = vec2(_MaskSoftnessX, _MaskSoftnessY) * vec2(0.25, 0.25) + abs(u_xlat0.xy);
    u_xlat0.zw = vec2(0.25, 0.25) / u_xlat0.xy;
    u_xlat1 = max(_ClipRect, vec4(-2e+10, -2e+10, -2e+10, -2e+10));
    u_xlat1 = min(u_xlat1, vec4(2e+10, 2e+10, 2e+10, 2e+10));
    u_xlat1.xy = in_POSITION0.xy * vec2(2.0, 2.0) + (-u_xlat1.xy);
    u_xlat0.xy = (-u_xlat1.zw) + u_xlat1.xy;
    vs_TEXCOORD2 = u_xlat0;
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
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_3;
void main()
{
    u_xlat0.xy = (-_ClipRect.xy) + _ClipRect.zw;
    u_xlat0.xy = u_xlat0.xy + -abs(vs_TEXCOORD2.xy);
    u_xlat0.xy = u_xlat0.xy * vs_TEXCOORD2.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat16_1 = u_xlat0.y * u_xlat0.x;
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat16_3 = u_xlat0.w * u_xlat16_1 + -0.00100000005;
    u_xlat16_1 = u_xlat16_1 * u_xlat0.w;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3<0.0);
#else
    u_xlatb0 = u_xlat16_3<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 124
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %30 %76 %85 %101 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 RelaxedPrecision 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD2 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %64 RelaxedPrecision 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %71 DescriptorSet 71 
                                             OpDecorate %71 Binding 71 
                                             OpDecorate %72 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 76 
                                             OpDecorate %79 RelaxedPrecision 
                                             OpDecorate %82 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %85 RelaxedPrecision 
                                             OpDecorate %85 Location 85 
                                             OpDecorate %86 RelaxedPrecision 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate %92 RelaxedPrecision 
                                             OpDecorate %96 RelaxedPrecision 
                                             OpDecorate %101 RelaxedPrecision 
                                             OpDecorate %101 Location 101 
                                             OpDecorate %107 RelaxedPrecision 
                                             OpDecorate %113 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %7 %7 
                                     %11 = OpTypePointer Uniform %10 
     Uniform struct {f32_4; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 1 
                                     %15 = OpTypeVector %6 2 
                                     %16 = OpTypePointer Uniform %7 
                                     %29 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %54 = OpTypePointer Private %6 
                        Private f32* %55 = OpVariable Private 
                                     %56 = OpTypeInt 32 0 
                                 u32 %57 = OpConstant 1 
                                 u32 %60 = OpConstant 0 
                      Private f32_4* %64 = OpVariable Private 
                                     %65 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %66 = OpTypePointer UniformConstant %65 
UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
                                     %69 = OpTypeSampler 
                                     %70 = OpTypePointer UniformConstant %69 
            UniformConstant sampler* %71 = OpVariable UniformConstant 
                                     %73 = OpTypeSampledImage %65 
                                     %75 = OpTypePointer Input %15 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %80 = OpConstant 0 
                        Input f32_4* %85 = OpVariable Input 
                        Private f32* %88 = OpVariable Private 
                                 u32 %89 = OpConstant 3 
                                 f32 %94 = OpConstant 3.674022E-40 
                                    %100 = OpTypePointer Output %7 
                      Output f32_4* %101 = OpVariable Output 
                                    %102 = OpTypeVector %6 3 
                                    %108 = OpTypePointer Output %6 
                                    %110 = OpTypeBool 
                                    %111 = OpTypePointer Private %110 
                      Private bool* %112 = OpVariable Private 
                                i32 %117 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %17 = OpAccessChain %12 %14 
                               f32_4 %18 = OpLoad %17 
                               f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                               f32_2 %20 = OpFNegate %19 
                      Uniform f32_4* %21 = OpAccessChain %12 %14 
                               f32_4 %22 = OpLoad %21 
                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
                               f32_2 %24 = OpFAdd %20 %23 
                               f32_4 %25 = OpLoad %9 
                               f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                             OpStore %9 %26 
                               f32_4 %27 = OpLoad %9 
                               f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                               f32_4 %31 = OpLoad vs_TEXCOORD2 
                               f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                               f32_2 %33 = OpExtInst %1 4 %32 
                               f32_2 %34 = OpFNegate %33 
                               f32_2 %35 = OpFAdd %28 %34 
                               f32_4 %36 = OpLoad %9 
                               f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                             OpStore %9 %37 
                               f32_4 %38 = OpLoad %9 
                               f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                               f32_4 %40 = OpLoad vs_TEXCOORD2 
                               f32_2 %41 = OpVectorShuffle %40 %40 2 3 
                               f32_2 %42 = OpFMul %39 %41 
                               f32_4 %43 = OpLoad %9 
                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                             OpStore %9 %44 
                               f32_4 %45 = OpLoad %9 
                               f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                               f32_2 %49 = OpCompositeConstruct %47 %47 
                               f32_2 %50 = OpCompositeConstruct %48 %48 
                               f32_2 %51 = OpExtInst %1 43 %46 %49 %50 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpVectorShuffle %52 %51 4 5 2 3 
                                             OpStore %9 %53 
                        Private f32* %58 = OpAccessChain %9 %57 
                                 f32 %59 = OpLoad %58 
                        Private f32* %61 = OpAccessChain %9 %60 
                                 f32 %62 = OpLoad %61 
                                 f32 %63 = OpFMul %59 %62 
                                             OpStore %55 %63 
                 read_only Texture2D %68 = OpLoad %67 
                             sampler %72 = OpLoad %71 
          read_only Texture2DSampled %74 = OpSampledImage %68 %72 
                               f32_2 %77 = OpLoad vs_TEXCOORD0 
                               f32_4 %78 = OpImageSampleImplicitLod %74 %77 
                                             OpStore %64 %78 
                               f32_4 %79 = OpLoad %64 
                      Uniform f32_4* %81 = OpAccessChain %12 %80 
                               f32_4 %82 = OpLoad %81 
                               f32_4 %83 = OpFAdd %79 %82 
                                             OpStore %9 %83 
                               f32_4 %84 = OpLoad %9 
                               f32_4 %86 = OpLoad %85 
                               f32_4 %87 = OpFMul %84 %86 
                                             OpStore %9 %87 
                        Private f32* %90 = OpAccessChain %9 %89 
                                 f32 %91 = OpLoad %90 
                                 f32 %92 = OpLoad %55 
                                 f32 %93 = OpFMul %91 %92 
                                 f32 %95 = OpFAdd %93 %94 
                                             OpStore %88 %95 
                                 f32 %96 = OpLoad %55 
                        Private f32* %97 = OpAccessChain %9 %89 
                                 f32 %98 = OpLoad %97 
                                 f32 %99 = OpFMul %96 %98 
                                             OpStore %55 %99 
                              f32_4 %103 = OpLoad %9 
                              f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              f32_4 %105 = OpLoad %101 
                              f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                             OpStore %101 %106 
                                f32 %107 = OpLoad %55 
                        Output f32* %109 = OpAccessChain %101 %89 
                                             OpStore %109 %107 
                                f32 %113 = OpLoad %88 
                               bool %114 = OpFOrdLessThan %113 %47 
                                             OpStore %112 %114 
                               bool %115 = OpLoad %112 
                                i32 %116 = OpSelect %115 %14 %80 
                                i32 %118 = OpIMul %116 %117 
                               bool %119 = OpINotEqual %118 %80 
                                             OpSelectionMerge %121 None 
                                             OpBranchConditional %119 %120 %121 
                                    %120 = OpLabel 
                                             OpKill
                                    %121 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 124
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %30 %76 %85 %101 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 RelaxedPrecision 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD2 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %64 RelaxedPrecision 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %71 DescriptorSet 71 
                                             OpDecorate %71 Binding 71 
                                             OpDecorate %72 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 76 
                                             OpDecorate %79 RelaxedPrecision 
                                             OpDecorate %82 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %85 RelaxedPrecision 
                                             OpDecorate %85 Location 85 
                                             OpDecorate %86 RelaxedPrecision 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate %92 RelaxedPrecision 
                                             OpDecorate %96 RelaxedPrecision 
                                             OpDecorate %101 RelaxedPrecision 
                                             OpDecorate %101 Location 101 
                                             OpDecorate %107 RelaxedPrecision 
                                             OpDecorate %113 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %7 %7 
                                     %11 = OpTypePointer Uniform %10 
     Uniform struct {f32_4; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 1 
                                     %15 = OpTypeVector %6 2 
                                     %16 = OpTypePointer Uniform %7 
                                     %29 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %54 = OpTypePointer Private %6 
                        Private f32* %55 = OpVariable Private 
                                     %56 = OpTypeInt 32 0 
                                 u32 %57 = OpConstant 1 
                                 u32 %60 = OpConstant 0 
                      Private f32_4* %64 = OpVariable Private 
                                     %65 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %66 = OpTypePointer UniformConstant %65 
UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
                                     %69 = OpTypeSampler 
                                     %70 = OpTypePointer UniformConstant %69 
            UniformConstant sampler* %71 = OpVariable UniformConstant 
                                     %73 = OpTypeSampledImage %65 
                                     %75 = OpTypePointer Input %15 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %80 = OpConstant 0 
                        Input f32_4* %85 = OpVariable Input 
                        Private f32* %88 = OpVariable Private 
                                 u32 %89 = OpConstant 3 
                                 f32 %94 = OpConstant 3.674022E-40 
                                    %100 = OpTypePointer Output %7 
                      Output f32_4* %101 = OpVariable Output 
                                    %102 = OpTypeVector %6 3 
                                    %108 = OpTypePointer Output %6 
                                    %110 = OpTypeBool 
                                    %111 = OpTypePointer Private %110 
                      Private bool* %112 = OpVariable Private 
                                i32 %117 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %17 = OpAccessChain %12 %14 
                               f32_4 %18 = OpLoad %17 
                               f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                               f32_2 %20 = OpFNegate %19 
                      Uniform f32_4* %21 = OpAccessChain %12 %14 
                               f32_4 %22 = OpLoad %21 
                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
                               f32_2 %24 = OpFAdd %20 %23 
                               f32_4 %25 = OpLoad %9 
                               f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                             OpStore %9 %26 
                               f32_4 %27 = OpLoad %9 
                               f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                               f32_4 %31 = OpLoad vs_TEXCOORD2 
                               f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                               f32_2 %33 = OpExtInst %1 4 %32 
                               f32_2 %34 = OpFNegate %33 
                               f32_2 %35 = OpFAdd %28 %34 
                               f32_4 %36 = OpLoad %9 
                               f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                             OpStore %9 %37 
                               f32_4 %38 = OpLoad %9 
                               f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                               f32_4 %40 = OpLoad vs_TEXCOORD2 
                               f32_2 %41 = OpVectorShuffle %40 %40 2 3 
                               f32_2 %42 = OpFMul %39 %41 
                               f32_4 %43 = OpLoad %9 
                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                             OpStore %9 %44 
                               f32_4 %45 = OpLoad %9 
                               f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                               f32_2 %49 = OpCompositeConstruct %47 %47 
                               f32_2 %50 = OpCompositeConstruct %48 %48 
                               f32_2 %51 = OpExtInst %1 43 %46 %49 %50 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpVectorShuffle %52 %51 4 5 2 3 
                                             OpStore %9 %53 
                        Private f32* %58 = OpAccessChain %9 %57 
                                 f32 %59 = OpLoad %58 
                        Private f32* %61 = OpAccessChain %9 %60 
                                 f32 %62 = OpLoad %61 
                                 f32 %63 = OpFMul %59 %62 
                                             OpStore %55 %63 
                 read_only Texture2D %68 = OpLoad %67 
                             sampler %72 = OpLoad %71 
          read_only Texture2DSampled %74 = OpSampledImage %68 %72 
                               f32_2 %77 = OpLoad vs_TEXCOORD0 
                               f32_4 %78 = OpImageSampleImplicitLod %74 %77 
                                             OpStore %64 %78 
                               f32_4 %79 = OpLoad %64 
                      Uniform f32_4* %81 = OpAccessChain %12 %80 
                               f32_4 %82 = OpLoad %81 
                               f32_4 %83 = OpFAdd %79 %82 
                                             OpStore %9 %83 
                               f32_4 %84 = OpLoad %9 
                               f32_4 %86 = OpLoad %85 
                               f32_4 %87 = OpFMul %84 %86 
                                             OpStore %9 %87 
                        Private f32* %90 = OpAccessChain %9 %89 
                                 f32 %91 = OpLoad %90 
                                 f32 %92 = OpLoad %55 
                                 f32 %93 = OpFMul %91 %92 
                                 f32 %95 = OpFAdd %93 %94 
                                             OpStore %88 %95 
                                 f32 %96 = OpLoad %55 
                        Private f32* %97 = OpAccessChain %9 %89 
                                 f32 %98 = OpLoad %97 
                                 f32 %99 = OpFMul %96 %98 
                                             OpStore %55 %99 
                              f32_4 %103 = OpLoad %9 
                              f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              f32_4 %105 = OpLoad %101 
                              f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                             OpStore %101 %106 
                                f32 %107 = OpLoad %55 
                        Output f32* %109 = OpAccessChain %101 %89 
                                             OpStore %109 %107 
                                f32 %113 = OpLoad %88 
                               bool %114 = OpFOrdLessThan %113 %47 
                                             OpStore %112 %114 
                               bool %115 = OpLoad %112 
                                i32 %116 = OpSelect %115 %14 %80 
                                i32 %118 = OpIMul %116 %117 
                               bool %119 = OpINotEqual %118 %80 
                                             OpSelectionMerge %121 None 
                                             OpBranchConditional %119 %120 %121 
                                    %120 = OpLabel 
                                             OpKill
                                    %121 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 188
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %84 %90 %94 %96 %98 %180 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 RelaxedPrecision 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpMemberDecorate %19 7 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %88 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD0 Location 94 
                                                      OpDecorate %96 Location 96 
                                                      OpDecorate vs_TEXCOORD1 Location 98 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Location 180 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %7 %7 %6 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 1 
                                              %24 = OpTypePointer Uniform %7 
                                          i32 %28 = OpConstant 0 
                                          i32 %36 = OpConstant 2 
                                          i32 %45 = OpConstant 3 
                               Private f32_4* %49 = OpVariable Private 
                                          u32 %76 = OpConstant 1 
                                              %77 = OpTypeArray %6 %76 
                                              %78 = OpTypeStruct %7 %6 %77 
                                              %79 = OpTypePointer Output %78 
         Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                 Input f32_4* %84 = OpVariable Input 
                                          i32 %86 = OpConstant 4 
                                Output f32_4* %90 = OpVariable Output 
                                              %92 = OpTypeVector %6 2 
                                              %93 = OpTypePointer Output %92 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                              %95 = OpTypePointer Input %92 
                                 Input f32_2* %96 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %129 = OpConstant 6 
                                             %130 = OpTypePointer Uniform %6 
                                         i32 %133 = OpConstant 7 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_2 %138 = OpConstantComposite %137 %137 
                                         i32 %151 = OpConstant 5 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_4 %155 = OpConstantComposite %154 %154 %154 %154 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_4 %159 = OpConstantComposite %158 %158 %158 %158 
                                         f32 %163 = OpConstant 3.674022E-40 
                                       f32_2 %164 = OpConstantComposite %163 %163 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %182 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_4 %27 = OpFMul %13 %26 
                                                      OpStore %9 %27 
                               Uniform f32_4* %29 = OpAccessChain %21 %23 %28 
                                        f32_4 %30 = OpLoad %29 
                                        f32_4 %31 = OpLoad %11 
                                        f32_4 %32 = OpVectorShuffle %31 %31 0 0 0 0 
                                        f32_4 %33 = OpFMul %30 %32 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpFAdd %33 %34 
                                                      OpStore %9 %35 
                               Uniform f32_4* %37 = OpAccessChain %21 %23 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_4 %39 = OpLoad %11 
                                        f32_4 %40 = OpVectorShuffle %39 %39 2 2 2 2 
                                        f32_4 %41 = OpFMul %38 %40 
                                        f32_4 %42 = OpLoad %9 
                                        f32_4 %43 = OpFAdd %41 %42 
                                                      OpStore %9 %43 
                                        f32_4 %44 = OpLoad %9 
                               Uniform f32_4* %46 = OpAccessChain %21 %23 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpFAdd %44 %47 
                                                      OpStore %9 %48 
                                        f32_4 %50 = OpLoad %9 
                                        f32_4 %51 = OpVectorShuffle %50 %50 1 1 1 1 
                               Uniform f32_4* %52 = OpAccessChain %21 %45 %23 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFMul %51 %53 
                                                      OpStore %49 %54 
                               Uniform f32_4* %55 = OpAccessChain %21 %45 %28 
                                        f32_4 %56 = OpLoad %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpVectorShuffle %57 %57 0 0 0 0 
                                        f32_4 %59 = OpFMul %56 %58 
                                        f32_4 %60 = OpLoad %49 
                                        f32_4 %61 = OpFAdd %59 %60 
                                                      OpStore %49 %61 
                               Uniform f32_4* %62 = OpAccessChain %21 %45 %36 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 2 2 2 2 
                                        f32_4 %66 = OpFMul %63 %65 
                                        f32_4 %67 = OpLoad %49 
                                        f32_4 %68 = OpFAdd %66 %67 
                                                      OpStore %49 %68 
                               Uniform f32_4* %69 = OpAccessChain %21 %45 %45 
                                        f32_4 %70 = OpLoad %69 
                                        f32_4 %71 = OpLoad %9 
                                        f32_4 %72 = OpVectorShuffle %71 %71 3 3 3 3 
                                        f32_4 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %49 
                                        f32_4 %75 = OpFAdd %73 %74 
                                                      OpStore %9 %75 
                                        f32_4 %81 = OpLoad %9 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                        f32_4 %85 = OpLoad %84 
                               Uniform f32_4* %87 = OpAccessChain %21 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpFMul %85 %88 
                                                      OpStore %49 %89 
                                        f32_4 %91 = OpLoad %49 
                                                      OpStore %90 %91 
                                        f32_2 %97 = OpLoad %96 
                                                      OpStore vs_TEXCOORD0 %97 
                                        f32_4 %99 = OpLoad %11 
                                                      OpStore vs_TEXCOORD1 %99 
                              Uniform f32_4* %100 = OpAccessChain %21 %28 
                                       f32_4 %101 = OpLoad %100 
                                       f32_2 %102 = OpVectorShuffle %101 %101 1 1 
                              Uniform f32_4* %103 = OpAccessChain %21 %36 %23 
                                       f32_4 %104 = OpLoad %103 
                                       f32_2 %105 = OpVectorShuffle %104 %104 0 1 
                                       f32_2 %106 = OpFMul %102 %105 
                                       f32_4 %107 = OpLoad %9 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                      OpStore %9 %108 
                              Uniform f32_4* %109 = OpAccessChain %21 %36 %28 
                                       f32_4 %110 = OpLoad %109 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 1 
                              Uniform f32_4* %112 = OpAccessChain %21 %28 
                                       f32_4 %113 = OpLoad %112 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 0 
                                       f32_2 %115 = OpFMul %111 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_2 %117 = OpVectorShuffle %116 %116 0 1 
                                       f32_2 %118 = OpFAdd %115 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 2 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_4 %123 = OpLoad %9 
                                       f32_2 %124 = OpVectorShuffle %123 %123 0 1 
                                       f32_2 %125 = OpExtInst %1 4 %124 
                                       f32_2 %126 = OpFDiv %122 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                Uniform f32* %131 = OpAccessChain %21 %129 
                                         f32 %132 = OpLoad %131 
                                Uniform f32* %134 = OpAccessChain %21 %133 
                                         f32 %135 = OpLoad %134 
                                       f32_2 %136 = OpCompositeConstruct %132 %135 
                                       f32_2 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_2 %141 = OpVectorShuffle %140 %140 0 1 
                                       f32_2 %142 = OpExtInst %1 4 %141 
                                       f32_2 %143 = OpFAdd %139 %142 
                                       f32_4 %144 = OpLoad %9 
                                       f32_4 %145 = OpVectorShuffle %144 %143 4 5 2 3 
                                                      OpStore %9 %145 
                                       f32_4 %146 = OpLoad %9 
                                       f32_2 %147 = OpVectorShuffle %146 %146 0 1 
                                       f32_2 %148 = OpFDiv %138 %147 
                                       f32_4 %149 = OpLoad %9 
                                       f32_4 %150 = OpVectorShuffle %149 %148 0 1 4 5 
                                                      OpStore %9 %150 
                              Uniform f32_4* %152 = OpAccessChain %21 %151 
                                       f32_4 %153 = OpLoad %152 
                                       f32_4 %156 = OpExtInst %1 40 %153 %155 
                                                      OpStore %49 %156 
                                       f32_4 %157 = OpLoad %49 
                                       f32_4 %160 = OpExtInst %1 37 %157 %159 
                                                      OpStore %49 %160 
                                       f32_4 %161 = OpLoad %11 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %165 = OpFMul %162 %164 
                                       f32_4 %166 = OpLoad %49 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFNegate %167 
                                       f32_2 %169 = OpFAdd %165 %168 
                                       f32_4 %170 = OpLoad %49 
                                       f32_4 %171 = OpVectorShuffle %170 %169 4 5 2 3 
                                                      OpStore %49 %171 
                                       f32_4 %172 = OpLoad %49 
                                       f32_2 %173 = OpVectorShuffle %172 %172 2 3 
                                       f32_2 %174 = OpFNegate %173 
                                       f32_4 %175 = OpLoad %49 
                                       f32_2 %176 = OpVectorShuffle %175 %175 0 1 
                                       f32_2 %177 = OpFAdd %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpVectorShuffle %178 %177 4 5 2 3 
                                                      OpStore %9 %179 
                                       f32_4 %181 = OpLoad %9 
                                                      OpStore vs_TEXCOORD2 %181 
                                 Output f32* %183 = OpAccessChain %80 %28 %76 
                                         f32 %184 = OpLoad %183 
                                         f32 %185 = OpFNegate %184 
                                 Output f32* %186 = OpAccessChain %80 %28 %76 
                                                      OpStore %186 %185 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 124
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %30 %76 %85 %101 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpMemberDecorate %10 0 RelaxedPrecision 
                                             OpMemberDecorate %10 0 Offset 10 
                                             OpMemberDecorate %10 1 Offset 10 
                                             OpDecorate %10 Block 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD2 Location 30 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %33 RelaxedPrecision 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %64 RelaxedPrecision 
                                             OpDecorate %67 RelaxedPrecision 
                                             OpDecorate %67 DescriptorSet 67 
                                             OpDecorate %67 Binding 67 
                                             OpDecorate %68 RelaxedPrecision 
                                             OpDecorate %71 RelaxedPrecision 
                                             OpDecorate %71 DescriptorSet 71 
                                             OpDecorate %71 Binding 71 
                                             OpDecorate %72 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 76 
                                             OpDecorate %79 RelaxedPrecision 
                                             OpDecorate %82 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %85 RelaxedPrecision 
                                             OpDecorate %85 Location 85 
                                             OpDecorate %86 RelaxedPrecision 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate %92 RelaxedPrecision 
                                             OpDecorate %96 RelaxedPrecision 
                                             OpDecorate %101 RelaxedPrecision 
                                             OpDecorate %101 Location 101 
                                             OpDecorate %107 RelaxedPrecision 
                                             OpDecorate %113 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeStruct %7 %7 
                                     %11 = OpTypePointer Uniform %10 
     Uniform struct {f32_4; f32_4;}* %12 = OpVariable Uniform 
                                     %13 = OpTypeInt 32 1 
                                 i32 %14 = OpConstant 1 
                                     %15 = OpTypeVector %6 2 
                                     %16 = OpTypePointer Uniform %7 
                                     %29 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                 f32 %47 = OpConstant 3.674022E-40 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %54 = OpTypePointer Private %6 
                        Private f32* %55 = OpVariable Private 
                                     %56 = OpTypeInt 32 0 
                                 u32 %57 = OpConstant 1 
                                 u32 %60 = OpConstant 0 
                      Private f32_4* %64 = OpVariable Private 
                                     %65 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %66 = OpTypePointer UniformConstant %65 
UniformConstant read_only Texture2D* %67 = OpVariable UniformConstant 
                                     %69 = OpTypeSampler 
                                     %70 = OpTypePointer UniformConstant %69 
            UniformConstant sampler* %71 = OpVariable UniformConstant 
                                     %73 = OpTypeSampledImage %65 
                                     %75 = OpTypePointer Input %15 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                 i32 %80 = OpConstant 0 
                        Input f32_4* %85 = OpVariable Input 
                        Private f32* %88 = OpVariable Private 
                                 u32 %89 = OpConstant 3 
                                 f32 %94 = OpConstant 3.674022E-40 
                                    %100 = OpTypePointer Output %7 
                      Output f32_4* %101 = OpVariable Output 
                                    %102 = OpTypeVector %6 3 
                                    %108 = OpTypePointer Output %6 
                                    %110 = OpTypeBool 
                                    %111 = OpTypePointer Private %110 
                      Private bool* %112 = OpVariable Private 
                                i32 %117 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                      Uniform f32_4* %17 = OpAccessChain %12 %14 
                               f32_4 %18 = OpLoad %17 
                               f32_2 %19 = OpVectorShuffle %18 %18 0 1 
                               f32_2 %20 = OpFNegate %19 
                      Uniform f32_4* %21 = OpAccessChain %12 %14 
                               f32_4 %22 = OpLoad %21 
                               f32_2 %23 = OpVectorShuffle %22 %22 2 3 
                               f32_2 %24 = OpFAdd %20 %23 
                               f32_4 %25 = OpLoad %9 
                               f32_4 %26 = OpVectorShuffle %25 %24 4 5 2 3 
                                             OpStore %9 %26 
                               f32_4 %27 = OpLoad %9 
                               f32_2 %28 = OpVectorShuffle %27 %27 0 1 
                               f32_4 %31 = OpLoad vs_TEXCOORD2 
                               f32_2 %32 = OpVectorShuffle %31 %31 0 1 
                               f32_2 %33 = OpExtInst %1 4 %32 
                               f32_2 %34 = OpFNegate %33 
                               f32_2 %35 = OpFAdd %28 %34 
                               f32_4 %36 = OpLoad %9 
                               f32_4 %37 = OpVectorShuffle %36 %35 4 5 2 3 
                                             OpStore %9 %37 
                               f32_4 %38 = OpLoad %9 
                               f32_2 %39 = OpVectorShuffle %38 %38 0 1 
                               f32_4 %40 = OpLoad vs_TEXCOORD2 
                               f32_2 %41 = OpVectorShuffle %40 %40 2 3 
                               f32_2 %42 = OpFMul %39 %41 
                               f32_4 %43 = OpLoad %9 
                               f32_4 %44 = OpVectorShuffle %43 %42 4 5 2 3 
                                             OpStore %9 %44 
                               f32_4 %45 = OpLoad %9 
                               f32_2 %46 = OpVectorShuffle %45 %45 0 1 
                               f32_2 %49 = OpCompositeConstruct %47 %47 
                               f32_2 %50 = OpCompositeConstruct %48 %48 
                               f32_2 %51 = OpExtInst %1 43 %46 %49 %50 
                               f32_4 %52 = OpLoad %9 
                               f32_4 %53 = OpVectorShuffle %52 %51 4 5 2 3 
                                             OpStore %9 %53 
                        Private f32* %58 = OpAccessChain %9 %57 
                                 f32 %59 = OpLoad %58 
                        Private f32* %61 = OpAccessChain %9 %60 
                                 f32 %62 = OpLoad %61 
                                 f32 %63 = OpFMul %59 %62 
                                             OpStore %55 %63 
                 read_only Texture2D %68 = OpLoad %67 
                             sampler %72 = OpLoad %71 
          read_only Texture2DSampled %74 = OpSampledImage %68 %72 
                               f32_2 %77 = OpLoad vs_TEXCOORD0 
                               f32_4 %78 = OpImageSampleImplicitLod %74 %77 
                                             OpStore %64 %78 
                               f32_4 %79 = OpLoad %64 
                      Uniform f32_4* %81 = OpAccessChain %12 %80 
                               f32_4 %82 = OpLoad %81 
                               f32_4 %83 = OpFAdd %79 %82 
                                             OpStore %9 %83 
                               f32_4 %84 = OpLoad %9 
                               f32_4 %86 = OpLoad %85 
                               f32_4 %87 = OpFMul %84 %86 
                                             OpStore %9 %87 
                        Private f32* %90 = OpAccessChain %9 %89 
                                 f32 %91 = OpLoad %90 
                                 f32 %92 = OpLoad %55 
                                 f32 %93 = OpFMul %91 %92 
                                 f32 %95 = OpFAdd %93 %94 
                                             OpStore %88 %95 
                                 f32 %96 = OpLoad %55 
                        Private f32* %97 = OpAccessChain %9 %89 
                                 f32 %98 = OpLoad %97 
                                 f32 %99 = OpFMul %96 %98 
                                             OpStore %55 %99 
                              f32_4 %103 = OpLoad %9 
                              f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                              f32_4 %105 = OpLoad %101 
                              f32_4 %106 = OpVectorShuffle %105 %104 4 5 6 3 
                                             OpStore %101 %106 
                                f32 %107 = OpLoad %55 
                        Output f32* %109 = OpAccessChain %101 %89 
                                             OpStore %109 %107 
                                f32 %113 = OpLoad %88 
                               bool %114 = OpFOrdLessThan %113 %47 
                                             OpStore %112 %114 
                               bool %115 = OpLoad %112 
                                i32 %116 = OpSelect %115 %14 %80 
                                i32 %118 = OpIMul %116 %117 
                               bool %119 = OpINotEqual %118 %80 
                                             OpSelectionMerge %121 None 
                                             OpBranchConditional %119 %120 %121 
                                    %120 = OpLabel 
                                             OpKill
                                    %121 = OpLabel 
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
Local Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan hw_tier00 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier00 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier00 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
}
}
}
}