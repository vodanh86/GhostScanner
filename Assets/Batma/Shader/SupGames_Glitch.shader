//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "SupGames/Glitch" {
Properties {
_MainTex ("Base (RGB)", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 57275
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
uniform 	mediump float _Amount;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.z = in_TEXCOORD0.x + _Amount;
    vs_TEXCOORD0.w = in_TEXCOORD0.x + (-_Amount);
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
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0.x = texture(_MainTex, vs_TEXCOORD0.zy).x;
    u_xlat0.y = texture(_MainTex, vs_TEXCOORD0.xy).y;
    u_xlat0.z = texture(_MainTex, vs_TEXCOORD0.wy).z;
    u_xlat0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Amount;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.z = in_TEXCOORD0.x + _Amount;
    vs_TEXCOORD0.w = in_TEXCOORD0.x + (-_Amount);
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
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0.x = texture(_MainTex, vs_TEXCOORD0.zy).x;
    u_xlat0.y = texture(_MainTex, vs_TEXCOORD0.xy).y;
    u_xlat0.z = texture(_MainTex, vs_TEXCOORD0.wy).z;
    u_xlat0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _Amount;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
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
    vs_TEXCOORD0.z = in_TEXCOORD0.x + _Amount;
    vs_TEXCOORD0.w = in_TEXCOORD0.x + (-_Amount);
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
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
void main()
{
    u_xlat0.x = texture(_MainTex, vs_TEXCOORD0.zy).x;
    u_xlat0.y = texture(_MainTex, vs_TEXCOORD0.xy).y;
    u_xlat0.z = texture(_MainTex, vs_TEXCOORD0.wy).z;
    u_xlat0.w = 1.0;
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
; Bound: 114
; Schema: 0
                                                   OpCapability Shader 
                                            %1 = OpExtInstImport "GLSL.std.450" 
                                                   OpMemoryModel Logical GLSL450 
                                                   OpEntryPoint Vertex %4 "main" %11 %79 %83 %86 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpDecorate %11 RelaxedPrecision 
                                                   OpDecorate %11 Location 11 
                                                   OpDecorate %12 RelaxedPrecision 
                                                   OpDecorate %13 RelaxedPrecision 
                                                   OpDecorate %16 ArrayStride 16 
                                                   OpDecorate %17 ArrayStride 17 
                                                   OpMemberDecorate %18 0 Offset 18 
                                                   OpMemberDecorate %18 1 Offset 18 
                                                   OpMemberDecorate %18 2 RelaxedPrecision 
                                                   OpMemberDecorate %18 2 Offset 18 
                                                   OpDecorate %18 Block 
                                                   OpDecorate %20 DescriptorSet 20 
                                                   OpDecorate %20 Binding 20 
                                                   OpDecorate %30 RelaxedPrecision 
                                                   OpDecorate %31 RelaxedPrecision 
                                                   OpDecorate %38 RelaxedPrecision 
                                                   OpDecorate %39 RelaxedPrecision 
                                                   OpMemberDecorate %77 0 BuiltIn 77 
                                                   OpMemberDecorate %77 1 BuiltIn 77 
                                                   OpMemberDecorate %77 2 BuiltIn 77 
                                                   OpDecorate %77 Block 
                                                   OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD0 Location 83 
                                                   OpDecorate %86 RelaxedPrecision 
                                                   OpDecorate %86 Location 86 
                                                   OpDecorate %90 RelaxedPrecision 
                                                   OpDecorate %93 RelaxedPrecision 
                                                   OpDecorate %94 RelaxedPrecision 
                                                   OpDecorate %99 RelaxedPrecision 
                                                   OpDecorate %101 RelaxedPrecision 
                                                   OpDecorate %102 RelaxedPrecision 
                                                   OpDecorate %103 RelaxedPrecision 
                                                   OpDecorate %106 RelaxedPrecision 
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
                                           %18 = OpTypeStruct %16 %17 %6 
                                           %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32;}* %20 = OpVariable Uniform 
                                           %21 = OpTypeInt 32 1 
                                       i32 %22 = OpConstant 0 
                                       i32 %23 = OpConstant 1 
                                           %24 = OpTypePointer Uniform %7 
                                       i32 %35 = OpConstant 2 
                                       i32 %44 = OpConstant 3 
                            Private f32_4* %48 = OpVariable Private 
                                       u32 %75 = OpConstant 1 
                                           %76 = OpTypeArray %6 %75 
                                           %77 = OpTypeStruct %7 %6 %76 
                                           %78 = OpTypePointer Output %77 
      Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                           %81 = OpTypePointer Output %7 
                    Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                           %84 = OpTypeVector %6 2 
                                           %85 = OpTypePointer Input %84 
                              Input f32_2* %86 = OpVariable Input 
                                       u32 %87 = OpConstant 0 
                                           %88 = OpTypePointer Input %6 
                                           %91 = OpTypePointer Uniform %6 
                                       u32 %95 = OpConstant 2 
                                           %96 = OpTypePointer Output %6 
                                      u32 %104 = OpConstant 3 
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
                            Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                     f32_4 %69 = OpLoad %68 
                                     f32_4 %70 = OpLoad %9 
                                     f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                     f32_4 %72 = OpFMul %69 %71 
                                     f32_4 %73 = OpLoad %48 
                                     f32_4 %74 = OpFAdd %72 %73 
                                                   OpStore %9 %74 
                                     f32_4 %80 = OpLoad %9 
                             Output f32_4* %82 = OpAccessChain %79 %22 
                                                   OpStore %82 %80 
                                Input f32* %89 = OpAccessChain %86 %87 
                                       f32 %90 = OpLoad %89 
                              Uniform f32* %92 = OpAccessChain %20 %35 
                                       f32 %93 = OpLoad %92 
                                       f32 %94 = OpFAdd %90 %93 
                               Output f32* %97 = OpAccessChain vs_TEXCOORD0 %95 
                                                   OpStore %97 %94 
                                Input f32* %98 = OpAccessChain %86 %87 
                                       f32 %99 = OpLoad %98 
                             Uniform f32* %100 = OpAccessChain %20 %35 
                                      f32 %101 = OpLoad %100 
                                      f32 %102 = OpFNegate %101 
                                      f32 %103 = OpFAdd %99 %102 
                              Output f32* %105 = OpAccessChain vs_TEXCOORD0 %104 
                                                   OpStore %105 %103 
                                    f32_2 %106 = OpLoad %86 
                                    f32_4 %107 = OpLoad vs_TEXCOORD0 
                                    f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                   OpStore vs_TEXCOORD0 %108 
                              Output f32* %109 = OpAccessChain %79 %22 %75 
                                      f32 %110 = OpLoad %109 
                                      f32 %111 = OpFNegate %110 
                              Output f32* %112 = OpAccessChain %79 %22 %75 
                                                   OpStore %112 %111 
                                                   OpReturn
                                                   OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 56
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %53 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %53 RelaxedPrecision 
                                             OpDecorate %53 Location 53 
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
                                     %20 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                     %22 = OpTypeVector %6 2 
                                     %26 = OpTypeInt 32 0 
                                 u32 %27 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                 u32 %37 = OpConstant 1 
                                 u32 %46 = OpConstant 2 
                                 f32 %49 = OpConstant 3.674022E-40 
                                 u32 %50 = OpConstant 3 
                                     %52 = OpTypePointer Output %7 
                       Output f32_4* %53 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_4 %23 = OpLoad vs_TEXCOORD0 
                               f32_2 %24 = OpVectorShuffle %23 %23 2 1 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %24 
                                 f32 %28 = OpCompositeExtract %25 0 
                        Private f32* %30 = OpAccessChain %9 %27 
                                             OpStore %30 %28 
                 read_only Texture2D %31 = OpLoad %12 
                             sampler %32 = OpLoad %16 
          read_only Texture2DSampled %33 = OpSampledImage %31 %32 
                               f32_4 %34 = OpLoad vs_TEXCOORD0 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_4 %36 = OpImageSampleImplicitLod %33 %35 
                                 f32 %38 = OpCompositeExtract %36 1 
                        Private f32* %39 = OpAccessChain %9 %37 
                                             OpStore %39 %38 
                 read_only Texture2D %40 = OpLoad %12 
                             sampler %41 = OpLoad %16 
          read_only Texture2DSampled %42 = OpSampledImage %40 %41 
                               f32_4 %43 = OpLoad vs_TEXCOORD0 
                               f32_2 %44 = OpVectorShuffle %43 %43 3 1 
                               f32_4 %45 = OpImageSampleImplicitLod %42 %44 
                                 f32 %47 = OpCompositeExtract %45 2 
                        Private f32* %48 = OpAccessChain %9 %46 
                                             OpStore %48 %47 
                        Private f32* %51 = OpAccessChain %9 %50 
                                             OpStore %51 %49 
                               f32_4 %54 = OpLoad %9 
                                             OpStore %53 %54 
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
                                                   OpEntryPoint Vertex %4 "main" %11 %79 %83 %86 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpDecorate %11 RelaxedPrecision 
                                                   OpDecorate %11 Location 11 
                                                   OpDecorate %12 RelaxedPrecision 
                                                   OpDecorate %13 RelaxedPrecision 
                                                   OpDecorate %16 ArrayStride 16 
                                                   OpDecorate %17 ArrayStride 17 
                                                   OpMemberDecorate %18 0 Offset 18 
                                                   OpMemberDecorate %18 1 Offset 18 
                                                   OpMemberDecorate %18 2 RelaxedPrecision 
                                                   OpMemberDecorate %18 2 Offset 18 
                                                   OpDecorate %18 Block 
                                                   OpDecorate %20 DescriptorSet 20 
                                                   OpDecorate %20 Binding 20 
                                                   OpDecorate %30 RelaxedPrecision 
                                                   OpDecorate %31 RelaxedPrecision 
                                                   OpDecorate %38 RelaxedPrecision 
                                                   OpDecorate %39 RelaxedPrecision 
                                                   OpMemberDecorate %77 0 BuiltIn 77 
                                                   OpMemberDecorate %77 1 BuiltIn 77 
                                                   OpMemberDecorate %77 2 BuiltIn 77 
                                                   OpDecorate %77 Block 
                                                   OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD0 Location 83 
                                                   OpDecorate %86 RelaxedPrecision 
                                                   OpDecorate %86 Location 86 
                                                   OpDecorate %90 RelaxedPrecision 
                                                   OpDecorate %93 RelaxedPrecision 
                                                   OpDecorate %94 RelaxedPrecision 
                                                   OpDecorate %99 RelaxedPrecision 
                                                   OpDecorate %101 RelaxedPrecision 
                                                   OpDecorate %102 RelaxedPrecision 
                                                   OpDecorate %103 RelaxedPrecision 
                                                   OpDecorate %106 RelaxedPrecision 
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
                                           %18 = OpTypeStruct %16 %17 %6 
                                           %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32;}* %20 = OpVariable Uniform 
                                           %21 = OpTypeInt 32 1 
                                       i32 %22 = OpConstant 0 
                                       i32 %23 = OpConstant 1 
                                           %24 = OpTypePointer Uniform %7 
                                       i32 %35 = OpConstant 2 
                                       i32 %44 = OpConstant 3 
                            Private f32_4* %48 = OpVariable Private 
                                       u32 %75 = OpConstant 1 
                                           %76 = OpTypeArray %6 %75 
                                           %77 = OpTypeStruct %7 %6 %76 
                                           %78 = OpTypePointer Output %77 
      Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                           %81 = OpTypePointer Output %7 
                    Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                           %84 = OpTypeVector %6 2 
                                           %85 = OpTypePointer Input %84 
                              Input f32_2* %86 = OpVariable Input 
                                       u32 %87 = OpConstant 0 
                                           %88 = OpTypePointer Input %6 
                                           %91 = OpTypePointer Uniform %6 
                                       u32 %95 = OpConstant 2 
                                           %96 = OpTypePointer Output %6 
                                      u32 %104 = OpConstant 3 
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
                            Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                     f32_4 %69 = OpLoad %68 
                                     f32_4 %70 = OpLoad %9 
                                     f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                     f32_4 %72 = OpFMul %69 %71 
                                     f32_4 %73 = OpLoad %48 
                                     f32_4 %74 = OpFAdd %72 %73 
                                                   OpStore %9 %74 
                                     f32_4 %80 = OpLoad %9 
                             Output f32_4* %82 = OpAccessChain %79 %22 
                                                   OpStore %82 %80 
                                Input f32* %89 = OpAccessChain %86 %87 
                                       f32 %90 = OpLoad %89 
                              Uniform f32* %92 = OpAccessChain %20 %35 
                                       f32 %93 = OpLoad %92 
                                       f32 %94 = OpFAdd %90 %93 
                               Output f32* %97 = OpAccessChain vs_TEXCOORD0 %95 
                                                   OpStore %97 %94 
                                Input f32* %98 = OpAccessChain %86 %87 
                                       f32 %99 = OpLoad %98 
                             Uniform f32* %100 = OpAccessChain %20 %35 
                                      f32 %101 = OpLoad %100 
                                      f32 %102 = OpFNegate %101 
                                      f32 %103 = OpFAdd %99 %102 
                              Output f32* %105 = OpAccessChain vs_TEXCOORD0 %104 
                                                   OpStore %105 %103 
                                    f32_2 %106 = OpLoad %86 
                                    f32_4 %107 = OpLoad vs_TEXCOORD0 
                                    f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                   OpStore vs_TEXCOORD0 %108 
                              Output f32* %109 = OpAccessChain %79 %22 %75 
                                      f32 %110 = OpLoad %109 
                                      f32 %111 = OpFNegate %110 
                              Output f32* %112 = OpAccessChain %79 %22 %75 
                                                   OpStore %112 %111 
                                                   OpReturn
                                                   OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 56
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %53 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %53 RelaxedPrecision 
                                             OpDecorate %53 Location 53 
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
                                     %20 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                     %22 = OpTypeVector %6 2 
                                     %26 = OpTypeInt 32 0 
                                 u32 %27 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                 u32 %37 = OpConstant 1 
                                 u32 %46 = OpConstant 2 
                                 f32 %49 = OpConstant 3.674022E-40 
                                 u32 %50 = OpConstant 3 
                                     %52 = OpTypePointer Output %7 
                       Output f32_4* %53 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_4 %23 = OpLoad vs_TEXCOORD0 
                               f32_2 %24 = OpVectorShuffle %23 %23 2 1 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %24 
                                 f32 %28 = OpCompositeExtract %25 0 
                        Private f32* %30 = OpAccessChain %9 %27 
                                             OpStore %30 %28 
                 read_only Texture2D %31 = OpLoad %12 
                             sampler %32 = OpLoad %16 
          read_only Texture2DSampled %33 = OpSampledImage %31 %32 
                               f32_4 %34 = OpLoad vs_TEXCOORD0 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_4 %36 = OpImageSampleImplicitLod %33 %35 
                                 f32 %38 = OpCompositeExtract %36 1 
                        Private f32* %39 = OpAccessChain %9 %37 
                                             OpStore %39 %38 
                 read_only Texture2D %40 = OpLoad %12 
                             sampler %41 = OpLoad %16 
          read_only Texture2DSampled %42 = OpSampledImage %40 %41 
                               f32_4 %43 = OpLoad vs_TEXCOORD0 
                               f32_2 %44 = OpVectorShuffle %43 %43 3 1 
                               f32_4 %45 = OpImageSampleImplicitLod %42 %44 
                                 f32 %47 = OpCompositeExtract %45 2 
                        Private f32* %48 = OpAccessChain %9 %46 
                                             OpStore %48 %47 
                        Private f32* %51 = OpAccessChain %9 %50 
                                             OpStore %51 %49 
                               f32_4 %54 = OpLoad %9 
                                             OpStore %53 %54 
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
                                                   OpEntryPoint Vertex %4 "main" %11 %79 %83 %86 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpDecorate %11 RelaxedPrecision 
                                                   OpDecorate %11 Location 11 
                                                   OpDecorate %12 RelaxedPrecision 
                                                   OpDecorate %13 RelaxedPrecision 
                                                   OpDecorate %16 ArrayStride 16 
                                                   OpDecorate %17 ArrayStride 17 
                                                   OpMemberDecorate %18 0 Offset 18 
                                                   OpMemberDecorate %18 1 Offset 18 
                                                   OpMemberDecorate %18 2 RelaxedPrecision 
                                                   OpMemberDecorate %18 2 Offset 18 
                                                   OpDecorate %18 Block 
                                                   OpDecorate %20 DescriptorSet 20 
                                                   OpDecorate %20 Binding 20 
                                                   OpDecorate %30 RelaxedPrecision 
                                                   OpDecorate %31 RelaxedPrecision 
                                                   OpDecorate %38 RelaxedPrecision 
                                                   OpDecorate %39 RelaxedPrecision 
                                                   OpMemberDecorate %77 0 BuiltIn 77 
                                                   OpMemberDecorate %77 1 BuiltIn 77 
                                                   OpMemberDecorate %77 2 BuiltIn 77 
                                                   OpDecorate %77 Block 
                                                   OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD0 Location 83 
                                                   OpDecorate %86 RelaxedPrecision 
                                                   OpDecorate %86 Location 86 
                                                   OpDecorate %90 RelaxedPrecision 
                                                   OpDecorate %93 RelaxedPrecision 
                                                   OpDecorate %94 RelaxedPrecision 
                                                   OpDecorate %99 RelaxedPrecision 
                                                   OpDecorate %101 RelaxedPrecision 
                                                   OpDecorate %102 RelaxedPrecision 
                                                   OpDecorate %103 RelaxedPrecision 
                                                   OpDecorate %106 RelaxedPrecision 
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
                                           %18 = OpTypeStruct %16 %17 %6 
                                           %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32;}* %20 = OpVariable Uniform 
                                           %21 = OpTypeInt 32 1 
                                       i32 %22 = OpConstant 0 
                                       i32 %23 = OpConstant 1 
                                           %24 = OpTypePointer Uniform %7 
                                       i32 %35 = OpConstant 2 
                                       i32 %44 = OpConstant 3 
                            Private f32_4* %48 = OpVariable Private 
                                       u32 %75 = OpConstant 1 
                                           %76 = OpTypeArray %6 %75 
                                           %77 = OpTypeStruct %7 %6 %76 
                                           %78 = OpTypePointer Output %77 
      Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                           %81 = OpTypePointer Output %7 
                    Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                           %84 = OpTypeVector %6 2 
                                           %85 = OpTypePointer Input %84 
                              Input f32_2* %86 = OpVariable Input 
                                       u32 %87 = OpConstant 0 
                                           %88 = OpTypePointer Input %6 
                                           %91 = OpTypePointer Uniform %6 
                                       u32 %95 = OpConstant 2 
                                           %96 = OpTypePointer Output %6 
                                      u32 %104 = OpConstant 3 
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
                            Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                     f32_4 %69 = OpLoad %68 
                                     f32_4 %70 = OpLoad %9 
                                     f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                     f32_4 %72 = OpFMul %69 %71 
                                     f32_4 %73 = OpLoad %48 
                                     f32_4 %74 = OpFAdd %72 %73 
                                                   OpStore %9 %74 
                                     f32_4 %80 = OpLoad %9 
                             Output f32_4* %82 = OpAccessChain %79 %22 
                                                   OpStore %82 %80 
                                Input f32* %89 = OpAccessChain %86 %87 
                                       f32 %90 = OpLoad %89 
                              Uniform f32* %92 = OpAccessChain %20 %35 
                                       f32 %93 = OpLoad %92 
                                       f32 %94 = OpFAdd %90 %93 
                               Output f32* %97 = OpAccessChain vs_TEXCOORD0 %95 
                                                   OpStore %97 %94 
                                Input f32* %98 = OpAccessChain %86 %87 
                                       f32 %99 = OpLoad %98 
                             Uniform f32* %100 = OpAccessChain %20 %35 
                                      f32 %101 = OpLoad %100 
                                      f32 %102 = OpFNegate %101 
                                      f32 %103 = OpFAdd %99 %102 
                              Output f32* %105 = OpAccessChain vs_TEXCOORD0 %104 
                                                   OpStore %105 %103 
                                    f32_2 %106 = OpLoad %86 
                                    f32_4 %107 = OpLoad vs_TEXCOORD0 
                                    f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                   OpStore vs_TEXCOORD0 %108 
                              Output f32* %109 = OpAccessChain %79 %22 %75 
                                      f32 %110 = OpLoad %109 
                                      f32 %111 = OpFNegate %110 
                              Output f32* %112 = OpAccessChain %79 %22 %75 
                                                   OpStore %112 %111 
                                                   OpReturn
                                                   OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 56
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %21 %53 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 21 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %25 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
                                             OpDecorate %32 RelaxedPrecision 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %36 RelaxedPrecision 
                                             OpDecorate %40 RelaxedPrecision 
                                             OpDecorate %41 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %44 RelaxedPrecision 
                                             OpDecorate %45 RelaxedPrecision 
                                             OpDecorate %53 RelaxedPrecision 
                                             OpDecorate %53 Location 53 
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
                                     %20 = OpTypePointer Input %7 
               Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                     %22 = OpTypeVector %6 2 
                                     %26 = OpTypeInt 32 0 
                                 u32 %27 = OpConstant 0 
                                     %29 = OpTypePointer Private %6 
                                 u32 %37 = OpConstant 1 
                                 u32 %46 = OpConstant 2 
                                 f32 %49 = OpConstant 3.674022E-40 
                                 u32 %50 = OpConstant 3 
                                     %52 = OpTypePointer Output %7 
                       Output f32_4* %53 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_4 %23 = OpLoad vs_TEXCOORD0 
                               f32_2 %24 = OpVectorShuffle %23 %23 2 1 
                               f32_4 %25 = OpImageSampleImplicitLod %19 %24 
                                 f32 %28 = OpCompositeExtract %25 0 
                        Private f32* %30 = OpAccessChain %9 %27 
                                             OpStore %30 %28 
                 read_only Texture2D %31 = OpLoad %12 
                             sampler %32 = OpLoad %16 
          read_only Texture2DSampled %33 = OpSampledImage %31 %32 
                               f32_4 %34 = OpLoad vs_TEXCOORD0 
                               f32_2 %35 = OpVectorShuffle %34 %34 0 1 
                               f32_4 %36 = OpImageSampleImplicitLod %33 %35 
                                 f32 %38 = OpCompositeExtract %36 1 
                        Private f32* %39 = OpAccessChain %9 %37 
                                             OpStore %39 %38 
                 read_only Texture2D %40 = OpLoad %12 
                             sampler %41 = OpLoad %16 
          read_only Texture2DSampled %42 = OpSampledImage %40 %41 
                               f32_4 %43 = OpLoad vs_TEXCOORD0 
                               f32_2 %44 = OpVectorShuffle %43 %43 3 1 
                               f32_4 %45 = OpImageSampleImplicitLod %42 %44 
                                 f32 %47 = OpCompositeExtract %45 2 
                        Private f32* %48 = OpAccessChain %9 %46 
                                             OpStore %48 %47 
                        Private f32* %51 = OpAccessChain %9 %50 
                                             OpStore %51 %49 
                               f32_4 %54 = OpLoad %9 
                                             OpStore %53 %54 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "FRAME" "PIXEL" }
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
uniform 	mediump float _Amount;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
    vs_TEXCOORD0.z = in_TEXCOORD0.x + _Amount;
    vs_TEXCOORD0.w = in_TEXCOORD0.x + (-_Amount);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_0 = in_TEXCOORD0.xyxy * vec4(24.0, 9.0, 8.0, 4.0);
    vs_TEXCOORD1 = floor(u_xlat16_0);
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
uniform 	vec4 _Time;
uniform 	vec4 _CosTime;
uniform 	mediump float _Frame;
uniform 	mediump vec2 _Pixel;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.x = _Time.y * 12.0;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat16_1 = floor(vs_TEXCOORD1);
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    u_xlat0.x = dot(u_xlat0.xy, vec2(127.099998, 311.700012));
    u_xlat0.y = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_4 = u_xlat0.y * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_4 * u_xlat16_1.x;
    u_xlat0.x = _CosTime.w * 4.0 + _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=0.300000012);
