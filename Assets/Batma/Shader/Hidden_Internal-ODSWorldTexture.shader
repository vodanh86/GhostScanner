//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-ODSWorldTexture" {
Properties {
_MainTex ("", 2D) = "white" { }
_Cutoff ("", Float) = 0.5
_Color ("", Color) = (1,1,1,1)
}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
  GpuProgramID 62904
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
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_TEXCOORD0;
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
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_TEXCOORD0;
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
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_TEXCOORD0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %54 %85 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate vs_TEXCOORD0 Location 54 
                                              OpMemberDecorate %83 0 BuiltIn 83 
                                              OpMemberDecorate %83 1 BuiltIn 83 
                                              OpMemberDecorate %83 2 BuiltIn 83 
                                              OpDecorate %83 Block 
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
                                      %43 = OpTypeVector %6 3 
                                      %44 = OpTypePointer Private %43 
                       Private f32_3* %45 = OpVariable Private 
                                  i32 %48 = OpConstant 3 
                                      %53 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                  u32 %81 = OpConstant 1 
                                      %82 = OpTypeArray %6 %81 
                                      %83 = OpTypeStruct %7 %6 %82 
                                      %84 = OpTypePointer Output %83 
 Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                      %91 = OpTypePointer Output %6 
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
                                f32_4 %46 = OpLoad %9 
                                f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                       Uniform f32_4* %49 = OpAccessChain %20 %22 %48 
                                f32_4 %50 = OpLoad %49 
                                f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                f32_3 %52 = OpFAdd %47 %51 
                                              OpStore %45 %52 
                       Uniform f32_4* %55 = OpAccessChain %20 %22 %48 
                                f32_4 %56 = OpLoad %55 
                                f32_4 %57 = OpLoad %11 
                                f32_4 %58 = OpVectorShuffle %57 %57 3 3 3 3 
                                f32_4 %59 = OpFMul %56 %58 
                                f32_4 %60 = OpLoad %9 
                                f32_4 %61 = OpFAdd %59 %60 
                                              OpStore vs_TEXCOORD0 %61 
                                f32_3 %62 = OpLoad %45 
                                f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                       Uniform f32_4* %64 = OpAccessChain %20 %23 %23 
                                f32_4 %65 = OpLoad %64 
                                f32_4 %66 = OpFMul %63 %65 
                                              OpStore %9 %66 
                       Uniform f32_4* %67 = OpAccessChain %20 %23 %22 
                                f32_4 %68 = OpLoad %67 
                                f32_3 %69 = OpLoad %45 
                                f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %9 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %9 %73 
                       Uniform f32_4* %74 = OpAccessChain %20 %23 %35 
                                f32_4 %75 = OpLoad %74 
                                f32_3 %76 = OpLoad %45 
                                f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                f32_4 %78 = OpFMul %75 %77 
                                f32_4 %79 = OpLoad %9 
                                f32_4 %80 = OpFAdd %78 %79 
                                              OpStore %9 %80 
                                f32_4 %86 = OpLoad %9 
                       Uniform f32_4* %87 = OpAccessChain %20 %23 %48 
                                f32_4 %88 = OpLoad %87 
                                f32_4 %89 = OpFAdd %86 %88 
                        Output f32_4* %90 = OpAccessChain %85 %22 
                                              OpStore %90 %89 
                          Output f32* %92 = OpAccessChain %85 %22 %81 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %85 %22 %81 
                                              OpStore %95 %94 
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
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate %9 Location 9 
                              OpDecorate vs_TEXCOORD0 Location 11 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 4 
                       %8 = OpTypePointer Output %7 
         Output f32_4* %9 = OpVariable Output 
                      %10 = OpTypePointer Input %7 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                f32_4 %12 = OpLoad vs_TEXCOORD0 
                              OpStore %9 %12 
                              OpReturn
                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %54 %85 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate vs_TEXCOORD0 Location 54 
                                              OpMemberDecorate %83 0 BuiltIn 83 
                                              OpMemberDecorate %83 1 BuiltIn 83 
                                              OpMemberDecorate %83 2 BuiltIn 83 
                                              OpDecorate %83 Block 
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
                                      %43 = OpTypeVector %6 3 
                                      %44 = OpTypePointer Private %43 
                       Private f32_3* %45 = OpVariable Private 
                                  i32 %48 = OpConstant 3 
                                      %53 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                  u32 %81 = OpConstant 1 
                                      %82 = OpTypeArray %6 %81 
                                      %83 = OpTypeStruct %7 %6 %82 
                                      %84 = OpTypePointer Output %83 
 Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                      %91 = OpTypePointer Output %6 
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
                                f32_4 %46 = OpLoad %9 
                                f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                       Uniform f32_4* %49 = OpAccessChain %20 %22 %48 
                                f32_4 %50 = OpLoad %49 
                                f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                f32_3 %52 = OpFAdd %47 %51 
                                              OpStore %45 %52 
                       Uniform f32_4* %55 = OpAccessChain %20 %22 %48 
                                f32_4 %56 = OpLoad %55 
                                f32_4 %57 = OpLoad %11 
                                f32_4 %58 = OpVectorShuffle %57 %57 3 3 3 3 
                                f32_4 %59 = OpFMul %56 %58 
                                f32_4 %60 = OpLoad %9 
                                f32_4 %61 = OpFAdd %59 %60 
                                              OpStore vs_TEXCOORD0 %61 
                                f32_3 %62 = OpLoad %45 
                                f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                       Uniform f32_4* %64 = OpAccessChain %20 %23 %23 
                                f32_4 %65 = OpLoad %64 
                                f32_4 %66 = OpFMul %63 %65 
                                              OpStore %9 %66 
                       Uniform f32_4* %67 = OpAccessChain %20 %23 %22 
                                f32_4 %68 = OpLoad %67 
                                f32_3 %69 = OpLoad %45 
                                f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %9 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %9 %73 
                       Uniform f32_4* %74 = OpAccessChain %20 %23 %35 
                                f32_4 %75 = OpLoad %74 
                                f32_3 %76 = OpLoad %45 
                                f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                f32_4 %78 = OpFMul %75 %77 
                                f32_4 %79 = OpLoad %9 
                                f32_4 %80 = OpFAdd %78 %79 
                                              OpStore %9 %80 
                                f32_4 %86 = OpLoad %9 
                       Uniform f32_4* %87 = OpAccessChain %20 %23 %48 
                                f32_4 %88 = OpLoad %87 
                                f32_4 %89 = OpFAdd %86 %88 
                        Output f32_4* %90 = OpAccessChain %85 %22 
                                              OpStore %90 %89 
                          Output f32* %92 = OpAccessChain %85 %22 %81 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %85 %22 %81 
                                              OpStore %95 %94 
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
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate %9 Location 9 
                              OpDecorate vs_TEXCOORD0 Location 11 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 4 
                       %8 = OpTypePointer Output %7 
         Output f32_4* %9 = OpVariable Output 
                      %10 = OpTypePointer Input %7 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                f32_4 %12 = OpLoad vs_TEXCOORD0 
                              OpStore %9 %12 
                              OpReturn
                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 97
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %54 %85 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpDecorate vs_TEXCOORD0 Location 54 
                                              OpMemberDecorate %83 0 BuiltIn 83 
                                              OpMemberDecorate %83 1 BuiltIn 83 
                                              OpMemberDecorate %83 2 BuiltIn 83 
                                              OpDecorate %83 Block 
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
                                      %43 = OpTypeVector %6 3 
                                      %44 = OpTypePointer Private %43 
                       Private f32_3* %45 = OpVariable Private 
                                  i32 %48 = OpConstant 3 
                                      %53 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                  u32 %81 = OpConstant 1 
                                      %82 = OpTypeArray %6 %81 
                                      %83 = OpTypeStruct %7 %6 %82 
                                      %84 = OpTypePointer Output %83 
 Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                      %91 = OpTypePointer Output %6 
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
                                f32_4 %46 = OpLoad %9 
                                f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                       Uniform f32_4* %49 = OpAccessChain %20 %22 %48 
                                f32_4 %50 = OpLoad %49 
                                f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                f32_3 %52 = OpFAdd %47 %51 
                                              OpStore %45 %52 
                       Uniform f32_4* %55 = OpAccessChain %20 %22 %48 
                                f32_4 %56 = OpLoad %55 
                                f32_4 %57 = OpLoad %11 
                                f32_4 %58 = OpVectorShuffle %57 %57 3 3 3 3 
                                f32_4 %59 = OpFMul %56 %58 
                                f32_4 %60 = OpLoad %9 
                                f32_4 %61 = OpFAdd %59 %60 
                                              OpStore vs_TEXCOORD0 %61 
                                f32_3 %62 = OpLoad %45 
                                f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                       Uniform f32_4* %64 = OpAccessChain %20 %23 %23 
                                f32_4 %65 = OpLoad %64 
                                f32_4 %66 = OpFMul %63 %65 
                                              OpStore %9 %66 
                       Uniform f32_4* %67 = OpAccessChain %20 %23 %22 
                                f32_4 %68 = OpLoad %67 
                                f32_3 %69 = OpLoad %45 
                                f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                f32_4 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %9 
                                f32_4 %73 = OpFAdd %71 %72 
                                              OpStore %9 %73 
                       Uniform f32_4* %74 = OpAccessChain %20 %23 %35 
                                f32_4 %75 = OpLoad %74 
                                f32_3 %76 = OpLoad %45 
                                f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                f32_4 %78 = OpFMul %75 %77 
                                f32_4 %79 = OpLoad %9 
                                f32_4 %80 = OpFAdd %78 %79 
                                              OpStore %9 %80 
                                f32_4 %86 = OpLoad %9 
                       Uniform f32_4* %87 = OpAccessChain %20 %23 %48 
                                f32_4 %88 = OpLoad %87 
                                f32_4 %89 = OpFAdd %86 %88 
                        Output f32_4* %90 = OpAccessChain %85 %22 
                                              OpStore %90 %89 
                          Output f32* %92 = OpAccessChain %85 %22 %81 
                                  f32 %93 = OpLoad %92 
                                  f32 %94 = OpFNegate %93 
                          Output f32* %95 = OpAccessChain %85 %22 %81 
                                              OpStore %95 %94 
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
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate %9 Location 9 
                              OpDecorate vs_TEXCOORD0 Location 11 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 4 
                       %8 = OpTypePointer Output %7 
         Output f32_4* %9 = OpVariable Output 
                      %10 = OpTypePointer Input %7 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                f32_4 %12 = OpLoad vs_TEXCOORD0 
                              OpStore %9 %12 
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
 Tags { "RenderType" = "TransparentCutout" }
 Pass {
  Tags { "RenderType" = "TransparentCutout" }
  GpuProgramID 66522
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = u_xlat16_0 * _Color.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD0;
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = u_xlat16_0 * _Color.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD0;
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
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec3 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump float _Cutoff;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = u_xlat16_0 * _Color.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 111
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %54 %85 %93 %94 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate vs_TEXCOORD0 Location 54 
                                                     OpMemberDecorate %83 0 BuiltIn 83 
                                                     OpMemberDecorate %83 1 BuiltIn 83 
                                                     OpMemberDecorate %83 2 BuiltIn 83 
                                                     OpDecorate %83 Block 
                                                     OpDecorate vs_TEXCOORD1 Location 93 
                                                     OpDecorate %94 Location 94 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                             %43 = OpTypeVector %6 3 
                                             %44 = OpTypePointer Private %43 
                              Private f32_3* %45 = OpVariable Private 
                                         i32 %48 = OpConstant 3 
                                             %53 = OpTypePointer Output %7 
                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                         u32 %81 = OpConstant 1 
                                             %82 = OpTypeArray %6 %81 
                                             %83 = OpTypeStruct %7 %6 %82 
                                             %84 = OpTypePointer Output %83 
        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                             %91 = OpTypeVector %6 2 
                                             %92 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                Input f32_4* %94 = OpVariable Input 
                                            %105 = OpTypePointer Output %6 
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
                                       f32_4 %46 = OpLoad %9 
                                       f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                              Uniform f32_4* %49 = OpAccessChain %20 %22 %48 
                                       f32_4 %50 = OpLoad %49 
                                       f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                       f32_3 %52 = OpFAdd %47 %51 
                                                     OpStore %45 %52 
                              Uniform f32_4* %55 = OpAccessChain %20 %22 %48 
                                       f32_4 %56 = OpLoad %55 
                                       f32_4 %57 = OpLoad %11 
                                       f32_4 %58 = OpVectorShuffle %57 %57 3 3 3 3 
                                       f32_4 %59 = OpFMul %56 %58 
                                       f32_4 %60 = OpLoad %9 
                                       f32_4 %61 = OpFAdd %59 %60 
                                                     OpStore vs_TEXCOORD0 %61 
                                       f32_3 %62 = OpLoad %45 
                                       f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                              Uniform f32_4* %64 = OpAccessChain %20 %23 %23 
                                       f32_4 %65 = OpLoad %64 
                                       f32_4 %66 = OpFMul %63 %65 
                                                     OpStore %9 %66 
                              Uniform f32_4* %67 = OpAccessChain %20 %23 %22 
                                       f32_4 %68 = OpLoad %67 
                                       f32_3 %69 = OpLoad %45 
                                       f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %9 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %9 %73 
                              Uniform f32_4* %74 = OpAccessChain %20 %23 %35 
                                       f32_4 %75 = OpLoad %74 
                                       f32_3 %76 = OpLoad %45 
                                       f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %9 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %9 %80 
                                       f32_4 %86 = OpLoad %9 
                              Uniform f32_4* %87 = OpAccessChain %20 %23 %48 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpFAdd %86 %88 
                               Output f32_4* %90 = OpAccessChain %85 %22 
                                                     OpStore %90 %89 
                                       f32_4 %95 = OpLoad %94 
                                       f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                              Uniform f32_4* %97 = OpAccessChain %20 %35 
                                       f32_4 %98 = OpLoad %97 
                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                      f32_2 %100 = OpFMul %96 %99 
                             Uniform f32_4* %101 = OpAccessChain %20 %35 
                                      f32_4 %102 = OpLoad %101 
                                      f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                      f32_2 %104 = OpFAdd %100 %103 
                                                     OpStore vs_TEXCOORD1 %104 
                                Output f32* %106 = OpAccessChain %85 %22 %81 
                                        f32 %107 = OpLoad %106 
                                        f32 %108 = OpFNegate %107 
                                Output f32* %109 = OpAccessChain %85 %22 %81 
                                                     OpStore %109 %108 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 64
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %59 %61 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
                                             OpDecorate vs_TEXCOORD1 Location 21 
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
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %59 Location 59 
                                             OpDecorate vs_TEXCOORD0 Location 61 
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
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                        Private f32* %28 = OpVariable Private 
                                     %30 = OpTypeStruct %6 %23 
                                     %31 = OpTypePointer Uniform %30 
       Uniform struct {f32; f32_4;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 1 
                                     %35 = OpTypePointer Uniform %6 
                                 i32 %39 = OpConstant 0 
                                     %44 = OpTypeBool 
                                     %45 = OpTypePointer Private %44 
                       Private bool* %46 = OpVariable Private 
                                 f32 %48 = OpConstant 3.674022E-40 
                                 i32 %52 = OpConstant -1 
                                     %58 = OpTypePointer Output %23 
                       Output f32_4* %59 = OpVariable Output 
                                     %60 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD1 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %29 = OpLoad %8 
                        Uniform f32* %36 = OpAccessChain %32 %34 %26 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFMul %29 %37 
                        Uniform f32* %40 = OpAccessChain %32 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFNegate %41 
                                 f32 %43 = OpFAdd %38 %42 
                                             OpStore %28 %43 
                                 f32 %47 = OpLoad %28 
                                bool %49 = OpFOrdLessThan %47 %48 
                                             OpStore %46 %49 
                                bool %50 = OpLoad %46 
                                 i32 %51 = OpSelect %50 %34 %39 
                                 i32 %53 = OpIMul %51 %52 
                                bool %54 = OpINotEqual %53 %39 
                                             OpSelectionMerge %56 None 
                                             OpBranchConditional %54 %55 %56 
                                     %55 = OpLabel 
                                             OpKill
                                     %56 = OpLabel 
                               f32_4 %62 = OpLoad vs_TEXCOORD0 
                                             OpStore %59 %62 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 111
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %54 %85 %93 %94 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate vs_TEXCOORD0 Location 54 
                                                     OpMemberDecorate %83 0 BuiltIn 83 
                                                     OpMemberDecorate %83 1 BuiltIn 83 
                                                     OpMemberDecorate %83 2 BuiltIn 83 
                                                     OpDecorate %83 Block 
                                                     OpDecorate vs_TEXCOORD1 Location 93 
                                                     OpDecorate %94 Location 94 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                             %43 = OpTypeVector %6 3 
                                             %44 = OpTypePointer Private %43 
                              Private f32_3* %45 = OpVariable Private 
                                         i32 %48 = OpConstant 3 
                                             %53 = OpTypePointer Output %7 
                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                         u32 %81 = OpConstant 1 
                                             %82 = OpTypeArray %6 %81 
                                             %83 = OpTypeStruct %7 %6 %82 
                                             %84 = OpTypePointer Output %83 
        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                             %91 = OpTypeVector %6 2 
                                             %92 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                Input f32_4* %94 = OpVariable Input 
                                            %105 = OpTypePointer Output %6 
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
                                       f32_4 %46 = OpLoad %9 
                                       f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                              Uniform f32_4* %49 = OpAccessChain %20 %22 %48 
                                       f32_4 %50 = OpLoad %49 
                                       f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                       f32_3 %52 = OpFAdd %47 %51 
                                                     OpStore %45 %52 
                              Uniform f32_4* %55 = OpAccessChain %20 %22 %48 
                                       f32_4 %56 = OpLoad %55 
                                       f32_4 %57 = OpLoad %11 
                                       f32_4 %58 = OpVectorShuffle %57 %57 3 3 3 3 
                                       f32_4 %59 = OpFMul %56 %58 
                                       f32_4 %60 = OpLoad %9 
                                       f32_4 %61 = OpFAdd %59 %60 
                                                     OpStore vs_TEXCOORD0 %61 
                                       f32_3 %62 = OpLoad %45 
                                       f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                              Uniform f32_4* %64 = OpAccessChain %20 %23 %23 
                                       f32_4 %65 = OpLoad %64 
                                       f32_4 %66 = OpFMul %63 %65 
                                                     OpStore %9 %66 
                              Uniform f32_4* %67 = OpAccessChain %20 %23 %22 
                                       f32_4 %68 = OpLoad %67 
                                       f32_3 %69 = OpLoad %45 
                                       f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %9 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %9 %73 
                              Uniform f32_4* %74 = OpAccessChain %20 %23 %35 
                                       f32_4 %75 = OpLoad %74 
                                       f32_3 %76 = OpLoad %45 
                                       f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %9 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %9 %80 
                                       f32_4 %86 = OpLoad %9 
                              Uniform f32_4* %87 = OpAccessChain %20 %23 %48 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpFAdd %86 %88 
                               Output f32_4* %90 = OpAccessChain %85 %22 
                                                     OpStore %90 %89 
                                       f32_4 %95 = OpLoad %94 
                                       f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                              Uniform f32_4* %97 = OpAccessChain %20 %35 
                                       f32_4 %98 = OpLoad %97 
                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                      f32_2 %100 = OpFMul %96 %99 
                             Uniform f32_4* %101 = OpAccessChain %20 %35 
                                      f32_4 %102 = OpLoad %101 
                                      f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                      f32_2 %104 = OpFAdd %100 %103 
                                                     OpStore vs_TEXCOORD1 %104 
                                Output f32* %106 = OpAccessChain %85 %22 %81 
                                        f32 %107 = OpLoad %106 
                                        f32 %108 = OpFNegate %107 
                                Output f32* %109 = OpAccessChain %85 %22 %81 
                                                     OpStore %109 %108 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 64
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %59 %61 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
                                             OpDecorate vs_TEXCOORD1 Location 21 
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
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %59 Location 59 
                                             OpDecorate vs_TEXCOORD0 Location 61 
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
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                        Private f32* %28 = OpVariable Private 
                                     %30 = OpTypeStruct %6 %23 
                                     %31 = OpTypePointer Uniform %30 
       Uniform struct {f32; f32_4;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 1 
                                     %35 = OpTypePointer Uniform %6 
                                 i32 %39 = OpConstant 0 
                                     %44 = OpTypeBool 
                                     %45 = OpTypePointer Private %44 
                       Private bool* %46 = OpVariable Private 
                                 f32 %48 = OpConstant 3.674022E-40 
                                 i32 %52 = OpConstant -1 
                                     %58 = OpTypePointer Output %23 
                       Output f32_4* %59 = OpVariable Output 
                                     %60 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD1 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %29 = OpLoad %8 
                        Uniform f32* %36 = OpAccessChain %32 %34 %26 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFMul %29 %37 
                        Uniform f32* %40 = OpAccessChain %32 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFNegate %41 
                                 f32 %43 = OpFAdd %38 %42 
                                             OpStore %28 %43 
                                 f32 %47 = OpLoad %28 
                                bool %49 = OpFOrdLessThan %47 %48 
                                             OpStore %46 %49 
                                bool %50 = OpLoad %46 
                                 i32 %51 = OpSelect %50 %34 %39 
                                 i32 %53 = OpIMul %51 %52 
                                bool %54 = OpINotEqual %53 %39 
                                             OpSelectionMerge %56 None 
                                             OpBranchConditional %54 %55 %56 
                                     %55 = OpLabel 
                                             OpKill
                                     %56 = OpLabel 
                               f32_4 %62 = OpLoad vs_TEXCOORD0 
                                             OpStore %59 %62 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 111
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %54 %85 %93 %94 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpDecorate vs_TEXCOORD0 Location 54 
                                                     OpMemberDecorate %83 0 BuiltIn 83 
                                                     OpMemberDecorate %83 1 BuiltIn 83 
                                                     OpMemberDecorate %83 2 BuiltIn 83 
                                                     OpDecorate %83 Block 
                                                     OpDecorate vs_TEXCOORD1 Location 93 
                                                     OpDecorate %94 Location 94 
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
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                             %43 = OpTypeVector %6 3 
                                             %44 = OpTypePointer Private %43 
                              Private f32_3* %45 = OpVariable Private 
                                         i32 %48 = OpConstant 3 
                                             %53 = OpTypePointer Output %7 
                      Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                         u32 %81 = OpConstant 1 
                                             %82 = OpTypeArray %6 %81 
                                             %83 = OpTypeStruct %7 %6 %82 
                                             %84 = OpTypePointer Output %83 
        Output struct {f32_4; f32; f32[1];}* %85 = OpVariable Output 
                                             %91 = OpTypeVector %6 2 
                                             %92 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                                Input f32_4* %94 = OpVariable Input 
                                            %105 = OpTypePointer Output %6 
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
                                       f32_4 %46 = OpLoad %9 
                                       f32_3 %47 = OpVectorShuffle %46 %46 0 1 2 
                              Uniform f32_4* %49 = OpAccessChain %20 %22 %48 
                                       f32_4 %50 = OpLoad %49 
                                       f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                       f32_3 %52 = OpFAdd %47 %51 
                                                     OpStore %45 %52 
                              Uniform f32_4* %55 = OpAccessChain %20 %22 %48 
                                       f32_4 %56 = OpLoad %55 
                                       f32_4 %57 = OpLoad %11 
                                       f32_4 %58 = OpVectorShuffle %57 %57 3 3 3 3 
                                       f32_4 %59 = OpFMul %56 %58 
                                       f32_4 %60 = OpLoad %9 
                                       f32_4 %61 = OpFAdd %59 %60 
                                                     OpStore vs_TEXCOORD0 %61 
                                       f32_3 %62 = OpLoad %45 
                                       f32_4 %63 = OpVectorShuffle %62 %62 1 1 1 1 
                              Uniform f32_4* %64 = OpAccessChain %20 %23 %23 
                                       f32_4 %65 = OpLoad %64 
                                       f32_4 %66 = OpFMul %63 %65 
                                                     OpStore %9 %66 
                              Uniform f32_4* %67 = OpAccessChain %20 %23 %22 
                                       f32_4 %68 = OpLoad %67 
                                       f32_3 %69 = OpLoad %45 
                                       f32_4 %70 = OpVectorShuffle %69 %69 0 0 0 0 
                                       f32_4 %71 = OpFMul %68 %70 
                                       f32_4 %72 = OpLoad %9 
                                       f32_4 %73 = OpFAdd %71 %72 
                                                     OpStore %9 %73 
                              Uniform f32_4* %74 = OpAccessChain %20 %23 %35 
                                       f32_4 %75 = OpLoad %74 
                                       f32_3 %76 = OpLoad %45 
                                       f32_4 %77 = OpVectorShuffle %76 %76 2 2 2 2 
                                       f32_4 %78 = OpFMul %75 %77 
                                       f32_4 %79 = OpLoad %9 
                                       f32_4 %80 = OpFAdd %78 %79 
                                                     OpStore %9 %80 
                                       f32_4 %86 = OpLoad %9 
                              Uniform f32_4* %87 = OpAccessChain %20 %23 %48 
                                       f32_4 %88 = OpLoad %87 
                                       f32_4 %89 = OpFAdd %86 %88 
                               Output f32_4* %90 = OpAccessChain %85 %22 
                                                     OpStore %90 %89 
                                       f32_4 %95 = OpLoad %94 
                                       f32_2 %96 = OpVectorShuffle %95 %95 0 1 
                              Uniform f32_4* %97 = OpAccessChain %20 %35 
                                       f32_4 %98 = OpLoad %97 
                                       f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                                      f32_2 %100 = OpFMul %96 %99 
                             Uniform f32_4* %101 = OpAccessChain %20 %35 
                                      f32_4 %102 = OpLoad %101 
                                      f32_2 %103 = OpVectorShuffle %102 %102 2 3 
                                      f32_2 %104 = OpFAdd %100 %103 
                                                     OpStore vs_TEXCOORD1 %104 
                                Output f32* %106 = OpAccessChain %85 %22 %81 
                                        f32 %107 = OpLoad %106 
                                        f32 %108 = OpFNegate %107 
                                Output f32* %109 = OpAccessChain %85 %22 %81 
                                                     OpStore %109 %108 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 64
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %59 %61 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
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
                                             OpDecorate vs_TEXCOORD1 Location 21 
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
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %59 Location 59 
                                             OpDecorate vs_TEXCOORD0 Location 61 
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
               Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %23 = OpTypeVector %6 4 
                                     %25 = OpTypeInt 32 0 
                                 u32 %26 = OpConstant 3 
                        Private f32* %28 = OpVariable Private 
                                     %30 = OpTypeStruct %6 %23 
                                     %31 = OpTypePointer Uniform %30 
       Uniform struct {f32; f32_4;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 1 
                                     %35 = OpTypePointer Uniform %6 
                                 i32 %39 = OpConstant 0 
                                     %44 = OpTypeBool 
                                     %45 = OpTypePointer Private %44 
                       Private bool* %46 = OpVariable Private 
                                 f32 %48 = OpConstant 3.674022E-40 
                                 i32 %52 = OpConstant -1 
                                     %58 = OpTypePointer Output %23 
                       Output f32_4* %59 = OpVariable Output 
                                     %60 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %12 = OpLoad %11 
                             sampler %16 = OpLoad %15 
          read_only Texture2DSampled %18 = OpSampledImage %12 %16 
                               f32_2 %22 = OpLoad vs_TEXCOORD1 
                               f32_4 %24 = OpImageSampleImplicitLod %18 %22 
                                 f32 %27 = OpCompositeExtract %24 3 
                                             OpStore %8 %27 
                                 f32 %29 = OpLoad %8 
                        Uniform f32* %36 = OpAccessChain %32 %34 %26 
                                 f32 %37 = OpLoad %36 
                                 f32 %38 = OpFMul %29 %37 
                        Uniform f32* %40 = OpAccessChain %32 %39 
                                 f32 %41 = OpLoad %40 
                                 f32 %42 = OpFNegate %41 
                                 f32 %43 = OpFAdd %38 %42 
                                             OpStore %28 %43 
                                 f32 %47 = OpLoad %28 
                                bool %49 = OpFOrdLessThan %47 %48 
                                             OpStore %46 %49 
                                bool %50 = OpLoad %46 
                                 i32 %51 = OpSelect %50 %34 %39 
                                 i32 %53 = OpIMul %51 %52 
                                bool %54 = OpINotEqual %53 %39 
                                             OpSelectionMerge %56 None 
                                             OpBranchConditional %54 %55 %56 
                                     %55 = OpLabel 
                                             OpKill
                                     %56 = OpLabel 
                               f32_4 %62 = OpLoad vs_TEXCOORD0 
                                             OpStore %59 %62 
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
 Tags { "RenderType" = "TreeBark" }
 Pass {
  Tags { "RenderType" = "TreeBark" }
  GpuProgramID 157769
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
uniform 	vec4 _Wind;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.x = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
    u_xlat8 = u_xlat0.y + in_COLOR0.y;
    u_xlat1.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, vec3(u_xlat8));
    u_xlat0 = u_xlat0.xxyy + _Time.yyyy;
    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = abs(u_xlat0) * abs(u_xlat0);
    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat0.xy = u_xlat0.yw + u_xlat0.xz;
    u_xlat2.xyz = u_xlat0.yyy * _Wind.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_TEXCOORD1.yyy;
    u_xlat3.y = u_xlat0.y * in_TEXCOORD1.y;
    u_xlat4 = in_COLOR0.y * 0.100000001;
    u_xlat3.xz = vec2(u_xlat4) * in_NORMAL0.xz;
    u_xlat0.z = 0.300000012;
    u_xlat0.xyz = u_xlat0.xzx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat1.xyz;
    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
    u_xlat12 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat12 = u_xlat12 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat12)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_TEXCOORD0;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
uniform 	vec4 _Wind;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.x = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
    u_xlat8 = u_xlat0.y + in_COLOR0.y;
    u_xlat1.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, vec3(u_xlat8));
    u_xlat0 = u_xlat0.xxyy + _Time.yyyy;
    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = abs(u_xlat0) * abs(u_xlat0);
    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat0.xy = u_xlat0.yw + u_xlat0.xz;
    u_xlat2.xyz = u_xlat0.yyy * _Wind.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_TEXCOORD1.yyy;
    u_xlat3.y = u_xlat0.y * in_TEXCOORD1.y;
    u_xlat4 = in_COLOR0.y * 0.100000001;
    u_xlat3.xz = vec2(u_xlat4) * in_NORMAL0.xz;
    u_xlat0.z = 0.300000012;
    u_xlat0.xyz = u_xlat0.xzx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat1.xyz;
    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
    u_xlat12 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat12 = u_xlat12 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat12)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_TEXCOORD0;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
uniform 	vec4 _Wind;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
float u_xlat4;
float u_xlat8;
float u_xlat12;
void main()
{
    u_xlat0.x = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
    u_xlat0.y = u_xlat0.x + in_COLOR0.x;
    u_xlat8 = u_xlat0.y + in_COLOR0.y;
    u_xlat1.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, vec3(u_xlat8));
    u_xlat0 = u_xlat0.xxyy + _Time.yyyy;
    u_xlat0 = u_xlat0 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = abs(u_xlat0) * abs(u_xlat0);
    u_xlat0 = -abs(u_xlat0) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat0.xy = u_xlat0.yw + u_xlat0.xz;
    u_xlat2.xyz = u_xlat0.yyy * _Wind.xyz;
    u_xlat2.xyz = u_xlat2.xyz * in_TEXCOORD1.yyy;
    u_xlat3.y = u_xlat0.y * in_TEXCOORD1.y;
    u_xlat4 = in_COLOR0.y * 0.100000001;
    u_xlat3.xz = vec2(u_xlat4) * in_NORMAL0.xz;
    u_xlat0.z = 0.300000012;
    u_xlat0.xyz = u_xlat0.xzx * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Wind.www + u_xlat1.xyz;
    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
    u_xlat12 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat12 = u_xlat12 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat12)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_TEXCOORD0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 297
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %34 %48 %128 %150 %280 %285 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %34 Location 34 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 Location 48 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate vs_TEXCOORD0 Location 280 
                                                      OpMemberDecorate %283 0 BuiltIn 283 
                                                      OpMemberDecorate %283 1 BuiltIn 283 
                                                      OpMemberDecorate %283 2 BuiltIn 283 
                                                      OpDecorate %283 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeStruct %7 %12 %13 %7 %7 %6 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          i32 %19 = OpConstant 3 
                                              %20 = OpTypeVector %6 3 
                                              %21 = OpTypePointer Uniform %7 
                                          f32 %25 = OpConstant 3.674022E-40 
                                        f32_3 %26 = OpConstantComposite %25 %25 %25 
                                          u32 %28 = OpConstant 0 
                                              %29 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Input %7 
                                 Input f32_4* %34 = OpVariable Input 
                                              %35 = OpTypePointer Input %6 
                                          u32 %39 = OpConstant 1 
                                 Private f32* %41 = OpVariable Private 
                               Private f32_4* %47 = OpVariable Private 
                                 Input f32_4* %48 = OpVariable Input 
                                          i32 %65 = OpConstant 0 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          f32 %72 = OpConstant 3.674022E-40 
                                          f32 %73 = OpConstant 3.674022E-40 
                                          f32 %74 = OpConstant 3.674022E-40 
                                        f32_4 %75 = OpConstantComposite %71 %72 %73 %74 
                                          f32 %80 = OpConstant 3.674022E-40 
                                        f32_4 %81 = OpConstantComposite %80 %80 %80 %80 
                                          f32 %83 = OpConstant 3.674022E-40 
                                        f32_4 %84 = OpConstantComposite %83 %83 %83 %83 
                                          f32 %90 = OpConstant 3.674022E-40 
                                        f32_4 %91 = OpConstantComposite %90 %90 %90 %90 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %103 = OpConstant 3.674022E-40 
                                       f32_4 %104 = OpConstantComposite %103 %103 %103 %103 
                                             %109 = OpTypeVector %6 2 
                                         i32 %119 = OpConstant 6 
                                Input f32_4* %128 = OpVariable Input 
                                             %134 = OpTypePointer Private %20 
                              Private f32_3* %135 = OpVariable Private 
                                Private f32* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.674022E-40 
                                             %149 = OpTypePointer Input %20 
                                Input f32_3* %150 = OpVariable Input 
                                         f32 %156 = OpConstant 3.674022E-40 
                                         u32 %157 = OpConstant 2 
                                Private f32* %190 = OpVariable Private 
                                         i32 %191 = OpConstant 4 
                                         u32 %199 = OpConstant 3 
                                             %200 = OpTypePointer Uniform %6 
                                         i32 %224 = OpConstant 5 
                                         i32 %248 = OpConstant 2 
                                             %279 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %282 = OpTypeArray %6 %39 
                                             %283 = OpTypeStruct %7 %6 %282 
                                             %284 = OpTypePointer Output %283 
        Output struct {f32_4; f32; f32[1];}* %285 = OpVariable Output 
                                             %291 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Uniform f32_4* %22 = OpAccessChain %16 %18 %19 
                                        f32_4 %23 = OpLoad %22 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %27 = OpDot %24 %26 
                                 Private f32* %30 = OpAccessChain %9 %28 
                                                      OpStore %30 %27 
                                 Private f32* %31 = OpAccessChain %9 %28 
                                          f32 %32 = OpLoad %31 
                                   Input f32* %36 = OpAccessChain %34 %28 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFAdd %32 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                 Private f32* %42 = OpAccessChain %9 %39 
                                          f32 %43 = OpLoad %42 
                                   Input f32* %44 = OpAccessChain %34 %39 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpFAdd %43 %45 
                                                      OpStore %41 %46 
                                        f32_4 %49 = OpLoad %48 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                               Uniform f32_4* %51 = OpAccessChain %16 %19 
                                        f32_4 %52 = OpLoad %51 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                        f32_3 %54 = OpFMul %50 %53 
                                        f32_4 %55 = OpLoad %47 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 6 3 
                                                      OpStore %47 %56 
                                        f32_4 %57 = OpLoad %47 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                          f32 %59 = OpLoad %41 
                                        f32_3 %60 = OpCompositeConstruct %59 %59 %59 
                                          f32 %61 = OpDot %58 %60 
                                 Private f32* %62 = OpAccessChain %9 %28 
                                                      OpStore %62 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 1 1 
                               Uniform f32_4* %66 = OpAccessChain %16 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                                        f32_4 %69 = OpFAdd %64 %68 
                                                      OpStore %9 %69 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %76 = OpFMul %70 %75 
                                                      OpStore %9 %76 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpExtInst %1 10 %77 
                                                      OpStore %9 %78 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %9 %85 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpExtInst %1 10 %86 
                                                      OpStore %9 %87 
                                        f32_4 %88 = OpLoad %9 
                                        f32_4 %89 = OpFMul %88 %81 
                                        f32_4 %92 = OpFAdd %89 %91 
                                                      OpStore %9 %92 
                                        f32_4 %94 = OpLoad %9 
                                        f32_4 %95 = OpExtInst %1 4 %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_4 %97 = OpExtInst %1 4 %96 
                                        f32_4 %98 = OpFMul %95 %97 
                                                      OpStore %93 %98 
                                        f32_4 %99 = OpLoad %9 
                                       f32_4 %100 = OpExtInst %1 4 %99 
                                       f32_4 %101 = OpFNegate %100 
                                       f32_4 %102 = OpFMul %101 %81 
                                       f32_4 %105 = OpFAdd %102 %104 
                                                      OpStore %9 %105 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpLoad %93 
                                       f32_4 %108 = OpFMul %106 %107 
                                                      OpStore %9 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 1 3 
                                       f32_4 %112 = OpLoad %9 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 2 
                                       f32_2 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 3 
                                                      OpStore %9 %116 
                                       f32_4 %117 = OpLoad %9 
                                       f32_3 %118 = OpVectorShuffle %117 %117 1 1 1 
                              Uniform f32_4* %120 = OpAccessChain %16 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFMul %118 %122 
                                       f32_4 %124 = OpLoad %93 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %93 %125 
                                       f32_4 %126 = OpLoad %93 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                                       f32_3 %131 = OpFMul %127 %130 
                                       f32_4 %132 = OpLoad %93 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %93 %133 
                                Private f32* %136 = OpAccessChain %9 %39 
                                         f32 %137 = OpLoad %136 
                                  Input f32* %138 = OpAccessChain %128 %39 
                                         f32 %139 = OpLoad %138 
                                         f32 %140 = OpFMul %137 %139 
                                Private f32* %141 = OpAccessChain %135 %39 
                                                      OpStore %141 %140 
                                  Input f32* %143 = OpAccessChain %34 %39 
                                         f32 %144 = OpLoad %143 
                                         f32 %146 = OpFMul %144 %145 
                                                      OpStore %142 %146 
                                         f32 %147 = OpLoad %142 
                                       f32_2 %148 = OpCompositeConstruct %147 %147 
                                       f32_3 %151 = OpLoad %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 0 2 
                                       f32_2 %153 = OpFMul %148 %152 
                                       f32_3 %154 = OpLoad %135 
                                       f32_3 %155 = OpVectorShuffle %154 %153 3 1 4 
                                                      OpStore %135 %155 
                                Private f32* %158 = OpAccessChain %9 %157 
                                                      OpStore %158 %156 
                                       f32_4 %159 = OpLoad %9 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 2 0 
                                       f32_3 %161 = OpLoad %135 
                                       f32_3 %162 = OpFMul %160 %161 
                                       f32_4 %163 = OpLoad %93 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFAdd %162 %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %9 %167 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_4* %170 = OpAccessChain %16 %119 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 3 3 3 
                                       f32_3 %173 = OpFMul %169 %172 
                                       f32_4 %174 = OpLoad %47 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %176 = OpFAdd %173 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                                      OpStore %9 %178 
                                       f32_4 %179 = OpLoad %128 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 0 0 
                              Uniform f32_4* %181 = OpAccessChain %16 %119 
                                       f32_4 %182 = OpLoad %181 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %184 = OpFMul %180 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                       f32_3 %187 = OpFAdd %184 %186 
                                       f32_4 %188 = OpLoad %9 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
                                                      OpStore %9 %189 
                              Uniform f32_4* %192 = OpAccessChain %16 %191 
                                       f32_4 %193 = OpLoad %192 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                                       f32_4 %195 = OpLoad %9 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                         f32 %197 = OpDot %194 %196 
                                                      OpStore %190 %197 
                                         f32 %198 = OpLoad %190 
                                Uniform f32* %201 = OpAccessChain %16 %191 %199 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFAdd %198 %202 
                                                      OpStore %190 %203 
                                         f32 %204 = OpLoad %190 
                                       f32_3 %205 = OpCompositeConstruct %204 %204 %204 
                                       f32_3 %206 = OpFNegate %205 
                              Uniform f32_4* %207 = OpAccessChain %16 %191 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                       f32_3 %210 = OpFMul %206 %209 
                                       f32_4 %211 = OpLoad %9 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                       f32_3 %213 = OpFAdd %210 %212 
                                       f32_4 %214 = OpLoad %47 
                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
                                                      OpStore %47 %215 
                                       f32_4 %216 = OpLoad %9 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                                       f32_4 %218 = OpLoad %47 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                                       f32_3 %220 = OpFNegate %219 
                                       f32_3 %221 = OpFAdd %217 %220 
                                       f32_4 %222 = OpLoad %9 
                                       f32_4 %223 = OpVectorShuffle %222 %221 4 5 6 3 
                                                      OpStore %9 %223 
                                Uniform f32* %225 = OpAccessChain %16 %224 
                                         f32 %226 = OpLoad %225 
                                       f32_3 %227 = OpCompositeConstruct %226 %226 %226 
                                       f32_4 %228 = OpLoad %9 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                       f32_3 %230 = OpFMul %227 %229 
                                       f32_4 %231 = OpLoad %47 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpFAdd %230 %232 
                                       f32_4 %234 = OpLoad %9 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
                                                      OpStore %9 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpVectorShuffle %236 %236 1 1 1 1 
                              Uniform f32_4* %238 = OpAccessChain %16 %18 %18 
                                       f32_4 %239 = OpLoad %238 
                                       f32_4 %240 = OpFMul %237 %239 
                                                      OpStore %47 %240 
                              Uniform f32_4* %241 = OpAccessChain %16 %18 %65 
                                       f32_4 %242 = OpLoad %241 
                                       f32_4 %243 = OpLoad %9 
                                       f32_4 %244 = OpVectorShuffle %243 %243 0 0 0 0 
                                       f32_4 %245 = OpFMul %242 %244 
                                       f32_4 %246 = OpLoad %47 
                                       f32_4 %247 = OpFAdd %245 %246 
                                                      OpStore %47 %247 
                              Uniform f32_4* %249 = OpAccessChain %16 %18 %248 
                                       f32_4 %250 = OpLoad %249 
                                       f32_4 %251 = OpLoad %9 
                                       f32_4 %252 = OpVectorShuffle %251 %251 2 2 2 2 
                                       f32_4 %253 = OpFMul %250 %252 
                                       f32_4 %254 = OpLoad %47 
                                       f32_4 %255 = OpFAdd %253 %254 
                                                      OpStore %9 %255 
                                       f32_4 %256 = OpLoad %9 
                              Uniform f32_4* %257 = OpAccessChain %16 %18 %19 
                                       f32_4 %258 = OpLoad %257 
                                       f32_4 %259 = OpFAdd %256 %258 
                                                      OpStore %9 %259 
                                       f32_4 %260 = OpLoad %9 
                                       f32_4 %261 = OpVectorShuffle %260 %260 1 1 1 1 
                              Uniform f32_4* %262 = OpAccessChain %16 %248 %18 
                                       f32_4 %263 = OpLoad %262 
                                       f32_4 %264 = OpFMul %261 %263 
                                                      OpStore %47 %264 
                              Uniform f32_4* %265 = OpAccessChain %16 %248 %65 
                                       f32_4 %266 = OpLoad %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpVectorShuffle %267 %267 0 0 0 0 
                                       f32_4 %269 = OpFMul %266 %268 
                                       f32_4 %270 = OpLoad %47 
                                       f32_4 %271 = OpFAdd %269 %270 
                                                      OpStore %47 %271 
                              Uniform f32_4* %272 = OpAccessChain %16 %248 %248 
                                       f32_4 %273 = OpLoad %272 
                                       f32_4 %274 = OpLoad %9 
                                       f32_4 %275 = OpVectorShuffle %274 %274 2 2 2 2 
                                       f32_4 %276 = OpFMul %273 %275 
                                       f32_4 %277 = OpLoad %47 
                                       f32_4 %278 = OpFAdd %276 %277 
                                                      OpStore %47 %278 
                                       f32_4 %281 = OpLoad %9 
                                                      OpStore vs_TEXCOORD0 %281 
                                       f32_4 %286 = OpLoad %47 
                              Uniform f32_4* %287 = OpAccessChain %16 %248 %19 
                                       f32_4 %288 = OpLoad %287 
                                       f32_4 %289 = OpFAdd %286 %288 
                               Output f32_4* %290 = OpAccessChain %285 %65 
                                                      OpStore %290 %289 
                                 Output f32* %292 = OpAccessChain %285 %65 %39 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFNegate %293 
                                 Output f32* %295 = OpAccessChain %285 %65 %39 
                                                      OpStore %295 %294 
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
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate %9 Location 9 
                              OpDecorate vs_TEXCOORD0 Location 11 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 4 
                       %8 = OpTypePointer Output %7 
         Output f32_4* %9 = OpVariable Output 
                      %10 = OpTypePointer Input %7 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                f32_4 %12 = OpLoad vs_TEXCOORD0 
                              OpStore %9 %12 
                              OpReturn
                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 297
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %34 %48 %128 %150 %280 %285 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %34 Location 34 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 Location 48 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate vs_TEXCOORD0 Location 280 
                                                      OpMemberDecorate %283 0 BuiltIn 283 
                                                      OpMemberDecorate %283 1 BuiltIn 283 
                                                      OpMemberDecorate %283 2 BuiltIn 283 
                                                      OpDecorate %283 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeStruct %7 %12 %13 %7 %7 %6 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          i32 %19 = OpConstant 3 
                                              %20 = OpTypeVector %6 3 
                                              %21 = OpTypePointer Uniform %7 
                                          f32 %25 = OpConstant 3.674022E-40 
                                        f32_3 %26 = OpConstantComposite %25 %25 %25 
                                          u32 %28 = OpConstant 0 
                                              %29 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Input %7 
                                 Input f32_4* %34 = OpVariable Input 
                                              %35 = OpTypePointer Input %6 
                                          u32 %39 = OpConstant 1 
                                 Private f32* %41 = OpVariable Private 
                               Private f32_4* %47 = OpVariable Private 
                                 Input f32_4* %48 = OpVariable Input 
                                          i32 %65 = OpConstant 0 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          f32 %72 = OpConstant 3.674022E-40 
                                          f32 %73 = OpConstant 3.674022E-40 
                                          f32 %74 = OpConstant 3.674022E-40 
                                        f32_4 %75 = OpConstantComposite %71 %72 %73 %74 
                                          f32 %80 = OpConstant 3.674022E-40 
                                        f32_4 %81 = OpConstantComposite %80 %80 %80 %80 
                                          f32 %83 = OpConstant 3.674022E-40 
                                        f32_4 %84 = OpConstantComposite %83 %83 %83 %83 
                                          f32 %90 = OpConstant 3.674022E-40 
                                        f32_4 %91 = OpConstantComposite %90 %90 %90 %90 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %103 = OpConstant 3.674022E-40 
                                       f32_4 %104 = OpConstantComposite %103 %103 %103 %103 
                                             %109 = OpTypeVector %6 2 
                                         i32 %119 = OpConstant 6 
                                Input f32_4* %128 = OpVariable Input 
                                             %134 = OpTypePointer Private %20 
                              Private f32_3* %135 = OpVariable Private 
                                Private f32* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.674022E-40 
                                             %149 = OpTypePointer Input %20 
                                Input f32_3* %150 = OpVariable Input 
                                         f32 %156 = OpConstant 3.674022E-40 
                                         u32 %157 = OpConstant 2 
                                Private f32* %190 = OpVariable Private 
                                         i32 %191 = OpConstant 4 
                                         u32 %199 = OpConstant 3 
                                             %200 = OpTypePointer Uniform %6 
                                         i32 %224 = OpConstant 5 
                                         i32 %248 = OpConstant 2 
                                             %279 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %282 = OpTypeArray %6 %39 
                                             %283 = OpTypeStruct %7 %6 %282 
                                             %284 = OpTypePointer Output %283 
        Output struct {f32_4; f32; f32[1];}* %285 = OpVariable Output 
                                             %291 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Uniform f32_4* %22 = OpAccessChain %16 %18 %19 
                                        f32_4 %23 = OpLoad %22 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %27 = OpDot %24 %26 
                                 Private f32* %30 = OpAccessChain %9 %28 
                                                      OpStore %30 %27 
                                 Private f32* %31 = OpAccessChain %9 %28 
                                          f32 %32 = OpLoad %31 
                                   Input f32* %36 = OpAccessChain %34 %28 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFAdd %32 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                 Private f32* %42 = OpAccessChain %9 %39 
                                          f32 %43 = OpLoad %42 
                                   Input f32* %44 = OpAccessChain %34 %39 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpFAdd %43 %45 
                                                      OpStore %41 %46 
                                        f32_4 %49 = OpLoad %48 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                               Uniform f32_4* %51 = OpAccessChain %16 %19 
                                        f32_4 %52 = OpLoad %51 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                        f32_3 %54 = OpFMul %50 %53 
                                        f32_4 %55 = OpLoad %47 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 6 3 
                                                      OpStore %47 %56 
                                        f32_4 %57 = OpLoad %47 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                          f32 %59 = OpLoad %41 
                                        f32_3 %60 = OpCompositeConstruct %59 %59 %59 
                                          f32 %61 = OpDot %58 %60 
                                 Private f32* %62 = OpAccessChain %9 %28 
                                                      OpStore %62 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 1 1 
                               Uniform f32_4* %66 = OpAccessChain %16 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                                        f32_4 %69 = OpFAdd %64 %68 
                                                      OpStore %9 %69 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %76 = OpFMul %70 %75 
                                                      OpStore %9 %76 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpExtInst %1 10 %77 
                                                      OpStore %9 %78 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %9 %85 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpExtInst %1 10 %86 
                                                      OpStore %9 %87 
                                        f32_4 %88 = OpLoad %9 
                                        f32_4 %89 = OpFMul %88 %81 
                                        f32_4 %92 = OpFAdd %89 %91 
                                                      OpStore %9 %92 
                                        f32_4 %94 = OpLoad %9 
                                        f32_4 %95 = OpExtInst %1 4 %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_4 %97 = OpExtInst %1 4 %96 
                                        f32_4 %98 = OpFMul %95 %97 
                                                      OpStore %93 %98 
                                        f32_4 %99 = OpLoad %9 
                                       f32_4 %100 = OpExtInst %1 4 %99 
                                       f32_4 %101 = OpFNegate %100 
                                       f32_4 %102 = OpFMul %101 %81 
                                       f32_4 %105 = OpFAdd %102 %104 
                                                      OpStore %9 %105 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpLoad %93 
                                       f32_4 %108 = OpFMul %106 %107 
                                                      OpStore %9 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 1 3 
                                       f32_4 %112 = OpLoad %9 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 2 
                                       f32_2 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 3 
                                                      OpStore %9 %116 
                                       f32_4 %117 = OpLoad %9 
                                       f32_3 %118 = OpVectorShuffle %117 %117 1 1 1 
                              Uniform f32_4* %120 = OpAccessChain %16 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFMul %118 %122 
                                       f32_4 %124 = OpLoad %93 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %93 %125 
                                       f32_4 %126 = OpLoad %93 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                                       f32_3 %131 = OpFMul %127 %130 
                                       f32_4 %132 = OpLoad %93 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %93 %133 
                                Private f32* %136 = OpAccessChain %9 %39 
                                         f32 %137 = OpLoad %136 
                                  Input f32* %138 = OpAccessChain %128 %39 
                                         f32 %139 = OpLoad %138 
                                         f32 %140 = OpFMul %137 %139 
                                Private f32* %141 = OpAccessChain %135 %39 
                                                      OpStore %141 %140 
                                  Input f32* %143 = OpAccessChain %34 %39 
                                         f32 %144 = OpLoad %143 
                                         f32 %146 = OpFMul %144 %145 
                                                      OpStore %142 %146 
                                         f32 %147 = OpLoad %142 
                                       f32_2 %148 = OpCompositeConstruct %147 %147 
                                       f32_3 %151 = OpLoad %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 0 2 
                                       f32_2 %153 = OpFMul %148 %152 
                                       f32_3 %154 = OpLoad %135 
                                       f32_3 %155 = OpVectorShuffle %154 %153 3 1 4 
                                                      OpStore %135 %155 
                                Private f32* %158 = OpAccessChain %9 %157 
                                                      OpStore %158 %156 
                                       f32_4 %159 = OpLoad %9 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 2 0 
                                       f32_3 %161 = OpLoad %135 
                                       f32_3 %162 = OpFMul %160 %161 
                                       f32_4 %163 = OpLoad %93 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFAdd %162 %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %9 %167 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_4* %170 = OpAccessChain %16 %119 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 3 3 3 
                                       f32_3 %173 = OpFMul %169 %172 
                                       f32_4 %174 = OpLoad %47 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %176 = OpFAdd %173 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                                      OpStore %9 %178 
                                       f32_4 %179 = OpLoad %128 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 0 0 
                              Uniform f32_4* %181 = OpAccessChain %16 %119 
                                       f32_4 %182 = OpLoad %181 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %184 = OpFMul %180 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                       f32_3 %187 = OpFAdd %184 %186 
                                       f32_4 %188 = OpLoad %9 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
                                                      OpStore %9 %189 
                              Uniform f32_4* %192 = OpAccessChain %16 %191 
                                       f32_4 %193 = OpLoad %192 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                                       f32_4 %195 = OpLoad %9 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                         f32 %197 = OpDot %194 %196 
                                                      OpStore %190 %197 
                                         f32 %198 = OpLoad %190 
                                Uniform f32* %201 = OpAccessChain %16 %191 %199 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFAdd %198 %202 
                                                      OpStore %190 %203 
                                         f32 %204 = OpLoad %190 
                                       f32_3 %205 = OpCompositeConstruct %204 %204 %204 
                                       f32_3 %206 = OpFNegate %205 
                              Uniform f32_4* %207 = OpAccessChain %16 %191 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                       f32_3 %210 = OpFMul %206 %209 
                                       f32_4 %211 = OpLoad %9 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                       f32_3 %213 = OpFAdd %210 %212 
                                       f32_4 %214 = OpLoad %47 
                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
                                                      OpStore %47 %215 
                                       f32_4 %216 = OpLoad %9 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                                       f32_4 %218 = OpLoad %47 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                                       f32_3 %220 = OpFNegate %219 
                                       f32_3 %221 = OpFAdd %217 %220 
                                       f32_4 %222 = OpLoad %9 
                                       f32_4 %223 = OpVectorShuffle %222 %221 4 5 6 3 
                                                      OpStore %9 %223 
                                Uniform f32* %225 = OpAccessChain %16 %224 
                                         f32 %226 = OpLoad %225 
                                       f32_3 %227 = OpCompositeConstruct %226 %226 %226 
                                       f32_4 %228 = OpLoad %9 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                       f32_3 %230 = OpFMul %227 %229 
                                       f32_4 %231 = OpLoad %47 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpFAdd %230 %232 
                                       f32_4 %234 = OpLoad %9 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
                                                      OpStore %9 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpVectorShuffle %236 %236 1 1 1 1 
                              Uniform f32_4* %238 = OpAccessChain %16 %18 %18 
                                       f32_4 %239 = OpLoad %238 
                                       f32_4 %240 = OpFMul %237 %239 
                                                      OpStore %47 %240 
                              Uniform f32_4* %241 = OpAccessChain %16 %18 %65 
                                       f32_4 %242 = OpLoad %241 
                                       f32_4 %243 = OpLoad %9 
                                       f32_4 %244 = OpVectorShuffle %243 %243 0 0 0 0 
                                       f32_4 %245 = OpFMul %242 %244 
                                       f32_4 %246 = OpLoad %47 
                                       f32_4 %247 = OpFAdd %245 %246 
                                                      OpStore %47 %247 
                              Uniform f32_4* %249 = OpAccessChain %16 %18 %248 
                                       f32_4 %250 = OpLoad %249 
                                       f32_4 %251 = OpLoad %9 
                                       f32_4 %252 = OpVectorShuffle %251 %251 2 2 2 2 
                                       f32_4 %253 = OpFMul %250 %252 
                                       f32_4 %254 = OpLoad %47 
                                       f32_4 %255 = OpFAdd %253 %254 
                                                      OpStore %9 %255 
                                       f32_4 %256 = OpLoad %9 
                              Uniform f32_4* %257 = OpAccessChain %16 %18 %19 
                                       f32_4 %258 = OpLoad %257 
                                       f32_4 %259 = OpFAdd %256 %258 
                                                      OpStore %9 %259 
                                       f32_4 %260 = OpLoad %9 
                                       f32_4 %261 = OpVectorShuffle %260 %260 1 1 1 1 
                              Uniform f32_4* %262 = OpAccessChain %16 %248 %18 
                                       f32_4 %263 = OpLoad %262 
                                       f32_4 %264 = OpFMul %261 %263 
                                                      OpStore %47 %264 
                              Uniform f32_4* %265 = OpAccessChain %16 %248 %65 
                                       f32_4 %266 = OpLoad %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpVectorShuffle %267 %267 0 0 0 0 
                                       f32_4 %269 = OpFMul %266 %268 
                                       f32_4 %270 = OpLoad %47 
                                       f32_4 %271 = OpFAdd %269 %270 
                                                      OpStore %47 %271 
                              Uniform f32_4* %272 = OpAccessChain %16 %248 %248 
                                       f32_4 %273 = OpLoad %272 
                                       f32_4 %274 = OpLoad %9 
                                       f32_4 %275 = OpVectorShuffle %274 %274 2 2 2 2 
                                       f32_4 %276 = OpFMul %273 %275 
                                       f32_4 %277 = OpLoad %47 
                                       f32_4 %278 = OpFAdd %276 %277 
                                                      OpStore %47 %278 
                                       f32_4 %281 = OpLoad %9 
                                                      OpStore vs_TEXCOORD0 %281 
                                       f32_4 %286 = OpLoad %47 
                              Uniform f32_4* %287 = OpAccessChain %16 %248 %19 
                                       f32_4 %288 = OpLoad %287 
                                       f32_4 %289 = OpFAdd %286 %288 
                               Output f32_4* %290 = OpAccessChain %285 %65 
                                                      OpStore %290 %289 
                                 Output f32* %292 = OpAccessChain %285 %65 %39 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFNegate %293 
                                 Output f32* %295 = OpAccessChain %285 %65 %39 
                                                      OpStore %295 %294 
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
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate %9 Location 9 
                              OpDecorate vs_TEXCOORD0 Location 11 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 4 
                       %8 = OpTypePointer Output %7 
         Output f32_4* %9 = OpVariable Output 
                      %10 = OpTypePointer Input %7 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                f32_4 %12 = OpLoad vs_TEXCOORD0 
                              OpStore %9 %12 
                              OpReturn
                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 297
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %34 %48 %128 %150 %280 %285 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %34 Location 34 
                                                      OpDecorate %37 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %48 Location 48 
                                                      OpDecorate %128 Location 128 
                                                      OpDecorate %144 RelaxedPrecision 
                                                      OpDecorate %146 RelaxedPrecision 
                                                      OpDecorate %150 Location 150 
                                                      OpDecorate vs_TEXCOORD0 Location 280 
                                                      OpMemberDecorate %283 0 BuiltIn 283 
                                                      OpMemberDecorate %283 1 BuiltIn 283 
                                                      OpMemberDecorate %283 2 BuiltIn 283 
                                                      OpDecorate %283 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeStruct %7 %12 %13 %7 %7 %6 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          i32 %19 = OpConstant 3 
                                              %20 = OpTypeVector %6 3 
                                              %21 = OpTypePointer Uniform %7 
                                          f32 %25 = OpConstant 3.674022E-40 
                                        f32_3 %26 = OpConstantComposite %25 %25 %25 
                                          u32 %28 = OpConstant 0 
                                              %29 = OpTypePointer Private %6 
                                              %33 = OpTypePointer Input %7 
                                 Input f32_4* %34 = OpVariable Input 
                                              %35 = OpTypePointer Input %6 
                                          u32 %39 = OpConstant 1 
                                 Private f32* %41 = OpVariable Private 
                               Private f32_4* %47 = OpVariable Private 
                                 Input f32_4* %48 = OpVariable Input 
                                          i32 %65 = OpConstant 0 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          f32 %72 = OpConstant 3.674022E-40 
                                          f32 %73 = OpConstant 3.674022E-40 
                                          f32 %74 = OpConstant 3.674022E-40 
                                        f32_4 %75 = OpConstantComposite %71 %72 %73 %74 
                                          f32 %80 = OpConstant 3.674022E-40 
                                        f32_4 %81 = OpConstantComposite %80 %80 %80 %80 
                                          f32 %83 = OpConstant 3.674022E-40 
                                        f32_4 %84 = OpConstantComposite %83 %83 %83 %83 
                                          f32 %90 = OpConstant 3.674022E-40 
                                        f32_4 %91 = OpConstantComposite %90 %90 %90 %90 
                               Private f32_4* %93 = OpVariable Private 
                                         f32 %103 = OpConstant 3.674022E-40 
                                       f32_4 %104 = OpConstantComposite %103 %103 %103 %103 
                                             %109 = OpTypeVector %6 2 
                                         i32 %119 = OpConstant 6 
                                Input f32_4* %128 = OpVariable Input 
                                             %134 = OpTypePointer Private %20 
                              Private f32_3* %135 = OpVariable Private 
                                Private f32* %142 = OpVariable Private 
                                         f32 %145 = OpConstant 3.674022E-40 
                                             %149 = OpTypePointer Input %20 
                                Input f32_3* %150 = OpVariable Input 
                                         f32 %156 = OpConstant 3.674022E-40 
                                         u32 %157 = OpConstant 2 
                                Private f32* %190 = OpVariable Private 
                                         i32 %191 = OpConstant 4 
                                         u32 %199 = OpConstant 3 
                                             %200 = OpTypePointer Uniform %6 
                                         i32 %224 = OpConstant 5 
                                         i32 %248 = OpConstant 2 
                                             %279 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %282 = OpTypeArray %6 %39 
                                             %283 = OpTypeStruct %7 %6 %282 
                                             %284 = OpTypePointer Output %283 
        Output struct {f32_4; f32; f32[1];}* %285 = OpVariable Output 
                                             %291 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Uniform f32_4* %22 = OpAccessChain %16 %18 %19 
                                        f32_4 %23 = OpLoad %22 
                                        f32_3 %24 = OpVectorShuffle %23 %23 0 1 2 
                                          f32 %27 = OpDot %24 %26 
                                 Private f32* %30 = OpAccessChain %9 %28 
                                                      OpStore %30 %27 
                                 Private f32* %31 = OpAccessChain %9 %28 
                                          f32 %32 = OpLoad %31 
                                   Input f32* %36 = OpAccessChain %34 %28 
                                          f32 %37 = OpLoad %36 
                                          f32 %38 = OpFAdd %32 %37 
                                 Private f32* %40 = OpAccessChain %9 %39 
                                                      OpStore %40 %38 
                                 Private f32* %42 = OpAccessChain %9 %39 
                                          f32 %43 = OpLoad %42 
                                   Input f32* %44 = OpAccessChain %34 %39 
                                          f32 %45 = OpLoad %44 
                                          f32 %46 = OpFAdd %43 %45 
                                                      OpStore %41 %46 
                                        f32_4 %49 = OpLoad %48 
                                        f32_3 %50 = OpVectorShuffle %49 %49 0 1 2 
                               Uniform f32_4* %51 = OpAccessChain %16 %19 
                                        f32_4 %52 = OpLoad %51 
                                        f32_3 %53 = OpVectorShuffle %52 %52 0 1 2 
                                        f32_3 %54 = OpFMul %50 %53 
                                        f32_4 %55 = OpLoad %47 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 6 3 
                                                      OpStore %47 %56 
                                        f32_4 %57 = OpLoad %47 
                                        f32_3 %58 = OpVectorShuffle %57 %57 0 1 2 
                                          f32 %59 = OpLoad %41 
                                        f32_3 %60 = OpCompositeConstruct %59 %59 %59 
                                          f32 %61 = OpDot %58 %60 
                                 Private f32* %62 = OpAccessChain %9 %28 
                                                      OpStore %62 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpVectorShuffle %63 %63 0 0 1 1 
                               Uniform f32_4* %66 = OpAccessChain %16 %65 
                                        f32_4 %67 = OpLoad %66 
                                        f32_4 %68 = OpVectorShuffle %67 %67 1 1 1 1 
                                        f32_4 %69 = OpFAdd %64 %68 
                                                      OpStore %9 %69 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %76 = OpFMul %70 %75 
                                                      OpStore %9 %76 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpExtInst %1 10 %77 
                                                      OpStore %9 %78 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %82 = OpFMul %79 %81 
                                        f32_4 %85 = OpFAdd %82 %84 
                                                      OpStore %9 %85 
                                        f32_4 %86 = OpLoad %9 
                                        f32_4 %87 = OpExtInst %1 10 %86 
                                                      OpStore %9 %87 
                                        f32_4 %88 = OpLoad %9 
                                        f32_4 %89 = OpFMul %88 %81 
                                        f32_4 %92 = OpFAdd %89 %91 
                                                      OpStore %9 %92 
                                        f32_4 %94 = OpLoad %9 
                                        f32_4 %95 = OpExtInst %1 4 %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_4 %97 = OpExtInst %1 4 %96 
                                        f32_4 %98 = OpFMul %95 %97 
                                                      OpStore %93 %98 
                                        f32_4 %99 = OpLoad %9 
                                       f32_4 %100 = OpExtInst %1 4 %99 
                                       f32_4 %101 = OpFNegate %100 
                                       f32_4 %102 = OpFMul %101 %81 
                                       f32_4 %105 = OpFAdd %102 %104 
                                                      OpStore %9 %105 
                                       f32_4 %106 = OpLoad %9 
                                       f32_4 %107 = OpLoad %93 
                                       f32_4 %108 = OpFMul %106 %107 
                                                      OpStore %9 %108 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 1 3 
                                       f32_4 %112 = OpLoad %9 
                                       f32_2 %113 = OpVectorShuffle %112 %112 0 2 
                                       f32_2 %114 = OpFAdd %111 %113 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 2 3 
                                                      OpStore %9 %116 
                                       f32_4 %117 = OpLoad %9 
                                       f32_3 %118 = OpVectorShuffle %117 %117 1 1 1 
                              Uniform f32_4* %120 = OpAccessChain %16 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFMul %118 %122 
                                       f32_4 %124 = OpLoad %93 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %93 %125 
                                       f32_4 %126 = OpLoad %93 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 1 1 1 
                                       f32_3 %131 = OpFMul %127 %130 
                                       f32_4 %132 = OpLoad %93 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %93 %133 
                                Private f32* %136 = OpAccessChain %9 %39 
                                         f32 %137 = OpLoad %136 
                                  Input f32* %138 = OpAccessChain %128 %39 
                                         f32 %139 = OpLoad %138 
                                         f32 %140 = OpFMul %137 %139 
                                Private f32* %141 = OpAccessChain %135 %39 
                                                      OpStore %141 %140 
                                  Input f32* %143 = OpAccessChain %34 %39 
                                         f32 %144 = OpLoad %143 
                                         f32 %146 = OpFMul %144 %145 
                                                      OpStore %142 %146 
                                         f32 %147 = OpLoad %142 
                                       f32_2 %148 = OpCompositeConstruct %147 %147 
                                       f32_3 %151 = OpLoad %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 0 2 
                                       f32_2 %153 = OpFMul %148 %152 
                                       f32_3 %154 = OpLoad %135 
                                       f32_3 %155 = OpVectorShuffle %154 %153 3 1 4 
                                                      OpStore %135 %155 
                                Private f32* %158 = OpAccessChain %9 %157 
                                                      OpStore %158 %156 
                                       f32_4 %159 = OpLoad %9 
                                       f32_3 %160 = OpVectorShuffle %159 %159 0 2 0 
                                       f32_3 %161 = OpLoad %135 
                                       f32_3 %162 = OpFMul %160 %161 
                                       f32_4 %163 = OpLoad %93 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                                       f32_3 %165 = OpFAdd %162 %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %165 4 5 6 3 
                                                      OpStore %9 %167 
                                       f32_4 %168 = OpLoad %9 
                                       f32_3 %169 = OpVectorShuffle %168 %168 0 1 2 
                              Uniform f32_4* %170 = OpAccessChain %16 %119 
                                       f32_4 %171 = OpLoad %170 
                                       f32_3 %172 = OpVectorShuffle %171 %171 3 3 3 
                                       f32_3 %173 = OpFMul %169 %172 
                                       f32_4 %174 = OpLoad %47 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                       f32_3 %176 = OpFAdd %173 %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_4 %178 = OpVectorShuffle %177 %176 4 5 6 3 
                                                      OpStore %9 %178 
                                       f32_4 %179 = OpLoad %128 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 0 0 
                              Uniform f32_4* %181 = OpAccessChain %16 %119 
                                       f32_4 %182 = OpLoad %181 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 1 2 
                                       f32_3 %184 = OpFMul %180 %183 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                                       f32_3 %187 = OpFAdd %184 %186 
                                       f32_4 %188 = OpLoad %9 
                                       f32_4 %189 = OpVectorShuffle %188 %187 4 5 6 3 
                                                      OpStore %9 %189 
                              Uniform f32_4* %192 = OpAccessChain %16 %191 
                                       f32_4 %193 = OpLoad %192 
                                       f32_3 %194 = OpVectorShuffle %193 %193 0 1 2 
                                       f32_4 %195 = OpLoad %9 
                                       f32_3 %196 = OpVectorShuffle %195 %195 0 1 2 
                                         f32 %197 = OpDot %194 %196 
                                                      OpStore %190 %197 
                                         f32 %198 = OpLoad %190 
                                Uniform f32* %201 = OpAccessChain %16 %191 %199 
                                         f32 %202 = OpLoad %201 
                                         f32 %203 = OpFAdd %198 %202 
                                                      OpStore %190 %203 
                                         f32 %204 = OpLoad %190 
                                       f32_3 %205 = OpCompositeConstruct %204 %204 %204 
                                       f32_3 %206 = OpFNegate %205 
                              Uniform f32_4* %207 = OpAccessChain %16 %191 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                       f32_3 %210 = OpFMul %206 %209 
                                       f32_4 %211 = OpLoad %9 
                                       f32_3 %212 = OpVectorShuffle %211 %211 0 1 2 
                                       f32_3 %213 = OpFAdd %210 %212 
                                       f32_4 %214 = OpLoad %47 
                                       f32_4 %215 = OpVectorShuffle %214 %213 4 5 6 3 
                                                      OpStore %47 %215 
                                       f32_4 %216 = OpLoad %9 
                                       f32_3 %217 = OpVectorShuffle %216 %216 0 1 2 
                                       f32_4 %218 = OpLoad %47 
                                       f32_3 %219 = OpVectorShuffle %218 %218 0 1 2 
                                       f32_3 %220 = OpFNegate %219 
                                       f32_3 %221 = OpFAdd %217 %220 
                                       f32_4 %222 = OpLoad %9 
                                       f32_4 %223 = OpVectorShuffle %222 %221 4 5 6 3 
                                                      OpStore %9 %223 
                                Uniform f32* %225 = OpAccessChain %16 %224 
                                         f32 %226 = OpLoad %225 
                                       f32_3 %227 = OpCompositeConstruct %226 %226 %226 
                                       f32_4 %228 = OpLoad %9 
                                       f32_3 %229 = OpVectorShuffle %228 %228 0 1 2 
                                       f32_3 %230 = OpFMul %227 %229 
                                       f32_4 %231 = OpLoad %47 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                       f32_3 %233 = OpFAdd %230 %232 
                                       f32_4 %234 = OpLoad %9 
                                       f32_4 %235 = OpVectorShuffle %234 %233 4 5 6 3 
                                                      OpStore %9 %235 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpVectorShuffle %236 %236 1 1 1 1 
                              Uniform f32_4* %238 = OpAccessChain %16 %18 %18 
                                       f32_4 %239 = OpLoad %238 
                                       f32_4 %240 = OpFMul %237 %239 
                                                      OpStore %47 %240 
                              Uniform f32_4* %241 = OpAccessChain %16 %18 %65 
                                       f32_4 %242 = OpLoad %241 
                                       f32_4 %243 = OpLoad %9 
                                       f32_4 %244 = OpVectorShuffle %243 %243 0 0 0 0 
                                       f32_4 %245 = OpFMul %242 %244 
                                       f32_4 %246 = OpLoad %47 
                                       f32_4 %247 = OpFAdd %245 %246 
                                                      OpStore %47 %247 
                              Uniform f32_4* %249 = OpAccessChain %16 %18 %248 
                                       f32_4 %250 = OpLoad %249 
                                       f32_4 %251 = OpLoad %9 
                                       f32_4 %252 = OpVectorShuffle %251 %251 2 2 2 2 
                                       f32_4 %253 = OpFMul %250 %252 
                                       f32_4 %254 = OpLoad %47 
                                       f32_4 %255 = OpFAdd %253 %254 
                                                      OpStore %9 %255 
                                       f32_4 %256 = OpLoad %9 
                              Uniform f32_4* %257 = OpAccessChain %16 %18 %19 
                                       f32_4 %258 = OpLoad %257 
                                       f32_4 %259 = OpFAdd %256 %258 
                                                      OpStore %9 %259 
                                       f32_4 %260 = OpLoad %9 
                                       f32_4 %261 = OpVectorShuffle %260 %260 1 1 1 1 
                              Uniform f32_4* %262 = OpAccessChain %16 %248 %18 
                                       f32_4 %263 = OpLoad %262 
                                       f32_4 %264 = OpFMul %261 %263 
                                                      OpStore %47 %264 
                              Uniform f32_4* %265 = OpAccessChain %16 %248 %65 
                                       f32_4 %266 = OpLoad %265 
                                       f32_4 %267 = OpLoad %9 
                                       f32_4 %268 = OpVectorShuffle %267 %267 0 0 0 0 
                                       f32_4 %269 = OpFMul %266 %268 
                                       f32_4 %270 = OpLoad %47 
                                       f32_4 %271 = OpFAdd %269 %270 
                                                      OpStore %47 %271 
                              Uniform f32_4* %272 = OpAccessChain %16 %248 %248 
                                       f32_4 %273 = OpLoad %272 
                                       f32_4 %274 = OpLoad %9 
                                       f32_4 %275 = OpVectorShuffle %274 %274 2 2 2 2 
                                       f32_4 %276 = OpFMul %273 %275 
                                       f32_4 %277 = OpLoad %47 
                                       f32_4 %278 = OpFAdd %276 %277 
                                                      OpStore %47 %278 
                                       f32_4 %281 = OpLoad %9 
                                                      OpStore vs_TEXCOORD0 %281 
                                       f32_4 %286 = OpLoad %47 
                              Uniform f32_4* %287 = OpAccessChain %16 %248 %19 
                                       f32_4 %288 = OpLoad %287 
                                       f32_4 %289 = OpFAdd %286 %288 
                               Output f32_4* %290 = OpAccessChain %285 %65 
                                                      OpStore %290 %289 
                                 Output f32* %292 = OpAccessChain %285 %65 %39 
                                         f32 %293 = OpLoad %292 
                                         f32 %294 = OpFNegate %293 
                                 Output f32* %295 = OpAccessChain %285 %65 %39 
                                                      OpStore %295 %294 
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
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate %9 Location 9 
                              OpDecorate vs_TEXCOORD0 Location 11 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 4 
                       %8 = OpTypePointer Output %7 
         Output f32_4* %9 = OpVariable Output 
                      %10 = OpTypePointer Input %7 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                f32_4 %12 = OpLoad vs_TEXCOORD0 
                              OpStore %9 %12 
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
 Tags { "RenderType" = "TreeLeaf" }
 Pass {
  Tags { "RenderType" = "TreeLeaf" }
  GpuProgramID 211170
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
uniform 	vec4 _Wind;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[1].wwww + u_xlat0;
    u_xlat0 = u_xlat0 * in_NORMAL0.yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[0].wwww + u_xlat1;
    u_xlat0 = in_NORMAL0.xxxx * u_xlat1 + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[2].wwww + u_xlat1;
    u_xlat1 = in_NORMAL0.zzzz * u_xlat1 + u_xlat0;
    u_xlat12 = dot(u_xlat1, u_xlat1);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xy = u_xlat1.xz * vec2(u_xlat12) + (-in_NORMAL0.xz);
    u_xlat12 = -abs(in_TANGENT0.w) + 1.0;
    u_xlat1.xy = vec2(u_xlat12) * u_xlat1.xy + in_NORMAL0.xz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _TreeInstanceScale.xyz;
    u_xlat12 = in_COLOR0.y * 0.100000001;
    u_xlat1.xz = u_xlat1.xy * vec2(u_xlat12);
    u_xlat12 = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.y = u_xlat12 + in_COLOR0.x;
    u_xlat12 = u_xlat2.y + in_COLOR0.y;
    u_xlat2.x = dot(u_xlat0.xyz, vec3(u_xlat12));
    u_xlat2 = u_xlat2.xxyy + _Time.yyyy;
    u_xlat2 = u_xlat2 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = abs(u_xlat2) * abs(u_xlat2);
    u_xlat2 = -abs(u_xlat2) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2.xy = u_xlat2.yw + u_xlat2.xz;
    u_xlat3.xyz = u_xlat2.yyy * _Wind.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_TEXCOORD1.yyy;
    u_xlat1.y = u_xlat2.y * in_TEXCOORD1.y;
    u_xlat2.z = 0.300000012;
    u_xlat1.xyz = u_xlat2.xzx * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _Wind.www + u_xlat0.xyz;
    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
    u_xlat12 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat12 = u_xlat12 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat12)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
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
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
uniform 	vec4 _Wind;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[1].wwww + u_xlat0;
    u_xlat0 = u_xlat0 * in_NORMAL0.yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[0].wwww + u_xlat1;
    u_xlat0 = in_NORMAL0.xxxx * u_xlat1 + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[2].wwww + u_xlat1;
    u_xlat1 = in_NORMAL0.zzzz * u_xlat1 + u_xlat0;
    u_xlat12 = dot(u_xlat1, u_xlat1);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xy = u_xlat1.xz * vec2(u_xlat12) + (-in_NORMAL0.xz);
    u_xlat12 = -abs(in_TANGENT0.w) + 1.0;
    u_xlat1.xy = vec2(u_xlat12) * u_xlat1.xy + in_NORMAL0.xz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _TreeInstanceScale.xyz;
    u_xlat12 = in_COLOR0.y * 0.100000001;
    u_xlat1.xz = u_xlat1.xy * vec2(u_xlat12);
    u_xlat12 = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.y = u_xlat12 + in_COLOR0.x;
    u_xlat12 = u_xlat2.y + in_COLOR0.y;
    u_xlat2.x = dot(u_xlat0.xyz, vec3(u_xlat12));
    u_xlat2 = u_xlat2.xxyy + _Time.yyyy;
    u_xlat2 = u_xlat2 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = abs(u_xlat2) * abs(u_xlat2);
    u_xlat2 = -abs(u_xlat2) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2.xy = u_xlat2.yw + u_xlat2.xz;
    u_xlat3.xyz = u_xlat2.yyy * _Wind.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_TEXCOORD1.yyy;
    u_xlat1.y = u_xlat2.y * in_TEXCOORD1.y;
    u_xlat2.z = 0.300000012;
    u_xlat1.xyz = u_xlat2.xzx * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _Wind.www + u_xlat0.xyz;
    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
    u_xlat12 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat12 = u_xlat12 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat12)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
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
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
uniform 	vec4 _Wind;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
float u_xlat12;
void main()
{
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[1].yyyy;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[1].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[1].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[1].wwww + u_xlat0;
    u_xlat0 = u_xlat0 * in_NORMAL0.yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[0].yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[0].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[0].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[0].wwww + u_xlat1;
    u_xlat0 = in_NORMAL0.xxxx * u_xlat1 + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[1] * hlslcc_mtx4x4unity_MatrixInvV[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[0] * hlslcc_mtx4x4unity_MatrixInvV[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[2] * hlslcc_mtx4x4unity_MatrixInvV[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_WorldToObject[3] * hlslcc_mtx4x4unity_MatrixInvV[2].wwww + u_xlat1;
    u_xlat1 = in_NORMAL0.zzzz * u_xlat1 + u_xlat0;
    u_xlat12 = dot(u_xlat1, u_xlat1);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xy = u_xlat1.xz * vec2(u_xlat12) + (-in_NORMAL0.xz);
    u_xlat12 = -abs(in_TANGENT0.w) + 1.0;
    u_xlat1.xy = vec2(u_xlat12) * u_xlat1.xy + in_NORMAL0.xz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat12) + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _TreeInstanceScale.xyz;
    u_xlat12 = in_COLOR0.y * 0.100000001;
    u_xlat1.xz = u_xlat1.xy * vec2(u_xlat12);
    u_xlat12 = dot(hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, vec3(1.0, 1.0, 1.0));
    u_xlat2.y = u_xlat12 + in_COLOR0.x;
    u_xlat12 = u_xlat2.y + in_COLOR0.y;
    u_xlat2.x = dot(u_xlat0.xyz, vec3(u_xlat12));
    u_xlat2 = u_xlat2.xxyy + _Time.yyyy;
    u_xlat2 = u_xlat2 * vec4(1.97500002, 0.792999983, 0.375, 0.193000004);
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat2 = fract(u_xlat2);
    u_xlat2 = u_xlat2 * vec4(2.0, 2.0, 2.0, 2.0) + vec4(-1.0, -1.0, -1.0, -1.0);
    u_xlat3 = abs(u_xlat2) * abs(u_xlat2);
    u_xlat2 = -abs(u_xlat2) * vec4(2.0, 2.0, 2.0, 2.0) + vec4(3.0, 3.0, 3.0, 3.0);
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2.xy = u_xlat2.yw + u_xlat2.xz;
    u_xlat3.xyz = u_xlat2.yyy * _Wind.xyz;
    u_xlat3.xyz = u_xlat3.xyz * in_TEXCOORD1.yyy;
    u_xlat1.y = u_xlat2.y * in_TEXCOORD1.y;
    u_xlat2.z = 0.300000012;
    u_xlat1.xyz = u_xlat2.xzx * u_xlat1.xyz + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat1.xyz * _Wind.www + u_xlat0.xyz;
    u_xlat0.xyz = in_TEXCOORD1.xxx * _Wind.xyz + u_xlat0.xyz;
    u_xlat12 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat12 = u_xlat12 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat12)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
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
    SV_Target0 = vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 450
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %58 %155 %179 %194 %293 %428 %433 %440 %441 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpMemberDecorate %16 7 Offset 16 
                                                      OpMemberDecorate %16 8 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %58 Location 58 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %194 Location 194 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %293 Location 293 
                                                      OpDecorate vs_TEXCOORD1 Location 428 
                                                      OpMemberDecorate %431 0 BuiltIn 431 
                                                      OpMemberDecorate %431 1 BuiltIn 431 
                                                      OpMemberDecorate %431 2 BuiltIn 431 
                                                      OpDecorate %431 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 440 
                                                      OpDecorate %441 Location 441 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                              %16 = OpTypeStruct %7 %12 %13 %14 %15 %7 %7 %6 %7 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 2 
                                          i32 %21 = OpConstant 1 
                                              %22 = OpTypePointer Uniform %7 
                                          i32 %25 = OpConstant 3 
                                          i32 %30 = OpConstant 0 
                                              %56 = OpTypeVector %6 3 
                                              %57 = OpTypePointer Input %56 
                                 Input f32_3* %58 = OpVariable Input 
                               Private f32_4* %62 = OpVariable Private 
                                             %135 = OpTypePointer Private %6 
                                Private f32* %136 = OpVariable Private 
                                             %142 = OpTypeVector %6 2 
                                             %154 = OpTypePointer Input %7 
                                Input f32_4* %155 = OpVariable Input 
                                         u32 %156 = OpConstant 3 
                                             %157 = OpTypePointer Input %6 
                                         f32 %162 = OpConstant 3.674022E-40 
                                Input f32_4* %179 = OpVariable Input 
                                         i32 %187 = OpConstant 5 
                                Input f32_4* %194 = OpVariable Input 
                                         u32 %195 = OpConstant 1 
                                         f32 %198 = OpConstant 3.674022E-40 
                                       f32_3 %210 = OpConstantComposite %162 %162 %162 
                              Private f32_4* %212 = OpVariable Private 
                                         u32 %214 = OpConstant 0 
                                         f32 %237 = OpConstant 3.674022E-40 
                                         f32 %238 = OpConstant 3.674022E-40 
                                         f32 %239 = OpConstant 3.674022E-40 
                                         f32 %240 = OpConstant 3.674022E-40 
                                       f32_4 %241 = OpConstantComposite %237 %238 %239 %240 
                                         f32 %246 = OpConstant 3.674022E-40 
                                       f32_4 %247 = OpConstantComposite %246 %246 %246 %246 
                                         f32 %249 = OpConstant 3.674022E-40 
                                       f32_4 %250 = OpConstantComposite %249 %249 %249 %249 
                                         f32 %256 = OpConstant 3.674022E-40 
                                       f32_4 %257 = OpConstantComposite %256 %256 %256 %256 
                              Private f32_4* %259 = OpVariable Private 
                                         f32 %269 = OpConstant 3.674022E-40 
                                       f32_4 %270 = OpConstantComposite %269 %269 %269 %269 
                                         i32 %284 = OpConstant 8 
                                Input f32_4* %293 = OpVariable Input 
                                         f32 %305 = OpConstant 3.674022E-40 
                                         u32 %306 = OpConstant 2 
                                         i32 %340 = OpConstant 6 
                                             %348 = OpTypePointer Uniform %6 
                                         i32 %372 = OpConstant 7 
                                         i32 %409 = OpConstant 4 
                                             %427 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %430 = OpTypeArray %6 %195 
                                             %431 = OpTypeStruct %7 %6 %430 
                                             %432 = OpTypePointer Output %431 
        Output struct {f32_4; f32; f32[1];}* %433 = OpVariable Output 
                                             %439 = OpTypePointer Output %142 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %441 = OpVariable Input 
                                             %444 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Uniform f32_4* %23 = OpAccessChain %18 %20 %21 
                                        f32_4 %24 = OpLoad %23 
                               Uniform f32_4* %26 = OpAccessChain %18 %25 %21 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpVectorShuffle %27 %27 1 1 1 1 
                                        f32_4 %29 = OpFMul %24 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %31 = OpAccessChain %18 %20 %30 
                                        f32_4 %32 = OpLoad %31 
                               Uniform f32_4* %33 = OpAccessChain %18 %25 %21 
                                        f32_4 %34 = OpLoad %33 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                        f32_4 %36 = OpFMul %32 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpFAdd %36 %37 
                                                      OpStore %9 %38 
                               Uniform f32_4* %39 = OpAccessChain %18 %20 %20 
                                        f32_4 %40 = OpLoad %39 
                               Uniform f32_4* %41 = OpAccessChain %18 %25 %21 
                                        f32_4 %42 = OpLoad %41 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                        f32_4 %44 = OpFMul %40 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %9 %46 
                               Uniform f32_4* %47 = OpAccessChain %18 %20 %25 
                                        f32_4 %48 = OpLoad %47 
                               Uniform f32_4* %49 = OpAccessChain %18 %25 %21 
                                        f32_4 %50 = OpLoad %49 
                                        f32_4 %51 = OpVectorShuffle %50 %50 3 3 3 3 
                                        f32_4 %52 = OpFMul %48 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %9 %54 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %59 = OpLoad %58 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                                        f32_4 %61 = OpFMul %55 %60 
                                                      OpStore %9 %61 
                               Uniform f32_4* %63 = OpAccessChain %18 %20 %21 
                                        f32_4 %64 = OpLoad %63 
                               Uniform f32_4* %65 = OpAccessChain %18 %25 %30 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                                        f32_4 %68 = OpFMul %64 %67 
                                                      OpStore %62 %68 
                               Uniform f32_4* %69 = OpAccessChain %18 %20 %30 
                                        f32_4 %70 = OpLoad %69 
                               Uniform f32_4* %71 = OpAccessChain %18 %25 %30 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpVectorShuffle %72 %72 0 0 0 0 
                                        f32_4 %74 = OpFMul %70 %73 
                                        f32_4 %75 = OpLoad %62 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %62 %76 
                               Uniform f32_4* %77 = OpAccessChain %18 %20 %20 
                                        f32_4 %78 = OpLoad %77 
                               Uniform f32_4* %79 = OpAccessChain %18 %25 %30 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpVectorShuffle %80 %80 2 2 2 2 
                                        f32_4 %82 = OpFMul %78 %81 
                                        f32_4 %83 = OpLoad %62 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %62 %84 
                               Uniform f32_4* %85 = OpAccessChain %18 %20 %25 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %87 = OpAccessChain %18 %25 %30 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %86 %89 
                                        f32_4 %91 = OpLoad %62 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %62 %92 
                                        f32_3 %93 = OpLoad %58 
                                        f32_4 %94 = OpVectorShuffle %93 %93 0 0 0 0 
                                        f32_4 %95 = OpLoad %62 
                                        f32_4 %96 = OpFMul %94 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpFAdd %96 %97 
                                                      OpStore %9 %98 
                               Uniform f32_4* %99 = OpAccessChain %18 %20 %21 
                                       f32_4 %100 = OpLoad %99 
                              Uniform f32_4* %101 = OpAccessChain %18 %25 %20 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                                       f32_4 %104 = OpFMul %100 %103 
                                                      OpStore %62 %104 
                              Uniform f32_4* %105 = OpAccessChain %18 %20 %30 
                                       f32_4 %106 = OpLoad %105 
                              Uniform f32_4* %107 = OpAccessChain %18 %25 %20 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpVectorShuffle %108 %108 0 0 0 0 
                                       f32_4 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %62 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %62 %112 
                              Uniform f32_4* %113 = OpAccessChain %18 %20 %20 
                                       f32_4 %114 = OpLoad %113 
                              Uniform f32_4* %115 = OpAccessChain %18 %25 %20 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpVectorShuffle %116 %116 2 2 2 2 
                                       f32_4 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %62 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %62 %120 
                              Uniform f32_4* %121 = OpAccessChain %18 %20 %25 
                                       f32_4 %122 = OpLoad %121 
                              Uniform f32_4* %123 = OpAccessChain %18 %25 %20 
                                       f32_4 %124 = OpLoad %123 
                                       f32_4 %125 = OpVectorShuffle %124 %124 3 3 3 3 
                                       f32_4 %126 = OpFMul %122 %125 
                                       f32_4 %127 = OpLoad %62 
                                       f32_4 %128 = OpFAdd %126 %127 
                                                      OpStore %62 %128 
                                       f32_3 %129 = OpLoad %58 
                                       f32_4 %130 = OpVectorShuffle %129 %129 2 2 2 2 
                                       f32_4 %131 = OpLoad %62 
                                       f32_4 %132 = OpFMul %130 %131 
                                       f32_4 %133 = OpLoad %9 
                                       f32_4 %134 = OpFAdd %132 %133 
                                                      OpStore %62 %134 
                                       f32_4 %137 = OpLoad %62 
                                       f32_4 %138 = OpLoad %62 
                                         f32 %139 = OpDot %137 %138 
                                                      OpStore %136 %139 
                                         f32 %140 = OpLoad %136 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %136 %141 
                                       f32_4 %143 = OpLoad %62 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 2 
                                         f32 %145 = OpLoad %136 
                                       f32_2 %146 = OpCompositeConstruct %145 %145 
                                       f32_2 %147 = OpFMul %144 %146 
                                       f32_3 %148 = OpLoad %58 
                                       f32_2 %149 = OpVectorShuffle %148 %148 0 2 
                                       f32_2 %150 = OpFNegate %149 
                                       f32_2 %151 = OpFAdd %147 %150 
                                       f32_4 %152 = OpLoad %62 
                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 2 3 
                                                      OpStore %62 %153 
                                  Input f32* %158 = OpAccessChain %155 %156 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpExtInst %1 4 %159 
                                         f32 %161 = OpFNegate %160 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %136 %163 
                                         f32 %164 = OpLoad %136 
                                       f32_2 %165 = OpCompositeConstruct %164 %164 
                                       f32_4 %166 = OpLoad %62 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFMul %165 %167 
                                       f32_3 %169 = OpLoad %58 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 2 
                                       f32_2 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %62 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 3 
                                                      OpStore %62 %173 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                         f32 %176 = OpLoad %136 
                                       f32_3 %177 = OpCompositeConstruct %176 %176 %176 
                                       f32_3 %178 = OpFMul %175 %177 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFAdd %178 %181 
                                       f32_4 %183 = OpLoad %9 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %9 %184 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %18 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                       f32_4 %192 = OpLoad %9 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %9 %193 
                                  Input f32* %196 = OpAccessChain %194 %195 
                                         f32 %197 = OpLoad %196 
                                         f32 %199 = OpFMul %197 %198 
                                                      OpStore %136 %199 
                                       f32_4 %200 = OpLoad %62 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 1 
                                         f32 %202 = OpLoad %136 
                                       f32_2 %203 = OpCompositeConstruct %202 %202 
                                       f32_2 %204 = OpFMul %201 %203 
                                       f32_4 %205 = OpLoad %62 
                                       f32_4 %206 = OpVectorShuffle %205 %204 4 1 5 3 
                                                      OpStore %62 %206 
                              Uniform f32_4* %207 = OpAccessChain %18 %21 %25 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                         f32 %211 = OpDot %209 %210 
                                                      OpStore %136 %211 
                                         f32 %213 = OpLoad %136 
                                  Input f32* %215 = OpAccessChain %194 %214 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFAdd %213 %216 
                                Private f32* %218 = OpAccessChain %212 %195 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %212 %195 
                                         f32 %220 = OpLoad %219 
                                  Input f32* %221 = OpAccessChain %194 %195 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFAdd %220 %222 
                                                      OpStore %136 %223 
                                       f32_4 %224 = OpLoad %9 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                         f32 %226 = OpLoad %136 
                                       f32_3 %227 = OpCompositeConstruct %226 %226 %226 
                                         f32 %228 = OpDot %225 %227 
                                Private f32* %229 = OpAccessChain %212 %214 
                                                      OpStore %229 %228 
                                       f32_4 %230 = OpLoad %212 
                                       f32_4 %231 = OpVectorShuffle %230 %230 0 0 1 1 
                              Uniform f32_4* %232 = OpAccessChain %18 %30 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpVectorShuffle %233 %233 1 1 1 1 
                                       f32_4 %235 = OpFAdd %231 %234 
                                                      OpStore %212 %235 
                                       f32_4 %236 = OpLoad %212 
                                       f32_4 %242 = OpFMul %236 %241 
                                                      OpStore %212 %242 
                                       f32_4 %243 = OpLoad %212 
                                       f32_4 %244 = OpExtInst %1 10 %243 
                                                      OpStore %212 %244 
                                       f32_4 %245 = OpLoad %212 
                                       f32_4 %248 = OpFMul %245 %247 
                                       f32_4 %251 = OpFAdd %248 %250 
                                                      OpStore %212 %251 
                                       f32_4 %252 = OpLoad %212 
                                       f32_4 %253 = OpExtInst %1 10 %252 
                                                      OpStore %212 %253 
                                       f32_4 %254 = OpLoad %212 
                                       f32_4 %255 = OpFMul %254 %247 
                                       f32_4 %258 = OpFAdd %255 %257 
                                                      OpStore %212 %258 
                                       f32_4 %260 = OpLoad %212 
                                       f32_4 %261 = OpExtInst %1 4 %260 
                                       f32_4 %262 = OpLoad %212 
                                       f32_4 %263 = OpExtInst %1 4 %262 
                                       f32_4 %264 = OpFMul %261 %263 
                                                      OpStore %259 %264 
                                       f32_4 %265 = OpLoad %212 
                                       f32_4 %266 = OpExtInst %1 4 %265 
                                       f32_4 %267 = OpFNegate %266 
                                       f32_4 %268 = OpFMul %267 %247 
                                       f32_4 %271 = OpFAdd %268 %270 
                                                      OpStore %212 %271 
                                       f32_4 %272 = OpLoad %212 
                                       f32_4 %273 = OpLoad %259 
                                       f32_4 %274 = OpFMul %272 %273 
                                                      OpStore %212 %274 
                                       f32_4 %275 = OpLoad %212 
                                       f32_2 %276 = OpVectorShuffle %275 %275 1 3 
                                       f32_4 %277 = OpLoad %212 
                                       f32_2 %278 = OpVectorShuffle %277 %277 0 2 
                                       f32_2 %279 = OpFAdd %276 %278 
                                       f32_4 %280 = OpLoad %212 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
                                                      OpStore %212 %281 
                                       f32_4 %282 = OpLoad %212 
                                       f32_3 %283 = OpVectorShuffle %282 %282 1 1 1 
                              Uniform f32_4* %285 = OpAccessChain %18 %284 
                                       f32_4 %286 = OpLoad %285 
                                       f32_3 %287 = OpVectorShuffle %286 %286 0 1 2 
                                       f32_3 %288 = OpFMul %283 %287 
                                       f32_4 %289 = OpLoad %259 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                      OpStore %259 %290 
                                       f32_4 %291 = OpLoad %259 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 1 1 1 
                                       f32_3 %296 = OpFMul %292 %295 
                                       f32_4 %297 = OpLoad %259 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 6 3 
                                                      OpStore %259 %298 
                                Private f32* %299 = OpAccessChain %212 %195 
                                         f32 %300 = OpLoad %299 
                                  Input f32* %301 = OpAccessChain %293 %195 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFMul %300 %302 
                                Private f32* %304 = OpAccessChain %62 %195 
                                                      OpStore %304 %303 
                                Private f32* %307 = OpAccessChain %212 %306 
                                                      OpStore %307 %305 
                                       f32_4 %308 = OpLoad %212 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 2 0 
                                       f32_4 %310 = OpLoad %62 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 1 2 
                                       f32_3 %312 = OpFMul %309 %311 
                                       f32_4 %313 = OpLoad %259 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpFAdd %312 %314 
                                       f32_4 %316 = OpLoad %62 
                                       f32_4 %317 = OpVectorShuffle %316 %315 4 5 6 3 
                                                      OpStore %62 %317 
                                       f32_4 %318 = OpLoad %62 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                              Uniform f32_4* %320 = OpAccessChain %18 %284 
                                       f32_4 %321 = OpLoad %320 
                                       f32_3 %322 = OpVectorShuffle %321 %321 3 3 3 
                                       f32_3 %323 = OpFMul %319 %322 
                                       f32_4 %324 = OpLoad %9 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                       f32_3 %326 = OpFAdd %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 6 3 
                                                      OpStore %9 %328 
                                       f32_4 %329 = OpLoad %293 
                                       f32_3 %330 = OpVectorShuffle %329 %329 0 0 0 
                              Uniform f32_4* %331 = OpAccessChain %18 %284 
                                       f32_4 %332 = OpLoad %331 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                       f32_3 %334 = OpFMul %330 %333 
                                       f32_4 %335 = OpLoad %9 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFAdd %334 %336 
                                       f32_4 %338 = OpLoad %9 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                      OpStore %9 %339 
                              Uniform f32_4* %341 = OpAccessChain %18 %340 
                                       f32_4 %342 = OpLoad %341 
                                       f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                       f32_4 %344 = OpLoad %9 
                                       f32_3 %345 = OpVectorShuffle %344 %344 0 1 2 
                                         f32 %346 = OpDot %343 %345 
                                                      OpStore %136 %346 
                                         f32 %347 = OpLoad %136 
                                Uniform f32* %349 = OpAccessChain %18 %340 %156 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFAdd %347 %350 
                                                      OpStore %136 %351 
                                         f32 %352 = OpLoad %136 
                                       f32_3 %353 = OpCompositeConstruct %352 %352 %352 
                                       f32_3 %354 = OpFNegate %353 
                              Uniform f32_4* %355 = OpAccessChain %18 %340 
                                       f32_4 %356 = OpLoad %355 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_3 %358 = OpFMul %354 %357 
                                       f32_4 %359 = OpLoad %9 
                                       f32_3 %360 = OpVectorShuffle %359 %359 0 1 2 
                                       f32_3 %361 = OpFAdd %358 %360 
                                       f32_4 %362 = OpLoad %62 
                                       f32_4 %363 = OpVectorShuffle %362 %361 4 5 6 3 
                                                      OpStore %62 %363 
                                       f32_4 %364 = OpLoad %9 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_4 %366 = OpLoad %62 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpFNegate %367 
                                       f32_3 %369 = OpFAdd %365 %368 
                                       f32_4 %370 = OpLoad %9 
                                       f32_4 %371 = OpVectorShuffle %370 %369 4 5 6 3 
                                                      OpStore %9 %371 
                                Uniform f32* %373 = OpAccessChain %18 %372 
                                         f32 %374 = OpLoad %373 
                                       f32_3 %375 = OpCompositeConstruct %374 %374 %374 
                                       f32_4 %376 = OpLoad %9 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_3 %378 = OpFMul %375 %377 
                                       f32_4 %379 = OpLoad %62 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                                       f32_3 %381 = OpFAdd %378 %380 
                                       f32_4 %382 = OpLoad %9 
                                       f32_4 %383 = OpVectorShuffle %382 %381 4 5 6 3 
                                                      OpStore %9 %383 
                                       f32_4 %384 = OpLoad %9 
                                       f32_4 %385 = OpVectorShuffle %384 %384 1 1 1 1 
                              Uniform f32_4* %386 = OpAccessChain %18 %21 %21 
                                       f32_4 %387 = OpLoad %386 
                                       f32_4 %388 = OpFMul %385 %387 
                                                      OpStore %62 %388 
                              Uniform f32_4* %389 = OpAccessChain %18 %21 %30 
                                       f32_4 %390 = OpLoad %389 
                                       f32_4 %391 = OpLoad %9 
                                       f32_4 %392 = OpVectorShuffle %391 %391 0 0 0 0 
                                       f32_4 %393 = OpFMul %390 %392 
                                       f32_4 %394 = OpLoad %62 
                                       f32_4 %395 = OpFAdd %393 %394 
                                                      OpStore %62 %395 
                              Uniform f32_4* %396 = OpAccessChain %18 %21 %20 
                                       f32_4 %397 = OpLoad %396 
                                       f32_4 %398 = OpLoad %9 
                                       f32_4 %399 = OpVectorShuffle %398 %398 2 2 2 2 
                                       f32_4 %400 = OpFMul %397 %399 
                                       f32_4 %401 = OpLoad %62 
                                       f32_4 %402 = OpFAdd %400 %401 
                                                      OpStore %9 %402 
                                       f32_4 %403 = OpLoad %9 
                              Uniform f32_4* %404 = OpAccessChain %18 %21 %25 
                                       f32_4 %405 = OpLoad %404 
                                       f32_4 %406 = OpFAdd %403 %405 
                                                      OpStore %9 %406 
                                       f32_4 %407 = OpLoad %9 
                                       f32_4 %408 = OpVectorShuffle %407 %407 1 1 1 1 
                              Uniform f32_4* %410 = OpAccessChain %18 %409 %21 
                                       f32_4 %411 = OpLoad %410 
                                       f32_4 %412 = OpFMul %408 %411 
                                                      OpStore %62 %412 
                              Uniform f32_4* %413 = OpAccessChain %18 %409 %30 
                                       f32_4 %414 = OpLoad %413 
                                       f32_4 %415 = OpLoad %9 
                                       f32_4 %416 = OpVectorShuffle %415 %415 0 0 0 0 
                                       f32_4 %417 = OpFMul %414 %416 
                                       f32_4 %418 = OpLoad %62 
                                       f32_4 %419 = OpFAdd %417 %418 
                                                      OpStore %62 %419 
                              Uniform f32_4* %420 = OpAccessChain %18 %409 %20 
                                       f32_4 %421 = OpLoad %420 
                                       f32_4 %422 = OpLoad %9 
                                       f32_4 %423 = OpVectorShuffle %422 %422 2 2 2 2 
                                       f32_4 %424 = OpFMul %421 %423 
                                       f32_4 %425 = OpLoad %62 
                                       f32_4 %426 = OpFAdd %424 %425 
                                                      OpStore %62 %426 
                                       f32_4 %429 = OpLoad %9 
                                                      OpStore vs_TEXCOORD1 %429 
                                       f32_4 %434 = OpLoad %62 
                              Uniform f32_4* %435 = OpAccessChain %18 %409 %25 
                                       f32_4 %436 = OpLoad %435 
                                       f32_4 %437 = OpFAdd %434 %436 
                               Output f32_4* %438 = OpAccessChain %433 %30 
                                                      OpStore %438 %437 
                                       f32_4 %442 = OpLoad %441 
                                       f32_2 %443 = OpVectorShuffle %442 %442 0 1 
                                                      OpStore vs_TEXCOORD0 %443 
                                 Output f32* %445 = OpAccessChain %433 %30 %195 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFNegate %446 
                                 Output f32* %448 = OpAccessChain %433 %30 %195 
                                                      OpStore %448 %447 
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
                                             OpEntryPoint Fragment %4 "main" %21 %56 %58 
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
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate vs_TEXCOORD1 Location 58 
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
                                     %30 = OpTypeStruct %6 
                                     %31 = OpTypePointer Uniform %30 
              Uniform struct {f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 0 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 1 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 i32 %48 = OpSelect %46 %47 %34 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %34 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                               f32_4 %59 = OpLoad vs_TEXCOORD1 
                                             OpStore %56 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 450
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %58 %155 %179 %194 %293 %428 %433 %440 %441 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpMemberDecorate %16 7 Offset 16 
                                                      OpMemberDecorate %16 8 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %58 Location 58 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %194 Location 194 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %293 Location 293 
                                                      OpDecorate vs_TEXCOORD1 Location 428 
                                                      OpMemberDecorate %431 0 BuiltIn 431 
                                                      OpMemberDecorate %431 1 BuiltIn 431 
                                                      OpMemberDecorate %431 2 BuiltIn 431 
                                                      OpDecorate %431 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 440 
                                                      OpDecorate %441 Location 441 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                              %16 = OpTypeStruct %7 %12 %13 %14 %15 %7 %7 %6 %7 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 2 
                                          i32 %21 = OpConstant 1 
                                              %22 = OpTypePointer Uniform %7 
                                          i32 %25 = OpConstant 3 
                                          i32 %30 = OpConstant 0 
                                              %56 = OpTypeVector %6 3 
                                              %57 = OpTypePointer Input %56 
                                 Input f32_3* %58 = OpVariable Input 
                               Private f32_4* %62 = OpVariable Private 
                                             %135 = OpTypePointer Private %6 
                                Private f32* %136 = OpVariable Private 
                                             %142 = OpTypeVector %6 2 
                                             %154 = OpTypePointer Input %7 
                                Input f32_4* %155 = OpVariable Input 
                                         u32 %156 = OpConstant 3 
                                             %157 = OpTypePointer Input %6 
                                         f32 %162 = OpConstant 3.674022E-40 
                                Input f32_4* %179 = OpVariable Input 
                                         i32 %187 = OpConstant 5 
                                Input f32_4* %194 = OpVariable Input 
                                         u32 %195 = OpConstant 1 
                                         f32 %198 = OpConstant 3.674022E-40 
                                       f32_3 %210 = OpConstantComposite %162 %162 %162 
                              Private f32_4* %212 = OpVariable Private 
                                         u32 %214 = OpConstant 0 
                                         f32 %237 = OpConstant 3.674022E-40 
                                         f32 %238 = OpConstant 3.674022E-40 
                                         f32 %239 = OpConstant 3.674022E-40 
                                         f32 %240 = OpConstant 3.674022E-40 
                                       f32_4 %241 = OpConstantComposite %237 %238 %239 %240 
                                         f32 %246 = OpConstant 3.674022E-40 
                                       f32_4 %247 = OpConstantComposite %246 %246 %246 %246 
                                         f32 %249 = OpConstant 3.674022E-40 
                                       f32_4 %250 = OpConstantComposite %249 %249 %249 %249 
                                         f32 %256 = OpConstant 3.674022E-40 
                                       f32_4 %257 = OpConstantComposite %256 %256 %256 %256 
                              Private f32_4* %259 = OpVariable Private 
                                         f32 %269 = OpConstant 3.674022E-40 
                                       f32_4 %270 = OpConstantComposite %269 %269 %269 %269 
                                         i32 %284 = OpConstant 8 
                                Input f32_4* %293 = OpVariable Input 
                                         f32 %305 = OpConstant 3.674022E-40 
                                         u32 %306 = OpConstant 2 
                                         i32 %340 = OpConstant 6 
                                             %348 = OpTypePointer Uniform %6 
                                         i32 %372 = OpConstant 7 
                                         i32 %409 = OpConstant 4 
                                             %427 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %430 = OpTypeArray %6 %195 
                                             %431 = OpTypeStruct %7 %6 %430 
                                             %432 = OpTypePointer Output %431 
        Output struct {f32_4; f32; f32[1];}* %433 = OpVariable Output 
                                             %439 = OpTypePointer Output %142 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %441 = OpVariable Input 
                                             %444 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Uniform f32_4* %23 = OpAccessChain %18 %20 %21 
                                        f32_4 %24 = OpLoad %23 
                               Uniform f32_4* %26 = OpAccessChain %18 %25 %21 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpVectorShuffle %27 %27 1 1 1 1 
                                        f32_4 %29 = OpFMul %24 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %31 = OpAccessChain %18 %20 %30 
                                        f32_4 %32 = OpLoad %31 
                               Uniform f32_4* %33 = OpAccessChain %18 %25 %21 
                                        f32_4 %34 = OpLoad %33 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                        f32_4 %36 = OpFMul %32 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpFAdd %36 %37 
                                                      OpStore %9 %38 
                               Uniform f32_4* %39 = OpAccessChain %18 %20 %20 
                                        f32_4 %40 = OpLoad %39 
                               Uniform f32_4* %41 = OpAccessChain %18 %25 %21 
                                        f32_4 %42 = OpLoad %41 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                        f32_4 %44 = OpFMul %40 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %9 %46 
                               Uniform f32_4* %47 = OpAccessChain %18 %20 %25 
                                        f32_4 %48 = OpLoad %47 
                               Uniform f32_4* %49 = OpAccessChain %18 %25 %21 
                                        f32_4 %50 = OpLoad %49 
                                        f32_4 %51 = OpVectorShuffle %50 %50 3 3 3 3 
                                        f32_4 %52 = OpFMul %48 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %9 %54 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %59 = OpLoad %58 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                                        f32_4 %61 = OpFMul %55 %60 
                                                      OpStore %9 %61 
                               Uniform f32_4* %63 = OpAccessChain %18 %20 %21 
                                        f32_4 %64 = OpLoad %63 
                               Uniform f32_4* %65 = OpAccessChain %18 %25 %30 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                                        f32_4 %68 = OpFMul %64 %67 
                                                      OpStore %62 %68 
                               Uniform f32_4* %69 = OpAccessChain %18 %20 %30 
                                        f32_4 %70 = OpLoad %69 
                               Uniform f32_4* %71 = OpAccessChain %18 %25 %30 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpVectorShuffle %72 %72 0 0 0 0 
                                        f32_4 %74 = OpFMul %70 %73 
                                        f32_4 %75 = OpLoad %62 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %62 %76 
                               Uniform f32_4* %77 = OpAccessChain %18 %20 %20 
                                        f32_4 %78 = OpLoad %77 
                               Uniform f32_4* %79 = OpAccessChain %18 %25 %30 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpVectorShuffle %80 %80 2 2 2 2 
                                        f32_4 %82 = OpFMul %78 %81 
                                        f32_4 %83 = OpLoad %62 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %62 %84 
                               Uniform f32_4* %85 = OpAccessChain %18 %20 %25 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %87 = OpAccessChain %18 %25 %30 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %86 %89 
                                        f32_4 %91 = OpLoad %62 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %62 %92 
                                        f32_3 %93 = OpLoad %58 
                                        f32_4 %94 = OpVectorShuffle %93 %93 0 0 0 0 
                                        f32_4 %95 = OpLoad %62 
                                        f32_4 %96 = OpFMul %94 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpFAdd %96 %97 
                                                      OpStore %9 %98 
                               Uniform f32_4* %99 = OpAccessChain %18 %20 %21 
                                       f32_4 %100 = OpLoad %99 
                              Uniform f32_4* %101 = OpAccessChain %18 %25 %20 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                                       f32_4 %104 = OpFMul %100 %103 
                                                      OpStore %62 %104 
                              Uniform f32_4* %105 = OpAccessChain %18 %20 %30 
                                       f32_4 %106 = OpLoad %105 
                              Uniform f32_4* %107 = OpAccessChain %18 %25 %20 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpVectorShuffle %108 %108 0 0 0 0 
                                       f32_4 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %62 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %62 %112 
                              Uniform f32_4* %113 = OpAccessChain %18 %20 %20 
                                       f32_4 %114 = OpLoad %113 
                              Uniform f32_4* %115 = OpAccessChain %18 %25 %20 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpVectorShuffle %116 %116 2 2 2 2 
                                       f32_4 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %62 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %62 %120 
                              Uniform f32_4* %121 = OpAccessChain %18 %20 %25 
                                       f32_4 %122 = OpLoad %121 
                              Uniform f32_4* %123 = OpAccessChain %18 %25 %20 
                                       f32_4 %124 = OpLoad %123 
                                       f32_4 %125 = OpVectorShuffle %124 %124 3 3 3 3 
                                       f32_4 %126 = OpFMul %122 %125 
                                       f32_4 %127 = OpLoad %62 
                                       f32_4 %128 = OpFAdd %126 %127 
                                                      OpStore %62 %128 
                                       f32_3 %129 = OpLoad %58 
                                       f32_4 %130 = OpVectorShuffle %129 %129 2 2 2 2 
                                       f32_4 %131 = OpLoad %62 
                                       f32_4 %132 = OpFMul %130 %131 
                                       f32_4 %133 = OpLoad %9 
                                       f32_4 %134 = OpFAdd %132 %133 
                                                      OpStore %62 %134 
                                       f32_4 %137 = OpLoad %62 
                                       f32_4 %138 = OpLoad %62 
                                         f32 %139 = OpDot %137 %138 
                                                      OpStore %136 %139 
                                         f32 %140 = OpLoad %136 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %136 %141 
                                       f32_4 %143 = OpLoad %62 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 2 
                                         f32 %145 = OpLoad %136 
                                       f32_2 %146 = OpCompositeConstruct %145 %145 
                                       f32_2 %147 = OpFMul %144 %146 
                                       f32_3 %148 = OpLoad %58 
                                       f32_2 %149 = OpVectorShuffle %148 %148 0 2 
                                       f32_2 %150 = OpFNegate %149 
                                       f32_2 %151 = OpFAdd %147 %150 
                                       f32_4 %152 = OpLoad %62 
                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 2 3 
                                                      OpStore %62 %153 
                                  Input f32* %158 = OpAccessChain %155 %156 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpExtInst %1 4 %159 
                                         f32 %161 = OpFNegate %160 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %136 %163 
                                         f32 %164 = OpLoad %136 
                                       f32_2 %165 = OpCompositeConstruct %164 %164 
                                       f32_4 %166 = OpLoad %62 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFMul %165 %167 
                                       f32_3 %169 = OpLoad %58 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 2 
                                       f32_2 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %62 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 3 
                                                      OpStore %62 %173 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                         f32 %176 = OpLoad %136 
                                       f32_3 %177 = OpCompositeConstruct %176 %176 %176 
                                       f32_3 %178 = OpFMul %175 %177 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFAdd %178 %181 
                                       f32_4 %183 = OpLoad %9 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %9 %184 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %18 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                       f32_4 %192 = OpLoad %9 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %9 %193 
                                  Input f32* %196 = OpAccessChain %194 %195 
                                         f32 %197 = OpLoad %196 
                                         f32 %199 = OpFMul %197 %198 
                                                      OpStore %136 %199 
                                       f32_4 %200 = OpLoad %62 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 1 
                                         f32 %202 = OpLoad %136 
                                       f32_2 %203 = OpCompositeConstruct %202 %202 
                                       f32_2 %204 = OpFMul %201 %203 
                                       f32_4 %205 = OpLoad %62 
                                       f32_4 %206 = OpVectorShuffle %205 %204 4 1 5 3 
                                                      OpStore %62 %206 
                              Uniform f32_4* %207 = OpAccessChain %18 %21 %25 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                         f32 %211 = OpDot %209 %210 
                                                      OpStore %136 %211 
                                         f32 %213 = OpLoad %136 
                                  Input f32* %215 = OpAccessChain %194 %214 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFAdd %213 %216 
                                Private f32* %218 = OpAccessChain %212 %195 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %212 %195 
                                         f32 %220 = OpLoad %219 
                                  Input f32* %221 = OpAccessChain %194 %195 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFAdd %220 %222 
                                                      OpStore %136 %223 
                                       f32_4 %224 = OpLoad %9 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                         f32 %226 = OpLoad %136 
                                       f32_3 %227 = OpCompositeConstruct %226 %226 %226 
                                         f32 %228 = OpDot %225 %227 
                                Private f32* %229 = OpAccessChain %212 %214 
                                                      OpStore %229 %228 
                                       f32_4 %230 = OpLoad %212 
                                       f32_4 %231 = OpVectorShuffle %230 %230 0 0 1 1 
                              Uniform f32_4* %232 = OpAccessChain %18 %30 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpVectorShuffle %233 %233 1 1 1 1 
                                       f32_4 %235 = OpFAdd %231 %234 
                                                      OpStore %212 %235 
                                       f32_4 %236 = OpLoad %212 
                                       f32_4 %242 = OpFMul %236 %241 
                                                      OpStore %212 %242 
                                       f32_4 %243 = OpLoad %212 
                                       f32_4 %244 = OpExtInst %1 10 %243 
                                                      OpStore %212 %244 
                                       f32_4 %245 = OpLoad %212 
                                       f32_4 %248 = OpFMul %245 %247 
                                       f32_4 %251 = OpFAdd %248 %250 
                                                      OpStore %212 %251 
                                       f32_4 %252 = OpLoad %212 
                                       f32_4 %253 = OpExtInst %1 10 %252 
                                                      OpStore %212 %253 
                                       f32_4 %254 = OpLoad %212 
                                       f32_4 %255 = OpFMul %254 %247 
                                       f32_4 %258 = OpFAdd %255 %257 
                                                      OpStore %212 %258 
                                       f32_4 %260 = OpLoad %212 
                                       f32_4 %261 = OpExtInst %1 4 %260 
                                       f32_4 %262 = OpLoad %212 
                                       f32_4 %263 = OpExtInst %1 4 %262 
                                       f32_4 %264 = OpFMul %261 %263 
                                                      OpStore %259 %264 
                                       f32_4 %265 = OpLoad %212 
                                       f32_4 %266 = OpExtInst %1 4 %265 
                                       f32_4 %267 = OpFNegate %266 
                                       f32_4 %268 = OpFMul %267 %247 
                                       f32_4 %271 = OpFAdd %268 %270 
                                                      OpStore %212 %271 
                                       f32_4 %272 = OpLoad %212 
                                       f32_4 %273 = OpLoad %259 
                                       f32_4 %274 = OpFMul %272 %273 
                                                      OpStore %212 %274 
                                       f32_4 %275 = OpLoad %212 
                                       f32_2 %276 = OpVectorShuffle %275 %275 1 3 
                                       f32_4 %277 = OpLoad %212 
                                       f32_2 %278 = OpVectorShuffle %277 %277 0 2 
                                       f32_2 %279 = OpFAdd %276 %278 
                                       f32_4 %280 = OpLoad %212 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
                                                      OpStore %212 %281 
                                       f32_4 %282 = OpLoad %212 
                                       f32_3 %283 = OpVectorShuffle %282 %282 1 1 1 
                              Uniform f32_4* %285 = OpAccessChain %18 %284 
                                       f32_4 %286 = OpLoad %285 
                                       f32_3 %287 = OpVectorShuffle %286 %286 0 1 2 
                                       f32_3 %288 = OpFMul %283 %287 
                                       f32_4 %289 = OpLoad %259 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                      OpStore %259 %290 
                                       f32_4 %291 = OpLoad %259 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 1 1 1 
                                       f32_3 %296 = OpFMul %292 %295 
                                       f32_4 %297 = OpLoad %259 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 6 3 
                                                      OpStore %259 %298 
                                Private f32* %299 = OpAccessChain %212 %195 
                                         f32 %300 = OpLoad %299 
                                  Input f32* %301 = OpAccessChain %293 %195 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFMul %300 %302 
                                Private f32* %304 = OpAccessChain %62 %195 
                                                      OpStore %304 %303 
                                Private f32* %307 = OpAccessChain %212 %306 
                                                      OpStore %307 %305 
                                       f32_4 %308 = OpLoad %212 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 2 0 
                                       f32_4 %310 = OpLoad %62 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 1 2 
                                       f32_3 %312 = OpFMul %309 %311 
                                       f32_4 %313 = OpLoad %259 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpFAdd %312 %314 
                                       f32_4 %316 = OpLoad %62 
                                       f32_4 %317 = OpVectorShuffle %316 %315 4 5 6 3 
                                                      OpStore %62 %317 
                                       f32_4 %318 = OpLoad %62 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                              Uniform f32_4* %320 = OpAccessChain %18 %284 
                                       f32_4 %321 = OpLoad %320 
                                       f32_3 %322 = OpVectorShuffle %321 %321 3 3 3 
                                       f32_3 %323 = OpFMul %319 %322 
                                       f32_4 %324 = OpLoad %9 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                       f32_3 %326 = OpFAdd %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 6 3 
                                                      OpStore %9 %328 
                                       f32_4 %329 = OpLoad %293 
                                       f32_3 %330 = OpVectorShuffle %329 %329 0 0 0 
                              Uniform f32_4* %331 = OpAccessChain %18 %284 
                                       f32_4 %332 = OpLoad %331 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                       f32_3 %334 = OpFMul %330 %333 
                                       f32_4 %335 = OpLoad %9 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFAdd %334 %336 
                                       f32_4 %338 = OpLoad %9 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                      OpStore %9 %339 
                              Uniform f32_4* %341 = OpAccessChain %18 %340 
                                       f32_4 %342 = OpLoad %341 
                                       f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                       f32_4 %344 = OpLoad %9 
                                       f32_3 %345 = OpVectorShuffle %344 %344 0 1 2 
                                         f32 %346 = OpDot %343 %345 
                                                      OpStore %136 %346 
                                         f32 %347 = OpLoad %136 
                                Uniform f32* %349 = OpAccessChain %18 %340 %156 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFAdd %347 %350 
                                                      OpStore %136 %351 
                                         f32 %352 = OpLoad %136 
                                       f32_3 %353 = OpCompositeConstruct %352 %352 %352 
                                       f32_3 %354 = OpFNegate %353 
                              Uniform f32_4* %355 = OpAccessChain %18 %340 
                                       f32_4 %356 = OpLoad %355 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_3 %358 = OpFMul %354 %357 
                                       f32_4 %359 = OpLoad %9 
                                       f32_3 %360 = OpVectorShuffle %359 %359 0 1 2 
                                       f32_3 %361 = OpFAdd %358 %360 
                                       f32_4 %362 = OpLoad %62 
                                       f32_4 %363 = OpVectorShuffle %362 %361 4 5 6 3 
                                                      OpStore %62 %363 
                                       f32_4 %364 = OpLoad %9 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_4 %366 = OpLoad %62 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpFNegate %367 
                                       f32_3 %369 = OpFAdd %365 %368 
                                       f32_4 %370 = OpLoad %9 
                                       f32_4 %371 = OpVectorShuffle %370 %369 4 5 6 3 
                                                      OpStore %9 %371 
                                Uniform f32* %373 = OpAccessChain %18 %372 
                                         f32 %374 = OpLoad %373 
                                       f32_3 %375 = OpCompositeConstruct %374 %374 %374 
                                       f32_4 %376 = OpLoad %9 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_3 %378 = OpFMul %375 %377 
                                       f32_4 %379 = OpLoad %62 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                                       f32_3 %381 = OpFAdd %378 %380 
                                       f32_4 %382 = OpLoad %9 
                                       f32_4 %383 = OpVectorShuffle %382 %381 4 5 6 3 
                                                      OpStore %9 %383 
                                       f32_4 %384 = OpLoad %9 
                                       f32_4 %385 = OpVectorShuffle %384 %384 1 1 1 1 
                              Uniform f32_4* %386 = OpAccessChain %18 %21 %21 
                                       f32_4 %387 = OpLoad %386 
                                       f32_4 %388 = OpFMul %385 %387 
                                                      OpStore %62 %388 
                              Uniform f32_4* %389 = OpAccessChain %18 %21 %30 
                                       f32_4 %390 = OpLoad %389 
                                       f32_4 %391 = OpLoad %9 
                                       f32_4 %392 = OpVectorShuffle %391 %391 0 0 0 0 
                                       f32_4 %393 = OpFMul %390 %392 
                                       f32_4 %394 = OpLoad %62 
                                       f32_4 %395 = OpFAdd %393 %394 
                                                      OpStore %62 %395 
                              Uniform f32_4* %396 = OpAccessChain %18 %21 %20 
                                       f32_4 %397 = OpLoad %396 
                                       f32_4 %398 = OpLoad %9 
                                       f32_4 %399 = OpVectorShuffle %398 %398 2 2 2 2 
                                       f32_4 %400 = OpFMul %397 %399 
                                       f32_4 %401 = OpLoad %62 
                                       f32_4 %402 = OpFAdd %400 %401 
                                                      OpStore %9 %402 
                                       f32_4 %403 = OpLoad %9 
                              Uniform f32_4* %404 = OpAccessChain %18 %21 %25 
                                       f32_4 %405 = OpLoad %404 
                                       f32_4 %406 = OpFAdd %403 %405 
                                                      OpStore %9 %406 
                                       f32_4 %407 = OpLoad %9 
                                       f32_4 %408 = OpVectorShuffle %407 %407 1 1 1 1 
                              Uniform f32_4* %410 = OpAccessChain %18 %409 %21 
                                       f32_4 %411 = OpLoad %410 
                                       f32_4 %412 = OpFMul %408 %411 
                                                      OpStore %62 %412 
                              Uniform f32_4* %413 = OpAccessChain %18 %409 %30 
                                       f32_4 %414 = OpLoad %413 
                                       f32_4 %415 = OpLoad %9 
                                       f32_4 %416 = OpVectorShuffle %415 %415 0 0 0 0 
                                       f32_4 %417 = OpFMul %414 %416 
                                       f32_4 %418 = OpLoad %62 
                                       f32_4 %419 = OpFAdd %417 %418 
                                                      OpStore %62 %419 
                              Uniform f32_4* %420 = OpAccessChain %18 %409 %20 
                                       f32_4 %421 = OpLoad %420 
                                       f32_4 %422 = OpLoad %9 
                                       f32_4 %423 = OpVectorShuffle %422 %422 2 2 2 2 
                                       f32_4 %424 = OpFMul %421 %423 
                                       f32_4 %425 = OpLoad %62 
                                       f32_4 %426 = OpFAdd %424 %425 
                                                      OpStore %62 %426 
                                       f32_4 %429 = OpLoad %9 
                                                      OpStore vs_TEXCOORD1 %429 
                                       f32_4 %434 = OpLoad %62 
                              Uniform f32_4* %435 = OpAccessChain %18 %409 %25 
                                       f32_4 %436 = OpLoad %435 
                                       f32_4 %437 = OpFAdd %434 %436 
                               Output f32_4* %438 = OpAccessChain %433 %30 
                                                      OpStore %438 %437 
                                       f32_4 %442 = OpLoad %441 
                                       f32_2 %443 = OpVectorShuffle %442 %442 0 1 
                                                      OpStore vs_TEXCOORD0 %443 
                                 Output f32* %445 = OpAccessChain %433 %30 %195 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFNegate %446 
                                 Output f32* %448 = OpAccessChain %433 %30 %195 
                                                      OpStore %448 %447 
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
                                             OpEntryPoint Fragment %4 "main" %21 %56 %58 
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
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate vs_TEXCOORD1 Location 58 
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
                                     %30 = OpTypeStruct %6 
                                     %31 = OpTypePointer Uniform %30 
              Uniform struct {f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 0 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 1 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 i32 %48 = OpSelect %46 %47 %34 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %34 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                               f32_4 %59 = OpLoad vs_TEXCOORD1 
                                             OpStore %56 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 450
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %58 %155 %179 %194 %293 %428 %433 %440 %441 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpMemberDecorate %16 6 Offset 16 
                                                      OpMemberDecorate %16 7 Offset 16 
                                                      OpMemberDecorate %16 8 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate %58 Location 58 
                                                      OpDecorate %155 Location 155 
                                                      OpDecorate %179 Location 179 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %194 Location 194 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %293 Location 293 
                                                      OpDecorate vs_TEXCOORD1 Location 428 
                                                      OpMemberDecorate %431 0 BuiltIn 431 
                                                      OpMemberDecorate %431 1 BuiltIn 431 
                                                      OpMemberDecorate %431 2 BuiltIn 431 
                                                      OpDecorate %431 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 440 
                                                      OpDecorate %441 Location 441 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 0 
                                          u32 %11 = OpConstant 4 
                                              %12 = OpTypeArray %7 %11 
                                              %13 = OpTypeArray %7 %11 
                                              %14 = OpTypeArray %7 %11 
                                              %15 = OpTypeArray %7 %11 
                                              %16 = OpTypeStruct %7 %12 %13 %14 %15 %7 %7 %6 %7 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32_4;}* %18 = OpVariable Uniform 
                                              %19 = OpTypeInt 32 1 
                                          i32 %20 = OpConstant 2 
                                          i32 %21 = OpConstant 1 
                                              %22 = OpTypePointer Uniform %7 
                                          i32 %25 = OpConstant 3 
                                          i32 %30 = OpConstant 0 
                                              %56 = OpTypeVector %6 3 
                                              %57 = OpTypePointer Input %56 
                                 Input f32_3* %58 = OpVariable Input 
                               Private f32_4* %62 = OpVariable Private 
                                             %135 = OpTypePointer Private %6 
                                Private f32* %136 = OpVariable Private 
                                             %142 = OpTypeVector %6 2 
                                             %154 = OpTypePointer Input %7 
                                Input f32_4* %155 = OpVariable Input 
                                         u32 %156 = OpConstant 3 
                                             %157 = OpTypePointer Input %6 
                                         f32 %162 = OpConstant 3.674022E-40 
                                Input f32_4* %179 = OpVariable Input 
                                         i32 %187 = OpConstant 5 
                                Input f32_4* %194 = OpVariable Input 
                                         u32 %195 = OpConstant 1 
                                         f32 %198 = OpConstant 3.674022E-40 
                                       f32_3 %210 = OpConstantComposite %162 %162 %162 
                              Private f32_4* %212 = OpVariable Private 
                                         u32 %214 = OpConstant 0 
                                         f32 %237 = OpConstant 3.674022E-40 
                                         f32 %238 = OpConstant 3.674022E-40 
                                         f32 %239 = OpConstant 3.674022E-40 
                                         f32 %240 = OpConstant 3.674022E-40 
                                       f32_4 %241 = OpConstantComposite %237 %238 %239 %240 
                                         f32 %246 = OpConstant 3.674022E-40 
                                       f32_4 %247 = OpConstantComposite %246 %246 %246 %246 
                                         f32 %249 = OpConstant 3.674022E-40 
                                       f32_4 %250 = OpConstantComposite %249 %249 %249 %249 
                                         f32 %256 = OpConstant 3.674022E-40 
                                       f32_4 %257 = OpConstantComposite %256 %256 %256 %256 
                              Private f32_4* %259 = OpVariable Private 
                                         f32 %269 = OpConstant 3.674022E-40 
                                       f32_4 %270 = OpConstantComposite %269 %269 %269 %269 
                                         i32 %284 = OpConstant 8 
                                Input f32_4* %293 = OpVariable Input 
                                         f32 %305 = OpConstant 3.674022E-40 
                                         u32 %306 = OpConstant 2 
                                         i32 %340 = OpConstant 6 
                                             %348 = OpTypePointer Uniform %6 
                                         i32 %372 = OpConstant 7 
                                         i32 %409 = OpConstant 4 
                                             %427 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %430 = OpTypeArray %6 %195 
                                             %431 = OpTypeStruct %7 %6 %430 
                                             %432 = OpTypePointer Output %431 
        Output struct {f32_4; f32; f32[1];}* %433 = OpVariable Output 
                                             %439 = OpTypePointer Output %142 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %441 = OpVariable Input 
                                             %444 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Uniform f32_4* %23 = OpAccessChain %18 %20 %21 
                                        f32_4 %24 = OpLoad %23 
                               Uniform f32_4* %26 = OpAccessChain %18 %25 %21 
                                        f32_4 %27 = OpLoad %26 
                                        f32_4 %28 = OpVectorShuffle %27 %27 1 1 1 1 
                                        f32_4 %29 = OpFMul %24 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %31 = OpAccessChain %18 %20 %30 
                                        f32_4 %32 = OpLoad %31 
                               Uniform f32_4* %33 = OpAccessChain %18 %25 %21 
                                        f32_4 %34 = OpLoad %33 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                                        f32_4 %36 = OpFMul %32 %35 
                                        f32_4 %37 = OpLoad %9 
                                        f32_4 %38 = OpFAdd %36 %37 
                                                      OpStore %9 %38 
                               Uniform f32_4* %39 = OpAccessChain %18 %20 %20 
                                        f32_4 %40 = OpLoad %39 
                               Uniform f32_4* %41 = OpAccessChain %18 %25 %21 
                                        f32_4 %42 = OpLoad %41 
                                        f32_4 %43 = OpVectorShuffle %42 %42 2 2 2 2 
                                        f32_4 %44 = OpFMul %40 %43 
                                        f32_4 %45 = OpLoad %9 
                                        f32_4 %46 = OpFAdd %44 %45 
                                                      OpStore %9 %46 
                               Uniform f32_4* %47 = OpAccessChain %18 %20 %25 
                                        f32_4 %48 = OpLoad %47 
                               Uniform f32_4* %49 = OpAccessChain %18 %25 %21 
                                        f32_4 %50 = OpLoad %49 
                                        f32_4 %51 = OpVectorShuffle %50 %50 3 3 3 3 
                                        f32_4 %52 = OpFMul %48 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %9 %54 
                                        f32_4 %55 = OpLoad %9 
                                        f32_3 %59 = OpLoad %58 
                                        f32_4 %60 = OpVectorShuffle %59 %59 1 1 1 1 
                                        f32_4 %61 = OpFMul %55 %60 
                                                      OpStore %9 %61 
                               Uniform f32_4* %63 = OpAccessChain %18 %20 %21 
                                        f32_4 %64 = OpLoad %63 
                               Uniform f32_4* %65 = OpAccessChain %18 %25 %30 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpVectorShuffle %66 %66 1 1 1 1 
                                        f32_4 %68 = OpFMul %64 %67 
                                                      OpStore %62 %68 
                               Uniform f32_4* %69 = OpAccessChain %18 %20 %30 
                                        f32_4 %70 = OpLoad %69 
                               Uniform f32_4* %71 = OpAccessChain %18 %25 %30 
                                        f32_4 %72 = OpLoad %71 
                                        f32_4 %73 = OpVectorShuffle %72 %72 0 0 0 0 
                                        f32_4 %74 = OpFMul %70 %73 
                                        f32_4 %75 = OpLoad %62 
                                        f32_4 %76 = OpFAdd %74 %75 
                                                      OpStore %62 %76 
                               Uniform f32_4* %77 = OpAccessChain %18 %20 %20 
                                        f32_4 %78 = OpLoad %77 
                               Uniform f32_4* %79 = OpAccessChain %18 %25 %30 
                                        f32_4 %80 = OpLoad %79 
                                        f32_4 %81 = OpVectorShuffle %80 %80 2 2 2 2 
                                        f32_4 %82 = OpFMul %78 %81 
                                        f32_4 %83 = OpLoad %62 
                                        f32_4 %84 = OpFAdd %82 %83 
                                                      OpStore %62 %84 
                               Uniform f32_4* %85 = OpAccessChain %18 %20 %25 
                                        f32_4 %86 = OpLoad %85 
                               Uniform f32_4* %87 = OpAccessChain %18 %25 %30 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpVectorShuffle %88 %88 3 3 3 3 
                                        f32_4 %90 = OpFMul %86 %89 
                                        f32_4 %91 = OpLoad %62 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %62 %92 
                                        f32_3 %93 = OpLoad %58 
                                        f32_4 %94 = OpVectorShuffle %93 %93 0 0 0 0 
                                        f32_4 %95 = OpLoad %62 
                                        f32_4 %96 = OpFMul %94 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpFAdd %96 %97 
                                                      OpStore %9 %98 
                               Uniform f32_4* %99 = OpAccessChain %18 %20 %21 
                                       f32_4 %100 = OpLoad %99 
                              Uniform f32_4* %101 = OpAccessChain %18 %25 %20 
                                       f32_4 %102 = OpLoad %101 
                                       f32_4 %103 = OpVectorShuffle %102 %102 1 1 1 1 
                                       f32_4 %104 = OpFMul %100 %103 
                                                      OpStore %62 %104 
                              Uniform f32_4* %105 = OpAccessChain %18 %20 %30 
                                       f32_4 %106 = OpLoad %105 
                              Uniform f32_4* %107 = OpAccessChain %18 %25 %20 
                                       f32_4 %108 = OpLoad %107 
                                       f32_4 %109 = OpVectorShuffle %108 %108 0 0 0 0 
                                       f32_4 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %62 
                                       f32_4 %112 = OpFAdd %110 %111 
                                                      OpStore %62 %112 
                              Uniform f32_4* %113 = OpAccessChain %18 %20 %20 
                                       f32_4 %114 = OpLoad %113 
                              Uniform f32_4* %115 = OpAccessChain %18 %25 %20 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpVectorShuffle %116 %116 2 2 2 2 
                                       f32_4 %118 = OpFMul %114 %117 
                                       f32_4 %119 = OpLoad %62 
                                       f32_4 %120 = OpFAdd %118 %119 
                                                      OpStore %62 %120 
                              Uniform f32_4* %121 = OpAccessChain %18 %20 %25 
                                       f32_4 %122 = OpLoad %121 
                              Uniform f32_4* %123 = OpAccessChain %18 %25 %20 
                                       f32_4 %124 = OpLoad %123 
                                       f32_4 %125 = OpVectorShuffle %124 %124 3 3 3 3 
                                       f32_4 %126 = OpFMul %122 %125 
                                       f32_4 %127 = OpLoad %62 
                                       f32_4 %128 = OpFAdd %126 %127 
                                                      OpStore %62 %128 
                                       f32_3 %129 = OpLoad %58 
                                       f32_4 %130 = OpVectorShuffle %129 %129 2 2 2 2 
                                       f32_4 %131 = OpLoad %62 
                                       f32_4 %132 = OpFMul %130 %131 
                                       f32_4 %133 = OpLoad %9 
                                       f32_4 %134 = OpFAdd %132 %133 
                                                      OpStore %62 %134 
                                       f32_4 %137 = OpLoad %62 
                                       f32_4 %138 = OpLoad %62 
                                         f32 %139 = OpDot %137 %138 
                                                      OpStore %136 %139 
                                         f32 %140 = OpLoad %136 
                                         f32 %141 = OpExtInst %1 32 %140 
                                                      OpStore %136 %141 
                                       f32_4 %143 = OpLoad %62 
                                       f32_2 %144 = OpVectorShuffle %143 %143 0 2 
                                         f32 %145 = OpLoad %136 
                                       f32_2 %146 = OpCompositeConstruct %145 %145 
                                       f32_2 %147 = OpFMul %144 %146 
                                       f32_3 %148 = OpLoad %58 
                                       f32_2 %149 = OpVectorShuffle %148 %148 0 2 
                                       f32_2 %150 = OpFNegate %149 
                                       f32_2 %151 = OpFAdd %147 %150 
                                       f32_4 %152 = OpLoad %62 
                                       f32_4 %153 = OpVectorShuffle %152 %151 4 5 2 3 
                                                      OpStore %62 %153 
                                  Input f32* %158 = OpAccessChain %155 %156 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpExtInst %1 4 %159 
                                         f32 %161 = OpFNegate %160 
                                         f32 %163 = OpFAdd %161 %162 
                                                      OpStore %136 %163 
                                         f32 %164 = OpLoad %136 
                                       f32_2 %165 = OpCompositeConstruct %164 %164 
                                       f32_4 %166 = OpLoad %62 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFMul %165 %167 
                                       f32_3 %169 = OpLoad %58 
                                       f32_2 %170 = OpVectorShuffle %169 %169 0 2 
                                       f32_2 %171 = OpFAdd %168 %170 
                                       f32_4 %172 = OpLoad %62 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 2 3 
                                                      OpStore %62 %173 
                                       f32_4 %174 = OpLoad %9 
                                       f32_3 %175 = OpVectorShuffle %174 %174 0 1 2 
                                         f32 %176 = OpLoad %136 
                                       f32_3 %177 = OpCompositeConstruct %176 %176 %176 
                                       f32_3 %178 = OpFMul %175 %177 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFAdd %178 %181 
                                       f32_4 %183 = OpLoad %9 
                                       f32_4 %184 = OpVectorShuffle %183 %182 4 5 6 3 
                                                      OpStore %9 %184 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 1 2 
                              Uniform f32_4* %188 = OpAccessChain %18 %187 
                                       f32_4 %189 = OpLoad %188 
                                       f32_3 %190 = OpVectorShuffle %189 %189 0 1 2 
                                       f32_3 %191 = OpFMul %186 %190 
                                       f32_4 %192 = OpLoad %9 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 5 6 3 
                                                      OpStore %9 %193 
                                  Input f32* %196 = OpAccessChain %194 %195 
                                         f32 %197 = OpLoad %196 
                                         f32 %199 = OpFMul %197 %198 
                                                      OpStore %136 %199 
                                       f32_4 %200 = OpLoad %62 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 1 
                                         f32 %202 = OpLoad %136 
                                       f32_2 %203 = OpCompositeConstruct %202 %202 
                                       f32_2 %204 = OpFMul %201 %203 
                                       f32_4 %205 = OpLoad %62 
                                       f32_4 %206 = OpVectorShuffle %205 %204 4 1 5 3 
                                                      OpStore %62 %206 
                              Uniform f32_4* %207 = OpAccessChain %18 %21 %25 
                                       f32_4 %208 = OpLoad %207 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 2 
                                         f32 %211 = OpDot %209 %210 
                                                      OpStore %136 %211 
                                         f32 %213 = OpLoad %136 
                                  Input f32* %215 = OpAccessChain %194 %214 
                                         f32 %216 = OpLoad %215 
                                         f32 %217 = OpFAdd %213 %216 
                                Private f32* %218 = OpAccessChain %212 %195 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %212 %195 
                                         f32 %220 = OpLoad %219 
                                  Input f32* %221 = OpAccessChain %194 %195 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFAdd %220 %222 
                                                      OpStore %136 %223 
                                       f32_4 %224 = OpLoad %9 
                                       f32_3 %225 = OpVectorShuffle %224 %224 0 1 2 
                                         f32 %226 = OpLoad %136 
                                       f32_3 %227 = OpCompositeConstruct %226 %226 %226 
                                         f32 %228 = OpDot %225 %227 
                                Private f32* %229 = OpAccessChain %212 %214 
                                                      OpStore %229 %228 
                                       f32_4 %230 = OpLoad %212 
                                       f32_4 %231 = OpVectorShuffle %230 %230 0 0 1 1 
                              Uniform f32_4* %232 = OpAccessChain %18 %30 
                                       f32_4 %233 = OpLoad %232 
                                       f32_4 %234 = OpVectorShuffle %233 %233 1 1 1 1 
                                       f32_4 %235 = OpFAdd %231 %234 
                                                      OpStore %212 %235 
                                       f32_4 %236 = OpLoad %212 
                                       f32_4 %242 = OpFMul %236 %241 
                                                      OpStore %212 %242 
                                       f32_4 %243 = OpLoad %212 
                                       f32_4 %244 = OpExtInst %1 10 %243 
                                                      OpStore %212 %244 
                                       f32_4 %245 = OpLoad %212 
                                       f32_4 %248 = OpFMul %245 %247 
                                       f32_4 %251 = OpFAdd %248 %250 
                                                      OpStore %212 %251 
                                       f32_4 %252 = OpLoad %212 
                                       f32_4 %253 = OpExtInst %1 10 %252 
                                                      OpStore %212 %253 
                                       f32_4 %254 = OpLoad %212 
                                       f32_4 %255 = OpFMul %254 %247 
                                       f32_4 %258 = OpFAdd %255 %257 
                                                      OpStore %212 %258 
                                       f32_4 %260 = OpLoad %212 
                                       f32_4 %261 = OpExtInst %1 4 %260 
                                       f32_4 %262 = OpLoad %212 
                                       f32_4 %263 = OpExtInst %1 4 %262 
                                       f32_4 %264 = OpFMul %261 %263 
                                                      OpStore %259 %264 
                                       f32_4 %265 = OpLoad %212 
                                       f32_4 %266 = OpExtInst %1 4 %265 
                                       f32_4 %267 = OpFNegate %266 
                                       f32_4 %268 = OpFMul %267 %247 
                                       f32_4 %271 = OpFAdd %268 %270 
                                                      OpStore %212 %271 
                                       f32_4 %272 = OpLoad %212 
                                       f32_4 %273 = OpLoad %259 
                                       f32_4 %274 = OpFMul %272 %273 
                                                      OpStore %212 %274 
                                       f32_4 %275 = OpLoad %212 
                                       f32_2 %276 = OpVectorShuffle %275 %275 1 3 
                                       f32_4 %277 = OpLoad %212 
                                       f32_2 %278 = OpVectorShuffle %277 %277 0 2 
                                       f32_2 %279 = OpFAdd %276 %278 
                                       f32_4 %280 = OpLoad %212 
                                       f32_4 %281 = OpVectorShuffle %280 %279 4 5 2 3 
                                                      OpStore %212 %281 
                                       f32_4 %282 = OpLoad %212 
                                       f32_3 %283 = OpVectorShuffle %282 %282 1 1 1 
                              Uniform f32_4* %285 = OpAccessChain %18 %284 
                                       f32_4 %286 = OpLoad %285 
                                       f32_3 %287 = OpVectorShuffle %286 %286 0 1 2 
                                       f32_3 %288 = OpFMul %283 %287 
                                       f32_4 %289 = OpLoad %259 
                                       f32_4 %290 = OpVectorShuffle %289 %288 4 5 6 3 
                                                      OpStore %259 %290 
                                       f32_4 %291 = OpLoad %259 
                                       f32_3 %292 = OpVectorShuffle %291 %291 0 1 2 
                                       f32_4 %294 = OpLoad %293 
                                       f32_3 %295 = OpVectorShuffle %294 %294 1 1 1 
                                       f32_3 %296 = OpFMul %292 %295 
                                       f32_4 %297 = OpLoad %259 
                                       f32_4 %298 = OpVectorShuffle %297 %296 4 5 6 3 
                                                      OpStore %259 %298 
                                Private f32* %299 = OpAccessChain %212 %195 
                                         f32 %300 = OpLoad %299 
                                  Input f32* %301 = OpAccessChain %293 %195 
                                         f32 %302 = OpLoad %301 
                                         f32 %303 = OpFMul %300 %302 
                                Private f32* %304 = OpAccessChain %62 %195 
                                                      OpStore %304 %303 
                                Private f32* %307 = OpAccessChain %212 %306 
                                                      OpStore %307 %305 
                                       f32_4 %308 = OpLoad %212 
                                       f32_3 %309 = OpVectorShuffle %308 %308 0 2 0 
                                       f32_4 %310 = OpLoad %62 
                                       f32_3 %311 = OpVectorShuffle %310 %310 0 1 2 
                                       f32_3 %312 = OpFMul %309 %311 
                                       f32_4 %313 = OpLoad %259 
                                       f32_3 %314 = OpVectorShuffle %313 %313 0 1 2 
                                       f32_3 %315 = OpFAdd %312 %314 
                                       f32_4 %316 = OpLoad %62 
                                       f32_4 %317 = OpVectorShuffle %316 %315 4 5 6 3 
                                                      OpStore %62 %317 
                                       f32_4 %318 = OpLoad %62 
                                       f32_3 %319 = OpVectorShuffle %318 %318 0 1 2 
                              Uniform f32_4* %320 = OpAccessChain %18 %284 
                                       f32_4 %321 = OpLoad %320 
                                       f32_3 %322 = OpVectorShuffle %321 %321 3 3 3 
                                       f32_3 %323 = OpFMul %319 %322 
                                       f32_4 %324 = OpLoad %9 
                                       f32_3 %325 = OpVectorShuffle %324 %324 0 1 2 
                                       f32_3 %326 = OpFAdd %323 %325 
                                       f32_4 %327 = OpLoad %9 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 6 3 
                                                      OpStore %9 %328 
                                       f32_4 %329 = OpLoad %293 
                                       f32_3 %330 = OpVectorShuffle %329 %329 0 0 0 
                              Uniform f32_4* %331 = OpAccessChain %18 %284 
                                       f32_4 %332 = OpLoad %331 
                                       f32_3 %333 = OpVectorShuffle %332 %332 0 1 2 
                                       f32_3 %334 = OpFMul %330 %333 
                                       f32_4 %335 = OpLoad %9 
                                       f32_3 %336 = OpVectorShuffle %335 %335 0 1 2 
                                       f32_3 %337 = OpFAdd %334 %336 
                                       f32_4 %338 = OpLoad %9 
                                       f32_4 %339 = OpVectorShuffle %338 %337 4 5 6 3 
                                                      OpStore %9 %339 
                              Uniform f32_4* %341 = OpAccessChain %18 %340 
                                       f32_4 %342 = OpLoad %341 
                                       f32_3 %343 = OpVectorShuffle %342 %342 0 1 2 
                                       f32_4 %344 = OpLoad %9 
                                       f32_3 %345 = OpVectorShuffle %344 %344 0 1 2 
                                         f32 %346 = OpDot %343 %345 
                                                      OpStore %136 %346 
                                         f32 %347 = OpLoad %136 
                                Uniform f32* %349 = OpAccessChain %18 %340 %156 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpFAdd %347 %350 
                                                      OpStore %136 %351 
                                         f32 %352 = OpLoad %136 
                                       f32_3 %353 = OpCompositeConstruct %352 %352 %352 
                                       f32_3 %354 = OpFNegate %353 
                              Uniform f32_4* %355 = OpAccessChain %18 %340 
                                       f32_4 %356 = OpLoad %355 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                                       f32_3 %358 = OpFMul %354 %357 
                                       f32_4 %359 = OpLoad %9 
                                       f32_3 %360 = OpVectorShuffle %359 %359 0 1 2 
                                       f32_3 %361 = OpFAdd %358 %360 
                                       f32_4 %362 = OpLoad %62 
                                       f32_4 %363 = OpVectorShuffle %362 %361 4 5 6 3 
                                                      OpStore %62 %363 
                                       f32_4 %364 = OpLoad %9 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_4 %366 = OpLoad %62 
                                       f32_3 %367 = OpVectorShuffle %366 %366 0 1 2 
                                       f32_3 %368 = OpFNegate %367 
                                       f32_3 %369 = OpFAdd %365 %368 
                                       f32_4 %370 = OpLoad %9 
                                       f32_4 %371 = OpVectorShuffle %370 %369 4 5 6 3 
                                                      OpStore %9 %371 
                                Uniform f32* %373 = OpAccessChain %18 %372 
                                         f32 %374 = OpLoad %373 
                                       f32_3 %375 = OpCompositeConstruct %374 %374 %374 
                                       f32_4 %376 = OpLoad %9 
                                       f32_3 %377 = OpVectorShuffle %376 %376 0 1 2 
                                       f32_3 %378 = OpFMul %375 %377 
                                       f32_4 %379 = OpLoad %62 
                                       f32_3 %380 = OpVectorShuffle %379 %379 0 1 2 
                                       f32_3 %381 = OpFAdd %378 %380 
                                       f32_4 %382 = OpLoad %9 
                                       f32_4 %383 = OpVectorShuffle %382 %381 4 5 6 3 
                                                      OpStore %9 %383 
                                       f32_4 %384 = OpLoad %9 
                                       f32_4 %385 = OpVectorShuffle %384 %384 1 1 1 1 
                              Uniform f32_4* %386 = OpAccessChain %18 %21 %21 
                                       f32_4 %387 = OpLoad %386 
                                       f32_4 %388 = OpFMul %385 %387 
                                                      OpStore %62 %388 
                              Uniform f32_4* %389 = OpAccessChain %18 %21 %30 
                                       f32_4 %390 = OpLoad %389 
                                       f32_4 %391 = OpLoad %9 
                                       f32_4 %392 = OpVectorShuffle %391 %391 0 0 0 0 
                                       f32_4 %393 = OpFMul %390 %392 
                                       f32_4 %394 = OpLoad %62 
                                       f32_4 %395 = OpFAdd %393 %394 
                                                      OpStore %62 %395 
                              Uniform f32_4* %396 = OpAccessChain %18 %21 %20 
                                       f32_4 %397 = OpLoad %396 
                                       f32_4 %398 = OpLoad %9 
                                       f32_4 %399 = OpVectorShuffle %398 %398 2 2 2 2 
                                       f32_4 %400 = OpFMul %397 %399 
                                       f32_4 %401 = OpLoad %62 
                                       f32_4 %402 = OpFAdd %400 %401 
                                                      OpStore %9 %402 
                                       f32_4 %403 = OpLoad %9 
                              Uniform f32_4* %404 = OpAccessChain %18 %21 %25 
                                       f32_4 %405 = OpLoad %404 
                                       f32_4 %406 = OpFAdd %403 %405 
                                                      OpStore %9 %406 
                                       f32_4 %407 = OpLoad %9 
                                       f32_4 %408 = OpVectorShuffle %407 %407 1 1 1 1 
                              Uniform f32_4* %410 = OpAccessChain %18 %409 %21 
                                       f32_4 %411 = OpLoad %410 
                                       f32_4 %412 = OpFMul %408 %411 
                                                      OpStore %62 %412 
                              Uniform f32_4* %413 = OpAccessChain %18 %409 %30 
                                       f32_4 %414 = OpLoad %413 
                                       f32_4 %415 = OpLoad %9 
                                       f32_4 %416 = OpVectorShuffle %415 %415 0 0 0 0 
                                       f32_4 %417 = OpFMul %414 %416 
                                       f32_4 %418 = OpLoad %62 
                                       f32_4 %419 = OpFAdd %417 %418 
                                                      OpStore %62 %419 
                              Uniform f32_4* %420 = OpAccessChain %18 %409 %20 
                                       f32_4 %421 = OpLoad %420 
                                       f32_4 %422 = OpLoad %9 
                                       f32_4 %423 = OpVectorShuffle %422 %422 2 2 2 2 
                                       f32_4 %424 = OpFMul %421 %423 
                                       f32_4 %425 = OpLoad %62 
                                       f32_4 %426 = OpFAdd %424 %425 
                                                      OpStore %62 %426 
                                       f32_4 %429 = OpLoad %9 
                                                      OpStore vs_TEXCOORD1 %429 
                                       f32_4 %434 = OpLoad %62 
                              Uniform f32_4* %435 = OpAccessChain %18 %409 %25 
                                       f32_4 %436 = OpLoad %435 
                                       f32_4 %437 = OpFAdd %434 %436 
                               Output f32_4* %438 = OpAccessChain %433 %30 
                                                      OpStore %438 %437 
                                       f32_4 %442 = OpLoad %441 
                                       f32_2 %443 = OpVectorShuffle %442 %442 0 1 
                                                      OpStore vs_TEXCOORD0 %443 
                                 Output f32* %445 = OpAccessChain %433 %30 %195 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpFNegate %446 
                                 Output f32* %448 = OpAccessChain %433 %30 %195 
                                                      OpStore %448 %447 
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
                                             OpEntryPoint Fragment %4 "main" %21 %56 %58 
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
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate vs_TEXCOORD1 Location 58 
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
                                     %30 = OpTypeStruct %6 
                                     %31 = OpTypePointer Uniform %30 
              Uniform struct {f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 0 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 1 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 i32 %48 = OpSelect %46 %47 %34 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %34 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                               f32_4 %59 = OpLoad vs_TEXCOORD1 
                                             OpStore %56 %59 
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
 Tags { "DisableBatching" = "true" "RenderType" = "TreeOpaque" }
 Pass {
  Tags { "DisableBatching" = "true" "RenderType" = "TreeOpaque" }
  GpuProgramID 303200
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
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_TEXCOORD0;
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
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_TEXCOORD0;
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
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_TEXCOORD0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 197
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %78 %179 %185 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 179 
                                                      OpMemberDecorate %183 0 BuiltIn 183 
                                                      OpMemberDecorate %183 1 BuiltIn 183 
                                                      OpMemberDecorate %183 2 BuiltIn 183 
                                                      OpDecorate %183 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeStruct %17 %18 %7 %19 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %7 
                               Private f32_4* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 3 
                                          i32 %36 = OpConstant 1 
                                          i32 %43 = OpConstant 0 
                                 Input f32_4* %78 = OpVariable Input 
                                              %89 = OpTypePointer Private %6 
                                 Private f32* %90 = OpVariable Private 
                                          i32 %91 = OpConstant 4 
                                          u32 %99 = OpConstant 3 
                                             %100 = OpTypePointer Uniform %6 
                                         i32 %124 = OpConstant 5 
                                             %178 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                         u32 %181 = OpConstant 1 
                                             %182 = OpTypeArray %6 %181 
                                             %183 = OpTypeStruct %7 %6 %182 
                                             %184 = OpTypePointer Output %183 
        Output struct {f32_4; f32; f32[1];}* %185 = OpVariable Output 
                                             %191 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                        f32_3 %29 = OpFMul %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %22 %35 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %34 %39 
                                        f32_4 %41 = OpLoad %32 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %32 %42 
                               Uniform f32_4* %44 = OpAccessChain %22 %35 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %46 %48 
                                        f32_4 %50 = OpLoad %32 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %32 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %32 %54 
                               Uniform f32_4* %55 = OpAccessChain %22 %35 %24 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %32 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %32 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %32 %65 
                                        f32_4 %66 = OpLoad %11 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFNegate %67 
                               Uniform f32_4* %69 = OpAccessChain %22 %24 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %32 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %32 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %32 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 3 3 3 
                                        f32_4 %81 = OpLoad %32 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                               Uniform f32_4* %92 = OpAccessChain %22 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                          f32 %97 = OpDot %94 %96 
                                                      OpStore %90 %97 
                                          f32 %98 = OpLoad %90 
                                Uniform f32* %101 = OpAccessChain %22 %91 %99 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFAdd %98 %102 
                                                      OpStore %90 %103 
                                         f32 %104 = OpLoad %90 
                                       f32_3 %105 = OpCompositeConstruct %104 %104 %104 
                                       f32_3 %106 = OpFNegate %105 
                              Uniform f32_4* %107 = OpAccessChain %22 %91 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFAdd %110 %112 
                                       f32_4 %114 = OpLoad %32 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %32 %115 
                                       f32_4 %116 = OpLoad %9 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_4 %118 = OpLoad %32 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFNegate %119 
                                       f32_3 %121 = OpFAdd %117 %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %9 %123 
                                Uniform f32* %125 = OpAccessChain %22 %124 
                                         f32 %126 = OpLoad %125 
                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %32 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %43 %36 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %32 %140 
                              Uniform f32_4* %141 = OpAccessChain %22 %43 %43 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %32 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %32 %147 
                              Uniform f32_4* %148 = OpAccessChain %22 %43 %24 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %32 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %9 %154 
                                       f32_4 %155 = OpLoad %9 
                              Uniform f32_4* %156 = OpAccessChain %22 %43 %35 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpFAdd %155 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %22 %36 %36 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFMul %160 %162 
                                                      OpStore %32 %163 
                              Uniform f32_4* %164 = OpAccessChain %22 %36 %43 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 0 0 0 
                                       f32_4 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %32 
                                       f32_4 %170 = OpFAdd %168 %169 
                                                      OpStore %32 %170 
                              Uniform f32_4* %171 = OpAccessChain %22 %36 %24 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 2 2 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %32 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %32 %177 
                                       f32_4 %180 = OpLoad %9 
                                                      OpStore vs_TEXCOORD0 %180 
                                       f32_4 %186 = OpLoad %32 
                              Uniform f32_4* %187 = OpAccessChain %22 %36 %35 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFAdd %186 %188 
                               Output f32_4* %190 = OpAccessChain %185 %43 
                                                      OpStore %190 %189 
                                 Output f32* %192 = OpAccessChain %185 %43 %181 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFNegate %193 
                                 Output f32* %195 = OpAccessChain %185 %43 %181 
                                                      OpStore %195 %194 
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
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate %9 Location 9 
                              OpDecorate vs_TEXCOORD0 Location 11 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 4 
                       %8 = OpTypePointer Output %7 
         Output f32_4* %9 = OpVariable Output 
                      %10 = OpTypePointer Input %7 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                f32_4 %12 = OpLoad vs_TEXCOORD0 
                              OpStore %9 %12 
                              OpReturn
                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 197
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %78 %179 %185 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 179 
                                                      OpMemberDecorate %183 0 BuiltIn 183 
                                                      OpMemberDecorate %183 1 BuiltIn 183 
                                                      OpMemberDecorate %183 2 BuiltIn 183 
                                                      OpDecorate %183 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeStruct %17 %18 %7 %19 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %7 
                               Private f32_4* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 3 
                                          i32 %36 = OpConstant 1 
                                          i32 %43 = OpConstant 0 
                                 Input f32_4* %78 = OpVariable Input 
                                              %89 = OpTypePointer Private %6 
                                 Private f32* %90 = OpVariable Private 
                                          i32 %91 = OpConstant 4 
                                          u32 %99 = OpConstant 3 
                                             %100 = OpTypePointer Uniform %6 
                                         i32 %124 = OpConstant 5 
                                             %178 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                         u32 %181 = OpConstant 1 
                                             %182 = OpTypeArray %6 %181 
                                             %183 = OpTypeStruct %7 %6 %182 
                                             %184 = OpTypePointer Output %183 
        Output struct {f32_4; f32; f32[1];}* %185 = OpVariable Output 
                                             %191 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                        f32_3 %29 = OpFMul %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %22 %35 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %34 %39 
                                        f32_4 %41 = OpLoad %32 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %32 %42 
                               Uniform f32_4* %44 = OpAccessChain %22 %35 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %46 %48 
                                        f32_4 %50 = OpLoad %32 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %32 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %32 %54 
                               Uniform f32_4* %55 = OpAccessChain %22 %35 %24 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %32 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %32 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %32 %65 
                                        f32_4 %66 = OpLoad %11 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFNegate %67 
                               Uniform f32_4* %69 = OpAccessChain %22 %24 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %32 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %32 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %32 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 3 3 3 
                                        f32_4 %81 = OpLoad %32 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                               Uniform f32_4* %92 = OpAccessChain %22 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                          f32 %97 = OpDot %94 %96 
                                                      OpStore %90 %97 
                                          f32 %98 = OpLoad %90 
                                Uniform f32* %101 = OpAccessChain %22 %91 %99 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFAdd %98 %102 
                                                      OpStore %90 %103 
                                         f32 %104 = OpLoad %90 
                                       f32_3 %105 = OpCompositeConstruct %104 %104 %104 
                                       f32_3 %106 = OpFNegate %105 
                              Uniform f32_4* %107 = OpAccessChain %22 %91 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFAdd %110 %112 
                                       f32_4 %114 = OpLoad %32 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %32 %115 
                                       f32_4 %116 = OpLoad %9 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_4 %118 = OpLoad %32 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFNegate %119 
                                       f32_3 %121 = OpFAdd %117 %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %9 %123 
                                Uniform f32* %125 = OpAccessChain %22 %124 
                                         f32 %126 = OpLoad %125 
                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %32 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %43 %36 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %32 %140 
                              Uniform f32_4* %141 = OpAccessChain %22 %43 %43 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %32 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %32 %147 
                              Uniform f32_4* %148 = OpAccessChain %22 %43 %24 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %32 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %9 %154 
                                       f32_4 %155 = OpLoad %9 
                              Uniform f32_4* %156 = OpAccessChain %22 %43 %35 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpFAdd %155 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %22 %36 %36 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFMul %160 %162 
                                                      OpStore %32 %163 
                              Uniform f32_4* %164 = OpAccessChain %22 %36 %43 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 0 0 0 
                                       f32_4 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %32 
                                       f32_4 %170 = OpFAdd %168 %169 
                                                      OpStore %32 %170 
                              Uniform f32_4* %171 = OpAccessChain %22 %36 %24 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 2 2 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %32 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %32 %177 
                                       f32_4 %180 = OpLoad %9 
                                                      OpStore vs_TEXCOORD0 %180 
                                       f32_4 %186 = OpLoad %32 
                              Uniform f32_4* %187 = OpAccessChain %22 %36 %35 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFAdd %186 %188 
                               Output f32_4* %190 = OpAccessChain %185 %43 
                                                      OpStore %190 %189 
                                 Output f32* %192 = OpAccessChain %185 %43 %181 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFNegate %193 
                                 Output f32* %195 = OpAccessChain %185 %43 %181 
                                                      OpStore %195 %194 
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
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate %9 Location 9 
                              OpDecorate vs_TEXCOORD0 Location 11 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 4 
                       %8 = OpTypePointer Output %7 
         Output f32_4* %9 = OpVariable Output 
                      %10 = OpTypePointer Input %7 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                f32_4 %12 = OpLoad vs_TEXCOORD0 
                              OpStore %9 %12 
                              OpReturn
                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 197
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %78 %179 %185 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 179 
                                                      OpMemberDecorate %183 0 BuiltIn 183 
                                                      OpMemberDecorate %183 1 BuiltIn 183 
                                                      OpMemberDecorate %183 2 BuiltIn 183 
                                                      OpDecorate %183 Block 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeStruct %17 %18 %7 %19 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %7 
                               Private f32_4* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 3 
                                          i32 %36 = OpConstant 1 
                                          i32 %43 = OpConstant 0 
                                 Input f32_4* %78 = OpVariable Input 
                                              %89 = OpTypePointer Private %6 
                                 Private f32* %90 = OpVariable Private 
                                          i32 %91 = OpConstant 4 
                                          u32 %99 = OpConstant 3 
                                             %100 = OpTypePointer Uniform %6 
                                         i32 %124 = OpConstant 5 
                                             %178 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                         u32 %181 = OpConstant 1 
                                             %182 = OpTypeArray %6 %181 
                                             %183 = OpTypeStruct %7 %6 %182 
                                             %184 = OpTypePointer Output %183 
        Output struct {f32_4; f32; f32[1];}* %185 = OpVariable Output 
                                             %191 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                        f32_3 %29 = OpFMul %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %22 %35 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %34 %39 
                                        f32_4 %41 = OpLoad %32 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %32 %42 
                               Uniform f32_4* %44 = OpAccessChain %22 %35 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %46 %48 
                                        f32_4 %50 = OpLoad %32 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %32 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %32 %54 
                               Uniform f32_4* %55 = OpAccessChain %22 %35 %24 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %32 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %32 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %32 %65 
                                        f32_4 %66 = OpLoad %11 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFNegate %67 
                               Uniform f32_4* %69 = OpAccessChain %22 %24 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %32 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %32 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %32 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 3 3 3 
                                        f32_4 %81 = OpLoad %32 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                               Uniform f32_4* %92 = OpAccessChain %22 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                          f32 %97 = OpDot %94 %96 
                                                      OpStore %90 %97 
                                          f32 %98 = OpLoad %90 
                                Uniform f32* %101 = OpAccessChain %22 %91 %99 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFAdd %98 %102 
                                                      OpStore %90 %103 
                                         f32 %104 = OpLoad %90 
                                       f32_3 %105 = OpCompositeConstruct %104 %104 %104 
                                       f32_3 %106 = OpFNegate %105 
                              Uniform f32_4* %107 = OpAccessChain %22 %91 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFAdd %110 %112 
                                       f32_4 %114 = OpLoad %32 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %32 %115 
                                       f32_4 %116 = OpLoad %9 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_4 %118 = OpLoad %32 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFNegate %119 
                                       f32_3 %121 = OpFAdd %117 %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %9 %123 
                                Uniform f32* %125 = OpAccessChain %22 %124 
                                         f32 %126 = OpLoad %125 
                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %32 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %43 %36 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %32 %140 
                              Uniform f32_4* %141 = OpAccessChain %22 %43 %43 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %32 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %32 %147 
                              Uniform f32_4* %148 = OpAccessChain %22 %43 %24 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %32 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %9 %154 
                                       f32_4 %155 = OpLoad %9 
                              Uniform f32_4* %156 = OpAccessChain %22 %43 %35 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpFAdd %155 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %22 %36 %36 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFMul %160 %162 
                                                      OpStore %32 %163 
                              Uniform f32_4* %164 = OpAccessChain %22 %36 %43 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 0 0 0 
                                       f32_4 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %32 
                                       f32_4 %170 = OpFAdd %168 %169 
                                                      OpStore %32 %170 
                              Uniform f32_4* %171 = OpAccessChain %22 %36 %24 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 2 2 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %32 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %32 %177 
                                       f32_4 %180 = OpLoad %9 
                                                      OpStore vs_TEXCOORD0 %180 
                                       f32_4 %186 = OpLoad %32 
                              Uniform f32_4* %187 = OpAccessChain %22 %36 %35 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFAdd %186 %188 
                               Output f32_4* %190 = OpAccessChain %185 %43 
                                                      OpStore %190 %189 
                                 Output f32* %192 = OpAccessChain %185 %43 %181 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFNegate %193 
                                 Output f32* %195 = OpAccessChain %185 %43 %181 
                                                      OpStore %195 %194 
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
                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                              OpDecorate %9 Location 9 
                              OpDecorate vs_TEXCOORD0 Location 11 
                       %2 = OpTypeVoid 
                       %3 = OpTypeFunction %2 
                       %6 = OpTypeFloat 32 
                       %7 = OpTypeVector %6 4 
                       %8 = OpTypePointer Output %7 
         Output f32_4* %9 = OpVariable Output 
                      %10 = OpTypePointer Input %7 
Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                  void %4 = OpFunction None %3 
                       %5 = OpLabel 
                f32_4 %12 = OpLoad vs_TEXCOORD0 
                              OpStore %9 %12 
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
 Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
 Pass {
  Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
  GpuProgramID 330159
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
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
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
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
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
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
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
    SV_Target0 = vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 203
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %78 %179 %185 %193 %194 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 179 
                                                      OpMemberDecorate %183 0 BuiltIn 183 
                                                      OpMemberDecorate %183 1 BuiltIn 183 
                                                      OpMemberDecorate %183 2 BuiltIn 183 
                                                      OpDecorate %183 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 193 
                                                      OpDecorate %194 Location 194 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeStruct %17 %18 %7 %19 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %7 
                               Private f32_4* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 3 
                                          i32 %36 = OpConstant 1 
                                          i32 %43 = OpConstant 0 
                                 Input f32_4* %78 = OpVariable Input 
                                              %89 = OpTypePointer Private %6 
                                 Private f32* %90 = OpVariable Private 
                                          i32 %91 = OpConstant 4 
                                          u32 %99 = OpConstant 3 
                                             %100 = OpTypePointer Uniform %6 
                                         i32 %124 = OpConstant 5 
                                             %178 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %181 = OpConstant 1 
                                             %182 = OpTypeArray %6 %181 
                                             %183 = OpTypeStruct %7 %6 %182 
                                             %184 = OpTypePointer Output %183 
        Output struct {f32_4; f32; f32[1];}* %185 = OpVariable Output 
                                             %191 = OpTypeVector %6 2 
                                             %192 = OpTypePointer Output %191 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %194 = OpVariable Input 
                                             %197 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                        f32_3 %29 = OpFMul %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %22 %35 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %34 %39 
                                        f32_4 %41 = OpLoad %32 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %32 %42 
                               Uniform f32_4* %44 = OpAccessChain %22 %35 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %46 %48 
                                        f32_4 %50 = OpLoad %32 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %32 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %32 %54 
                               Uniform f32_4* %55 = OpAccessChain %22 %35 %24 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %32 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %32 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %32 %65 
                                        f32_4 %66 = OpLoad %11 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFNegate %67 
                               Uniform f32_4* %69 = OpAccessChain %22 %24 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %32 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %32 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %32 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 3 3 3 
                                        f32_4 %81 = OpLoad %32 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                               Uniform f32_4* %92 = OpAccessChain %22 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                          f32 %97 = OpDot %94 %96 
                                                      OpStore %90 %97 
                                          f32 %98 = OpLoad %90 
                                Uniform f32* %101 = OpAccessChain %22 %91 %99 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFAdd %98 %102 
                                                      OpStore %90 %103 
                                         f32 %104 = OpLoad %90 
                                       f32_3 %105 = OpCompositeConstruct %104 %104 %104 
                                       f32_3 %106 = OpFNegate %105 
                              Uniform f32_4* %107 = OpAccessChain %22 %91 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFAdd %110 %112 
                                       f32_4 %114 = OpLoad %32 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %32 %115 
                                       f32_4 %116 = OpLoad %9 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_4 %118 = OpLoad %32 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFNegate %119 
                                       f32_3 %121 = OpFAdd %117 %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %9 %123 
                                Uniform f32* %125 = OpAccessChain %22 %124 
                                         f32 %126 = OpLoad %125 
                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %32 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %43 %36 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %32 %140 
                              Uniform f32_4* %141 = OpAccessChain %22 %43 %43 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %32 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %32 %147 
                              Uniform f32_4* %148 = OpAccessChain %22 %43 %24 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %32 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %9 %154 
                                       f32_4 %155 = OpLoad %9 
                              Uniform f32_4* %156 = OpAccessChain %22 %43 %35 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpFAdd %155 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %22 %36 %36 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFMul %160 %162 
                                                      OpStore %32 %163 
                              Uniform f32_4* %164 = OpAccessChain %22 %36 %43 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 0 0 0 
                                       f32_4 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %32 
                                       f32_4 %170 = OpFAdd %168 %169 
                                                      OpStore %32 %170 
                              Uniform f32_4* %171 = OpAccessChain %22 %36 %24 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 2 2 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %32 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %32 %177 
                                       f32_4 %180 = OpLoad %9 
                                                      OpStore vs_TEXCOORD1 %180 
                                       f32_4 %186 = OpLoad %32 
                              Uniform f32_4* %187 = OpAccessChain %22 %36 %35 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFAdd %186 %188 
                               Output f32_4* %190 = OpAccessChain %185 %43 
                                                      OpStore %190 %189 
                                       f32_4 %195 = OpLoad %194 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                                      OpStore vs_TEXCOORD0 %196 
                                 Output f32* %198 = OpAccessChain %185 %43 %181 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFNegate %199 
                                 Output f32* %201 = OpAccessChain %185 %43 %181 
                                                      OpStore %201 %200 
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
                                             OpEntryPoint Fragment %4 "main" %21 %56 %58 
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
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate vs_TEXCOORD1 Location 58 
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
                                     %30 = OpTypeStruct %6 
                                     %31 = OpTypePointer Uniform %30 
              Uniform struct {f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 0 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 1 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 i32 %48 = OpSelect %46 %47 %34 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %34 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                               f32_4 %59 = OpLoad vs_TEXCOORD1 
                                             OpStore %56 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 203
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %78 %179 %185 %193 %194 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 179 
                                                      OpMemberDecorate %183 0 BuiltIn 183 
                                                      OpMemberDecorate %183 1 BuiltIn 183 
                                                      OpMemberDecorate %183 2 BuiltIn 183 
                                                      OpDecorate %183 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 193 
                                                      OpDecorate %194 Location 194 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeStruct %17 %18 %7 %19 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %7 
                               Private f32_4* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 3 
                                          i32 %36 = OpConstant 1 
                                          i32 %43 = OpConstant 0 
                                 Input f32_4* %78 = OpVariable Input 
                                              %89 = OpTypePointer Private %6 
                                 Private f32* %90 = OpVariable Private 
                                          i32 %91 = OpConstant 4 
                                          u32 %99 = OpConstant 3 
                                             %100 = OpTypePointer Uniform %6 
                                         i32 %124 = OpConstant 5 
                                             %178 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %181 = OpConstant 1 
                                             %182 = OpTypeArray %6 %181 
                                             %183 = OpTypeStruct %7 %6 %182 
                                             %184 = OpTypePointer Output %183 
        Output struct {f32_4; f32; f32[1];}* %185 = OpVariable Output 
                                             %191 = OpTypeVector %6 2 
                                             %192 = OpTypePointer Output %191 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %194 = OpVariable Input 
                                             %197 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                        f32_3 %29 = OpFMul %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %22 %35 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %34 %39 
                                        f32_4 %41 = OpLoad %32 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %32 %42 
                               Uniform f32_4* %44 = OpAccessChain %22 %35 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %46 %48 
                                        f32_4 %50 = OpLoad %32 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %32 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %32 %54 
                               Uniform f32_4* %55 = OpAccessChain %22 %35 %24 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %32 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %32 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %32 %65 
                                        f32_4 %66 = OpLoad %11 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFNegate %67 
                               Uniform f32_4* %69 = OpAccessChain %22 %24 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %32 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %32 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %32 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 3 3 3 
                                        f32_4 %81 = OpLoad %32 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                               Uniform f32_4* %92 = OpAccessChain %22 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                          f32 %97 = OpDot %94 %96 
                                                      OpStore %90 %97 
                                          f32 %98 = OpLoad %90 
                                Uniform f32* %101 = OpAccessChain %22 %91 %99 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFAdd %98 %102 
                                                      OpStore %90 %103 
                                         f32 %104 = OpLoad %90 
                                       f32_3 %105 = OpCompositeConstruct %104 %104 %104 
                                       f32_3 %106 = OpFNegate %105 
                              Uniform f32_4* %107 = OpAccessChain %22 %91 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFAdd %110 %112 
                                       f32_4 %114 = OpLoad %32 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %32 %115 
                                       f32_4 %116 = OpLoad %9 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_4 %118 = OpLoad %32 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFNegate %119 
                                       f32_3 %121 = OpFAdd %117 %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %9 %123 
                                Uniform f32* %125 = OpAccessChain %22 %124 
                                         f32 %126 = OpLoad %125 
                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %32 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %43 %36 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %32 %140 
                              Uniform f32_4* %141 = OpAccessChain %22 %43 %43 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %32 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %32 %147 
                              Uniform f32_4* %148 = OpAccessChain %22 %43 %24 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %32 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %9 %154 
                                       f32_4 %155 = OpLoad %9 
                              Uniform f32_4* %156 = OpAccessChain %22 %43 %35 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpFAdd %155 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %22 %36 %36 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFMul %160 %162 
                                                      OpStore %32 %163 
                              Uniform f32_4* %164 = OpAccessChain %22 %36 %43 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 0 0 0 
                                       f32_4 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %32 
                                       f32_4 %170 = OpFAdd %168 %169 
                                                      OpStore %32 %170 
                              Uniform f32_4* %171 = OpAccessChain %22 %36 %24 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 2 2 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %32 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %32 %177 
                                       f32_4 %180 = OpLoad %9 
                                                      OpStore vs_TEXCOORD1 %180 
                                       f32_4 %186 = OpLoad %32 
                              Uniform f32_4* %187 = OpAccessChain %22 %36 %35 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFAdd %186 %188 
                               Output f32_4* %190 = OpAccessChain %185 %43 
                                                      OpStore %190 %189 
                                       f32_4 %195 = OpLoad %194 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                                      OpStore vs_TEXCOORD0 %196 
                                 Output f32* %198 = OpAccessChain %185 %43 %181 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFNegate %199 
                                 Output f32* %201 = OpAccessChain %185 %43 %181 
                                                      OpStore %201 %200 
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
                                             OpEntryPoint Fragment %4 "main" %21 %56 %58 
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
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate vs_TEXCOORD1 Location 58 
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
                                     %30 = OpTypeStruct %6 
                                     %31 = OpTypePointer Uniform %30 
              Uniform struct {f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 0 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 1 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 i32 %48 = OpSelect %46 %47 %34 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %34 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                               f32_4 %59 = OpLoad vs_TEXCOORD1 
                                             OpStore %56 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 203
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %78 %179 %185 %193 %194 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 179 
                                                      OpMemberDecorate %183 0 BuiltIn 183 
                                                      OpMemberDecorate %183 1 BuiltIn 183 
                                                      OpMemberDecorate %183 2 BuiltIn 183 
                                                      OpDecorate %183 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 193 
                                                      OpDecorate %194 Location 194 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeStruct %17 %18 %7 %19 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %7 
                               Private f32_4* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 3 
                                          i32 %36 = OpConstant 1 
                                          i32 %43 = OpConstant 0 
                                 Input f32_4* %78 = OpVariable Input 
                                              %89 = OpTypePointer Private %6 
                                 Private f32* %90 = OpVariable Private 
                                          i32 %91 = OpConstant 4 
                                          u32 %99 = OpConstant 3 
                                             %100 = OpTypePointer Uniform %6 
                                         i32 %124 = OpConstant 5 
                                             %178 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %181 = OpConstant 1 
                                             %182 = OpTypeArray %6 %181 
                                             %183 = OpTypeStruct %7 %6 %182 
                                             %184 = OpTypePointer Output %183 
        Output struct {f32_4; f32; f32[1];}* %185 = OpVariable Output 
                                             %191 = OpTypeVector %6 2 
                                             %192 = OpTypePointer Output %191 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %194 = OpVariable Input 
                                             %197 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                        f32_3 %29 = OpFMul %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %22 %35 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %34 %39 
                                        f32_4 %41 = OpLoad %32 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %32 %42 
                               Uniform f32_4* %44 = OpAccessChain %22 %35 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %46 %48 
                                        f32_4 %50 = OpLoad %32 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %32 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %32 %54 
                               Uniform f32_4* %55 = OpAccessChain %22 %35 %24 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %32 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %32 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %32 %65 
                                        f32_4 %66 = OpLoad %11 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFNegate %67 
                               Uniform f32_4* %69 = OpAccessChain %22 %24 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %32 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %32 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %32 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 3 3 3 
                                        f32_4 %81 = OpLoad %32 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                               Uniform f32_4* %92 = OpAccessChain %22 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                          f32 %97 = OpDot %94 %96 
                                                      OpStore %90 %97 
                                          f32 %98 = OpLoad %90 
                                Uniform f32* %101 = OpAccessChain %22 %91 %99 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFAdd %98 %102 
                                                      OpStore %90 %103 
                                         f32 %104 = OpLoad %90 
                                       f32_3 %105 = OpCompositeConstruct %104 %104 %104 
                                       f32_3 %106 = OpFNegate %105 
                              Uniform f32_4* %107 = OpAccessChain %22 %91 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFAdd %110 %112 
                                       f32_4 %114 = OpLoad %32 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %32 %115 
                                       f32_4 %116 = OpLoad %9 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_4 %118 = OpLoad %32 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFNegate %119 
                                       f32_3 %121 = OpFAdd %117 %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %9 %123 
                                Uniform f32* %125 = OpAccessChain %22 %124 
                                         f32 %126 = OpLoad %125 
                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %32 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %43 %36 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %32 %140 
                              Uniform f32_4* %141 = OpAccessChain %22 %43 %43 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %32 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %32 %147 
                              Uniform f32_4* %148 = OpAccessChain %22 %43 %24 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %32 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %9 %154 
                                       f32_4 %155 = OpLoad %9 
                              Uniform f32_4* %156 = OpAccessChain %22 %43 %35 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpFAdd %155 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %22 %36 %36 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFMul %160 %162 
                                                      OpStore %32 %163 
                              Uniform f32_4* %164 = OpAccessChain %22 %36 %43 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 0 0 0 
                                       f32_4 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %32 
                                       f32_4 %170 = OpFAdd %168 %169 
                                                      OpStore %32 %170 
                              Uniform f32_4* %171 = OpAccessChain %22 %36 %24 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 2 2 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %32 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %32 %177 
                                       f32_4 %180 = OpLoad %9 
                                                      OpStore vs_TEXCOORD1 %180 
                                       f32_4 %186 = OpLoad %32 
                              Uniform f32_4* %187 = OpAccessChain %22 %36 %35 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFAdd %186 %188 
                               Output f32_4* %190 = OpAccessChain %185 %43 
                                                      OpStore %190 %189 
                                       f32_4 %195 = OpLoad %194 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                                      OpStore vs_TEXCOORD0 %196 
                                 Output f32* %198 = OpAccessChain %185 %43 %181 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFNegate %199 
                                 Output f32* %201 = OpAccessChain %185 %43 %181 
                                                      OpStore %201 %200 
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
                                             OpEntryPoint Fragment %4 "main" %21 %56 %58 
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
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate vs_TEXCOORD1 Location 58 
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
                                     %30 = OpTypeStruct %6 
                                     %31 = OpTypePointer Uniform %30 
              Uniform struct {f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 0 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 1 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 i32 %48 = OpSelect %46 %47 %34 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %34 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                               f32_4 %59 = OpLoad vs_TEXCOORD1 
                                             OpStore %56 %59 
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
 Pass {
  Tags { "DisableBatching" = "true" "RenderType" = "TreeTransparentCutout" }
  Cull Front
  GpuProgramID 457754
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
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
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
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
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
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	vec4 _TreeInstanceScale;
uniform 	vec4 hlslcc_mtx4x4_TerrainEngineBendTree[4];
uniform 	vec4 _SquashPlaneNormal;
uniform 	float _SquashAmount;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz * _TreeInstanceScale.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_TerrainEngineBendTree[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_TerrainEngineBendTree[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = (-in_POSITION0.xyz) * _TreeInstanceScale.xyz + u_xlat1.xyz;
    u_xlat0.xyz = in_COLOR0.www * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat6 = dot(_SquashPlaneNormal.xyz, u_xlat0.xyz);
    u_xlat6 = u_xlat6 + _SquashPlaneNormal.w;
    u_xlat1.xyz = (-vec3(u_xlat6)) * _SquashPlaneNormal.xyz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat0.xyz = vec3(_SquashAmount) * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1 = u_xlat0;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
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
    SV_Target0 = vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 203
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %78 %179 %185 %193 %194 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 179 
                                                      OpMemberDecorate %183 0 BuiltIn 183 
                                                      OpMemberDecorate %183 1 BuiltIn 183 
                                                      OpMemberDecorate %183 2 BuiltIn 183 
                                                      OpDecorate %183 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 193 
                                                      OpDecorate %194 Location 194 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeStruct %17 %18 %7 %19 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %7 
                               Private f32_4* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 3 
                                          i32 %36 = OpConstant 1 
                                          i32 %43 = OpConstant 0 
                                 Input f32_4* %78 = OpVariable Input 
                                              %89 = OpTypePointer Private %6 
                                 Private f32* %90 = OpVariable Private 
                                          i32 %91 = OpConstant 4 
                                          u32 %99 = OpConstant 3 
                                             %100 = OpTypePointer Uniform %6 
                                         i32 %124 = OpConstant 5 
                                             %178 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %181 = OpConstant 1 
                                             %182 = OpTypeArray %6 %181 
                                             %183 = OpTypeStruct %7 %6 %182 
                                             %184 = OpTypePointer Output %183 
        Output struct {f32_4; f32; f32[1];}* %185 = OpVariable Output 
                                             %191 = OpTypeVector %6 2 
                                             %192 = OpTypePointer Output %191 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %194 = OpVariable Input 
                                             %197 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                        f32_3 %29 = OpFMul %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %22 %35 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %34 %39 
                                        f32_4 %41 = OpLoad %32 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %32 %42 
                               Uniform f32_4* %44 = OpAccessChain %22 %35 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %46 %48 
                                        f32_4 %50 = OpLoad %32 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %32 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %32 %54 
                               Uniform f32_4* %55 = OpAccessChain %22 %35 %24 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %32 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %32 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %32 %65 
                                        f32_4 %66 = OpLoad %11 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFNegate %67 
                               Uniform f32_4* %69 = OpAccessChain %22 %24 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %32 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %32 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %32 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 3 3 3 
                                        f32_4 %81 = OpLoad %32 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                               Uniform f32_4* %92 = OpAccessChain %22 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                          f32 %97 = OpDot %94 %96 
                                                      OpStore %90 %97 
                                          f32 %98 = OpLoad %90 
                                Uniform f32* %101 = OpAccessChain %22 %91 %99 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFAdd %98 %102 
                                                      OpStore %90 %103 
                                         f32 %104 = OpLoad %90 
                                       f32_3 %105 = OpCompositeConstruct %104 %104 %104 
                                       f32_3 %106 = OpFNegate %105 
                              Uniform f32_4* %107 = OpAccessChain %22 %91 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFAdd %110 %112 
                                       f32_4 %114 = OpLoad %32 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %32 %115 
                                       f32_4 %116 = OpLoad %9 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_4 %118 = OpLoad %32 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFNegate %119 
                                       f32_3 %121 = OpFAdd %117 %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %9 %123 
                                Uniform f32* %125 = OpAccessChain %22 %124 
                                         f32 %126 = OpLoad %125 
                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %32 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %43 %36 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %32 %140 
                              Uniform f32_4* %141 = OpAccessChain %22 %43 %43 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %32 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %32 %147 
                              Uniform f32_4* %148 = OpAccessChain %22 %43 %24 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %32 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %9 %154 
                                       f32_4 %155 = OpLoad %9 
                              Uniform f32_4* %156 = OpAccessChain %22 %43 %35 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpFAdd %155 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %22 %36 %36 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFMul %160 %162 
                                                      OpStore %32 %163 
                              Uniform f32_4* %164 = OpAccessChain %22 %36 %43 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 0 0 0 
                                       f32_4 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %32 
                                       f32_4 %170 = OpFAdd %168 %169 
                                                      OpStore %32 %170 
                              Uniform f32_4* %171 = OpAccessChain %22 %36 %24 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 2 2 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %32 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %32 %177 
                                       f32_4 %180 = OpLoad %9 
                                                      OpStore vs_TEXCOORD1 %180 
                                       f32_4 %186 = OpLoad %32 
                              Uniform f32_4* %187 = OpAccessChain %22 %36 %35 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFAdd %186 %188 
                               Output f32_4* %190 = OpAccessChain %185 %43 
                                                      OpStore %190 %189 
                                       f32_4 %195 = OpLoad %194 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                                      OpStore vs_TEXCOORD0 %196 
                                 Output f32* %198 = OpAccessChain %185 %43 %181 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFNegate %199 
                                 Output f32* %201 = OpAccessChain %185 %43 %181 
                                                      OpStore %201 %200 
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
                                             OpEntryPoint Fragment %4 "main" %21 %56 %58 
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
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate vs_TEXCOORD1 Location 58 
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
                                     %30 = OpTypeStruct %6 
                                     %31 = OpTypePointer Uniform %30 
              Uniform struct {f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 0 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 1 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 i32 %48 = OpSelect %46 %47 %34 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %34 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                               f32_4 %59 = OpLoad vs_TEXCOORD1 
                                             OpStore %56 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 203
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %78 %179 %185 %193 %194 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 179 
                                                      OpMemberDecorate %183 0 BuiltIn 183 
                                                      OpMemberDecorate %183 1 BuiltIn 183 
                                                      OpMemberDecorate %183 2 BuiltIn 183 
                                                      OpDecorate %183 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 193 
                                                      OpDecorate %194 Location 194 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeStruct %17 %18 %7 %19 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %7 
                               Private f32_4* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 3 
                                          i32 %36 = OpConstant 1 
                                          i32 %43 = OpConstant 0 
                                 Input f32_4* %78 = OpVariable Input 
                                              %89 = OpTypePointer Private %6 
                                 Private f32* %90 = OpVariable Private 
                                          i32 %91 = OpConstant 4 
                                          u32 %99 = OpConstant 3 
                                             %100 = OpTypePointer Uniform %6 
                                         i32 %124 = OpConstant 5 
                                             %178 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %181 = OpConstant 1 
                                             %182 = OpTypeArray %6 %181 
                                             %183 = OpTypeStruct %7 %6 %182 
                                             %184 = OpTypePointer Output %183 
        Output struct {f32_4; f32; f32[1];}* %185 = OpVariable Output 
                                             %191 = OpTypeVector %6 2 
                                             %192 = OpTypePointer Output %191 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %194 = OpVariable Input 
                                             %197 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                        f32_3 %29 = OpFMul %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %22 %35 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %34 %39 
                                        f32_4 %41 = OpLoad %32 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %32 %42 
                               Uniform f32_4* %44 = OpAccessChain %22 %35 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %46 %48 
                                        f32_4 %50 = OpLoad %32 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %32 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %32 %54 
                               Uniform f32_4* %55 = OpAccessChain %22 %35 %24 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %32 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %32 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %32 %65 
                                        f32_4 %66 = OpLoad %11 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFNegate %67 
                               Uniform f32_4* %69 = OpAccessChain %22 %24 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %32 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %32 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %32 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 3 3 3 
                                        f32_4 %81 = OpLoad %32 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                               Uniform f32_4* %92 = OpAccessChain %22 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                          f32 %97 = OpDot %94 %96 
                                                      OpStore %90 %97 
                                          f32 %98 = OpLoad %90 
                                Uniform f32* %101 = OpAccessChain %22 %91 %99 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFAdd %98 %102 
                                                      OpStore %90 %103 
                                         f32 %104 = OpLoad %90 
                                       f32_3 %105 = OpCompositeConstruct %104 %104 %104 
                                       f32_3 %106 = OpFNegate %105 
                              Uniform f32_4* %107 = OpAccessChain %22 %91 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFAdd %110 %112 
                                       f32_4 %114 = OpLoad %32 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %32 %115 
                                       f32_4 %116 = OpLoad %9 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_4 %118 = OpLoad %32 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFNegate %119 
                                       f32_3 %121 = OpFAdd %117 %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %9 %123 
                                Uniform f32* %125 = OpAccessChain %22 %124 
                                         f32 %126 = OpLoad %125 
                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %32 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %43 %36 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %32 %140 
                              Uniform f32_4* %141 = OpAccessChain %22 %43 %43 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %32 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %32 %147 
                              Uniform f32_4* %148 = OpAccessChain %22 %43 %24 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %32 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %9 %154 
                                       f32_4 %155 = OpLoad %9 
                              Uniform f32_4* %156 = OpAccessChain %22 %43 %35 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpFAdd %155 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %22 %36 %36 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFMul %160 %162 
                                                      OpStore %32 %163 
                              Uniform f32_4* %164 = OpAccessChain %22 %36 %43 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 0 0 0 
                                       f32_4 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %32 
                                       f32_4 %170 = OpFAdd %168 %169 
                                                      OpStore %32 %170 
                              Uniform f32_4* %171 = OpAccessChain %22 %36 %24 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 2 2 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %32 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %32 %177 
                                       f32_4 %180 = OpLoad %9 
                                                      OpStore vs_TEXCOORD1 %180 
                                       f32_4 %186 = OpLoad %32 
                              Uniform f32_4* %187 = OpAccessChain %22 %36 %35 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFAdd %186 %188 
                               Output f32_4* %190 = OpAccessChain %185 %43 
                                                      OpStore %190 %189 
                                       f32_4 %195 = OpLoad %194 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                                      OpStore vs_TEXCOORD0 %196 
                                 Output f32* %198 = OpAccessChain %185 %43 %181 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFNegate %199 
                                 Output f32* %201 = OpAccessChain %185 %43 %181 
                                                      OpStore %201 %200 
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
                                             OpEntryPoint Fragment %4 "main" %21 %56 %58 
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
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate vs_TEXCOORD1 Location 58 
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
                                     %30 = OpTypeStruct %6 
                                     %31 = OpTypePointer Uniform %30 
              Uniform struct {f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 0 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 1 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 i32 %48 = OpSelect %46 %47 %34 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %34 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                               f32_4 %59 = OpLoad vs_TEXCOORD1 
                                             OpStore %56 %59 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 203
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %78 %179 %185 %193 %194 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpMemberDecorate %20 5 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpDecorate %78 RelaxedPrecision 
                                                      OpDecorate %78 Location 78 
                                                      OpDecorate %79 RelaxedPrecision 
                                                      OpDecorate %80 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 179 
                                                      OpMemberDecorate %183 0 BuiltIn 183 
                                                      OpMemberDecorate %183 1 BuiltIn 183 
                                                      OpMemberDecorate %183 2 BuiltIn 183 
                                                      OpDecorate %183 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 193 
                                                      OpDecorate %194 Location 194 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeArray %7 %16 
                                              %20 = OpTypeStruct %17 %18 %7 %19 %7 %6 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4[4]; f32_4; f32;}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 2 
                                              %25 = OpTypePointer Uniform %7 
                               Private f32_4* %32 = OpVariable Private 
                                          i32 %35 = OpConstant 3 
                                          i32 %36 = OpConstant 1 
                                          i32 %43 = OpConstant 0 
                                 Input f32_4* %78 = OpVariable Input 
                                              %89 = OpTypePointer Private %6 
                                 Private f32* %90 = OpVariable Private 
                                          i32 %91 = OpConstant 4 
                                          u32 %99 = OpConstant 3 
                                             %100 = OpTypePointer Uniform %6 
                                         i32 %124 = OpConstant 5 
                                             %178 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %181 = OpConstant 1 
                                             %182 = OpTypeArray %6 %181 
                                             %183 = OpTypeStruct %7 %6 %182 
                                             %184 = OpTypePointer Output %183 
        Output struct {f32_4; f32; f32[1];}* %185 = OpVariable Output 
                                             %191 = OpTypeVector %6 2 
                                             %192 = OpTypePointer Output %191 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %194 = OpVariable Input 
                                             %197 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %26 = OpAccessChain %22 %24 
                                        f32_4 %27 = OpLoad %26 
                                        f32_3 %28 = OpVectorShuffle %27 %27 0 1 2 
                                        f32_3 %29 = OpFMul %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %33 = OpLoad %9 
                                        f32_3 %34 = OpVectorShuffle %33 %33 1 1 1 
                               Uniform f32_4* %37 = OpAccessChain %22 %35 %36 
                                        f32_4 %38 = OpLoad %37 
                                        f32_3 %39 = OpVectorShuffle %38 %38 0 1 2 
                                        f32_3 %40 = OpFMul %34 %39 
                                        f32_4 %41 = OpLoad %32 
                                        f32_4 %42 = OpVectorShuffle %41 %40 4 5 6 3 
                                                      OpStore %32 %42 
                               Uniform f32_4* %44 = OpAccessChain %22 %35 %43 
                                        f32_4 %45 = OpLoad %44 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_4 %47 = OpLoad %9 
                                        f32_3 %48 = OpVectorShuffle %47 %47 0 0 0 
                                        f32_3 %49 = OpFMul %46 %48 
                                        f32_4 %50 = OpLoad %32 
                                        f32_3 %51 = OpVectorShuffle %50 %50 0 1 2 
                                        f32_3 %52 = OpFAdd %49 %51 
                                        f32_4 %53 = OpLoad %32 
                                        f32_4 %54 = OpVectorShuffle %53 %52 4 5 6 3 
                                                      OpStore %32 %54 
                               Uniform f32_4* %55 = OpAccessChain %22 %35 %24 
                                        f32_4 %56 = OpLoad %55 
                                        f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                        f32_4 %58 = OpLoad %9 
                                        f32_3 %59 = OpVectorShuffle %58 %58 2 2 2 
                                        f32_3 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %32 
                                        f32_3 %62 = OpVectorShuffle %61 %61 0 1 2 
                                        f32_3 %63 = OpFAdd %60 %62 
                                        f32_4 %64 = OpLoad %32 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 6 3 
                                                      OpStore %32 %65 
                                        f32_4 %66 = OpLoad %11 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 1 2 
                                        f32_3 %68 = OpFNegate %67 
                               Uniform f32_4* %69 = OpAccessChain %22 %24 
                                        f32_4 %70 = OpLoad %69 
                                        f32_3 %71 = OpVectorShuffle %70 %70 0 1 2 
                                        f32_3 %72 = OpFMul %68 %71 
                                        f32_4 %73 = OpLoad %32 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %32 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 5 6 3 
                                                      OpStore %32 %77 
                                        f32_4 %79 = OpLoad %78 
                                        f32_3 %80 = OpVectorShuffle %79 %79 3 3 3 
                                        f32_4 %81 = OpLoad %32 
                                        f32_3 %82 = OpVectorShuffle %81 %81 0 1 2 
                                        f32_3 %83 = OpFMul %80 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 1 2 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                               Uniform f32_4* %92 = OpAccessChain %22 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 1 2 
                                          f32 %97 = OpDot %94 %96 
                                                      OpStore %90 %97 
                                          f32 %98 = OpLoad %90 
                                Uniform f32* %101 = OpAccessChain %22 %91 %99 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFAdd %98 %102 
                                                      OpStore %90 %103 
                                         f32 %104 = OpLoad %90 
                                       f32_3 %105 = OpCompositeConstruct %104 %104 %104 
                                       f32_3 %106 = OpFNegate %105 
                              Uniform f32_4* %107 = OpAccessChain %22 %91 
                                       f32_4 %108 = OpLoad %107 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 2 
                                       f32_3 %110 = OpFMul %106 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_3 %112 = OpVectorShuffle %111 %111 0 1 2 
                                       f32_3 %113 = OpFAdd %110 %112 
                                       f32_4 %114 = OpLoad %32 
                                       f32_4 %115 = OpVectorShuffle %114 %113 4 5 6 3 
                                                      OpStore %32 %115 
                                       f32_4 %116 = OpLoad %9 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_4 %118 = OpLoad %32 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFNegate %119 
                                       f32_3 %121 = OpFAdd %117 %120 
                                       f32_4 %122 = OpLoad %9 
                                       f32_4 %123 = OpVectorShuffle %122 %121 4 5 6 3 
                                                      OpStore %9 %123 
                                Uniform f32* %125 = OpAccessChain %22 %124 
                                         f32 %126 = OpLoad %125 
                                       f32_3 %127 = OpCompositeConstruct %126 %126 %126 
                                       f32_4 %128 = OpLoad %9 
                                       f32_3 %129 = OpVectorShuffle %128 %128 0 1 2 
                                       f32_3 %130 = OpFMul %127 %129 
                                       f32_4 %131 = OpLoad %32 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 1 2 
                                       f32_3 %133 = OpFAdd %130 %132 
                                       f32_4 %134 = OpLoad %9 
                                       f32_4 %135 = OpVectorShuffle %134 %133 4 5 6 3 
                                                      OpStore %9 %135 
                                       f32_4 %136 = OpLoad %9 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %22 %43 %36 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %32 %140 
                              Uniform f32_4* %141 = OpAccessChain %22 %43 %43 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %32 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %32 %147 
                              Uniform f32_4* %148 = OpAccessChain %22 %43 %24 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %9 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %32 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %9 %154 
                                       f32_4 %155 = OpLoad %9 
                              Uniform f32_4* %156 = OpAccessChain %22 %43 %35 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpFAdd %155 %157 
                                                      OpStore %9 %158 
                                       f32_4 %159 = OpLoad %9 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %161 = OpAccessChain %22 %36 %36 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFMul %160 %162 
                                                      OpStore %32 %163 
                              Uniform f32_4* %164 = OpAccessChain %22 %36 %43 
                                       f32_4 %165 = OpLoad %164 
                                       f32_4 %166 = OpLoad %9 
                                       f32_4 %167 = OpVectorShuffle %166 %166 0 0 0 0 
                                       f32_4 %168 = OpFMul %165 %167 
                                       f32_4 %169 = OpLoad %32 
                                       f32_4 %170 = OpFAdd %168 %169 
                                                      OpStore %32 %170 
                              Uniform f32_4* %171 = OpAccessChain %22 %36 %24 
                                       f32_4 %172 = OpLoad %171 
                                       f32_4 %173 = OpLoad %9 
                                       f32_4 %174 = OpVectorShuffle %173 %173 2 2 2 2 
                                       f32_4 %175 = OpFMul %172 %174 
                                       f32_4 %176 = OpLoad %32 
                                       f32_4 %177 = OpFAdd %175 %176 
                                                      OpStore %32 %177 
                                       f32_4 %180 = OpLoad %9 
                                                      OpStore vs_TEXCOORD1 %180 
                                       f32_4 %186 = OpLoad %32 
                              Uniform f32_4* %187 = OpAccessChain %22 %36 %35 
                                       f32_4 %188 = OpLoad %187 
                                       f32_4 %189 = OpFAdd %186 %188 
                               Output f32_4* %190 = OpAccessChain %185 %43 
                                                      OpStore %190 %189 
                                       f32_4 %195 = OpLoad %194 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                                      OpStore vs_TEXCOORD0 %196 
                                 Output f32* %198 = OpAccessChain %185 %43 %181 
                                         f32 %199 = OpLoad %198 
                                         f32 %200 = OpFNegate %199 
                                 Output f32* %201 = OpAccessChain %185 %43 %181 
                                                      OpStore %201 %200 
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
                                             OpEntryPoint Fragment %4 "main" %21 %56 %58 
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
                                             OpMemberDecorate %30 0 RelaxedPrecision 
                                             OpMemberDecorate %30 0 Offset 30 
                                             OpDecorate %30 Block 
                                             OpDecorate %32 DescriptorSet 32 
                                             OpDecorate %32 Binding 32 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %56 Location 56 
                                             OpDecorate vs_TEXCOORD1 Location 58 
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
                                     %30 = OpTypeStruct %6 
                                     %31 = OpTypePointer Uniform %30 
              Uniform struct {f32;}* %32 = OpVariable Uniform 
                                     %33 = OpTypeInt 32 1 
                                 i32 %34 = OpConstant 0 
                                     %35 = OpTypePointer Uniform %6 
                                     %40 = OpTypeBool 
                                     %41 = OpTypePointer Private %40 
                       Private bool* %42 = OpVariable Private 
                                 f32 %44 = OpConstant 3.674022E-40 
                                 i32 %47 = OpConstant 1 
                                 i32 %49 = OpConstant -1 
                                     %55 = OpTypePointer Output %23 
                       Output f32_4* %56 = OpVariable Output 
                                     %57 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 i32 %48 = OpSelect %46 %47 %34 
                                 i32 %50 = OpIMul %48 %49 
                                bool %51 = OpINotEqual %50 %34 
                                             OpSelectionMerge %53 None 
                                             OpBranchConditional %51 %52 %53 
                                     %52 = OpLabel 
                                             OpKill
                                     %53 = OpLabel 
                               f32_4 %59 = OpLoad vs_TEXCOORD1 
                                             OpStore %56 %59 
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
 Tags { "RenderType" = "TreeBillboard" }
 Pass {
  Tags { "RenderType" = "TreeBillboard" }
  Cull Off
  GpuProgramID 490650
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
uniform 	vec3 _TreeBillboardCameraRight;
uniform 	vec4 _TreeBillboardCameraUp;
uniform 	vec4 _TreeBillboardCameraFront;
uniform 	vec4 _TreeBillboardCameraPos;
uniform 	vec4 _TreeBillboardDistances;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_TreeBillboardCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_TreeBillboardDistances.x<u_xlat0.x);
#else
    u_xlatb0 = _TreeBillboardDistances.x<u_xlat0.x;
#endif
    u_xlat1.xy = in_TEXCOORD1.xy;
    u_xlat1.z = in_TEXCOORD0.y;
    u_xlat0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat4 = (-u_xlat0.y) + u_xlat0.z;
    u_xlat2 = _TreeBillboardCameraPos.w * u_xlat4 + u_xlat0.y;
    u_xlat1.xyz = vec3(_TreeBillboardCameraRight.x, _TreeBillboardCameraRight.y, _TreeBillboardCameraRight.z) * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat0.xzw = abs(u_xlat0.xxx) * _TreeBillboardCameraFront.xyz;
    u_xlat1.xyz = _TreeBillboardCameraUp.xyz * vec3(u_xlat2) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xzw * _TreeBillboardCameraUp.www + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<in_TEXCOORD0.y);
#else
    u_xlatb0 = 0.0<in_TEXCOORD0.y;
#endif
    vs_TEXCOORD0.y = u_xlatb0 ? 1.0 : float(0.0);
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
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
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	vec3 _TreeBillboardCameraRight;
uniform 	vec4 _TreeBillboardCameraUp;
uniform 	vec4 _TreeBillboardCameraFront;
uniform 	vec4 _TreeBillboardCameraPos;
uniform 	vec4 _TreeBillboardDistances;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_TreeBillboardCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_TreeBillboardDistances.x<u_xlat0.x);
#else
    u_xlatb0 = _TreeBillboardDistances.x<u_xlat0.x;
#endif
    u_xlat1.xy = in_TEXCOORD1.xy;
    u_xlat1.z = in_TEXCOORD0.y;
    u_xlat0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat4 = (-u_xlat0.y) + u_xlat0.z;
    u_xlat2 = _TreeBillboardCameraPos.w * u_xlat4 + u_xlat0.y;
    u_xlat1.xyz = vec3(_TreeBillboardCameraRight.x, _TreeBillboardCameraRight.y, _TreeBillboardCameraRight.z) * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat0.xzw = abs(u_xlat0.xxx) * _TreeBillboardCameraFront.xyz;
    u_xlat1.xyz = _TreeBillboardCameraUp.xyz * vec3(u_xlat2) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xzw * _TreeBillboardCameraUp.www + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<in_TEXCOORD0.y);
#else
    u_xlatb0 = 0.0<in_TEXCOORD0.y;
#endif
    vs_TEXCOORD0.y = u_xlatb0 ? 1.0 : float(0.0);
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
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
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	vec3 _TreeBillboardCameraRight;
uniform 	vec4 _TreeBillboardCameraUp;
uniform 	vec4 _TreeBillboardCameraFront;
uniform 	vec4 _TreeBillboardCameraPos;
uniform 	vec4 _TreeBillboardDistances;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
float u_xlat2;
float u_xlat4;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_TreeBillboardCameraPos.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_TreeBillboardDistances.x<u_xlat0.x);
#else
    u_xlatb0 = _TreeBillboardDistances.x<u_xlat0.x;
#endif
    u_xlat1.xy = in_TEXCOORD1.xy;
    u_xlat1.z = in_TEXCOORD0.y;
    u_xlat0.xyz = (bool(u_xlatb0)) ? vec3(0.0, 0.0, 0.0) : u_xlat1.xyz;
    u_xlat4 = (-u_xlat0.y) + u_xlat0.z;
    u_xlat2 = _TreeBillboardCameraPos.w * u_xlat4 + u_xlat0.y;
    u_xlat1.xyz = vec3(_TreeBillboardCameraRight.x, _TreeBillboardCameraRight.y, _TreeBillboardCameraRight.z) * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat0.xzw = abs(u_xlat0.xxx) * _TreeBillboardCameraFront.xyz;
    u_xlat1.xyz = _TreeBillboardCameraUp.xyz * vec3(u_xlat2) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xzw * _TreeBillboardCameraUp.www + u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<in_TEXCOORD0.y);
#else
    u_xlatb0 = 0.0<in_TEXCOORD0.y;
#endif
    vs_TEXCOORD0.y = u_xlatb0 ? 1.0 : float(0.0);
    vs_TEXCOORD0.x = in_TEXCOORD0.x;
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
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 226
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %57 %172 %202 %212 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %53 Location 53 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate vs_TEXCOORD1 Location 172 
                                                      OpMemberDecorate %200 0 BuiltIn 200 
                                                      OpMemberDecorate %200 1 BuiltIn 200 
                                                      OpMemberDecorate %200 2 BuiltIn 200 
                                                      OpDecorate %200 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 212 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %12 %7 %7 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_3; f32_4; f32_4; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 5 
                                              %24 = OpTypePointer Uniform %7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                              %40 = OpTypeBool 
                                              %41 = OpTypePointer Private %40 
                                Private bool* %42 = OpVariable Private 
                                          i32 %43 = OpConstant 6 
                                              %44 = OpTypePointer Uniform %6 
                               Private f32_4* %50 = OpVariable Private 
                                              %51 = OpTypeVector %6 2 
                                              %52 = OpTypePointer Input %51 
                                 Input f32_2* %53 = OpVariable Input 
                                 Input f32_4* %57 = OpVariable Input 
                                          u32 %58 = OpConstant 1 
                                              %59 = OpTypePointer Input %6 
                                          u32 %62 = OpConstant 2 
                                              %65 = OpTypePointer Function %12 
                                          f32 %69 = OpConstant 3.674022E-40 
                                        f32_3 %70 = OpConstantComposite %69 %69 %69 
                                 Private f32* %77 = OpVariable Private 
                                 Private f32* %84 = OpVariable Private 
                                          u32 %85 = OpConstant 3 
                                          i32 %93 = OpConstant 2 
                                         i32 %112 = OpConstant 4 
                                         i32 %119 = OpConstant 3 
                                         i32 %144 = OpConstant 0 
                                         i32 %145 = OpConstant 1 
                                             %171 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %199 = OpTypeArray %6 %58 
                                             %200 = OpTypeStruct %7 %6 %199 
                                             %201 = OpTypePointer Output %200 
        Output struct {f32_4; f32; f32[1];}* %202 = OpVariable Output 
                                             %211 = OpTypePointer Output %51 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                         f32 %214 = OpConstant 3.674022E-40 
                                             %216 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %66 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFNegate %27 
                                        f32_3 %29 = OpFAdd %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                          f32 %36 = OpDot %33 %35 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                                      OpStore %39 %36 
                                 Uniform f32* %45 = OpAccessChain %21 %43 %37 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %47 = OpAccessChain %9 %37 
                                          f32 %48 = OpLoad %47 
                                         bool %49 = OpFOrdLessThan %46 %48 
                                                      OpStore %42 %49 
                                        f32_2 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %50 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 2 3 
                                                      OpStore %50 %56 
                                   Input f32* %60 = OpAccessChain %57 %58 
                                          f32 %61 = OpLoad %60 
                                 Private f32* %63 = OpAccessChain %50 %62 
                                                      OpStore %63 %61 
                                         bool %64 = OpLoad %42 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %64 %67 %71 
                                              %67 = OpLabel 
                                                      OpStore %66 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %50 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %66 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %66 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %9 %76 
                                 Private f32* %78 = OpAccessChain %9 %58 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFNegate %79 
                                 Private f32* %81 = OpAccessChain %9 %62 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFAdd %80 %82 
                                                      OpStore %77 %83 
                                 Uniform f32* %86 = OpAccessChain %21 %23 %85 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpLoad %77 
                                          f32 %89 = OpFMul %87 %88 
                                 Private f32* %90 = OpAccessChain %9 %58 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpFAdd %89 %91 
                                                      OpStore %84 %92 
                                 Uniform f32* %94 = OpAccessChain %21 %93 %37 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %96 = OpAccessChain %21 %93 %58 
                                          f32 %97 = OpLoad %96 
                                 Uniform f32* %98 = OpAccessChain %21 %93 %62 
                                          f32 %99 = OpLoad %98 
                                       f32_3 %100 = OpCompositeConstruct %95 %97 %99 
                                       f32_4 %101 = OpLoad %9 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %11 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpFAdd %103 %105 
                                       f32_4 %107 = OpLoad %50 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                      OpStore %50 %108 
                                       f32_4 %109 = OpLoad %9 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 0 0 
                                       f32_3 %111 = OpExtInst %1 4 %110 
                              Uniform f32_4* %113 = OpAccessChain %21 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFMul %111 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 1 5 6 
                                                      OpStore %9 %118 
                              Uniform f32_4* %120 = OpAccessChain %21 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpLoad %84 
                                       f32_3 %124 = OpCompositeConstruct %123 %123 %123 
                                       f32_3 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %50 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_3 %128 = OpFAdd %125 %127 
                                       f32_4 %129 = OpLoad %50 
                                       f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
                                                      OpStore %50 %130 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 2 3 
                              Uniform f32_4* %133 = OpAccessChain %21 %119 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 3 3 3 
                                       f32_3 %136 = OpFMul %132 %135 
                                       f32_4 %137 = OpLoad %50 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFAdd %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %9 %141 
                                       f32_4 %142 = OpLoad %9 
                                       f32_4 %143 = OpVectorShuffle %142 %142 1 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %21 %144 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpFMul %143 %147 
                                                      OpStore %50 %148 
                              Uniform f32_4* %149 = OpAccessChain %21 %144 %144 
                                       f32_4 %150 = OpLoad %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 0 0 0 
                                       f32_4 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %50 
                                       f32_4 %155 = OpFAdd %153 %154 
                                                      OpStore %50 %155 
                              Uniform f32_4* %156 = OpAccessChain %21 %144 %93 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %9 
                                       f32_4 %159 = OpVectorShuffle %158 %158 2 2 2 2 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %50 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore %9 %162 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %165 = OpAccessChain %21 %144 %119 
                                       f32_4 %166 = OpLoad %165 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_3 %168 = OpFAdd %164 %167 
                                       f32_4 %169 = OpLoad %50 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                      OpStore %50 %170 
                              Uniform f32_4* %173 = OpAccessChain %21 %144 %119 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpLoad %11 
                                       f32_4 %176 = OpVectorShuffle %175 %175 3 3 3 3 
                                       f32_4 %177 = OpFMul %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpFAdd %177 %178 
                                                      OpStore vs_TEXCOORD1 %179 
                                       f32_4 %180 = OpLoad %50 
                                       f32_4 %181 = OpVectorShuffle %180 %180 1 1 1 1 
                              Uniform f32_4* %182 = OpAccessChain %21 %145 %145 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpFMul %181 %183 
                                                      OpStore %9 %184 
                              Uniform f32_4* %185 = OpAccessChain %21 %145 %144 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %50 
                                       f32_4 %188 = OpVectorShuffle %187 %187 0 0 0 0 
                                       f32_4 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %9 
                                       f32_4 %191 = OpFAdd %189 %190 
                                                      OpStore %9 %191 
                              Uniform f32_4* %192 = OpAccessChain %21 %145 %93 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %50 
                                       f32_4 %195 = OpVectorShuffle %194 %194 2 2 2 2 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %9 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %9 %198 
                                       f32_4 %203 = OpLoad %9 
                              Uniform f32_4* %204 = OpAccessChain %21 %145 %119 
                                       f32_4 %205 = OpLoad %204 
                                       f32_4 %206 = OpFAdd %203 %205 
                               Output f32_4* %207 = OpAccessChain %202 %144 
                                                      OpStore %207 %206 
                                  Input f32* %208 = OpAccessChain %57 %58 
                                         f32 %209 = OpLoad %208 
                                        bool %210 = OpFOrdLessThan %69 %209 
                                                      OpStore %42 %210 
                                        bool %213 = OpLoad %42 
                                         f32 %215 = OpSelect %213 %214 %69 
                                 Output f32* %217 = OpAccessChain vs_TEXCOORD0 %58 
                                                      OpStore %217 %215 
                                  Input f32* %218 = OpAccessChain %57 %37 
                                         f32 %219 = OpLoad %218 
                                 Output f32* %220 = OpAccessChain vs_TEXCOORD0 %37 
                                                      OpStore %220 %219 
                                 Output f32* %221 = OpAccessChain %202 %144 %58 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFNegate %222 
                                 Output f32* %224 = OpAccessChain %202 %144 %58 
                                                      OpStore %224 %223 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 55
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %50 %52 
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
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate vs_TEXCOORD1 Location 52 
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
                                 f32 %30 = OpConstant 3.674022E-40 
                                     %32 = OpTypeBool 
                                     %33 = OpTypePointer Private %32 
                       Private bool* %34 = OpVariable Private 
                                 f32 %36 = OpConstant 3.674022E-40 
                                     %39 = OpTypeInt 32 1 
                                 i32 %40 = OpConstant 0 
                                 i32 %41 = OpConstant 1 
                                 i32 %43 = OpConstant -1 
                                     %49 = OpTypePointer Output %23 
                       Output f32_4* %50 = OpVariable Output 
                                     %51 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 f32 %31 = OpFAdd %29 %30 
                                             OpStore %28 %31 
                                 f32 %35 = OpLoad %28 
                                bool %37 = OpFOrdLessThan %35 %36 
                                             OpStore %34 %37 
                                bool %38 = OpLoad %34 
                                 i32 %42 = OpSelect %38 %41 %40 
                                 i32 %44 = OpIMul %42 %43 
                                bool %45 = OpINotEqual %44 %40 
                                             OpSelectionMerge %47 None 
                                             OpBranchConditional %45 %46 %47 
                                     %46 = OpLabel 
                                             OpKill
                                     %47 = OpLabel 
                               f32_4 %53 = OpLoad vs_TEXCOORD1 
                                             OpStore %50 %53 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 226
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %57 %172 %202 %212 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %53 Location 53 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate vs_TEXCOORD1 Location 172 
                                                      OpMemberDecorate %200 0 BuiltIn 200 
                                                      OpMemberDecorate %200 1 BuiltIn 200 
                                                      OpMemberDecorate %200 2 BuiltIn 200 
                                                      OpDecorate %200 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 212 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %12 %7 %7 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_3; f32_4; f32_4; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 5 
                                              %24 = OpTypePointer Uniform %7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                              %40 = OpTypeBool 
                                              %41 = OpTypePointer Private %40 
                                Private bool* %42 = OpVariable Private 
                                          i32 %43 = OpConstant 6 
                                              %44 = OpTypePointer Uniform %6 
                               Private f32_4* %50 = OpVariable Private 
                                              %51 = OpTypeVector %6 2 
                                              %52 = OpTypePointer Input %51 
                                 Input f32_2* %53 = OpVariable Input 
                                 Input f32_4* %57 = OpVariable Input 
                                          u32 %58 = OpConstant 1 
                                              %59 = OpTypePointer Input %6 
                                          u32 %62 = OpConstant 2 
                                              %65 = OpTypePointer Function %12 
                                          f32 %69 = OpConstant 3.674022E-40 
                                        f32_3 %70 = OpConstantComposite %69 %69 %69 
                                 Private f32* %77 = OpVariable Private 
                                 Private f32* %84 = OpVariable Private 
                                          u32 %85 = OpConstant 3 
                                          i32 %93 = OpConstant 2 
                                         i32 %112 = OpConstant 4 
                                         i32 %119 = OpConstant 3 
                                         i32 %144 = OpConstant 0 
                                         i32 %145 = OpConstant 1 
                                             %171 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %199 = OpTypeArray %6 %58 
                                             %200 = OpTypeStruct %7 %6 %199 
                                             %201 = OpTypePointer Output %200 
        Output struct {f32_4; f32; f32[1];}* %202 = OpVariable Output 
                                             %211 = OpTypePointer Output %51 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                         f32 %214 = OpConstant 3.674022E-40 
                                             %216 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %66 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFNegate %27 
                                        f32_3 %29 = OpFAdd %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                          f32 %36 = OpDot %33 %35 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                                      OpStore %39 %36 
                                 Uniform f32* %45 = OpAccessChain %21 %43 %37 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %47 = OpAccessChain %9 %37 
                                          f32 %48 = OpLoad %47 
                                         bool %49 = OpFOrdLessThan %46 %48 
                                                      OpStore %42 %49 
                                        f32_2 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %50 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 2 3 
                                                      OpStore %50 %56 
                                   Input f32* %60 = OpAccessChain %57 %58 
                                          f32 %61 = OpLoad %60 
                                 Private f32* %63 = OpAccessChain %50 %62 
                                                      OpStore %63 %61 
                                         bool %64 = OpLoad %42 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %64 %67 %71 
                                              %67 = OpLabel 
                                                      OpStore %66 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %50 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %66 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %66 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %9 %76 
                                 Private f32* %78 = OpAccessChain %9 %58 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFNegate %79 
                                 Private f32* %81 = OpAccessChain %9 %62 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFAdd %80 %82 
                                                      OpStore %77 %83 
                                 Uniform f32* %86 = OpAccessChain %21 %23 %85 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpLoad %77 
                                          f32 %89 = OpFMul %87 %88 
                                 Private f32* %90 = OpAccessChain %9 %58 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpFAdd %89 %91 
                                                      OpStore %84 %92 
                                 Uniform f32* %94 = OpAccessChain %21 %93 %37 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %96 = OpAccessChain %21 %93 %58 
                                          f32 %97 = OpLoad %96 
                                 Uniform f32* %98 = OpAccessChain %21 %93 %62 
                                          f32 %99 = OpLoad %98 
                                       f32_3 %100 = OpCompositeConstruct %95 %97 %99 
                                       f32_4 %101 = OpLoad %9 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %11 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpFAdd %103 %105 
                                       f32_4 %107 = OpLoad %50 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                      OpStore %50 %108 
                                       f32_4 %109 = OpLoad %9 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 0 0 
                                       f32_3 %111 = OpExtInst %1 4 %110 
                              Uniform f32_4* %113 = OpAccessChain %21 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFMul %111 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 1 5 6 
                                                      OpStore %9 %118 
                              Uniform f32_4* %120 = OpAccessChain %21 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpLoad %84 
                                       f32_3 %124 = OpCompositeConstruct %123 %123 %123 
                                       f32_3 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %50 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_3 %128 = OpFAdd %125 %127 
                                       f32_4 %129 = OpLoad %50 
                                       f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
                                                      OpStore %50 %130 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 2 3 
                              Uniform f32_4* %133 = OpAccessChain %21 %119 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 3 3 3 
                                       f32_3 %136 = OpFMul %132 %135 
                                       f32_4 %137 = OpLoad %50 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFAdd %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %9 %141 
                                       f32_4 %142 = OpLoad %9 
                                       f32_4 %143 = OpVectorShuffle %142 %142 1 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %21 %144 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpFMul %143 %147 
                                                      OpStore %50 %148 
                              Uniform f32_4* %149 = OpAccessChain %21 %144 %144 
                                       f32_4 %150 = OpLoad %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 0 0 0 
                                       f32_4 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %50 
                                       f32_4 %155 = OpFAdd %153 %154 
                                                      OpStore %50 %155 
                              Uniform f32_4* %156 = OpAccessChain %21 %144 %93 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %9 
                                       f32_4 %159 = OpVectorShuffle %158 %158 2 2 2 2 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %50 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore %9 %162 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %165 = OpAccessChain %21 %144 %119 
                                       f32_4 %166 = OpLoad %165 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_3 %168 = OpFAdd %164 %167 
                                       f32_4 %169 = OpLoad %50 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                      OpStore %50 %170 
                              Uniform f32_4* %173 = OpAccessChain %21 %144 %119 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpLoad %11 
                                       f32_4 %176 = OpVectorShuffle %175 %175 3 3 3 3 
                                       f32_4 %177 = OpFMul %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpFAdd %177 %178 
                                                      OpStore vs_TEXCOORD1 %179 
                                       f32_4 %180 = OpLoad %50 
                                       f32_4 %181 = OpVectorShuffle %180 %180 1 1 1 1 
                              Uniform f32_4* %182 = OpAccessChain %21 %145 %145 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpFMul %181 %183 
                                                      OpStore %9 %184 
                              Uniform f32_4* %185 = OpAccessChain %21 %145 %144 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %50 
                                       f32_4 %188 = OpVectorShuffle %187 %187 0 0 0 0 
                                       f32_4 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %9 
                                       f32_4 %191 = OpFAdd %189 %190 
                                                      OpStore %9 %191 
                              Uniform f32_4* %192 = OpAccessChain %21 %145 %93 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %50 
                                       f32_4 %195 = OpVectorShuffle %194 %194 2 2 2 2 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %9 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %9 %198 
                                       f32_4 %203 = OpLoad %9 
                              Uniform f32_4* %204 = OpAccessChain %21 %145 %119 
                                       f32_4 %205 = OpLoad %204 
                                       f32_4 %206 = OpFAdd %203 %205 
                               Output f32_4* %207 = OpAccessChain %202 %144 
                                                      OpStore %207 %206 
                                  Input f32* %208 = OpAccessChain %57 %58 
                                         f32 %209 = OpLoad %208 
                                        bool %210 = OpFOrdLessThan %69 %209 
                                                      OpStore %42 %210 
                                        bool %213 = OpLoad %42 
                                         f32 %215 = OpSelect %213 %214 %69 
                                 Output f32* %217 = OpAccessChain vs_TEXCOORD0 %58 
                                                      OpStore %217 %215 
                                  Input f32* %218 = OpAccessChain %57 %37 
                                         f32 %219 = OpLoad %218 
                                 Output f32* %220 = OpAccessChain vs_TEXCOORD0 %37 
                                                      OpStore %220 %219 
                                 Output f32* %221 = OpAccessChain %202 %144 %58 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFNegate %222 
                                 Output f32* %224 = OpAccessChain %202 %144 %58 
                                                      OpStore %224 %223 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 55
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %50 %52 
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
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate vs_TEXCOORD1 Location 52 
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
                                 f32 %30 = OpConstant 3.674022E-40 
                                     %32 = OpTypeBool 
                                     %33 = OpTypePointer Private %32 
                       Private bool* %34 = OpVariable Private 
                                 f32 %36 = OpConstant 3.674022E-40 
                                     %39 = OpTypeInt 32 1 
                                 i32 %40 = OpConstant 0 
                                 i32 %41 = OpConstant 1 
                                 i32 %43 = OpConstant -1 
                                     %49 = OpTypePointer Output %23 
                       Output f32_4* %50 = OpVariable Output 
                                     %51 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 f32 %31 = OpFAdd %29 %30 
                                             OpStore %28 %31 
                                 f32 %35 = OpLoad %28 
                                bool %37 = OpFOrdLessThan %35 %36 
                                             OpStore %34 %37 
                                bool %38 = OpLoad %34 
                                 i32 %42 = OpSelect %38 %41 %40 
                                 i32 %44 = OpIMul %42 %43 
                                bool %45 = OpINotEqual %44 %40 
                                             OpSelectionMerge %47 None 
                                             OpBranchConditional %45 %46 %47 
                                     %46 = OpLabel 
                                             OpKill
                                     %47 = OpLabel 
                               f32_4 %53 = OpLoad vs_TEXCOORD1 
                                             OpStore %50 %53 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 226
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %53 %57 %172 %202 %212 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %53 Location 53 
                                                      OpDecorate %57 Location 57 
                                                      OpDecorate vs_TEXCOORD1 Location 172 
                                                      OpMemberDecorate %200 0 BuiltIn 200 
                                                      OpMemberDecorate %200 1 BuiltIn 200 
                                                      OpMemberDecorate %200 2 BuiltIn 200 
                                                      OpDecorate %200 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 212 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %12 %7 %7 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_3; f32_4; f32_4; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 5 
                                              %24 = OpTypePointer Uniform %7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                              %40 = OpTypeBool 
                                              %41 = OpTypePointer Private %40 
                                Private bool* %42 = OpVariable Private 
                                          i32 %43 = OpConstant 6 
                                              %44 = OpTypePointer Uniform %6 
                               Private f32_4* %50 = OpVariable Private 
                                              %51 = OpTypeVector %6 2 
                                              %52 = OpTypePointer Input %51 
                                 Input f32_2* %53 = OpVariable Input 
                                 Input f32_4* %57 = OpVariable Input 
                                          u32 %58 = OpConstant 1 
                                              %59 = OpTypePointer Input %6 
                                          u32 %62 = OpConstant 2 
                                              %65 = OpTypePointer Function %12 
                                          f32 %69 = OpConstant 3.674022E-40 
                                        f32_3 %70 = OpConstantComposite %69 %69 %69 
                                 Private f32* %77 = OpVariable Private 
                                 Private f32* %84 = OpVariable Private 
                                          u32 %85 = OpConstant 3 
                                          i32 %93 = OpConstant 2 
                                         i32 %112 = OpConstant 4 
                                         i32 %119 = OpConstant 3 
                                         i32 %144 = OpConstant 0 
                                         i32 %145 = OpConstant 1 
                                             %171 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %199 = OpTypeArray %6 %58 
                                             %200 = OpTypeStruct %7 %6 %199 
                                             %201 = OpTypePointer Output %200 
        Output struct {f32_4; f32; f32[1];}* %202 = OpVariable Output 
                                             %211 = OpTypePointer Output %51 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                         f32 %214 = OpConstant 3.674022E-40 
                                             %216 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %66 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFNegate %27 
                                        f32_3 %29 = OpFAdd %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                          f32 %36 = OpDot %33 %35 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                                      OpStore %39 %36 
                                 Uniform f32* %45 = OpAccessChain %21 %43 %37 
                                          f32 %46 = OpLoad %45 
                                 Private f32* %47 = OpAccessChain %9 %37 
                                          f32 %48 = OpLoad %47 
                                         bool %49 = OpFOrdLessThan %46 %48 
                                                      OpStore %42 %49 
                                        f32_2 %54 = OpLoad %53 
                                        f32_4 %55 = OpLoad %50 
                                        f32_4 %56 = OpVectorShuffle %55 %54 4 5 2 3 
                                                      OpStore %50 %56 
                                   Input f32* %60 = OpAccessChain %57 %58 
                                          f32 %61 = OpLoad %60 
                                 Private f32* %63 = OpAccessChain %50 %62 
                                                      OpStore %63 %61 
                                         bool %64 = OpLoad %42 
                                                      OpSelectionMerge %68 None 
                                                      OpBranchConditional %64 %67 %71 
                                              %67 = OpLabel 
                                                      OpStore %66 %70 
                                                      OpBranch %68 
                                              %71 = OpLabel 
                                        f32_4 %72 = OpLoad %50 
                                        f32_3 %73 = OpVectorShuffle %72 %72 0 1 2 
                                                      OpStore %66 %73 
                                                      OpBranch %68 
                                              %68 = OpLabel 
                                        f32_3 %74 = OpLoad %66 
                                        f32_4 %75 = OpLoad %9 
                                        f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                                      OpStore %9 %76 
                                 Private f32* %78 = OpAccessChain %9 %58 
                                          f32 %79 = OpLoad %78 
                                          f32 %80 = OpFNegate %79 
                                 Private f32* %81 = OpAccessChain %9 %62 
                                          f32 %82 = OpLoad %81 
                                          f32 %83 = OpFAdd %80 %82 
                                                      OpStore %77 %83 
                                 Uniform f32* %86 = OpAccessChain %21 %23 %85 
                                          f32 %87 = OpLoad %86 
                                          f32 %88 = OpLoad %77 
                                          f32 %89 = OpFMul %87 %88 
                                 Private f32* %90 = OpAccessChain %9 %58 
                                          f32 %91 = OpLoad %90 
                                          f32 %92 = OpFAdd %89 %91 
                                                      OpStore %84 %92 
                                 Uniform f32* %94 = OpAccessChain %21 %93 %37 
                                          f32 %95 = OpLoad %94 
                                 Uniform f32* %96 = OpAccessChain %21 %93 %58 
                                          f32 %97 = OpLoad %96 
                                 Uniform f32* %98 = OpAccessChain %21 %93 %62 
                                          f32 %99 = OpLoad %98 
                                       f32_3 %100 = OpCompositeConstruct %95 %97 %99 
                                       f32_4 %101 = OpLoad %9 
                                       f32_3 %102 = OpVectorShuffle %101 %101 0 0 0 
                                       f32_3 %103 = OpFMul %100 %102 
                                       f32_4 %104 = OpLoad %11 
                                       f32_3 %105 = OpVectorShuffle %104 %104 0 1 2 
                                       f32_3 %106 = OpFAdd %103 %105 
                                       f32_4 %107 = OpLoad %50 
                                       f32_4 %108 = OpVectorShuffle %107 %106 4 5 6 3 
                                                      OpStore %50 %108 
                                       f32_4 %109 = OpLoad %9 
                                       f32_3 %110 = OpVectorShuffle %109 %109 0 0 0 
                                       f32_3 %111 = OpExtInst %1 4 %110 
                              Uniform f32_4* %113 = OpAccessChain %21 %112 
                                       f32_4 %114 = OpLoad %113 
                                       f32_3 %115 = OpVectorShuffle %114 %114 0 1 2 
                                       f32_3 %116 = OpFMul %111 %115 
                                       f32_4 %117 = OpLoad %9 
                                       f32_4 %118 = OpVectorShuffle %117 %116 4 1 5 6 
                                                      OpStore %9 %118 
                              Uniform f32_4* %120 = OpAccessChain %21 %119 
                                       f32_4 %121 = OpLoad %120 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                         f32 %123 = OpLoad %84 
                                       f32_3 %124 = OpCompositeConstruct %123 %123 %123 
                                       f32_3 %125 = OpFMul %122 %124 
                                       f32_4 %126 = OpLoad %50 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 1 2 
                                       f32_3 %128 = OpFAdd %125 %127 
                                       f32_4 %129 = OpLoad %50 
                                       f32_4 %130 = OpVectorShuffle %129 %128 4 5 6 3 
                                                      OpStore %50 %130 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 0 2 3 
                              Uniform f32_4* %133 = OpAccessChain %21 %119 
                                       f32_4 %134 = OpLoad %133 
                                       f32_3 %135 = OpVectorShuffle %134 %134 3 3 3 
                                       f32_3 %136 = OpFMul %132 %135 
                                       f32_4 %137 = OpLoad %50 
                                       f32_3 %138 = OpVectorShuffle %137 %137 0 1 2 
                                       f32_3 %139 = OpFAdd %136 %138 
                                       f32_4 %140 = OpLoad %9 
                                       f32_4 %141 = OpVectorShuffle %140 %139 4 5 6 3 
                                                      OpStore %9 %141 
                                       f32_4 %142 = OpLoad %9 
                                       f32_4 %143 = OpVectorShuffle %142 %142 1 1 1 1 
                              Uniform f32_4* %146 = OpAccessChain %21 %144 %145 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpFMul %143 %147 
                                                      OpStore %50 %148 
                              Uniform f32_4* %149 = OpAccessChain %21 %144 %144 
                                       f32_4 %150 = OpLoad %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 0 0 0 
                                       f32_4 %153 = OpFMul %150 %152 
                                       f32_4 %154 = OpLoad %50 
                                       f32_4 %155 = OpFAdd %153 %154 
                                                      OpStore %50 %155 
                              Uniform f32_4* %156 = OpAccessChain %21 %144 %93 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %9 
                                       f32_4 %159 = OpVectorShuffle %158 %158 2 2 2 2 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %50 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore %9 %162 
                                       f32_4 %163 = OpLoad %9 
                                       f32_3 %164 = OpVectorShuffle %163 %163 0 1 2 
                              Uniform f32_4* %165 = OpAccessChain %21 %144 %119 
                                       f32_4 %166 = OpLoad %165 
                                       f32_3 %167 = OpVectorShuffle %166 %166 0 1 2 
                                       f32_3 %168 = OpFAdd %164 %167 
                                       f32_4 %169 = OpLoad %50 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 6 3 
                                                      OpStore %50 %170 
                              Uniform f32_4* %173 = OpAccessChain %21 %144 %119 
                                       f32_4 %174 = OpLoad %173 
                                       f32_4 %175 = OpLoad %11 
                                       f32_4 %176 = OpVectorShuffle %175 %175 3 3 3 3 
                                       f32_4 %177 = OpFMul %174 %176 
                                       f32_4 %178 = OpLoad %9 
                                       f32_4 %179 = OpFAdd %177 %178 
                                                      OpStore vs_TEXCOORD1 %179 
                                       f32_4 %180 = OpLoad %50 
                                       f32_4 %181 = OpVectorShuffle %180 %180 1 1 1 1 
                              Uniform f32_4* %182 = OpAccessChain %21 %145 %145 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpFMul %181 %183 
                                                      OpStore %9 %184 
                              Uniform f32_4* %185 = OpAccessChain %21 %145 %144 
                                       f32_4 %186 = OpLoad %185 
                                       f32_4 %187 = OpLoad %50 
                                       f32_4 %188 = OpVectorShuffle %187 %187 0 0 0 0 
                                       f32_4 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %9 
                                       f32_4 %191 = OpFAdd %189 %190 
                                                      OpStore %9 %191 
                              Uniform f32_4* %192 = OpAccessChain %21 %145 %93 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %50 
                                       f32_4 %195 = OpVectorShuffle %194 %194 2 2 2 2 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %9 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore %9 %198 
                                       f32_4 %203 = OpLoad %9 
                              Uniform f32_4* %204 = OpAccessChain %21 %145 %119 
                                       f32_4 %205 = OpLoad %204 
                                       f32_4 %206 = OpFAdd %203 %205 
                               Output f32_4* %207 = OpAccessChain %202 %144 
                                                      OpStore %207 %206 
                                  Input f32* %208 = OpAccessChain %57 %58 
                                         f32 %209 = OpLoad %208 
                                        bool %210 = OpFOrdLessThan %69 %209 
                                                      OpStore %42 %210 
                                        bool %213 = OpLoad %42 
                                         f32 %215 = OpSelect %213 %214 %69 
                                 Output f32* %217 = OpAccessChain vs_TEXCOORD0 %58 
                                                      OpStore %217 %215 
                                  Input f32* %218 = OpAccessChain %57 %37 
                                         f32 %219 = OpLoad %218 
                                 Output f32* %220 = OpAccessChain vs_TEXCOORD0 %37 
                                                      OpStore %220 %219 
                                 Output f32* %221 = OpAccessChain %202 %144 %58 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpFNegate %222 
                                 Output f32* %224 = OpAccessChain %202 %144 %58 
                                                      OpStore %224 %223 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 55
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %50 %52 
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
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %50 Location 50 
                                             OpDecorate vs_TEXCOORD1 Location 52 
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
                                 f32 %30 = OpConstant 3.674022E-40 
                                     %32 = OpTypeBool 
                                     %33 = OpTypePointer Private %32 
                       Private bool* %34 = OpVariable Private 
                                 f32 %36 = OpConstant 3.674022E-40 
                                     %39 = OpTypeInt 32 1 
                                 i32 %40 = OpConstant 0 
                                 i32 %41 = OpConstant 1 
                                 i32 %43 = OpConstant -1 
                                     %49 = OpTypePointer Output %23 
                       Output f32_4* %50 = OpVariable Output 
                                     %51 = OpTypePointer Input %23 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                                 f32 %31 = OpFAdd %29 %30 
                                             OpStore %28 %31 
                                 f32 %35 = OpLoad %28 
                                bool %37 = OpFOrdLessThan %35 %36 
                                             OpStore %34 %37 
                                bool %38 = OpLoad %34 
                                 i32 %42 = OpSelect %38 %41 %40 
                                 i32 %44 = OpIMul %42 %43 
                                bool %45 = OpINotEqual %44 %40 
                                             OpSelectionMerge %47 None 
                                             OpBranchConditional %45 %46 %47 
                                     %46 = OpLabel 
                                             OpKill
                                     %47 = OpLabel 
                               f32_4 %53 = OpLoad vs_TEXCOORD1 
                                             OpStore %50 %53 
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
 Tags { "RenderType" = "GrassBillboard" }
 Pass {
  Tags { "RenderType" = "GrassBillboard" }
  Cull Off
  GpuProgramID 553361
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
uniform 	mediump vec4 _WavingTint;
uniform 	vec4 _WaveAndDistance;
uniform 	vec4 _CameraPosition;
uniform 	vec3 _CameraRight;
uniform 	vec3 _CameraUp;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_CameraPosition.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_WaveAndDistance.w<u_xlat0.x);
#else
    u_xlatb0 = _WaveAndDistance.w<u_xlat0.x;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : in_TANGENT0.xy;
    u_xlat0.xzw = u_xlat0.xxx * _CameraRight.xyz + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat0.yyy * _CameraUp.xyz + u_xlat0.xzw;
    u_xlat1.xy = u_xlat0.xz * _WaveAndDistance.yy;
    u_xlat2 = u_xlat1.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
    u_xlat1 = u_xlat1.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat2;
    u_xlat1 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat1;
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
    u_xlat2 = u_xlat1 * u_xlat1;
    u_xlat3 = u_xlat1 * u_xlat2;
    u_xlat1 = u_xlat3 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat1;
    u_xlat3 = u_xlat2 * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat1 = u_xlat3 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat1;
    u_xlat1 = u_xlat2 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat2 = u_xlat1 * in_TANGENT0.yyyy;
    u_xlat15 = dot(u_xlat1, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
    u_xlat15 = u_xlat15 * 0.699999988;
    u_xlat1.x = dot(u_xlat2, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
    u_xlat1.z = dot(u_xlat2, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
    u_xlat0.xz = (-u_xlat1.xz) * _WaveAndDistance.zz + u_xlat0.xz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
    u_xlat5 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat5 = (-u_xlat5) + _WaveAndDistance.w;
    u_xlat5 = dot(_CameraPosition.ww, vec2(u_xlat5));
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    vs_COLOR0.w = u_xlat5;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_4.xyz = vec3(u_xlat15) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	mediump vec4 _WavingTint;
uniform 	vec4 _WaveAndDistance;
uniform 	vec4 _CameraPosition;
uniform 	vec3 _CameraRight;
uniform 	vec3 _CameraUp;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_CameraPosition.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_WaveAndDistance.w<u_xlat0.x);
#else
    u_xlatb0 = _WaveAndDistance.w<u_xlat0.x;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : in_TANGENT0.xy;
    u_xlat0.xzw = u_xlat0.xxx * _CameraRight.xyz + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat0.yyy * _CameraUp.xyz + u_xlat0.xzw;
    u_xlat1.xy = u_xlat0.xz * _WaveAndDistance.yy;
    u_xlat2 = u_xlat1.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
    u_xlat1 = u_xlat1.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat2;
    u_xlat1 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat1;
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
    u_xlat2 = u_xlat1 * u_xlat1;
    u_xlat3 = u_xlat1 * u_xlat2;
    u_xlat1 = u_xlat3 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat1;
    u_xlat3 = u_xlat2 * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat1 = u_xlat3 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat1;
    u_xlat1 = u_xlat2 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat2 = u_xlat1 * in_TANGENT0.yyyy;
    u_xlat15 = dot(u_xlat1, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
    u_xlat15 = u_xlat15 * 0.699999988;
    u_xlat1.x = dot(u_xlat2, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
    u_xlat1.z = dot(u_xlat2, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
    u_xlat0.xz = (-u_xlat1.xz) * _WaveAndDistance.zz + u_xlat0.xz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
    u_xlat5 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat5 = (-u_xlat5) + _WaveAndDistance.w;
    u_xlat5 = dot(_CameraPosition.ww, vec2(u_xlat5));
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    vs_COLOR0.w = u_xlat5;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_4.xyz = vec3(u_xlat15) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	mediump vec4 _WavingTint;
uniform 	vec4 _WaveAndDistance;
uniform 	vec4 _CameraPosition;
uniform 	vec3 _CameraRight;
uniform 	vec3 _CameraUp;
in highp vec4 in_POSITION0;
in highp vec4 in_TANGENT0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
float u_xlat5;
float u_xlat15;
void main()
{
    u_xlat0.xyz = in_POSITION0.xyz + (-_CameraPosition.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_WaveAndDistance.w<u_xlat0.x);
#else
    u_xlatb0 = _WaveAndDistance.w<u_xlat0.x;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : in_TANGENT0.xy;
    u_xlat0.xzw = u_xlat0.xxx * _CameraRight.xyz + in_POSITION0.xyz;
    u_xlat0.xyz = u_xlat0.yyy * _CameraUp.xyz + u_xlat0.xzw;
    u_xlat1.xy = u_xlat0.xz * _WaveAndDistance.yy;
    u_xlat2 = u_xlat1.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
    u_xlat1 = u_xlat1.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat2;
    u_xlat1 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat1;
    u_xlat1 = fract(u_xlat1);
    u_xlat1 = u_xlat1 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
    u_xlat2 = u_xlat1 * u_xlat1;
    u_xlat3 = u_xlat1 * u_xlat2;
    u_xlat1 = u_xlat3 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat1;
    u_xlat3 = u_xlat2 * u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat1 = u_xlat3 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat1;
    u_xlat1 = u_xlat2 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat1 = u_xlat1 * u_xlat1;
    u_xlat2 = u_xlat1 * in_TANGENT0.yyyy;
    u_xlat15 = dot(u_xlat1, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
    u_xlat15 = u_xlat15 * 0.699999988;
    u_xlat1.x = dot(u_xlat2, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
    u_xlat1.z = dot(u_xlat2, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
    u_xlat0.xz = (-u_xlat1.xz) * _WaveAndDistance.zz + u_xlat0.xz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2.xyz = u_xlat0.xyz + (-_CameraPosition.xyz);
    u_xlat5 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat5 = (-u_xlat5) + _WaveAndDistance.w;
    u_xlat5 = dot(_CameraPosition.ww, vec2(u_xlat5));
#ifdef UNITY_ADRENO_ES3
    u_xlat5 = min(max(u_xlat5, 0.0), 1.0);
#else
    u_xlat5 = clamp(u_xlat5, 0.0, 1.0);
#endif
    vs_COLOR0.w = u_xlat5;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat1;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_4.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_4.xyz = vec3(u_xlat15) * u_xlat16_4.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = u_xlat16_4.xyz * in_COLOR0.xyz;
    vs_COLOR0.xyz = u_xlat16_4.xyz + u_xlat16_4.xyz;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 348
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %60 %249 %276 %307 %329 %339 %340 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %60 Location 60 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate vs_TEXCOORD1 Location 276 
                                                      OpMemberDecorate %305 0 BuiltIn 305 
                                                      OpMemberDecorate %305 1 BuiltIn 305 
                                                      OpMemberDecorate %305 2 BuiltIn 305 
                                                      OpDecorate %305 Block 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %329 Location 329 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 339 
                                                      OpDecorate %340 Location 340 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %7 %7 %7 %12 %12 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_3; f32_3;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                              %40 = OpTypeBool 
                                              %41 = OpTypePointer Private %40 
                                Private bool* %42 = OpVariable Private 
                                          i32 %43 = OpConstant 3 
                                          u32 %44 = OpConstant 3 
                                              %45 = OpTypePointer Uniform %6 
                                              %52 = OpTypeVector %6 2 
                                              %53 = OpTypePointer Function %52 
                                          f32 %57 = OpConstant 3.674022E-40 
                                        f32_2 %58 = OpConstantComposite %57 %57 
                                 Input f32_4* %60 = OpVariable Input 
                                          i32 %68 = OpConstant 5 
                                              %69 = OpTypePointer Uniform %12 
                                          i32 %80 = OpConstant 6 
                               Private f32_4* %89 = OpVariable Private 
                               Private f32_4* %98 = OpVariable Private 
                                         f32 %101 = OpConstant 3.674022E-40 
                                         f32 %102 = OpConstant 3.674022E-40 
                                         f32 %103 = OpConstant 3.674022E-40 
                                       f32_4 %104 = OpConstantComposite %101 %102 %102 %103 
                                         f32 %108 = OpConstant 3.674022E-40 
                                         f32 %109 = OpConstant 3.674022E-40 
                                         f32 %110 = OpConstant 3.674022E-40 
                                       f32_4 %111 = OpConstantComposite %108 %102 %109 %110 
                                         f32 %118 = OpConstant 3.674022E-40 
                                         f32 %119 = OpConstant 3.674022E-40 
                                         f32 %120 = OpConstant 3.674022E-40 
                                         f32 %121 = OpConstant 3.674022E-40 
                                       f32_4 %122 = OpConstantComposite %118 %119 %120 %121 
                                         f32 %129 = OpConstant 3.674022E-40 
                                       f32_4 %130 = OpConstantComposite %129 %129 %129 %129 
                                         f32 %132 = OpConstant 3.674022E-40 
                                       f32_4 %133 = OpConstantComposite %132 %132 %132 %132 
                              Private f32_4* %138 = OpVariable Private 
                                         f32 %143 = OpConstant 3.674022E-40 
                                       f32_4 %144 = OpConstantComposite %143 %143 %143 %143 
                                         f32 %155 = OpConstant 3.674022E-40 
                                       f32_4 %156 = OpConstantComposite %155 %155 %155 %155 
                                         f32 %161 = OpConstant 3.674022E-40 
                                       f32_4 %162 = OpConstantComposite %161 %161 %161 %161 
                                Private f32* %176 = OpVariable Private 
                                         f32 %178 = OpConstant 3.674022E-40 
                                         f32 %179 = OpConstant 3.674022E-40 
                                         f32 %180 = OpConstant 3.674022E-40 
                                       f32_4 %181 = OpConstantComposite %178 %178 %179 %180 
                                         f32 %184 = OpConstant 3.674022E-40 
                                         f32 %187 = OpConstant 3.674022E-40 
                                         f32 %188 = OpConstant 3.674022E-40 
                                         f32 %189 = OpConstant 3.674022E-40 
                                       f32_4 %190 = OpConstantComposite %110 %187 %188 %189 
                                         f32 %194 = OpConstant 3.674022E-40 
                                         f32 %195 = OpConstant 3.674022E-40 
                                       f32_4 %196 = OpConstantComposite %101 %102 %194 %195 
                                         u32 %198 = OpConstant 2 
                                         i32 %214 = OpConstant 0 
                                         i32 %215 = OpConstant 1 
                                Private f32* %228 = OpVariable Private 
                                         f32 %246 = OpConstant 3.674022E-40 
                                             %248 = OpTypePointer Output %7 
                               Output f32_4* %249 = OpVariable Output 
                                             %251 = OpTypePointer Output %6 
                                         i32 %260 = OpConstant 2 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %303 = OpConstant 1 
                                             %304 = OpTypeArray %6 %303 
                                             %305 = OpTypeStruct %7 %6 %304 
                                             %306 = OpTypePointer Output %305 
        Output struct {f32_4; f32; f32[1];}* %307 = OpVariable Output 
                                             %313 = OpTypePointer Private %12 
                              Private f32_3* %314 = OpVariable Private 
                                         f32 %318 = OpConstant 3.674022E-40 
                                       f32_3 %319 = OpConstantComposite %318 %318 %318 
                                         f32 %325 = OpConstant 3.674022E-40 
                                       f32_3 %326 = OpConstantComposite %325 %325 %325 
                                Input f32_4* %329 = OpVariable Input 
                                             %338 = OpTypePointer Output %52 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %340 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_2* %54 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFNegate %27 
                                        f32_3 %29 = OpFAdd %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                          f32 %36 = OpDot %33 %35 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                                      OpStore %39 %36 
                                 Uniform f32* %46 = OpAccessChain %21 %43 %44 
                                          f32 %47 = OpLoad %46 
                                 Private f32* %48 = OpAccessChain %9 %37 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdLessThan %47 %49 
                                                      OpStore %42 %50 
                                         bool %51 = OpLoad %42 
                                                      OpSelectionMerge %56 None 
                                                      OpBranchConditional %51 %55 %59 
                                              %55 = OpLabel 
                                                      OpStore %54 %58 
                                                      OpBranch %56 
                                              %59 = OpLabel 
                                        f32_4 %61 = OpLoad %60 
                                        f32_2 %62 = OpVectorShuffle %61 %61 0 1 
                                                      OpStore %54 %62 
                                                      OpBranch %56 
                                              %56 = OpLabel 
                                        f32_2 %63 = OpLoad %54 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 2 3 
                                                      OpStore %9 %65 
                                        f32_4 %66 = OpLoad %9 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 0 0 
                               Uniform f32_3* %70 = OpAccessChain %21 %68 
                                        f32_3 %71 = OpLoad %70 
                                        f32_3 %72 = OpFMul %67 %71 
                                        f32_4 %73 = OpLoad %11 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 1 5 6 
                                                      OpStore %9 %77 
                                        f32_4 %78 = OpLoad %9 
                                        f32_3 %79 = OpVectorShuffle %78 %78 1 1 1 
                               Uniform f32_3* %81 = OpAccessChain %21 %80 
                                        f32_3 %82 = OpLoad %81 
                                        f32_3 %83 = OpFMul %79 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 2 3 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 2 
                               Uniform f32_4* %92 = OpAccessChain %21 %43 
                                        f32_4 %93 = OpLoad %92 
                                        f32_2 %94 = OpVectorShuffle %93 %93 1 1 
                                        f32_2 %95 = OpFMul %91 %94 
                                        f32_4 %96 = OpLoad %89 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                      OpStore %89 %97 
                                        f32_4 %99 = OpLoad %89 
                                       f32_4 %100 = OpVectorShuffle %99 %99 1 1 1 1 
                                       f32_4 %105 = OpFMul %100 %104 
                                                      OpStore %98 %105 
                                       f32_4 %106 = OpLoad %89 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 0 0 0 
                                       f32_4 %112 = OpFMul %107 %111 
                                       f32_4 %113 = OpLoad %98 
                                       f32_4 %114 = OpFAdd %112 %113 
                                                      OpStore %89 %114 
                              Uniform f32_4* %115 = OpAccessChain %21 %43 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpVectorShuffle %116 %116 0 0 0 0 
                                       f32_4 %123 = OpFMul %117 %122 
                                       f32_4 %124 = OpLoad %89 
                                       f32_4 %125 = OpFAdd %123 %124 
                                                      OpStore %89 %125 
                                       f32_4 %126 = OpLoad %89 
                                       f32_4 %127 = OpExtInst %1 10 %126 
                                                      OpStore %89 %127 
                                       f32_4 %128 = OpLoad %89 
                                       f32_4 %131 = OpFMul %128 %130 
                                       f32_4 %134 = OpFAdd %131 %133 
                                                      OpStore %89 %134 
                                       f32_4 %135 = OpLoad %89 
                                       f32_4 %136 = OpLoad %89 
                                       f32_4 %137 = OpFMul %135 %136 
                                                      OpStore %98 %137 
                                       f32_4 %139 = OpLoad %89 
                                       f32_4 %140 = OpLoad %98 
                                       f32_4 %141 = OpFMul %139 %140 
                                                      OpStore %138 %141 
                                       f32_4 %142 = OpLoad %138 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %89 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %89 %147 
                                       f32_4 %148 = OpLoad %98 
                                       f32_4 %149 = OpLoad %138 
                                       f32_4 %150 = OpFMul %148 %149 
                                                      OpStore %138 %150 
                                       f32_4 %151 = OpLoad %98 
                                       f32_4 %152 = OpLoad %138 
                                       f32_4 %153 = OpFMul %151 %152 
                                                      OpStore %98 %153 
                                       f32_4 %154 = OpLoad %138 
                                       f32_4 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %89 
                                       f32_4 %159 = OpFAdd %157 %158 
                                                      OpStore %89 %159 
                                       f32_4 %160 = OpLoad %98 
                                       f32_4 %163 = OpFMul %160 %162 
                                       f32_4 %164 = OpLoad %89 
                                       f32_4 %165 = OpFAdd %163 %164 
                                                      OpStore %89 %165 
                                       f32_4 %166 = OpLoad %89 
                                       f32_4 %167 = OpLoad %89 
                                       f32_4 %168 = OpFMul %166 %167 
                                                      OpStore %89 %168 
                                       f32_4 %169 = OpLoad %89 
                                       f32_4 %170 = OpLoad %89 
                                       f32_4 %171 = OpFMul %169 %170 
                                                      OpStore %89 %171 
                                       f32_4 %172 = OpLoad %89 
                                       f32_4 %173 = OpLoad %60 
                                       f32_4 %174 = OpVectorShuffle %173 %173 1 1 1 1 
                                       f32_4 %175 = OpFMul %172 %174 
                                                      OpStore %98 %175 
                                       f32_4 %177 = OpLoad %89 
                                         f32 %182 = OpDot %177 %181 
                                                      OpStore %176 %182 
                                         f32 %183 = OpLoad %176 
                                         f32 %185 = OpFMul %183 %184 
                                                      OpStore %176 %185 
                                       f32_4 %186 = OpLoad %98 
                                         f32 %191 = OpDot %186 %190 
                                Private f32* %192 = OpAccessChain %89 %37 
                                                      OpStore %192 %191 
                                       f32_4 %193 = OpLoad %98 
                                         f32 %197 = OpDot %193 %196 
                                Private f32* %199 = OpAccessChain %89 %198 
                                                      OpStore %199 %197 
                                       f32_4 %200 = OpLoad %89 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 2 
                                       f32_2 %202 = OpFNegate %201 
                              Uniform f32_4* %203 = OpAccessChain %21 %43 
                                       f32_4 %204 = OpLoad %203 
                                       f32_2 %205 = OpVectorShuffle %204 %204 2 2 
                                       f32_2 %206 = OpFMul %202 %205 
                                       f32_4 %207 = OpLoad %9 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 2 
                                       f32_2 %209 = OpFAdd %206 %208 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %211 = OpVectorShuffle %210 %209 4 1 5 3 
                                                      OpStore %9 %211 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpVectorShuffle %212 %212 1 1 1 1 
                              Uniform f32_4* %216 = OpAccessChain %21 %214 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFMul %213 %217 
                                                      OpStore %89 %218 
                                       f32_4 %219 = OpLoad %9 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                              Uniform f32_4* %221 = OpAccessChain %21 %23 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                       f32_3 %224 = OpFNegate %223 
                                       f32_3 %225 = OpFAdd %220 %224 
                                       f32_4 %226 = OpLoad %98 
                                       f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                                      OpStore %98 %227 
                                       f32_4 %229 = OpLoad %98 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                       f32_4 %231 = OpLoad %98 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                         f32 %233 = OpDot %230 %232 
                                                      OpStore %228 %233 
                                         f32 %234 = OpLoad %228 
                                         f32 %235 = OpFNegate %234 
                                Uniform f32* %236 = OpAccessChain %21 %43 %44 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFAdd %235 %237 
                                                      OpStore %228 %238 
                              Uniform f32_4* %239 = OpAccessChain %21 %23 
                                       f32_4 %240 = OpLoad %239 
                                       f32_2 %241 = OpVectorShuffle %240 %240 3 3 
                                         f32 %242 = OpLoad %228 
                                       f32_2 %243 = OpCompositeConstruct %242 %242 
                                         f32 %244 = OpDot %241 %243 
                                                      OpStore %228 %244 
                                         f32 %245 = OpLoad %228 
                                         f32 %247 = OpExtInst %1 43 %245 %57 %246 
                                                      OpStore %228 %247 
                                         f32 %250 = OpLoad %228 
                                 Output f32* %252 = OpAccessChain %249 %44 
                                                      OpStore %252 %250 
                              Uniform f32_4* %253 = OpAccessChain %21 %214 %214 
                                       f32_4 %254 = OpLoad %253 
                                       f32_4 %255 = OpLoad %9 
                                       f32_4 %256 = OpVectorShuffle %255 %255 0 0 0 0 
                                       f32_4 %257 = OpFMul %254 %256 
                                       f32_4 %258 = OpLoad %89 
                                       f32_4 %259 = OpFAdd %257 %258 
                                                      OpStore %89 %259 
                              Uniform f32_4* %261 = OpAccessChain %21 %214 %260 
                                       f32_4 %262 = OpLoad %261 
                                       f32_4 %263 = OpLoad %9 
                                       f32_4 %264 = OpVectorShuffle %263 %263 2 2 2 2 
                                       f32_4 %265 = OpFMul %262 %264 
                                       f32_4 %266 = OpLoad %89 
                                       f32_4 %267 = OpFAdd %265 %266 
                                                      OpStore %89 %267 
                                       f32_4 %268 = OpLoad %89 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                              Uniform f32_4* %270 = OpAccessChain %21 %214 %43 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpFAdd %269 %272 
                                       f32_4 %274 = OpLoad %9 
                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                                      OpStore %9 %275 
                              Uniform f32_4* %277 = OpAccessChain %21 %214 %43 
                                       f32_4 %278 = OpLoad %277 
                                       f32_4 %279 = OpLoad %11 
                                       f32_4 %280 = OpVectorShuffle %279 %279 3 3 3 3 
                                       f32_4 %281 = OpFMul %278 %280 
                                       f32_4 %282 = OpLoad %89 
                                       f32_4 %283 = OpFAdd %281 %282 
                                                      OpStore vs_TEXCOORD1 %283 
                                       f32_4 %284 = OpLoad %9 
                                       f32_4 %285 = OpVectorShuffle %284 %284 1 1 1 1 
                              Uniform f32_4* %286 = OpAccessChain %21 %215 %215 
                                       f32_4 %287 = OpLoad %286 
                                       f32_4 %288 = OpFMul %285 %287 
                                                      OpStore %89 %288 
                              Uniform f32_4* %289 = OpAccessChain %21 %215 %214 
                                       f32_4 %290 = OpLoad %289 
                                       f32_4 %291 = OpLoad %9 
                                       f32_4 %292 = OpVectorShuffle %291 %291 0 0 0 0 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %89 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %89 %295 
                              Uniform f32_4* %296 = OpAccessChain %21 %215 %260 
                                       f32_4 %297 = OpLoad %296 
                                       f32_4 %298 = OpLoad %9 
                                       f32_4 %299 = OpVectorShuffle %298 %298 2 2 2 2 
                                       f32_4 %300 = OpFMul %297 %299 
                                       f32_4 %301 = OpLoad %89 
                                       f32_4 %302 = OpFAdd %300 %301 
                                                      OpStore %89 %302 
                                       f32_4 %308 = OpLoad %89 
                              Uniform f32_4* %309 = OpAccessChain %21 %215 %43 
                                       f32_4 %310 = OpLoad %309 
                                       f32_4 %311 = OpFAdd %308 %310 
                               Output f32_4* %312 = OpAccessChain %307 %214 
                                                      OpStore %312 %311 
                              Uniform f32_4* %315 = OpAccessChain %21 %260 
                                       f32_4 %316 = OpLoad %315 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %320 = OpFAdd %317 %319 
                                                      OpStore %314 %320 
                                         f32 %321 = OpLoad %176 
                                       f32_3 %322 = OpCompositeConstruct %321 %321 %321 
                                       f32_3 %323 = OpLoad %314 
                                       f32_3 %324 = OpFMul %322 %323 
                                       f32_3 %327 = OpFAdd %324 %326 
                                                      OpStore %314 %327 
                                       f32_3 %328 = OpLoad %314 
                                       f32_4 %330 = OpLoad %329 
                                       f32_3 %331 = OpVectorShuffle %330 %330 0 1 2 
                                       f32_3 %332 = OpFMul %328 %331 
                                                      OpStore %314 %332 
                                       f32_3 %333 = OpLoad %314 
                                       f32_3 %334 = OpLoad %314 
                                       f32_3 %335 = OpFAdd %333 %334 
                                       f32_4 %336 = OpLoad %249 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %249 %337 
                                       f32_4 %341 = OpLoad %340 
                                       f32_2 %342 = OpVectorShuffle %341 %341 0 1 
                                                      OpStore vs_TEXCOORD0 %342 
                                 Output f32* %343 = OpAccessChain %307 %214 %303 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFNegate %344 
                                 Output f32* %346 = OpAccessChain %307 %214 %303 
                                                      OpStore %346 %345 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 66
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %31 %62 %63 
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
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 Location 31 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpMemberDecorate %36 0 RelaxedPrecision 
                                             OpMemberDecorate %36 0 Offset 36 
                                             OpDecorate %36 Block 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %49 RelaxedPrecision 
                                             OpDecorate %62 Location 62 
                                             OpDecorate vs_TEXCOORD1 Location 63 
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
                                     %30 = OpTypePointer Input %23 
                        Input f32_4* %31 = OpVariable Input 
                                     %32 = OpTypePointer Input %6 
                                     %36 = OpTypeStruct %6 
                                     %37 = OpTypePointer Uniform %36 
              Uniform struct {f32;}* %38 = OpVariable Uniform 
                                     %39 = OpTypeInt 32 1 
                                 i32 %40 = OpConstant 0 
                                     %41 = OpTypePointer Uniform %6 
                                     %46 = OpTypeBool 
                                     %47 = OpTypePointer Private %46 
                       Private bool* %48 = OpVariable Private 
                                 f32 %50 = OpConstant 3.674022E-40 
                                 i32 %53 = OpConstant 1 
                                 i32 %55 = OpConstant -1 
                                     %61 = OpTypePointer Output %23 
                       Output f32_4* %62 = OpVariable Output 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                          Input f32* %33 = OpAccessChain %31 %26 
                                 f32 %34 = OpLoad %33 
                                 f32 %35 = OpFMul %29 %34 
                        Uniform f32* %42 = OpAccessChain %38 %40 
                                 f32 %43 = OpLoad %42 
                                 f32 %44 = OpFNegate %43 
                                 f32 %45 = OpFAdd %35 %44 
                                             OpStore %28 %45 
                                 f32 %49 = OpLoad %28 
                                bool %51 = OpFOrdLessThan %49 %50 
                                             OpStore %48 %51 
                                bool %52 = OpLoad %48 
                                 i32 %54 = OpSelect %52 %53 %40 
                                 i32 %56 = OpIMul %54 %55 
                                bool %57 = OpINotEqual %56 %40 
                                             OpSelectionMerge %59 None 
                                             OpBranchConditional %57 %58 %59 
                                     %58 = OpLabel 
                                             OpKill
                                     %59 = OpLabel 
                               f32_4 %64 = OpLoad vs_TEXCOORD1 
                                             OpStore %62 %64 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 348
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %60 %249 %276 %307 %329 %339 %340 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %60 Location 60 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate vs_TEXCOORD1 Location 276 
                                                      OpMemberDecorate %305 0 BuiltIn 305 
                                                      OpMemberDecorate %305 1 BuiltIn 305 
                                                      OpMemberDecorate %305 2 BuiltIn 305 
                                                      OpDecorate %305 Block 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %329 Location 329 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 339 
                                                      OpDecorate %340 Location 340 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %7 %7 %7 %12 %12 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_3; f32_3;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                              %40 = OpTypeBool 
                                              %41 = OpTypePointer Private %40 
                                Private bool* %42 = OpVariable Private 
                                          i32 %43 = OpConstant 3 
                                          u32 %44 = OpConstant 3 
                                              %45 = OpTypePointer Uniform %6 
                                              %52 = OpTypeVector %6 2 
                                              %53 = OpTypePointer Function %52 
                                          f32 %57 = OpConstant 3.674022E-40 
                                        f32_2 %58 = OpConstantComposite %57 %57 
                                 Input f32_4* %60 = OpVariable Input 
                                          i32 %68 = OpConstant 5 
                                              %69 = OpTypePointer Uniform %12 
                                          i32 %80 = OpConstant 6 
                               Private f32_4* %89 = OpVariable Private 
                               Private f32_4* %98 = OpVariable Private 
                                         f32 %101 = OpConstant 3.674022E-40 
                                         f32 %102 = OpConstant 3.674022E-40 
                                         f32 %103 = OpConstant 3.674022E-40 
                                       f32_4 %104 = OpConstantComposite %101 %102 %102 %103 
                                         f32 %108 = OpConstant 3.674022E-40 
                                         f32 %109 = OpConstant 3.674022E-40 
                                         f32 %110 = OpConstant 3.674022E-40 
                                       f32_4 %111 = OpConstantComposite %108 %102 %109 %110 
                                         f32 %118 = OpConstant 3.674022E-40 
                                         f32 %119 = OpConstant 3.674022E-40 
                                         f32 %120 = OpConstant 3.674022E-40 
                                         f32 %121 = OpConstant 3.674022E-40 
                                       f32_4 %122 = OpConstantComposite %118 %119 %120 %121 
                                         f32 %129 = OpConstant 3.674022E-40 
                                       f32_4 %130 = OpConstantComposite %129 %129 %129 %129 
                                         f32 %132 = OpConstant 3.674022E-40 
                                       f32_4 %133 = OpConstantComposite %132 %132 %132 %132 
                              Private f32_4* %138 = OpVariable Private 
                                         f32 %143 = OpConstant 3.674022E-40 
                                       f32_4 %144 = OpConstantComposite %143 %143 %143 %143 
                                         f32 %155 = OpConstant 3.674022E-40 
                                       f32_4 %156 = OpConstantComposite %155 %155 %155 %155 
                                         f32 %161 = OpConstant 3.674022E-40 
                                       f32_4 %162 = OpConstantComposite %161 %161 %161 %161 
                                Private f32* %176 = OpVariable Private 
                                         f32 %178 = OpConstant 3.674022E-40 
                                         f32 %179 = OpConstant 3.674022E-40 
                                         f32 %180 = OpConstant 3.674022E-40 
                                       f32_4 %181 = OpConstantComposite %178 %178 %179 %180 
                                         f32 %184 = OpConstant 3.674022E-40 
                                         f32 %187 = OpConstant 3.674022E-40 
                                         f32 %188 = OpConstant 3.674022E-40 
                                         f32 %189 = OpConstant 3.674022E-40 
                                       f32_4 %190 = OpConstantComposite %110 %187 %188 %189 
                                         f32 %194 = OpConstant 3.674022E-40 
                                         f32 %195 = OpConstant 3.674022E-40 
                                       f32_4 %196 = OpConstantComposite %101 %102 %194 %195 
                                         u32 %198 = OpConstant 2 
                                         i32 %214 = OpConstant 0 
                                         i32 %215 = OpConstant 1 
                                Private f32* %228 = OpVariable Private 
                                         f32 %246 = OpConstant 3.674022E-40 
                                             %248 = OpTypePointer Output %7 
                               Output f32_4* %249 = OpVariable Output 
                                             %251 = OpTypePointer Output %6 
                                         i32 %260 = OpConstant 2 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %303 = OpConstant 1 
                                             %304 = OpTypeArray %6 %303 
                                             %305 = OpTypeStruct %7 %6 %304 
                                             %306 = OpTypePointer Output %305 
        Output struct {f32_4; f32; f32[1];}* %307 = OpVariable Output 
                                             %313 = OpTypePointer Private %12 
                              Private f32_3* %314 = OpVariable Private 
                                         f32 %318 = OpConstant 3.674022E-40 
                                       f32_3 %319 = OpConstantComposite %318 %318 %318 
                                         f32 %325 = OpConstant 3.674022E-40 
                                       f32_3 %326 = OpConstantComposite %325 %325 %325 
                                Input f32_4* %329 = OpVariable Input 
                                             %338 = OpTypePointer Output %52 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %340 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_2* %54 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFNegate %27 
                                        f32_3 %29 = OpFAdd %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                          f32 %36 = OpDot %33 %35 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                                      OpStore %39 %36 
                                 Uniform f32* %46 = OpAccessChain %21 %43 %44 
                                          f32 %47 = OpLoad %46 
                                 Private f32* %48 = OpAccessChain %9 %37 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdLessThan %47 %49 
                                                      OpStore %42 %50 
                                         bool %51 = OpLoad %42 
                                                      OpSelectionMerge %56 None 
                                                      OpBranchConditional %51 %55 %59 
                                              %55 = OpLabel 
                                                      OpStore %54 %58 
                                                      OpBranch %56 
                                              %59 = OpLabel 
                                        f32_4 %61 = OpLoad %60 
                                        f32_2 %62 = OpVectorShuffle %61 %61 0 1 
                                                      OpStore %54 %62 
                                                      OpBranch %56 
                                              %56 = OpLabel 
                                        f32_2 %63 = OpLoad %54 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 2 3 
                                                      OpStore %9 %65 
                                        f32_4 %66 = OpLoad %9 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 0 0 
                               Uniform f32_3* %70 = OpAccessChain %21 %68 
                                        f32_3 %71 = OpLoad %70 
                                        f32_3 %72 = OpFMul %67 %71 
                                        f32_4 %73 = OpLoad %11 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 1 5 6 
                                                      OpStore %9 %77 
                                        f32_4 %78 = OpLoad %9 
                                        f32_3 %79 = OpVectorShuffle %78 %78 1 1 1 
                               Uniform f32_3* %81 = OpAccessChain %21 %80 
                                        f32_3 %82 = OpLoad %81 
                                        f32_3 %83 = OpFMul %79 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 2 3 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 2 
                               Uniform f32_4* %92 = OpAccessChain %21 %43 
                                        f32_4 %93 = OpLoad %92 
                                        f32_2 %94 = OpVectorShuffle %93 %93 1 1 
                                        f32_2 %95 = OpFMul %91 %94 
                                        f32_4 %96 = OpLoad %89 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                      OpStore %89 %97 
                                        f32_4 %99 = OpLoad %89 
                                       f32_4 %100 = OpVectorShuffle %99 %99 1 1 1 1 
                                       f32_4 %105 = OpFMul %100 %104 
                                                      OpStore %98 %105 
                                       f32_4 %106 = OpLoad %89 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 0 0 0 
                                       f32_4 %112 = OpFMul %107 %111 
                                       f32_4 %113 = OpLoad %98 
                                       f32_4 %114 = OpFAdd %112 %113 
                                                      OpStore %89 %114 
                              Uniform f32_4* %115 = OpAccessChain %21 %43 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpVectorShuffle %116 %116 0 0 0 0 
                                       f32_4 %123 = OpFMul %117 %122 
                                       f32_4 %124 = OpLoad %89 
                                       f32_4 %125 = OpFAdd %123 %124 
                                                      OpStore %89 %125 
                                       f32_4 %126 = OpLoad %89 
                                       f32_4 %127 = OpExtInst %1 10 %126 
                                                      OpStore %89 %127 
                                       f32_4 %128 = OpLoad %89 
                                       f32_4 %131 = OpFMul %128 %130 
                                       f32_4 %134 = OpFAdd %131 %133 
                                                      OpStore %89 %134 
                                       f32_4 %135 = OpLoad %89 
                                       f32_4 %136 = OpLoad %89 
                                       f32_4 %137 = OpFMul %135 %136 
                                                      OpStore %98 %137 
                                       f32_4 %139 = OpLoad %89 
                                       f32_4 %140 = OpLoad %98 
                                       f32_4 %141 = OpFMul %139 %140 
                                                      OpStore %138 %141 
                                       f32_4 %142 = OpLoad %138 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %89 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %89 %147 
                                       f32_4 %148 = OpLoad %98 
                                       f32_4 %149 = OpLoad %138 
                                       f32_4 %150 = OpFMul %148 %149 
                                                      OpStore %138 %150 
                                       f32_4 %151 = OpLoad %98 
                                       f32_4 %152 = OpLoad %138 
                                       f32_4 %153 = OpFMul %151 %152 
                                                      OpStore %98 %153 
                                       f32_4 %154 = OpLoad %138 
                                       f32_4 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %89 
                                       f32_4 %159 = OpFAdd %157 %158 
                                                      OpStore %89 %159 
                                       f32_4 %160 = OpLoad %98 
                                       f32_4 %163 = OpFMul %160 %162 
                                       f32_4 %164 = OpLoad %89 
                                       f32_4 %165 = OpFAdd %163 %164 
                                                      OpStore %89 %165 
                                       f32_4 %166 = OpLoad %89 
                                       f32_4 %167 = OpLoad %89 
                                       f32_4 %168 = OpFMul %166 %167 
                                                      OpStore %89 %168 
                                       f32_4 %169 = OpLoad %89 
                                       f32_4 %170 = OpLoad %89 
                                       f32_4 %171 = OpFMul %169 %170 
                                                      OpStore %89 %171 
                                       f32_4 %172 = OpLoad %89 
                                       f32_4 %173 = OpLoad %60 
                                       f32_4 %174 = OpVectorShuffle %173 %173 1 1 1 1 
                                       f32_4 %175 = OpFMul %172 %174 
                                                      OpStore %98 %175 
                                       f32_4 %177 = OpLoad %89 
                                         f32 %182 = OpDot %177 %181 
                                                      OpStore %176 %182 
                                         f32 %183 = OpLoad %176 
                                         f32 %185 = OpFMul %183 %184 
                                                      OpStore %176 %185 
                                       f32_4 %186 = OpLoad %98 
                                         f32 %191 = OpDot %186 %190 
                                Private f32* %192 = OpAccessChain %89 %37 
                                                      OpStore %192 %191 
                                       f32_4 %193 = OpLoad %98 
                                         f32 %197 = OpDot %193 %196 
                                Private f32* %199 = OpAccessChain %89 %198 
                                                      OpStore %199 %197 
                                       f32_4 %200 = OpLoad %89 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 2 
                                       f32_2 %202 = OpFNegate %201 
                              Uniform f32_4* %203 = OpAccessChain %21 %43 
                                       f32_4 %204 = OpLoad %203 
                                       f32_2 %205 = OpVectorShuffle %204 %204 2 2 
                                       f32_2 %206 = OpFMul %202 %205 
                                       f32_4 %207 = OpLoad %9 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 2 
                                       f32_2 %209 = OpFAdd %206 %208 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %211 = OpVectorShuffle %210 %209 4 1 5 3 
                                                      OpStore %9 %211 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpVectorShuffle %212 %212 1 1 1 1 
                              Uniform f32_4* %216 = OpAccessChain %21 %214 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFMul %213 %217 
                                                      OpStore %89 %218 
                                       f32_4 %219 = OpLoad %9 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                              Uniform f32_4* %221 = OpAccessChain %21 %23 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                       f32_3 %224 = OpFNegate %223 
                                       f32_3 %225 = OpFAdd %220 %224 
                                       f32_4 %226 = OpLoad %98 
                                       f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                                      OpStore %98 %227 
                                       f32_4 %229 = OpLoad %98 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                       f32_4 %231 = OpLoad %98 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                         f32 %233 = OpDot %230 %232 
                                                      OpStore %228 %233 
                                         f32 %234 = OpLoad %228 
                                         f32 %235 = OpFNegate %234 
                                Uniform f32* %236 = OpAccessChain %21 %43 %44 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFAdd %235 %237 
                                                      OpStore %228 %238 
                              Uniform f32_4* %239 = OpAccessChain %21 %23 
                                       f32_4 %240 = OpLoad %239 
                                       f32_2 %241 = OpVectorShuffle %240 %240 3 3 
                                         f32 %242 = OpLoad %228 
                                       f32_2 %243 = OpCompositeConstruct %242 %242 
                                         f32 %244 = OpDot %241 %243 
                                                      OpStore %228 %244 
                                         f32 %245 = OpLoad %228 
                                         f32 %247 = OpExtInst %1 43 %245 %57 %246 
                                                      OpStore %228 %247 
                                         f32 %250 = OpLoad %228 
                                 Output f32* %252 = OpAccessChain %249 %44 
                                                      OpStore %252 %250 
                              Uniform f32_4* %253 = OpAccessChain %21 %214 %214 
                                       f32_4 %254 = OpLoad %253 
                                       f32_4 %255 = OpLoad %9 
                                       f32_4 %256 = OpVectorShuffle %255 %255 0 0 0 0 
                                       f32_4 %257 = OpFMul %254 %256 
                                       f32_4 %258 = OpLoad %89 
                                       f32_4 %259 = OpFAdd %257 %258 
                                                      OpStore %89 %259 
                              Uniform f32_4* %261 = OpAccessChain %21 %214 %260 
                                       f32_4 %262 = OpLoad %261 
                                       f32_4 %263 = OpLoad %9 
                                       f32_4 %264 = OpVectorShuffle %263 %263 2 2 2 2 
                                       f32_4 %265 = OpFMul %262 %264 
                                       f32_4 %266 = OpLoad %89 
                                       f32_4 %267 = OpFAdd %265 %266 
                                                      OpStore %89 %267 
                                       f32_4 %268 = OpLoad %89 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                              Uniform f32_4* %270 = OpAccessChain %21 %214 %43 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpFAdd %269 %272 
                                       f32_4 %274 = OpLoad %9 
                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                                      OpStore %9 %275 
                              Uniform f32_4* %277 = OpAccessChain %21 %214 %43 
                                       f32_4 %278 = OpLoad %277 
                                       f32_4 %279 = OpLoad %11 
                                       f32_4 %280 = OpVectorShuffle %279 %279 3 3 3 3 
                                       f32_4 %281 = OpFMul %278 %280 
                                       f32_4 %282 = OpLoad %89 
                                       f32_4 %283 = OpFAdd %281 %282 
                                                      OpStore vs_TEXCOORD1 %283 
                                       f32_4 %284 = OpLoad %9 
                                       f32_4 %285 = OpVectorShuffle %284 %284 1 1 1 1 
                              Uniform f32_4* %286 = OpAccessChain %21 %215 %215 
                                       f32_4 %287 = OpLoad %286 
                                       f32_4 %288 = OpFMul %285 %287 
                                                      OpStore %89 %288 
                              Uniform f32_4* %289 = OpAccessChain %21 %215 %214 
                                       f32_4 %290 = OpLoad %289 
                                       f32_4 %291 = OpLoad %9 
                                       f32_4 %292 = OpVectorShuffle %291 %291 0 0 0 0 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %89 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %89 %295 
                              Uniform f32_4* %296 = OpAccessChain %21 %215 %260 
                                       f32_4 %297 = OpLoad %296 
                                       f32_4 %298 = OpLoad %9 
                                       f32_4 %299 = OpVectorShuffle %298 %298 2 2 2 2 
                                       f32_4 %300 = OpFMul %297 %299 
                                       f32_4 %301 = OpLoad %89 
                                       f32_4 %302 = OpFAdd %300 %301 
                                                      OpStore %89 %302 
                                       f32_4 %308 = OpLoad %89 
                              Uniform f32_4* %309 = OpAccessChain %21 %215 %43 
                                       f32_4 %310 = OpLoad %309 
                                       f32_4 %311 = OpFAdd %308 %310 
                               Output f32_4* %312 = OpAccessChain %307 %214 
                                                      OpStore %312 %311 
                              Uniform f32_4* %315 = OpAccessChain %21 %260 
                                       f32_4 %316 = OpLoad %315 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %320 = OpFAdd %317 %319 
                                                      OpStore %314 %320 
                                         f32 %321 = OpLoad %176 
                                       f32_3 %322 = OpCompositeConstruct %321 %321 %321 
                                       f32_3 %323 = OpLoad %314 
                                       f32_3 %324 = OpFMul %322 %323 
                                       f32_3 %327 = OpFAdd %324 %326 
                                                      OpStore %314 %327 
                                       f32_3 %328 = OpLoad %314 
                                       f32_4 %330 = OpLoad %329 
                                       f32_3 %331 = OpVectorShuffle %330 %330 0 1 2 
                                       f32_3 %332 = OpFMul %328 %331 
                                                      OpStore %314 %332 
                                       f32_3 %333 = OpLoad %314 
                                       f32_3 %334 = OpLoad %314 
                                       f32_3 %335 = OpFAdd %333 %334 
                                       f32_4 %336 = OpLoad %249 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %249 %337 
                                       f32_4 %341 = OpLoad %340 
                                       f32_2 %342 = OpVectorShuffle %341 %341 0 1 
                                                      OpStore vs_TEXCOORD0 %342 
                                 Output f32* %343 = OpAccessChain %307 %214 %303 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFNegate %344 
                                 Output f32* %346 = OpAccessChain %307 %214 %303 
                                                      OpStore %346 %345 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 66
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %31 %62 %63 
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
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 Location 31 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpMemberDecorate %36 0 RelaxedPrecision 
                                             OpMemberDecorate %36 0 Offset 36 
                                             OpDecorate %36 Block 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %49 RelaxedPrecision 
                                             OpDecorate %62 Location 62 
                                             OpDecorate vs_TEXCOORD1 Location 63 
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
                                     %30 = OpTypePointer Input %23 
                        Input f32_4* %31 = OpVariable Input 
                                     %32 = OpTypePointer Input %6 
                                     %36 = OpTypeStruct %6 
                                     %37 = OpTypePointer Uniform %36 
              Uniform struct {f32;}* %38 = OpVariable Uniform 
                                     %39 = OpTypeInt 32 1 
                                 i32 %40 = OpConstant 0 
                                     %41 = OpTypePointer Uniform %6 
                                     %46 = OpTypeBool 
                                     %47 = OpTypePointer Private %46 
                       Private bool* %48 = OpVariable Private 
                                 f32 %50 = OpConstant 3.674022E-40 
                                 i32 %53 = OpConstant 1 
                                 i32 %55 = OpConstant -1 
                                     %61 = OpTypePointer Output %23 
                       Output f32_4* %62 = OpVariable Output 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                          Input f32* %33 = OpAccessChain %31 %26 
                                 f32 %34 = OpLoad %33 
                                 f32 %35 = OpFMul %29 %34 
                        Uniform f32* %42 = OpAccessChain %38 %40 
                                 f32 %43 = OpLoad %42 
                                 f32 %44 = OpFNegate %43 
                                 f32 %45 = OpFAdd %35 %44 
                                             OpStore %28 %45 
                                 f32 %49 = OpLoad %28 
                                bool %51 = OpFOrdLessThan %49 %50 
                                             OpStore %48 %51 
                                bool %52 = OpLoad %48 
                                 i32 %54 = OpSelect %52 %53 %40 
                                 i32 %56 = OpIMul %54 %55 
                                bool %57 = OpINotEqual %56 %40 
                                             OpSelectionMerge %59 None 
                                             OpBranchConditional %57 %58 %59 
                                     %58 = OpLabel 
                                             OpKill
                                     %59 = OpLabel 
                               f32_4 %64 = OpLoad vs_TEXCOORD1 
                                             OpStore %62 %64 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 348
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %60 %249 %276 %307 %329 %339 %340 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpMemberDecorate %19 5 Offset 19 
                                                      OpMemberDecorate %19 6 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %60 Location 60 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %249 Location 249 
                                                      OpDecorate vs_TEXCOORD1 Location 276 
                                                      OpMemberDecorate %305 0 BuiltIn 305 
                                                      OpMemberDecorate %305 1 BuiltIn 305 
                                                      OpMemberDecorate %305 2 BuiltIn 305 
                                                      OpDecorate %305 Block 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %316 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %328 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %329 Location 329 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %331 RelaxedPrecision 
                                                      OpDecorate %332 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %335 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 339 
                                                      OpDecorate %340 Location 340 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                              %15 = OpTypeInt 32 0 
                                          u32 %16 = OpConstant 4 
                                              %17 = OpTypeArray %7 %16 
                                              %18 = OpTypeArray %7 %16 
                                              %19 = OpTypeStruct %17 %18 %7 %7 %7 %12 %12 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_3; f32_3;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 4 
                                              %24 = OpTypePointer Uniform %7 
                                          u32 %37 = OpConstant 0 
                                              %38 = OpTypePointer Private %6 
                                              %40 = OpTypeBool 
                                              %41 = OpTypePointer Private %40 
                                Private bool* %42 = OpVariable Private 
                                          i32 %43 = OpConstant 3 
                                          u32 %44 = OpConstant 3 
                                              %45 = OpTypePointer Uniform %6 
                                              %52 = OpTypeVector %6 2 
                                              %53 = OpTypePointer Function %52 
                                          f32 %57 = OpConstant 3.674022E-40 
                                        f32_2 %58 = OpConstantComposite %57 %57 
                                 Input f32_4* %60 = OpVariable Input 
                                          i32 %68 = OpConstant 5 
                                              %69 = OpTypePointer Uniform %12 
                                          i32 %80 = OpConstant 6 
                               Private f32_4* %89 = OpVariable Private 
                               Private f32_4* %98 = OpVariable Private 
                                         f32 %101 = OpConstant 3.674022E-40 
                                         f32 %102 = OpConstant 3.674022E-40 
                                         f32 %103 = OpConstant 3.674022E-40 
                                       f32_4 %104 = OpConstantComposite %101 %102 %102 %103 
                                         f32 %108 = OpConstant 3.674022E-40 
                                         f32 %109 = OpConstant 3.674022E-40 
                                         f32 %110 = OpConstant 3.674022E-40 
                                       f32_4 %111 = OpConstantComposite %108 %102 %109 %110 
                                         f32 %118 = OpConstant 3.674022E-40 
                                         f32 %119 = OpConstant 3.674022E-40 
                                         f32 %120 = OpConstant 3.674022E-40 
                                         f32 %121 = OpConstant 3.674022E-40 
                                       f32_4 %122 = OpConstantComposite %118 %119 %120 %121 
                                         f32 %129 = OpConstant 3.674022E-40 
                                       f32_4 %130 = OpConstantComposite %129 %129 %129 %129 
                                         f32 %132 = OpConstant 3.674022E-40 
                                       f32_4 %133 = OpConstantComposite %132 %132 %132 %132 
                              Private f32_4* %138 = OpVariable Private 
                                         f32 %143 = OpConstant 3.674022E-40 
                                       f32_4 %144 = OpConstantComposite %143 %143 %143 %143 
                                         f32 %155 = OpConstant 3.674022E-40 
                                       f32_4 %156 = OpConstantComposite %155 %155 %155 %155 
                                         f32 %161 = OpConstant 3.674022E-40 
                                       f32_4 %162 = OpConstantComposite %161 %161 %161 %161 
                                Private f32* %176 = OpVariable Private 
                                         f32 %178 = OpConstant 3.674022E-40 
                                         f32 %179 = OpConstant 3.674022E-40 
                                         f32 %180 = OpConstant 3.674022E-40 
                                       f32_4 %181 = OpConstantComposite %178 %178 %179 %180 
                                         f32 %184 = OpConstant 3.674022E-40 
                                         f32 %187 = OpConstant 3.674022E-40 
                                         f32 %188 = OpConstant 3.674022E-40 
                                         f32 %189 = OpConstant 3.674022E-40 
                                       f32_4 %190 = OpConstantComposite %110 %187 %188 %189 
                                         f32 %194 = OpConstant 3.674022E-40 
                                         f32 %195 = OpConstant 3.674022E-40 
                                       f32_4 %196 = OpConstantComposite %101 %102 %194 %195 
                                         u32 %198 = OpConstant 2 
                                         i32 %214 = OpConstant 0 
                                         i32 %215 = OpConstant 1 
                                Private f32* %228 = OpVariable Private 
                                         f32 %246 = OpConstant 3.674022E-40 
                                             %248 = OpTypePointer Output %7 
                               Output f32_4* %249 = OpVariable Output 
                                             %251 = OpTypePointer Output %6 
                                         i32 %260 = OpConstant 2 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %303 = OpConstant 1 
                                             %304 = OpTypeArray %6 %303 
                                             %305 = OpTypeStruct %7 %6 %304 
                                             %306 = OpTypePointer Output %305 
        Output struct {f32_4; f32; f32[1];}* %307 = OpVariable Output 
                                             %313 = OpTypePointer Private %12 
                              Private f32_3* %314 = OpVariable Private 
                                         f32 %318 = OpConstant 3.674022E-40 
                                       f32_3 %319 = OpConstantComposite %318 %318 %318 
                                         f32 %325 = OpConstant 3.674022E-40 
                                       f32_3 %326 = OpConstantComposite %325 %325 %325 
                                Input f32_4* %329 = OpVariable Input 
                                             %338 = OpTypePointer Output %52 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %340 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_2* %54 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_3 %27 = OpVectorShuffle %26 %26 0 1 2 
                                        f32_3 %28 = OpFNegate %27 
                                        f32_3 %29 = OpFAdd %14 %28 
                                        f32_4 %30 = OpLoad %9 
                                        f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                                      OpStore %9 %31 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 1 2 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 1 2 
                                          f32 %36 = OpDot %33 %35 
                                 Private f32* %39 = OpAccessChain %9 %37 
                                                      OpStore %39 %36 
                                 Uniform f32* %46 = OpAccessChain %21 %43 %44 
                                          f32 %47 = OpLoad %46 
                                 Private f32* %48 = OpAccessChain %9 %37 
                                          f32 %49 = OpLoad %48 
                                         bool %50 = OpFOrdLessThan %47 %49 
                                                      OpStore %42 %50 
                                         bool %51 = OpLoad %42 
                                                      OpSelectionMerge %56 None 
                                                      OpBranchConditional %51 %55 %59 
                                              %55 = OpLabel 
                                                      OpStore %54 %58 
                                                      OpBranch %56 
                                              %59 = OpLabel 
                                        f32_4 %61 = OpLoad %60 
                                        f32_2 %62 = OpVectorShuffle %61 %61 0 1 
                                                      OpStore %54 %62 
                                                      OpBranch %56 
                                              %56 = OpLabel 
                                        f32_2 %63 = OpLoad %54 
                                        f32_4 %64 = OpLoad %9 
                                        f32_4 %65 = OpVectorShuffle %64 %63 4 5 2 3 
                                                      OpStore %9 %65 
                                        f32_4 %66 = OpLoad %9 
                                        f32_3 %67 = OpVectorShuffle %66 %66 0 0 0 
                               Uniform f32_3* %70 = OpAccessChain %21 %68 
                                        f32_3 %71 = OpLoad %70 
                                        f32_3 %72 = OpFMul %67 %71 
                                        f32_4 %73 = OpLoad %11 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 1 2 
                                        f32_3 %75 = OpFAdd %72 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_4 %77 = OpVectorShuffle %76 %75 4 1 5 6 
                                                      OpStore %9 %77 
                                        f32_4 %78 = OpLoad %9 
                                        f32_3 %79 = OpVectorShuffle %78 %78 1 1 1 
                               Uniform f32_3* %81 = OpAccessChain %21 %80 
                                        f32_3 %82 = OpLoad %81 
                                        f32_3 %83 = OpFMul %79 %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_3 %85 = OpVectorShuffle %84 %84 0 2 3 
                                        f32_3 %86 = OpFAdd %83 %85 
                                        f32_4 %87 = OpLoad %9 
                                        f32_4 %88 = OpVectorShuffle %87 %86 4 5 6 3 
                                                      OpStore %9 %88 
                                        f32_4 %90 = OpLoad %9 
                                        f32_2 %91 = OpVectorShuffle %90 %90 0 2 
                               Uniform f32_4* %92 = OpAccessChain %21 %43 
                                        f32_4 %93 = OpLoad %92 
                                        f32_2 %94 = OpVectorShuffle %93 %93 1 1 
                                        f32_2 %95 = OpFMul %91 %94 
                                        f32_4 %96 = OpLoad %89 
                                        f32_4 %97 = OpVectorShuffle %96 %95 4 5 2 3 
                                                      OpStore %89 %97 
                                        f32_4 %99 = OpLoad %89 
                                       f32_4 %100 = OpVectorShuffle %99 %99 1 1 1 1 
                                       f32_4 %105 = OpFMul %100 %104 
                                                      OpStore %98 %105 
                                       f32_4 %106 = OpLoad %89 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 0 0 0 
                                       f32_4 %112 = OpFMul %107 %111 
                                       f32_4 %113 = OpLoad %98 
                                       f32_4 %114 = OpFAdd %112 %113 
                                                      OpStore %89 %114 
                              Uniform f32_4* %115 = OpAccessChain %21 %43 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpVectorShuffle %116 %116 0 0 0 0 
                                       f32_4 %123 = OpFMul %117 %122 
                                       f32_4 %124 = OpLoad %89 
                                       f32_4 %125 = OpFAdd %123 %124 
                                                      OpStore %89 %125 
                                       f32_4 %126 = OpLoad %89 
                                       f32_4 %127 = OpExtInst %1 10 %126 
                                                      OpStore %89 %127 
                                       f32_4 %128 = OpLoad %89 
                                       f32_4 %131 = OpFMul %128 %130 
                                       f32_4 %134 = OpFAdd %131 %133 
                                                      OpStore %89 %134 
                                       f32_4 %135 = OpLoad %89 
                                       f32_4 %136 = OpLoad %89 
                                       f32_4 %137 = OpFMul %135 %136 
                                                      OpStore %98 %137 
                                       f32_4 %139 = OpLoad %89 
                                       f32_4 %140 = OpLoad %98 
                                       f32_4 %141 = OpFMul %139 %140 
                                                      OpStore %138 %141 
                                       f32_4 %142 = OpLoad %138 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %89 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %89 %147 
                                       f32_4 %148 = OpLoad %98 
                                       f32_4 %149 = OpLoad %138 
                                       f32_4 %150 = OpFMul %148 %149 
                                                      OpStore %138 %150 
                                       f32_4 %151 = OpLoad %98 
                                       f32_4 %152 = OpLoad %138 
                                       f32_4 %153 = OpFMul %151 %152 
                                                      OpStore %98 %153 
                                       f32_4 %154 = OpLoad %138 
                                       f32_4 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %89 
                                       f32_4 %159 = OpFAdd %157 %158 
                                                      OpStore %89 %159 
                                       f32_4 %160 = OpLoad %98 
                                       f32_4 %163 = OpFMul %160 %162 
                                       f32_4 %164 = OpLoad %89 
                                       f32_4 %165 = OpFAdd %163 %164 
                                                      OpStore %89 %165 
                                       f32_4 %166 = OpLoad %89 
                                       f32_4 %167 = OpLoad %89 
                                       f32_4 %168 = OpFMul %166 %167 
                                                      OpStore %89 %168 
                                       f32_4 %169 = OpLoad %89 
                                       f32_4 %170 = OpLoad %89 
                                       f32_4 %171 = OpFMul %169 %170 
                                                      OpStore %89 %171 
                                       f32_4 %172 = OpLoad %89 
                                       f32_4 %173 = OpLoad %60 
                                       f32_4 %174 = OpVectorShuffle %173 %173 1 1 1 1 
                                       f32_4 %175 = OpFMul %172 %174 
                                                      OpStore %98 %175 
                                       f32_4 %177 = OpLoad %89 
                                         f32 %182 = OpDot %177 %181 
                                                      OpStore %176 %182 
                                         f32 %183 = OpLoad %176 
                                         f32 %185 = OpFMul %183 %184 
                                                      OpStore %176 %185 
                                       f32_4 %186 = OpLoad %98 
                                         f32 %191 = OpDot %186 %190 
                                Private f32* %192 = OpAccessChain %89 %37 
                                                      OpStore %192 %191 
                                       f32_4 %193 = OpLoad %98 
                                         f32 %197 = OpDot %193 %196 
                                Private f32* %199 = OpAccessChain %89 %198 
                                                      OpStore %199 %197 
                                       f32_4 %200 = OpLoad %89 
                                       f32_2 %201 = OpVectorShuffle %200 %200 0 2 
                                       f32_2 %202 = OpFNegate %201 
                              Uniform f32_4* %203 = OpAccessChain %21 %43 
                                       f32_4 %204 = OpLoad %203 
                                       f32_2 %205 = OpVectorShuffle %204 %204 2 2 
                                       f32_2 %206 = OpFMul %202 %205 
                                       f32_4 %207 = OpLoad %9 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 2 
                                       f32_2 %209 = OpFAdd %206 %208 
                                       f32_4 %210 = OpLoad %9 
                                       f32_4 %211 = OpVectorShuffle %210 %209 4 1 5 3 
                                                      OpStore %9 %211 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpVectorShuffle %212 %212 1 1 1 1 
                              Uniform f32_4* %216 = OpAccessChain %21 %214 %215 
                                       f32_4 %217 = OpLoad %216 
                                       f32_4 %218 = OpFMul %213 %217 
                                                      OpStore %89 %218 
                                       f32_4 %219 = OpLoad %9 
                                       f32_3 %220 = OpVectorShuffle %219 %219 0 1 2 
                              Uniform f32_4* %221 = OpAccessChain %21 %23 
                                       f32_4 %222 = OpLoad %221 
                                       f32_3 %223 = OpVectorShuffle %222 %222 0 1 2 
                                       f32_3 %224 = OpFNegate %223 
                                       f32_3 %225 = OpFAdd %220 %224 
                                       f32_4 %226 = OpLoad %98 
                                       f32_4 %227 = OpVectorShuffle %226 %225 4 5 6 3 
                                                      OpStore %98 %227 
                                       f32_4 %229 = OpLoad %98 
                                       f32_3 %230 = OpVectorShuffle %229 %229 0 1 2 
                                       f32_4 %231 = OpLoad %98 
                                       f32_3 %232 = OpVectorShuffle %231 %231 0 1 2 
                                         f32 %233 = OpDot %230 %232 
                                                      OpStore %228 %233 
                                         f32 %234 = OpLoad %228 
                                         f32 %235 = OpFNegate %234 
                                Uniform f32* %236 = OpAccessChain %21 %43 %44 
                                         f32 %237 = OpLoad %236 
                                         f32 %238 = OpFAdd %235 %237 
                                                      OpStore %228 %238 
                              Uniform f32_4* %239 = OpAccessChain %21 %23 
                                       f32_4 %240 = OpLoad %239 
                                       f32_2 %241 = OpVectorShuffle %240 %240 3 3 
                                         f32 %242 = OpLoad %228 
                                       f32_2 %243 = OpCompositeConstruct %242 %242 
                                         f32 %244 = OpDot %241 %243 
                                                      OpStore %228 %244 
                                         f32 %245 = OpLoad %228 
                                         f32 %247 = OpExtInst %1 43 %245 %57 %246 
                                                      OpStore %228 %247 
                                         f32 %250 = OpLoad %228 
                                 Output f32* %252 = OpAccessChain %249 %44 
                                                      OpStore %252 %250 
                              Uniform f32_4* %253 = OpAccessChain %21 %214 %214 
                                       f32_4 %254 = OpLoad %253 
                                       f32_4 %255 = OpLoad %9 
                                       f32_4 %256 = OpVectorShuffle %255 %255 0 0 0 0 
                                       f32_4 %257 = OpFMul %254 %256 
                                       f32_4 %258 = OpLoad %89 
                                       f32_4 %259 = OpFAdd %257 %258 
                                                      OpStore %89 %259 
                              Uniform f32_4* %261 = OpAccessChain %21 %214 %260 
                                       f32_4 %262 = OpLoad %261 
                                       f32_4 %263 = OpLoad %9 
                                       f32_4 %264 = OpVectorShuffle %263 %263 2 2 2 2 
                                       f32_4 %265 = OpFMul %262 %264 
                                       f32_4 %266 = OpLoad %89 
                                       f32_4 %267 = OpFAdd %265 %266 
                                                      OpStore %89 %267 
                                       f32_4 %268 = OpLoad %89 
                                       f32_3 %269 = OpVectorShuffle %268 %268 0 1 2 
                              Uniform f32_4* %270 = OpAccessChain %21 %214 %43 
                                       f32_4 %271 = OpLoad %270 
                                       f32_3 %272 = OpVectorShuffle %271 %271 0 1 2 
                                       f32_3 %273 = OpFAdd %269 %272 
                                       f32_4 %274 = OpLoad %9 
                                       f32_4 %275 = OpVectorShuffle %274 %273 4 5 6 3 
                                                      OpStore %9 %275 
                              Uniform f32_4* %277 = OpAccessChain %21 %214 %43 
                                       f32_4 %278 = OpLoad %277 
                                       f32_4 %279 = OpLoad %11 
                                       f32_4 %280 = OpVectorShuffle %279 %279 3 3 3 3 
                                       f32_4 %281 = OpFMul %278 %280 
                                       f32_4 %282 = OpLoad %89 
                                       f32_4 %283 = OpFAdd %281 %282 
                                                      OpStore vs_TEXCOORD1 %283 
                                       f32_4 %284 = OpLoad %9 
                                       f32_4 %285 = OpVectorShuffle %284 %284 1 1 1 1 
                              Uniform f32_4* %286 = OpAccessChain %21 %215 %215 
                                       f32_4 %287 = OpLoad %286 
                                       f32_4 %288 = OpFMul %285 %287 
                                                      OpStore %89 %288 
                              Uniform f32_4* %289 = OpAccessChain %21 %215 %214 
                                       f32_4 %290 = OpLoad %289 
                                       f32_4 %291 = OpLoad %9 
                                       f32_4 %292 = OpVectorShuffle %291 %291 0 0 0 0 
                                       f32_4 %293 = OpFMul %290 %292 
                                       f32_4 %294 = OpLoad %89 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %89 %295 
                              Uniform f32_4* %296 = OpAccessChain %21 %215 %260 
                                       f32_4 %297 = OpLoad %296 
                                       f32_4 %298 = OpLoad %9 
                                       f32_4 %299 = OpVectorShuffle %298 %298 2 2 2 2 
                                       f32_4 %300 = OpFMul %297 %299 
                                       f32_4 %301 = OpLoad %89 
                                       f32_4 %302 = OpFAdd %300 %301 
                                                      OpStore %89 %302 
                                       f32_4 %308 = OpLoad %89 
                              Uniform f32_4* %309 = OpAccessChain %21 %215 %43 
                                       f32_4 %310 = OpLoad %309 
                                       f32_4 %311 = OpFAdd %308 %310 
                               Output f32_4* %312 = OpAccessChain %307 %214 
                                                      OpStore %312 %311 
                              Uniform f32_4* %315 = OpAccessChain %21 %260 
                                       f32_4 %316 = OpLoad %315 
                                       f32_3 %317 = OpVectorShuffle %316 %316 0 1 2 
                                       f32_3 %320 = OpFAdd %317 %319 
                                                      OpStore %314 %320 
                                         f32 %321 = OpLoad %176 
                                       f32_3 %322 = OpCompositeConstruct %321 %321 %321 
                                       f32_3 %323 = OpLoad %314 
                                       f32_3 %324 = OpFMul %322 %323 
                                       f32_3 %327 = OpFAdd %324 %326 
                                                      OpStore %314 %327 
                                       f32_3 %328 = OpLoad %314 
                                       f32_4 %330 = OpLoad %329 
                                       f32_3 %331 = OpVectorShuffle %330 %330 0 1 2 
                                       f32_3 %332 = OpFMul %328 %331 
                                                      OpStore %314 %332 
                                       f32_3 %333 = OpLoad %314 
                                       f32_3 %334 = OpLoad %314 
                                       f32_3 %335 = OpFAdd %333 %334 
                                       f32_4 %336 = OpLoad %249 
                                       f32_4 %337 = OpVectorShuffle %336 %335 4 5 6 3 
                                                      OpStore %249 %337 
                                       f32_4 %341 = OpLoad %340 
                                       f32_2 %342 = OpVectorShuffle %341 %341 0 1 
                                                      OpStore vs_TEXCOORD0 %342 
                                 Output f32* %343 = OpAccessChain %307 %214 %303 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFNegate %344 
                                 Output f32* %346 = OpAccessChain %307 %214 %303 
                                                      OpStore %346 %345 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 66
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %31 %62 %63 
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
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 Location 31 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpMemberDecorate %36 0 RelaxedPrecision 
                                             OpMemberDecorate %36 0 Offset 36 
                                             OpDecorate %36 Block 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %49 RelaxedPrecision 
                                             OpDecorate %62 Location 62 
                                             OpDecorate vs_TEXCOORD1 Location 63 
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
                                     %30 = OpTypePointer Input %23 
                        Input f32_4* %31 = OpVariable Input 
                                     %32 = OpTypePointer Input %6 
                                     %36 = OpTypeStruct %6 
                                     %37 = OpTypePointer Uniform %36 
              Uniform struct {f32;}* %38 = OpVariable Uniform 
                                     %39 = OpTypeInt 32 1 
                                 i32 %40 = OpConstant 0 
                                     %41 = OpTypePointer Uniform %6 
                                     %46 = OpTypeBool 
                                     %47 = OpTypePointer Private %46 
                       Private bool* %48 = OpVariable Private 
                                 f32 %50 = OpConstant 3.674022E-40 
                                 i32 %53 = OpConstant 1 
                                 i32 %55 = OpConstant -1 
                                     %61 = OpTypePointer Output %23 
                       Output f32_4* %62 = OpVariable Output 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                          Input f32* %33 = OpAccessChain %31 %26 
                                 f32 %34 = OpLoad %33 
                                 f32 %35 = OpFMul %29 %34 
                        Uniform f32* %42 = OpAccessChain %38 %40 
                                 f32 %43 = OpLoad %42 
                                 f32 %44 = OpFNegate %43 
                                 f32 %45 = OpFAdd %35 %44 
                                             OpStore %28 %45 
                                 f32 %49 = OpLoad %28 
                                bool %51 = OpFOrdLessThan %49 %50 
                                             OpStore %48 %51 
                                bool %52 = OpLoad %48 
                                 i32 %54 = OpSelect %52 %53 %40 
                                 i32 %56 = OpIMul %54 %55 
                                bool %57 = OpINotEqual %56 %40 
                                             OpSelectionMerge %59 None 
                                             OpBranchConditional %57 %58 %59 
                                     %58 = OpLabel 
                                             OpKill
                                     %59 = OpLabel 
                               f32_4 %64 = OpLoad vs_TEXCOORD1 
                                             OpStore %62 %64 
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
 Tags { "RenderType" = "Grass" }
 Pass {
  Tags { "RenderType" = "Grass" }
  Cull Off
  GpuProgramID 649013
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
uniform 	mediump vec4 _WavingTint;
uniform 	vec4 _WaveAndDistance;
uniform 	vec4 _CameraPosition;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = in_POSITION0.xz * _WaveAndDistance.yy;
    u_xlat1 = u_xlat0.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
    u_xlat0 = u_xlat0.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat1;
    u_xlat0 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat0;
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
    u_xlat1 = u_xlat0 * u_xlat0;
    u_xlat2 = u_xlat0 * u_xlat1;
    u_xlat0 = u_xlat2 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat0;
    u_xlat2 = u_xlat1 * u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat0 = u_xlat2 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat0;
    u_xlat0 = u_xlat1 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = in_COLOR0.w * _WaveAndDistance.z;
    u_xlat1 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0.x = dot(u_xlat0, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
    u_xlat0.x = u_xlat0.x * 0.699999988;
    u_xlat2.x = dot(u_xlat1, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
    u_xlat2.z = dot(u_xlat1, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
    u_xlat1.xz = (-u_xlat2.xz) * _WaveAndDistance.zz + in_POSITION0.xz;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat4.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat2;
    u_xlat2 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat2;
    gl_Position = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_3.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_COLOR0.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_3.xyz;
    u_xlat1.y = in_POSITION0.y;
    u_xlat0.xyz = u_xlat1.xyz + (-_CameraPosition.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + _WaveAndDistance.w;
    u_xlat0.x = dot(_CameraPosition.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_COLOR0.w = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	mediump vec4 _WavingTint;
uniform 	vec4 _WaveAndDistance;
uniform 	vec4 _CameraPosition;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = in_POSITION0.xz * _WaveAndDistance.yy;
    u_xlat1 = u_xlat0.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
    u_xlat0 = u_xlat0.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat1;
    u_xlat0 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat0;
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
    u_xlat1 = u_xlat0 * u_xlat0;
    u_xlat2 = u_xlat0 * u_xlat1;
    u_xlat0 = u_xlat2 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat0;
    u_xlat2 = u_xlat1 * u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat0 = u_xlat2 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat0;
    u_xlat0 = u_xlat1 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = in_COLOR0.w * _WaveAndDistance.z;
    u_xlat1 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0.x = dot(u_xlat0, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
    u_xlat0.x = u_xlat0.x * 0.699999988;
    u_xlat2.x = dot(u_xlat1, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
    u_xlat2.z = dot(u_xlat1, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
    u_xlat1.xz = (-u_xlat2.xz) * _WaveAndDistance.zz + in_POSITION0.xz;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat4.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat2;
    u_xlat2 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat2;
    gl_Position = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_3.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_COLOR0.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_3.xyz;
    u_xlat1.y = in_POSITION0.y;
    u_xlat0.xyz = u_xlat1.xyz + (-_CameraPosition.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + _WaveAndDistance.w;
    u_xlat0.x = dot(_CameraPosition.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_COLOR0.w = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD1;
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
uniform 	mediump vec4 _WavingTint;
uniform 	vec4 _WaveAndDistance;
uniform 	vec4 _CameraPosition;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
void main()
{
    u_xlat0.xy = in_POSITION0.xz * _WaveAndDistance.yy;
    u_xlat1 = u_xlat0.yyyy * vec4(0.00600000005, 0.0199999996, 0.0199999996, 0.0500000007);
    u_xlat0 = u_xlat0.xxxx * vec4(0.0120000001, 0.0199999996, 0.0599999987, 0.0240000002) + u_xlat1;
    u_xlat0 = _WaveAndDistance.xxxx * vec4(1.20000005, 2.0, 1.60000002, 4.80000019) + u_xlat0;
    u_xlat0 = fract(u_xlat0);
    u_xlat0 = u_xlat0 * vec4(6.40884876, 6.40884876, 6.40884876, 6.40884876) + vec4(-3.14159274, -3.14159274, -3.14159274, -3.14159274);
    u_xlat1 = u_xlat0 * u_xlat0;
    u_xlat2 = u_xlat0 * u_xlat1;
    u_xlat0 = u_xlat2 * vec4(-0.161616161, -0.161616161, -0.161616161, -0.161616161) + u_xlat0;
    u_xlat2 = u_xlat1 * u_xlat2;
    u_xlat1 = u_xlat1 * u_xlat2;
    u_xlat0 = u_xlat2 * vec4(0.00833330024, 0.00833330024, 0.00833330024, 0.00833330024) + u_xlat0;
    u_xlat0 = u_xlat1 * vec4(-0.000198409994, -0.000198409994, -0.000198409994, -0.000198409994) + u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat1.x = in_COLOR0.w * _WaveAndDistance.z;
    u_xlat1 = u_xlat0 * u_xlat1.xxxx;
    u_xlat0.x = dot(u_xlat0, vec4(0.674199879, 0.674199879, 0.269679934, 0.134839967));
    u_xlat0.x = u_xlat0.x * 0.699999988;
    u_xlat2.x = dot(u_xlat1, vec4(0.0240000002, 0.0399999991, -0.119999997, 0.0960000008));
    u_xlat2.z = dot(u_xlat1, vec4(0.00600000005, 0.0199999996, -0.0199999996, 0.100000001));
    u_xlat1.xz = (-u_xlat2.xz) * _WaveAndDistance.zz + in_POSITION0.xz;
    u_xlat2 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat4.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat2;
    u_xlat2 = u_xlat4.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat4.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat4.zzzz + u_xlat2;
    gl_Position = u_xlat2 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat16_3.xyz = _WavingTint.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat16_3.xyz = u_xlat0.xxx * u_xlat16_3.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = u_xlat16_3.xyz * in_COLOR0.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_3.xyz;
    u_xlat1.y = in_POSITION0.y;
    u_xlat0.xyz = u_xlat1.xyz + (-_CameraPosition.xyz);
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = (-u_xlat0.x) + _WaveAndDistance.w;
    u_xlat0.x = dot(_CameraPosition.ww, u_xlat0.xx);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    vs_COLOR0.w = u_xlat0.x;
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
uniform 	mediump float _Cutoff;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out highp vec4 SV_Target0;
mediump float u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = u_xlat16_0 * vs_COLOR0.w + (-_Cutoff);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    SV_Target0 = vs_TEXCOORD1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 305
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %105 %191 %222 %246 %296 %297 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %105 Location 105 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 191 
                                                      OpMemberDecorate %220 0 BuiltIn 220 
                                                      OpMemberDecorate %220 1 BuiltIn 220 
                                                      OpMemberDecorate %220 2 BuiltIn 220 
                                                      OpDecorate %220 Block 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %246 Location 246 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 296 
                                                      OpDecorate %297 Location 297 
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
                                              %19 = OpTypeStruct %17 %18 %7 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %7 
                               Private f32_4* %31 = OpVariable Private 
                                          f32 %34 = OpConstant 3.674022E-40 
                                          f32 %35 = OpConstant 3.674022E-40 
                                          f32 %36 = OpConstant 3.674022E-40 
                                        f32_4 %37 = OpConstantComposite %34 %35 %35 %36 
                                          f32 %41 = OpConstant 3.674022E-40 
                                          f32 %42 = OpConstant 3.674022E-40 
                                          f32 %43 = OpConstant 3.674022E-40 
                                        f32_4 %44 = OpConstantComposite %41 %35 %42 %43 
                                          f32 %51 = OpConstant 3.674022E-40 
                                          f32 %52 = OpConstant 3.674022E-40 
                                          f32 %53 = OpConstant 3.674022E-40 
                                          f32 %54 = OpConstant 3.674022E-40 
                                        f32_4 %55 = OpConstantComposite %51 %52 %53 %54 
                                          f32 %62 = OpConstant 3.674022E-40 
                                        f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
                                          f32 %65 = OpConstant 3.674022E-40 
                                        f32_4 %66 = OpConstantComposite %65 %65 %65 %65 
                               Private f32_4* %71 = OpVariable Private 
                                          f32 %76 = OpConstant 3.674022E-40 
                                        f32_4 %77 = OpConstantComposite %76 %76 %76 %76 
                                          f32 %88 = OpConstant 3.674022E-40 
                                        f32_4 %89 = OpConstantComposite %88 %88 %88 %88 
                                          f32 %94 = OpConstant 3.674022E-40 
                                        f32_4 %95 = OpConstantComposite %94 %94 %94 %94 
                                Input f32_4* %105 = OpVariable Input 
                                         u32 %106 = OpConstant 3 
                                             %107 = OpTypePointer Input %6 
                                         u32 %110 = OpConstant 2 
                                             %111 = OpTypePointer Uniform %6 
                                         u32 %115 = OpConstant 0 
                                             %116 = OpTypePointer Private %6 
                                         f32 %123 = OpConstant 3.674022E-40 
                                         f32 %124 = OpConstant 3.674022E-40 
                                         f32 %125 = OpConstant 3.674022E-40 
                                       f32_4 %126 = OpConstantComposite %123 %123 %124 %125 
                                         f32 %131 = OpConstant 3.674022E-40 
                                         f32 %135 = OpConstant 3.674022E-40 
                                         f32 %136 = OpConstant 3.674022E-40 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_4 %138 = OpConstantComposite %43 %135 %136 %137 
                                         f32 %142 = OpConstant 3.674022E-40 
                                         f32 %143 = OpConstant 3.674022E-40 
                                       f32_4 %144 = OpConstantComposite %34 %35 %142 %143 
                                         i32 %161 = OpConstant 0 
                                         i32 %162 = OpConstant 1 
                                         i32 %173 = OpConstant 2 
                                             %181 = OpTypeVector %6 3 
                                             %182 = OpTypePointer Private %181 
                              Private f32_3* %183 = OpVariable Private 
                                             %190 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %218 = OpConstant 1 
                                             %219 = OpTypeArray %6 %218 
                                             %220 = OpTypeStruct %7 %6 %219 
                                             %221 = OpTypePointer Output %220 
        Output struct {f32_4; f32; f32[1];}* %222 = OpVariable Output 
                              Private f32_3* %228 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                       f32_3 %233 = OpConstantComposite %232 %232 %232 
                                         f32 %239 = OpConstant 3.674022E-40 
                                       f32_3 %240 = OpConstantComposite %239 %239 %239 
                               Output f32_4* %246 = OpVariable Output 
                                         i32 %257 = OpConstant 4 
                                         f32 %287 = OpConstant 3.674022E-40 
                                         f32 %288 = OpConstant 3.674022E-40 
                                             %293 = OpTypePointer Output %6 
                                             %295 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %297 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 1 1 
                                        f32_2 %28 = OpFMul %14 %27 
                                        f32_4 %29 = OpLoad %9 
                                        f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                                      OpStore %9 %30 
                                        f32_4 %32 = OpLoad %9 
                                        f32_4 %33 = OpVectorShuffle %32 %32 1 1 1 1 
                                        f32_4 %38 = OpFMul %33 %37 
                                                      OpStore %31 %38 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %39 0 0 0 0 
                                        f32_4 %45 = OpFMul %40 %44 
                                        f32_4 %46 = OpLoad %31 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %9 %47 
                               Uniform f32_4* %48 = OpAccessChain %21 %23 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpVectorShuffle %49 %49 0 0 0 0 
                                        f32_4 %56 = OpFMul %50 %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpFAdd %56 %57 
                                                      OpStore %9 %58 
                                        f32_4 %59 = OpLoad %9 
                                        f32_4 %60 = OpExtInst %1 10 %59 
                                                      OpStore %9 %60 
                                        f32_4 %61 = OpLoad %9 
                                        f32_4 %64 = OpFMul %61 %63 
                                        f32_4 %67 = OpFAdd %64 %66 
                                                      OpStore %9 %67 
                                        f32_4 %68 = OpLoad %9 
                                        f32_4 %69 = OpLoad %9 
                                        f32_4 %70 = OpFMul %68 %69 
                                                      OpStore %31 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpLoad %31 
                                        f32_4 %74 = OpFMul %72 %73 
                                                      OpStore %71 %74 
                                        f32_4 %75 = OpLoad %71 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                                        f32_4 %81 = OpLoad %31 
                                        f32_4 %82 = OpLoad %71 
                                        f32_4 %83 = OpFMul %81 %82 
                                                      OpStore %71 %83 
                                        f32_4 %84 = OpLoad %31 
                                        f32_4 %85 = OpLoad %71 
                                        f32_4 %86 = OpFMul %84 %85 
                                                      OpStore %31 %86 
                                        f32_4 %87 = OpLoad %71 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %9 %92 
                                        f32_4 %93 = OpLoad %31 
                                        f32_4 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpFAdd %96 %97 
                                                      OpStore %9 %98 
                                        f32_4 %99 = OpLoad %9 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpFMul %99 %100 
                                                      OpStore %9 %101 
                                       f32_4 %102 = OpLoad %9 
                                       f32_4 %103 = OpLoad %9 
                                       f32_4 %104 = OpFMul %102 %103 
                                                      OpStore %9 %104 
                                  Input f32* %108 = OpAccessChain %105 %106 
                                         f32 %109 = OpLoad %108 
                                Uniform f32* %112 = OpAccessChain %21 %23 %110 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFMul %109 %113 
                                Private f32* %117 = OpAccessChain %31 %115 
                                                      OpStore %117 %114 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpLoad %31 
                                       f32_4 %120 = OpVectorShuffle %119 %119 0 0 0 0 
                                       f32_4 %121 = OpFMul %118 %120 
                                                      OpStore %31 %121 
                                       f32_4 %122 = OpLoad %9 
                                         f32 %127 = OpDot %122 %126 
                                Private f32* %128 = OpAccessChain %9 %115 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %9 %115 
                                         f32 %130 = OpLoad %129 
                                         f32 %132 = OpFMul %130 %131 
                                Private f32* %133 = OpAccessChain %9 %115 
                                                      OpStore %133 %132 
                                       f32_4 %134 = OpLoad %31 
                                         f32 %139 = OpDot %134 %138 
                                Private f32* %140 = OpAccessChain %71 %115 
                                                      OpStore %140 %139 
                                       f32_4 %141 = OpLoad %31 
                                         f32 %145 = OpDot %141 %144 
                                Private f32* %146 = OpAccessChain %71 %110 
                                                      OpStore %146 %145 
                                       f32_4 %147 = OpLoad %71 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 2 
                                       f32_2 %149 = OpFNegate %148 
                              Uniform f32_4* %150 = OpAccessChain %21 %23 
                                       f32_4 %151 = OpLoad %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 2 2 
                                       f32_2 %153 = OpFMul %149 %152 
                                       f32_4 %154 = OpLoad %11 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 2 
                                       f32_2 %156 = OpFAdd %153 %155 
                                       f32_4 %157 = OpLoad %31 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 1 5 3 
                                                      OpStore %31 %158 
                                       f32_4 %159 = OpLoad %11 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %163 = OpAccessChain %21 %161 %162 
                                       f32_4 %164 = OpLoad %163 
                                       f32_4 %165 = OpFMul %160 %164 
                                                      OpStore %71 %165 
                              Uniform f32_4* %166 = OpAccessChain %21 %161 %161 
                                       f32_4 %167 = OpLoad %166 
                                       f32_4 %168 = OpLoad %31 
                                       f32_4 %169 = OpVectorShuffle %168 %168 0 0 0 0 
                                       f32_4 %170 = OpFMul %167 %169 
                                       f32_4 %171 = OpLoad %71 
                                       f32_4 %172 = OpFAdd %170 %171 
                                                      OpStore %71 %172 
                              Uniform f32_4* %174 = OpAccessChain %21 %161 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %31 
                                       f32_4 %177 = OpVectorShuffle %176 %176 2 2 2 2 
                                       f32_4 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %71 
                                       f32_4 %180 = OpFAdd %178 %179 
                                                      OpStore %71 %180 
                                       f32_4 %184 = OpLoad %71 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                              Uniform f32_4* %186 = OpAccessChain %21 %161 %23 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFAdd %185 %188 
                                                      OpStore %183 %189 
                              Uniform f32_4* %192 = OpAccessChain %21 %161 %23 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %11 
                                       f32_4 %195 = OpVectorShuffle %194 %194 3 3 3 3 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %71 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore vs_TEXCOORD1 %198 
                                       f32_3 %199 = OpLoad %183 
                                       f32_4 %200 = OpVectorShuffle %199 %199 1 1 1 1 
                              Uniform f32_4* %201 = OpAccessChain %21 %162 %162 
                                       f32_4 %202 = OpLoad %201 
                                       f32_4 %203 = OpFMul %200 %202 
                                                      OpStore %71 %203 
                              Uniform f32_4* %204 = OpAccessChain %21 %162 %161 
                                       f32_4 %205 = OpLoad %204 
                                       f32_3 %206 = OpLoad %183 
                                       f32_4 %207 = OpVectorShuffle %206 %206 0 0 0 0 
                                       f32_4 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %71 
                                       f32_4 %210 = OpFAdd %208 %209 
                                                      OpStore %71 %210 
                              Uniform f32_4* %211 = OpAccessChain %21 %162 %173 
                                       f32_4 %212 = OpLoad %211 
                                       f32_3 %213 = OpLoad %183 
                                       f32_4 %214 = OpVectorShuffle %213 %213 2 2 2 2 
                                       f32_4 %215 = OpFMul %212 %214 
                                       f32_4 %216 = OpLoad %71 
                                       f32_4 %217 = OpFAdd %215 %216 
                                                      OpStore %71 %217 
                                       f32_4 %223 = OpLoad %71 
                              Uniform f32_4* %224 = OpAccessChain %21 %162 %23 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpFAdd %223 %225 
                               Output f32_4* %227 = OpAccessChain %222 %161 
                                                      OpStore %227 %226 
                              Uniform f32_4* %229 = OpAccessChain %21 %173 
                                       f32_4 %230 = OpLoad %229 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                                       f32_3 %234 = OpFAdd %231 %233 
                                                      OpStore %228 %234 
                                       f32_4 %235 = OpLoad %9 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 0 0 
                                       f32_3 %237 = OpLoad %228 
                                       f32_3 %238 = OpFMul %236 %237 
                                       f32_3 %241 = OpFAdd %238 %240 
                                                      OpStore %228 %241 
                                       f32_3 %242 = OpLoad %228 
                                       f32_4 %243 = OpLoad %105 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_3 %245 = OpFMul %242 %244 
                                                      OpStore %228 %245 
                                       f32_3 %247 = OpLoad %228 
                                       f32_3 %248 = OpLoad %228 
                                       f32_3 %249 = OpFAdd %247 %248 
                                       f32_4 %250 = OpLoad %246 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %246 %251 
                                  Input f32* %252 = OpAccessChain %11 %218 
                                         f32 %253 = OpLoad %252 
                                Private f32* %254 = OpAccessChain %31 %218 
                                                      OpStore %254 %253 
                                       f32_4 %255 = OpLoad %31 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                              Uniform f32_4* %258 = OpAccessChain %21 %257 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpFNegate %260 
                                       f32_3 %262 = OpFAdd %256 %261 
                                       f32_4 %263 = OpLoad %9 
                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
                                                      OpStore %9 %264 
                                       f32_4 %265 = OpLoad %9 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_4 %267 = OpLoad %9 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                         f32 %269 = OpDot %266 %268 
                                Private f32* %270 = OpAccessChain %9 %115 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %9 %115 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFNegate %272 
                                Uniform f32* %274 = OpAccessChain %21 %23 %106 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpFAdd %273 %275 
                                Private f32* %277 = OpAccessChain %9 %115 
                                                      OpStore %277 %276 
                              Uniform f32_4* %278 = OpAccessChain %21 %257 
                                       f32_4 %279 = OpLoad %278 
                                       f32_2 %280 = OpVectorShuffle %279 %279 3 3 
                                       f32_4 %281 = OpLoad %9 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 0 
                                         f32 %283 = OpDot %280 %282 
                                Private f32* %284 = OpAccessChain %9 %115 
                                                      OpStore %284 %283 
                                Private f32* %285 = OpAccessChain %9 %115 
                                         f32 %286 = OpLoad %285 
                                         f32 %289 = OpExtInst %1 43 %286 %287 %288 
                                Private f32* %290 = OpAccessChain %9 %115 
                                                      OpStore %290 %289 
                                Private f32* %291 = OpAccessChain %9 %115 
                                         f32 %292 = OpLoad %291 
                                 Output f32* %294 = OpAccessChain %246 %106 
                                                      OpStore %294 %292 
                                       f32_4 %298 = OpLoad %297 
                                       f32_2 %299 = OpVectorShuffle %298 %298 0 1 
                                                      OpStore vs_TEXCOORD0 %299 
                                 Output f32* %300 = OpAccessChain %222 %161 %218 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpFNegate %301 
                                 Output f32* %303 = OpAccessChain %222 %161 %218 
                                                      OpStore %303 %302 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 66
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %31 %62 %63 
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
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 Location 31 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpMemberDecorate %36 0 RelaxedPrecision 
                                             OpMemberDecorate %36 0 Offset 36 
                                             OpDecorate %36 Block 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %49 RelaxedPrecision 
                                             OpDecorate %62 Location 62 
                                             OpDecorate vs_TEXCOORD1 Location 63 
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
                                     %30 = OpTypePointer Input %23 
                        Input f32_4* %31 = OpVariable Input 
                                     %32 = OpTypePointer Input %6 
                                     %36 = OpTypeStruct %6 
                                     %37 = OpTypePointer Uniform %36 
              Uniform struct {f32;}* %38 = OpVariable Uniform 
                                     %39 = OpTypeInt 32 1 
                                 i32 %40 = OpConstant 0 
                                     %41 = OpTypePointer Uniform %6 
                                     %46 = OpTypeBool 
                                     %47 = OpTypePointer Private %46 
                       Private bool* %48 = OpVariable Private 
                                 f32 %50 = OpConstant 3.674022E-40 
                                 i32 %53 = OpConstant 1 
                                 i32 %55 = OpConstant -1 
                                     %61 = OpTypePointer Output %23 
                       Output f32_4* %62 = OpVariable Output 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                          Input f32* %33 = OpAccessChain %31 %26 
                                 f32 %34 = OpLoad %33 
                                 f32 %35 = OpFMul %29 %34 
                        Uniform f32* %42 = OpAccessChain %38 %40 
                                 f32 %43 = OpLoad %42 
                                 f32 %44 = OpFNegate %43 
                                 f32 %45 = OpFAdd %35 %44 
                                             OpStore %28 %45 
                                 f32 %49 = OpLoad %28 
                                bool %51 = OpFOrdLessThan %49 %50 
                                             OpStore %48 %51 
                                bool %52 = OpLoad %48 
                                 i32 %54 = OpSelect %52 %53 %40 
                                 i32 %56 = OpIMul %54 %55 
                                bool %57 = OpINotEqual %56 %40 
                                             OpSelectionMerge %59 None 
                                             OpBranchConditional %57 %58 %59 
                                     %58 = OpLabel 
                                             OpKill
                                     %59 = OpLabel 
                               f32_4 %64 = OpLoad vs_TEXCOORD1 
                                             OpStore %62 %64 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 305
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %105 %191 %222 %246 %296 %297 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %105 Location 105 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 191 
                                                      OpMemberDecorate %220 0 BuiltIn 220 
                                                      OpMemberDecorate %220 1 BuiltIn 220 
                                                      OpMemberDecorate %220 2 BuiltIn 220 
                                                      OpDecorate %220 Block 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %246 Location 246 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 296 
                                                      OpDecorate %297 Location 297 
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
                                              %19 = OpTypeStruct %17 %18 %7 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %7 
                               Private f32_4* %31 = OpVariable Private 
                                          f32 %34 = OpConstant 3.674022E-40 
                                          f32 %35 = OpConstant 3.674022E-40 
                                          f32 %36 = OpConstant 3.674022E-40 
                                        f32_4 %37 = OpConstantComposite %34 %35 %35 %36 
                                          f32 %41 = OpConstant 3.674022E-40 
                                          f32 %42 = OpConstant 3.674022E-40 
                                          f32 %43 = OpConstant 3.674022E-40 
                                        f32_4 %44 = OpConstantComposite %41 %35 %42 %43 
                                          f32 %51 = OpConstant 3.674022E-40 
                                          f32 %52 = OpConstant 3.674022E-40 
                                          f32 %53 = OpConstant 3.674022E-40 
                                          f32 %54 = OpConstant 3.674022E-40 
                                        f32_4 %55 = OpConstantComposite %51 %52 %53 %54 
                                          f32 %62 = OpConstant 3.674022E-40 
                                        f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
                                          f32 %65 = OpConstant 3.674022E-40 
                                        f32_4 %66 = OpConstantComposite %65 %65 %65 %65 
                               Private f32_4* %71 = OpVariable Private 
                                          f32 %76 = OpConstant 3.674022E-40 
                                        f32_4 %77 = OpConstantComposite %76 %76 %76 %76 
                                          f32 %88 = OpConstant 3.674022E-40 
                                        f32_4 %89 = OpConstantComposite %88 %88 %88 %88 
                                          f32 %94 = OpConstant 3.674022E-40 
                                        f32_4 %95 = OpConstantComposite %94 %94 %94 %94 
                                Input f32_4* %105 = OpVariable Input 
                                         u32 %106 = OpConstant 3 
                                             %107 = OpTypePointer Input %6 
                                         u32 %110 = OpConstant 2 
                                             %111 = OpTypePointer Uniform %6 
                                         u32 %115 = OpConstant 0 
                                             %116 = OpTypePointer Private %6 
                                         f32 %123 = OpConstant 3.674022E-40 
                                         f32 %124 = OpConstant 3.674022E-40 
                                         f32 %125 = OpConstant 3.674022E-40 
                                       f32_4 %126 = OpConstantComposite %123 %123 %124 %125 
                                         f32 %131 = OpConstant 3.674022E-40 
                                         f32 %135 = OpConstant 3.674022E-40 
                                         f32 %136 = OpConstant 3.674022E-40 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_4 %138 = OpConstantComposite %43 %135 %136 %137 
                                         f32 %142 = OpConstant 3.674022E-40 
                                         f32 %143 = OpConstant 3.674022E-40 
                                       f32_4 %144 = OpConstantComposite %34 %35 %142 %143 
                                         i32 %161 = OpConstant 0 
                                         i32 %162 = OpConstant 1 
                                         i32 %173 = OpConstant 2 
                                             %181 = OpTypeVector %6 3 
                                             %182 = OpTypePointer Private %181 
                              Private f32_3* %183 = OpVariable Private 
                                             %190 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %218 = OpConstant 1 
                                             %219 = OpTypeArray %6 %218 
                                             %220 = OpTypeStruct %7 %6 %219 
                                             %221 = OpTypePointer Output %220 
        Output struct {f32_4; f32; f32[1];}* %222 = OpVariable Output 
                              Private f32_3* %228 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                       f32_3 %233 = OpConstantComposite %232 %232 %232 
                                         f32 %239 = OpConstant 3.674022E-40 
                                       f32_3 %240 = OpConstantComposite %239 %239 %239 
                               Output f32_4* %246 = OpVariable Output 
                                         i32 %257 = OpConstant 4 
                                         f32 %287 = OpConstant 3.674022E-40 
                                         f32 %288 = OpConstant 3.674022E-40 
                                             %293 = OpTypePointer Output %6 
                                             %295 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %297 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 1 1 
                                        f32_2 %28 = OpFMul %14 %27 
                                        f32_4 %29 = OpLoad %9 
                                        f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                                      OpStore %9 %30 
                                        f32_4 %32 = OpLoad %9 
                                        f32_4 %33 = OpVectorShuffle %32 %32 1 1 1 1 
                                        f32_4 %38 = OpFMul %33 %37 
                                                      OpStore %31 %38 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %39 0 0 0 0 
                                        f32_4 %45 = OpFMul %40 %44 
                                        f32_4 %46 = OpLoad %31 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %9 %47 
                               Uniform f32_4* %48 = OpAccessChain %21 %23 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpVectorShuffle %49 %49 0 0 0 0 
                                        f32_4 %56 = OpFMul %50 %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpFAdd %56 %57 
                                                      OpStore %9 %58 
                                        f32_4 %59 = OpLoad %9 
                                        f32_4 %60 = OpExtInst %1 10 %59 
                                                      OpStore %9 %60 
                                        f32_4 %61 = OpLoad %9 
                                        f32_4 %64 = OpFMul %61 %63 
                                        f32_4 %67 = OpFAdd %64 %66 
                                                      OpStore %9 %67 
                                        f32_4 %68 = OpLoad %9 
                                        f32_4 %69 = OpLoad %9 
                                        f32_4 %70 = OpFMul %68 %69 
                                                      OpStore %31 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpLoad %31 
                                        f32_4 %74 = OpFMul %72 %73 
                                                      OpStore %71 %74 
                                        f32_4 %75 = OpLoad %71 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                                        f32_4 %81 = OpLoad %31 
                                        f32_4 %82 = OpLoad %71 
                                        f32_4 %83 = OpFMul %81 %82 
                                                      OpStore %71 %83 
                                        f32_4 %84 = OpLoad %31 
                                        f32_4 %85 = OpLoad %71 
                                        f32_4 %86 = OpFMul %84 %85 
                                                      OpStore %31 %86 
                                        f32_4 %87 = OpLoad %71 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %9 %92 
                                        f32_4 %93 = OpLoad %31 
                                        f32_4 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpFAdd %96 %97 
                                                      OpStore %9 %98 
                                        f32_4 %99 = OpLoad %9 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpFMul %99 %100 
                                                      OpStore %9 %101 
                                       f32_4 %102 = OpLoad %9 
                                       f32_4 %103 = OpLoad %9 
                                       f32_4 %104 = OpFMul %102 %103 
                                                      OpStore %9 %104 
                                  Input f32* %108 = OpAccessChain %105 %106 
                                         f32 %109 = OpLoad %108 
                                Uniform f32* %112 = OpAccessChain %21 %23 %110 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFMul %109 %113 
                                Private f32* %117 = OpAccessChain %31 %115 
                                                      OpStore %117 %114 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpLoad %31 
                                       f32_4 %120 = OpVectorShuffle %119 %119 0 0 0 0 
                                       f32_4 %121 = OpFMul %118 %120 
                                                      OpStore %31 %121 
                                       f32_4 %122 = OpLoad %9 
                                         f32 %127 = OpDot %122 %126 
                                Private f32* %128 = OpAccessChain %9 %115 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %9 %115 
                                         f32 %130 = OpLoad %129 
                                         f32 %132 = OpFMul %130 %131 
                                Private f32* %133 = OpAccessChain %9 %115 
                                                      OpStore %133 %132 
                                       f32_4 %134 = OpLoad %31 
                                         f32 %139 = OpDot %134 %138 
                                Private f32* %140 = OpAccessChain %71 %115 
                                                      OpStore %140 %139 
                                       f32_4 %141 = OpLoad %31 
                                         f32 %145 = OpDot %141 %144 
                                Private f32* %146 = OpAccessChain %71 %110 
                                                      OpStore %146 %145 
                                       f32_4 %147 = OpLoad %71 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 2 
                                       f32_2 %149 = OpFNegate %148 
                              Uniform f32_4* %150 = OpAccessChain %21 %23 
                                       f32_4 %151 = OpLoad %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 2 2 
                                       f32_2 %153 = OpFMul %149 %152 
                                       f32_4 %154 = OpLoad %11 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 2 
                                       f32_2 %156 = OpFAdd %153 %155 
                                       f32_4 %157 = OpLoad %31 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 1 5 3 
                                                      OpStore %31 %158 
                                       f32_4 %159 = OpLoad %11 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %163 = OpAccessChain %21 %161 %162 
                                       f32_4 %164 = OpLoad %163 
                                       f32_4 %165 = OpFMul %160 %164 
                                                      OpStore %71 %165 
                              Uniform f32_4* %166 = OpAccessChain %21 %161 %161 
                                       f32_4 %167 = OpLoad %166 
                                       f32_4 %168 = OpLoad %31 
                                       f32_4 %169 = OpVectorShuffle %168 %168 0 0 0 0 
                                       f32_4 %170 = OpFMul %167 %169 
                                       f32_4 %171 = OpLoad %71 
                                       f32_4 %172 = OpFAdd %170 %171 
                                                      OpStore %71 %172 
                              Uniform f32_4* %174 = OpAccessChain %21 %161 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %31 
                                       f32_4 %177 = OpVectorShuffle %176 %176 2 2 2 2 
                                       f32_4 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %71 
                                       f32_4 %180 = OpFAdd %178 %179 
                                                      OpStore %71 %180 
                                       f32_4 %184 = OpLoad %71 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                              Uniform f32_4* %186 = OpAccessChain %21 %161 %23 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFAdd %185 %188 
                                                      OpStore %183 %189 
                              Uniform f32_4* %192 = OpAccessChain %21 %161 %23 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %11 
                                       f32_4 %195 = OpVectorShuffle %194 %194 3 3 3 3 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %71 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore vs_TEXCOORD1 %198 
                                       f32_3 %199 = OpLoad %183 
                                       f32_4 %200 = OpVectorShuffle %199 %199 1 1 1 1 
                              Uniform f32_4* %201 = OpAccessChain %21 %162 %162 
                                       f32_4 %202 = OpLoad %201 
                                       f32_4 %203 = OpFMul %200 %202 
                                                      OpStore %71 %203 
                              Uniform f32_4* %204 = OpAccessChain %21 %162 %161 
                                       f32_4 %205 = OpLoad %204 
                                       f32_3 %206 = OpLoad %183 
                                       f32_4 %207 = OpVectorShuffle %206 %206 0 0 0 0 
                                       f32_4 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %71 
                                       f32_4 %210 = OpFAdd %208 %209 
                                                      OpStore %71 %210 
                              Uniform f32_4* %211 = OpAccessChain %21 %162 %173 
                                       f32_4 %212 = OpLoad %211 
                                       f32_3 %213 = OpLoad %183 
                                       f32_4 %214 = OpVectorShuffle %213 %213 2 2 2 2 
                                       f32_4 %215 = OpFMul %212 %214 
                                       f32_4 %216 = OpLoad %71 
                                       f32_4 %217 = OpFAdd %215 %216 
                                                      OpStore %71 %217 
                                       f32_4 %223 = OpLoad %71 
                              Uniform f32_4* %224 = OpAccessChain %21 %162 %23 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpFAdd %223 %225 
                               Output f32_4* %227 = OpAccessChain %222 %161 
                                                      OpStore %227 %226 
                              Uniform f32_4* %229 = OpAccessChain %21 %173 
                                       f32_4 %230 = OpLoad %229 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                                       f32_3 %234 = OpFAdd %231 %233 
                                                      OpStore %228 %234 
                                       f32_4 %235 = OpLoad %9 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 0 0 
                                       f32_3 %237 = OpLoad %228 
                                       f32_3 %238 = OpFMul %236 %237 
                                       f32_3 %241 = OpFAdd %238 %240 
                                                      OpStore %228 %241 
                                       f32_3 %242 = OpLoad %228 
                                       f32_4 %243 = OpLoad %105 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_3 %245 = OpFMul %242 %244 
                                                      OpStore %228 %245 
                                       f32_3 %247 = OpLoad %228 
                                       f32_3 %248 = OpLoad %228 
                                       f32_3 %249 = OpFAdd %247 %248 
                                       f32_4 %250 = OpLoad %246 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %246 %251 
                                  Input f32* %252 = OpAccessChain %11 %218 
                                         f32 %253 = OpLoad %252 
                                Private f32* %254 = OpAccessChain %31 %218 
                                                      OpStore %254 %253 
                                       f32_4 %255 = OpLoad %31 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                              Uniform f32_4* %258 = OpAccessChain %21 %257 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpFNegate %260 
                                       f32_3 %262 = OpFAdd %256 %261 
                                       f32_4 %263 = OpLoad %9 
                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
                                                      OpStore %9 %264 
                                       f32_4 %265 = OpLoad %9 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_4 %267 = OpLoad %9 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                         f32 %269 = OpDot %266 %268 
                                Private f32* %270 = OpAccessChain %9 %115 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %9 %115 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFNegate %272 
                                Uniform f32* %274 = OpAccessChain %21 %23 %106 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpFAdd %273 %275 
                                Private f32* %277 = OpAccessChain %9 %115 
                                                      OpStore %277 %276 
                              Uniform f32_4* %278 = OpAccessChain %21 %257 
                                       f32_4 %279 = OpLoad %278 
                                       f32_2 %280 = OpVectorShuffle %279 %279 3 3 
                                       f32_4 %281 = OpLoad %9 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 0 
                                         f32 %283 = OpDot %280 %282 
                                Private f32* %284 = OpAccessChain %9 %115 
                                                      OpStore %284 %283 
                                Private f32* %285 = OpAccessChain %9 %115 
                                         f32 %286 = OpLoad %285 
                                         f32 %289 = OpExtInst %1 43 %286 %287 %288 
                                Private f32* %290 = OpAccessChain %9 %115 
                                                      OpStore %290 %289 
                                Private f32* %291 = OpAccessChain %9 %115 
                                         f32 %292 = OpLoad %291 
                                 Output f32* %294 = OpAccessChain %246 %106 
                                                      OpStore %294 %292 
                                       f32_4 %298 = OpLoad %297 
                                       f32_2 %299 = OpVectorShuffle %298 %298 0 1 
                                                      OpStore vs_TEXCOORD0 %299 
                                 Output f32* %300 = OpAccessChain %222 %161 %218 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpFNegate %301 
                                 Output f32* %303 = OpAccessChain %222 %161 %218 
                                                      OpStore %303 %302 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 66
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %31 %62 %63 
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
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 Location 31 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpMemberDecorate %36 0 RelaxedPrecision 
                                             OpMemberDecorate %36 0 Offset 36 
                                             OpDecorate %36 Block 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %49 RelaxedPrecision 
                                             OpDecorate %62 Location 62 
                                             OpDecorate vs_TEXCOORD1 Location 63 
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
                                     %30 = OpTypePointer Input %23 
                        Input f32_4* %31 = OpVariable Input 
                                     %32 = OpTypePointer Input %6 
                                     %36 = OpTypeStruct %6 
                                     %37 = OpTypePointer Uniform %36 
              Uniform struct {f32;}* %38 = OpVariable Uniform 
                                     %39 = OpTypeInt 32 1 
                                 i32 %40 = OpConstant 0 
                                     %41 = OpTypePointer Uniform %6 
                                     %46 = OpTypeBool 
                                     %47 = OpTypePointer Private %46 
                       Private bool* %48 = OpVariable Private 
                                 f32 %50 = OpConstant 3.674022E-40 
                                 i32 %53 = OpConstant 1 
                                 i32 %55 = OpConstant -1 
                                     %61 = OpTypePointer Output %23 
                       Output f32_4* %62 = OpVariable Output 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                          Input f32* %33 = OpAccessChain %31 %26 
                                 f32 %34 = OpLoad %33 
                                 f32 %35 = OpFMul %29 %34 
                        Uniform f32* %42 = OpAccessChain %38 %40 
                                 f32 %43 = OpLoad %42 
                                 f32 %44 = OpFNegate %43 
                                 f32 %45 = OpFAdd %35 %44 
                                             OpStore %28 %45 
                                 f32 %49 = OpLoad %28 
                                bool %51 = OpFOrdLessThan %49 %50 
                                             OpStore %48 %51 
                                bool %52 = OpLoad %48 
                                 i32 %54 = OpSelect %52 %53 %40 
                                 i32 %56 = OpIMul %54 %55 
                                bool %57 = OpINotEqual %56 %40 
                                             OpSelectionMerge %59 None 
                                             OpBranchConditional %57 %58 %59 
                                     %58 = OpLabel 
                                             OpKill
                                     %59 = OpLabel 
                               f32_4 %64 = OpLoad vs_TEXCOORD1 
                                             OpStore %62 %64 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 305
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %105 %191 %222 %246 %296 %297 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 RelaxedPrecision 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpDecorate %105 RelaxedPrecision 
                                                      OpDecorate %105 Location 105 
                                                      OpDecorate %109 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 191 
                                                      OpMemberDecorate %220 0 BuiltIn 220 
                                                      OpMemberDecorate %220 1 BuiltIn 220 
                                                      OpMemberDecorate %220 2 BuiltIn 220 
                                                      OpDecorate %220 Block 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %230 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %246 Location 246 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 296 
                                                      OpDecorate %297 Location 297 
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
                                              %19 = OpTypeStruct %17 %18 %7 %7 %7 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4;}* %21 = OpVariable Uniform 
                                              %22 = OpTypeInt 32 1 
                                          i32 %23 = OpConstant 3 
                                              %24 = OpTypePointer Uniform %7 
                               Private f32_4* %31 = OpVariable Private 
                                          f32 %34 = OpConstant 3.674022E-40 
                                          f32 %35 = OpConstant 3.674022E-40 
                                          f32 %36 = OpConstant 3.674022E-40 
                                        f32_4 %37 = OpConstantComposite %34 %35 %35 %36 
                                          f32 %41 = OpConstant 3.674022E-40 
                                          f32 %42 = OpConstant 3.674022E-40 
                                          f32 %43 = OpConstant 3.674022E-40 
                                        f32_4 %44 = OpConstantComposite %41 %35 %42 %43 
                                          f32 %51 = OpConstant 3.674022E-40 
                                          f32 %52 = OpConstant 3.674022E-40 
                                          f32 %53 = OpConstant 3.674022E-40 
                                          f32 %54 = OpConstant 3.674022E-40 
                                        f32_4 %55 = OpConstantComposite %51 %52 %53 %54 
                                          f32 %62 = OpConstant 3.674022E-40 
                                        f32_4 %63 = OpConstantComposite %62 %62 %62 %62 
                                          f32 %65 = OpConstant 3.674022E-40 
                                        f32_4 %66 = OpConstantComposite %65 %65 %65 %65 
                               Private f32_4* %71 = OpVariable Private 
                                          f32 %76 = OpConstant 3.674022E-40 
                                        f32_4 %77 = OpConstantComposite %76 %76 %76 %76 
                                          f32 %88 = OpConstant 3.674022E-40 
                                        f32_4 %89 = OpConstantComposite %88 %88 %88 %88 
                                          f32 %94 = OpConstant 3.674022E-40 
                                        f32_4 %95 = OpConstantComposite %94 %94 %94 %94 
                                Input f32_4* %105 = OpVariable Input 
                                         u32 %106 = OpConstant 3 
                                             %107 = OpTypePointer Input %6 
                                         u32 %110 = OpConstant 2 
                                             %111 = OpTypePointer Uniform %6 
                                         u32 %115 = OpConstant 0 
                                             %116 = OpTypePointer Private %6 
                                         f32 %123 = OpConstant 3.674022E-40 
                                         f32 %124 = OpConstant 3.674022E-40 
                                         f32 %125 = OpConstant 3.674022E-40 
                                       f32_4 %126 = OpConstantComposite %123 %123 %124 %125 
                                         f32 %131 = OpConstant 3.674022E-40 
                                         f32 %135 = OpConstant 3.674022E-40 
                                         f32 %136 = OpConstant 3.674022E-40 
                                         f32 %137 = OpConstant 3.674022E-40 
                                       f32_4 %138 = OpConstantComposite %43 %135 %136 %137 
                                         f32 %142 = OpConstant 3.674022E-40 
                                         f32 %143 = OpConstant 3.674022E-40 
                                       f32_4 %144 = OpConstantComposite %34 %35 %142 %143 
                                         i32 %161 = OpConstant 0 
                                         i32 %162 = OpConstant 1 
                                         i32 %173 = OpConstant 2 
                                             %181 = OpTypeVector %6 3 
                                             %182 = OpTypePointer Private %181 
                              Private f32_3* %183 = OpVariable Private 
                                             %190 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %218 = OpConstant 1 
                                             %219 = OpTypeArray %6 %218 
                                             %220 = OpTypeStruct %7 %6 %219 
                                             %221 = OpTypePointer Output %220 
        Output struct {f32_4; f32; f32[1];}* %222 = OpVariable Output 
                              Private f32_3* %228 = OpVariable Private 
                                         f32 %232 = OpConstant 3.674022E-40 
                                       f32_3 %233 = OpConstantComposite %232 %232 %232 
                                         f32 %239 = OpConstant 3.674022E-40 
                                       f32_3 %240 = OpConstantComposite %239 %239 %239 
                               Output f32_4* %246 = OpVariable Output 
                                         i32 %257 = OpConstant 4 
                                         f32 %287 = OpConstant 3.674022E-40 
                                         f32 %288 = OpConstant 3.674022E-40 
                                             %293 = OpTypePointer Output %6 
                                             %295 = OpTypePointer Output %12 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                Input f32_4* %297 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %13 = OpLoad %11 
                                        f32_2 %14 = OpVectorShuffle %13 %13 0 2 
                               Uniform f32_4* %25 = OpAccessChain %21 %23 
                                        f32_4 %26 = OpLoad %25 
                                        f32_2 %27 = OpVectorShuffle %26 %26 1 1 
                                        f32_2 %28 = OpFMul %14 %27 
                                        f32_4 %29 = OpLoad %9 
                                        f32_4 %30 = OpVectorShuffle %29 %28 4 5 2 3 
                                                      OpStore %9 %30 
                                        f32_4 %32 = OpLoad %9 
                                        f32_4 %33 = OpVectorShuffle %32 %32 1 1 1 1 
                                        f32_4 %38 = OpFMul %33 %37 
                                                      OpStore %31 %38 
                                        f32_4 %39 = OpLoad %9 
                                        f32_4 %40 = OpVectorShuffle %39 %39 0 0 0 0 
                                        f32_4 %45 = OpFMul %40 %44 
                                        f32_4 %46 = OpLoad %31 
                                        f32_4 %47 = OpFAdd %45 %46 
                                                      OpStore %9 %47 
                               Uniform f32_4* %48 = OpAccessChain %21 %23 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpVectorShuffle %49 %49 0 0 0 0 
                                        f32_4 %56 = OpFMul %50 %55 
                                        f32_4 %57 = OpLoad %9 
                                        f32_4 %58 = OpFAdd %56 %57 
                                                      OpStore %9 %58 
                                        f32_4 %59 = OpLoad %9 
                                        f32_4 %60 = OpExtInst %1 10 %59 
                                                      OpStore %9 %60 
                                        f32_4 %61 = OpLoad %9 
                                        f32_4 %64 = OpFMul %61 %63 
                                        f32_4 %67 = OpFAdd %64 %66 
                                                      OpStore %9 %67 
                                        f32_4 %68 = OpLoad %9 
                                        f32_4 %69 = OpLoad %9 
                                        f32_4 %70 = OpFMul %68 %69 
                                                      OpStore %31 %70 
                                        f32_4 %72 = OpLoad %9 
                                        f32_4 %73 = OpLoad %31 
                                        f32_4 %74 = OpFMul %72 %73 
                                                      OpStore %71 %74 
                                        f32_4 %75 = OpLoad %71 
                                        f32_4 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpFAdd %78 %79 
                                                      OpStore %9 %80 
                                        f32_4 %81 = OpLoad %31 
                                        f32_4 %82 = OpLoad %71 
                                        f32_4 %83 = OpFMul %81 %82 
                                                      OpStore %71 %83 
                                        f32_4 %84 = OpLoad %31 
                                        f32_4 %85 = OpLoad %71 
                                        f32_4 %86 = OpFMul %84 %85 
                                                      OpStore %31 %86 
                                        f32_4 %87 = OpLoad %71 
                                        f32_4 %90 = OpFMul %87 %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpFAdd %90 %91 
                                                      OpStore %9 %92 
                                        f32_4 %93 = OpLoad %31 
                                        f32_4 %96 = OpFMul %93 %95 
                                        f32_4 %97 = OpLoad %9 
                                        f32_4 %98 = OpFAdd %96 %97 
                                                      OpStore %9 %98 
                                        f32_4 %99 = OpLoad %9 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpFMul %99 %100 
                                                      OpStore %9 %101 
                                       f32_4 %102 = OpLoad %9 
                                       f32_4 %103 = OpLoad %9 
                                       f32_4 %104 = OpFMul %102 %103 
                                                      OpStore %9 %104 
                                  Input f32* %108 = OpAccessChain %105 %106 
                                         f32 %109 = OpLoad %108 
                                Uniform f32* %112 = OpAccessChain %21 %23 %110 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpFMul %109 %113 
                                Private f32* %117 = OpAccessChain %31 %115 
                                                      OpStore %117 %114 
                                       f32_4 %118 = OpLoad %9 
                                       f32_4 %119 = OpLoad %31 
                                       f32_4 %120 = OpVectorShuffle %119 %119 0 0 0 0 
                                       f32_4 %121 = OpFMul %118 %120 
                                                      OpStore %31 %121 
                                       f32_4 %122 = OpLoad %9 
                                         f32 %127 = OpDot %122 %126 
                                Private f32* %128 = OpAccessChain %9 %115 
                                                      OpStore %128 %127 
                                Private f32* %129 = OpAccessChain %9 %115 
                                         f32 %130 = OpLoad %129 
                                         f32 %132 = OpFMul %130 %131 
                                Private f32* %133 = OpAccessChain %9 %115 
                                                      OpStore %133 %132 
                                       f32_4 %134 = OpLoad %31 
                                         f32 %139 = OpDot %134 %138 
                                Private f32* %140 = OpAccessChain %71 %115 
                                                      OpStore %140 %139 
                                       f32_4 %141 = OpLoad %31 
                                         f32 %145 = OpDot %141 %144 
                                Private f32* %146 = OpAccessChain %71 %110 
                                                      OpStore %146 %145 
                                       f32_4 %147 = OpLoad %71 
                                       f32_2 %148 = OpVectorShuffle %147 %147 0 2 
                                       f32_2 %149 = OpFNegate %148 
                              Uniform f32_4* %150 = OpAccessChain %21 %23 
                                       f32_4 %151 = OpLoad %150 
                                       f32_2 %152 = OpVectorShuffle %151 %151 2 2 
                                       f32_2 %153 = OpFMul %149 %152 
                                       f32_4 %154 = OpLoad %11 
                                       f32_2 %155 = OpVectorShuffle %154 %154 0 2 
                                       f32_2 %156 = OpFAdd %153 %155 
                                       f32_4 %157 = OpLoad %31 
                                       f32_4 %158 = OpVectorShuffle %157 %156 4 1 5 3 
                                                      OpStore %31 %158 
                                       f32_4 %159 = OpLoad %11 
                                       f32_4 %160 = OpVectorShuffle %159 %159 1 1 1 1 
                              Uniform f32_4* %163 = OpAccessChain %21 %161 %162 
                                       f32_4 %164 = OpLoad %163 
                                       f32_4 %165 = OpFMul %160 %164 
                                                      OpStore %71 %165 
                              Uniform f32_4* %166 = OpAccessChain %21 %161 %161 
                                       f32_4 %167 = OpLoad %166 
                                       f32_4 %168 = OpLoad %31 
                                       f32_4 %169 = OpVectorShuffle %168 %168 0 0 0 0 
                                       f32_4 %170 = OpFMul %167 %169 
                                       f32_4 %171 = OpLoad %71 
                                       f32_4 %172 = OpFAdd %170 %171 
                                                      OpStore %71 %172 
                              Uniform f32_4* %174 = OpAccessChain %21 %161 %173 
                                       f32_4 %175 = OpLoad %174 
                                       f32_4 %176 = OpLoad %31 
                                       f32_4 %177 = OpVectorShuffle %176 %176 2 2 2 2 
                                       f32_4 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %71 
                                       f32_4 %180 = OpFAdd %178 %179 
                                                      OpStore %71 %180 
                                       f32_4 %184 = OpLoad %71 
                                       f32_3 %185 = OpVectorShuffle %184 %184 0 1 2 
                              Uniform f32_4* %186 = OpAccessChain %21 %161 %23 
                                       f32_4 %187 = OpLoad %186 
                                       f32_3 %188 = OpVectorShuffle %187 %187 0 1 2 
                                       f32_3 %189 = OpFAdd %185 %188 
                                                      OpStore %183 %189 
                              Uniform f32_4* %192 = OpAccessChain %21 %161 %23 
                                       f32_4 %193 = OpLoad %192 
                                       f32_4 %194 = OpLoad %11 
                                       f32_4 %195 = OpVectorShuffle %194 %194 3 3 3 3 
                                       f32_4 %196 = OpFMul %193 %195 
                                       f32_4 %197 = OpLoad %71 
                                       f32_4 %198 = OpFAdd %196 %197 
                                                      OpStore vs_TEXCOORD1 %198 
                                       f32_3 %199 = OpLoad %183 
                                       f32_4 %200 = OpVectorShuffle %199 %199 1 1 1 1 
                              Uniform f32_4* %201 = OpAccessChain %21 %162 %162 
                                       f32_4 %202 = OpLoad %201 
                                       f32_4 %203 = OpFMul %200 %202 
                                                      OpStore %71 %203 
                              Uniform f32_4* %204 = OpAccessChain %21 %162 %161 
                                       f32_4 %205 = OpLoad %204 
                                       f32_3 %206 = OpLoad %183 
                                       f32_4 %207 = OpVectorShuffle %206 %206 0 0 0 0 
                                       f32_4 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %71 
                                       f32_4 %210 = OpFAdd %208 %209 
                                                      OpStore %71 %210 
                              Uniform f32_4* %211 = OpAccessChain %21 %162 %173 
                                       f32_4 %212 = OpLoad %211 
                                       f32_3 %213 = OpLoad %183 
                                       f32_4 %214 = OpVectorShuffle %213 %213 2 2 2 2 
                                       f32_4 %215 = OpFMul %212 %214 
                                       f32_4 %216 = OpLoad %71 
                                       f32_4 %217 = OpFAdd %215 %216 
                                                      OpStore %71 %217 
                                       f32_4 %223 = OpLoad %71 
                              Uniform f32_4* %224 = OpAccessChain %21 %162 %23 
                                       f32_4 %225 = OpLoad %224 
                                       f32_4 %226 = OpFAdd %223 %225 
                               Output f32_4* %227 = OpAccessChain %222 %161 
                                                      OpStore %227 %226 
                              Uniform f32_4* %229 = OpAccessChain %21 %173 
                                       f32_4 %230 = OpLoad %229 
                                       f32_3 %231 = OpVectorShuffle %230 %230 0 1 2 
                                       f32_3 %234 = OpFAdd %231 %233 
                                                      OpStore %228 %234 
                                       f32_4 %235 = OpLoad %9 
                                       f32_3 %236 = OpVectorShuffle %235 %235 0 0 0 
                                       f32_3 %237 = OpLoad %228 
                                       f32_3 %238 = OpFMul %236 %237 
                                       f32_3 %241 = OpFAdd %238 %240 
                                                      OpStore %228 %241 
                                       f32_3 %242 = OpLoad %228 
                                       f32_4 %243 = OpLoad %105 
                                       f32_3 %244 = OpVectorShuffle %243 %243 0 1 2 
                                       f32_3 %245 = OpFMul %242 %244 
                                                      OpStore %228 %245 
                                       f32_3 %247 = OpLoad %228 
                                       f32_3 %248 = OpLoad %228 
                                       f32_3 %249 = OpFAdd %247 %248 
                                       f32_4 %250 = OpLoad %246 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 6 3 
                                                      OpStore %246 %251 
                                  Input f32* %252 = OpAccessChain %11 %218 
                                         f32 %253 = OpLoad %252 
                                Private f32* %254 = OpAccessChain %31 %218 
                                                      OpStore %254 %253 
                                       f32_4 %255 = OpLoad %31 
                                       f32_3 %256 = OpVectorShuffle %255 %255 0 1 2 
                              Uniform f32_4* %258 = OpAccessChain %21 %257 
                                       f32_4 %259 = OpLoad %258 
                                       f32_3 %260 = OpVectorShuffle %259 %259 0 1 2 
                                       f32_3 %261 = OpFNegate %260 
                                       f32_3 %262 = OpFAdd %256 %261 
                                       f32_4 %263 = OpLoad %9 
                                       f32_4 %264 = OpVectorShuffle %263 %262 4 5 6 3 
                                                      OpStore %9 %264 
                                       f32_4 %265 = OpLoad %9 
                                       f32_3 %266 = OpVectorShuffle %265 %265 0 1 2 
                                       f32_4 %267 = OpLoad %9 
                                       f32_3 %268 = OpVectorShuffle %267 %267 0 1 2 
                                         f32 %269 = OpDot %266 %268 
                                Private f32* %270 = OpAccessChain %9 %115 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %9 %115 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFNegate %272 
                                Uniform f32* %274 = OpAccessChain %21 %23 %106 
                                         f32 %275 = OpLoad %274 
                                         f32 %276 = OpFAdd %273 %275 
                                Private f32* %277 = OpAccessChain %9 %115 
                                                      OpStore %277 %276 
                              Uniform f32_4* %278 = OpAccessChain %21 %257 
                                       f32_4 %279 = OpLoad %278 
                                       f32_2 %280 = OpVectorShuffle %279 %279 3 3 
                                       f32_4 %281 = OpLoad %9 
                                       f32_2 %282 = OpVectorShuffle %281 %281 0 0 
                                         f32 %283 = OpDot %280 %282 
                                Private f32* %284 = OpAccessChain %9 %115 
                                                      OpStore %284 %283 
                                Private f32* %285 = OpAccessChain %9 %115 
                                         f32 %286 = OpLoad %285 
                                         f32 %289 = OpExtInst %1 43 %286 %287 %288 
                                Private f32* %290 = OpAccessChain %9 %115 
                                                      OpStore %290 %289 
                                Private f32* %291 = OpAccessChain %9 %115 
                                         f32 %292 = OpLoad %291 
                                 Output f32* %294 = OpAccessChain %246 %106 
                                                      OpStore %294 %292 
                                       f32_4 %298 = OpLoad %297 
                                       f32_2 %299 = OpVectorShuffle %298 %298 0 1 
                                                      OpStore vs_TEXCOORD0 %299 
                                 Output f32* %300 = OpAccessChain %222 %161 %218 
                                         f32 %301 = OpLoad %300 
                                         f32 %302 = OpFNegate %301 
                                 Output f32* %303 = OpAccessChain %222 %161 %218 
                                                      OpStore %303 %302 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 66
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %31 %62 %63 
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
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %31 Location 31 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpMemberDecorate %36 0 RelaxedPrecision 
                                             OpMemberDecorate %36 0 Offset 36 
                                             OpDecorate %36 Block 
                                             OpDecorate %38 DescriptorSet 38 
                                             OpDecorate %38 Binding 38 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %49 RelaxedPrecision 
                                             OpDecorate %62 Location 62 
                                             OpDecorate vs_TEXCOORD1 Location 63 
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
                                     %30 = OpTypePointer Input %23 
                        Input f32_4* %31 = OpVariable Input 
                                     %32 = OpTypePointer Input %6 
                                     %36 = OpTypeStruct %6 
                                     %37 = OpTypePointer Uniform %36 
              Uniform struct {f32;}* %38 = OpVariable Uniform 
                                     %39 = OpTypeInt 32 1 
                                 i32 %40 = OpConstant 0 
                                     %41 = OpTypePointer Uniform %6 
                                     %46 = OpTypeBool 
                                     %47 = OpTypePointer Private %46 
                       Private bool* %48 = OpVariable Private 
                                 f32 %50 = OpConstant 3.674022E-40 
                                 i32 %53 = OpConstant 1 
                                 i32 %55 = OpConstant -1 
                                     %61 = OpTypePointer Output %23 
                       Output f32_4* %62 = OpVariable Output 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
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
                          Input f32* %33 = OpAccessChain %31 %26 
                                 f32 %34 = OpLoad %33 
                                 f32 %35 = OpFMul %29 %34 
                        Uniform f32* %42 = OpAccessChain %38 %40 
                                 f32 %43 = OpLoad %42 
                                 f32 %44 = OpFNegate %43 
                                 f32 %45 = OpFAdd %35 %44 
                                             OpStore %28 %45 
                                 f32 %49 = OpLoad %28 
                                bool %51 = OpFOrdLessThan %49 %50 
                                             OpStore %48 %51 
                                bool %52 = OpLoad %48 
                                 i32 %54 = OpSelect %52 %53 %40 
                                 i32 %56 = OpIMul %54 %55 
                                bool %57 = OpINotEqual %56 %40 
                                             OpSelectionMerge %59 None 
                                             OpBranchConditional %57 %58 %59 
                                     %58 = OpLabel 
                                             OpKill
                                     %59 = OpLabel 
                               f32_4 %64 = OpLoad vs_TEXCOORD1 
                                             OpStore %62 %64 
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