//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-Colored" {
Properties {
_Color ("Color", Color) = (1,1,1,1)
_SrcBlend ("SrcBlend", Float) = 5
_DstBlend ("DstBlend", Float) = 10
_ZWrite ("ZWrite", Float) = 1
_ZTest ("ZTest", Float) = 4
_Cull ("Cull", Float) = 0
_ZBias ("ZBias", Float) = 0
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend Zero Zero, Zero Zero
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 18665
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
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
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
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
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
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
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 95
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %27 %29 %80 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %15 ArrayStride 15 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpMemberDecorate %17 0 Offset 17 
                                                     OpMemberDecorate %17 1 Offset 17 
                                                     OpMemberDecorate %17 2 Offset 17 
                                                     OpDecorate %17 Block 
                                                     OpDecorate %19 DescriptorSet 19 
                                                     OpDecorate %19 Binding 19 
                                                     OpDecorate %27 RelaxedPrecision 
                                                     OpDecorate %27 Location 27 
                                                     OpDecorate %29 Location 29 
                                                     OpMemberDecorate %78 0 BuiltIn 78 
                                                     OpMemberDecorate %78 1 BuiltIn 78 
                                                     OpMemberDecorate %78 2 BuiltIn 78 
                                                     OpDecorate %78 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 4 
                                             %15 = OpTypeArray %7 %14 
                                             %16 = OpTypeArray %7 %14 
                                             %17 = OpTypeStruct %15 %16 %7 
                                             %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %19 = OpVariable Uniform 
                                             %20 = OpTypeInt 32 1 
                                         i32 %21 = OpConstant 2 
                                             %22 = OpTypePointer Uniform %7 
                                             %26 = OpTypePointer Output %7 
                               Output f32_4* %27 = OpVariable Output 
                                Input f32_4* %29 = OpVariable Input 
                                         i32 %32 = OpConstant 0 
                                         i32 %33 = OpConstant 1 
                                         i32 %52 = OpConstant 3 
                              Private f32_4* %56 = OpVariable Private 
                                         u32 %76 = OpConstant 1 
                                             %77 = OpTypeArray %6 %76 
                                             %78 = OpTypeStruct %7 %6 %77 
                                             %79 = OpTypePointer Output %78 
        Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                             %89 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                              Uniform f32_4* %23 = OpAccessChain %19 %21 
                                       f32_4 %24 = OpLoad %23 
                                       f32_4 %25 = OpFMul %12 %24 
                                                     OpStore %9 %25 
                                       f32_4 %28 = OpLoad %9 
                                                     OpStore %27 %28 
                                       f32_4 %30 = OpLoad %29 
                                       f32_4 %31 = OpVectorShuffle %30 %30 1 1 1 1 
                              Uniform f32_4* %34 = OpAccessChain %19 %32 %33 
                                       f32_4 %35 = OpLoad %34 
                                       f32_4 %36 = OpFMul %31 %35 
                                                     OpStore %9 %36 
                              Uniform f32_4* %37 = OpAccessChain %19 %32 %32 
                                       f32_4 %38 = OpLoad %37 
                                       f32_4 %39 = OpLoad %29 
                                       f32_4 %40 = OpVectorShuffle %39 %39 0 0 0 0 
                                       f32_4 %41 = OpFMul %38 %40 
                                       f32_4 %42 = OpLoad %9 
                                       f32_4 %43 = OpFAdd %41 %42 
                                                     OpStore %9 %43 
                              Uniform f32_4* %44 = OpAccessChain %19 %32 %21 
                                       f32_4 %45 = OpLoad %44 
                                       f32_4 %46 = OpLoad %29 
                                       f32_4 %47 = OpVectorShuffle %46 %46 2 2 2 2 
                                       f32_4 %48 = OpFMul %45 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpFAdd %48 %49 
                                                     OpStore %9 %50 
                                       f32_4 %51 = OpLoad %9 
                              Uniform f32_4* %53 = OpAccessChain %19 %32 %52 
                                       f32_4 %54 = OpLoad %53 
                                       f32_4 %55 = OpFAdd %51 %54 
                                                     OpStore %9 %55 
                                       f32_4 %57 = OpLoad %9 
                                       f32_4 %58 = OpVectorShuffle %57 %57 1 1 1 1 
                              Uniform f32_4* %59 = OpAccessChain %19 %33 %33 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpFMul %58 %60 
                                                     OpStore %56 %61 
                              Uniform f32_4* %62 = OpAccessChain %19 %33 %32 
                                       f32_4 %63 = OpLoad %62 
                                       f32_4 %64 = OpLoad %9 
                                       f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %56 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %56 %68 
                              Uniform f32_4* %69 = OpAccessChain %19 %33 %21 
                                       f32_4 %70 = OpLoad %69 
                                       f32_4 %71 = OpLoad %9 
                                       f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                       f32_4 %73 = OpFMul %70 %72 
                                       f32_4 %74 = OpLoad %56 
                                       f32_4 %75 = OpFAdd %73 %74 
                                                     OpStore %56 %75 
                              Uniform f32_4* %81 = OpAccessChain %19 %33 %52 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %9 
                                       f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %56 
                                       f32_4 %87 = OpFAdd %85 %86 
                               Output f32_4* %88 = OpAccessChain %80 %32 
                                                     OpStore %88 %87 
                                 Output f32* %90 = OpAccessChain %80 %32 %76 
                                         f32 %91 = OpLoad %90 
                                         f32 %92 = OpFNegate %91 
                                 Output f32* %93 = OpAccessChain %80 %32 %76 
                                                     OpStore %93 %92 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 95
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %27 %29 %80 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %15 ArrayStride 15 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpMemberDecorate %17 0 Offset 17 
                                                     OpMemberDecorate %17 1 Offset 17 
                                                     OpMemberDecorate %17 2 Offset 17 
                                                     OpDecorate %17 Block 
                                                     OpDecorate %19 DescriptorSet 19 
                                                     OpDecorate %19 Binding 19 
                                                     OpDecorate %27 RelaxedPrecision 
                                                     OpDecorate %27 Location 27 
                                                     OpDecorate %29 Location 29 
                                                     OpMemberDecorate %78 0 BuiltIn 78 
                                                     OpMemberDecorate %78 1 BuiltIn 78 
                                                     OpMemberDecorate %78 2 BuiltIn 78 
                                                     OpDecorate %78 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 4 
                                             %15 = OpTypeArray %7 %14 
                                             %16 = OpTypeArray %7 %14 
                                             %17 = OpTypeStruct %15 %16 %7 
                                             %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %19 = OpVariable Uniform 
                                             %20 = OpTypeInt 32 1 
                                         i32 %21 = OpConstant 2 
                                             %22 = OpTypePointer Uniform %7 
                                             %26 = OpTypePointer Output %7 
                               Output f32_4* %27 = OpVariable Output 
                                Input f32_4* %29 = OpVariable Input 
                                         i32 %32 = OpConstant 0 
                                         i32 %33 = OpConstant 1 
                                         i32 %52 = OpConstant 3 
                              Private f32_4* %56 = OpVariable Private 
                                         u32 %76 = OpConstant 1 
                                             %77 = OpTypeArray %6 %76 
                                             %78 = OpTypeStruct %7 %6 %77 
                                             %79 = OpTypePointer Output %78 
        Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                             %89 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                              Uniform f32_4* %23 = OpAccessChain %19 %21 
                                       f32_4 %24 = OpLoad %23 
                                       f32_4 %25 = OpFMul %12 %24 
                                                     OpStore %9 %25 
                                       f32_4 %28 = OpLoad %9 
                                                     OpStore %27 %28 
                                       f32_4 %30 = OpLoad %29 
                                       f32_4 %31 = OpVectorShuffle %30 %30 1 1 1 1 
                              Uniform f32_4* %34 = OpAccessChain %19 %32 %33 
                                       f32_4 %35 = OpLoad %34 
                                       f32_4 %36 = OpFMul %31 %35 
                                                     OpStore %9 %36 
                              Uniform f32_4* %37 = OpAccessChain %19 %32 %32 
                                       f32_4 %38 = OpLoad %37 
                                       f32_4 %39 = OpLoad %29 
                                       f32_4 %40 = OpVectorShuffle %39 %39 0 0 0 0 
                                       f32_4 %41 = OpFMul %38 %40 
                                       f32_4 %42 = OpLoad %9 
                                       f32_4 %43 = OpFAdd %41 %42 
                                                     OpStore %9 %43 
                              Uniform f32_4* %44 = OpAccessChain %19 %32 %21 
                                       f32_4 %45 = OpLoad %44 
                                       f32_4 %46 = OpLoad %29 
                                       f32_4 %47 = OpVectorShuffle %46 %46 2 2 2 2 
                                       f32_4 %48 = OpFMul %45 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpFAdd %48 %49 
                                                     OpStore %9 %50 
                                       f32_4 %51 = OpLoad %9 
                              Uniform f32_4* %53 = OpAccessChain %19 %32 %52 
                                       f32_4 %54 = OpLoad %53 
                                       f32_4 %55 = OpFAdd %51 %54 
                                                     OpStore %9 %55 
                                       f32_4 %57 = OpLoad %9 
                                       f32_4 %58 = OpVectorShuffle %57 %57 1 1 1 1 
                              Uniform f32_4* %59 = OpAccessChain %19 %33 %33 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpFMul %58 %60 
                                                     OpStore %56 %61 
                              Uniform f32_4* %62 = OpAccessChain %19 %33 %32 
                                       f32_4 %63 = OpLoad %62 
                                       f32_4 %64 = OpLoad %9 
                                       f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %56 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %56 %68 
                              Uniform f32_4* %69 = OpAccessChain %19 %33 %21 
                                       f32_4 %70 = OpLoad %69 
                                       f32_4 %71 = OpLoad %9 
                                       f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                       f32_4 %73 = OpFMul %70 %72 
                                       f32_4 %74 = OpLoad %56 
                                       f32_4 %75 = OpFAdd %73 %74 
                                                     OpStore %56 %75 
                              Uniform f32_4* %81 = OpAccessChain %19 %33 %52 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %9 
                                       f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %56 
                                       f32_4 %87 = OpFAdd %85 %86 
                               Output f32_4* %88 = OpAccessChain %80 %32 
                                                     OpStore %88 %87 
                                 Output f32* %90 = OpAccessChain %80 %32 %76 
                                         f32 %91 = OpLoad %90 
                                         f32 %92 = OpFNegate %91 
                                 Output f32* %93 = OpAccessChain %80 %32 %76 
                                                     OpStore %93 %92 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 95
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %27 %29 %80 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %15 ArrayStride 15 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpMemberDecorate %17 0 Offset 17 
                                                     OpMemberDecorate %17 1 Offset 17 
                                                     OpMemberDecorate %17 2 Offset 17 
                                                     OpDecorate %17 Block 
                                                     OpDecorate %19 DescriptorSet 19 
                                                     OpDecorate %19 Binding 19 
                                                     OpDecorate %27 RelaxedPrecision 
                                                     OpDecorate %27 Location 27 
                                                     OpDecorate %29 Location 29 
                                                     OpMemberDecorate %78 0 BuiltIn 78 
                                                     OpMemberDecorate %78 1 BuiltIn 78 
                                                     OpMemberDecorate %78 2 BuiltIn 78 
                                                     OpDecorate %78 Block 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 4 
                                             %15 = OpTypeArray %7 %14 
                                             %16 = OpTypeArray %7 %14 
                                             %17 = OpTypeStruct %15 %16 %7 
                                             %18 = OpTypePointer Uniform %17 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %19 = OpVariable Uniform 
                                             %20 = OpTypeInt 32 1 
                                         i32 %21 = OpConstant 2 
                                             %22 = OpTypePointer Uniform %7 
                                             %26 = OpTypePointer Output %7 
                               Output f32_4* %27 = OpVariable Output 
                                Input f32_4* %29 = OpVariable Input 
                                         i32 %32 = OpConstant 0 
                                         i32 %33 = OpConstant 1 
                                         i32 %52 = OpConstant 3 
                              Private f32_4* %56 = OpVariable Private 
                                         u32 %76 = OpConstant 1 
                                             %77 = OpTypeArray %6 %76 
                                             %78 = OpTypeStruct %7 %6 %77 
                                             %79 = OpTypePointer Output %78 
        Output struct {f32_4; f32; f32[1];}* %80 = OpVariable Output 
                                             %89 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                              Uniform f32_4* %23 = OpAccessChain %19 %21 
                                       f32_4 %24 = OpLoad %23 
                                       f32_4 %25 = OpFMul %12 %24 
                                                     OpStore %9 %25 
                                       f32_4 %28 = OpLoad %9 
                                                     OpStore %27 %28 
                                       f32_4 %30 = OpLoad %29 
                                       f32_4 %31 = OpVectorShuffle %30 %30 1 1 1 1 
                              Uniform f32_4* %34 = OpAccessChain %19 %32 %33 
                                       f32_4 %35 = OpLoad %34 
                                       f32_4 %36 = OpFMul %31 %35 
                                                     OpStore %9 %36 
                              Uniform f32_4* %37 = OpAccessChain %19 %32 %32 
                                       f32_4 %38 = OpLoad %37 
                                       f32_4 %39 = OpLoad %29 
                                       f32_4 %40 = OpVectorShuffle %39 %39 0 0 0 0 
                                       f32_4 %41 = OpFMul %38 %40 
                                       f32_4 %42 = OpLoad %9 
                                       f32_4 %43 = OpFAdd %41 %42 
                                                     OpStore %9 %43 
                              Uniform f32_4* %44 = OpAccessChain %19 %32 %21 
                                       f32_4 %45 = OpLoad %44 
                                       f32_4 %46 = OpLoad %29 
                                       f32_4 %47 = OpVectorShuffle %46 %46 2 2 2 2 
                                       f32_4 %48 = OpFMul %45 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpFAdd %48 %49 
                                                     OpStore %9 %50 
                                       f32_4 %51 = OpLoad %9 
                              Uniform f32_4* %53 = OpAccessChain %19 %32 %52 
                                       f32_4 %54 = OpLoad %53 
                                       f32_4 %55 = OpFAdd %51 %54 
                                                     OpStore %9 %55 
                                       f32_4 %57 = OpLoad %9 
                                       f32_4 %58 = OpVectorShuffle %57 %57 1 1 1 1 
                              Uniform f32_4* %59 = OpAccessChain %19 %33 %33 
                                       f32_4 %60 = OpLoad %59 
                                       f32_4 %61 = OpFMul %58 %60 
                                                     OpStore %56 %61 
                              Uniform f32_4* %62 = OpAccessChain %19 %33 %32 
                                       f32_4 %63 = OpLoad %62 
                                       f32_4 %64 = OpLoad %9 
                                       f32_4 %65 = OpVectorShuffle %64 %64 0 0 0 0 
                                       f32_4 %66 = OpFMul %63 %65 
                                       f32_4 %67 = OpLoad %56 
                                       f32_4 %68 = OpFAdd %66 %67 
                                                     OpStore %56 %68 
                              Uniform f32_4* %69 = OpAccessChain %19 %33 %21 
                                       f32_4 %70 = OpLoad %69 
                                       f32_4 %71 = OpLoad %9 
                                       f32_4 %72 = OpVectorShuffle %71 %71 2 2 2 2 
                                       f32_4 %73 = OpFMul %70 %72 
                                       f32_4 %74 = OpLoad %56 
                                       f32_4 %75 = OpFAdd %73 %74 
                                                     OpStore %56 %75 
                              Uniform f32_4* %81 = OpAccessChain %19 %33 %52 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %9 
                                       f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %56 
                                       f32_4 %87 = OpFAdd %85 %86 
                               Output f32_4* %88 = OpAccessChain %80 %32 
                                                     OpStore %88 %87 
                                 Output f32* %90 = OpAccessChain %80 %32 %76 
                                         f32 %91 = OpLoad %90 
                                         f32 %92 = OpFNegate %91 
                                 Output f32* %93 = OpAccessChain %80 %32 %76 
                                                     OpStore %93 %92 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
uniform 	int unity_StereoEyeIndex;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati1;
vec4 u_xlat2;
int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }

