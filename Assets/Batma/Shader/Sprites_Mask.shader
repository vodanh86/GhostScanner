//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Sprites/Mask" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_AlphaTex ("External Alpha", 2D) = "white" { }
_Cutoff ("Mask alpha cutoff", Range(0, 1)) = 0
_Color ("Tint", Color) = (1,1,1,0.2)
_EnableExternalAlpha ("Enable External Alpha", Float) = 0
[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ColorMask 0 0
  ZWrite Off
  Cull Off
  GpuProgramID 33552
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 61
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %56 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpMemberDecorate %30 1 RelaxedPrecision 
                                             OpMemberDecorate %30 1 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate %59 RelaxedPrecision 
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
                                     %30 = OpTypeStruct %23 %6 
                                     %31 = OpTypePointer Uniform %30 
       Uniform struct {f32_4; f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 1 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 0 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %29 = OpLoad %8 
                        Uniform f32* %36 = OpAccessChain %32 %34 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFNegate %37 
                                 f32 %39 = OpFAdd %29 %38 
                                             OpStore %28 %39 
                                 f32 %43 = OpLoad %28 
                                bool %45 = OpFOrdLessThan %43 %44 
                                             OpStore %42 %45 
                                bool %46 = OpLoad %42 
                                 i32 %48 = OpSelect %46 %34 %47 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %47 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                      Uniform f32_4* %58 = OpAccessChain %32 %47 
                               f32_4 %59 = OpLoad %58 
                                             OpStore %56 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 61
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %56 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpMemberDecorate %30 1 RelaxedPrecision 
                                             OpMemberDecorate %30 1 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate %59 RelaxedPrecision 
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
                                     %30 = OpTypeStruct %23 %6 
                                     %31 = OpTypePointer Uniform %30 
       Uniform struct {f32_4; f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 1 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 0 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %29 = OpLoad %8 
                        Uniform f32* %36 = OpAccessChain %32 %34 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFNegate %37 
                                 f32 %39 = OpFAdd %29 %38 
                                             OpStore %28 %39 
                                 f32 %43 = OpLoad %28 
                                bool %45 = OpFOrdLessThan %43 %44 
                                             OpStore %42 %45 
                                bool %46 = OpLoad %42 
                                 i32 %48 = OpSelect %46 %34 %47 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %47 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                      Uniform f32_4* %58 = OpAccessChain %32 %47 
                               f32_4 %59 = OpLoad %58 
                                             OpStore %56 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 61
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %56 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpMemberDecorate %30 1 RelaxedPrecision 
                                             OpMemberDecorate %30 1 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate %59 RelaxedPrecision 
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
                                     %30 = OpTypeStruct %23 %6 
                                     %31 = OpTypePointer Uniform %30 
       Uniform struct {f32_4; f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 1 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 0 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %29 = OpLoad %8 
                        Uniform f32* %36 = OpAccessChain %32 %34 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFNegate %37 
                                 f32 %39 = OpFAdd %29 %38 
                                             OpStore %28 %39 
                                 f32 %43 = OpLoad %28 
                                bool %45 = OpFOrdLessThan %43 %44 
                                             OpStore %42 %45 
                                bool %46 = OpLoad %42 
                                 i32 %48 = OpSelect %46 %34 %47 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %47 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                      Uniform f32_4* %58 = OpAccessChain %32 %47 
                               f32_4 %59 = OpLoad %58 
                                             OpStore %56 %59 
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
; Bound: 140
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %114 %130 %132 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 130 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %132 Location 132 
                                                     OpDecorate %133 RelaxedPrecision 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                             %75 = OpTypeVector %6 2 
                                         f32 %86 = OpConstant 3.674022E-40 
                                       f32_2 %87 = OpConstantComposite %86 %86 
                                        u32 %110 = OpConstant 1 
                                            %111 = OpTypeArray %6 %110 
                                            %112 = OpTypeStruct %7 %6 %111 
                                            %113 = OpTypePointer Output %112 
       Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                            %120 = OpTypePointer Output %7 
                                            %129 = OpTypePointer Output %75 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %131 = OpTypePointer Input %75 
                               Input f32_2* %132 = OpVariable Input 
                                            %134 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                       f32_4 %76 = OpLoad %9 
                                       f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                       f32_4 %78 = OpLoad %9 
                                       f32_2 %79 = OpVectorShuffle %78 %78 3 3 
                                       f32_2 %80 = OpFDiv %77 %79 
                                       f32_4 %81 = OpLoad %9 
                                       f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 3 
                                                     OpStore %9 %82 
                              Uniform f32_4* %83 = OpAccessChain %20 %27 
                                       f32_4 %84 = OpLoad %83 
                                       f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                       f32_2 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %48 
                                       f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                     OpStore %48 %90 
                                       f32_4 %91 = OpLoad %9 
                                       f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                       f32_4 %93 = OpLoad %48 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                       f32_2 %95 = OpFMul %92 %94 
                                       f32_4 %96 = OpLoad %9 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                     OpStore %9 %97 
                                       f32_4 %98 = OpLoad %9 
                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                      f32_2 %100 = OpExtInst %1 2 %99 
                                      f32_4 %101 = OpLoad %9 
                                      f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                     OpStore %9 %102 
                                      f32_4 %103 = OpLoad %9 
                                      f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                      f32_4 %105 = OpLoad %48 
                                      f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                      f32_2 %107 = OpFDiv %104 %106 
                                      f32_4 %108 = OpLoad %9 
                                      f32_4 %109 = OpVectorShuffle %108 %107 4 5 2 3 
                                                     OpStore %9 %109 
                                      f32_4 %115 = OpLoad %9 
                                      f32_2 %116 = OpVectorShuffle %115 %115 3 3 
                                      f32_4 %117 = OpLoad %9 
                                      f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                      f32_2 %119 = OpFMul %116 %118 
                              Output f32_4* %121 = OpAccessChain %114 %27 
                                      f32_4 %122 = OpLoad %121 
                                      f32_4 %123 = OpVectorShuffle %122 %119 4 5 2 3 
                                                     OpStore %121 %123 
                                      f32_4 %124 = OpLoad %9 
                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                              Output f32_4* %126 = OpAccessChain %114 %27 
                                      f32_4 %127 = OpLoad %126 
                                      f32_4 %128 = OpVectorShuffle %127 %125 0 1 4 5 
                                                     OpStore %126 %128 
                                      f32_2 %133 = OpLoad %132 
                                                     OpStore vs_TEXCOORD0 %133 
                                Output f32* %135 = OpAccessChain %114 %27 %110 
                                        f32 %136 = OpLoad %135 
                                        f32 %137 = OpFNegate %136 
                                Output f32* %138 = OpAccessChain %114 %27 %110 
                                                     OpStore %138 %137 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 61
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %56 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpMemberDecorate %30 1 RelaxedPrecision 
                                             OpMemberDecorate %30 1 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate %59 RelaxedPrecision 
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
                                     %30 = OpTypeStruct %23 %6 
                                     %31 = OpTypePointer Uniform %30 
       Uniform struct {f32_4; f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 1 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 0 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %29 = OpLoad %8 
                        Uniform f32* %36 = OpAccessChain %32 %34 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFNegate %37 
                                 f32 %39 = OpFAdd %29 %38 
                                             OpStore %28 %39 
                                 f32 %43 = OpLoad %28 
                                bool %45 = OpFOrdLessThan %43 %44 
                                             OpStore %42 %45 
                                bool %46 = OpLoad %42 
                                 i32 %48 = OpSelect %46 %34 %47 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %47 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                      Uniform f32_4* %58 = OpAccessChain %32 %47 
                               f32_4 %59 = OpLoad %58 
                                             OpStore %56 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 140
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %114 %130 %132 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 130 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %132 Location 132 
                                                     OpDecorate %133 RelaxedPrecision 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                             %75 = OpTypeVector %6 2 
                                         f32 %86 = OpConstant 3.674022E-40 
                                       f32_2 %87 = OpConstantComposite %86 %86 
                                        u32 %110 = OpConstant 1 
                                            %111 = OpTypeArray %6 %110 
                                            %112 = OpTypeStruct %7 %6 %111 
                                            %113 = OpTypePointer Output %112 
       Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                            %120 = OpTypePointer Output %7 
                                            %129 = OpTypePointer Output %75 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %131 = OpTypePointer Input %75 
                               Input f32_2* %132 = OpVariable Input 
                                            %134 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                       f32_4 %76 = OpLoad %9 
                                       f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                       f32_4 %78 = OpLoad %9 
                                       f32_2 %79 = OpVectorShuffle %78 %78 3 3 
                                       f32_2 %80 = OpFDiv %77 %79 
                                       f32_4 %81 = OpLoad %9 
                                       f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 3 
                                                     OpStore %9 %82 
                              Uniform f32_4* %83 = OpAccessChain %20 %27 
                                       f32_4 %84 = OpLoad %83 
                                       f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                       f32_2 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %48 
                                       f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                     OpStore %48 %90 
                                       f32_4 %91 = OpLoad %9 
                                       f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                       f32_4 %93 = OpLoad %48 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                       f32_2 %95 = OpFMul %92 %94 
                                       f32_4 %96 = OpLoad %9 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                     OpStore %9 %97 
                                       f32_4 %98 = OpLoad %9 
                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                      f32_2 %100 = OpExtInst %1 2 %99 
                                      f32_4 %101 = OpLoad %9 
                                      f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                     OpStore %9 %102 
                                      f32_4 %103 = OpLoad %9 
                                      f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                      f32_4 %105 = OpLoad %48 
                                      f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                      f32_2 %107 = OpFDiv %104 %106 
                                      f32_4 %108 = OpLoad %9 
                                      f32_4 %109 = OpVectorShuffle %108 %107 4 5 2 3 
                                                     OpStore %9 %109 
                                      f32_4 %115 = OpLoad %9 
                                      f32_2 %116 = OpVectorShuffle %115 %115 3 3 
                                      f32_4 %117 = OpLoad %9 
                                      f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                      f32_2 %119 = OpFMul %116 %118 
                              Output f32_4* %121 = OpAccessChain %114 %27 
                                      f32_4 %122 = OpLoad %121 
                                      f32_4 %123 = OpVectorShuffle %122 %119 4 5 2 3 
                                                     OpStore %121 %123 
                                      f32_4 %124 = OpLoad %9 
                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                              Output f32_4* %126 = OpAccessChain %114 %27 
                                      f32_4 %127 = OpLoad %126 
                                      f32_4 %128 = OpVectorShuffle %127 %125 0 1 4 5 
                                                     OpStore %126 %128 
                                      f32_2 %133 = OpLoad %132 
                                                     OpStore vs_TEXCOORD0 %133 
                                Output f32* %135 = OpAccessChain %114 %27 %110 
                                        f32 %136 = OpLoad %135 
                                        f32 %137 = OpFNegate %136 
                                Output f32* %138 = OpAccessChain %114 %27 %110 
                                                     OpStore %138 %137 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 61
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %56 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpMemberDecorate %30 1 RelaxedPrecision 
                                             OpMemberDecorate %30 1 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate %59 RelaxedPrecision 
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
                                     %30 = OpTypeStruct %23 %6 
                                     %31 = OpTypePointer Uniform %30 
       Uniform struct {f32_4; f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 1 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 0 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %29 = OpLoad %8 
                        Uniform f32* %36 = OpAccessChain %32 %34 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFNegate %37 
                                 f32 %39 = OpFAdd %29 %38 
                                             OpStore %28 %39 
                                 f32 %43 = OpLoad %28 
                                bool %45 = OpFOrdLessThan %43 %44 
                                             OpStore %42 %45 
                                bool %46 = OpLoad %42 
                                 i32 %48 = OpSelect %46 %34 %47 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %47 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                      Uniform f32_4* %58 = OpAccessChain %32 %47 
                               f32_4 %59 = OpLoad %58 
                                             OpStore %56 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "PIXELSNAP_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 140
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %114 %130 %132 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 130 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %132 Location 132 
                                                     OpDecorate %133 RelaxedPrecision 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                             %75 = OpTypeVector %6 2 
                                         f32 %86 = OpConstant 3.674022E-40 
                                       f32_2 %87 = OpConstantComposite %86 %86 
                                        u32 %110 = OpConstant 1 
                                            %111 = OpTypeArray %6 %110 
                                            %112 = OpTypeStruct %7 %6 %111 
                                            %113 = OpTypePointer Output %112 
       Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                            %120 = OpTypePointer Output %7 
                                            %129 = OpTypePointer Output %75 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %131 = OpTypePointer Input %75 
                               Input f32_2* %132 = OpVariable Input 
                                            %134 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                       f32_4 %76 = OpLoad %9 
                                       f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                       f32_4 %78 = OpLoad %9 
                                       f32_2 %79 = OpVectorShuffle %78 %78 3 3 
                                       f32_2 %80 = OpFDiv %77 %79 
                                       f32_4 %81 = OpLoad %9 
                                       f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 3 
                                                     OpStore %9 %82 
                              Uniform f32_4* %83 = OpAccessChain %20 %27 
                                       f32_4 %84 = OpLoad %83 
                                       f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                       f32_2 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %48 
                                       f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                     OpStore %48 %90 
                                       f32_4 %91 = OpLoad %9 
                                       f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                       f32_4 %93 = OpLoad %48 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                       f32_2 %95 = OpFMul %92 %94 
                                       f32_4 %96 = OpLoad %9 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                     OpStore %9 %97 
                                       f32_4 %98 = OpLoad %9 
                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                      f32_2 %100 = OpExtInst %1 2 %99 
                                      f32_4 %101 = OpLoad %9 
                                      f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                     OpStore %9 %102 
                                      f32_4 %103 = OpLoad %9 
                                      f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                      f32_4 %105 = OpLoad %48 
                                      f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                      f32_2 %107 = OpFDiv %104 %106 
                                      f32_4 %108 = OpLoad %9 
                                      f32_4 %109 = OpVectorShuffle %108 %107 4 5 2 3 
                                                     OpStore %9 %109 
                                      f32_4 %115 = OpLoad %9 
                                      f32_2 %116 = OpVectorShuffle %115 %115 3 3 
                                      f32_4 %117 = OpLoad %9 
                                      f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                      f32_2 %119 = OpFMul %116 %118 
                              Output f32_4* %121 = OpAccessChain %114 %27 
                                      f32_4 %122 = OpLoad %121 
                                      f32_4 %123 = OpVectorShuffle %122 %119 4 5 2 3 
                                                     OpStore %121 %123 
                                      f32_4 %124 = OpLoad %9 
                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                              Output f32_4* %126 = OpAccessChain %114 %27 
                                      f32_4 %127 = OpLoad %126 
                                      f32_4 %128 = OpVectorShuffle %127 %125 0 1 4 5 
                                                     OpStore %126 %128 
                                      f32_2 %133 = OpLoad %132 
                                                     OpStore vs_TEXCOORD0 %133 
                                Output f32* %135 = OpAccessChain %114 %27 %110 
                                        f32 %136 = OpLoad %135 
                                        f32 %137 = OpFNegate %136 
                                Output f32* %138 = OpAccessChain %114 %27 %110 
                                                     OpStore %138 %137 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 61
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %56 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %27 RelaxedPrecision 
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpMemberDecorate %30 1 RelaxedPrecision 
                                             OpMemberDecorate %30 1 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate %59 RelaxedPrecision 
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
                                     %30 = OpTypeStruct %23 %6 
                                     %31 = OpTypePointer Uniform %30 
       Uniform struct {f32_4; f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 1 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 0 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %29 = OpLoad %8 
                        Uniform f32* %36 = OpAccessChain %32 %34 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFNegate %37 
                                 f32 %39 = OpFAdd %29 %38 
                                             OpStore %28 %39 
                                 f32 %43 = OpLoad %28 
                                bool %45 = OpFOrdLessThan %43 %44 
                                             OpStore %42 %45 
                                bool %46 = OpLoad %42 
                                 i32 %48 = OpSelect %46 %34 %47 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %47 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                      Uniform f32_4* %58 = OpAccessChain %32 %47 
                               f32_4 %59 = OpLoad %58 
                                             OpStore %56 %59 
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = (-u_xlat16_2) + u_xlat16_0;
    u_xlat0 = _EnableExternalAlpha * u_xlat0 + u_xlat16_2;
    u_xlat16_1 = u_xlat0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = (-u_xlat16_2) + u_xlat16_0;
    u_xlat0 = _EnableExternalAlpha * u_xlat0 + u_xlat16_2;
    u_xlat16_1 = u_xlat0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = (-u_xlat16_2) + u_xlat16_0;
    u_xlat0 = _EnableExternalAlpha * u_xlat0 + u_xlat16_2;
    u_xlat16_1 = u_xlat0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 83
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %78 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
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
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpMemberDecorate %43 0 Offset 43 
                                             OpMemberDecorate %43 1 RelaxedPrecision 
                                             OpMemberDecorate %43 1 Offset 43 
                                             OpMemberDecorate %43 2 RelaxedPrecision 
                                             OpMemberDecorate %43 2 Offset 43 
                                             OpDecorate %43 Block 
                                             OpDecorate %45 DescriptorSet 45 
                                             OpDecorate %45 Binding 45 
                                             OpDecorate %53 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %59 RelaxedPrecision 
                                             OpDecorate %60 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %78 RelaxedPrecision 
                                             OpDecorate %78 Location 78 
                                             OpDecorate %81 RelaxedPrecision 
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
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
                                 u32 %36 = OpConstant 3 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypeStruct %6 %23 %6 
                                     %44 = OpTypePointer Uniform %43 
  Uniform struct {f32; f32_4; f32;}* %45 = OpVariable Uniform 
                                     %46 = OpTypeInt 32 1 
                                 i32 %47 = OpConstant 0 
                                     %48 = OpTypePointer Uniform %6 
                        Private f32* %55 = OpVariable Private 
                                 i32 %57 = OpConstant 2 
                                     %62 = OpTypeBool 
                                     %63 = OpTypePointer Private %62 
                       Private bool* %64 = OpVariable Private 
                                 f32 %66 = OpConstant 3.674022E-40 
                                 i32 %69 = OpConstant 1 
                                 i32 %71 = OpConstant -1 
                                     %77 = OpTypePointer Output %23 
                       Output f32_4* %78 = OpVariable Output 
                                     %79 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %34 = OpLoad vs_TEXCOORD0 
                               f32_4 %35 = OpImageSampleImplicitLod %33 %34 
                                 f32 %37 = OpCompositeExtract %35 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpFNegate %39 
                                 f32 %41 = OpLoad %8 
                                 f32 %42 = OpFAdd %40 %41 
                                             OpStore %38 %42 
                        Uniform f32* %49 = OpAccessChain %45 %47 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpLoad %38 
                                 f32 %52 = OpFMul %50 %51 
                                 f32 %53 = OpLoad %28 
                                 f32 %54 = OpFAdd %52 %53 
                                             OpStore %38 %54 
                                 f32 %56 = OpLoad %38 
                        Uniform f32* %58 = OpAccessChain %45 %57 
                                 f32 %59 = OpLoad %58 
                                 f32 %60 = OpFNegate %59 
                                 f32 %61 = OpFAdd %56 %60 
                                             OpStore %55 %61 
                                 f32 %65 = OpLoad %55 
                                bool %67 = OpFOrdLessThan %65 %66 
                                             OpStore %64 %67 
                                bool %68 = OpLoad %64 
                                 i32 %70 = OpSelect %68 %69 %47 
                                 i32 %72 = OpIMul %70 %71 
                                bool %73 = OpINotEqual %72 %47 
                                             OpSelectionMerge %75 None 
                                             OpBranchConditional %73 %74 %75 
                                     %74 = OpLabel 
                                             OpKill
                                     %75 = OpLabel 
                      Uniform f32_4* %80 = OpAccessChain %45 %69 
                               f32_4 %81 = OpLoad %80 
                                             OpStore %78 %81 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 83
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %78 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
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
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpMemberDecorate %43 0 Offset 43 
                                             OpMemberDecorate %43 1 RelaxedPrecision 
                                             OpMemberDecorate %43 1 Offset 43 
                                             OpMemberDecorate %43 2 RelaxedPrecision 
                                             OpMemberDecorate %43 2 Offset 43 
                                             OpDecorate %43 Block 
                                             OpDecorate %45 DescriptorSet 45 
                                             OpDecorate %45 Binding 45 
                                             OpDecorate %53 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %59 RelaxedPrecision 
                                             OpDecorate %60 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %78 RelaxedPrecision 
                                             OpDecorate %78 Location 78 
                                             OpDecorate %81 RelaxedPrecision 
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
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
                                 u32 %36 = OpConstant 3 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypeStruct %6 %23 %6 
                                     %44 = OpTypePointer Uniform %43 
  Uniform struct {f32; f32_4; f32;}* %45 = OpVariable Uniform 
                                     %46 = OpTypeInt 32 1 
                                 i32 %47 = OpConstant 0 
                                     %48 = OpTypePointer Uniform %6 
                        Private f32* %55 = OpVariable Private 
                                 i32 %57 = OpConstant 2 
                                     %62 = OpTypeBool 
                                     %63 = OpTypePointer Private %62 
                       Private bool* %64 = OpVariable Private 
                                 f32 %66 = OpConstant 3.674022E-40 
                                 i32 %69 = OpConstant 1 
                                 i32 %71 = OpConstant -1 
                                     %77 = OpTypePointer Output %23 
                       Output f32_4* %78 = OpVariable Output 
                                     %79 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %34 = OpLoad vs_TEXCOORD0 
                               f32_4 %35 = OpImageSampleImplicitLod %33 %34 
                                 f32 %37 = OpCompositeExtract %35 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpFNegate %39 
                                 f32 %41 = OpLoad %8 
                                 f32 %42 = OpFAdd %40 %41 
                                             OpStore %38 %42 
                        Uniform f32* %49 = OpAccessChain %45 %47 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpLoad %38 
                                 f32 %52 = OpFMul %50 %51 
                                 f32 %53 = OpLoad %28 
                                 f32 %54 = OpFAdd %52 %53 
                                             OpStore %38 %54 
                                 f32 %56 = OpLoad %38 
                        Uniform f32* %58 = OpAccessChain %45 %57 
                                 f32 %59 = OpLoad %58 
                                 f32 %60 = OpFNegate %59 
                                 f32 %61 = OpFAdd %56 %60 
                                             OpStore %55 %61 
                                 f32 %65 = OpLoad %55 
                                bool %67 = OpFOrdLessThan %65 %66 
                                             OpStore %64 %67 
                                bool %68 = OpLoad %64 
                                 i32 %70 = OpSelect %68 %69 %47 
                                 i32 %72 = OpIMul %70 %71 
                                bool %73 = OpINotEqual %72 %47 
                                             OpSelectionMerge %75 None 
                                             OpBranchConditional %73 %74 %75 
                                     %74 = OpLabel 
                                             OpKill
                                     %75 = OpLabel 
                      Uniform f32_4* %80 = OpAccessChain %45 %69 
                               f32_4 %81 = OpLoad %80 
                                             OpStore %78 %81 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "ETC1_EXTERNAL_ALPHA" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 94
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %72 %84 %86 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %70 0 BuiltIn 70 
                                              OpMemberDecorate %70 1 BuiltIn 70 
                                              OpMemberDecorate %70 2 BuiltIn 70 
                                              OpDecorate %70 Block 
                                              OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 84 
                                              OpDecorate %86 RelaxedPrecision 
                                              OpDecorate %86 Location 86 
                                              OpDecorate %87 RelaxedPrecision 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %68 = OpConstant 1 
                                      %69 = OpTypeArray %6 %68 
                                      %70 = OpTypeStruct %7 %6 %69 
                                      %71 = OpTypePointer Output %70 
 Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                      %80 = OpTypePointer Output %7 
                                      %82 = OpTypeVector %6 2 
                                      %83 = OpTypePointer Output %82 
               Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Input %82 
                         Input f32_2* %86 = OpVariable Input 
                                      %88 = OpTypePointer Output %6 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                                f32_4 %12 = OpLoad %11 
                                f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                       Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                f32_4 %26 = OpLoad %25 
                                f32_4 %27 = OpFMul %13 %26 
                                              OpStore %9 %27 
                       Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                f32_4 %29 = OpLoad %28 
                                f32_4 %30 = OpLoad %11 
                                f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                f32_4 %32 = OpFMul %29 %31 
                                f32_4 %33 = OpLoad %9 
                                f32_4 %34 = OpFAdd %32 %33 
                                              OpStore %9 %34 
                       Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                f32_4 %37 = OpLoad %36 
                                f32_4 %38 = OpLoad %11 
                                f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                f32_4 %40 = OpFMul %37 %39 
                                f32_4 %41 = OpLoad %9 
                                f32_4 %42 = OpFAdd %40 %41 
                                              OpStore %9 %42 
                                f32_4 %43 = OpLoad %9 
                       Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                f32_4 %46 = OpLoad %45 
                                f32_4 %47 = OpFAdd %43 %46 
                                              OpStore %9 %47 
                                f32_4 %49 = OpLoad %9 
                                f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                       Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                f32_4 %52 = OpLoad %51 
                                f32_4 %53 = OpFMul %50 %52 
                                              OpStore %48 %53 
                       Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                f32_4 %55 = OpLoad %54 
                                f32_4 %56 = OpLoad %9 
                                f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                f32_4 %58 = OpFMul %55 %57 
                                f32_4 %59 = OpLoad %48 
                                f32_4 %60 = OpFAdd %58 %59 
                                              OpStore %48 %60 
                       Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                f32_4 %62 = OpLoad %61 
                                f32_4 %63 = OpLoad %9 
                                f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                f32_4 %65 = OpFMul %62 %64 
                                f32_4 %66 = OpLoad %48 
                                f32_4 %67 = OpFAdd %65 %66 
                                              OpStore %48 %67 
                       Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                f32_4 %74 = OpLoad %73 
                                f32_4 %75 = OpLoad %9 
                                f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                f32_4 %77 = OpFMul %74 %76 
                                f32_4 %78 = OpLoad %48 
                                f32_4 %79 = OpFAdd %77 %78 
                        Output f32_4* %81 = OpAccessChain %72 %22 
                                              OpStore %81 %79 
                                f32_2 %87 = OpLoad %86 
                                              OpStore vs_TEXCOORD0 %87 
                          Output f32* %89 = OpAccessChain %72 %22 %68 
                                  f32 %90 = OpLoad %89 
                                  f32 %91 = OpFNegate %90 
                          Output f32* %92 = OpAccessChain %72 %22 %68 
                                              OpStore %92 %91 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 83
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %78 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
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
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpMemberDecorate %43 0 Offset 43 
                                             OpMemberDecorate %43 1 RelaxedPrecision 
                                             OpMemberDecorate %43 1 Offset 43 
                                             OpMemberDecorate %43 2 RelaxedPrecision 
                                             OpMemberDecorate %43 2 Offset 43 
                                             OpDecorate %43 Block 
                                             OpDecorate %45 DescriptorSet 45 
                                             OpDecorate %45 Binding 45 
                                             OpDecorate %53 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %59 RelaxedPrecision 
                                             OpDecorate %60 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %78 RelaxedPrecision 
                                             OpDecorate %78 Location 78 
                                             OpDecorate %81 RelaxedPrecision 
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
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
                                 u32 %36 = OpConstant 3 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypeStruct %6 %23 %6 
                                     %44 = OpTypePointer Uniform %43 
  Uniform struct {f32; f32_4; f32;}* %45 = OpVariable Uniform 
                                     %46 = OpTypeInt 32 1 
                                 i32 %47 = OpConstant 0 
                                     %48 = OpTypePointer Uniform %6 
                        Private f32* %55 = OpVariable Private 
                                 i32 %57 = OpConstant 2 
                                     %62 = OpTypeBool 
                                     %63 = OpTypePointer Private %62 
                       Private bool* %64 = OpVariable Private 
                                 f32 %66 = OpConstant 3.674022E-40 
                                 i32 %69 = OpConstant 1 
                                 i32 %71 = OpConstant -1 
                                     %77 = OpTypePointer Output %23 
                       Output f32_4* %78 = OpVariable Output 
                                     %79 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %34 = OpLoad vs_TEXCOORD0 
                               f32_4 %35 = OpImageSampleImplicitLod %33 %34 
                                 f32 %37 = OpCompositeExtract %35 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpFNegate %39 
                                 f32 %41 = OpLoad %8 
                                 f32 %42 = OpFAdd %40 %41 
                                             OpStore %38 %42 
                        Uniform f32* %49 = OpAccessChain %45 %47 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpLoad %38 
                                 f32 %52 = OpFMul %50 %51 
                                 f32 %53 = OpLoad %28 
                                 f32 %54 = OpFAdd %52 %53 
                                             OpStore %38 %54 
                                 f32 %56 = OpLoad %38 
                        Uniform f32* %58 = OpAccessChain %45 %57 
                                 f32 %59 = OpLoad %58 
                                 f32 %60 = OpFNegate %59 
                                 f32 %61 = OpFAdd %56 %60 
                                             OpStore %55 %61 
                                 f32 %65 = OpLoad %55 
                                bool %67 = OpFOrdLessThan %65 %66 
                                             OpStore %64 %67 
                                bool %68 = OpLoad %64 
                                 i32 %70 = OpSelect %68 %69 %47 
                                 i32 %72 = OpIMul %70 %71 
                                bool %73 = OpINotEqual %72 %47 
                                             OpSelectionMerge %75 None 
                                             OpBranchConditional %73 %74 %75 
                                     %74 = OpLabel 
                                             OpKill
                                     %75 = OpLabel 
                      Uniform f32_4* %80 = OpAccessChain %45 %69 
                               f32_4 %81 = OpLoad %80 
                                             OpStore %78 %81 
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = (-u_xlat16_2) + u_xlat16_0;
    u_xlat0 = _EnableExternalAlpha * u_xlat0 + u_xlat16_2;
    u_xlat16_1 = u_xlat0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = (-u_xlat16_2) + u_xlat16_0;
    u_xlat0 = _EnableExternalAlpha * u_xlat0 + u_xlat16_2;
    u_xlat16_1 = u_xlat0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat1.xy = _ScreenParams.xy * vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xy;
    u_xlat0.xy = roundEven(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy / u_xlat1.xy;
    gl_Position.xy = u_xlat0.ww * u_xlat0.xy;
    gl_Position.zw = u_xlat0.zw;
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
uniform 	mediump vec4 _Color;
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _AlphaTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
void main()
{
    u_xlat16_0 = texture(_AlphaTex, vs_TEXCOORD0.xy).x;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat0 = (-u_xlat16_2) + u_xlat16_0;
    u_xlat0 = _EnableExternalAlpha * u_xlat0 + u_xlat16_2;
    u_xlat16_1 = u_xlat0 + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = _Color;
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
; Bound: 140
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %114 %130 %132 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 130 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %132 Location 132 
                                                     OpDecorate %133 RelaxedPrecision 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                             %75 = OpTypeVector %6 2 
                                         f32 %86 = OpConstant 3.674022E-40 
                                       f32_2 %87 = OpConstantComposite %86 %86 
                                        u32 %110 = OpConstant 1 
                                            %111 = OpTypeArray %6 %110 
                                            %112 = OpTypeStruct %7 %6 %111 
                                            %113 = OpTypePointer Output %112 
       Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                            %120 = OpTypePointer Output %7 
                                            %129 = OpTypePointer Output %75 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %131 = OpTypePointer Input %75 
                               Input f32_2* %132 = OpVariable Input 
                                            %134 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                       f32_4 %76 = OpLoad %9 
                                       f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                       f32_4 %78 = OpLoad %9 
                                       f32_2 %79 = OpVectorShuffle %78 %78 3 3 
                                       f32_2 %80 = OpFDiv %77 %79 
                                       f32_4 %81 = OpLoad %9 
                                       f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 3 
                                                     OpStore %9 %82 
                              Uniform f32_4* %83 = OpAccessChain %20 %27 
                                       f32_4 %84 = OpLoad %83 
                                       f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                       f32_2 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %48 
                                       f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                     OpStore %48 %90 
                                       f32_4 %91 = OpLoad %9 
                                       f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                       f32_4 %93 = OpLoad %48 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                       f32_2 %95 = OpFMul %92 %94 
                                       f32_4 %96 = OpLoad %9 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                     OpStore %9 %97 
                                       f32_4 %98 = OpLoad %9 
                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                      f32_2 %100 = OpExtInst %1 2 %99 
                                      f32_4 %101 = OpLoad %9 
                                      f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                     OpStore %9 %102 
                                      f32_4 %103 = OpLoad %9 
                                      f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                      f32_4 %105 = OpLoad %48 
                                      f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                      f32_2 %107 = OpFDiv %104 %106 
                                      f32_4 %108 = OpLoad %9 
                                      f32_4 %109 = OpVectorShuffle %108 %107 4 5 2 3 
                                                     OpStore %9 %109 
                                      f32_4 %115 = OpLoad %9 
                                      f32_2 %116 = OpVectorShuffle %115 %115 3 3 
                                      f32_4 %117 = OpLoad %9 
                                      f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                      f32_2 %119 = OpFMul %116 %118 
                              Output f32_4* %121 = OpAccessChain %114 %27 
                                      f32_4 %122 = OpLoad %121 
                                      f32_4 %123 = OpVectorShuffle %122 %119 4 5 2 3 
                                                     OpStore %121 %123 
                                      f32_4 %124 = OpLoad %9 
                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                              Output f32_4* %126 = OpAccessChain %114 %27 
                                      f32_4 %127 = OpLoad %126 
                                      f32_4 %128 = OpVectorShuffle %127 %125 0 1 4 5 
                                                     OpStore %126 %128 
                                      f32_2 %133 = OpLoad %132 
                                                     OpStore vs_TEXCOORD0 %133 
                                Output f32* %135 = OpAccessChain %114 %27 %110 
                                        f32 %136 = OpLoad %135 
                                        f32 %137 = OpFNegate %136 
                                Output f32* %138 = OpAccessChain %114 %27 %110 
                                                     OpStore %138 %137 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 83
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %78 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
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
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpMemberDecorate %43 0 Offset 43 
                                             OpMemberDecorate %43 1 RelaxedPrecision 
                                             OpMemberDecorate %43 1 Offset 43 
                                             OpMemberDecorate %43 2 RelaxedPrecision 
                                             OpMemberDecorate %43 2 Offset 43 
                                             OpDecorate %43 Block 
                                             OpDecorate %45 DescriptorSet 45 
                                             OpDecorate %45 Binding 45 
                                             OpDecorate %53 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %59 RelaxedPrecision 
                                             OpDecorate %60 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %78 RelaxedPrecision 
                                             OpDecorate %78 Location 78 
                                             OpDecorate %81 RelaxedPrecision 
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
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
                                 u32 %36 = OpConstant 3 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypeStruct %6 %23 %6 
                                     %44 = OpTypePointer Uniform %43 
  Uniform struct {f32; f32_4; f32;}* %45 = OpVariable Uniform 
                                     %46 = OpTypeInt 32 1 
                                 i32 %47 = OpConstant 0 
                                     %48 = OpTypePointer Uniform %6 
                        Private f32* %55 = OpVariable Private 
                                 i32 %57 = OpConstant 2 
                                     %62 = OpTypeBool 
                                     %63 = OpTypePointer Private %62 
                       Private bool* %64 = OpVariable Private 
                                 f32 %66 = OpConstant 3.674022E-40 
                                 i32 %69 = OpConstant 1 
                                 i32 %71 = OpConstant -1 
                                     %77 = OpTypePointer Output %23 
                       Output f32_4* %78 = OpVariable Output 
                                     %79 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %34 = OpLoad vs_TEXCOORD0 
                               f32_4 %35 = OpImageSampleImplicitLod %33 %34 
                                 f32 %37 = OpCompositeExtract %35 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpFNegate %39 
                                 f32 %41 = OpLoad %8 
                                 f32 %42 = OpFAdd %40 %41 
                                             OpStore %38 %42 
                        Uniform f32* %49 = OpAccessChain %45 %47 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpLoad %38 
                                 f32 %52 = OpFMul %50 %51 
                                 f32 %53 = OpLoad %28 
                                 f32 %54 = OpFAdd %52 %53 
                                             OpStore %38 %54 
                                 f32 %56 = OpLoad %38 
                        Uniform f32* %58 = OpAccessChain %45 %57 
                                 f32 %59 = OpLoad %58 
                                 f32 %60 = OpFNegate %59 
                                 f32 %61 = OpFAdd %56 %60 
                                             OpStore %55 %61 
                                 f32 %65 = OpLoad %55 
                                bool %67 = OpFOrdLessThan %65 %66 
                                             OpStore %64 %67 
                                bool %68 = OpLoad %64 
                                 i32 %70 = OpSelect %68 %69 %47 
                                 i32 %72 = OpIMul %70 %71 
                                bool %73 = OpINotEqual %72 %47 
                                             OpSelectionMerge %75 None 
                                             OpBranchConditional %73 %74 %75 
                                     %74 = OpLabel 
                                             OpKill
                                     %75 = OpLabel 
                      Uniform f32_4* %80 = OpAccessChain %45 %69 
                               f32_4 %81 = OpLoad %80 
                                             OpStore %78 %81 
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
; Bound: 140
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %114 %130 %132 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 130 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %132 Location 132 
                                                     OpDecorate %133 RelaxedPrecision 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                             %75 = OpTypeVector %6 2 
                                         f32 %86 = OpConstant 3.674022E-40 
                                       f32_2 %87 = OpConstantComposite %86 %86 
                                        u32 %110 = OpConstant 1 
                                            %111 = OpTypeArray %6 %110 
                                            %112 = OpTypeStruct %7 %6 %111 
                                            %113 = OpTypePointer Output %112 
       Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                            %120 = OpTypePointer Output %7 
                                            %129 = OpTypePointer Output %75 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %131 = OpTypePointer Input %75 
                               Input f32_2* %132 = OpVariable Input 
                                            %134 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                       f32_4 %76 = OpLoad %9 
                                       f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                       f32_4 %78 = OpLoad %9 
                                       f32_2 %79 = OpVectorShuffle %78 %78 3 3 
                                       f32_2 %80 = OpFDiv %77 %79 
                                       f32_4 %81 = OpLoad %9 
                                       f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 3 
                                                     OpStore %9 %82 
                              Uniform f32_4* %83 = OpAccessChain %20 %27 
                                       f32_4 %84 = OpLoad %83 
                                       f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                       f32_2 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %48 
                                       f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                     OpStore %48 %90 
                                       f32_4 %91 = OpLoad %9 
                                       f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                       f32_4 %93 = OpLoad %48 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                       f32_2 %95 = OpFMul %92 %94 
                                       f32_4 %96 = OpLoad %9 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                     OpStore %9 %97 
                                       f32_4 %98 = OpLoad %9 
                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                      f32_2 %100 = OpExtInst %1 2 %99 
                                      f32_4 %101 = OpLoad %9 
                                      f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                     OpStore %9 %102 
                                      f32_4 %103 = OpLoad %9 
                                      f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                      f32_4 %105 = OpLoad %48 
                                      f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                      f32_2 %107 = OpFDiv %104 %106 
                                      f32_4 %108 = OpLoad %9 
                                      f32_4 %109 = OpVectorShuffle %108 %107 4 5 2 3 
                                                     OpStore %9 %109 
                                      f32_4 %115 = OpLoad %9 
                                      f32_2 %116 = OpVectorShuffle %115 %115 3 3 
                                      f32_4 %117 = OpLoad %9 
                                      f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                      f32_2 %119 = OpFMul %116 %118 
                              Output f32_4* %121 = OpAccessChain %114 %27 
                                      f32_4 %122 = OpLoad %121 
                                      f32_4 %123 = OpVectorShuffle %122 %119 4 5 2 3 
                                                     OpStore %121 %123 
                                      f32_4 %124 = OpLoad %9 
                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                              Output f32_4* %126 = OpAccessChain %114 %27 
                                      f32_4 %127 = OpLoad %126 
                                      f32_4 %128 = OpVectorShuffle %127 %125 0 1 4 5 
                                                     OpStore %126 %128 
                                      f32_2 %133 = OpLoad %132 
                                                     OpStore vs_TEXCOORD0 %133 
                                Output f32* %135 = OpAccessChain %114 %27 %110 
                                        f32 %136 = OpLoad %135 
                                        f32 %137 = OpFNegate %136 
                                Output f32* %138 = OpAccessChain %114 %27 %110 
                                                     OpStore %138 %137 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 83
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %78 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
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
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpMemberDecorate %43 0 Offset 43 
                                             OpMemberDecorate %43 1 RelaxedPrecision 
                                             OpMemberDecorate %43 1 Offset 43 
                                             OpMemberDecorate %43 2 RelaxedPrecision 
                                             OpMemberDecorate %43 2 Offset 43 
                                             OpDecorate %43 Block 
                                             OpDecorate %45 DescriptorSet 45 
                                             OpDecorate %45 Binding 45 
                                             OpDecorate %53 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %59 RelaxedPrecision 
                                             OpDecorate %60 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %78 RelaxedPrecision 
                                             OpDecorate %78 Location 78 
                                             OpDecorate %81 RelaxedPrecision 
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
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
                                 u32 %36 = OpConstant 3 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypeStruct %6 %23 %6 
                                     %44 = OpTypePointer Uniform %43 
  Uniform struct {f32; f32_4; f32;}* %45 = OpVariable Uniform 
                                     %46 = OpTypeInt 32 1 
                                 i32 %47 = OpConstant 0 
                                     %48 = OpTypePointer Uniform %6 
                        Private f32* %55 = OpVariable Private 
                                 i32 %57 = OpConstant 2 
                                     %62 = OpTypeBool 
                                     %63 = OpTypePointer Private %62 
                       Private bool* %64 = OpVariable Private 
                                 f32 %66 = OpConstant 3.674022E-40 
                                 i32 %69 = OpConstant 1 
                                 i32 %71 = OpConstant -1 
                                     %77 = OpTypePointer Output %23 
                       Output f32_4* %78 = OpVariable Output 
                                     %79 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %34 = OpLoad vs_TEXCOORD0 
                               f32_4 %35 = OpImageSampleImplicitLod %33 %34 
                                 f32 %37 = OpCompositeExtract %35 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpFNegate %39 
                                 f32 %41 = OpLoad %8 
                                 f32 %42 = OpFAdd %40 %41 
                                             OpStore %38 %42 
                        Uniform f32* %49 = OpAccessChain %45 %47 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpLoad %38 
                                 f32 %52 = OpFMul %50 %51 
                                 f32 %53 = OpLoad %28 
                                 f32 %54 = OpFAdd %52 %53 
                                             OpStore %38 %54 
                                 f32 %56 = OpLoad %38 
                        Uniform f32* %58 = OpAccessChain %45 %57 
                                 f32 %59 = OpLoad %58 
                                 f32 %60 = OpFNegate %59 
                                 f32 %61 = OpFAdd %56 %60 
                                             OpStore %55 %61 
                                 f32 %65 = OpLoad %55 
                                bool %67 = OpFOrdLessThan %65 %66 
                                             OpStore %64 %67 
                                bool %68 = OpLoad %64 
                                 i32 %70 = OpSelect %68 %69 %47 
                                 i32 %72 = OpIMul %70 %71 
                                bool %73 = OpINotEqual %72 %47 
                                             OpSelectionMerge %75 None 
                                             OpBranchConditional %73 %74 %75 
                                     %74 = OpLabel 
                                             OpKill
                                     %75 = OpLabel 
                      Uniform f32_4* %80 = OpAccessChain %45 %69 
                               f32_4 %81 = OpLoad %80 
                                             OpStore %78 %81 
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
; Bound: 140
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %114 %130 %132 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %112 0 BuiltIn 112 
                                                     OpMemberDecorate %112 1 BuiltIn 112 
                                                     OpMemberDecorate %112 2 BuiltIn 112 
                                                     OpDecorate %112 Block 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 130 
                                                     OpDecorate %132 RelaxedPrecision 
                                                     OpDecorate %132 Location 132 
                                                     OpDecorate %133 RelaxedPrecision 
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
                                             %18 = OpTypeStruct %7 %16 %17 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 1 
                                             %23 = OpTypePointer Uniform %7 
                                         i32 %27 = OpConstant 0 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                             %75 = OpTypeVector %6 2 
                                         f32 %86 = OpConstant 3.674022E-40 
                                       f32_2 %87 = OpConstantComposite %86 %86 
                                        u32 %110 = OpConstant 1 
                                            %111 = OpTypeArray %6 %110 
                                            %112 = OpTypeStruct %7 %6 %111 
                                            %113 = OpTypePointer Output %112 
       Output struct {f32_4; f32; f32[1];}* %114 = OpVariable Output 
                                            %120 = OpTypePointer Output %7 
                                            %129 = OpTypePointer Output %75 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %131 = OpTypePointer Input %75 
                               Input f32_2* %132 = OpVariable Input 
                                            %134 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %13 %25 
                                                     OpStore %9 %26 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %27 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %35 %22 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %35 %27 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %35 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %68 = OpAccessChain %20 %35 %44 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpLoad %9 
                                       f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                       f32_4 %72 = OpFMul %69 %71 
                                       f32_4 %73 = OpLoad %48 
                                       f32_4 %74 = OpFAdd %72 %73 
                                                     OpStore %9 %74 
                                       f32_4 %76 = OpLoad %9 
                                       f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                       f32_4 %78 = OpLoad %9 
                                       f32_2 %79 = OpVectorShuffle %78 %78 3 3 
                                       f32_2 %80 = OpFDiv %77 %79 
                                       f32_4 %81 = OpLoad %9 
                                       f32_4 %82 = OpVectorShuffle %81 %80 4 5 2 3 
                                                     OpStore %9 %82 
                              Uniform f32_4* %83 = OpAccessChain %20 %27 
                                       f32_4 %84 = OpLoad %83 
                                       f32_2 %85 = OpVectorShuffle %84 %84 0 1 
                                       f32_2 %88 = OpFMul %85 %87 
                                       f32_4 %89 = OpLoad %48 
                                       f32_4 %90 = OpVectorShuffle %89 %88 4 5 2 3 
                                                     OpStore %48 %90 
                                       f32_4 %91 = OpLoad %9 
                                       f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                       f32_4 %93 = OpLoad %48 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 1 
                                       f32_2 %95 = OpFMul %92 %94 
                                       f32_4 %96 = OpLoad %9 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                     OpStore %9 %97 
                                       f32_4 %98 = OpLoad %9 
                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                      f32_2 %100 = OpExtInst %1 2 %99 
                                      f32_4 %101 = OpLoad %9 
                                      f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                                                     OpStore %9 %102 
                                      f32_4 %103 = OpLoad %9 
                                      f32_2 %104 = OpVectorShuffle %103 %103 0 1 
                                      f32_4 %105 = OpLoad %48 
                                      f32_2 %106 = OpVectorShuffle %105 %105 0 1 
                                      f32_2 %107 = OpFDiv %104 %106 
                                      f32_4 %108 = OpLoad %9 
                                      f32_4 %109 = OpVectorShuffle %108 %107 4 5 2 3 
                                                     OpStore %9 %109 
                                      f32_4 %115 = OpLoad %9 
                                      f32_2 %116 = OpVectorShuffle %115 %115 3 3 
                                      f32_4 %117 = OpLoad %9 
                                      f32_2 %118 = OpVectorShuffle %117 %117 0 1 
                                      f32_2 %119 = OpFMul %116 %118 
                              Output f32_4* %121 = OpAccessChain %114 %27 
                                      f32_4 %122 = OpLoad %121 
                                      f32_4 %123 = OpVectorShuffle %122 %119 4 5 2 3 
                                                     OpStore %121 %123 
                                      f32_4 %124 = OpLoad %9 
                                      f32_2 %125 = OpVectorShuffle %124 %124 2 3 
                              Output f32_4* %126 = OpAccessChain %114 %27 
                                      f32_4 %127 = OpLoad %126 
                                      f32_4 %128 = OpVectorShuffle %127 %125 0 1 4 5 
                                                     OpStore %126 %128 
                                      f32_2 %133 = OpLoad %132 
                                                     OpStore vs_TEXCOORD0 %133 
                                Output f32* %135 = OpAccessChain %114 %27 %110 
                                        f32 %136 = OpLoad %135 
                                        f32 %137 = OpFNegate %136 
                                Output f32* %138 = OpAccessChain %114 %27 %110 
                                                     OpStore %138 %137 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 83
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %78 
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
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %22 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
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
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpMemberDecorate %43 0 Offset 43 
                                             OpMemberDecorate %43 1 RelaxedPrecision 
                                             OpMemberDecorate %43 1 Offset 43 
                                             OpMemberDecorate %43 2 RelaxedPrecision 
                                             OpMemberDecorate %43 2 Offset 43 
                                             OpDecorate %43 Block 
                                             OpDecorate %45 DescriptorSet 45 
                                             OpDecorate %45 Binding 45 
                                             OpDecorate %53 RelaxedPrecision 
                                             OpDecorate %55 RelaxedPrecision 
                                             OpDecorate %59 RelaxedPrecision 
                                             OpDecorate %60 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %78 RelaxedPrecision 
                                             OpDecorate %78 Location 78 
                                             OpDecorate %81 RelaxedPrecision 
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
                        Private f32* %28 = OpVariable Private 
UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
            UniformConstant sampler* %31 = OpVariable UniformConstant 
                                 u32 %36 = OpConstant 3 
                        Private f32* %38 = OpVariable Private 
                                     %43 = OpTypeStruct %6 %23 %6 
                                     %44 = OpTypePointer Uniform %43 
  Uniform struct {f32; f32_4; f32;}* %45 = OpVariable Uniform 
                                     %46 = OpTypeInt 32 1 
                                 i32 %47 = OpConstant 0 
                                     %48 = OpTypePointer Uniform %6 
                        Private f32* %55 = OpVariable Private 
                                 i32 %57 = OpConstant 2 
                                     %62 = OpTypeBool 
                                     %63 = OpTypePointer Private %62 
                       Private bool* %64 = OpVariable Private 
                                 f32 %66 = OpConstant 3.674022E-40 
                                 i32 %69 = OpConstant 1 
                                 i32 %71 = OpConstant -1 
                                     %77 = OpTypePointer Output %23 
                       Output f32_4* %78 = OpVariable Output 
                                     %79 = OpTypePointer Uniform %23 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 0 
                                             OpStore %8 %27 
                 read_only Texture2D %30 = OpLoad %29 
                             sampler %32 = OpLoad %31 
          read_only Texture2DSampled %33 = OpSampledImage %30 %32 
                               f32_2 %34 = OpLoad vs_TEXCOORD0 
                               f32_4 %35 = OpImageSampleImplicitLod %33 %34 
                                 f32 %37 = OpCompositeExtract %35 3 
                                             OpStore %28 %37 
                                 f32 %39 = OpLoad %28 
                                 f32 %40 = OpFNegate %39 
                                 f32 %41 = OpLoad %8 
                                 f32 %42 = OpFAdd %40 %41 
                                             OpStore %38 %42 
                        Uniform f32* %49 = OpAccessChain %45 %47 
                                 f32 %50 = OpLoad %49 
                                 f32 %51 = OpLoad %38 
                                 f32 %52 = OpFMul %50 %51 
                                 f32 %53 = OpLoad %28 
                                 f32 %54 = OpFAdd %52 %53 
                                             OpStore %38 %54 
                                 f32 %56 = OpLoad %38 
                        Uniform f32* %58 = OpAccessChain %45 %57 
                                 f32 %59 = OpLoad %58 
                                 f32 %60 = OpFNegate %59 
                                 f32 %61 = OpFAdd %56 %60 
                                             OpStore %55 %61 
                                 f32 %65 = OpLoad %55 
                                bool %67 = OpFOrdLessThan %65 %66 
                                             OpStore %64 %67 
                                bool %68 = OpLoad %64 
                                 i32 %70 = OpSelect %68 %69 %47 
                                 i32 %72 = OpIMul %70 %71 
                                bool %73 = OpINotEqual %72 %47 
                                             OpSelectionMerge %75 None 
                                             OpBranchConditional %73 %74 %75 
                                     %74 = OpLabel 
                                             OpKill
                                     %75 = OpLabel 
                      Uniform f32_4* %80 = OpAccessChain %45 %69 
                               f32_4 %81 = OpLoad %80 
                                             OpStore %78 %81 
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