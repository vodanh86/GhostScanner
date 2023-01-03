//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-CombineDepthNormals" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 58289
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
uniform 	vec4 _CameraNormalsTexture_ST;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraNormalsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb3;
float u_xlat4;
void main()
{
    u_xlat16_0.xyz = texture(_CameraNormalsTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat4 = (-u_xlat0.z) + 1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat1.x = float(1.0) / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.x<0.999984622);
#else
    u_xlatb3 = u_xlat1.x<0.999984622;
#endif
    u_xlat1.xz = u_xlat1.xx * vec2(1.0, 255.0);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat0.z = (-u_xlat1.z) * 0.00392156886 + u_xlat1.x;
    u_xlat0.w = u_xlat1.z;
    u_xlat0 = (bool(u_xlatb3)) ? u_xlat0 : vec4(0.5, 0.5, 1.0, 1.0);
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
uniform 	vec4 _CameraNormalsTexture_ST;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraNormalsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb3;
float u_xlat4;
void main()
{
    u_xlat16_0.xyz = texture(_CameraNormalsTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat4 = (-u_xlat0.z) + 1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat1.x = float(1.0) / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.x<0.999984622);
#else
    u_xlatb3 = u_xlat1.x<0.999984622;
#endif
    u_xlat1.xz = u_xlat1.xx * vec2(1.0, 255.0);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat0.z = (-u_xlat1.z) * 0.00392156886 + u_xlat1.x;
    u_xlat0.w = u_xlat1.z;
    u_xlat0 = (bool(u_xlatb3)) ? u_xlat0 : vec4(0.5, 0.5, 1.0, 1.0);
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
uniform 	vec4 _CameraNormalsTexture_ST;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _CameraNormalsTexture_ST.xy + _CameraNormalsTexture_ST.zw;
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
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToCamera[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraNormalsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
bool u_xlatb3;
float u_xlat4;
void main()
{
    u_xlat16_0.xyz = texture(_CameraNormalsTexture, vs_TEXCOORD0.xy).xyz;
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_WorldToCamera[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_WorldToCamera[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToCamera[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat4 = (-u_xlat0.z) + 1.0;
    u_xlat0.xy = u_xlat0.xy / vec2(u_xlat4);
    u_xlat0.xy = u_xlat0.xy * vec2(0.281262308, 0.281262308) + vec2(0.5, 0.5);
    u_xlat1.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = _ZBufferParams.x * u_xlat1.x + _ZBufferParams.y;
    u_xlat1.x = float(1.0) / u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlat1.x<0.999984622);
#else
    u_xlatb3 = u_xlat1.x<0.999984622;
#endif
    u_xlat1.xz = u_xlat1.xx * vec2(1.0, 255.0);
    u_xlat1.xz = fract(u_xlat1.xz);
    u_xlat0.z = (-u_xlat1.z) * 0.00392156886 + u_xlat1.x;
    u_xlat0.w = u_xlat1.z;
    u_xlat0 = (bool(u_xlatb3)) ? u_xlat0 : vec4(0.5, 0.5, 1.0, 1.0);
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
; Bound: 169
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %166 
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
                                              OpDecorate %29 RelaxedPrecision 
                                              OpDecorate %32 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %43 ArrayStride 43 
                                              OpMemberDecorate %44 0 Offset 44 
                                              OpMemberDecorate %44 1 Offset 44 
                                              OpDecorate %44 Block 
                                              OpDecorate %46 DescriptorSet 46 
                                              OpDecorate %46 Binding 46 
                                              OpDecorate %102 DescriptorSet 102 
                                              OpDecorate %102 Binding 102 
                                              OpDecorate %104 DescriptorSet 104 
                                              OpDecorate %104 Binding 104 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %166 Location 166 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
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
                                      %24 = OpTypeVector %6 4 
                                      %27 = OpTypePointer Private %24 
                       Private f32_4* %28 = OpVariable Private 
                                  f32 %30 = OpConstant 3.674022E-40 
                                f32_3 %31 = OpConstantComposite %30 %30 %30 
                                  f32 %33 = OpConstant 3.674022E-40 
                                f32_3 %34 = OpConstantComposite %33 %33 %33 
                       Private f32_3* %38 = OpVariable Private 
                                      %41 = OpTypeInt 32 0 
                                  u32 %42 = OpConstant 4 
                                      %43 = OpTypeArray %24 %42 
                                      %44 = OpTypeStruct %24 %43 
                                      %45 = OpTypePointer Uniform %44 
   Uniform struct {f32_4; f32_4[4];}* %46 = OpVariable Uniform 
                                      %47 = OpTypeInt 32 1 
                                  i32 %48 = OpConstant 1 
                                      %49 = OpTypePointer Uniform %24 
                                  i32 %54 = OpConstant 0 
                                  i32 %65 = OpConstant 2 
                                      %77 = OpTypePointer Private %6 
                         Private f32* %78 = OpVariable Private 
                                  u32 %79 = OpConstant 2 
                                  f32 %83 = OpConstant 3.674022E-40 
                                  f32 %94 = OpConstant 3.674022E-40 
                                f32_2 %95 = OpConstantComposite %94 %94 
                                  f32 %97 = OpConstant 3.674022E-40 
                                f32_2 %98 = OpConstantComposite %97 %97 
UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
            UniformConstant sampler* %104 = OpVariable UniformConstant 
                                 u32 %109 = OpConstant 0 
                                     %112 = OpTypePointer Uniform %6 
                                 u32 %118 = OpConstant 1 
                                     %127 = OpTypeBool 
                                     %128 = OpTypePointer Private %127 
                       Private bool* %129 = OpVariable Private 
                                 f32 %132 = OpConstant 3.674022E-40 
                                 f32 %136 = OpConstant 3.674022E-40 
                               f32_2 %137 = OpConstantComposite %83 %136 
                                 f32 %149 = OpConstant 3.674022E-40 
                                 u32 %157 = OpConstant 3 
                               f32_4 %161 = OpConstantComposite %97 %97 %83 %83 
                                     %162 = OpTypeVector %127 4 
                                     %165 = OpTypePointer Output %24 
                       Output f32_4* %166 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                                f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                              OpStore %9 %26 
                                f32_3 %29 = OpLoad %9 
                                f32_3 %32 = OpFMul %29 %31 
                                f32_3 %35 = OpFAdd %32 %34 
                                f32_4 %36 = OpLoad %28 
                                f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                              OpStore %28 %37 
                                f32_4 %39 = OpLoad %28 
                                f32_3 %40 = OpVectorShuffle %39 %39 1 1 1 
                       Uniform f32_4* %50 = OpAccessChain %46 %48 %48 
                                f32_4 %51 = OpLoad %50 
                                f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
                                f32_3 %53 = OpFMul %40 %52 
                                              OpStore %38 %53 
                       Uniform f32_4* %55 = OpAccessChain %46 %48 %54 
                                f32_4 %56 = OpLoad %55 
                                f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                f32_4 %58 = OpLoad %28 
                                f32_3 %59 = OpVectorShuffle %58 %58 0 0 0 
                                f32_3 %60 = OpFMul %57 %59 
                                f32_3 %61 = OpLoad %38 
                                f32_3 %62 = OpFAdd %60 %61 
                                f32_4 %63 = OpLoad %28 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 6 
                                              OpStore %28 %64 
                       Uniform f32_4* %66 = OpAccessChain %46 %48 %65 
                                f32_4 %67 = OpLoad %66 
                                f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                f32_4 %69 = OpLoad %28 
                                f32_3 %70 = OpVectorShuffle %69 %69 2 2 2 
                                f32_3 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %28 
                                f32_3 %73 = OpVectorShuffle %72 %72 0 1 3 
                                f32_3 %74 = OpFAdd %71 %73 
                                f32_4 %75 = OpLoad %28 
                                f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                              OpStore %28 %76 
                         Private f32* %80 = OpAccessChain %28 %79 
                                  f32 %81 = OpLoad %80 
                                  f32 %82 = OpFNegate %81 
                                  f32 %84 = OpFAdd %82 %83 
                                              OpStore %78 %84 
                                f32_4 %85 = OpLoad %28 
                                f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                  f32 %87 = OpLoad %78 
                                f32_2 %88 = OpCompositeConstruct %87 %87 
                                f32_2 %89 = OpFDiv %86 %88 
                                f32_4 %90 = OpLoad %28 
                                f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                              OpStore %28 %91 
                                f32_4 %92 = OpLoad %28 
                                f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                f32_2 %96 = OpFMul %93 %95 
                                f32_2 %99 = OpFAdd %96 %98 
                               f32_4 %100 = OpLoad %28 
                               f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 3 
                                              OpStore %28 %101 
                 read_only Texture2D %103 = OpLoad %102 
                             sampler %105 = OpLoad %104 
          read_only Texture2DSampled %106 = OpSampledImage %103 %105 
                               f32_2 %107 = OpLoad vs_TEXCOORD0 
                               f32_4 %108 = OpImageSampleImplicitLod %106 %107 
                                 f32 %110 = OpCompositeExtract %108 0 
                        Private f32* %111 = OpAccessChain %38 %109 
                                              OpStore %111 %110 
                        Uniform f32* %113 = OpAccessChain %46 %54 %109 
                                 f32 %114 = OpLoad %113 
                        Private f32* %115 = OpAccessChain %38 %109 
                                 f32 %116 = OpLoad %115 
                                 f32 %117 = OpFMul %114 %116 
                        Uniform f32* %119 = OpAccessChain %46 %54 %118 
                                 f32 %120 = OpLoad %119 
                                 f32 %121 = OpFAdd %117 %120 
                        Private f32* %122 = OpAccessChain %38 %109 
                                              OpStore %122 %121 
                        Private f32* %123 = OpAccessChain %38 %109 
                                 f32 %124 = OpLoad %123 
                                 f32 %125 = OpFDiv %83 %124 
                        Private f32* %126 = OpAccessChain %38 %109 
                                              OpStore %126 %125 
                        Private f32* %130 = OpAccessChain %38 %109 
                                 f32 %131 = OpLoad %130 
                                bool %133 = OpFOrdLessThan %131 %132 
                                              OpStore %129 %133 
                               f32_3 %134 = OpLoad %38 
                               f32_2 %135 = OpVectorShuffle %134 %134 0 0 
                               f32_2 %138 = OpFMul %135 %137 
                               f32_3 %139 = OpLoad %38 
                               f32_3 %140 = OpVectorShuffle %139 %138 3 1 4 
                                              OpStore %38 %140 
                               f32_3 %141 = OpLoad %38 
                               f32_2 %142 = OpVectorShuffle %141 %141 0 2 
                               f32_2 %143 = OpExtInst %1 10 %142 
                               f32_3 %144 = OpLoad %38 
                               f32_3 %145 = OpVectorShuffle %144 %143 3 1 4 
                                              OpStore %38 %145 
                        Private f32* %146 = OpAccessChain %38 %79 
                                 f32 %147 = OpLoad %146 
                                 f32 %148 = OpFNegate %147 
                                 f32 %150 = OpFMul %148 %149 
                        Private f32* %151 = OpAccessChain %38 %109 
                                 f32 %152 = OpLoad %151 
                                 f32 %153 = OpFAdd %150 %152 
                        Private f32* %154 = OpAccessChain %28 %79 
                                              OpStore %154 %153 
                        Private f32* %155 = OpAccessChain %38 %79 
                                 f32 %156 = OpLoad %155 
                        Private f32* %158 = OpAccessChain %28 %157 
                                              OpStore %158 %156 
                                bool %159 = OpLoad %129 
                               f32_4 %160 = OpLoad %28 
                              bool_4 %163 = OpCompositeConstruct %159 %159 %159 %159 
                               f32_4 %164 = OpSelect %163 %160 %161 
                                              OpStore %28 %164 
                               f32_4 %167 = OpLoad %28 
                                              OpStore %166 %167 
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
; Bound: 169
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %166 
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
                                              OpDecorate %29 RelaxedPrecision 
                                              OpDecorate %32 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %43 ArrayStride 43 
                                              OpMemberDecorate %44 0 Offset 44 
                                              OpMemberDecorate %44 1 Offset 44 
                                              OpDecorate %44 Block 
                                              OpDecorate %46 DescriptorSet 46 
                                              OpDecorate %46 Binding 46 
                                              OpDecorate %102 DescriptorSet 102 
                                              OpDecorate %102 Binding 102 
                                              OpDecorate %104 DescriptorSet 104 
                                              OpDecorate %104 Binding 104 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %166 Location 166 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
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
                                      %24 = OpTypeVector %6 4 
                                      %27 = OpTypePointer Private %24 
                       Private f32_4* %28 = OpVariable Private 
                                  f32 %30 = OpConstant 3.674022E-40 
                                f32_3 %31 = OpConstantComposite %30 %30 %30 
                                  f32 %33 = OpConstant 3.674022E-40 
                                f32_3 %34 = OpConstantComposite %33 %33 %33 
                       Private f32_3* %38 = OpVariable Private 
                                      %41 = OpTypeInt 32 0 
                                  u32 %42 = OpConstant 4 
                                      %43 = OpTypeArray %24 %42 
                                      %44 = OpTypeStruct %24 %43 
                                      %45 = OpTypePointer Uniform %44 
   Uniform struct {f32_4; f32_4[4];}* %46 = OpVariable Uniform 
                                      %47 = OpTypeInt 32 1 
                                  i32 %48 = OpConstant 1 
                                      %49 = OpTypePointer Uniform %24 
                                  i32 %54 = OpConstant 0 
                                  i32 %65 = OpConstant 2 
                                      %77 = OpTypePointer Private %6 
                         Private f32* %78 = OpVariable Private 
                                  u32 %79 = OpConstant 2 
                                  f32 %83 = OpConstant 3.674022E-40 
                                  f32 %94 = OpConstant 3.674022E-40 
                                f32_2 %95 = OpConstantComposite %94 %94 
                                  f32 %97 = OpConstant 3.674022E-40 
                                f32_2 %98 = OpConstantComposite %97 %97 
UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
            UniformConstant sampler* %104 = OpVariable UniformConstant 
                                 u32 %109 = OpConstant 0 
                                     %112 = OpTypePointer Uniform %6 
                                 u32 %118 = OpConstant 1 
                                     %127 = OpTypeBool 
                                     %128 = OpTypePointer Private %127 
                       Private bool* %129 = OpVariable Private 
                                 f32 %132 = OpConstant 3.674022E-40 
                                 f32 %136 = OpConstant 3.674022E-40 
                               f32_2 %137 = OpConstantComposite %83 %136 
                                 f32 %149 = OpConstant 3.674022E-40 
                                 u32 %157 = OpConstant 3 
                               f32_4 %161 = OpConstantComposite %97 %97 %83 %83 
                                     %162 = OpTypeVector %127 4 
                                     %165 = OpTypePointer Output %24 
                       Output f32_4* %166 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                                f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                              OpStore %9 %26 
                                f32_3 %29 = OpLoad %9 
                                f32_3 %32 = OpFMul %29 %31 
                                f32_3 %35 = OpFAdd %32 %34 
                                f32_4 %36 = OpLoad %28 
                                f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                              OpStore %28 %37 
                                f32_4 %39 = OpLoad %28 
                                f32_3 %40 = OpVectorShuffle %39 %39 1 1 1 
                       Uniform f32_4* %50 = OpAccessChain %46 %48 %48 
                                f32_4 %51 = OpLoad %50 
                                f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
                                f32_3 %53 = OpFMul %40 %52 
                                              OpStore %38 %53 
                       Uniform f32_4* %55 = OpAccessChain %46 %48 %54 
                                f32_4 %56 = OpLoad %55 
                                f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                f32_4 %58 = OpLoad %28 
                                f32_3 %59 = OpVectorShuffle %58 %58 0 0 0 
                                f32_3 %60 = OpFMul %57 %59 
                                f32_3 %61 = OpLoad %38 
                                f32_3 %62 = OpFAdd %60 %61 
                                f32_4 %63 = OpLoad %28 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 6 
                                              OpStore %28 %64 
                       Uniform f32_4* %66 = OpAccessChain %46 %48 %65 
                                f32_4 %67 = OpLoad %66 
                                f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                f32_4 %69 = OpLoad %28 
                                f32_3 %70 = OpVectorShuffle %69 %69 2 2 2 
                                f32_3 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %28 
                                f32_3 %73 = OpVectorShuffle %72 %72 0 1 3 
                                f32_3 %74 = OpFAdd %71 %73 
                                f32_4 %75 = OpLoad %28 
                                f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                              OpStore %28 %76 
                         Private f32* %80 = OpAccessChain %28 %79 
                                  f32 %81 = OpLoad %80 
                                  f32 %82 = OpFNegate %81 
                                  f32 %84 = OpFAdd %82 %83 
                                              OpStore %78 %84 
                                f32_4 %85 = OpLoad %28 
                                f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                  f32 %87 = OpLoad %78 
                                f32_2 %88 = OpCompositeConstruct %87 %87 
                                f32_2 %89 = OpFDiv %86 %88 
                                f32_4 %90 = OpLoad %28 
                                f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                              OpStore %28 %91 
                                f32_4 %92 = OpLoad %28 
                                f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                f32_2 %96 = OpFMul %93 %95 
                                f32_2 %99 = OpFAdd %96 %98 
                               f32_4 %100 = OpLoad %28 
                               f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 3 
                                              OpStore %28 %101 
                 read_only Texture2D %103 = OpLoad %102 
                             sampler %105 = OpLoad %104 
          read_only Texture2DSampled %106 = OpSampledImage %103 %105 
                               f32_2 %107 = OpLoad vs_TEXCOORD0 
                               f32_4 %108 = OpImageSampleImplicitLod %106 %107 
                                 f32 %110 = OpCompositeExtract %108 0 
                        Private f32* %111 = OpAccessChain %38 %109 
                                              OpStore %111 %110 
                        Uniform f32* %113 = OpAccessChain %46 %54 %109 
                                 f32 %114 = OpLoad %113 
                        Private f32* %115 = OpAccessChain %38 %109 
                                 f32 %116 = OpLoad %115 
                                 f32 %117 = OpFMul %114 %116 
                        Uniform f32* %119 = OpAccessChain %46 %54 %118 
                                 f32 %120 = OpLoad %119 
                                 f32 %121 = OpFAdd %117 %120 
                        Private f32* %122 = OpAccessChain %38 %109 
                                              OpStore %122 %121 
                        Private f32* %123 = OpAccessChain %38 %109 
                                 f32 %124 = OpLoad %123 
                                 f32 %125 = OpFDiv %83 %124 
                        Private f32* %126 = OpAccessChain %38 %109 
                                              OpStore %126 %125 
                        Private f32* %130 = OpAccessChain %38 %109 
                                 f32 %131 = OpLoad %130 
                                bool %133 = OpFOrdLessThan %131 %132 
                                              OpStore %129 %133 
                               f32_3 %134 = OpLoad %38 
                               f32_2 %135 = OpVectorShuffle %134 %134 0 0 
                               f32_2 %138 = OpFMul %135 %137 
                               f32_3 %139 = OpLoad %38 
                               f32_3 %140 = OpVectorShuffle %139 %138 3 1 4 
                                              OpStore %38 %140 
                               f32_3 %141 = OpLoad %38 
                               f32_2 %142 = OpVectorShuffle %141 %141 0 2 
                               f32_2 %143 = OpExtInst %1 10 %142 
                               f32_3 %144 = OpLoad %38 
                               f32_3 %145 = OpVectorShuffle %144 %143 3 1 4 
                                              OpStore %38 %145 
                        Private f32* %146 = OpAccessChain %38 %79 
                                 f32 %147 = OpLoad %146 
                                 f32 %148 = OpFNegate %147 
                                 f32 %150 = OpFMul %148 %149 
                        Private f32* %151 = OpAccessChain %38 %109 
                                 f32 %152 = OpLoad %151 
                                 f32 %153 = OpFAdd %150 %152 
                        Private f32* %154 = OpAccessChain %28 %79 
                                              OpStore %154 %153 
                        Private f32* %155 = OpAccessChain %38 %79 
                                 f32 %156 = OpLoad %155 
                        Private f32* %158 = OpAccessChain %28 %157 
                                              OpStore %158 %156 
                                bool %159 = OpLoad %129 
                               f32_4 %160 = OpLoad %28 
                              bool_4 %163 = OpCompositeConstruct %159 %159 %159 %159 
                               f32_4 %164 = OpSelect %163 %160 %161 
                                              OpStore %28 %164 
                               f32_4 %167 = OpLoad %28 
                                              OpStore %166 %167 
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
; Bound: 169
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %166 
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
                                              OpDecorate %29 RelaxedPrecision 
                                              OpDecorate %32 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %43 ArrayStride 43 
                                              OpMemberDecorate %44 0 Offset 44 
                                              OpMemberDecorate %44 1 Offset 44 
                                              OpDecorate %44 Block 
                                              OpDecorate %46 DescriptorSet 46 
                                              OpDecorate %46 Binding 46 
                                              OpDecorate %102 DescriptorSet 102 
                                              OpDecorate %102 Binding 102 
                                              OpDecorate %104 DescriptorSet 104 
                                              OpDecorate %104 Binding 104 
                                              OpDecorate %166 RelaxedPrecision 
                                              OpDecorate %166 Location 166 
                                       %2 = OpTypeVoid 
                                       %3 = OpTypeFunction %2 
                                       %6 = OpTypeFloat 32 
                                       %7 = OpTypeVector %6 3 
                                       %8 = OpTypePointer Private %7 
                        Private f32_3* %9 = OpVariable Private 
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
                                      %24 = OpTypeVector %6 4 
                                      %27 = OpTypePointer Private %24 
                       Private f32_4* %28 = OpVariable Private 
                                  f32 %30 = OpConstant 3.674022E-40 
                                f32_3 %31 = OpConstantComposite %30 %30 %30 
                                  f32 %33 = OpConstant 3.674022E-40 
                                f32_3 %34 = OpConstantComposite %33 %33 %33 
                       Private f32_3* %38 = OpVariable Private 
                                      %41 = OpTypeInt 32 0 
                                  u32 %42 = OpConstant 4 
                                      %43 = OpTypeArray %24 %42 
                                      %44 = OpTypeStruct %24 %43 
                                      %45 = OpTypePointer Uniform %44 
   Uniform struct {f32_4; f32_4[4];}* %46 = OpVariable Uniform 
                                      %47 = OpTypeInt 32 1 
                                  i32 %48 = OpConstant 1 
                                      %49 = OpTypePointer Uniform %24 
                                  i32 %54 = OpConstant 0 
                                  i32 %65 = OpConstant 2 
                                      %77 = OpTypePointer Private %6 
                         Private f32* %78 = OpVariable Private 
                                  u32 %79 = OpConstant 2 
                                  f32 %83 = OpConstant 3.674022E-40 
                                  f32 %94 = OpConstant 3.674022E-40 
                                f32_2 %95 = OpConstantComposite %94 %94 
                                  f32 %97 = OpConstant 3.674022E-40 
                                f32_2 %98 = OpConstantComposite %97 %97 
UniformConstant read_only Texture2D* %102 = OpVariable UniformConstant 
            UniformConstant sampler* %104 = OpVariable UniformConstant 
                                 u32 %109 = OpConstant 0 
                                     %112 = OpTypePointer Uniform %6 
                                 u32 %118 = OpConstant 1 
                                     %127 = OpTypeBool 
                                     %128 = OpTypePointer Private %127 
                       Private bool* %129 = OpVariable Private 
                                 f32 %132 = OpConstant 3.674022E-40 
                                 f32 %136 = OpConstant 3.674022E-40 
                               f32_2 %137 = OpConstantComposite %83 %136 
                                 f32 %149 = OpConstant 3.674022E-40 
                                 u32 %157 = OpConstant 3 
                               f32_4 %161 = OpConstantComposite %97 %97 %83 %83 
                                     %162 = OpTypeVector %127 4 
                                     %165 = OpTypePointer Output %24 
                       Output f32_4* %166 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %25 = OpImageSampleImplicitLod %19 %23 
                                f32_3 %26 = OpVectorShuffle %25 %25 0 1 2 
                                              OpStore %9 %26 
                                f32_3 %29 = OpLoad %9 
                                f32_3 %32 = OpFMul %29 %31 
                                f32_3 %35 = OpFAdd %32 %34 
                                f32_4 %36 = OpLoad %28 
                                f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                              OpStore %28 %37 
                                f32_4 %39 = OpLoad %28 
                                f32_3 %40 = OpVectorShuffle %39 %39 1 1 1 
                       Uniform f32_4* %50 = OpAccessChain %46 %48 %48 
                                f32_4 %51 = OpLoad %50 
                                f32_3 %52 = OpVectorShuffle %51 %51 0 1 2 
                                f32_3 %53 = OpFMul %40 %52 
                                              OpStore %38 %53 
                       Uniform f32_4* %55 = OpAccessChain %46 %48 %54 
                                f32_4 %56 = OpLoad %55 
                                f32_3 %57 = OpVectorShuffle %56 %56 0 1 2 
                                f32_4 %58 = OpLoad %28 
                                f32_3 %59 = OpVectorShuffle %58 %58 0 0 0 
                                f32_3 %60 = OpFMul %57 %59 
                                f32_3 %61 = OpLoad %38 
                                f32_3 %62 = OpFAdd %60 %61 
                                f32_4 %63 = OpLoad %28 
                                f32_4 %64 = OpVectorShuffle %63 %62 4 5 2 6 
                                              OpStore %28 %64 
                       Uniform f32_4* %66 = OpAccessChain %46 %48 %65 
                                f32_4 %67 = OpLoad %66 
                                f32_3 %68 = OpVectorShuffle %67 %67 0 1 2 
                                f32_4 %69 = OpLoad %28 
                                f32_3 %70 = OpVectorShuffle %69 %69 2 2 2 
                                f32_3 %71 = OpFMul %68 %70 
                                f32_4 %72 = OpLoad %28 
                                f32_3 %73 = OpVectorShuffle %72 %72 0 1 3 
                                f32_3 %74 = OpFAdd %71 %73 
                                f32_4 %75 = OpLoad %28 
                                f32_4 %76 = OpVectorShuffle %75 %74 4 5 6 3 
                                              OpStore %28 %76 
                         Private f32* %80 = OpAccessChain %28 %79 
                                  f32 %81 = OpLoad %80 
                                  f32 %82 = OpFNegate %81 
                                  f32 %84 = OpFAdd %82 %83 
                                              OpStore %78 %84 
                                f32_4 %85 = OpLoad %28 
                                f32_2 %86 = OpVectorShuffle %85 %85 0 1 
                                  f32 %87 = OpLoad %78 
                                f32_2 %88 = OpCompositeConstruct %87 %87 
                                f32_2 %89 = OpFDiv %86 %88 
                                f32_4 %90 = OpLoad %28 
                                f32_4 %91 = OpVectorShuffle %90 %89 4 5 2 3 
                                              OpStore %28 %91 
                                f32_4 %92 = OpLoad %28 
                                f32_2 %93 = OpVectorShuffle %92 %92 0 1 
                                f32_2 %96 = OpFMul %93 %95 
                                f32_2 %99 = OpFAdd %96 %98 
                               f32_4 %100 = OpLoad %28 
                               f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 3 
                                              OpStore %28 %101 
                 read_only Texture2D %103 = OpLoad %102 
                             sampler %105 = OpLoad %104 
          read_only Texture2DSampled %106 = OpSampledImage %103 %105 
                               f32_2 %107 = OpLoad vs_TEXCOORD0 
                               f32_4 %108 = OpImageSampleImplicitLod %106 %107 
                                 f32 %110 = OpCompositeExtract %108 0 
                        Private f32* %111 = OpAccessChain %38 %109 
                                              OpStore %111 %110 
                        Uniform f32* %113 = OpAccessChain %46 %54 %109 
                                 f32 %114 = OpLoad %113 
                        Private f32* %115 = OpAccessChain %38 %109 
                                 f32 %116 = OpLoad %115 
                                 f32 %117 = OpFMul %114 %116 
                        Uniform f32* %119 = OpAccessChain %46 %54 %118 
                                 f32 %120 = OpLoad %119 
                                 f32 %121 = OpFAdd %117 %120 
                        Private f32* %122 = OpAccessChain %38 %109 
                                              OpStore %122 %121 
                        Private f32* %123 = OpAccessChain %38 %109 
                                 f32 %124 = OpLoad %123 
                                 f32 %125 = OpFDiv %83 %124 
                        Private f32* %126 = OpAccessChain %38 %109 
                                              OpStore %126 %125 
                        Private f32* %130 = OpAccessChain %38 %109 
                                 f32 %131 = OpLoad %130 
                                bool %133 = OpFOrdLessThan %131 %132 
                                              OpStore %129 %133 
                               f32_3 %134 = OpLoad %38 
                               f32_2 %135 = OpVectorShuffle %134 %134 0 0 
                               f32_2 %138 = OpFMul %135 %137 
                               f32_3 %139 = OpLoad %38 
                               f32_3 %140 = OpVectorShuffle %139 %138 3 1 4 
                                              OpStore %38 %140 
                               f32_3 %141 = OpLoad %38 
                               f32_2 %142 = OpVectorShuffle %141 %141 0 2 
                               f32_2 %143 = OpExtInst %1 10 %142 
                               f32_3 %144 = OpLoad %38 
                               f32_3 %145 = OpVectorShuffle %144 %143 3 1 4 
                                              OpStore %38 %145 
                        Private f32* %146 = OpAccessChain %38 %79 
                                 f32 %147 = OpLoad %146 
                                 f32 %148 = OpFNegate %147 
                                 f32 %150 = OpFMul %148 %149 
                        Private f32* %151 = OpAccessChain %38 %109 
                                 f32 %152 = OpLoad %151 
                                 f32 %153 = OpFAdd %150 %152 
                        Private f32* %154 = OpAccessChain %28 %79 
                                              OpStore %154 %153 
                        Private f32* %155 = OpAccessChain %38 %79 
                                 f32 %156 = OpLoad %155 
                        Private f32* %158 = OpAccessChain %28 %157 
                                              OpStore %158 %156 
                                bool %159 = OpLoad %129 
                               f32_4 %160 = OpLoad %28 
                              bool_4 %163 = OpCompositeConstruct %159 %159 %159 %159 
                               f32_4 %164 = OpSelect %163 %160 %161 
                                              OpStore %28 %164 
                               f32_4 %167 = OpLoad %28 
                                              OpStore %166 %167 
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