//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-CubemapToEquirect" {
Properties {
_MainTex ("Texture", Cube) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 43648
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(6.28318548, 3.14159274) + vec2(-3.14159274, -1.57079637);
    u_xlat1.xy = cos(u_xlat0.xy);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.z = u_xlat1.y * u_xlat1.x;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xyz);
    SV_Target0 = u_xlat16_0;
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(6.28318548, 3.14159274) + vec2(-3.14159274, -1.57079637);
    u_xlat1.xy = cos(u_xlat0.xy);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.z = u_xlat1.y * u_xlat1.x;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xyz);
    SV_Target0 = u_xlat16_0;
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
UNITY_LOCATION(0) uniform mediump samplerCube _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * vec2(6.28318548, 3.14159274) + vec2(-3.14159274, -1.57079637);
    u_xlat1.xy = cos(u_xlat0.xy);
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.z = u_xlat1.y * u_xlat1.x;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xyz);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 84 
                                                     OpDecorate %86 Location 86 
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
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 70
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %12 %67 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate vs_TEXCOORD0 Location 12 
                                               OpDecorate %53 RelaxedPrecision 
                                               OpDecorate %56 RelaxedPrecision 
                                               OpDecorate %56 DescriptorSet 56 
                                               OpDecorate %56 Binding 56 
                                               OpDecorate %57 RelaxedPrecision 
                                               OpDecorate %60 RelaxedPrecision 
                                               OpDecorate %60 DescriptorSet 60 
                                               OpDecorate %60 Binding 60 
                                               OpDecorate %61 RelaxedPrecision 
                                               OpDecorate %67 RelaxedPrecision 
                                               OpDecorate %67 Location 67 
                                               OpDecorate %68 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 3 
                                        %8 = OpTypePointer Private %7 
                         Private f32_3* %9 = OpVariable Private 
                                       %10 = OpTypeVector %6 2 
                                       %11 = OpTypePointer Input %10 
                 Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                   f32 %14 = OpConstant 3.674022E-40 
                                   f32 %15 = OpConstant 3.674022E-40 
                                 f32_2 %16 = OpConstantComposite %14 %15 
                                   f32 %18 = OpConstant 3.674022E-40 
                                   f32 %19 = OpConstant 3.674022E-40 
                                 f32_2 %20 = OpConstantComposite %18 %19 
                                       %24 = OpTypePointer Private %10 
                        Private f32_2* %25 = OpVariable Private 
                                       %34 = OpTypeInt 32 0 
                                   u32 %35 = OpConstant 0 
                                       %36 = OpTypePointer Private %6 
                                   u32 %39 = OpConstant 1 
                                   u32 %49 = OpConstant 2 
                                       %51 = OpTypeVector %6 4 
                                       %52 = OpTypePointer Private %51 
                        Private f32_4* %53 = OpVariable Private 
                                       %54 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %55 = OpTypePointer UniformConstant %54 