#else
    u_xlatb0 = u_xlat0.x>=0.300000012;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = vs_TEXCOORD0.y * 10.0 + _Time.y;
    u_xlat3 = sin(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.xyz = u_xlat0.xxx * vec3(vec3(_Frame, _Frame, _Frame)) + vs_TEXCOORD0.zxw;
    u_xlat16_2.x = u_xlat16_1.x * _Pixel.xxxy.z + u_xlat0.y;
    u_xlat16_2.z = (-u_xlat16_1.x) * _Pixel.xxxy.w + u_xlat0.z;
    u_xlat16_2.yw = vs_TEXCOORD0.yy;
    u_xlat1.y = texture(_MainTex, u_xlat16_2.xy).y;
    u_xlat1.z = texture(_MainTex, u_xlat16_2.zw).z;
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat1.x = texture(_MainTex, u_xlat0.xy).x;
    u_xlat1.w = 1.0;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "FRAME" "PIXEL" }
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
uniform 	mediump float _Amount;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
    vs_TEXCOORD0.z = in_TEXCOORD0.x + _Amount;
    vs_TEXCOORD0.w = in_TEXCOORD0.x + (-_Amount);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_0 = in_TEXCOORD0.xyxy * vec4(24.0, 9.0, 8.0, 4.0);
    vs_TEXCOORD1 = floor(u_xlat16_0);
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
uniform 	vec4 _Time;
uniform 	vec4 _CosTime;
uniform 	mediump float _Frame;
uniform 	mediump vec2 _Pixel;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.x = _Time.y * 12.0;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat16_1 = floor(vs_TEXCOORD1);
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    u_xlat0.x = dot(u_xlat0.xy, vec2(127.099998, 311.700012));
    u_xlat0.y = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_4 = u_xlat0.y * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_4 * u_xlat16_1.x;
    u_xlat0.x = _CosTime.w * 4.0 + _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=0.300000012);