void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
uniform 	int unity_StereoEyeIndex;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati1;
vec4 u_xlat2;
int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }

void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
uniform 	int unity_StereoEyeIndex;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati1;
vec4 u_xlat2;
int op_shl(int a, int b) { return int(floor(float(a) * pow(2.0, float(b)))); }
ivec2 op_shl(ivec2 a, ivec2 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); return a; }
ivec3 op_shl(ivec3 a, ivec3 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); return a; }
ivec4 op_shl(ivec4 a, ivec4 b) { a.x = op_shl(a.x, b.x); a.y = op_shl(a.y, b.y); a.z = op_shl(a.z, b.z); a.w = op_shl(a.w, b.w); return a; }

void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = op_shl(unity_StereoEyeIndex, 2);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
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
uniform 	vec4 _Color;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 unity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 unity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityStereoEyeIndex {
#endif
	UNITY_UNIFORM int unity_StereoEyeIndex;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(unity_StereoEyeIndex << 2);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
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
uniform 	vec4 _Color;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 unity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 unity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityStereoEyeIndex {
#endif
	UNITY_UNIFORM int unity_StereoEyeIndex;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(unity_StereoEyeIndex << 2);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
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
uniform 	vec4 _Color;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 unity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 unity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityStereoEyeIndex {
#endif
	UNITY_UNIFORM int unity_StereoEyeIndex;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(unity_StereoEyeIndex << 2);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 109
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %28 %30 %92 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %28 Location 28 
                                                      OpDecorate %30 Location 30 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                          u32 %16 = OpConstant 8 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeInt 32 1 
                                              %19 = OpTypeStruct %15 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[8]; i32; f32_4;}* %21 = OpVariable Uniform 
                                          i32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Uniform %7 
                                              %27 = OpTypePointer Output %7 
                                Output f32_4* %28 = OpVariable Output 
                                 Input f32_4* %30 = OpVariable Input 
                                          i32 %33 = OpConstant 0 
                                          i32 %34 = OpConstant 1 
                                          i32 %45 = OpConstant 2 
                                              %57 = OpTypePointer Private %18 
                                 Private i32* %58 = OpVariable Private 
                                              %59 = OpTypePointer Uniform %18 
                               Private f32_4* %63 = OpVariable Private 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                             %103 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                               Uniform f32_4* %24 = OpAccessChain %21 %22 
                                        f32_4 %25 = OpLoad %24 
                                        f32_4 %26 = OpFMul %12 %25 
                                                      OpStore %9 %26 
                                        f32_4 %29 = OpLoad %9 
                                                      OpStore %28 %29 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %21 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpFMul %32 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %38 = OpAccessChain %21 %33 %33 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %30 
                                        f32_4 %41 = OpVectorShuffle %40 %40 0 0 0 0 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                               Uniform f32_4* %46 = OpAccessChain %21 %33 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpLoad %30 
                                        f32_4 %49 = OpVectorShuffle %48 %48 2 2 2 2 
                                        f32_4 %50 = OpFMul %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpFAdd %50 %51 
                                                      OpStore %9 %52 
                                        f32_4 %53 = OpLoad %9 
                               Uniform f32_4* %54 = OpAccessChain %21 %33 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpFAdd %53 %55 
                                                      OpStore %9 %56 
                                 Uniform i32* %60 = OpAccessChain %21 %45 
                                          i32 %61 = OpLoad %60 
                                          i32 %62 = OpShiftLeftLogical %61 %45 
                                                      OpStore %58 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                                          i32 %66 = OpLoad %58 
                                          i32 %67 = OpIAdd %66 %34 
                               Uniform f32_4* %68 = OpAccessChain %21 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpFMul %65 %69 
                                                      OpStore %63 %70 
                                          i32 %71 = OpLoad %58 
                               Uniform f32_4* %72 = OpAccessChain %21 %34 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %63 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %63 %78 
                                          i32 %79 = OpLoad %58 
                                          i32 %80 = OpIAdd %79 %45 
                               Uniform f32_4* %81 = OpAccessChain %21 %34 %80 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %63 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %63 %87 
                                          i32 %93 = OpLoad %58 
                                          i32 %94 = OpIAdd %93 %22 
                               Uniform f32_4* %95 = OpAccessChain %21 %34 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpVectorShuffle %97 %97 3 3 3 3 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %63 
                                       f32_4 %101 = OpFAdd %99 %100 
                               Output f32_4* %102 = OpAccessChain %92 %33 
                                                      OpStore %102 %101 
                                 Output f32* %104 = OpAccessChain %92 %33 %88 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFNegate %105 
                                 Output f32* %107 = OpAccessChain %92 %33 %88 
                                                      OpStore %107 %106 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 109
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %28 %30 %92 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %28 Location 28 
                                                      OpDecorate %30 Location 30 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                          u32 %16 = OpConstant 8 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeInt 32 1 
                                              %19 = OpTypeStruct %15 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[8]; i32; f32_4;}* %21 = OpVariable Uniform 
                                          i32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Uniform %7 
                                              %27 = OpTypePointer Output %7 
                                Output f32_4* %28 = OpVariable Output 
                                 Input f32_4* %30 = OpVariable Input 
                                          i32 %33 = OpConstant 0 
                                          i32 %34 = OpConstant 1 
                                          i32 %45 = OpConstant 2 
                                              %57 = OpTypePointer Private %18 
                                 Private i32* %58 = OpVariable Private 
                                              %59 = OpTypePointer Uniform %18 
                               Private f32_4* %63 = OpVariable Private 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                             %103 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                               Uniform f32_4* %24 = OpAccessChain %21 %22 
                                        f32_4 %25 = OpLoad %24 
                                        f32_4 %26 = OpFMul %12 %25 
                                                      OpStore %9 %26 
                                        f32_4 %29 = OpLoad %9 
                                                      OpStore %28 %29 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %21 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpFMul %32 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %38 = OpAccessChain %21 %33 %33 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %30 
                                        f32_4 %41 = OpVectorShuffle %40 %40 0 0 0 0 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                               Uniform f32_4* %46 = OpAccessChain %21 %33 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpLoad %30 
                                        f32_4 %49 = OpVectorShuffle %48 %48 2 2 2 2 
                                        f32_4 %50 = OpFMul %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpFAdd %50 %51 
                                                      OpStore %9 %52 
                                        f32_4 %53 = OpLoad %9 
                               Uniform f32_4* %54 = OpAccessChain %21 %33 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpFAdd %53 %55 
                                                      OpStore %9 %56 
                                 Uniform i32* %60 = OpAccessChain %21 %45 
                                          i32 %61 = OpLoad %60 
                                          i32 %62 = OpShiftLeftLogical %61 %45 
                                                      OpStore %58 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                                          i32 %66 = OpLoad %58 
                                          i32 %67 = OpIAdd %66 %34 
                               Uniform f32_4* %68 = OpAccessChain %21 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpFMul %65 %69 
                                                      OpStore %63 %70 
                                          i32 %71 = OpLoad %58 
                               Uniform f32_4* %72 = OpAccessChain %21 %34 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %63 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %63 %78 
                                          i32 %79 = OpLoad %58 
                                          i32 %80 = OpIAdd %79 %45 
                               Uniform f32_4* %81 = OpAccessChain %21 %34 %80 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %63 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %63 %87 
                                          i32 %93 = OpLoad %58 
                                          i32 %94 = OpIAdd %93 %22 
                               Uniform f32_4* %95 = OpAccessChain %21 %34 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpVectorShuffle %97 %97 3 3 3 3 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %63 
                                       f32_4 %101 = OpFAdd %99 %100 
                               Output f32_4* %102 = OpAccessChain %92 %33 
                                                      OpStore %102 %101 
                                 Output f32* %104 = OpAccessChain %92 %33 %88 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFNegate %105 
                                 Output f32* %107 = OpAccessChain %92 %33 %88 
                                                      OpStore %107 %106 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 109
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %28 %30 %92 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %28 RelaxedPrecision 
                                                      OpDecorate %28 Location 28 
                                                      OpDecorate %30 Location 30 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                          u32 %16 = OpConstant 8 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeInt 32 1 
                                              %19 = OpTypeStruct %15 %17 %18 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[8]; i32; f32_4;}* %21 = OpVariable Uniform 
                                          i32 %22 = OpConstant 3 
                                              %23 = OpTypePointer Uniform %7 
                                              %27 = OpTypePointer Output %7 
                                Output f32_4* %28 = OpVariable Output 
                                 Input f32_4* %30 = OpVariable Input 
                                          i32 %33 = OpConstant 0 
                                          i32 %34 = OpConstant 1 
                                          i32 %45 = OpConstant 2 
                                              %57 = OpTypePointer Private %18 
                                 Private i32* %58 = OpVariable Private 
                                              %59 = OpTypePointer Uniform %18 
                               Private f32_4* %63 = OpVariable Private 
                                          u32 %88 = OpConstant 1 
                                              %89 = OpTypeArray %6 %88 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                             %103 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                               Uniform f32_4* %24 = OpAccessChain %21 %22 
                                        f32_4 %25 = OpLoad %24 
                                        f32_4 %26 = OpFMul %12 %25 
                                                      OpStore %9 %26 
                                        f32_4 %29 = OpLoad %9 
                                                      OpStore %28 %29 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                               Uniform f32_4* %35 = OpAccessChain %21 %33 %34 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpFMul %32 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %38 = OpAccessChain %21 %33 %33 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %30 
                                        f32_4 %41 = OpVectorShuffle %40 %40 0 0 0 0 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                               Uniform f32_4* %46 = OpAccessChain %21 %33 %45 
                                        f32_4 %47 = OpLoad %46 
                                        f32_4 %48 = OpLoad %30 
                                        f32_4 %49 = OpVectorShuffle %48 %48 2 2 2 2 
                                        f32_4 %50 = OpFMul %47 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpFAdd %50 %51 
                                                      OpStore %9 %52 
                                        f32_4 %53 = OpLoad %9 
                               Uniform f32_4* %54 = OpAccessChain %21 %33 %22 
                                        f32_4 %55 = OpLoad %54 
                                        f32_4 %56 = OpFAdd %53 %55 
                                                      OpStore %9 %56 
                                 Uniform i32* %60 = OpAccessChain %21 %45 
                                          i32 %61 = OpLoad %60 
                                          i32 %62 = OpShiftLeftLogical %61 %45 
                                                      OpStore %58 %62 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                                          i32 %66 = OpLoad %58 
                                          i32 %67 = OpIAdd %66 %34 
                               Uniform f32_4* %68 = OpAccessChain %21 %34 %67 
                                        f32_4 %69 = OpLoad %68 
                                        f32_4 %70 = OpFMul %65 %69 
                                                      OpStore %63 %70 
                                          i32 %71 = OpLoad %58 
                               Uniform f32_4* %72 = OpAccessChain %21 %34 %71 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %63 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %63 %78 
                                          i32 %79 = OpLoad %58 
                                          i32 %80 = OpIAdd %79 %45 
                               Uniform f32_4* %81 = OpAccessChain %21 %34 %80 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %63 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore %63 %87 
                                          i32 %93 = OpLoad %58 
                                          i32 %94 = OpIAdd %93 %22 
                               Uniform f32_4* %95 = OpAccessChain %21 %34 %94 
                                        f32_4 %96 = OpLoad %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpVectorShuffle %97 %97 3 3 3 3 
                                        f32_4 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %63 
                                       f32_4 %101 = OpFAdd %99 %100 
                               Output f32_4* %102 = OpAccessChain %92 %33 
                                                      OpStore %102 %101 
                                 Output f32* %104 = OpAccessChain %92 %33 %88 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFNegate %105 
                                 Output f32* %107 = OpAccessChain %92 %33 %88 
                                                      OpStore %107 %106 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "STEREO_INSTANCING_ON" }
