//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Compositing" {
Properties {
_MainTex ("_MainTex (A)", 2D) = "black" { }
_SecondTex ("_SecondTex (A)", 2D) = "black" { }
}
SubShader {
 Pass {
  Name "Mix_RGBA_To_RGBA"
  Cull Off
  GpuProgramID 64389
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
uniform 	float _AlphaParam;
uniform 	float _SecondAlphaParam;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat16_0 = texture(_SecondTex, vs_TEXCOORD0.xy);
    u_xlat6 = u_xlat16_0.w * _SecondAlphaParam;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat6);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat6 = u_xlat16_1.w * _AlphaParam;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	float _AlphaParam;
uniform 	float _SecondAlphaParam;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat16_0 = texture(_SecondTex, vs_TEXCOORD0.xy);
    u_xlat6 = u_xlat16_0.w * _SecondAlphaParam;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat6);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat6 = u_xlat16_1.w * _AlphaParam;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	float _AlphaParam;
uniform 	float _SecondAlphaParam;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _SecondTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
float u_xlat6;
void main()
{
    u_xlat16_0 = texture(_SecondTex, vs_TEXCOORD0.xy);
    u_xlat6 = u_xlat16_0.w * _SecondAlphaParam;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(u_xlat6);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat6 = u_xlat16_1.w * _AlphaParam;
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat16_1.xyz + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
; Bound: 78
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %70 
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
                                             OpDecorate %30 RelaxedPrecision 
                                             OpMemberDecorate %31 0 Offset 31 
                                             OpMemberDecorate %31 1 Offset 31 
                                             OpDecorate %31 Block 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %48 RelaxedPrecision 
                                             OpDecorate %49 RelaxedPrecision 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %51 DescriptorSet 51 
                                             OpDecorate %51 Binding 51 
                                             OpDecorate %52 RelaxedPrecision 
                                             OpDecorate %57 RelaxedPrecision 
                                             OpDecorate %63 RelaxedPrecision 
                                             OpDecorate %64 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %66 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %70 Location 70 
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
                                     %25 = OpTypePointer Private %6 
                        Private f32* %26 = OpVariable Private 
                                     %27 = OpTypeInt 32 0 
                                 u32 %28 = OpConstant 3 
                                     %31 = OpTypeStruct %6 %6 
                                     %32 = OpTypePointer Uniform %31 
         Uniform struct {f32; f32;}* %33 = OpVariable Uniform 
                                     %34 = OpTypeInt 32 1 
                                 i32 %35 = OpConstant 1 
                                     %36 = OpTypePointer Uniform %6 
                                     %40 = OpTypeVector %6 3 
                                     %41 = OpTypePointer Private %40 
                      Private f32_3* %42 = OpVariable Private 
                      Private f32_4* %48 = OpVariable Private 
UniformConstant read_only Texture2D* %49 = OpVariable UniformConstant 
            UniformConstant sampler* %51 = OpVariable UniformConstant 
                                 i32 %58 = OpConstant 0 
                                     %69 = OpTypePointer Output %7 
                       Output f32_4* %70 = OpVariable Output 
                                 f32 %74 = OpConstant 3.674022E-40 
                                     %75 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Private f32* %29 = OpAccessChain %9 %28 
                                 f32 %30 = OpLoad %29 
                        Uniform f32* %37 = OpAccessChain %33 %35 
                                 f32 %38 = OpLoad %37 
                                 f32 %39 = OpFMul %30 %38 
                                             OpStore %26 %39 
                               f32_4 %43 = OpLoad %9 
                               f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                 f32 %45 = OpLoad %26 
                               f32_3 %46 = OpCompositeConstruct %45 %45 %45 
                               f32_3 %47 = OpFMul %44 %46 
                                             OpStore %42 %47 
                 read_only Texture2D %50 = OpLoad %49 
                             sampler %52 = OpLoad %51 
          read_only Texture2DSampled %53 = OpSampledImage %50 %52 
                               f32_2 %54 = OpLoad vs_TEXCOORD0 
                               f32_4 %55 = OpImageSampleImplicitLod %53 %54 
                                             OpStore %48 %55 
                        Private f32* %56 = OpAccessChain %48 %28 
                                 f32 %57 = OpLoad %56 
                        Uniform f32* %59 = OpAccessChain %33 %58 
                                 f32 %60 = OpLoad %59 
                                 f32 %61 = OpFMul %57 %60 
                                             OpStore %26 %61 
                                 f32 %62 = OpLoad %26 
                               f32_3 %63 = OpCompositeConstruct %62 %62 %62 
                               f32_4 %64 = OpLoad %48 
                               f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                               f32_3 %66 = OpFMul %63 %65 
                               f32_3 %67 = OpLoad %42 
                               f32_3 %68 = OpFAdd %66 %67 
                                             OpStore %42 %68 
                               f32_3 %71 = OpLoad %42 
                               f32_4 %72 = OpLoad %70 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                             OpStore %70 %73 
                         Output f32* %76 = OpAccessChain %70 %28 
                                             OpStore %76 %74 
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
; Bound: 78
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %70 
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
                                             OpDecorate %30 RelaxedPrecision 
                                             OpMemberDecorate %31 0 Offset 31 
                                             OpMemberDecorate %31 1 Offset 31 
                                             OpDecorate %31 Block 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %48 RelaxedPrecision 
                                             OpDecorate %49 RelaxedPrecision 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %51 DescriptorSet 51 
                                             OpDecorate %51 Binding 51 
                                             OpDecorate %52 RelaxedPrecision 
                                             OpDecorate %57 RelaxedPrecision 
                                             OpDecorate %63 RelaxedPrecision 
                                             OpDecorate %64 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %66 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %70 Location 70 
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
                                     %25 = OpTypePointer Private %6 
                        Private f32* %26 = OpVariable Private 
                                     %27 = OpTypeInt 32 0 
                                 u32 %28 = OpConstant 3 
                                     %31 = OpTypeStruct %6 %6 
                                     %32 = OpTypePointer Uniform %31 
         Uniform struct {f32; f32;}* %33 = OpVariable Uniform 
                                     %34 = OpTypeInt 32 1 
                                 i32 %35 = OpConstant 1 
                                     %36 = OpTypePointer Uniform %6 
                                     %40 = OpTypeVector %6 3 
                                     %41 = OpTypePointer Private %40 
                      Private f32_3* %42 = OpVariable Private 
                      Private f32_4* %48 = OpVariable Private 
UniformConstant read_only Texture2D* %49 = OpVariable UniformConstant 
            UniformConstant sampler* %51 = OpVariable UniformConstant 
                                 i32 %58 = OpConstant 0 
                                     %69 = OpTypePointer Output %7 
                       Output f32_4* %70 = OpVariable Output 
                                 f32 %74 = OpConstant 3.674022E-40 
                                     %75 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Private f32* %29 = OpAccessChain %9 %28 
                                 f32 %30 = OpLoad %29 
                        Uniform f32* %37 = OpAccessChain %33 %35 
                                 f32 %38 = OpLoad %37 
                                 f32 %39 = OpFMul %30 %38 
                                             OpStore %26 %39 
                               f32_4 %43 = OpLoad %9 
                               f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                 f32 %45 = OpLoad %26 
                               f32_3 %46 = OpCompositeConstruct %45 %45 %45 
                               f32_3 %47 = OpFMul %44 %46 
                                             OpStore %42 %47 
                 read_only Texture2D %50 = OpLoad %49 
                             sampler %52 = OpLoad %51 
          read_only Texture2DSampled %53 = OpSampledImage %50 %52 
                               f32_2 %54 = OpLoad vs_TEXCOORD0 
                               f32_4 %55 = OpImageSampleImplicitLod %53 %54 
                                             OpStore %48 %55 
                        Private f32* %56 = OpAccessChain %48 %28 
                                 f32 %57 = OpLoad %56 
                        Uniform f32* %59 = OpAccessChain %33 %58 
                                 f32 %60 = OpLoad %59 
                                 f32 %61 = OpFMul %57 %60 
                                             OpStore %26 %61 
                                 f32 %62 = OpLoad %26 
                               f32_3 %63 = OpCompositeConstruct %62 %62 %62 
                               f32_4 %64 = OpLoad %48 
                               f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                               f32_3 %66 = OpFMul %63 %65 
                               f32_3 %67 = OpLoad %42 
                               f32_3 %68 = OpFAdd %66 %67 
                                             OpStore %42 %68 
                               f32_3 %71 = OpLoad %42 
                               f32_4 %72 = OpLoad %70 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                             OpStore %70 %73 
                         Output f32* %76 = OpAccessChain %70 %28 
                                             OpStore %76 %74 
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
; Bound: 78
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %70 
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
                                             OpDecorate %30 RelaxedPrecision 
                                             OpMemberDecorate %31 0 Offset 31 
                                             OpMemberDecorate %31 1 Offset 31 
                                             OpDecorate %31 Block 
                                             OpDecorate %33 DescriptorSet 33 
                                             OpDecorate %33 Binding 33 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %47 RelaxedPrecision 
                                             OpDecorate %48 RelaxedPrecision 
                                             OpDecorate %49 RelaxedPrecision 
                                             OpDecorate %49 DescriptorSet 49 
                                             OpDecorate %49 Binding 49 
                                             OpDecorate %50 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %51 DescriptorSet 51 
                                             OpDecorate %51 Binding 51 
                                             OpDecorate %52 RelaxedPrecision 
                                             OpDecorate %57 RelaxedPrecision 
                                             OpDecorate %63 RelaxedPrecision 
                                             OpDecorate %64 RelaxedPrecision 
                                             OpDecorate %65 RelaxedPrecision 
                                             OpDecorate %66 RelaxedPrecision 
                                             OpDecorate %70 RelaxedPrecision 
                                             OpDecorate %70 Location 70 
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
                                     %25 = OpTypePointer Private %6 
                        Private f32* %26 = OpVariable Private 
                                     %27 = OpTypeInt 32 0 
                                 u32 %28 = OpConstant 3 
                                     %31 = OpTypeStruct %6 %6 
                                     %32 = OpTypePointer Uniform %31 
         Uniform struct {f32; f32;}* %33 = OpVariable Uniform 
                                     %34 = OpTypeInt 32 1 
                                 i32 %35 = OpConstant 1 
                                     %36 = OpTypePointer Uniform %6 
                                     %40 = OpTypeVector %6 3 
                                     %41 = OpTypePointer Private %40 
                      Private f32_3* %42 = OpVariable Private 
                      Private f32_4* %48 = OpVariable Private 
UniformConstant read_only Texture2D* %49 = OpVariable UniformConstant 
            UniformConstant sampler* %51 = OpVariable UniformConstant 
                                 i32 %58 = OpConstant 0 
                                     %69 = OpTypePointer Output %7 
                       Output f32_4* %70 = OpVariable Output 
                                 f32 %74 = OpConstant 3.674022E-40 
                                     %75 = OpTypePointer Output %6 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                        Private f32* %29 = OpAccessChain %9 %28 
                                 f32 %30 = OpLoad %29 
                        Uniform f32* %37 = OpAccessChain %33 %35 
                                 f32 %38 = OpLoad %37 
                                 f32 %39 = OpFMul %30 %38 
                                             OpStore %26 %39 
                               f32_4 %43 = OpLoad %9 
                               f32_3 %44 = OpVectorShuffle %43 %43 0 1 2 
                                 f32 %45 = OpLoad %26 
                               f32_3 %46 = OpCompositeConstruct %45 %45 %45 
                               f32_3 %47 = OpFMul %44 %46 
                                             OpStore %42 %47 
                 read_only Texture2D %50 = OpLoad %49 
                             sampler %52 = OpLoad %51 
          read_only Texture2DSampled %53 = OpSampledImage %50 %52 
                               f32_2 %54 = OpLoad vs_TEXCOORD0 
                               f32_4 %55 = OpImageSampleImplicitLod %53 %54 
                                             OpStore %48 %55 
                        Private f32* %56 = OpAccessChain %48 %28 
                                 f32 %57 = OpLoad %56 
                        Uniform f32* %59 = OpAccessChain %33 %58 
                                 f32 %60 = OpLoad %59 
                                 f32 %61 = OpFMul %57 %60 
                                             OpStore %26 %61 
                                 f32 %62 = OpLoad %26 
                               f32_3 %63 = OpCompositeConstruct %62 %62 %62 
                               f32_4 %64 = OpLoad %48 
                               f32_3 %65 = OpVectorShuffle %64 %64 0 1 2 
                               f32_3 %66 = OpFMul %63 %65 
                               f32_3 %67 = OpLoad %42 
                               f32_3 %68 = OpFAdd %66 %67 
                                             OpStore %42 %68 
                               f32_3 %71 = OpLoad %42 
                               f32_4 %72 = OpLoad %70 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 6 3 
                                             OpStore %70 %73 
                         Output f32* %76 = OpAccessChain %70 %28 
                                             OpStore %76 %74 
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