#else
    u_xlatb0 = u_xlat0.x>=0.300000012;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = vs_TEXCOORD0.y * 10.0 + _Time.y;
    u_xlat3 = sin(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.xyz = u_xlat0.xxx * vec3(vec3(_Frame, _Frame, _Frame)) + vs_TEXCOORD0.zxw;
    u_xlat16_2.x = u_xlat16_1.x * _Pixel.xxxy.z + u_xlat0.y;
    u_xlat16_2.z = (-u_xlat16_1.x) * _Pixel.xxxy.w + u_xlat0.z;
    u_xlat16_2.yw = vs_TEXCOORD0.yy;
    u_xlat1.y = texture(_MainTex, u_xlat16_2.xy).y;
    u_xlat1.z = texture(_MainTex, u_xlat16_2.zw).z;
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat1.x = texture(_MainTex, u_xlat0.xy).x;
    u_xlat1.w = 1.0;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "FRAME" "PIXEL" }
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
uniform 	mediump float _Amount;
in mediump vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
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
    vs_TEXCOORD0.z = in_TEXCOORD0.x + _Amount;
    vs_TEXCOORD0.w = in_TEXCOORD0.x + (-_Amount);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat16_0 = in_TEXCOORD0.xyxy * vec4(24.0, 9.0, 8.0, 4.0);
    vs_TEXCOORD1 = floor(u_xlat16_0);
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
uniform 	vec4 _Time;
uniform 	vec4 _CosTime;
uniform 	mediump float _Frame;
uniform 	mediump vec2 _Pixel;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
void main()
{
    u_xlat0.x = _Time.y * 12.0;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat16_1 = floor(vs_TEXCOORD1);
    u_xlat0 = u_xlat0.xxxx * u_xlat16_1;
    u_xlat0.x = dot(u_xlat0.xy, vec2(127.099998, 311.700012));
    u_xlat0.y = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
    u_xlat0.xy = sin(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * vec2(43758.5469, 43758.5469);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_4 = u_xlat0.y * u_xlat16_1.y;
    u_xlat16_1.x = u_xlat16_4 * u_xlat16_1.x;
    u_xlat0.x = _CosTime.w * 4.0 + _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=0.300000012);
#else
    u_xlatb0 = u_xlat0.x>=0.300000012;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat3 = vs_TEXCOORD0.y * 10.0 + _Time.y;
    u_xlat3 = sin(u_xlat3);
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.xyz = u_xlat0.xxx * vec3(vec3(_Frame, _Frame, _Frame)) + vs_TEXCOORD0.zxw;
    u_xlat16_2.x = u_xlat16_1.x * _Pixel.xxxy.z + u_xlat0.y;
    u_xlat16_2.z = (-u_xlat16_1.x) * _Pixel.xxxy.w + u_xlat0.z;
    u_xlat16_2.yw = vs_TEXCOORD0.yy;
    u_xlat1.y = texture(_MainTex, u_xlat16_2.xy).y;
    u_xlat1.z = texture(_MainTex, u_xlat16_2.zw).z;
    u_xlat0.y = vs_TEXCOORD0.y;
    u_xlat1.x = texture(_MainTex, u_xlat0.xy).x;
    u_xlat1.w = 1.0;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Local Keywords { "FRAME" "PIXEL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 126
; Schema: 0
                                                   OpCapability Shader 
                                            %1 = OpExtInstImport "GLSL.std.450" 
                                                   OpMemoryModel Logical GLSL450 
                                                   OpEntryPoint Vertex %4 "main" %11 %79 %83 %86 %118 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                   OpDecorate %11 RelaxedPrecision 
                                                   OpDecorate %11 Location 11 
                                                   OpDecorate %12 RelaxedPrecision 
                                                   OpDecorate %13 RelaxedPrecision 
                                                   OpDecorate %16 ArrayStride 16 
                                                   OpDecorate %17 ArrayStride 17 
                                                   OpMemberDecorate %18 0 Offset 18 
                                                   OpMemberDecorate %18 1 Offset 18 
                                                   OpMemberDecorate %18 2 RelaxedPrecision 
                                                   OpMemberDecorate %18 2 Offset 18 
                                                   OpDecorate %18 Block 
                                                   OpDecorate %20 DescriptorSet 20 
                                                   OpDecorate %20 Binding 20 
                                                   OpDecorate %30 RelaxedPrecision 
                                                   OpDecorate %31 RelaxedPrecision 
                                                   OpDecorate %38 RelaxedPrecision 
                                                   OpDecorate %39 RelaxedPrecision 
                                                   OpMemberDecorate %77 0 BuiltIn 77 
                                                   OpMemberDecorate %77 1 BuiltIn 77 
                                                   OpMemberDecorate %77 2 BuiltIn 77 
                                                   OpDecorate %77 Block 
                                                   OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD0 Location 83 
                                                   OpDecorate %86 RelaxedPrecision 
                                                   OpDecorate %86 Location 86 
                                                   OpDecorate %90 RelaxedPrecision 
                                                   OpDecorate %93 RelaxedPrecision 
                                                   OpDecorate %94 RelaxedPrecision 
                                                   OpDecorate %99 RelaxedPrecision 
                                                   OpDecorate %101 RelaxedPrecision 
                                                   OpDecorate %102 RelaxedPrecision 
                                                   OpDecorate %103 RelaxedPrecision 
                                                   OpDecorate %106 RelaxedPrecision 
                                                   OpDecorate %109 RelaxedPrecision 
                                                   OpDecorate %110 RelaxedPrecision 
                                                   OpDecorate %111 RelaxedPrecision 
                                                   OpDecorate %117 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD1 Location 118 
                                                   OpDecorate %119 RelaxedPrecision 
                                                   OpDecorate %120 RelaxedPrecision 
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
                                           %18 = OpTypeStruct %16 %17 %6 
                                           %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32;}* %20 = OpVariable Uniform 
                                           %21 = OpTypeInt 32 1 
                                       i32 %22 = OpConstant 0 
                                       i32 %23 = OpConstant 1 
                                           %24 = OpTypePointer Uniform %7 
                                       i32 %35 = OpConstant 2 
                                       i32 %44 = OpConstant 3 
                            Private f32_4* %48 = OpVariable Private 
                                       u32 %75 = OpConstant 1 
                                           %76 = OpTypeArray %6 %75 
                                           %77 = OpTypeStruct %7 %6 %76 
                                           %78 = OpTypePointer Output %77 
      Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                           %81 = OpTypePointer Output %7 
                    Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                           %84 = OpTypeVector %6 2 
                                           %85 = OpTypePointer Input %84 
                              Input f32_2* %86 = OpVariable Input 
                                       u32 %87 = OpConstant 0 
                                           %88 = OpTypePointer Input %6 
                                           %91 = OpTypePointer Uniform %6 
                                       u32 %95 = OpConstant 2 
                                           %96 = OpTypePointer Output %6 
                                      u32 %104 = OpConstant 3 
                           Private f32_4* %109 = OpVariable Private 
                                      f32 %112 = OpConstant 3.674022E-40 
                                      f32 %113 = OpConstant 3.674022E-40 
                                      f32 %114 = OpConstant 3.674022E-40 
                                      f32 %115 = OpConstant 3.674022E-40 
                                    f32_4 %116 = OpConstantComposite %112 %113 %114 %115 
                    Output f32_4* vs_TEXCOORD1 = OpVariable Output 
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
                            Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                     f32_4 %69 = OpLoad %68 
                                     f32_4 %70 = OpLoad %9 
                                     f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                     f32_4 %72 = OpFMul %69 %71 
                                     f32_4 %73 = OpLoad %48 
                                     f32_4 %74 = OpFAdd %72 %73 
                                                   OpStore %9 %74 
                                     f32_4 %80 = OpLoad %9 
                             Output f32_4* %82 = OpAccessChain %79 %22 
                                                   OpStore %82 %80 
                                Input f32* %89 = OpAccessChain %86 %87 
                                       f32 %90 = OpLoad %89 
                              Uniform f32* %92 = OpAccessChain %20 %35 
                                       f32 %93 = OpLoad %92 
                                       f32 %94 = OpFAdd %90 %93 
                               Output f32* %97 = OpAccessChain vs_TEXCOORD0 %95 
                                                   OpStore %97 %94 
                                Input f32* %98 = OpAccessChain %86 %87 
                                       f32 %99 = OpLoad %98 
                             Uniform f32* %100 = OpAccessChain %20 %35 
                                      f32 %101 = OpLoad %100 
                                      f32 %102 = OpFNegate %101 
                                      f32 %103 = OpFAdd %99 %102 
                              Output f32* %105 = OpAccessChain vs_TEXCOORD0 %104 
                                                   OpStore %105 %103 
                                    f32_2 %106 = OpLoad %86 
                                    f32_4 %107 = OpLoad vs_TEXCOORD0 
                                    f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                   OpStore vs_TEXCOORD0 %108 
                                    f32_2 %110 = OpLoad %86 
                                    f32_4 %111 = OpVectorShuffle %110 %110 0 1 0 1 
                                    f32_4 %117 = OpFMul %111 %116 
                                                   OpStore %109 %117 
                                    f32_4 %119 = OpLoad %109 
                                    f32_4 %120 = OpExtInst %1 8 %119 
                                                   OpStore vs_TEXCOORD1 %120 
                              Output f32* %121 = OpAccessChain %79 %22 %75 
                                      f32 %122 = OpLoad %121 
                                      f32 %123 = OpFNegate %122 
                              Output f32* %124 = OpAccessChain %79 %22 %75 
                                                   OpStore %124 %123 
                                                   OpReturn
                                                   OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 227
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %32 %124 %224 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                    OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                    OpMemberDecorate %11 0 Offset 11 
                                                    OpMemberDecorate %11 1 Offset 11 
                                                    OpMemberDecorate %11 2 RelaxedPrecision 
                                                    OpMemberDecorate %11 2 Offset 11 
                                                    OpMemberDecorate %11 3 RelaxedPrecision 
                                                    OpMemberDecorate %11 3 Offset 11 
                                                    OpDecorate %11 Block 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD1 Location 32 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD0 Location 124 
                                                    OpDecorate %127 RelaxedPrecision 
                                                    OpDecorate %129 RelaxedPrecision 
                                                    OpDecorate %145 RelaxedPrecision 
                                                    OpDecorate %147 RelaxedPrecision 
                                                    OpDecorate %149 RelaxedPrecision 
                                                    OpDecorate %156 RelaxedPrecision 
                                                    OpDecorate %157 RelaxedPrecision 
                                                    OpDecorate %161 RelaxedPrecision 
                                                    OpDecorate %163 RelaxedPrecision 
                                                    OpDecorate %166 RelaxedPrecision 
                                                    OpDecorate %167 RelaxedPrecision 
                                                    OpDecorate %173 RelaxedPrecision 
                                                    OpDecorate %174 RelaxedPrecision 
                                                    OpDecorate %176 RelaxedPrecision 
                                                    OpDecorate %177 RelaxedPrecision 
                                                    OpDecorate %183 RelaxedPrecision 
                                                    OpDecorate %184 RelaxedPrecision 
                                                    OpDecorate %190 RelaxedPrecision 
                                                    OpDecorate %190 DescriptorSet 190 
                                                    OpDecorate %190 Binding 190 
                                                    OpDecorate %191 RelaxedPrecision 
                                                    OpDecorate %194 RelaxedPrecision 
                                                    OpDecorate %194 DescriptorSet 194 
                                                    OpDecorate %194 Binding 194 
                                                    OpDecorate %195 RelaxedPrecision 
                                                    OpDecorate %198 RelaxedPrecision 
                                                    OpDecorate %199 RelaxedPrecision 
                                                    OpDecorate %200 RelaxedPrecision 
                                                    OpDecorate %203 RelaxedPrecision 
                                                    OpDecorate %204 RelaxedPrecision 
                                                    OpDecorate %206 RelaxedPrecision 
                                                    OpDecorate %207 RelaxedPrecision 
                                                    OpDecorate %208 RelaxedPrecision 
                                                    OpDecorate %212 RelaxedPrecision 
                                                    OpDecorate %214 RelaxedPrecision 
                                                    OpDecorate %215 RelaxedPrecision 
                                                    OpDecorate %224 RelaxedPrecision 
                                                    OpDecorate %224 Location 224 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 2 
                                            %11 = OpTypeStruct %7 %7 %6 %10 
                                            %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32_4; f32; f32_2;}* %13 = OpVariable Uniform 
                                            %14 = OpTypeInt 32 1 
                                        i32 %15 = OpConstant 0 
                                            %16 = OpTypeInt 32 0 
                                        u32 %17 = OpConstant 1 
                                            %18 = OpTypePointer Uniform %6 
                                        f32 %21 = OpConstant 3.674022E-40 
                                        u32 %23 = OpConstant 0 
                                            %24 = OpTypePointer Private %6 
                             Private f32_4* %30 = OpVariable Private 
                                            %31 = OpTypePointer Input %7 
                      Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                        f32 %41 = OpConstant 3.674022E-40 
                                        f32 %42 = OpConstant 3.674022E-40 
                                      f32_2 %43 = OpConstantComposite %41 %42 
                                        f32 %57 = OpConstant 3.674022E-40 
                                      f32_2 %58 = OpConstantComposite %57 %57 
                               Private f32* %86 = OpVariable Private 
                                        i32 %97 = OpConstant 1 
                                        u32 %98 = OpConstant 3 
                                       f32 %101 = OpConstant 3.674022E-40 
                                           %111 = OpTypeBool 
                                           %112 = OpTypePointer Private %111 
                             Private bool* %113 = OpVariable Private 
                                       f32 %116 = OpConstant 3.674022E-40 
                                       f32 %119 = OpConstant 3.674022E-40 
                                       f32 %120 = OpConstant 3.674022E-40 
                              Private f32* %123 = OpVariable Private 
                      Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                           %125 = OpTypePointer Input %6 
                                       f32 %128 = OpConstant 3.674022E-40 
                                           %140 = OpTypeVector %6 3 
                                       i32 %143 = OpConstant 2 
                            Private f32_4* %161 = OpVariable Private 
                                       i32 %164 = OpConstant 3 
                                       u32 %178 = OpConstant 2 
                            Private f32_4* %187 = OpVariable Private 
                                           %188 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                           %189 = OpTypePointer UniformConstant %188 
      UniformConstant read_only Texture2D* %190 = OpVariable UniformConstant 
                                           %192 = OpTypeSampler 
                                           %193 = OpTypePointer UniformConstant %192 
                  UniformConstant sampler* %194 = OpVariable UniformConstant 
                                           %196 = OpTypeSampledImage %188 
                                           %223 = OpTypePointer Output %7 
                             Output f32_4* %224 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                               Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                        f32 %20 = OpLoad %19 
                                        f32 %22 = OpFMul %20 %21 
                               Private f32* %25 = OpAccessChain %9 %23 
                                                    OpStore %25 %22 
                               Private f32* %26 = OpAccessChain %9 %23 
                                        f32 %27 = OpLoad %26 
                                        f32 %28 = OpExtInst %1 8 %27 
                               Private f32* %29 = OpAccessChain %9 %23 
                                                    OpStore %29 %28 
                                      f32_4 %33 = OpLoad vs_TEXCOORD1 
                                      f32_4 %34 = OpExtInst %1 8 %33 
                                                    OpStore %30 %34 
                                      f32_4 %35 = OpLoad %9 
                                      f32_4 %36 = OpVectorShuffle %35 %35 0 0 0 0 
                                      f32_4 %37 = OpLoad %30 
                                      f32_4 %38 = OpFMul %36 %37 
                                                    OpStore %9 %38 
                                      f32_4 %39 = OpLoad %9 
                                      f32_2 %40 = OpVectorShuffle %39 %39 0 1 
                                        f32 %44 = OpDot %40 %43 
                               Private f32* %45 = OpAccessChain %9 %23 
                                                    OpStore %45 %44 
                                      f32_4 %46 = OpLoad %9 
                                      f32_2 %47 = OpVectorShuffle %46 %46 2 3 
                                        f32 %48 = OpDot %47 %43 
                               Private f32* %49 = OpAccessChain %9 %17 
                                                    OpStore %49 %48 
                                      f32_4 %50 = OpLoad %9 
                                      f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                      f32_2 %52 = OpExtInst %1 13 %51 
                                      f32_4 %53 = OpLoad %9 
                                      f32_4 %54 = OpVectorShuffle %53 %52 4 5 2 3 
                                                    OpStore %9 %54 
                                      f32_4 %55 = OpLoad %9 
                                      f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                                      f32_2 %59 = OpFMul %56 %58 
                                      f32_4 %60 = OpLoad %9 
                                      f32_4 %61 = OpVectorShuffle %60 %59 4 5 2 3 
                                                    OpStore %9 %61 
                                      f32_4 %62 = OpLoad %9 
                                      f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                                      f32_2 %64 = OpExtInst %1 10 %63 
                                      f32_4 %65 = OpLoad %9 
                                      f32_4 %66 = OpVectorShuffle %65 %64 4 5 2 3 
                                                    OpStore %9 %66 
                                      f32_4 %67 = OpLoad %9 
                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                      f32_4 %69 = OpLoad %9 
                                      f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                      f32_2 %71 = OpFMul %68 %70 
                                      f32_4 %72 = OpLoad %30 
                                      f32_4 %73 = OpVectorShuffle %72 %71 4 5 2 3 
                                                    OpStore %30 %73 
                               Private f32* %74 = OpAccessChain %30 %23 
                                        f32 %75 = OpLoad %74 
                               Private f32* %76 = OpAccessChain %30 %23 
                                        f32 %77 = OpLoad %76 
                                        f32 %78 = OpFMul %75 %77 
                               Private f32* %79 = OpAccessChain %30 %23 
                                                    OpStore %79 %78 
                               Private f32* %80 = OpAccessChain %30 %23 
                                        f32 %81 = OpLoad %80 
                               Private f32* %82 = OpAccessChain %30 %23 
                                        f32 %83 = OpLoad %82 
                                        f32 %84 = OpFMul %81 %83 
                               Private f32* %85 = OpAccessChain %30 %23 
                                                    OpStore %85 %84 
                               Private f32* %87 = OpAccessChain %9 %17 
                                        f32 %88 = OpLoad %87 
                               Private f32* %89 = OpAccessChain %30 %17 
                                        f32 %90 = OpLoad %89 
                                        f32 %91 = OpFMul %88 %90 
                                                    OpStore %86 %91 
                                        f32 %92 = OpLoad %86 
                               Private f32* %93 = OpAccessChain %30 %23 
                                        f32 %94 = OpLoad %93 
                                        f32 %95 = OpFMul %92 %94 
                               Private f32* %96 = OpAccessChain %30 %23 
                                                    OpStore %96 %95 
                               Uniform f32* %99 = OpAccessChain %13 %97 %98 
                                       f32 %100 = OpLoad %99 
                                       f32 %102 = OpFMul %100 %101 
                              Uniform f32* %103 = OpAccessChain %13 %15 %17 
                                       f32 %104 = OpLoad %103 
                                       f32 %105 = OpFAdd %102 %104 
                              Private f32* %106 = OpAccessChain %9 %23 
                                                    OpStore %106 %105 
                              Private f32* %107 = OpAccessChain %9 %23 
                                       f32 %108 = OpLoad %107 
                                       f32 %109 = OpExtInst %1 13 %108 
                              Private f32* %110 = OpAccessChain %9 %23 
                                                    OpStore %110 %109 
                              Private f32* %114 = OpAccessChain %9 %23 
                                       f32 %115 = OpLoad %114 
                                      bool %117 = OpFOrdGreaterThanEqual %115 %116 
                                                    OpStore %113 %117 
                                      bool %118 = OpLoad %113 
                                       f32 %121 = OpSelect %118 %119 %120 
                              Private f32* %122 = OpAccessChain %9 %23 
                                                    OpStore %122 %121 
                                Input f32* %126 = OpAccessChain vs_TEXCOORD0 %17 
                                       f32 %127 = OpLoad %126 
                                       f32 %129 = OpFMul %127 %128 
                              Uniform f32* %130 = OpAccessChain %13 %15 %17 
                                       f32 %131 = OpLoad %130 
                                       f32 %132 = OpFAdd %129 %131 
                                                    OpStore %123 %132 
                                       f32 %133 = OpLoad %123 
                                       f32 %134 = OpExtInst %1 13 %133 
                                                    OpStore %123 %134 
                              Private f32* %135 = OpAccessChain %9 %23 
                                       f32 %136 = OpLoad %135 
                                       f32 %137 = OpLoad %123 
                                       f32 %138 = OpFMul %136 %137 
                              Private f32* %139 = OpAccessChain %9 %23 
                                                    OpStore %139 %138 
                                     f32_4 %141 = OpLoad %9 
                                     f32_3 %142 = OpVectorShuffle %141 %141 0 0 0 
                              Uniform f32* %144 = OpAccessChain %13 %143 
                                       f32 %145 = OpLoad %144 
                              Uniform f32* %146 = OpAccessChain %13 %143 
                                       f32 %147 = OpLoad %146 
                              Uniform f32* %148 = OpAccessChain %13 %143 
                                       f32 %149 = OpLoad %148 
                                     f32_3 %150 = OpCompositeConstruct %145 %147 %149 
                                       f32 %151 = OpCompositeExtract %150 0 
                                       f32 %152 = OpCompositeExtract %150 1 
                                       f32 %153 = OpCompositeExtract %150 2 
                                     f32_3 %154 = OpCompositeConstruct %151 %152 %153 
                                     f32_3 %155 = OpFMul %142 %154 
                                     f32_4 %156 = OpLoad vs_TEXCOORD0 
                                     f32_3 %157 = OpVectorShuffle %156 %156 2 0 3 
                                     f32_3 %158 = OpFAdd %155 %157 
                                     f32_4 %159 = OpLoad %9 
                                     f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                                    OpStore %9 %160 
                              Private f32* %162 = OpAccessChain %30 %23 
                                       f32 %163 = OpLoad %162 
                              Uniform f32* %165 = OpAccessChain %13 %164 %23 
                                       f32 %166 = OpLoad %165 
                                       f32 %167 = OpFMul %163 %166 
                              Private f32* %168 = OpAccessChain %9 %17 
                                       f32 %169 = OpLoad %168 
                                       f32 %170 = OpFAdd %167 %169 
                              Private f32* %171 = OpAccessChain %161 %23 
                                                    OpStore %171 %170 
                              Private f32* %172 = OpAccessChain %30 %23 
                                       f32 %173 = OpLoad %172 
                                       f32 %174 = OpFNegate %173 
                              Uniform f32* %175 = OpAccessChain %13 %164 %17 
                                       f32 %176 = OpLoad %175 
                                       f32 %177 = OpFMul %174 %176 
                              Private f32* %179 = OpAccessChain %9 %178 
                                       f32 %180 = OpLoad %179 
                                       f32 %181 = OpFAdd %177 %180 
                              Private f32* %182 = OpAccessChain %161 %178 
                                                    OpStore %182 %181 
                                     f32_4 %183 = OpLoad vs_TEXCOORD0 
                                     f32_2 %184 = OpVectorShuffle %183 %183 1 1 
                                     f32_4 %185 = OpLoad %161 
                                     f32_4 %186 = OpVectorShuffle %185 %184 0 4 2 5 
                                                    OpStore %161 %186 
                       read_only Texture2D %191 = OpLoad %190 
                                   sampler %195 = OpLoad %194 
                read_only Texture2DSampled %197 = OpSampledImage %191 %195 
                                     f32_4 %198 = OpLoad %161 
                                     f32_2 %199 = OpVectorShuffle %198 %198 0 1 
                                     f32_4 %200 = OpImageSampleImplicitLod %197 %199 
                                       f32 %201 = OpCompositeExtract %200 1 
                              Private f32* %202 = OpAccessChain %187 %17 
                                                    OpStore %202 %201 
                       read_only Texture2D %203 = OpLoad %190 
                                   sampler %204 = OpLoad %194 
                read_only Texture2DSampled %205 = OpSampledImage %203 %204 
                                     f32_4 %206 = OpLoad %161 
                                     f32_2 %207 = OpVectorShuffle %206 %206 2 3 
                                     f32_4 %208 = OpImageSampleImplicitLod %205 %207 
                                       f32 %209 = OpCompositeExtract %208 2 
                              Private f32* %210 = OpAccessChain %187 %178 
                                                    OpStore %210 %209 
                                Input f32* %211 = OpAccessChain vs_TEXCOORD0 %17 
                                       f32 %212 = OpLoad %211 
                              Private f32* %213 = OpAccessChain %9 %17 
                                                    OpStore %213 %212 
                       read_only Texture2D %214 = OpLoad %190 
                                   sampler %215 = OpLoad %194 
                read_only Texture2DSampled %216 = OpSampledImage %214 %215 
                                     f32_4 %217 = OpLoad %9 
                                     f32_2 %218 = OpVectorShuffle %217 %217 0 1 
                                     f32_4 %219 = OpImageSampleImplicitLod %216 %218 
                                       f32 %220 = OpCompositeExtract %219 0 
                              Private f32* %221 = OpAccessChain %187 %23 
                                                    OpStore %221 %220 
                              Private f32* %222 = OpAccessChain %187 %98 
                                                    OpStore %222 %119 
                                     f32_4 %225 = OpLoad %187 
                                                    OpStore %224 %225 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "FRAME" "PIXEL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 126