UniformConstant read_only TextureCube* %56 = OpVariable UniformConstant 
                                       %58 = OpTypeSampler 
                                       %59 = OpTypePointer UniformConstant %58 
              UniformConstant sampler* %60 = OpVariable UniformConstant 
                                       %62 = OpTypeSampledImage %54 
                                       %66 = OpTypePointer Output %51 
                         Output f32_4* %67 = OpVariable Output 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                                 f32_2 %13 = OpLoad vs_TEXCOORD0 
                                 f32_2 %17 = OpFMul %13 %16 
                                 f32_2 %21 = OpFAdd %17 %20 
                                 f32_3 %22 = OpLoad %9 
                                 f32_3 %23 = OpVectorShuffle %22 %21 3 4 2 
                                               OpStore %9 %23 
                                 f32_3 %26 = OpLoad %9 
                                 f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                 f32_2 %28 = OpExtInst %1 14 %27 
                                               OpStore %25 %28 
                                 f32_3 %29 = OpLoad %9 
                                 f32_2 %30 = OpVectorShuffle %29 %29 0 1 
                                 f32_2 %31 = OpExtInst %1 13 %30 
                                 f32_3 %32 = OpLoad %9 
                                 f32_3 %33 = OpVectorShuffle %32 %31 3 4 2 
                                               OpStore %9 %33 
                          Private f32* %37 = OpAccessChain %9 %35 
                                   f32 %38 = OpLoad %37 
                          Private f32* %40 = OpAccessChain %25 %39 
                                   f32 %41 = OpLoad %40 
                                   f32 %42 = OpFMul %38 %41 
                          Private f32* %43 = OpAccessChain %9 %35 
                                               OpStore %43 %42 
                          Private f32* %44 = OpAccessChain %25 %39 
                                   f32 %45 = OpLoad %44 
                          Private f32* %46 = OpAccessChain %25 %35 
                                   f32 %47 = OpLoad %46 
                                   f32 %48 = OpFMul %45 %47 
                          Private f32* %50 = OpAccessChain %9 %49 
                                               OpStore %50 %48 
                 read_only TextureCube %57 = OpLoad %56 
                               sampler %61 = OpLoad %60 
          read_only TextureCubeSampled %63 = OpSampledImage %57 %61 
                                 f32_3 %64 = OpLoad %9 
                                 f32_4 %65 = OpImageSampleImplicitLod %63 %64 
                                               OpStore %53 %65 
                                 f32_4 %68 = OpLoad %53 
                                               OpStore %67 %68 
                                               OpReturn
                                               OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 84 
                                                     OpDecorate %86 Location 86 
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
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 70
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %12 %67 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate vs_TEXCOORD0 Location 12 
                                               OpDecorate %53 RelaxedPrecision 
                                               OpDecorate %56 RelaxedPrecision 
                                               OpDecorate %56 DescriptorSet 56 
                                               OpDecorate %56 Binding 56 
                                               OpDecorate %57 RelaxedPrecision 
                                               OpDecorate %60 RelaxedPrecision 
                                               OpDecorate %60 DescriptorSet 60 
                                               OpDecorate %60 Binding 60 
                                               OpDecorate %61 RelaxedPrecision 
                                               OpDecorate %67 RelaxedPrecision 
                                               OpDecorate %67 Location 67 
                                               OpDecorate %68 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 3 
                                        %8 = OpTypePointer Private %7 
                         Private f32_3* %9 = OpVariable Private 
                                       %10 = OpTypeVector %6 2 
                                       %11 = OpTypePointer Input %10 
                 Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                   f32 %14 = OpConstant 3.674022E-40 
                                   f32 %15 = OpConstant 3.674022E-40 
                                 f32_2 %16 = OpConstantComposite %14 %15 
                                   f32 %18 = OpConstant 3.674022E-40 
                                   f32 %19 = OpConstant 3.674022E-40 
                                 f32_2 %20 = OpConstantComposite %18 %19 
                                       %24 = OpTypePointer Private %10 
                        Private f32_2* %25 = OpVariable Private 
                                       %34 = OpTypeInt 32 0 
                                   u32 %35 = OpConstant 0 
                                       %36 = OpTypePointer Private %6 
                                   u32 %39 = OpConstant 1 
                                   u32 %49 = OpConstant 2 
                                       %51 = OpTypeVector %6 4 
                                       %52 = OpTypePointer Private %51 
                        Private f32_4* %53 = OpVariable Private 
                                       %54 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %55 = OpTypePointer UniformConstant %54 