"#ifdef VERTEX
#version 300 es
#extension GL_AMD_vertex_shader_layer : require

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
uniform 	vec4 _Color;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 unity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 unity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
flat out highp uint vs_BLENDINDICES0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati3;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0.x = float(uint(gl_InstanceID));
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati3 = int(int(u_xlatu0) << 2);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
    vs_BLENDINDICES0 = u_xlatu0;
    gl_Layer = int(u_xlatu0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "STEREO_INSTANCING_ON" }
"#ifdef VERTEX
#version 300 es
#extension GL_AMD_vertex_shader_layer : require

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
uniform 	vec4 _Color;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 unity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 unity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
flat out highp uint vs_BLENDINDICES0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati3;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0.x = float(uint(gl_InstanceID));
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati3 = int(int(u_xlatu0) << 2);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
    vs_BLENDINDICES0 = u_xlatu0;
    gl_Layer = int(u_xlatu0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "STEREO_INSTANCING_ON" }
"#ifdef VERTEX
#version 300 es
#extension GL_AMD_vertex_shader_layer : require

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
uniform 	vec4 _Color;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 unity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 unity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
flat out highp uint vs_BLENDINDICES0;
vec4 u_xlat0;
uint u_xlatu0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati3;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0.x = float(uint(gl_InstanceID));
    u_xlat0.x = u_xlat0.x * 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = roundEven(u_xlat0.x);
    u_xlatu0 = uint(u_xlat0.x);
    u_xlati3 = int(int(u_xlatu0) << 2);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati3] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 2)] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati3 + 3)] * u_xlat1.wwww + u_xlat2;
    vs_BLENDINDICES0 = u_xlatu0;
    gl_Layer = int(u_xlatu0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "STEREO_INSTANCING_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 115
; Schema: 0
                                                     OpCapability Shader 
                                                     OpCapability Geometry 
                                                     OpCapability ShaderViewportIndexLayerEXT 
                                                     OpExtension "SPV_EXT_shader_viewport_index_layer" 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %28 %30 %60 %92 %104 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %15 ArrayStride 15 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %28 RelaxedPrecision 
                                                     OpDecorate %28 Location 28 
                                                     OpDecorate %30 Location 30 
                                                     OpDecorate %60 BuiltIn 60 
                                                     OpMemberDecorate %90 0 BuiltIn 90 
                                                     OpMemberDecorate %90 1 BuiltIn 90 
                                                     OpMemberDecorate %90 2 BuiltIn 90 
                                                     OpDecorate %90 Block 
                                                     OpDecorate %104 BuiltIn 104 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 4 
                                             %15 = OpTypeArray %7 %14 
                                         u32 %16 = OpConstant 8 
                                             %17 = OpTypeArray %7 %16 
                                             %18 = OpTypeStruct %15 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[8]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %7 
                                             %27 = OpTypePointer Output %7 
                               Output f32_4* %28 = OpVariable Output 
                                Input f32_4* %30 = OpVariable Input 
                                         i32 %33 = OpConstant 0 
                                         i32 %34 = OpConstant 1 
                                         i32 %53 = OpConstant 3 
                                             %57 = OpTypePointer Private %21 
                                Private i32* %58 = OpVariable Private 
                                             %59 = OpTypePointer Input %21 
                                  Input i32* %60 = OpVariable Input 
                              Private f32_4* %63 = OpVariable Private 
                                         u32 %88 = OpConstant 1 
                                             %89 = OpTypeArray %6 %88 
                                             %90 = OpTypeStruct %7 %6 %89 
                                             %91 = OpTypePointer Output %90 
        Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                            %103 = OpTypePointer Output %21 
                                Output i32* %104 = OpVariable Output 
                                            %109 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %12 %25 
                                                     OpStore %9 %26 
                                       f32_4 %29 = OpLoad %9 
                                                     OpStore %28 %29 
                                       f32_4 %31 = OpLoad %30 
                                       f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                              Uniform f32_4* %35 = OpAccessChain %20 %33 %34 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpFMul %32 %36 
                                                     OpStore %9 %37 
                              Uniform f32_4* %38 = OpAccessChain %20 %33 %33 
                                       f32_4 %39 = OpLoad %38 
                                       f32_4 %40 = OpLoad %30 
                                       f32_4 %41 = OpVectorShuffle %40 %40 0 0 0 0 
                                       f32_4 %42 = OpFMul %39 %41 
                                       f32_4 %43 = OpLoad %9 
                                       f32_4 %44 = OpFAdd %42 %43 
                                                     OpStore %9 %44 
                              Uniform f32_4* %45 = OpAccessChain %20 %33 %22 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpLoad %30 
                                       f32_4 %48 = OpVectorShuffle %47 %47 2 2 2 2 
                                       f32_4 %49 = OpFMul %46 %48 
                                       f32_4 %50 = OpLoad %9 
                                       f32_4 %51 = OpFAdd %49 %50 
                                                     OpStore %9 %51 
                                       f32_4 %52 = OpLoad %9 
                              Uniform f32_4* %54 = OpAccessChain %20 %33 %53 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpFAdd %52 %55 
                                                     OpStore %9 %56 
                                         i32 %61 = OpLoad %60 
                                         i32 %62 = OpBitFieldInsert %33 %61 %22 %34 
                                                     OpStore %58 %62 
                                       f32_4 %64 = OpLoad %9 
                                       f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                                         i32 %66 = OpLoad %58 
                                         i32 %67 = OpIAdd %66 %34 
                              Uniform f32_4* %68 = OpAccessChain %20 %34 %67 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpFMul %65 %69 
                                                     OpStore %63 %70 
                                         i32 %71 = OpLoad %58 
                              Uniform f32_4* %72 = OpAccessChain %20 %34 %71 
                                       f32_4 %73 = OpLoad %72 
                                       f32_4 %74 = OpLoad %9 
                                       f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                       f32_4 %76 = OpFMul %73 %75 
                                       f32_4 %77 = OpLoad %63 
                                       f32_4 %78 = OpFAdd %76 %77 
                                                     OpStore %63 %78 
                                         i32 %79 = OpLoad %58 
                                         i32 %80 = OpIAdd %79 %22 
                              Uniform f32_4* %81 = OpAccessChain %20 %34 %80 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %9 
                                       f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %63 
                                       f32_4 %87 = OpFAdd %85 %86 
                                                     OpStore %63 %87 
                                         i32 %93 = OpLoad %58 
                                         i32 %94 = OpIAdd %93 %53 
                              Uniform f32_4* %95 = OpAccessChain %20 %34 %94 
                                       f32_4 %96 = OpLoad %95 
                                       f32_4 %97 = OpLoad %9 
                                       f32_4 %98 = OpVectorShuffle %97 %97 3 3 3 3 
                                       f32_4 %99 = OpFMul %96 %98 
                                      f32_4 %100 = OpLoad %63 
                                      f32_4 %101 = OpFAdd %99 %100 
                              Output f32_4* %102 = OpAccessChain %92 %33 
                                                     OpStore %102 %101 
                                        i32 %105 = OpLoad %60 
                                        u32 %106 = OpBitcast %105 
                                        u32 %107 = OpBitwiseAnd %106 %88 
                                        i32 %108 = OpBitcast %107 
                                                     OpStore %104 %108 
                                Output f32* %110 = OpAccessChain %92 %33 %88 
                                        f32 %111 = OpLoad %110 
                                        f32 %112 = OpFNegate %111 
                                Output f32* %113 = OpAccessChain %92 %33 %88 
                                                     OpStore %113 %112 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "STEREO_INSTANCING_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 115
; Schema: 0
                                                     OpCapability Shader 
                                                     OpCapability Geometry 
                                                     OpCapability ShaderViewportIndexLayerEXT 
                                                     OpExtension "SPV_EXT_shader_viewport_index_layer" 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %28 %30 %60 %92 %104 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %15 ArrayStride 15 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %28 RelaxedPrecision 
                                                     OpDecorate %28 Location 28 
                                                     OpDecorate %30 Location 30 
                                                     OpDecorate %60 BuiltIn 60 
                                                     OpMemberDecorate %90 0 BuiltIn 90 
                                                     OpMemberDecorate %90 1 BuiltIn 90 
                                                     OpMemberDecorate %90 2 BuiltIn 90 
                                                     OpDecorate %90 Block 
                                                     OpDecorate %104 BuiltIn 104 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 4 
                                             %15 = OpTypeArray %7 %14 
                                         u32 %16 = OpConstant 8 
                                             %17 = OpTypeArray %7 %16 
                                             %18 = OpTypeStruct %15 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[8]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %7 
                                             %27 = OpTypePointer Output %7 
                               Output f32_4* %28 = OpVariable Output 
                                Input f32_4* %30 = OpVariable Input 
                                         i32 %33 = OpConstant 0 
                                         i32 %34 = OpConstant 1 
                                         i32 %53 = OpConstant 3 
                                             %57 = OpTypePointer Private %21 
                                Private i32* %58 = OpVariable Private 
                                             %59 = OpTypePointer Input %21 
                                  Input i32* %60 = OpVariable Input 
                              Private f32_4* %63 = OpVariable Private 
                                         u32 %88 = OpConstant 1 
                                             %89 = OpTypeArray %6 %88 
                                             %90 = OpTypeStruct %7 %6 %89 
                                             %91 = OpTypePointer Output %90 
        Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                            %103 = OpTypePointer Output %21 
                                Output i32* %104 = OpVariable Output 
                                            %109 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %12 %25 
                                                     OpStore %9 %26 
                                       f32_4 %29 = OpLoad %9 
                                                     OpStore %28 %29 
                                       f32_4 %31 = OpLoad %30 
                                       f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                              Uniform f32_4* %35 = OpAccessChain %20 %33 %34 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpFMul %32 %36 
                                                     OpStore %9 %37 
                              Uniform f32_4* %38 = OpAccessChain %20 %33 %33 
                                       f32_4 %39 = OpLoad %38 
                                       f32_4 %40 = OpLoad %30 
                                       f32_4 %41 = OpVectorShuffle %40 %40 0 0 0 0 
                                       f32_4 %42 = OpFMul %39 %41 
                                       f32_4 %43 = OpLoad %9 
                                       f32_4 %44 = OpFAdd %42 %43 
                                                     OpStore %9 %44 
                              Uniform f32_4* %45 = OpAccessChain %20 %33 %22 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpLoad %30 
                                       f32_4 %48 = OpVectorShuffle %47 %47 2 2 2 2 
                                       f32_4 %49 = OpFMul %46 %48 
                                       f32_4 %50 = OpLoad %9 
                                       f32_4 %51 = OpFAdd %49 %50 
                                                     OpStore %9 %51 
                                       f32_4 %52 = OpLoad %9 
                              Uniform f32_4* %54 = OpAccessChain %20 %33 %53 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpFAdd %52 %55 
                                                     OpStore %9 %56 
                                         i32 %61 = OpLoad %60 
                                         i32 %62 = OpBitFieldInsert %33 %61 %22 %34 
                                                     OpStore %58 %62 
                                       f32_4 %64 = OpLoad %9 
                                       f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                                         i32 %66 = OpLoad %58 
                                         i32 %67 = OpIAdd %66 %34 
                              Uniform f32_4* %68 = OpAccessChain %20 %34 %67 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpFMul %65 %69 
                                                     OpStore %63 %70 
                                         i32 %71 = OpLoad %58 
                              Uniform f32_4* %72 = OpAccessChain %20 %34 %71 
                                       f32_4 %73 = OpLoad %72 
                                       f32_4 %74 = OpLoad %9 
                                       f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                       f32_4 %76 = OpFMul %73 %75 
                                       f32_4 %77 = OpLoad %63 
                                       f32_4 %78 = OpFAdd %76 %77 
                                                     OpStore %63 %78 
                                         i32 %79 = OpLoad %58 
                                         i32 %80 = OpIAdd %79 %22 
                              Uniform f32_4* %81 = OpAccessChain %20 %34 %80 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %9 
                                       f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %63 
                                       f32_4 %87 = OpFAdd %85 %86 
                                                     OpStore %63 %87 
                                         i32 %93 = OpLoad %58 
                                         i32 %94 = OpIAdd %93 %53 
                              Uniform f32_4* %95 = OpAccessChain %20 %34 %94 
                                       f32_4 %96 = OpLoad %95 
                                       f32_4 %97 = OpLoad %9 
                                       f32_4 %98 = OpVectorShuffle %97 %97 3 3 3 3 
                                       f32_4 %99 = OpFMul %96 %98 
                                      f32_4 %100 = OpLoad %63 
                                      f32_4 %101 = OpFAdd %99 %100 
                              Output f32_4* %102 = OpAccessChain %92 %33 
                                                     OpStore %102 %101 
                                        i32 %105 = OpLoad %60 
                                        u32 %106 = OpBitcast %105 
                                        u32 %107 = OpBitwiseAnd %106 %88 
                                        i32 %108 = OpBitcast %107 
                                                     OpStore %104 %108 
                                Output f32* %110 = OpAccessChain %92 %33 %88 
                                        f32 %111 = OpLoad %110 
                                        f32 %112 = OpFNegate %111 
                                Output f32* %113 = OpAccessChain %92 %33 %88 
                                                     OpStore %113 %112 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "STEREO_INSTANCING_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 115
; Schema: 0
                                                     OpCapability Shader 
                                                     OpCapability Geometry 
                                                     OpCapability ShaderViewportIndexLayerEXT 
                                                     OpExtension "SPV_EXT_shader_viewport_index_layer" 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %28 %30 %60 %92 %104 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %15 ArrayStride 15 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate %28 RelaxedPrecision 
                                                     OpDecorate %28 Location 28 
                                                     OpDecorate %30 Location 30 
                                                     OpDecorate %60 BuiltIn 60 
                                                     OpMemberDecorate %90 0 BuiltIn 90 
                                                     OpMemberDecorate %90 1 BuiltIn 90 
                                                     OpMemberDecorate %90 2 BuiltIn 90 
                                                     OpDecorate %90 Block 
                                                     OpDecorate %104 BuiltIn 104 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %13 = OpTypeInt 32 0 
                                         u32 %14 = OpConstant 4 
                                             %15 = OpTypeArray %7 %14 
                                         u32 %16 = OpConstant 8 
                                             %17 = OpTypeArray %7 %16 
                                             %18 = OpTypeStruct %15 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[8]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 2 
                                             %23 = OpTypePointer Uniform %7 
                                             %27 = OpTypePointer Output %7 
                               Output f32_4* %28 = OpVariable Output 
                                Input f32_4* %30 = OpVariable Input 
                                         i32 %33 = OpConstant 0 
                                         i32 %34 = OpConstant 1 
                                         i32 %53 = OpConstant 3 
                                             %57 = OpTypePointer Private %21 
                                Private i32* %58 = OpVariable Private 
                                             %59 = OpTypePointer Input %21 
                                  Input i32* %60 = OpVariable Input 
                              Private f32_4* %63 = OpVariable Private 
                                         u32 %88 = OpConstant 1 
                                             %89 = OpTypeArray %6 %88 
                                             %90 = OpTypeStruct %7 %6 %89 
                                             %91 = OpTypePointer Output %90 
        Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                            %103 = OpTypePointer Output %21 
                                Output i32* %104 = OpVariable Output 
                                            %109 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                              Uniform f32_4* %24 = OpAccessChain %20 %22 
                                       f32_4 %25 = OpLoad %24 
                                       f32_4 %26 = OpFMul %12 %25 
                                                     OpStore %9 %26 
                                       f32_4 %29 = OpLoad %9 
                                                     OpStore %28 %29 
                                       f32_4 %31 = OpLoad %30 
                                       f32_4 %32 = OpVectorShuffle %31 %31 1 1 1 1 
                              Uniform f32_4* %35 = OpAccessChain %20 %33 %34 
                                       f32_4 %36 = OpLoad %35 
                                       f32_4 %37 = OpFMul %32 %36 
                                                     OpStore %9 %37 
                              Uniform f32_4* %38 = OpAccessChain %20 %33 %33 
                                       f32_4 %39 = OpLoad %38 
                                       f32_4 %40 = OpLoad %30 
                                       f32_4 %41 = OpVectorShuffle %40 %40 0 0 0 0 
                                       f32_4 %42 = OpFMul %39 %41 
                                       f32_4 %43 = OpLoad %9 
                                       f32_4 %44 = OpFAdd %42 %43 
                                                     OpStore %9 %44 
                              Uniform f32_4* %45 = OpAccessChain %20 %33 %22 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpLoad %30 
                                       f32_4 %48 = OpVectorShuffle %47 %47 2 2 2 2 
                                       f32_4 %49 = OpFMul %46 %48 
                                       f32_4 %50 = OpLoad %9 
                                       f32_4 %51 = OpFAdd %49 %50 
                                                     OpStore %9 %51 
                                       f32_4 %52 = OpLoad %9 
                              Uniform f32_4* %54 = OpAccessChain %20 %33 %53 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpFAdd %52 %55 
                                                     OpStore %9 %56 
                                         i32 %61 = OpLoad %60 
                                         i32 %62 = OpBitFieldInsert %33 %61 %22 %34 
                                                     OpStore %58 %62 
                                       f32_4 %64 = OpLoad %9 
                                       f32_4 %65 = OpVectorShuffle %64 %64 1 1 1 1 
                                         i32 %66 = OpLoad %58 
                                         i32 %67 = OpIAdd %66 %34 
                              Uniform f32_4* %68 = OpAccessChain %20 %34 %67 
                                       f32_4 %69 = OpLoad %68 
                                       f32_4 %70 = OpFMul %65 %69 
                                                     OpStore %63 %70 
                                         i32 %71 = OpLoad %58 
                              Uniform f32_4* %72 = OpAccessChain %20 %34 %71 
                                       f32_4 %73 = OpLoad %72 
                                       f32_4 %74 = OpLoad %9 
                                       f32_4 %75 = OpVectorShuffle %74 %74 0 0 0 0 
                                       f32_4 %76 = OpFMul %73 %75 
                                       f32_4 %77 = OpLoad %63 
                                       f32_4 %78 = OpFAdd %76 %77 
                                                     OpStore %63 %78 
                                         i32 %79 = OpLoad %58 
                                         i32 %80 = OpIAdd %79 %22 
                              Uniform f32_4* %81 = OpAccessChain %20 %34 %80 
                                       f32_4 %82 = OpLoad %81 
                                       f32_4 %83 = OpLoad %9 
                                       f32_4 %84 = OpVectorShuffle %83 %83 2 2 2 2 
                                       f32_4 %85 = OpFMul %82 %84 
                                       f32_4 %86 = OpLoad %63 
                                       f32_4 %87 = OpFAdd %85 %86 
                                                     OpStore %63 %87 
                                         i32 %93 = OpLoad %58 
                                         i32 %94 = OpIAdd %93 %53 
                              Uniform f32_4* %95 = OpAccessChain %20 %34 %94 
                                       f32_4 %96 = OpLoad %95 
                                       f32_4 %97 = OpLoad %9 
                                       f32_4 %98 = OpVectorShuffle %97 %97 3 3 3 3 
                                       f32_4 %99 = OpFMul %96 %98 
                                      f32_4 %100 = OpLoad %63 
                                      f32_4 %101 = OpFAdd %99 %100 
                              Output f32_4* %102 = OpAccessChain %92 %33 
                                                     OpStore %102 %101 
                                        i32 %105 = OpLoad %60 
                                        u32 %106 = OpBitcast %105 
                                        u32 %107 = OpBitwiseAnd %106 %88 
                                        i32 %108 = OpBitcast %107 
                                                     OpStore %104 %108 
                                Output f32* %110 = OpAccessChain %92 %33 %88 
                                        f32 %111 = OpLoad %110 
                                        f32 %112 = OpFNegate %111 
                                Output f32* %113 = OpAccessChain %92 %33 %88 
                                                     OpStore %113 %112 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "STEREO_MULTIVIEW_ON" }