; Schema: 0
                                                   OpCapability Shader 
                                            %1 = OpExtInstImport "GLSL.std.450" 
                                                   OpMemoryModel Logical GLSL450 
                                                   OpEntryPoint Vertex %4 "main" %11 %79 %83 %86 %118 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                   OpDecorate %11 RelaxedPrecision 
                                                   OpDecorate %11 Location 11 
                                                   OpDecorate %12 RelaxedPrecision 
                                                   OpDecorate %13 RelaxedPrecision 
                                                   OpDecorate %16 ArrayStride 16 
                                                   OpDecorate %17 ArrayStride 17 
                                                   OpMemberDecorate %18 0 Offset 18 
                                                   OpMemberDecorate %18 1 Offset 18 
                                                   OpMemberDecorate %18 2 RelaxedPrecision 
                                                   OpMemberDecorate %18 2 Offset 18 
                                                   OpDecorate %18 Block 
                                                   OpDecorate %20 DescriptorSet 20 
                                                   OpDecorate %20 Binding 20 
                                                   OpDecorate %30 RelaxedPrecision 
                                                   OpDecorate %31 RelaxedPrecision 
                                                   OpDecorate %38 RelaxedPrecision 
                                                   OpDecorate %39 RelaxedPrecision 
                                                   OpMemberDecorate %77 0 BuiltIn 77 
                                                   OpMemberDecorate %77 1 BuiltIn 77 
                                                   OpMemberDecorate %77 2 BuiltIn 77 
                                                   OpDecorate %77 Block 
                                                   OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD0 Location 83 
                                                   OpDecorate %86 RelaxedPrecision 
                                                   OpDecorate %86 Location 86 
                                                   OpDecorate %90 RelaxedPrecision 
                                                   OpDecorate %93 RelaxedPrecision 
                                                   OpDecorate %94 RelaxedPrecision 
                                                   OpDecorate %99 RelaxedPrecision 
                                                   OpDecorate %101 RelaxedPrecision 
                                                   OpDecorate %102 RelaxedPrecision 
                                                   OpDecorate %103 RelaxedPrecision 
                                                   OpDecorate %106 RelaxedPrecision 
                                                   OpDecorate %109 RelaxedPrecision 
                                                   OpDecorate %110 RelaxedPrecision 
                                                   OpDecorate %111 RelaxedPrecision 
                                                   OpDecorate %117 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD1 Location 118 
                                                   OpDecorate %119 RelaxedPrecision 
                                                   OpDecorate %120 RelaxedPrecision 
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
                                           %18 = OpTypeStruct %16 %17 %6 
                                           %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32;}* %20 = OpVariable Uniform 
                                           %21 = OpTypeInt 32 1 
                                       i32 %22 = OpConstant 0 
                                       i32 %23 = OpConstant 1 
                                           %24 = OpTypePointer Uniform %7 
                                       i32 %35 = OpConstant 2 
                                       i32 %44 = OpConstant 3 
                            Private f32_4* %48 = OpVariable Private 
                                       u32 %75 = OpConstant 1 
                                           %76 = OpTypeArray %6 %75 
                                           %77 = OpTypeStruct %7 %6 %76 
                                           %78 = OpTypePointer Output %77 
      Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                           %81 = OpTypePointer Output %7 
                    Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                           %84 = OpTypeVector %6 2 
                                           %85 = OpTypePointer Input %84 
                              Input f32_2* %86 = OpVariable Input 
                                       u32 %87 = OpConstant 0 
                                           %88 = OpTypePointer Input %6 
                                           %91 = OpTypePointer Uniform %6 
                                       u32 %95 = OpConstant 2 
                                           %96 = OpTypePointer Output %6 
                                      u32 %104 = OpConstant 3 
                           Private f32_4* %109 = OpVariable Private 
                                      f32 %112 = OpConstant 3.674022E-40 
                                      f32 %113 = OpConstant 3.674022E-40 
                                      f32 %114 = OpConstant 3.674022E-40 
                                      f32 %115 = OpConstant 3.674022E-40 
                                    f32_4 %116 = OpConstantComposite %112 %113 %114 %115 
                    Output f32_4* vs_TEXCOORD1 = OpVariable Output 
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
                            Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                     f32_4 %69 = OpLoad %68 
                                     f32_4 %70 = OpLoad %9 
                                     f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                     f32_4 %72 = OpFMul %69 %71 
                                     f32_4 %73 = OpLoad %48 
                                     f32_4 %74 = OpFAdd %72 %73 
                                                   OpStore %9 %74 
                                     f32_4 %80 = OpLoad %9 
                             Output f32_4* %82 = OpAccessChain %79 %22 
                                                   OpStore %82 %80 
                                Input f32* %89 = OpAccessChain %86 %87 
                                       f32 %90 = OpLoad %89 
                              Uniform f32* %92 = OpAccessChain %20 %35 
                                       f32 %93 = OpLoad %92 
                                       f32 %94 = OpFAdd %90 %93 
                               Output f32* %97 = OpAccessChain vs_TEXCOORD0 %95 
                                                   OpStore %97 %94 
                                Input f32* %98 = OpAccessChain %86 %87 
                                       f32 %99 = OpLoad %98 
                             Uniform f32* %100 = OpAccessChain %20 %35 
                                      f32 %101 = OpLoad %100 
                                      f32 %102 = OpFNegate %101 
                                      f32 %103 = OpFAdd %99 %102 
                              Output f32* %105 = OpAccessChain vs_TEXCOORD0 %104 
                                                   OpStore %105 %103 
                                    f32_2 %106 = OpLoad %86 
                                    f32_4 %107 = OpLoad vs_TEXCOORD0 
                                    f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                   OpStore vs_TEXCOORD0 %108 
                                    f32_2 %110 = OpLoad %86 
                                    f32_4 %111 = OpVectorShuffle %110 %110 0 1 0 1 
                                    f32_4 %117 = OpFMul %111 %116 
                                                   OpStore %109 %117 
                                    f32_4 %119 = OpLoad %109 
                                    f32_4 %120 = OpExtInst %1 8 %119 
                                                   OpStore vs_TEXCOORD1 %120 
                              Output f32* %121 = OpAccessChain %79 %22 %75 
                                      f32 %122 = OpLoad %121 
                                      f32 %123 = OpFNegate %122 
                              Output f32* %124 = OpAccessChain %79 %22 %75 
                                                   OpStore %124 %123 
                                                   OpReturn
                                                   OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 227
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %32 %124 %224 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                    OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                    OpMemberDecorate %11 0 Offset 11 
                                                    OpMemberDecorate %11 1 Offset 11 
                                                    OpMemberDecorate %11 2 RelaxedPrecision 
                                                    OpMemberDecorate %11 2 Offset 11 
                                                    OpMemberDecorate %11 3 RelaxedPrecision 
                                                    OpMemberDecorate %11 3 Offset 11 
                                                    OpDecorate %11 Block 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD1 Location 32 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD0 Location 124 
                                                    OpDecorate %127 RelaxedPrecision 
                                                    OpDecorate %129 RelaxedPrecision 
                                                    OpDecorate %145 RelaxedPrecision 
                                                    OpDecorate %147 RelaxedPrecision 
                                                    OpDecorate %149 RelaxedPrecision 
                                                    OpDecorate %156 RelaxedPrecision 
                                                    OpDecorate %157 RelaxedPrecision 
                                                    OpDecorate %161 RelaxedPrecision 
                                                    OpDecorate %163 RelaxedPrecision 
                                                    OpDecorate %166 RelaxedPrecision 
                                                    OpDecorate %167 RelaxedPrecision 
                                                    OpDecorate %173 RelaxedPrecision 
                                                    OpDecorate %174 RelaxedPrecision 
                                                    OpDecorate %176 RelaxedPrecision 
                                                    OpDecorate %177 RelaxedPrecision 
                                                    OpDecorate %183 RelaxedPrecision 
                                                    OpDecorate %184 RelaxedPrecision 
                                                    OpDecorate %190 RelaxedPrecision 
                                                    OpDecorate %190 DescriptorSet 190 
                                                    OpDecorate %190 Binding 190 
                                                    OpDecorate %191 RelaxedPrecision 
                                                    OpDecorate %194 RelaxedPrecision 
                                                    OpDecorate %194 DescriptorSet 194 
                                                    OpDecorate %194 Binding 194 
                                                    OpDecorate %195 RelaxedPrecision 
                                                    OpDecorate %198 RelaxedPrecision 
                                                    OpDecorate %199 RelaxedPrecision 
                                                    OpDecorate %200 RelaxedPrecision 
                                                    OpDecorate %203 RelaxedPrecision 
                                                    OpDecorate %204 RelaxedPrecision 
                                                    OpDecorate %206 RelaxedPrecision 
                                                    OpDecorate %207 RelaxedPrecision 
                                                    OpDecorate %208 RelaxedPrecision 
                                                    OpDecorate %212 RelaxedPrecision 
                                                    OpDecorate %214 RelaxedPrecision 
                                                    OpDecorate %215 RelaxedPrecision 
                                                    OpDecorate %224 RelaxedPrecision 
                                                    OpDecorate %224 Location 224 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 2 
                                            %11 = OpTypeStruct %7 %7 %6 %10 
                                            %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32_4; f32; f32_2;}* %13 = OpVariable Uniform 
                                            %14 = OpTypeInt 32 1 
                                        i32 %15 = OpConstant 0 
                                            %16 = OpTypeInt 32 0 
                                        u32 %17 = OpConstant 1 
                                            %18 = OpTypePointer Uniform %6 
                                        f32 %21 = OpConstant 3.674022E-40 
                                        u32 %23 = OpConstant 0 
                                            %24 = OpTypePointer Private %6 
                             Private f32_4* %30 = OpVariable Private 
                                            %31 = OpTypePointer Input %7 
                      Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                        f32 %41 = OpConstant 3.674022E-40 
                                        f32 %42 = OpConstant 3.674022E-40 
                                      f32_2 %43 = OpConstantComposite %41 %42 
                                        f32 %57 = OpConstant 3.674022E-40 
                                      f32_2 %58 = OpConstantComposite %57 %57 
                               Private f32* %86 = OpVariable Private 
                                        i32 %97 = OpConstant 1 
                                        u32 %98 = OpConstant 3 
                                       f32 %101 = OpConstant 3.674022E-40 
                                           %111 = OpTypeBool 
                                           %112 = OpTypePointer Private %111 
                             Private bool* %113 = OpVariable Private 
                                       f32 %116 = OpConstant 3.674022E-40 
                                       f32 %119 = OpConstant 3.674022E-40 
                                       f32 %120 = OpConstant 3.674022E-40 
                              Private f32* %123 = OpVariable Private 
                      Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                           %125 = OpTypePointer Input %6 
                                       f32 %128 = OpConstant 3.674022E-40 
                                           %140 = OpTypeVector %6 3 
                                       i32 %143 = OpConstant 2 
                            Private f32_4* %161 = OpVariable Private 
                                       i32 %164 = OpConstant 3 
                                       u32 %178 = OpConstant 2 
                            Private f32_4* %187 = OpVariable Private 
                                           %188 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                           %189 = OpTypePointer UniformConstant %188 
      UniformConstant read_only Texture2D* %190 = OpVariable UniformConstant 
                                           %192 = OpTypeSampler 
                                           %193 = OpTypePointer UniformConstant %192 
                  UniformConstant sampler* %194 = OpVariable UniformConstant 
                                           %196 = OpTypeSampledImage %188 
                                           %223 = OpTypePointer Output %7 
                             Output f32_4* %224 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                               Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                        f32 %20 = OpLoad %19 
                                        f32 %22 = OpFMul %20 %21 
                               Private f32* %25 = OpAccessChain %9 %23 
                                                    OpStore %25 %22 
                               Private f32* %26 = OpAccessChain %9 %23 
                                        f32 %27 = OpLoad %26 
                                        f32 %28 = OpExtInst %1 8 %27 
                               Private f32* %29 = OpAccessChain %9 %23 
                                                    OpStore %29 %28 
                                      f32_4 %33 = OpLoad vs_TEXCOORD1 
                                      f32_4 %34 = OpExtInst %1 8 %33 
                                                    OpStore %30 %34 
                                      f32_4 %35 = OpLoad %9 
                                      f32_4 %36 = OpVectorShuffle %35 %35 0 0 0 0 
                                      f32_4 %37 = OpLoad %30 
                                      f32_4 %38 = OpFMul %36 %37 
                                                    OpStore %9 %38 
                                      f32_4 %39 = OpLoad %9 
                                      f32_2 %40 = OpVectorShuffle %39 %39 0 1 
                                        f32 %44 = OpDot %40 %43 
                               Private f32* %45 = OpAccessChain %9 %23 
                                                    OpStore %45 %44 
                                      f32_4 %46 = OpLoad %9 
                                      f32_2 %47 = OpVectorShuffle %46 %46 2 3 
                                        f32 %48 = OpDot %47 %43 
                               Private f32* %49 = OpAccessChain %9 %17 
                                                    OpStore %49 %48 
                                      f32_4 %50 = OpLoad %9 
                                      f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                      f32_2 %52 = OpExtInst %1 13 %51 
                                      f32_4 %53 = OpLoad %9 
                                      f32_4 %54 = OpVectorShuffle %53 %52 4 5 2 3 
                                                    OpStore %9 %54 
                                      f32_4 %55 = OpLoad %9 
                                      f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                                      f32_2 %59 = OpFMul %56 %58 
                                      f32_4 %60 = OpLoad %9 
                                      f32_4 %61 = OpVectorShuffle %60 %59 4 5 2 3 
                                                    OpStore %9 %61 
                                      f32_4 %62 = OpLoad %9 
                                      f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                                      f32_2 %64 = OpExtInst %1 10 %63 
                                      f32_4 %65 = OpLoad %9 
                                      f32_4 %66 = OpVectorShuffle %65 %64 4 5 2 3 
                                                    OpStore %9 %66 
                                      f32_4 %67 = OpLoad %9 
                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                      f32_4 %69 = OpLoad %9 
                                      f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                      f32_2 %71 = OpFMul %68 %70 
                                      f32_4 %72 = OpLoad %30 
                                      f32_4 %73 = OpVectorShuffle %72 %71 4 5 2 3 
                                                    OpStore %30 %73 
                               Private f32* %74 = OpAccessChain %30 %23 
                                        f32 %75 = OpLoad %74 
                               Private f32* %76 = OpAccessChain %30 %23 
                                        f32 %77 = OpLoad %76 
                                        f32 %78 = OpFMul %75 %77 
                               Private f32* %79 = OpAccessChain %30 %23 
                                                    OpStore %79 %78 
                               Private f32* %80 = OpAccessChain %30 %23 
                                        f32 %81 = OpLoad %80 
                               Private f32* %82 = OpAccessChain %30 %23 
                                        f32 %83 = OpLoad %82 
                                        f32 %84 = OpFMul %81 %83 
                               Private f32* %85 = OpAccessChain %30 %23 
                                                    OpStore %85 %84 
                               Private f32* %87 = OpAccessChain %9 %17 
                                        f32 %88 = OpLoad %87 
                               Private f32* %89 = OpAccessChain %30 %17 
                                        f32 %90 = OpLoad %89 
                                        f32 %91 = OpFMul %88 %90 
                                                    OpStore %86 %91 
                                        f32 %92 = OpLoad %86 
                               Private f32* %93 = OpAccessChain %30 %23 
                                        f32 %94 = OpLoad %93 
                                        f32 %95 = OpFMul %92 %94 
                               Private f32* %96 = OpAccessChain %30 %23 
                                                    OpStore %96 %95 
                               Uniform f32* %99 = OpAccessChain %13 %97 %98 
                                       f32 %100 = OpLoad %99 
                                       f32 %102 = OpFMul %100 %101 
                              Uniform f32* %103 = OpAccessChain %13 %15 %17 
                                       f32 %104 = OpLoad %103 
                                       f32 %105 = OpFAdd %102 %104 
                              Private f32* %106 = OpAccessChain %9 %23 
                                                    OpStore %106 %105 
                              Private f32* %107 = OpAccessChain %9 %23 
                                       f32 %108 = OpLoad %107 
                                       f32 %109 = OpExtInst %1 13 %108 
                              Private f32* %110 = OpAccessChain %9 %23 
                                                    OpStore %110 %109 
                              Private f32* %114 = OpAccessChain %9 %23 
                                       f32 %115 = OpLoad %114 
                                      bool %117 = OpFOrdGreaterThanEqual %115 %116 
                                                    OpStore %113 %117 
                                      bool %118 = OpLoad %113 
                                       f32 %121 = OpSelect %118 %119 %120 
                              Private f32* %122 = OpAccessChain %9 %23 
                                                    OpStore %122 %121 
                                Input f32* %126 = OpAccessChain vs_TEXCOORD0 %17 
                                       f32 %127 = OpLoad %126 
                                       f32 %129 = OpFMul %127 %128 
                              Uniform f32* %130 = OpAccessChain %13 %15 %17 
                                       f32 %131 = OpLoad %130 
                                       f32 %132 = OpFAdd %129 %131 
                                                    OpStore %123 %132 
                                       f32 %133 = OpLoad %123 
                                       f32 %134 = OpExtInst %1 13 %133 
                                                    OpStore %123 %134 
                              Private f32* %135 = OpAccessChain %9 %23 
                                       f32 %136 = OpLoad %135 
                                       f32 %137 = OpLoad %123 
                                       f32 %138 = OpFMul %136 %137 
                              Private f32* %139 = OpAccessChain %9 %23 
                                                    OpStore %139 %138 
                                     f32_4 %141 = OpLoad %9 
                                     f32_3 %142 = OpVectorShuffle %141 %141 0 0 0 
                              Uniform f32* %144 = OpAccessChain %13 %143 
                                       f32 %145 = OpLoad %144 
                              Uniform f32* %146 = OpAccessChain %13 %143 
                                       f32 %147 = OpLoad %146 
                              Uniform f32* %148 = OpAccessChain %13 %143 
                                       f32 %149 = OpLoad %148 
                                     f32_3 %150 = OpCompositeConstruct %145 %147 %149 
                                       f32 %151 = OpCompositeExtract %150 0 
                                       f32 %152 = OpCompositeExtract %150 1 
                                       f32 %153 = OpCompositeExtract %150 2 
                                     f32_3 %154 = OpCompositeConstruct %151 %152 %153 
                                     f32_3 %155 = OpFMul %142 %154 
                                     f32_4 %156 = OpLoad vs_TEXCOORD0 
                                     f32_3 %157 = OpVectorShuffle %156 %156 2 0 3 
                                     f32_3 %158 = OpFAdd %155 %157 
                                     f32_4 %159 = OpLoad %9 
                                     f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                                    OpStore %9 %160 
                              Private f32* %162 = OpAccessChain %30 %23 
                                       f32 %163 = OpLoad %162 
                              Uniform f32* %165 = OpAccessChain %13 %164 %23 
                                       f32 %166 = OpLoad %165 
                                       f32 %167 = OpFMul %163 %166 
                              Private f32* %168 = OpAccessChain %9 %17 
                                       f32 %169 = OpLoad %168 
                                       f32 %170 = OpFAdd %167 %169 
                              Private f32* %171 = OpAccessChain %161 %23 
                                                    OpStore %171 %170 
                              Private f32* %172 = OpAccessChain %30 %23 
                                       f32 %173 = OpLoad %172 
                                       f32 %174 = OpFNegate %173 
                              Uniform f32* %175 = OpAccessChain %13 %164 %17 
                                       f32 %176 = OpLoad %175 
                                       f32 %177 = OpFMul %174 %176 
                              Private f32* %179 = OpAccessChain %9 %178 
                                       f32 %180 = OpLoad %179 
                                       f32 %181 = OpFAdd %177 %180 
                              Private f32* %182 = OpAccessChain %161 %178 
                                                    OpStore %182 %181 
                                     f32_4 %183 = OpLoad vs_TEXCOORD0 
                                     f32_2 %184 = OpVectorShuffle %183 %183 1 1 
                                     f32_4 %185 = OpLoad %161 
                                     f32_4 %186 = OpVectorShuffle %185 %184 0 4 2 5 
                                                    OpStore %161 %186 
                       read_only Texture2D %191 = OpLoad %190 
                                   sampler %195 = OpLoad %194 
                read_only Texture2DSampled %197 = OpSampledImage %191 %195 
                                     f32_4 %198 = OpLoad %161 
                                     f32_2 %199 = OpVectorShuffle %198 %198 0 1 
                                     f32_4 %200 = OpImageSampleImplicitLod %197 %199 
                                       f32 %201 = OpCompositeExtract %200 1 
                              Private f32* %202 = OpAccessChain %187 %17 
                                                    OpStore %202 %201 
                       read_only Texture2D %203 = OpLoad %190 
                                   sampler %204 = OpLoad %194 
                read_only Texture2DSampled %205 = OpSampledImage %203 %204 
                                     f32_4 %206 = OpLoad %161 
                                     f32_2 %207 = OpVectorShuffle %206 %206 2 3 
                                     f32_4 %208 = OpImageSampleImplicitLod %205 %207 
                                       f32 %209 = OpCompositeExtract %208 2 
                              Private f32* %210 = OpAccessChain %187 %178 
                                                    OpStore %210 %209 
                                Input f32* %211 = OpAccessChain vs_TEXCOORD0 %17 
                                       f32 %212 = OpLoad %211 
                              Private f32* %213 = OpAccessChain %9 %17 
                                                    OpStore %213 %212 
                       read_only Texture2D %214 = OpLoad %190 
                                   sampler %215 = OpLoad %194 
                read_only Texture2DSampled %216 = OpSampledImage %214 %215 
                                     f32_4 %217 = OpLoad %9 
                                     f32_2 %218 = OpVectorShuffle %217 %217 0 1 
                                     f32_4 %219 = OpImageSampleImplicitLod %216 %218 
                                       f32 %220 = OpCompositeExtract %219 0 
                              Private f32* %221 = OpAccessChain %187 %23 
                                                    OpStore %221 %220 
                              Private f32* %222 = OpAccessChain %187 %98 
                                                    OpStore %222 %119 
                                     f32_4 %225 = OpLoad %187 
                                                    OpStore %224 %225 
                                                    OpReturn
                                                    OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "FRAME" "PIXEL" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 126