UniformConstant read_only TextureCube* %56 = OpVariable UniformConstant 
                                       %58 = OpTypeSampler 
                                       %59 = OpTypePointer UniformConstant %58 
              UniformConstant sampler* %60 = OpVariable UniformConstant 
                                       %62 = OpTypeSampledImage %54 
                                       %66 = OpTypePointer Output %51 
                         Output f32_4* %67 = OpVariable Output 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                                 f32_2 %13 = OpLoad vs_TEXCOORD0 
                                 f32_2 %17 = OpFMul %13 %16 
                                 f32_2 %21 = OpFAdd %17 %20 
                                 f32_3 %22 = OpLoad %9 
                                 f32_3 %23 = OpVectorShuffle %22 %21 3 4 2 
                                               OpStore %9 %23 
                                 f32_3 %26 = OpLoad %9 
                                 f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                 f32_2 %28 = OpExtInst %1 14 %27 
                                               OpStore %25 %28 
                                 f32_3 %29 = OpLoad %9 
                                 f32_2 %30 = OpVectorShuffle %29 %29 0 1 
                                 f32_2 %31 = OpExtInst %1 13 %30 
                                 f32_3 %32 = OpLoad %9 
                                 f32_3 %33 = OpVectorShuffle %32 %31 3 4 2 
                                               OpStore %9 %33 
                          Private f32* %37 = OpAccessChain %9 %35 
                                   f32 %38 = OpLoad %37 
                          Private f32* %40 = OpAccessChain %25 %39 
                                   f32 %41 = OpLoad %40 
                                   f32 %42 = OpFMul %38 %41 
                          Private f32* %43 = OpAccessChain %9 %35 
                                               OpStore %43 %42 
                          Private f32* %44 = OpAccessChain %25 %39 
                                   f32 %45 = OpLoad %44 
                          Private f32* %46 = OpAccessChain %25 %35 
                                   f32 %47 = OpLoad %46 
                                   f32 %48 = OpFMul %45 %47 
                          Private f32* %50 = OpAccessChain %9 %49 
                                               OpStore %50 %48 
                 read_only TextureCube %57 = OpLoad %56 
                               sampler %61 = OpLoad %60 
          read_only TextureCubeSampled %63 = OpSampledImage %57 %61 
                                 f32_3 %64 = OpLoad %9 
                                 f32_4 %65 = OpImageSampleImplicitLod %63 %64 
                                               OpStore %53 %65 
                                 f32_4 %68 = OpLoad %53 
                                               OpStore %67 %68 
                                               OpReturn
                                               OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 102
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
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 84 
                                                     OpDecorate %86 Location 86 
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
                                             %96 = OpTypePointer Output %6 
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
                              Uniform f32_4* %88 = OpAccessChain %20 %35 
                                       f32_4 %89 = OpLoad %88 
                                       f32_2 %90 = OpVectorShuffle %89 %89 0 1 
                                       f32_2 %91 = OpFMul %87 %90 
                              Uniform f32_4* %92 = OpAccessChain %20 %35 
                                       f32_4 %93 = OpLoad %92 
                                       f32_2 %94 = OpVectorShuffle %93 %93 2 3 
                                       f32_2 %95 = OpFAdd %91 %94 
                                                     OpStore vs_TEXCOORD0 %95 
                                 Output f32* %97 = OpAccessChain %72 %22 %68 
                                         f32 %98 = OpLoad %97 
                                         f32 %99 = OpFNegate %98 
                                Output f32* %100 = OpAccessChain %72 %22 %68 
                                                     OpStore %100 %99 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 70
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %12 %67 
                                               OpExecutionMode %4 OriginUpperLeft 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpDecorate vs_TEXCOORD0 Location 12 
                                               OpDecorate %53 RelaxedPrecision 
                                               OpDecorate %56 RelaxedPrecision 
                                               OpDecorate %56 DescriptorSet 56 
                                               OpDecorate %56 Binding 56 
                                               OpDecorate %57 RelaxedPrecision 
                                               OpDecorate %60 RelaxedPrecision 
                                               OpDecorate %60 DescriptorSet 60 
                                               OpDecorate %60 Binding 60 
                                               OpDecorate %61 RelaxedPrecision 
                                               OpDecorate %67 RelaxedPrecision 
                                               OpDecorate %67 Location 67 
                                               OpDecorate %68 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 3 
                                        %8 = OpTypePointer Private %7 
                         Private f32_3* %9 = OpVariable Private 
                                       %10 = OpTypeVector %6 2 
                                       %11 = OpTypePointer Input %10 
                 Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                   f32 %14 = OpConstant 3.674022E-40 
                                   f32 %15 = OpConstant 3.674022E-40 
                                 f32_2 %16 = OpConstantComposite %14 %15 
                                   f32 %18 = OpConstant 3.674022E-40 
                                   f32 %19 = OpConstant 3.674022E-40 
                                 f32_2 %20 = OpConstantComposite %18 %19 
                                       %24 = OpTypePointer Private %10 
                        Private f32_2* %25 = OpVariable Private 
                                       %34 = OpTypeInt 32 0 
                                   u32 %35 = OpConstant 0 
                                       %36 = OpTypePointer Private %6 
                                   u32 %39 = OpConstant 1 
                                   u32 %49 = OpConstant 2 
                                       %51 = OpTypeVector %6 4 
                                       %52 = OpTypePointer Private %51 
                        Private f32_4* %53 = OpVariable Private 
                                       %54 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %55 = OpTypePointer UniformConstant %54 