"#ifdef VERTEX
#version 300 es
#extension GL_OVR_multiview2 : require

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
uniform 	vec4 _Color;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 unity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 unity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityStereoEyeIndices {
#endif
	UNITY_UNIFORM vec4 unity_StereoEyeIndices[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
layout(num_views = 2) in;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp float vs_BLENDWEIGHT0;
vec4 u_xlat0;
uint u_xlatu0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(int(gl_ViewID_OVR) << 2);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    u_xlatu0 = gl_ViewID_OVR;
    vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "STEREO_MULTIVIEW_ON" }
"#ifdef VERTEX
#version 300 es
#extension GL_OVR_multiview2 : require

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
uniform 	vec4 _Color;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 unity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 unity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityStereoEyeIndices {
#endif
	UNITY_UNIFORM vec4 unity_StereoEyeIndices[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
layout(num_views = 2) in;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp float vs_BLENDWEIGHT0;
vec4 u_xlat0;
uint u_xlatu0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(int(gl_ViewID_OVR) << 2);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    u_xlatu0 = gl_ViewID_OVR;
    vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "STEREO_MULTIVIEW_ON" }
"#ifdef VERTEX
#version 300 es
#extension GL_OVR_multiview2 : require

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
uniform 	vec4 _Color;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityStereoGlobals {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixInvV[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoMatrixVP[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraInvProjection[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoWorldToCamera[8];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_StereoCameraToWorld[8];
	UNITY_UNIFORM vec3 unity_StereoWorldSpaceCameraPos[2];
	UNITY_UNIFORM vec4 unity_StereoScaleOffset[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityStereoEyeIndices {
#endif
	UNITY_UNIFORM vec4 unity_StereoEyeIndices[2];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
layout(num_views = 2) in;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp float vs_BLENDWEIGHT0;
vec4 u_xlat0;
uint u_xlatu0;
int u_xlati1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlati1 = int(int(gl_ViewID_OVR) << 2);
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 1)];
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[u_xlati1] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 2)] * u_xlat0.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_StereoMatrixVP[(u_xlati1 + 3)] * u_xlat0.wwww + u_xlat2;
    u_xlatu0 = gl_ViewID_OVR;
    vs_BLENDWEIGHT0 = unity_StereoEyeIndices[int(u_xlatu0)].x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "STEREO_MULTIVIEW_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 138
; Schema: 0
                                                      OpCapability Shader 
                                                      OpCapability MultiView 
                                                      OpExtension "SPV_KHR_multiview" 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %26 %28 %58 %107 %122 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %26 Location 26 
                                                      OpDecorate %28 Location 28 
                                                      OpDecorate %58 BuiltIn 58 
                                                      OpDecorate %66 ArrayStride 66 
                                                      OpDecorate %67 ArrayStride 67 
                                                      OpDecorate %68 ArrayStride 68 
                                                      OpDecorate %69 ArrayStride 69 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpDecorate %73 ArrayStride 73 
                                                      OpDecorate %76 ArrayStride 76 
                                                      OpDecorate %77 ArrayStride 77 
                                                      OpMemberDecorate %78 0 Offset 78 
                                                      OpMemberDecorate %78 1 Offset 78 
                                                      OpMemberDecorate %78 2 Offset 78 
                                                      OpMemberDecorate %78 3 Offset 78 
                                                      OpMemberDecorate %78 4 Offset 78 
                                                      OpMemberDecorate %78 5 Offset 78 
                                                      OpMemberDecorate %78 6 Offset 78 
                                                      OpMemberDecorate %78 7 Offset 78 
                                                      OpMemberDecorate %78 8 Offset 78 
                                                      OpMemberDecorate %78 9 Offset 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpMemberDecorate %105 0 BuiltIn 105 
                                                      OpMemberDecorate %105 1 BuiltIn 105 
                                                      OpMemberDecorate %105 2 BuiltIn 105 
                                                      OpDecorate %105 Block 
                                                      OpDecorate %122 Location 122 
                                                      OpDecorate %123 ArrayStride 123 
                                                      OpMemberDecorate %124 0 Offset 124 
                                                      OpDecorate %124 Block 
                                                      OpDecorate %126 DescriptorSet 126 
                                                      OpDecorate %126 Binding 126 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                              %16 = OpTypeStruct %15 %7 
                                              %17 = OpTypePointer Uniform %16 
           Uniform struct {f32_4[4]; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 1 
                                              %21 = OpTypePointer Uniform %7 
                                              %25 = OpTypePointer Output %7 
                                Output f32_4* %26 = OpVariable Output 
                                 Input f32_4* %28 = OpVariable Input 
                                          i32 %31 = OpConstant 0 
                                          i32 %42 = OpConstant 2 
                                          i32 %51 = OpConstant 3 
                                              %55 = OpTypePointer Private %19 
                                 Private i32* %56 = OpVariable Private 
                                              %57 = OpTypePointer Input %13 
                                   Input u32* %58 = OpVariable Input 
                               Private f32_4* %62 = OpVariable Private 
                                          u32 %65 = OpConstant 8 
                                              %66 = OpTypeArray %7 %65 
                                              %67 = OpTypeArray %7 %65 
                                              %68 = OpTypeArray %7 %65 
                                              %69 = OpTypeArray %7 %65 
                                              %70 = OpTypeArray %7 %65 
                                              %71 = OpTypeArray %7 %65 
                                              %72 = OpTypeArray %7 %65 
                                              %73 = OpTypeArray %7 %65 
                                              %74 = OpTypeVector %6 3 
                                          u32 %75 = OpConstant 2 
                                              %76 = OpTypeArray %74 %75 
                                              %77 = OpTypeArray %7 %75 
                                              %78 = OpTypeStruct %66 %67 %68 %69 %70 %71 %72 %73 %76 %77 
                                              %79 = OpTypePointer Uniform %78 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_3[2]; f32_4[2];}* %80 = OpVariable Uniform 
                                         u32 %103 = OpConstant 1 
                                             %104 = OpTypeArray %6 %103 
                                             %105 = OpTypeStruct %7 %6 %104 
                                             %106 = OpTypePointer Output %105 
        Output struct {f32_4; f32; f32[1];}* %107 = OpVariable Output 
                                             %118 = OpTypePointer Private %13 
                                Private u32* %119 = OpVariable Private 
                                             %121 = OpTypePointer Output %6 
                                 Output f32* %122 = OpVariable Output 
                                             %123 = OpTypeArray %7 %75 
                                             %124 = OpTypeStruct %123 
                                             %125 = OpTypePointer Uniform %124 
                 Uniform struct {f32_4[2];}* %126 = OpVariable Uniform 
                                         u32 %129 = OpConstant 0 
                                             %130 = OpTypePointer Uniform %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                               Uniform f32_4* %22 = OpAccessChain %18 %20 
                                        f32_4 %23 = OpLoad %22 
                                        f32_4 %24 = OpFMul %12 %23 
                                                      OpStore %9 %24 
                                        f32_4 %27 = OpLoad %9 
                                                      OpStore %26 %27 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpVectorShuffle %29 %29 1 1 1 1 
                               Uniform f32_4* %32 = OpAccessChain %18 %31 %20 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpFMul %30 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %35 = OpAccessChain %18 %31 %31 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpLoad %28 
                                        f32_4 %38 = OpVectorShuffle %37 %37 0 0 0 0 
                                        f32_4 %39 = OpFMul %36 %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_4 %41 = OpFAdd %39 %40 
                                                      OpStore %9 %41 
                               Uniform f32_4* %43 = OpAccessChain %18 %31 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_4 %45 = OpLoad %28 
                                        f32_4 %46 = OpVectorShuffle %45 %45 2 2 2 2 
                                        f32_4 %47 = OpFMul %44 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpFAdd %47 %48 
                                                      OpStore %9 %49 
                                        f32_4 %50 = OpLoad %9 
                               Uniform f32_4* %52 = OpAccessChain %18 %31 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFAdd %50 %53 
                                                      OpStore %9 %54 
                                          u32 %59 = OpLoad %58 
                                          i32 %60 = OpBitcast %59 
                                          i32 %61 = OpShiftLeftLogical %60 %42 
                                                      OpStore %56 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                                          i32 %81 = OpLoad %56 
                                          i32 %82 = OpIAdd %81 %20 
                               Uniform f32_4* %83 = OpAccessChain %80 %51 %82 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFMul %64 %84 
                                                      OpStore %62 %85 
                                          i32 %86 = OpLoad %56 
                               Uniform f32_4* %87 = OpAccessChain %80 %51 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_4 %90 = OpVectorShuffle %89 %89 0 0 0 0 
                                        f32_4 %91 = OpFMul %88 %90 
                                        f32_4 %92 = OpLoad %62 
                                        f32_4 %93 = OpFAdd %91 %92 
                                                      OpStore %62 %93 
                                          i32 %94 = OpLoad %56 
                                          i32 %95 = OpIAdd %94 %42 
                               Uniform f32_4* %96 = OpAccessChain %80 %51 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %62 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %62 %102 
                                         i32 %108 = OpLoad %56 
                                         i32 %109 = OpIAdd %108 %51 
                              Uniform f32_4* %110 = OpAccessChain %80 %51 %109 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %9 
                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %62 
                                       f32_4 %116 = OpFAdd %114 %115 
                               Output f32_4* %117 = OpAccessChain %107 %31 
                                                      OpStore %117 %116 
                                         u32 %120 = OpLoad %58 
                                                      OpStore %119 %120 
                                         u32 %127 = OpLoad %119 
                                         i32 %128 = OpBitcast %127 
                                Uniform f32* %131 = OpAccessChain %126 %31 %128 %129 
                                         f32 %132 = OpLoad %131 
                                                      OpStore %122 %132 
                                 Output f32* %133 = OpAccessChain %107 %31 %103 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFNegate %134 
                                 Output f32* %136 = OpAccessChain %107 %31 %103 
                                                      OpStore %136 %135 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "STEREO_MULTIVIEW_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 138
; Schema: 0
                                                      OpCapability Shader 
                                                      OpCapability MultiView 
                                                      OpExtension "SPV_KHR_multiview" 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %26 %28 %58 %107 %122 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %26 Location 26 
                                                      OpDecorate %28 Location 28 
                                                      OpDecorate %58 BuiltIn 58 
                                                      OpDecorate %66 ArrayStride 66 
                                                      OpDecorate %67 ArrayStride 67 
                                                      OpDecorate %68 ArrayStride 68 
                                                      OpDecorate %69 ArrayStride 69 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpDecorate %73 ArrayStride 73 
                                                      OpDecorate %76 ArrayStride 76 
                                                      OpDecorate %77 ArrayStride 77 
                                                      OpMemberDecorate %78 0 Offset 78 
                                                      OpMemberDecorate %78 1 Offset 78 
                                                      OpMemberDecorate %78 2 Offset 78 
                                                      OpMemberDecorate %78 3 Offset 78 
                                                      OpMemberDecorate %78 4 Offset 78 
                                                      OpMemberDecorate %78 5 Offset 78 
                                                      OpMemberDecorate %78 6 Offset 78 
                                                      OpMemberDecorate %78 7 Offset 78 
                                                      OpMemberDecorate %78 8 Offset 78 
                                                      OpMemberDecorate %78 9 Offset 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpMemberDecorate %105 0 BuiltIn 105 
                                                      OpMemberDecorate %105 1 BuiltIn 105 
                                                      OpMemberDecorate %105 2 BuiltIn 105 
                                                      OpDecorate %105 Block 
                                                      OpDecorate %122 Location 122 
                                                      OpDecorate %123 ArrayStride 123 
                                                      OpMemberDecorate %124 0 Offset 124 
                                                      OpDecorate %124 Block 
                                                      OpDecorate %126 DescriptorSet 126 
                                                      OpDecorate %126 Binding 126 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                              %16 = OpTypeStruct %15 %7 
                                              %17 = OpTypePointer Uniform %16 
           Uniform struct {f32_4[4]; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 1 
                                              %21 = OpTypePointer Uniform %7 
                                              %25 = OpTypePointer Output %7 
                                Output f32_4* %26 = OpVariable Output 
                                 Input f32_4* %28 = OpVariable Input 
                                          i32 %31 = OpConstant 0 
                                          i32 %42 = OpConstant 2 
                                          i32 %51 = OpConstant 3 
                                              %55 = OpTypePointer Private %19 
                                 Private i32* %56 = OpVariable Private 
                                              %57 = OpTypePointer Input %13 
                                   Input u32* %58 = OpVariable Input 
                               Private f32_4* %62 = OpVariable Private 
                                          u32 %65 = OpConstant 8 
                                              %66 = OpTypeArray %7 %65 
                                              %67 = OpTypeArray %7 %65 
                                              %68 = OpTypeArray %7 %65 
                                              %69 = OpTypeArray %7 %65 
                                              %70 = OpTypeArray %7 %65 
                                              %71 = OpTypeArray %7 %65 
                                              %72 = OpTypeArray %7 %65 
                                              %73 = OpTypeArray %7 %65 
                                              %74 = OpTypeVector %6 3 
                                          u32 %75 = OpConstant 2 
                                              %76 = OpTypeArray %74 %75 
                                              %77 = OpTypeArray %7 %75 
                                              %78 = OpTypeStruct %66 %67 %68 %69 %70 %71 %72 %73 %76 %77 
                                              %79 = OpTypePointer Uniform %78 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_3[2]; f32_4[2];}* %80 = OpVariable Uniform 
                                         u32 %103 = OpConstant 1 
                                             %104 = OpTypeArray %6 %103 
                                             %105 = OpTypeStruct %7 %6 %104 
                                             %106 = OpTypePointer Output %105 
        Output struct {f32_4; f32; f32[1];}* %107 = OpVariable Output 
                                             %118 = OpTypePointer Private %13 
                                Private u32* %119 = OpVariable Private 
                                             %121 = OpTypePointer Output %6 
                                 Output f32* %122 = OpVariable Output 
                                             %123 = OpTypeArray %7 %75 
                                             %124 = OpTypeStruct %123 
                                             %125 = OpTypePointer Uniform %124 
                 Uniform struct {f32_4[2];}* %126 = OpVariable Uniform 
                                         u32 %129 = OpConstant 0 
                                             %130 = OpTypePointer Uniform %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                               Uniform f32_4* %22 = OpAccessChain %18 %20 
                                        f32_4 %23 = OpLoad %22 
                                        f32_4 %24 = OpFMul %12 %23 
                                                      OpStore %9 %24 
                                        f32_4 %27 = OpLoad %9 
                                                      OpStore %26 %27 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpVectorShuffle %29 %29 1 1 1 1 
                               Uniform f32_4* %32 = OpAccessChain %18 %31 %20 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpFMul %30 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %35 = OpAccessChain %18 %31 %31 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpLoad %28 
                                        f32_4 %38 = OpVectorShuffle %37 %37 0 0 0 0 
                                        f32_4 %39 = OpFMul %36 %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_4 %41 = OpFAdd %39 %40 
                                                      OpStore %9 %41 
                               Uniform f32_4* %43 = OpAccessChain %18 %31 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_4 %45 = OpLoad %28 
                                        f32_4 %46 = OpVectorShuffle %45 %45 2 2 2 2 
                                        f32_4 %47 = OpFMul %44 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpFAdd %47 %48 
                                                      OpStore %9 %49 
                                        f32_4 %50 = OpLoad %9 
                               Uniform f32_4* %52 = OpAccessChain %18 %31 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFAdd %50 %53 
                                                      OpStore %9 %54 
                                          u32 %59 = OpLoad %58 
                                          i32 %60 = OpBitcast %59 
                                          i32 %61 = OpShiftLeftLogical %60 %42 
                                                      OpStore %56 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                                          i32 %81 = OpLoad %56 
                                          i32 %82 = OpIAdd %81 %20 
                               Uniform f32_4* %83 = OpAccessChain %80 %51 %82 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFMul %64 %84 
                                                      OpStore %62 %85 
                                          i32 %86 = OpLoad %56 
                               Uniform f32_4* %87 = OpAccessChain %80 %51 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_4 %90 = OpVectorShuffle %89 %89 0 0 0 0 
                                        f32_4 %91 = OpFMul %88 %90 
                                        f32_4 %92 = OpLoad %62 
                                        f32_4 %93 = OpFAdd %91 %92 
                                                      OpStore %62 %93 
                                          i32 %94 = OpLoad %56 
                                          i32 %95 = OpIAdd %94 %42 
                               Uniform f32_4* %96 = OpAccessChain %80 %51 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %62 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %62 %102 
                                         i32 %108 = OpLoad %56 
                                         i32 %109 = OpIAdd %108 %51 
                              Uniform f32_4* %110 = OpAccessChain %80 %51 %109 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %9 
                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %62 
                                       f32_4 %116 = OpFAdd %114 %115 
                               Output f32_4* %117 = OpAccessChain %107 %31 
                                                      OpStore %117 %116 
                                         u32 %120 = OpLoad %58 
                                                      OpStore %119 %120 
                                         u32 %127 = OpLoad %119 
                                         i32 %128 = OpBitcast %127 
                                Uniform f32* %131 = OpAccessChain %126 %31 %128 %129 
                                         f32 %132 = OpLoad %131 
                                                      OpStore %122 %132 
                                 Output f32* %133 = OpAccessChain %107 %31 %103 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFNegate %134 
                                 Output f32* %136 = OpAccessChain %107 %31 %103 
                                                      OpStore %136 %135 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "STEREO_MULTIVIEW_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 138
; Schema: 0
                                                      OpCapability Shader 
                                                      OpCapability MultiView 
                                                      OpExtension "SPV_KHR_multiview" 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %26 %28 %58 %107 %122 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %26 Location 26 
                                                      OpDecorate %28 Location 28 
                                                      OpDecorate %58 BuiltIn 58 
                                                      OpDecorate %66 ArrayStride 66 
                                                      OpDecorate %67 ArrayStride 67 
                                                      OpDecorate %68 ArrayStride 68 
                                                      OpDecorate %69 ArrayStride 69 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpDecorate %73 ArrayStride 73 
                                                      OpDecorate %76 ArrayStride 76 
                                                      OpDecorate %77 ArrayStride 77 
                                                      OpMemberDecorate %78 0 Offset 78 
                                                      OpMemberDecorate %78 1 Offset 78 
                                                      OpMemberDecorate %78 2 Offset 78 
                                                      OpMemberDecorate %78 3 Offset 78 
                                                      OpMemberDecorate %78 4 Offset 78 
                                                      OpMemberDecorate %78 5 Offset 78 
                                                      OpMemberDecorate %78 6 Offset 78 
                                                      OpMemberDecorate %78 7 Offset 78 
                                                      OpMemberDecorate %78 8 Offset 78 
                                                      OpMemberDecorate %78 9 Offset 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate %80 DescriptorSet 80 
                                                      OpDecorate %80 Binding 80 
                                                      OpMemberDecorate %105 0 BuiltIn 105 
                                                      OpMemberDecorate %105 1 BuiltIn 105 
                                                      OpMemberDecorate %105 2 BuiltIn 105 
                                                      OpDecorate %105 Block 
                                                      OpDecorate %122 Location 122 
                                                      OpDecorate %123 ArrayStride 123 
                                                      OpMemberDecorate %124 0 Offset 124 
                                                      OpDecorate %124 Block 
                                                      OpDecorate %126 DescriptorSet 126 
                                                      OpDecorate %126 Binding 126 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %13 = OpTypeInt 32 0 
                                          u32 %14 = OpConstant 4 
                                              %15 = OpTypeArray %7 %14 
                                              %16 = OpTypeStruct %15 %7 
                                              %17 = OpTypePointer Uniform %16 
           Uniform struct {f32_4[4]; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 1 
                                              %21 = OpTypePointer Uniform %7 
                                              %25 = OpTypePointer Output %7 
                                Output f32_4* %26 = OpVariable Output 
                                 Input f32_4* %28 = OpVariable Input 
                                          i32 %31 = OpConstant 0 
                                          i32 %42 = OpConstant 2 
                                          i32 %51 = OpConstant 3 
                                              %55 = OpTypePointer Private %19 
                                 Private i32* %56 = OpVariable Private 
                                              %57 = OpTypePointer Input %13 
                                   Input u32* %58 = OpVariable Input 
                               Private f32_4* %62 = OpVariable Private 
                                          u32 %65 = OpConstant 8 
                                              %66 = OpTypeArray %7 %65 
                                              %67 = OpTypeArray %7 %65 
                                              %68 = OpTypeArray %7 %65 
                                              %69 = OpTypeArray %7 %65 
                                              %70 = OpTypeArray %7 %65 
                                              %71 = OpTypeArray %7 %65 
                                              %72 = OpTypeArray %7 %65 
                                              %73 = OpTypeArray %7 %65 
                                              %74 = OpTypeVector %6 3 
                                          u32 %75 = OpConstant 2 
                                              %76 = OpTypeArray %74 %75 
                                              %77 = OpTypeArray %7 %75 
                                              %78 = OpTypeStruct %66 %67 %68 %69 %70 %71 %72 %73 %76 %77 
                                              %79 = OpTypePointer Uniform %78 
Uniform struct {f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_4[8]; f32_3[2]; f32_4[2];}* %80 = OpVariable Uniform 
                                         u32 %103 = OpConstant 1 
                                             %104 = OpTypeArray %6 %103 
                                             %105 = OpTypeStruct %7 %6 %104 
                                             %106 = OpTypePointer Output %105 
        Output struct {f32_4; f32; f32[1];}* %107 = OpVariable Output 
                                             %118 = OpTypePointer Private %13 
                                Private u32* %119 = OpVariable Private 
                                             %121 = OpTypePointer Output %6 
                                 Output f32* %122 = OpVariable Output 
                                             %123 = OpTypeArray %7 %75 
                                             %124 = OpTypeStruct %123 
                                             %125 = OpTypePointer Uniform %124 
                 Uniform struct {f32_4[2];}* %126 = OpVariable Uniform 
                                         u32 %129 = OpConstant 0 
                                             %130 = OpTypePointer Uniform %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                               Uniform f32_4* %22 = OpAccessChain %18 %20 
                                        f32_4 %23 = OpLoad %22 
                                        f32_4 %24 = OpFMul %12 %23 
                                                      OpStore %9 %24 
                                        f32_4 %27 = OpLoad %9 
                                                      OpStore %26 %27 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpVectorShuffle %29 %29 1 1 1 1 
                               Uniform f32_4* %32 = OpAccessChain %18 %31 %20 
                                        f32_4 %33 = OpLoad %32 
                                        f32_4 %34 = OpFMul %30 %33 
                                                      OpStore %9 %34 
                               Uniform f32_4* %35 = OpAccessChain %18 %31 %31 
                                        f32_4 %36 = OpLoad %35 
                                        f32_4 %37 = OpLoad %28 
                                        f32_4 %38 = OpVectorShuffle %37 %37 0 0 0 0 
                                        f32_4 %39 = OpFMul %36 %38 
                                        f32_4 %40 = OpLoad %9 
                                        f32_4 %41 = OpFAdd %39 %40 
                                                      OpStore %9 %41 
                               Uniform f32_4* %43 = OpAccessChain %18 %31 %42 
                                        f32_4 %44 = OpLoad %43 
                                        f32_4 %45 = OpLoad %28 
                                        f32_4 %46 = OpVectorShuffle %45 %45 2 2 2 2 
                                        f32_4 %47 = OpFMul %44 %46 
                                        f32_4 %48 = OpLoad %9 
                                        f32_4 %49 = OpFAdd %47 %48 
                                                      OpStore %9 %49 
                                        f32_4 %50 = OpLoad %9 
                               Uniform f32_4* %52 = OpAccessChain %18 %31 %51 
                                        f32_4 %53 = OpLoad %52 
                                        f32_4 %54 = OpFAdd %50 %53 
                                                      OpStore %9 %54 
                                          u32 %59 = OpLoad %58 
                                          i32 %60 = OpBitcast %59 
                                          i32 %61 = OpShiftLeftLogical %60 %42 
                                                      OpStore %56 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 1 1 1 1 
                                          i32 %81 = OpLoad %56 
                                          i32 %82 = OpIAdd %81 %20 
                               Uniform f32_4* %83 = OpAccessChain %80 %51 %82 
                                        f32_4 %84 = OpLoad %83 
                                        f32_4 %85 = OpFMul %64 %84 
                                                      OpStore %62 %85 
                                          i32 %86 = OpLoad %56 
                               Uniform f32_4* %87 = OpAccessChain %80 %51 %86 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_4 %90 = OpVectorShuffle %89 %89 0 0 0 0 
                                        f32_4 %91 = OpFMul %88 %90 
                                        f32_4 %92 = OpLoad %62 
                                        f32_4 %93 = OpFAdd %91 %92 
                                                      OpStore %62 %93 
                                          i32 %94 = OpLoad %56 
                                          i32 %95 = OpIAdd %94 %42 
                               Uniform f32_4* %96 = OpAccessChain %80 %51 %95 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %62 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %62 %102 
                                         i32 %108 = OpLoad %56 
                                         i32 %109 = OpIAdd %108 %51 
                              Uniform f32_4* %110 = OpAccessChain %80 %51 %109 
                                       f32_4 %111 = OpLoad %110 
                                       f32_4 %112 = OpLoad %9 
                                       f32_4 %113 = OpVectorShuffle %112 %112 3 3 3 3 
                                       f32_4 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %62 
                                       f32_4 %116 = OpFAdd %114 %115 
                               Output f32_4* %117 = OpAccessChain %107 %31 
                                                      OpStore %117 %116 
                                         u32 %120 = OpLoad %58 
                                                      OpStore %119 %120 
                                         u32 %127 = OpLoad %119 
                                         i32 %128 = OpBitcast %127 
                                Uniform f32* %131 = OpAccessChain %126 %31 %128 %129 
                                         f32 %132 = OpLoad %131 
                                                      OpStore %122 %132 
                                 Output f32* %133 = OpAccessChain %107 %31 %103 
                                         f32 %134 = OpLoad %133 
                                         f32 %135 = OpFNegate %134 
                                 Output f32* %136 = OpAccessChain %107 %31 %103 
                                                      OpStore %136 %135 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 14
; Schema: 0
                     OpCapability Shader 
              %1 = OpExtInstImport "GLSL.std.450" 
                     OpMemoryModel Logical GLSL450 
                     OpEntryPoint Fragment %4 "main" %9 %11 
                     OpExecutionMode %4 OriginUpperLeft 
                     OpDecorate %9 RelaxedPrecision 
                     OpDecorate %9 Location 9 
                     OpDecorate %11 RelaxedPrecision 
                     OpDecorate %11 Location 11 
                     OpDecorate %12 RelaxedPrecision 
              %2 = OpTypeVoid 
              %3 = OpTypeFunction %2 
              %6 = OpTypeFloat 32 
              %7 = OpTypeVector %6 4 
              %8 = OpTypePointer Output %7 
Output f32_4* %9 = OpVariable Output 
             %10 = OpTypePointer Input %7 
Input f32_4* %11 = OpVariable Input 
         void %4 = OpFunction None %3 
              %5 = OpLabel 
       f32_4 %12 = OpLoad %11 
                     OpStore %9 %12 
                     OpReturn
                     OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
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
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_SINGLE_PASS_STEREO" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "STEREO_INSTANCING_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "STEREO_INSTANCING_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "STEREO_INSTANCING_ON" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "STEREO_INSTANCING_ON" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "STEREO_INSTANCING_ON" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "STEREO_INSTANCING_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "STEREO_MULTIVIEW_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "STEREO_MULTIVIEW_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "STEREO_MULTIVIEW_ON" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "STEREO_MULTIVIEW_ON" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "STEREO_MULTIVIEW_ON" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "STEREO_MULTIVIEW_ON" }
""
}
}
}
}
}