; Schema: 0
                                                   OpCapability Shader 
                                            %1 = OpExtInstImport "GLSL.std.450" 
                                                   OpMemoryModel Logical GLSL450 
                                                   OpEntryPoint Vertex %4 "main" %11 %79 %83 %86 %118 
                                                   OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                   OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                   OpDecorate %11 RelaxedPrecision 
                                                   OpDecorate %11 Location 11 
                                                   OpDecorate %12 RelaxedPrecision 
                                                   OpDecorate %13 RelaxedPrecision 
                                                   OpDecorate %16 ArrayStride 16 
                                                   OpDecorate %17 ArrayStride 17 
                                                   OpMemberDecorate %18 0 Offset 18 
                                                   OpMemberDecorate %18 1 Offset 18 
                                                   OpMemberDecorate %18 2 RelaxedPrecision 
                                                   OpMemberDecorate %18 2 Offset 18 
                                                   OpDecorate %18 Block 
                                                   OpDecorate %20 DescriptorSet 20 
                                                   OpDecorate %20 Binding 20 
                                                   OpDecorate %30 RelaxedPrecision 
                                                   OpDecorate %31 RelaxedPrecision 
                                                   OpDecorate %38 RelaxedPrecision 
                                                   OpDecorate %39 RelaxedPrecision 
                                                   OpMemberDecorate %77 0 BuiltIn 77 
                                                   OpMemberDecorate %77 1 BuiltIn 77 
                                                   OpMemberDecorate %77 2 BuiltIn 77 
                                                   OpDecorate %77 Block 
                                                   OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD0 Location 83 
                                                   OpDecorate %86 RelaxedPrecision 
                                                   OpDecorate %86 Location 86 
                                                   OpDecorate %90 RelaxedPrecision 
                                                   OpDecorate %93 RelaxedPrecision 
                                                   OpDecorate %94 RelaxedPrecision 
                                                   OpDecorate %99 RelaxedPrecision 
                                                   OpDecorate %101 RelaxedPrecision 
                                                   OpDecorate %102 RelaxedPrecision 
                                                   OpDecorate %103 RelaxedPrecision 
                                                   OpDecorate %106 RelaxedPrecision 
                                                   OpDecorate %109 RelaxedPrecision 
                                                   OpDecorate %110 RelaxedPrecision 
                                                   OpDecorate %111 RelaxedPrecision 
                                                   OpDecorate %117 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                   OpDecorate vs_TEXCOORD1 Location 118 
                                                   OpDecorate %119 RelaxedPrecision 
                                                   OpDecorate %120 RelaxedPrecision 
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
                                           %18 = OpTypeStruct %16 %17 %6 
                                           %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32;}* %20 = OpVariable Uniform 
                                           %21 = OpTypeInt 32 1 
                                       i32 %22 = OpConstant 0 
                                       i32 %23 = OpConstant 1 
                                           %24 = OpTypePointer Uniform %7 
                                       i32 %35 = OpConstant 2 
                                       i32 %44 = OpConstant 3 
                            Private f32_4* %48 = OpVariable Private 
                                       u32 %75 = OpConstant 1 
                                           %76 = OpTypeArray %6 %75 
                                           %77 = OpTypeStruct %7 %6 %76 
                                           %78 = OpTypePointer Output %77 
      Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                           %81 = OpTypePointer Output %7 
                    Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                           %84 = OpTypeVector %6 2 
                                           %85 = OpTypePointer Input %84 
                              Input f32_2* %86 = OpVariable Input 
                                       u32 %87 = OpConstant 0 
                                           %88 = OpTypePointer Input %6 
                                           %91 = OpTypePointer Uniform %6 
                                       u32 %95 = OpConstant 2 
                                           %96 = OpTypePointer Output %6 
                                      u32 %104 = OpConstant 3 
                           Private f32_4* %109 = OpVariable Private 
                                      f32 %112 = OpConstant 3.674022E-40 
                                      f32 %113 = OpConstant 3.674022E-40 
                                      f32 %114 = OpConstant 3.674022E-40 
                                      f32 %115 = OpConstant 3.674022E-40 
                                    f32_4 %116 = OpConstantComposite %112 %113 %114 %115 
                    Output f32_4* vs_TEXCOORD1 = OpVariable Output 
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
                            Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                     f32_4 %69 = OpLoad %68 
                                     f32_4 %70 = OpLoad %9 
                                     f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                     f32_4 %72 = OpFMul %69 %71 
                                     f32_4 %73 = OpLoad %48 
                                     f32_4 %74 = OpFAdd %72 %73 
                                                   OpStore %9 %74 
                                     f32_4 %80 = OpLoad %9 
                             Output f32_4* %82 = OpAccessChain %79 %22 
                                                   OpStore %82 %80 
                                Input f32* %89 = OpAccessChain %86 %87 
                                       f32 %90 = OpLoad %89 
                              Uniform f32* %92 = OpAccessChain %20 %35 
                                       f32 %93 = OpLoad %92 
                                       f32 %94 = OpFAdd %90 %93 
                               Output f32* %97 = OpAccessChain vs_TEXCOORD0 %95 
                                                   OpStore %97 %94 
                                Input f32* %98 = OpAccessChain %86 %87 
                                       f32 %99 = OpLoad %98 
                             Uniform f32* %100 = OpAccessChain %20 %35 
                                      f32 %101 = OpLoad %100 
                                      f32 %102 = OpFNegate %101 
                                      f32 %103 = OpFAdd %99 %102 
                              Output f32* %105 = OpAccessChain vs_TEXCOORD0 %104 
                                                   OpStore %105 %103 
                                    f32_2 %106 = OpLoad %86 
                                    f32_4 %107 = OpLoad vs_TEXCOORD0 
                                    f32_4 %108 = OpVectorShuffle %107 %106 4 5 2 3 
                                                   OpStore vs_TEXCOORD0 %108 
                                    f32_2 %110 = OpLoad %86 
                                    f32_4 %111 = OpVectorShuffle %110 %110 0 1 0 1 
                                    f32_4 %117 = OpFMul %111 %116 
                                                   OpStore %109 %117 
                                    f32_4 %119 = OpLoad %109 
                                    f32_4 %120 = OpExtInst %1 8 %119 
                                                   OpStore vs_TEXCOORD1 %120 
                              Output f32* %121 = OpAccessChain %79 %22 %75 
                                      f32 %122 = OpLoad %121 
                                      f32 %123 = OpFNegate %122 
                              Output f32* %124 = OpAccessChain %79 %22 %75 
                                                   OpStore %124 %123 
                                                   OpReturn
                                                   OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 227