UniformConstant read_only TextureCube* %56 = OpVariable UniformConstant 
                                       %58 = OpTypeSampler 
                                       %59 = OpTypePointer UniformConstant %58 
              UniformConstant sampler* %60 = OpVariable UniformConstant 
                                       %62 = OpTypeSampledImage %54 
                                       %66 = OpTypePointer Output %51 
                         Output f32_4* %67 = OpVariable Output 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                                 f32_2 %13 = OpLoad vs_TEXCOORD0 
                                 f32_2 %17 = OpFMul %13 %16 
                                 f32_2 %21 = OpFAdd %17 %20 
                                 f32_3 %22 = OpLoad %9 
                                 f32_3 %23 = OpVectorShuffle %22 %21 3 4 2 
                                               OpStore %9 %23 
                                 f32_3 %26 = OpLoad %9 
                                 f32_2 %27 = OpVectorShuffle %26 %26 0 1 
                                 f32_2 %28 = OpExtInst %1 14 %27 
                                               OpStore %25 %28 
                                 f32_3 %29 = OpLoad %9 
                                 f32_2 %30 = OpVectorShuffle %29 %29 0 1 
                                 f32_2 %31 = OpExtInst %1 13 %30 
                                 f32_3 %32 = OpLoad %9 
                                 f32_3 %33 = OpVectorShuffle %32 %31 3 4 2 
                                               OpStore %9 %33 
                          Private f32* %37 = OpAccessChain %9 %35 
                                   f32 %38 = OpLoad %37 
                          Private f32* %40 = OpAccessChain %25 %39 
                                   f32 %41 = OpLoad %40 
                                   f32 %42 = OpFMul %38 %41 
                          Private f32* %43 = OpAccessChain %9 %35 
                                               OpStore %43 %42 
                          Private f32* %44 = OpAccessChain %25 %39 
                                   f32 %45 = OpLoad %44 
                          Private f32* %46 = OpAccessChain %25 %35 
                                   f32 %47 = OpLoad %46 
                                   f32 %48 = OpFMul %45 %47 
                          Private f32* %50 = OpAccessChain %9 %49 
                                               OpStore %50 %48 
                 read_only TextureCube %57 = OpLoad %56 
                               sampler %61 = OpLoad %60 
          read_only TextureCubeSampled %63 = OpSampledImage %57 %61 
                                 f32_3 %64 = OpLoad %9 
                                 f32_4 %65 = OpImageSampleImplicitLod %63 %64 
                                               OpStore %53 %65 
                                 f32_4 %68 = OpLoad %53 
                                               OpStore %67 %68 
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