; Schema: 0
                                                    OpCapability Shader 
                                             %1 = OpExtInstImport "GLSL.std.450" 
                                                    OpMemoryModel Logical GLSL450 
                                                    OpEntryPoint Fragment %4 "main" %32 %124 %224 
                                                    OpExecutionMode %4 OriginUpperLeft 
                                                    OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                    OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                    OpMemberDecorate %11 0 Offset 11 
                                                    OpMemberDecorate %11 1 Offset 11 
                                                    OpMemberDecorate %11 2 RelaxedPrecision 
                                                    OpMemberDecorate %11 2 Offset 11 
                                                    OpMemberDecorate %11 3 RelaxedPrecision 
                                                    OpMemberDecorate %11 3 Offset 11 
                                                    OpDecorate %11 Block 
                                                    OpDecorate %13 DescriptorSet 13 
                                                    OpDecorate %13 Binding 13 
                                                    OpDecorate %30 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD1 Location 32 
                                                    OpDecorate %33 RelaxedPrecision 
                                                    OpDecorate %34 RelaxedPrecision 
                                                    OpDecorate %37 RelaxedPrecision 
                                                    OpDecorate %75 RelaxedPrecision 
                                                    OpDecorate %77 RelaxedPrecision 
                                                    OpDecorate %78 RelaxedPrecision 
                                                    OpDecorate %81 RelaxedPrecision 
                                                    OpDecorate %83 RelaxedPrecision 
                                                    OpDecorate %84 RelaxedPrecision 
                                                    OpDecorate %86 RelaxedPrecision 
                                                    OpDecorate %90 RelaxedPrecision 
                                                    OpDecorate %92 RelaxedPrecision 
                                                    OpDecorate %94 RelaxedPrecision 
                                                    OpDecorate %95 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                    OpDecorate vs_TEXCOORD0 Location 124 
                                                    OpDecorate %127 RelaxedPrecision 
                                                    OpDecorate %129 RelaxedPrecision 
                                                    OpDecorate %145 RelaxedPrecision 
                                                    OpDecorate %147 RelaxedPrecision 
                                                    OpDecorate %149 RelaxedPrecision 
                                                    OpDecorate %156 RelaxedPrecision 
                                                    OpDecorate %157 RelaxedPrecision 
                                                    OpDecorate %161 RelaxedPrecision 
                                                    OpDecorate %163 RelaxedPrecision 
                                                    OpDecorate %166 RelaxedPrecision 
                                                    OpDecorate %167 RelaxedPrecision 
                                                    OpDecorate %173 RelaxedPrecision 
                                                    OpDecorate %174 RelaxedPrecision 
                                                    OpDecorate %176 RelaxedPrecision 
                                                    OpDecorate %177 RelaxedPrecision 
                                                    OpDecorate %183 RelaxedPrecision 
                                                    OpDecorate %184 RelaxedPrecision 
                                                    OpDecorate %190 RelaxedPrecision 
                                                    OpDecorate %190 DescriptorSet 190 
                                                    OpDecorate %190 Binding 190 
                                                    OpDecorate %191 RelaxedPrecision 
                                                    OpDecorate %194 RelaxedPrecision 
                                                    OpDecorate %194 DescriptorSet 194 
                                                    OpDecorate %194 Binding 194 
                                                    OpDecorate %195 RelaxedPrecision 
                                                    OpDecorate %198 RelaxedPrecision 
                                                    OpDecorate %199 RelaxedPrecision 
                                                    OpDecorate %200 RelaxedPrecision 
                                                    OpDecorate %203 RelaxedPrecision 
                                                    OpDecorate %204 RelaxedPrecision 
                                                    OpDecorate %206 RelaxedPrecision 
                                                    OpDecorate %207 RelaxedPrecision 
                                                    OpDecorate %208 RelaxedPrecision 
                                                    OpDecorate %212 RelaxedPrecision 
                                                    OpDecorate %214 RelaxedPrecision 
                                                    OpDecorate %215 RelaxedPrecision 
                                                    OpDecorate %224 RelaxedPrecision 
                                                    OpDecorate %224 Location 224 
                                             %2 = OpTypeVoid 
                                             %3 = OpTypeFunction %2 
                                             %6 = OpTypeFloat 32 
                                             %7 = OpTypeVector %6 4 
                                             %8 = OpTypePointer Private %7 
                              Private f32_4* %9 = OpVariable Private 
                                            %10 = OpTypeVector %6 2 
                                            %11 = OpTypeStruct %7 %7 %6 %10 
                                            %12 = OpTypePointer Uniform %11 
Uniform struct {f32_4; f32_4; f32; f32_2;}* %13 = OpVariable Uniform 
                                            %14 = OpTypeInt 32 1 
                                        i32 %15 = OpConstant 0 
                                            %16 = OpTypeInt 32 0 
                                        u32 %17 = OpConstant 1 
                                            %18 = OpTypePointer Uniform %6 
                                        f32 %21 = OpConstant 3.674022E-40 
                                        u32 %23 = OpConstant 0 
                                            %24 = OpTypePointer Private %6 
                             Private f32_4* %30 = OpVariable Private 
                                            %31 = OpTypePointer Input %7 
                      Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                        f32 %41 = OpConstant 3.674022E-40 
                                        f32 %42 = OpConstant 3.674022E-40 
                                      f32_2 %43 = OpConstantComposite %41 %42 
                                        f32 %57 = OpConstant 3.674022E-40 
                                      f32_2 %58 = OpConstantComposite %57 %57 
                               Private f32* %86 = OpVariable Private 
                                        i32 %97 = OpConstant 1 
                                        u32 %98 = OpConstant 3 
                                       f32 %101 = OpConstant 3.674022E-40 
                                           %111 = OpTypeBool 
                                           %112 = OpTypePointer Private %111 
                             Private bool* %113 = OpVariable Private 
                                       f32 %116 = OpConstant 3.674022E-40 
                                       f32 %119 = OpConstant 3.674022E-40 
                                       f32 %120 = OpConstant 3.674022E-40 
                              Private f32* %123 = OpVariable Private 
                      Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                           %125 = OpTypePointer Input %6 
                                       f32 %128 = OpConstant 3.674022E-40 
                                           %140 = OpTypeVector %6 3 
                                       i32 %143 = OpConstant 2 
                            Private f32_4* %161 = OpVariable Private 
                                       i32 %164 = OpConstant 3 
                                       u32 %178 = OpConstant 2 
                            Private f32_4* %187 = OpVariable Private 
                                           %188 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                           %189 = OpTypePointer UniformConstant %188 
      UniformConstant read_only Texture2D* %190 = OpVariable UniformConstant 
                                           %192 = OpTypeSampler 
                                           %193 = OpTypePointer UniformConstant %192 
                  UniformConstant sampler* %194 = OpVariable UniformConstant 
                                           %196 = OpTypeSampledImage %188 
                                           %223 = OpTypePointer Output %7 
                             Output f32_4* %224 = OpVariable Output 
                                        void %4 = OpFunction None %3 
                                             %5 = OpLabel 
                               Uniform f32* %19 = OpAccessChain %13 %15 %17 
                                        f32 %20 = OpLoad %19 
                                        f32 %22 = OpFMul %20 %21 
                               Private f32* %25 = OpAccessChain %9 %23 
                                                    OpStore %25 %22 
                               Private f32* %26 = OpAccessChain %9 %23 
                                        f32 %27 = OpLoad %26 
                                        f32 %28 = OpExtInst %1 8 %27 
                               Private f32* %29 = OpAccessChain %9 %23 
                                                    OpStore %29 %28 
                                      f32_4 %33 = OpLoad vs_TEXCOORD1 
                                      f32_4 %34 = OpExtInst %1 8 %33 
                                                    OpStore %30 %34 
                                      f32_4 %35 = OpLoad %9 
                                      f32_4 %36 = OpVectorShuffle %35 %35 0 0 0 0 
                                      f32_4 %37 = OpLoad %30 
                                      f32_4 %38 = OpFMul %36 %37 
                                                    OpStore %9 %38 
                                      f32_4 %39 = OpLoad %9 
                                      f32_2 %40 = OpVectorShuffle %39 %39 0 1 
                                        f32 %44 = OpDot %40 %43 
                               Private f32* %45 = OpAccessChain %9 %23 
                                                    OpStore %45 %44 
                                      f32_4 %46 = OpLoad %9 
                                      f32_2 %47 = OpVectorShuffle %46 %46 2 3 
                                        f32 %48 = OpDot %47 %43 
                               Private f32* %49 = OpAccessChain %9 %17 
                                                    OpStore %49 %48 
                                      f32_4 %50 = OpLoad %9 
                                      f32_2 %51 = OpVectorShuffle %50 %50 0 1 
                                      f32_2 %52 = OpExtInst %1 13 %51 
                                      f32_4 %53 = OpLoad %9 
                                      f32_4 %54 = OpVectorShuffle %53 %52 4 5 2 3 
                                                    OpStore %9 %54 
                                      f32_4 %55 = OpLoad %9 
                                      f32_2 %56 = OpVectorShuffle %55 %55 0 1 
                                      f32_2 %59 = OpFMul %56 %58 
                                      f32_4 %60 = OpLoad %9 
                                      f32_4 %61 = OpVectorShuffle %60 %59 4 5 2 3 
                                                    OpStore %9 %61 
                                      f32_4 %62 = OpLoad %9 
                                      f32_2 %63 = OpVectorShuffle %62 %62 0 1 
                                      f32_2 %64 = OpExtInst %1 10 %63 
                                      f32_4 %65 = OpLoad %9 
                                      f32_4 %66 = OpVectorShuffle %65 %64 4 5 2 3 
                                                    OpStore %9 %66 
                                      f32_4 %67 = OpLoad %9 
                                      f32_2 %68 = OpVectorShuffle %67 %67 0 1 
                                      f32_4 %69 = OpLoad %9 
                                      f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                      f32_2 %71 = OpFMul %68 %70 
                                      f32_4 %72 = OpLoad %30 
                                      f32_4 %73 = OpVectorShuffle %72 %71 4 5 2 3 
                                                    OpStore %30 %73 
                               Private f32* %74 = OpAccessChain %30 %23 
                                        f32 %75 = OpLoad %74 
                               Private f32* %76 = OpAccessChain %30 %23 
                                        f32 %77 = OpLoad %76 
                                        f32 %78 = OpFMul %75 %77 
                               Private f32* %79 = OpAccessChain %30 %23 
                                                    OpStore %79 %78 
                               Private f32* %80 = OpAccessChain %30 %23 
                                        f32 %81 = OpLoad %80 
                               Private f32* %82 = OpAccessChain %30 %23 
                                        f32 %83 = OpLoad %82 
                                        f32 %84 = OpFMul %81 %83 
                               Private f32* %85 = OpAccessChain %30 %23 
                                                    OpStore %85 %84 
                               Private f32* %87 = OpAccessChain %9 %17 
                                        f32 %88 = OpLoad %87 
                               Private f32* %89 = OpAccessChain %30 %17 
                                        f32 %90 = OpLoad %89 
                                        f32 %91 = OpFMul %88 %90 
                                                    OpStore %86 %91 
                                        f32 %92 = OpLoad %86 
                               Private f32* %93 = OpAccessChain %30 %23 
                                        f32 %94 = OpLoad %93 
                                        f32 %95 = OpFMul %92 %94 
                               Private f32* %96 = OpAccessChain %30 %23 
                                                    OpStore %96 %95 
                               Uniform f32* %99 = OpAccessChain %13 %97 %98 
                                       f32 %100 = OpLoad %99 
                                       f32 %102 = OpFMul %100 %101 
                              Uniform f32* %103 = OpAccessChain %13 %15 %17 
                                       f32 %104 = OpLoad %103 
                                       f32 %105 = OpFAdd %102 %104 
                              Private f32* %106 = OpAccessChain %9 %23 
                                                    OpStore %106 %105 
                              Private f32* %107 = OpAccessChain %9 %23 
                                       f32 %108 = OpLoad %107 
                                       f32 %109 = OpExtInst %1 13 %108 
                              Private f32* %110 = OpAccessChain %9 %23 
                                                    OpStore %110 %109 
                              Private f32* %114 = OpAccessChain %9 %23 
                                       f32 %115 = OpLoad %114 
                                      bool %117 = OpFOrdGreaterThanEqual %115 %116 
                                                    OpStore %113 %117 
                                      bool %118 = OpLoad %113 
                                       f32 %121 = OpSelect %118 %119 %120 
                              Private f32* %122 = OpAccessChain %9 %23 
                                                    OpStore %122 %121 
                                Input f32* %126 = OpAccessChain vs_TEXCOORD0 %17 
                                       f32 %127 = OpLoad %126 
                                       f32 %129 = OpFMul %127 %128 
                              Uniform f32* %130 = OpAccessChain %13 %15 %17 
                                       f32 %131 = OpLoad %130 
                                       f32 %132 = OpFAdd %129 %131 
                                                    OpStore %123 %132 
                                       f32 %133 = OpLoad %123 
                                       f32 %134 = OpExtInst %1 13 %133 
                                                    OpStore %123 %134 
                              Private f32* %135 = OpAccessChain %9 %23 
                                       f32 %136 = OpLoad %135 
                                       f32 %137 = OpLoad %123 
                                       f32 %138 = OpFMul %136 %137 
                              Private f32* %139 = OpAccessChain %9 %23 
                                                    OpStore %139 %138 
                                     f32_4 %141 = OpLoad %9 
                                     f32_3 %142 = OpVectorShuffle %141 %141 0 0 0 
                              Uniform f32* %144 = OpAccessChain %13 %143 
                                       f32 %145 = OpLoad %144 
                              Uniform f32* %146 = OpAccessChain %13 %143 
                                       f32 %147 = OpLoad %146 
                              Uniform f32* %148 = OpAccessChain %13 %143 
                                       f32 %149 = OpLoad %148 
                                     f32_3 %150 = OpCompositeConstruct %145 %147 %149 
                                       f32 %151 = OpCompositeExtract %150 0 
                                       f32 %152 = OpCompositeExtract %150 1 
                                       f32 %153 = OpCompositeExtract %150 2 
                                     f32_3 %154 = OpCompositeConstruct %151 %152 %153 
                                     f32_3 %155 = OpFMul %142 %154 
                                     f32_4 %156 = OpLoad vs_TEXCOORD0 
                                     f32_3 %157 = OpVectorShuffle %156 %156 2 0 3 
                                     f32_3 %158 = OpFAdd %155 %157 
                                     f32_4 %159 = OpLoad %9 
                                     f32_4 %160 = OpVectorShuffle %159 %158 4 5 6 3 
                                                    OpStore %9 %160 
                              Private f32* %162 = OpAccessChain %30 %23 
                                       f32 %163 = OpLoad %162 
                              Uniform f32* %165 = OpAccessChain %13 %164 %23 
                                       f32 %166 = OpLoad %165 
                                       f32 %167 = OpFMul %163 %166 
                              Private f32* %168 = OpAccessChain %9 %17 
                                       f32 %169 = OpLoad %168 
                                       f32 %170 = OpFAdd %167 %169 
                              Private f32* %171 = OpAccessChain %161 %23 
                                                    OpStore %171 %170 
                              Private f32* %172 = OpAccessChain %30 %23 
                                       f32 %173 = OpLoad %172 
                                       f32 %174 = OpFNegate %173 
                              Uniform f32* %175 = OpAccessChain %13 %164 %17 
                                       f32 %176 = OpLoad %175 
                                       f32 %177 = OpFMul %174 %176 
                              Private f32* %179 = OpAccessChain %9 %178 
                                       f32 %180 = OpLoad %179 
                                       f32 %181 = OpFAdd %177 %180 
                              Private f32* %182 = OpAccessChain %161 %178 
                                                    OpStore %182 %181 
                                     f32_4 %183 = OpLoad vs_TEXCOORD0 
                                     f32_2 %184 = OpVectorShuffle %183 %183 1 1 
                                     f32_4 %185 = OpLoad %161 
                                     f32_4 %186 = OpVectorShuffle %185 %184 0 4 2 5 
                                                    OpStore %161 %186 
                       read_only Texture2D %191 = OpLoad %190 
                                   sampler %195 = OpLoad %194 
                read_only Texture2DSampled %197 = OpSampledImage %191 %195 
                                     f32_4 %198 = OpLoad %161 
                                     f32_2 %199 = OpVectorShuffle %198 %198 0 1 
                                     f32_4 %200 = OpImageSampleImplicitLod %197 %199 
                                       f32 %201 = OpCompositeExtract %200 1 
                              Private f32* %202 = OpAccessChain %187 %17 
                                                    OpStore %202 %201 
                       read_only Texture2D %203 = OpLoad %190 
                                   sampler %204 = OpLoad %194 
                read_only Texture2DSampled %205 = OpSampledImage %203 %204 
                                     f32_4 %206 = OpLoad %161 
                                     f32_2 %207 = OpVectorShuffle %206 %206 2 3 
                                     f32_4 %208 = OpImageSampleImplicitLod %205 %207 
                                       f32 %209 = OpCompositeExtract %208 2 
                              Private f32* %210 = OpAccessChain %187 %178 
                                                    OpStore %210 %209 
                                Input f32* %211 = OpAccessChain vs_TEXCOORD0 %17 
                                       f32 %212 = OpLoad %211 
                              Private f32* %213 = OpAccessChain %9 %17 
                                                    OpStore %213 %212 
                       read_only Texture2D %214 = OpLoad %190 
                                   sampler %215 = OpLoad %194 
                read_only Texture2DSampled %216 = OpSampledImage %214 %215 
                                     f32_4 %217 = OpLoad %9 
                                     f32_2 %218 = OpVectorShuffle %217 %217 0 1 
                                     f32_4 %219 = OpImageSampleImplicitLod %216 %218 
                                       f32 %220 = OpCompositeExtract %219 0 
                              Private f32* %221 = OpAccessChain %187 %23 
                                                    OpStore %221 %220 
                              Private f32* %222 = OpAccessChain %187 %98 
                                                    OpStore %222 %119 
                                     f32_4 %225 = OpLoad %187 
                                                    OpStore %224 %225 
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
Local Keywords { "FRAME" "PIXEL" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "FRAME" "PIXEL" }
""
}
SubProgram "gles3 hw_tier02 " {
Local Keywords { "FRAME" "PIXEL" }
""
}
SubProgram "vulkan hw_tier00 " {
Local Keywords { "FRAME" "PIXEL" }
""
}
SubProgram "vulkan hw_tier01 " {
Local Keywords { "FRAME" "PIXEL" }
""
}
SubProgram "vulkan hw_tier02 " {
Local Keywords { "FRAME" "PIXEL" }
""
}
}
}
}
}