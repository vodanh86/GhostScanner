//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-MotionVectors" {
Properties {
}
SubShader {
 Pass {
  Tags { "LIGHTMODE" = "MOTIONVECTORS" }
  ZWrite Off
  GpuProgramID 57106
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
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousM[4];
uniform 	int _HasLastPositionData;
uniform 	float _MotionVectorDepthBias;
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD4;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_NonJitteredVP[1];
    u_xlat2 = hlslcc_mtx4x4_NonJitteredVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_NonJitteredVP[2] * u_xlat1.zzzz + u_xlat2;
    vs_TEXCOORD0 = hlslcc_mtx4x4_NonJitteredVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    u_xlat1 = (_HasLastPositionData != 0) ? u_xlat1 : in_POSITION0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_PreviousM[1];
    u_xlat2 = hlslcc_mtx4x4_PreviousM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_PreviousM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4_PreviousM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_PreviousVP[1];
    u_xlat2 = hlslcc_mtx4x4_PreviousVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_PreviousVP[2] * u_xlat1.zzzz + u_xlat2;
    vs_TEXCOORD1 = hlslcc_mtx4x4_PreviousVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position.z = _MotionVectorDepthBias * u_xlat0.w + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
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
uniform 	int _ForceNoMotion;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat4.xy = u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + (-u_xlat0.xy);
    u_xlat16_1 = (_ForceNoMotion != 0) ? 1.0 : 0.0;
    SV_Target0.xy = vec2(u_xlat16_1) * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlat16_3.x = float(-0.0);
    u_xlat16_3.y = float(-1.0);
    SV_Target0.zw = vec2(u_xlat16_1) * u_xlat16_3.xy + vec2(0.0, 1.0);
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
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousM[4];
uniform 	int _HasLastPositionData;
uniform 	float _MotionVectorDepthBias;
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD4;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_NonJitteredVP[1];
    u_xlat2 = hlslcc_mtx4x4_NonJitteredVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_NonJitteredVP[2] * u_xlat1.zzzz + u_xlat2;
    vs_TEXCOORD0 = hlslcc_mtx4x4_NonJitteredVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    u_xlat1 = (_HasLastPositionData != 0) ? u_xlat1 : in_POSITION0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_PreviousM[1];
    u_xlat2 = hlslcc_mtx4x4_PreviousM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_PreviousM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4_PreviousM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_PreviousVP[1];
    u_xlat2 = hlslcc_mtx4x4_PreviousVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_PreviousVP[2] * u_xlat1.zzzz + u_xlat2;
    vs_TEXCOORD1 = hlslcc_mtx4x4_PreviousVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position.z = _MotionVectorDepthBias * u_xlat0.w + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
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
uniform 	int _ForceNoMotion;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat4.xy = u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + (-u_xlat0.xy);
    u_xlat16_1 = (_ForceNoMotion != 0) ? 1.0 : 0.0;
    SV_Target0.xy = vec2(u_xlat16_1) * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlat16_3.x = float(-0.0);
    u_xlat16_3.y = float(-1.0);
    SV_Target0.zw = vec2(u_xlat16_1) * u_xlat16_3.xy + vec2(0.0, 1.0);
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
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousM[4];
uniform 	int _HasLastPositionData;
uniform 	float _MotionVectorDepthBias;
in highp vec4 in_POSITION0;
in highp vec3 in_TEXCOORD4;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_NonJitteredVP[1];
    u_xlat2 = hlslcc_mtx4x4_NonJitteredVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_NonJitteredVP[2] * u_xlat1.zzzz + u_xlat2;
    vs_TEXCOORD0 = hlslcc_mtx4x4_NonJitteredVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xyz = in_TEXCOORD4.xyz;
    u_xlat1.w = 1.0;
    u_xlat1 = (_HasLastPositionData != 0) ? u_xlat1 : in_POSITION0;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_PreviousM[1];
    u_xlat2 = hlslcc_mtx4x4_PreviousM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_PreviousM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4_PreviousM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4_PreviousVP[1];
    u_xlat2 = hlslcc_mtx4x4_PreviousVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4_PreviousVP[2] * u_xlat1.zzzz + u_xlat2;
    vs_TEXCOORD1 = hlslcc_mtx4x4_PreviousVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position.z = _MotionVectorDepthBias * u_xlat0.w + u_xlat0.z;
    gl_Position.xyw = u_xlat0.xyw;
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
uniform 	int _ForceNoMotion;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_1;
mediump vec2 u_xlat16_3;
vec2 u_xlat4;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat4.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat4.xy = u_xlat4.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + (-u_xlat0.xy);
    u_xlat16_1 = (_ForceNoMotion != 0) ? 1.0 : 0.0;
    SV_Target0.xy = vec2(u_xlat16_1) * (-u_xlat0.xy) + u_xlat0.xy;
    u_xlat16_3.x = float(-0.0);
    u_xlat16_3.y = float(-1.0);
    SV_Target0.zw = vec2(u_xlat16_1) * u_xlat16_3.xy + vec2(0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 218
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %90 %155 %193 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate vs_TEXCOORD0 Location 80 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD1 Location 155 
                                                      OpMemberDecorate %191 0 BuiltIn 191 
                                                      OpMemberDecorate %191 1 BuiltIn 191 
                                                      OpMemberDecorate %191 2 BuiltIn 191 
                                                      OpDecorate %191 Block 
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
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeStruct %16 %17 %18 %19 %20 %21 %6 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; i32; f32;}* %24 = OpVariable Uniform 
                                          i32 %25 = OpConstant 0 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %38 = OpConstant 2 
                               Private f32_4* %46 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                               Private f32_4* %59 = OpVariable Private 
                                              %79 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                              %88 = OpTypeVector %6 3 
                                              %89 = OpTypePointer Input %88 
                                 Input f32_3* %90 = OpVariable Input 
                                          f32 %94 = OpConstant 3.674022E-40 
                                          u32 %95 = OpConstant 3 
                                              %96 = OpTypePointer Private %6 
                                          i32 %98 = OpConstant 5 
                                              %99 = OpTypePointer Uniform %21 
                                             %102 = OpTypeBool 
                                             %106 = OpTypeVector %102 4 
                                         i32 %111 = OpConstant 4 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %189 = OpConstant 1 
                                             %190 = OpTypeArray %6 %189 
                                             %191 = OpTypeStruct %7 %6 %190 
                                             %192 = OpTypePointer Output %191 
        Output struct {f32_4; f32; f32[1];}* %193 = OpVariable Output 
                                         i32 %194 = OpConstant 6 
                                             %195 = OpTypePointer Uniform %6 
                                         u32 %202 = OpConstant 2 
                                             %206 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %28 = OpAccessChain %24 %25 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFMul %13 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %31 = OpAccessChain %24 %25 %25 
                                        f32_4 %32 = OpLoad %31 
                                        f32_4 %33 = OpLoad %11 
                                        f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 0 
                                        f32_4 %35 = OpFMul %32 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpFAdd %35 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %39 = OpAccessChain %24 %25 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %11 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 2 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %9 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %48 = OpAccessChain %24 %25 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpLoad %11 
                                        f32_4 %51 = OpVectorShuffle %50 %50 3 3 3 3 
                                        f32_4 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %46 %54 
                                        f32_4 %55 = OpLoad %9 
                               Uniform f32_4* %56 = OpAccessChain %24 %25 %47 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFAdd %55 %57 
                                                      OpStore %9 %58 
                                        f32_4 %60 = OpLoad %46 
                                        f32_4 %61 = OpVectorShuffle %60 %60 1 1 1 1 
                               Uniform f32_4* %62 = OpAccessChain %24 %38 %26 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %61 %63 
                                                      OpStore %59 %64 
                               Uniform f32_4* %65 = OpAccessChain %24 %38 %25 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %46 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %59 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %59 %71 
                               Uniform f32_4* %72 = OpAccessChain %24 %38 %38 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %59 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %59 %78 
                               Uniform f32_4* %81 = OpAccessChain %24 %38 %47 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %46 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %59 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore vs_TEXCOORD0 %87 
                                        f32_3 %91 = OpLoad %90 
                                        f32_4 %92 = OpLoad %46 
                                        f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
                                                      OpStore %46 %93 
                                 Private f32* %97 = OpAccessChain %46 %95 
                                                      OpStore %97 %94 
                                Uniform i32* %100 = OpAccessChain %24 %98 
                                         i32 %101 = OpLoad %100 
                                        bool %103 = OpINotEqual %101 %25 
                                       f32_4 %104 = OpLoad %46 
                                       f32_4 %105 = OpLoad %11 
                                      bool_4 %107 = OpCompositeConstruct %103 %103 %103 %103 
                                       f32_4 %108 = OpSelect %107 %104 %105 
                                                      OpStore %46 %108 
                                       f32_4 %109 = OpLoad %46 
                                       f32_4 %110 = OpVectorShuffle %109 %109 1 1 1 1 
                              Uniform f32_4* %112 = OpAccessChain %24 %111 %26 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpFMul %110 %113 
                                                      OpStore %59 %114 
                              Uniform f32_4* %115 = OpAccessChain %24 %111 %25 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpLoad %46 
                                       f32_4 %118 = OpVectorShuffle %117 %117 0 0 0 0 
                                       f32_4 %119 = OpFMul %116 %118 
                                       f32_4 %120 = OpLoad %59 
                                       f32_4 %121 = OpFAdd %119 %120 
                                                      OpStore %59 %121 
                              Uniform f32_4* %122 = OpAccessChain %24 %111 %38 
                                       f32_4 %123 = OpLoad %122 
                                       f32_4 %124 = OpLoad %46 
                                       f32_4 %125 = OpVectorShuffle %124 %124 2 2 2 2 
                                       f32_4 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %59 
                                       f32_4 %128 = OpFAdd %126 %127 
                                                      OpStore %59 %128 
                              Uniform f32_4* %129 = OpAccessChain %24 %111 %47 
                                       f32_4 %130 = OpLoad %129 
                                       f32_4 %131 = OpLoad %46 
                                       f32_4 %132 = OpVectorShuffle %131 %131 3 3 3 3 
                                       f32_4 %133 = OpFMul %130 %132 
                                       f32_4 %134 = OpLoad %59 
                                       f32_4 %135 = OpFAdd %133 %134 
                                                      OpStore %46 %135 
                                       f32_4 %136 = OpLoad %46 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %24 %47 %26 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %59 %140 
                              Uniform f32_4* %141 = OpAccessChain %24 %47 %25 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %46 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %59 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %59 %147 
                              Uniform f32_4* %148 = OpAccessChain %24 %47 %38 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %46 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %59 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %59 %154 
                              Uniform f32_4* %156 = OpAccessChain %24 %47 %47 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %46 
                                       f32_4 %159 = OpVectorShuffle %158 %158 3 3 3 3 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %59 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore vs_TEXCOORD1 %162 
                                       f32_4 %163 = OpLoad %9 
                                       f32_4 %164 = OpVectorShuffle %163 %163 1 1 1 1 
                              Uniform f32_4* %165 = OpAccessChain %24 %26 %26 
                                       f32_4 %166 = OpLoad %165 
                                       f32_4 %167 = OpFMul %164 %166 
                                                      OpStore %46 %167 
                              Uniform f32_4* %168 = OpAccessChain %24 %26 %25 
                                       f32_4 %169 = OpLoad %168 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 0 0 0 0 
                                       f32_4 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %46 
                                       f32_4 %174 = OpFAdd %172 %173 
                                                      OpStore %46 %174 
                              Uniform f32_4* %175 = OpAccessChain %24 %26 %38 
                                       f32_4 %176 = OpLoad %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_4 %178 = OpVectorShuffle %177 %177 2 2 2 2 
                                       f32_4 %179 = OpFMul %176 %178 
                                       f32_4 %180 = OpLoad %46 
                                       f32_4 %181 = OpFAdd %179 %180 
                                                      OpStore %46 %181 
                              Uniform f32_4* %182 = OpAccessChain %24 %26 %47 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpLoad %9 
                                       f32_4 %185 = OpVectorShuffle %184 %184 3 3 3 3 
                                       f32_4 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %46 
                                       f32_4 %188 = OpFAdd %186 %187 
                                                      OpStore %9 %188 
                                Uniform f32* %196 = OpAccessChain %24 %194 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFNegate %197 
                                Private f32* %199 = OpAccessChain %9 %95 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %198 %200 
                                Private f32* %203 = OpAccessChain %9 %202 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFAdd %201 %204 
                                 Output f32* %207 = OpAccessChain %193 %25 %202 
                                                      OpStore %207 %205 
                                       f32_4 %208 = OpLoad %9 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 3 
                               Output f32_4* %210 = OpAccessChain %193 %25 
                                       f32_4 %211 = OpLoad %210 
                                       f32_4 %212 = OpVectorShuffle %211 %209 4 5 2 6 
                                                      OpStore %210 %212 
                                 Output f32* %213 = OpAccessChain %193 %25 %189 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFNegate %214 
                                 Output f32* %216 = OpAccessChain %193 %25 %189 
                                                      OpStore %216 %215 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                               OpCapability Shader 
                        %1 = OpExtInstImport "GLSL.std.450" 
                               OpMemoryModel Logical GLSL450 
                               OpEntryPoint Fragment %4 "main" %12 %45 %91 
                               OpExecutionMode %4 OriginUpperLeft 
                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                               OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                               OpDecorate vs_TEXCOORD0 Location 12 
                               OpDecorate vs_TEXCOORD1 Location 45 
                               OpDecorate %77 RelaxedPrecision 
                               OpMemberDecorate %79 0 Offset 79 
                               OpDecorate %79 Block 
                               OpDecorate %81 DescriptorSet 81 
                               OpDecorate %81 Binding 81 
                               OpDecorate %91 RelaxedPrecision 
                               OpDecorate %91 Location 91 
                               OpDecorate %92 RelaxedPrecision 
                               OpDecorate %104 RelaxedPrecision 
                               OpDecorate %109 RelaxedPrecision 
                               OpDecorate %110 RelaxedPrecision 
                               OpDecorate %111 RelaxedPrecision 
                               OpDecorate %112 RelaxedPrecision 
                               OpDecorate %114 RelaxedPrecision 
                        %2 = OpTypeVoid 
                        %3 = OpTypeFunction %2 
                        %6 = OpTypeFloat 32 
                        %7 = OpTypeVector %6 3 
                        %8 = OpTypePointer Private %7 
         Private f32_3* %9 = OpVariable Private 
                       %10 = OpTypeVector %6 4 
                       %11 = OpTypePointer Input %10 
 Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                       %13 = OpTypeVector %6 2 
                   f32 %23 = OpConstant 3.674022E-40 
                 f32_2 %24 = OpConstantComposite %23 %23 
                       %28 = OpTypeInt 32 0 
                   u32 %29 = OpConstant 0 
                       %30 = OpTypePointer Private %6 
                   f32 %33 = OpConstant 3.674022E-40 
                   u32 %36 = OpConstant 1 
                   u32 %42 = OpConstant 2 
        Private f32_3* %44 = OpVariable Private 
 Input f32_4* vs_TEXCOORD1 = OpVariable Input 
        Private f32_3* %58 = OpVariable Private 
          Private f32* %77 = OpVariable Private 
                       %78 = OpTypeInt 32 1 
                       %79 = OpTypeStruct %78 
                       %80 = OpTypePointer Uniform %79 
Uniform struct {i32;}* %81 = OpVariable Uniform 
                   i32 %82 = OpConstant 0 
                       %83 = OpTypePointer Uniform %78 
                       %86 = OpTypeBool 
                   f32 %88 = OpConstant 3.674022E-40 
                       %90 = OpTypePointer Output %10 
         Output f32_4* %91 = OpVariable Output 
                      %103 = OpTypePointer Private %13 
       Private f32_2* %104 = OpVariable Private 
                  f32 %105 = OpConstant 3.674022E-40 
                  f32 %107 = OpConstant 3.674022E-40 
                f32_2 %113 = OpConstantComposite %88 %23 
                   void %4 = OpFunction None %3 
                        %5 = OpLabel 
                 f32_4 %14 = OpLoad vs_TEXCOORD0 
                 f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                 f32_4 %16 = OpLoad vs_TEXCOORD0 
                 f32_2 %17 = OpVectorShuffle %16 %16 3 3 
                 f32_2 %18 = OpFDiv %15 %17 
                 f32_3 %19 = OpLoad %9 
                 f32_3 %20 = OpVectorShuffle %19 %18 3 4 2 
                               OpStore %9 %20 
                 f32_3 %21 = OpLoad %9 
                 f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                 f32_2 %25 = OpFAdd %22 %24 
                 f32_3 %26 = OpLoad %9 
                 f32_3 %27 = OpVectorShuffle %26 %25 3 4 2 
                               OpStore %9 %27 
          Private f32* %31 = OpAccessChain %9 %29 
                   f32 %32 = OpLoad %31 
                   f32 %34 = OpFMul %32 %33 
          Private f32* %35 = OpAccessChain %9 %29 
                               OpStore %35 %34 
          Private f32* %37 = OpAccessChain %9 %36 
                   f32 %38 = OpLoad %37 
                   f32 %39 = OpFNegate %38 
                   f32 %40 = OpFMul %39 %33 
                   f32 %41 = OpFAdd %40 %23 
          Private f32* %43 = OpAccessChain %9 %42 
                               OpStore %43 %41 
                 f32_4 %46 = OpLoad vs_TEXCOORD1 
                 f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                 f32_4 %48 = OpLoad vs_TEXCOORD1 
                 f32_2 %49 = OpVectorShuffle %48 %48 3 3 
                 f32_2 %50 = OpFDiv %47 %49 
                 f32_3 %51 = OpLoad %44 
                 f32_3 %52 = OpVectorShuffle %51 %50 3 1 4 
                               OpStore %44 %52 
                 f32_3 %53 = OpLoad %44 
                 f32_2 %54 = OpVectorShuffle %53 %53 0 2 
                 f32_2 %55 = OpFAdd %54 %24 
                 f32_3 %56 = OpLoad %44 
                 f32_3 %57 = OpVectorShuffle %56 %55 3 1 4 
                               OpStore %44 %57 
          Private f32* %59 = OpAccessChain %44 %29 
                   f32 %60 = OpLoad %59 
                   f32 %61 = OpFMul %60 %33 
          Private f32* %62 = OpAccessChain %58 %29 
                               OpStore %62 %61 
          Private f32* %63 = OpAccessChain %44 %42 
                   f32 %64 = OpLoad %63 
                   f32 %65 = OpFNegate %64 
                   f32 %66 = OpFMul %65 %33 
                   f32 %67 = OpFAdd %66 %23 
          Private f32* %68 = OpAccessChain %58 %42 
                               OpStore %68 %67 
                 f32_3 %69 = OpLoad %9 
                 f32_2 %70 = OpVectorShuffle %69 %69 0 2 
                 f32_3 %71 = OpLoad %58 
                 f32_2 %72 = OpVectorShuffle %71 %71 0 2 
                 f32_2 %73 = OpFNegate %72 
                 f32_2 %74 = OpFAdd %70 %73 
                 f32_3 %75 = OpLoad %9 
                 f32_3 %76 = OpVectorShuffle %75 %74 3 4 2 
                               OpStore %9 %76 
          Uniform i32* %84 = OpAccessChain %81 %82 
                   i32 %85 = OpLoad %84 
                  bool %87 = OpINotEqual %85 %82 
                   f32 %89 = OpSelect %87 %23 %88 
                               OpStore %77 %89 
                   f32 %92 = OpLoad %77 
                 f32_2 %93 = OpCompositeConstruct %92 %92 
                 f32_3 %94 = OpLoad %9 
                 f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                 f32_2 %96 = OpFNegate %95 
                 f32_2 %97 = OpFMul %93 %96 
                 f32_3 %98 = OpLoad %9 
                 f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                f32_2 %100 = OpFAdd %97 %99 
                f32_4 %101 = OpLoad %91 
                f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                               OpStore %91 %102 
         Private f32* %106 = OpAccessChain %104 %29 
                               OpStore %106 %105 
         Private f32* %108 = OpAccessChain %104 %36 
                               OpStore %108 %107 
                  f32 %109 = OpLoad %77 
                f32_2 %110 = OpCompositeConstruct %109 %109 
                f32_2 %111 = OpLoad %104 
                f32_2 %112 = OpFMul %110 %111 
                f32_2 %114 = OpFAdd %112 %113 
                f32_4 %115 = OpLoad %91 
                f32_4 %116 = OpVectorShuffle %115 %114 0 1 4 5 
                               OpStore %91 %116 
                               OpReturn
                               OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 218
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %90 %155 %193 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate vs_TEXCOORD0 Location 80 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD1 Location 155 
                                                      OpMemberDecorate %191 0 BuiltIn 191 
                                                      OpMemberDecorate %191 1 BuiltIn 191 
                                                      OpMemberDecorate %191 2 BuiltIn 191 
                                                      OpDecorate %191 Block 
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
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeStruct %16 %17 %18 %19 %20 %21 %6 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; i32; f32;}* %24 = OpVariable Uniform 
                                          i32 %25 = OpConstant 0 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %38 = OpConstant 2 
                               Private f32_4* %46 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                               Private f32_4* %59 = OpVariable Private 
                                              %79 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                              %88 = OpTypeVector %6 3 
                                              %89 = OpTypePointer Input %88 
                                 Input f32_3* %90 = OpVariable Input 
                                          f32 %94 = OpConstant 3.674022E-40 
                                          u32 %95 = OpConstant 3 
                                              %96 = OpTypePointer Private %6 
                                          i32 %98 = OpConstant 5 
                                              %99 = OpTypePointer Uniform %21 
                                             %102 = OpTypeBool 
                                             %106 = OpTypeVector %102 4 
                                         i32 %111 = OpConstant 4 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %189 = OpConstant 1 
                                             %190 = OpTypeArray %6 %189 
                                             %191 = OpTypeStruct %7 %6 %190 
                                             %192 = OpTypePointer Output %191 
        Output struct {f32_4; f32; f32[1];}* %193 = OpVariable Output 
                                         i32 %194 = OpConstant 6 
                                             %195 = OpTypePointer Uniform %6 
                                         u32 %202 = OpConstant 2 
                                             %206 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %28 = OpAccessChain %24 %25 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFMul %13 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %31 = OpAccessChain %24 %25 %25 
                                        f32_4 %32 = OpLoad %31 
                                        f32_4 %33 = OpLoad %11 
                                        f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 0 
                                        f32_4 %35 = OpFMul %32 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpFAdd %35 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %39 = OpAccessChain %24 %25 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %11 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 2 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %9 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %48 = OpAccessChain %24 %25 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpLoad %11 
                                        f32_4 %51 = OpVectorShuffle %50 %50 3 3 3 3 
                                        f32_4 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %46 %54 
                                        f32_4 %55 = OpLoad %9 
                               Uniform f32_4* %56 = OpAccessChain %24 %25 %47 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFAdd %55 %57 
                                                      OpStore %9 %58 
                                        f32_4 %60 = OpLoad %46 
                                        f32_4 %61 = OpVectorShuffle %60 %60 1 1 1 1 
                               Uniform f32_4* %62 = OpAccessChain %24 %38 %26 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %61 %63 
                                                      OpStore %59 %64 
                               Uniform f32_4* %65 = OpAccessChain %24 %38 %25 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %46 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %59 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %59 %71 
                               Uniform f32_4* %72 = OpAccessChain %24 %38 %38 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %59 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %59 %78 
                               Uniform f32_4* %81 = OpAccessChain %24 %38 %47 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %46 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %59 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore vs_TEXCOORD0 %87 
                                        f32_3 %91 = OpLoad %90 
                                        f32_4 %92 = OpLoad %46 
                                        f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
                                                      OpStore %46 %93 
                                 Private f32* %97 = OpAccessChain %46 %95 
                                                      OpStore %97 %94 
                                Uniform i32* %100 = OpAccessChain %24 %98 
                                         i32 %101 = OpLoad %100 
                                        bool %103 = OpINotEqual %101 %25 
                                       f32_4 %104 = OpLoad %46 
                                       f32_4 %105 = OpLoad %11 
                                      bool_4 %107 = OpCompositeConstruct %103 %103 %103 %103 
                                       f32_4 %108 = OpSelect %107 %104 %105 
                                                      OpStore %46 %108 
                                       f32_4 %109 = OpLoad %46 
                                       f32_4 %110 = OpVectorShuffle %109 %109 1 1 1 1 
                              Uniform f32_4* %112 = OpAccessChain %24 %111 %26 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpFMul %110 %113 
                                                      OpStore %59 %114 
                              Uniform f32_4* %115 = OpAccessChain %24 %111 %25 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpLoad %46 
                                       f32_4 %118 = OpVectorShuffle %117 %117 0 0 0 0 
                                       f32_4 %119 = OpFMul %116 %118 
                                       f32_4 %120 = OpLoad %59 
                                       f32_4 %121 = OpFAdd %119 %120 
                                                      OpStore %59 %121 
                              Uniform f32_4* %122 = OpAccessChain %24 %111 %38 
                                       f32_4 %123 = OpLoad %122 
                                       f32_4 %124 = OpLoad %46 
                                       f32_4 %125 = OpVectorShuffle %124 %124 2 2 2 2 
                                       f32_4 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %59 
                                       f32_4 %128 = OpFAdd %126 %127 
                                                      OpStore %59 %128 
                              Uniform f32_4* %129 = OpAccessChain %24 %111 %47 
                                       f32_4 %130 = OpLoad %129 
                                       f32_4 %131 = OpLoad %46 
                                       f32_4 %132 = OpVectorShuffle %131 %131 3 3 3 3 
                                       f32_4 %133 = OpFMul %130 %132 
                                       f32_4 %134 = OpLoad %59 
                                       f32_4 %135 = OpFAdd %133 %134 
                                                      OpStore %46 %135 
                                       f32_4 %136 = OpLoad %46 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %24 %47 %26 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %59 %140 
                              Uniform f32_4* %141 = OpAccessChain %24 %47 %25 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %46 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %59 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %59 %147 
                              Uniform f32_4* %148 = OpAccessChain %24 %47 %38 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %46 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %59 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %59 %154 
                              Uniform f32_4* %156 = OpAccessChain %24 %47 %47 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %46 
                                       f32_4 %159 = OpVectorShuffle %158 %158 3 3 3 3 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %59 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore vs_TEXCOORD1 %162 
                                       f32_4 %163 = OpLoad %9 
                                       f32_4 %164 = OpVectorShuffle %163 %163 1 1 1 1 
                              Uniform f32_4* %165 = OpAccessChain %24 %26 %26 
                                       f32_4 %166 = OpLoad %165 
                                       f32_4 %167 = OpFMul %164 %166 
                                                      OpStore %46 %167 
                              Uniform f32_4* %168 = OpAccessChain %24 %26 %25 
                                       f32_4 %169 = OpLoad %168 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 0 0 0 0 
                                       f32_4 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %46 
                                       f32_4 %174 = OpFAdd %172 %173 
                                                      OpStore %46 %174 
                              Uniform f32_4* %175 = OpAccessChain %24 %26 %38 
                                       f32_4 %176 = OpLoad %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_4 %178 = OpVectorShuffle %177 %177 2 2 2 2 
                                       f32_4 %179 = OpFMul %176 %178 
                                       f32_4 %180 = OpLoad %46 
                                       f32_4 %181 = OpFAdd %179 %180 
                                                      OpStore %46 %181 
                              Uniform f32_4* %182 = OpAccessChain %24 %26 %47 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpLoad %9 
                                       f32_4 %185 = OpVectorShuffle %184 %184 3 3 3 3 
                                       f32_4 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %46 
                                       f32_4 %188 = OpFAdd %186 %187 
                                                      OpStore %9 %188 
                                Uniform f32* %196 = OpAccessChain %24 %194 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFNegate %197 
                                Private f32* %199 = OpAccessChain %9 %95 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %198 %200 
                                Private f32* %203 = OpAccessChain %9 %202 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFAdd %201 %204 
                                 Output f32* %207 = OpAccessChain %193 %25 %202 
                                                      OpStore %207 %205 
                                       f32_4 %208 = OpLoad %9 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 3 
                               Output f32_4* %210 = OpAccessChain %193 %25 
                                       f32_4 %211 = OpLoad %210 
                                       f32_4 %212 = OpVectorShuffle %211 %209 4 5 2 6 
                                                      OpStore %210 %212 
                                 Output f32* %213 = OpAccessChain %193 %25 %189 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFNegate %214 
                                 Output f32* %216 = OpAccessChain %193 %25 %189 
                                                      OpStore %216 %215 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                               OpCapability Shader 
                        %1 = OpExtInstImport "GLSL.std.450" 
                               OpMemoryModel Logical GLSL450 
                               OpEntryPoint Fragment %4 "main" %12 %45 %91 
                               OpExecutionMode %4 OriginUpperLeft 
                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                               OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                               OpDecorate vs_TEXCOORD0 Location 12 
                               OpDecorate vs_TEXCOORD1 Location 45 
                               OpDecorate %77 RelaxedPrecision 
                               OpMemberDecorate %79 0 Offset 79 
                               OpDecorate %79 Block 
                               OpDecorate %81 DescriptorSet 81 
                               OpDecorate %81 Binding 81 
                               OpDecorate %91 RelaxedPrecision 
                               OpDecorate %91 Location 91 
                               OpDecorate %92 RelaxedPrecision 
                               OpDecorate %104 RelaxedPrecision 
                               OpDecorate %109 RelaxedPrecision 
                               OpDecorate %110 RelaxedPrecision 
                               OpDecorate %111 RelaxedPrecision 
                               OpDecorate %112 RelaxedPrecision 
                               OpDecorate %114 RelaxedPrecision 
                        %2 = OpTypeVoid 
                        %3 = OpTypeFunction %2 
                        %6 = OpTypeFloat 32 
                        %7 = OpTypeVector %6 3 
                        %8 = OpTypePointer Private %7 
         Private f32_3* %9 = OpVariable Private 
                       %10 = OpTypeVector %6 4 
                       %11 = OpTypePointer Input %10 
 Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                       %13 = OpTypeVector %6 2 
                   f32 %23 = OpConstant 3.674022E-40 
                 f32_2 %24 = OpConstantComposite %23 %23 
                       %28 = OpTypeInt 32 0 
                   u32 %29 = OpConstant 0 
                       %30 = OpTypePointer Private %6 
                   f32 %33 = OpConstant 3.674022E-40 
                   u32 %36 = OpConstant 1 
                   u32 %42 = OpConstant 2 
        Private f32_3* %44 = OpVariable Private 
 Input f32_4* vs_TEXCOORD1 = OpVariable Input 
        Private f32_3* %58 = OpVariable Private 
          Private f32* %77 = OpVariable Private 
                       %78 = OpTypeInt 32 1 
                       %79 = OpTypeStruct %78 
                       %80 = OpTypePointer Uniform %79 
Uniform struct {i32;}* %81 = OpVariable Uniform 
                   i32 %82 = OpConstant 0 
                       %83 = OpTypePointer Uniform %78 
                       %86 = OpTypeBool 
                   f32 %88 = OpConstant 3.674022E-40 
                       %90 = OpTypePointer Output %10 
         Output f32_4* %91 = OpVariable Output 
                      %103 = OpTypePointer Private %13 
       Private f32_2* %104 = OpVariable Private 
                  f32 %105 = OpConstant 3.674022E-40 
                  f32 %107 = OpConstant 3.674022E-40 
                f32_2 %113 = OpConstantComposite %88 %23 
                   void %4 = OpFunction None %3 
                        %5 = OpLabel 
                 f32_4 %14 = OpLoad vs_TEXCOORD0 
                 f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                 f32_4 %16 = OpLoad vs_TEXCOORD0 
                 f32_2 %17 = OpVectorShuffle %16 %16 3 3 
                 f32_2 %18 = OpFDiv %15 %17 
                 f32_3 %19 = OpLoad %9 
                 f32_3 %20 = OpVectorShuffle %19 %18 3 4 2 
                               OpStore %9 %20 
                 f32_3 %21 = OpLoad %9 
                 f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                 f32_2 %25 = OpFAdd %22 %24 
                 f32_3 %26 = OpLoad %9 
                 f32_3 %27 = OpVectorShuffle %26 %25 3 4 2 
                               OpStore %9 %27 
          Private f32* %31 = OpAccessChain %9 %29 
                   f32 %32 = OpLoad %31 
                   f32 %34 = OpFMul %32 %33 
          Private f32* %35 = OpAccessChain %9 %29 
                               OpStore %35 %34 
          Private f32* %37 = OpAccessChain %9 %36 
                   f32 %38 = OpLoad %37 
                   f32 %39 = OpFNegate %38 
                   f32 %40 = OpFMul %39 %33 
                   f32 %41 = OpFAdd %40 %23 
          Private f32* %43 = OpAccessChain %9 %42 
                               OpStore %43 %41 
                 f32_4 %46 = OpLoad vs_TEXCOORD1 
                 f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                 f32_4 %48 = OpLoad vs_TEXCOORD1 
                 f32_2 %49 = OpVectorShuffle %48 %48 3 3 
                 f32_2 %50 = OpFDiv %47 %49 
                 f32_3 %51 = OpLoad %44 
                 f32_3 %52 = OpVectorShuffle %51 %50 3 1 4 
                               OpStore %44 %52 
                 f32_3 %53 = OpLoad %44 
                 f32_2 %54 = OpVectorShuffle %53 %53 0 2 
                 f32_2 %55 = OpFAdd %54 %24 
                 f32_3 %56 = OpLoad %44 
                 f32_3 %57 = OpVectorShuffle %56 %55 3 1 4 
                               OpStore %44 %57 
          Private f32* %59 = OpAccessChain %44 %29 
                   f32 %60 = OpLoad %59 
                   f32 %61 = OpFMul %60 %33 
          Private f32* %62 = OpAccessChain %58 %29 
                               OpStore %62 %61 
          Private f32* %63 = OpAccessChain %44 %42 
                   f32 %64 = OpLoad %63 
                   f32 %65 = OpFNegate %64 
                   f32 %66 = OpFMul %65 %33 
                   f32 %67 = OpFAdd %66 %23 
          Private f32* %68 = OpAccessChain %58 %42 
                               OpStore %68 %67 
                 f32_3 %69 = OpLoad %9 
                 f32_2 %70 = OpVectorShuffle %69 %69 0 2 
                 f32_3 %71 = OpLoad %58 
                 f32_2 %72 = OpVectorShuffle %71 %71 0 2 
                 f32_2 %73 = OpFNegate %72 
                 f32_2 %74 = OpFAdd %70 %73 
                 f32_3 %75 = OpLoad %9 
                 f32_3 %76 = OpVectorShuffle %75 %74 3 4 2 
                               OpStore %9 %76 
          Uniform i32* %84 = OpAccessChain %81 %82 
                   i32 %85 = OpLoad %84 
                  bool %87 = OpINotEqual %85 %82 
                   f32 %89 = OpSelect %87 %23 %88 
                               OpStore %77 %89 
                   f32 %92 = OpLoad %77 
                 f32_2 %93 = OpCompositeConstruct %92 %92 
                 f32_3 %94 = OpLoad %9 
                 f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                 f32_2 %96 = OpFNegate %95 
                 f32_2 %97 = OpFMul %93 %96 
                 f32_3 %98 = OpLoad %9 
                 f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                f32_2 %100 = OpFAdd %97 %99 
                f32_4 %101 = OpLoad %91 
                f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                               OpStore %91 %102 
         Private f32* %106 = OpAccessChain %104 %29 
                               OpStore %106 %105 
         Private f32* %108 = OpAccessChain %104 %36 
                               OpStore %108 %107 
                  f32 %109 = OpLoad %77 
                f32_2 %110 = OpCompositeConstruct %109 %109 
                f32_2 %111 = OpLoad %104 
                f32_2 %112 = OpFMul %110 %111 
                f32_2 %114 = OpFAdd %112 %113 
                f32_4 %115 = OpLoad %91 
                f32_4 %116 = OpVectorShuffle %115 %114 0 1 4 5 
                               OpStore %91 %116 
                               OpReturn
                               OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 218
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %90 %155 %193 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpDecorate vs_TEXCOORD0 Location 80 
                                                      OpDecorate %90 Location 90 
                                                      OpDecorate vs_TEXCOORD1 Location 155 
                                                      OpMemberDecorate %191 0 BuiltIn 191 
                                                      OpMemberDecorate %191 1 BuiltIn 191 
                                                      OpMemberDecorate %191 2 BuiltIn 191 
                                                      OpDecorate %191 Block 
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
                                              %20 = OpTypeArray %7 %15 
                                              %21 = OpTypeInt 32 1 
                                              %22 = OpTypeStruct %16 %17 %18 %19 %20 %21 %6 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; f32_4[4]; i32; f32;}* %24 = OpVariable Uniform 
                                          i32 %25 = OpConstant 0 
                                          i32 %26 = OpConstant 1 
                                              %27 = OpTypePointer Uniform %7 
                                          i32 %38 = OpConstant 2 
                               Private f32_4* %46 = OpVariable Private 
                                          i32 %47 = OpConstant 3 
                               Private f32_4* %59 = OpVariable Private 
                                              %79 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                              %88 = OpTypeVector %6 3 
                                              %89 = OpTypePointer Input %88 
                                 Input f32_3* %90 = OpVariable Input 
                                          f32 %94 = OpConstant 3.674022E-40 
                                          u32 %95 = OpConstant 3 
                                              %96 = OpTypePointer Private %6 
                                          i32 %98 = OpConstant 5 
                                              %99 = OpTypePointer Uniform %21 
                                             %102 = OpTypeBool 
                                             %106 = OpTypeVector %102 4 
                                         i32 %111 = OpConstant 4 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         u32 %189 = OpConstant 1 
                                             %190 = OpTypeArray %6 %189 
                                             %191 = OpTypeStruct %7 %6 %190 
                                             %192 = OpTypePointer Output %191 
        Output struct {f32_4; f32; f32[1];}* %193 = OpVariable Output 
                                         i32 %194 = OpConstant 6 
                                             %195 = OpTypePointer Uniform %6 
                                         u32 %202 = OpConstant 2 
                                             %206 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %28 = OpAccessChain %24 %25 %26 
                                        f32_4 %29 = OpLoad %28 
                                        f32_4 %30 = OpFMul %13 %29 
                                                      OpStore %9 %30 
                               Uniform f32_4* %31 = OpAccessChain %24 %25 %25 
                                        f32_4 %32 = OpLoad %31 
                                        f32_4 %33 = OpLoad %11 
                                        f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 0 
                                        f32_4 %35 = OpFMul %32 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpFAdd %35 %36 
                                                      OpStore %9 %37 
                               Uniform f32_4* %39 = OpAccessChain %24 %25 %38 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpLoad %11 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 2 
                                        f32_4 %43 = OpFMul %40 %42 
                                        f32_4 %44 = OpLoad %9 
                                        f32_4 %45 = OpFAdd %43 %44 
                                                      OpStore %9 %45 
                               Uniform f32_4* %48 = OpAccessChain %24 %25 %47 
                                        f32_4 %49 = OpLoad %48 
                                        f32_4 %50 = OpLoad %11 
                                        f32_4 %51 = OpVectorShuffle %50 %50 3 3 3 3 
                                        f32_4 %52 = OpFMul %49 %51 
                                        f32_4 %53 = OpLoad %9 
                                        f32_4 %54 = OpFAdd %52 %53 
                                                      OpStore %46 %54 
                                        f32_4 %55 = OpLoad %9 
                               Uniform f32_4* %56 = OpAccessChain %24 %25 %47 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpFAdd %55 %57 
                                                      OpStore %9 %58 
                                        f32_4 %60 = OpLoad %46 
                                        f32_4 %61 = OpVectorShuffle %60 %60 1 1 1 1 
                               Uniform f32_4* %62 = OpAccessChain %24 %38 %26 
                                        f32_4 %63 = OpLoad %62 
                                        f32_4 %64 = OpFMul %61 %63 
                                                      OpStore %59 %64 
                               Uniform f32_4* %65 = OpAccessChain %24 %38 %25 
                                        f32_4 %66 = OpLoad %65 
                                        f32_4 %67 = OpLoad %46 
                                        f32_4 %68 = OpVectorShuffle %67 %67 0 0 0 0 
                                        f32_4 %69 = OpFMul %66 %68 
                                        f32_4 %70 = OpLoad %59 
                                        f32_4 %71 = OpFAdd %69 %70 
                                                      OpStore %59 %71 
                               Uniform f32_4* %72 = OpAccessChain %24 %38 %38 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpLoad %46 
                                        f32_4 %75 = OpVectorShuffle %74 %74 2 2 2 2 
                                        f32_4 %76 = OpFMul %73 %75 
                                        f32_4 %77 = OpLoad %59 
                                        f32_4 %78 = OpFAdd %76 %77 
                                                      OpStore %59 %78 
                               Uniform f32_4* %81 = OpAccessChain %24 %38 %47 
                                        f32_4 %82 = OpLoad %81 
                                        f32_4 %83 = OpLoad %46 
                                        f32_4 %84 = OpVectorShuffle %83 %83 3 3 3 3 
                                        f32_4 %85 = OpFMul %82 %84 
                                        f32_4 %86 = OpLoad %59 
                                        f32_4 %87 = OpFAdd %85 %86 
                                                      OpStore vs_TEXCOORD0 %87 
                                        f32_3 %91 = OpLoad %90 
                                        f32_4 %92 = OpLoad %46 
                                        f32_4 %93 = OpVectorShuffle %92 %91 4 5 6 3 
                                                      OpStore %46 %93 
                                 Private f32* %97 = OpAccessChain %46 %95 
                                                      OpStore %97 %94 
                                Uniform i32* %100 = OpAccessChain %24 %98 
                                         i32 %101 = OpLoad %100 
                                        bool %103 = OpINotEqual %101 %25 
                                       f32_4 %104 = OpLoad %46 
                                       f32_4 %105 = OpLoad %11 
                                      bool_4 %107 = OpCompositeConstruct %103 %103 %103 %103 
                                       f32_4 %108 = OpSelect %107 %104 %105 
                                                      OpStore %46 %108 
                                       f32_4 %109 = OpLoad %46 
                                       f32_4 %110 = OpVectorShuffle %109 %109 1 1 1 1 
                              Uniform f32_4* %112 = OpAccessChain %24 %111 %26 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpFMul %110 %113 
                                                      OpStore %59 %114 
                              Uniform f32_4* %115 = OpAccessChain %24 %111 %25 
                                       f32_4 %116 = OpLoad %115 
                                       f32_4 %117 = OpLoad %46 
                                       f32_4 %118 = OpVectorShuffle %117 %117 0 0 0 0 
                                       f32_4 %119 = OpFMul %116 %118 
                                       f32_4 %120 = OpLoad %59 
                                       f32_4 %121 = OpFAdd %119 %120 
                                                      OpStore %59 %121 
                              Uniform f32_4* %122 = OpAccessChain %24 %111 %38 
                                       f32_4 %123 = OpLoad %122 
                                       f32_4 %124 = OpLoad %46 
                                       f32_4 %125 = OpVectorShuffle %124 %124 2 2 2 2 
                                       f32_4 %126 = OpFMul %123 %125 
                                       f32_4 %127 = OpLoad %59 
                                       f32_4 %128 = OpFAdd %126 %127 
                                                      OpStore %59 %128 
                              Uniform f32_4* %129 = OpAccessChain %24 %111 %47 
                                       f32_4 %130 = OpLoad %129 
                                       f32_4 %131 = OpLoad %46 
                                       f32_4 %132 = OpVectorShuffle %131 %131 3 3 3 3 
                                       f32_4 %133 = OpFMul %130 %132 
                                       f32_4 %134 = OpLoad %59 
                                       f32_4 %135 = OpFAdd %133 %134 
                                                      OpStore %46 %135 
                                       f32_4 %136 = OpLoad %46 
                                       f32_4 %137 = OpVectorShuffle %136 %136 1 1 1 1 
                              Uniform f32_4* %138 = OpAccessChain %24 %47 %26 
                                       f32_4 %139 = OpLoad %138 
                                       f32_4 %140 = OpFMul %137 %139 
                                                      OpStore %59 %140 
                              Uniform f32_4* %141 = OpAccessChain %24 %47 %25 
                                       f32_4 %142 = OpLoad %141 
                                       f32_4 %143 = OpLoad %46 
                                       f32_4 %144 = OpVectorShuffle %143 %143 0 0 0 0 
                                       f32_4 %145 = OpFMul %142 %144 
                                       f32_4 %146 = OpLoad %59 
                                       f32_4 %147 = OpFAdd %145 %146 
                                                      OpStore %59 %147 
                              Uniform f32_4* %148 = OpAccessChain %24 %47 %38 
                                       f32_4 %149 = OpLoad %148 
                                       f32_4 %150 = OpLoad %46 
                                       f32_4 %151 = OpVectorShuffle %150 %150 2 2 2 2 
                                       f32_4 %152 = OpFMul %149 %151 
                                       f32_4 %153 = OpLoad %59 
                                       f32_4 %154 = OpFAdd %152 %153 
                                                      OpStore %59 %154 
                              Uniform f32_4* %156 = OpAccessChain %24 %47 %47 
                                       f32_4 %157 = OpLoad %156 
                                       f32_4 %158 = OpLoad %46 
                                       f32_4 %159 = OpVectorShuffle %158 %158 3 3 3 3 
                                       f32_4 %160 = OpFMul %157 %159 
                                       f32_4 %161 = OpLoad %59 
                                       f32_4 %162 = OpFAdd %160 %161 
                                                      OpStore vs_TEXCOORD1 %162 
                                       f32_4 %163 = OpLoad %9 
                                       f32_4 %164 = OpVectorShuffle %163 %163 1 1 1 1 
                              Uniform f32_4* %165 = OpAccessChain %24 %26 %26 
                                       f32_4 %166 = OpLoad %165 
                                       f32_4 %167 = OpFMul %164 %166 
                                                      OpStore %46 %167 
                              Uniform f32_4* %168 = OpAccessChain %24 %26 %25 
                                       f32_4 %169 = OpLoad %168 
                                       f32_4 %170 = OpLoad %9 
                                       f32_4 %171 = OpVectorShuffle %170 %170 0 0 0 0 
                                       f32_4 %172 = OpFMul %169 %171 
                                       f32_4 %173 = OpLoad %46 
                                       f32_4 %174 = OpFAdd %172 %173 
                                                      OpStore %46 %174 
                              Uniform f32_4* %175 = OpAccessChain %24 %26 %38 
                                       f32_4 %176 = OpLoad %175 
                                       f32_4 %177 = OpLoad %9 
                                       f32_4 %178 = OpVectorShuffle %177 %177 2 2 2 2 
                                       f32_4 %179 = OpFMul %176 %178 
                                       f32_4 %180 = OpLoad %46 
                                       f32_4 %181 = OpFAdd %179 %180 
                                                      OpStore %46 %181 
                              Uniform f32_4* %182 = OpAccessChain %24 %26 %47 
                                       f32_4 %183 = OpLoad %182 
                                       f32_4 %184 = OpLoad %9 
                                       f32_4 %185 = OpVectorShuffle %184 %184 3 3 3 3 
                                       f32_4 %186 = OpFMul %183 %185 
                                       f32_4 %187 = OpLoad %46 
                                       f32_4 %188 = OpFAdd %186 %187 
                                                      OpStore %9 %188 
                                Uniform f32* %196 = OpAccessChain %24 %194 
                                         f32 %197 = OpLoad %196 
                                         f32 %198 = OpFNegate %197 
                                Private f32* %199 = OpAccessChain %9 %95 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFMul %198 %200 
                                Private f32* %203 = OpAccessChain %9 %202 
                                         f32 %204 = OpLoad %203 
                                         f32 %205 = OpFAdd %201 %204 
                                 Output f32* %207 = OpAccessChain %193 %25 %202 
                                                      OpStore %207 %205 
                                       f32_4 %208 = OpLoad %9 
                                       f32_3 %209 = OpVectorShuffle %208 %208 0 1 3 
                               Output f32_4* %210 = OpAccessChain %193 %25 
                                       f32_4 %211 = OpLoad %210 
                                       f32_4 %212 = OpVectorShuffle %211 %209 4 5 2 6 
                                                      OpStore %210 %212 
                                 Output f32* %213 = OpAccessChain %193 %25 %189 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFNegate %214 
                                 Output f32* %216 = OpAccessChain %193 %25 %189 
                                                      OpStore %216 %215 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                               OpCapability Shader 
                        %1 = OpExtInstImport "GLSL.std.450" 
                               OpMemoryModel Logical GLSL450 
                               OpEntryPoint Fragment %4 "main" %12 %45 %91 
                               OpExecutionMode %4 OriginUpperLeft 
                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                               OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                               OpDecorate vs_TEXCOORD0 Location 12 
                               OpDecorate vs_TEXCOORD1 Location 45 
                               OpDecorate %77 RelaxedPrecision 
                               OpMemberDecorate %79 0 Offset 79 
                               OpDecorate %79 Block 
                               OpDecorate %81 DescriptorSet 81 
                               OpDecorate %81 Binding 81 
                               OpDecorate %91 RelaxedPrecision 
                               OpDecorate %91 Location 91 
                               OpDecorate %92 RelaxedPrecision 
                               OpDecorate %104 RelaxedPrecision 
                               OpDecorate %109 RelaxedPrecision 
                               OpDecorate %110 RelaxedPrecision 
                               OpDecorate %111 RelaxedPrecision 
                               OpDecorate %112 RelaxedPrecision 
                               OpDecorate %114 RelaxedPrecision 
                        %2 = OpTypeVoid 
                        %3 = OpTypeFunction %2 
                        %6 = OpTypeFloat 32 
                        %7 = OpTypeVector %6 3 
                        %8 = OpTypePointer Private %7 
         Private f32_3* %9 = OpVariable Private 
                       %10 = OpTypeVector %6 4 
                       %11 = OpTypePointer Input %10 
 Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                       %13 = OpTypeVector %6 2 
                   f32 %23 = OpConstant 3.674022E-40 
                 f32_2 %24 = OpConstantComposite %23 %23 
                       %28 = OpTypeInt 32 0 
                   u32 %29 = OpConstant 0 
                       %30 = OpTypePointer Private %6 
                   f32 %33 = OpConstant 3.674022E-40 
                   u32 %36 = OpConstant 1 
                   u32 %42 = OpConstant 2 
        Private f32_3* %44 = OpVariable Private 
 Input f32_4* vs_TEXCOORD1 = OpVariable Input 
        Private f32_3* %58 = OpVariable Private 
          Private f32* %77 = OpVariable Private 
                       %78 = OpTypeInt 32 1 
                       %79 = OpTypeStruct %78 
                       %80 = OpTypePointer Uniform %79 
Uniform struct {i32;}* %81 = OpVariable Uniform 
                   i32 %82 = OpConstant 0 
                       %83 = OpTypePointer Uniform %78 
                       %86 = OpTypeBool 
                   f32 %88 = OpConstant 3.674022E-40 
                       %90 = OpTypePointer Output %10 
         Output f32_4* %91 = OpVariable Output 
                      %103 = OpTypePointer Private %13 
       Private f32_2* %104 = OpVariable Private 
                  f32 %105 = OpConstant 3.674022E-40 
                  f32 %107 = OpConstant 3.674022E-40 
                f32_2 %113 = OpConstantComposite %88 %23 
                   void %4 = OpFunction None %3 
                        %5 = OpLabel 
                 f32_4 %14 = OpLoad vs_TEXCOORD0 
                 f32_2 %15 = OpVectorShuffle %14 %14 0 1 
                 f32_4 %16 = OpLoad vs_TEXCOORD0 
                 f32_2 %17 = OpVectorShuffle %16 %16 3 3 
                 f32_2 %18 = OpFDiv %15 %17 
                 f32_3 %19 = OpLoad %9 
                 f32_3 %20 = OpVectorShuffle %19 %18 3 4 2 
                               OpStore %9 %20 
                 f32_3 %21 = OpLoad %9 
                 f32_2 %22 = OpVectorShuffle %21 %21 0 1 
                 f32_2 %25 = OpFAdd %22 %24 
                 f32_3 %26 = OpLoad %9 
                 f32_3 %27 = OpVectorShuffle %26 %25 3 4 2 
                               OpStore %9 %27 
          Private f32* %31 = OpAccessChain %9 %29 
                   f32 %32 = OpLoad %31 
                   f32 %34 = OpFMul %32 %33 
          Private f32* %35 = OpAccessChain %9 %29 
                               OpStore %35 %34 
          Private f32* %37 = OpAccessChain %9 %36 
                   f32 %38 = OpLoad %37 
                   f32 %39 = OpFNegate %38 
                   f32 %40 = OpFMul %39 %33 
                   f32 %41 = OpFAdd %40 %23 
          Private f32* %43 = OpAccessChain %9 %42 
                               OpStore %43 %41 
                 f32_4 %46 = OpLoad vs_TEXCOORD1 
                 f32_2 %47 = OpVectorShuffle %46 %46 0 1 
                 f32_4 %48 = OpLoad vs_TEXCOORD1 
                 f32_2 %49 = OpVectorShuffle %48 %48 3 3 
                 f32_2 %50 = OpFDiv %47 %49 
                 f32_3 %51 = OpLoad %44 
                 f32_3 %52 = OpVectorShuffle %51 %50 3 1 4 
                               OpStore %44 %52 
                 f32_3 %53 = OpLoad %44 
                 f32_2 %54 = OpVectorShuffle %53 %53 0 2 
                 f32_2 %55 = OpFAdd %54 %24 
                 f32_3 %56 = OpLoad %44 
                 f32_3 %57 = OpVectorShuffle %56 %55 3 1 4 
                               OpStore %44 %57 
          Private f32* %59 = OpAccessChain %44 %29 
                   f32 %60 = OpLoad %59 
                   f32 %61 = OpFMul %60 %33 
          Private f32* %62 = OpAccessChain %58 %29 
                               OpStore %62 %61 
          Private f32* %63 = OpAccessChain %44 %42 
                   f32 %64 = OpLoad %63 
                   f32 %65 = OpFNegate %64 
                   f32 %66 = OpFMul %65 %33 
                   f32 %67 = OpFAdd %66 %23 
          Private f32* %68 = OpAccessChain %58 %42 
                               OpStore %68 %67 
                 f32_3 %69 = OpLoad %9 
                 f32_2 %70 = OpVectorShuffle %69 %69 0 2 
                 f32_3 %71 = OpLoad %58 
                 f32_2 %72 = OpVectorShuffle %71 %71 0 2 
                 f32_2 %73 = OpFNegate %72 
                 f32_2 %74 = OpFAdd %70 %73 
                 f32_3 %75 = OpLoad %9 
                 f32_3 %76 = OpVectorShuffle %75 %74 3 4 2 
                               OpStore %9 %76 
          Uniform i32* %84 = OpAccessChain %81 %82 
                   i32 %85 = OpLoad %84 
                  bool %87 = OpINotEqual %85 %82 
                   f32 %89 = OpSelect %87 %23 %88 
                               OpStore %77 %89 
                   f32 %92 = OpLoad %77 
                 f32_2 %93 = OpCompositeConstruct %92 %92 
                 f32_3 %94 = OpLoad %9 
                 f32_2 %95 = OpVectorShuffle %94 %94 0 1 
                 f32_2 %96 = OpFNegate %95 
                 f32_2 %97 = OpFMul %93 %96 
                 f32_3 %98 = OpLoad %9 
                 f32_2 %99 = OpVectorShuffle %98 %98 0 1 
                f32_2 %100 = OpFAdd %97 %99 
                f32_4 %101 = OpLoad %91 
                f32_4 %102 = OpVectorShuffle %101 %100 4 5 2 3 
                               OpStore %91 %102 
         Private f32* %106 = OpAccessChain %104 %29 
                               OpStore %106 %105 
         Private f32* %108 = OpAccessChain %104 %36 
                               OpStore %108 %107 
                  f32 %109 = OpLoad %77 
                f32_2 %110 = OpCompositeConstruct %109 %109 
                f32_2 %111 = OpLoad %104 
                f32_2 %112 = OpFMul %110 %111 
                f32_2 %114 = OpFAdd %112 %113 
                f32_4 %115 = OpLoad %91 
                f32_4 %116 = OpVectorShuffle %115 %114 0 1 4 5 
                               OpStore %91 %116 
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
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 71716
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD0.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PreviousVP[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[3].xyw * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat1.xy = u_xlat1.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_NonJitteredVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4x4_NonJitteredVP[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[2].xyw * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[3].xyw * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-u_xlat1.xy);
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 1.0);
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD0.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PreviousVP[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[3].xyw * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat1.xy = u_xlat1.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_NonJitteredVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4x4_NonJitteredVP[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[2].xyw * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[3].xyw * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-u_xlat1.xy);
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 1.0);
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD0.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
void main()
{
    u_xlat0.x = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat0.x = _ZBufferParams.x * u_xlat0.x + _ZBufferParams.y;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat3.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat3.xyz = u_xlat3.xxx * vs_TEXCOORD1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat3.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PreviousVP[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[3].xyw * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat1.xy = u_xlat1.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_NonJitteredVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4x4_NonJitteredVP[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[2].xyw * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[3].xyw * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-u_xlat1.xy);
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %79 %105 %113 %115 
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
                                                     OpMemberDecorate %77 0 BuiltIn 77 
                                                     OpMemberDecorate %77 1 BuiltIn 77 
                                                     OpMemberDecorate %77 2 BuiltIn 77 
                                                     OpDecorate %77 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 105 
                                                     OpDecorate vs_TEXCOORD1 Location 113 
                                                     OpDecorate %115 Location 115 
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
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypeArray %6 %75 
                                             %77 = OpTypeStruct %7 %6 %76 
                                             %78 = OpTypePointer Output %77 
        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                             %81 = OpTypePointer Output %7 
                                             %83 = OpTypePointer Private %6 
                                Private f32* %84 = OpVariable Private 
                                         u32 %87 = OpConstant 0 
                                             %88 = OpTypePointer Uniform %6 
                                             %92 = OpTypeVector %6 2 
                                         f32 %95 = OpConstant 3.674022E-40 
                                       f32_2 %96 = OpConstantComposite %95 %95 
                                        u32 %102 = OpConstant 3 
                                            %104 = OpTypePointer Output %92 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %111 = OpTypeVector %6 3 
                                            %112 = OpTypePointer Output %111 
                      Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                            %114 = OpTypePointer Input %111 
                               Input f32_3* %115 = OpVariable Input 
                                            %117 = OpTypePointer Output %6 
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
                                       f32_4 %80 = OpLoad %9 
                               Output f32_4* %82 = OpAccessChain %79 %27 
                                                     OpStore %82 %80 
                                Private f32* %85 = OpAccessChain %9 %75 
                                         f32 %86 = OpLoad %85 
                                Uniform f32* %89 = OpAccessChain %20 %27 %87 
                                         f32 %90 = OpLoad %89 
                                         f32 %91 = OpFMul %86 %90 
                                                     OpStore %84 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                       f32_2 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %9 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 1 5 3 
                                                     OpStore %9 %99 
                                        f32 %100 = OpLoad %84 
                                        f32 %101 = OpFMul %100 %95 
                               Private f32* %103 = OpAccessChain %9 %102 
                                                     OpStore %103 %101 
                                      f32_4 %106 = OpLoad %9 
                                      f32_2 %107 = OpVectorShuffle %106 %106 2 2 
                                      f32_4 %108 = OpLoad %9 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 3 
                                      f32_2 %110 = OpFAdd %107 %109 
                                                     OpStore vs_TEXCOORD0 %110 
                                      f32_3 %116 = OpLoad %115 
                                                     OpStore vs_TEXCOORD1 %116 
                                Output f32* %118 = OpAccessChain %79 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %79 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 249
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %63 %239 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD0 Location 22 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpDecorate %33 ArrayStride 33 
                                                      OpMemberDecorate %34 0 Offset 34 
                                                      OpMemberDecorate %34 1 Offset 34 
                                                      OpMemberDecorate %34 2 Offset 34 
                                                      OpMemberDecorate %34 3 Offset 34 
                                                      OpMemberDecorate %34 4 Offset 34 
                                                      OpDecorate %34 Block 
                                                      OpDecorate %36 DescriptorSet 36 
                                                      OpDecorate %36 Binding 36 
                                                      OpDecorate vs_TEXCOORD1 Location 63 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          u32 %30 = OpConstant 4 
                                              %31 = OpTypeArray %7 %30 
                                              %32 = OpTypeArray %7 %30 
                                              %33 = OpTypeArray %7 %30 
                                              %34 = OpTypeStruct %7 %7 %31 %32 %33 
                                              %35 = OpTypePointer Uniform %34 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %36 = OpVariable Uniform 
                                              %37 = OpTypeInt 32 1 
                                          i32 %38 = OpConstant 1 
                                              %39 = OpTypePointer Uniform %6 
                                          u32 %45 = OpConstant 1 
                                          f32 %50 = OpConstant 3.674022E-40 
                                              %55 = OpTypeVector %6 3 
                                              %56 = OpTypePointer Private %55 
                               Private f32_3* %57 = OpVariable Private 
                                          i32 %58 = OpConstant 0 
                                          u32 %59 = OpConstant 2 
                                              %62 = OpTypePointer Input %55 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %64 = OpTypePointer Input %6 
                               Private f32_4* %79 = OpVariable Private 
                                          i32 %82 = OpConstant 2 
                                              %83 = OpTypePointer Uniform %7 
                                         i32 %102 = OpConstant 3 
                                         i32 %108 = OpConstant 4 
                                       f32_2 %157 = OpConstantComposite %50 %50 
                                         f32 %163 = OpConstant 3.674022E-40 
                              Private f32_3* %172 = OpVariable Private 
                                             %238 = OpTypePointer Output %7 
                               Output f32_4* %239 = OpVariable Output 
                                         f32 %244 = OpConstant 3.674022E-40 
                                       f32_2 %245 = OpConstantComposite %244 %50 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                          f32 %27 = OpCompositeExtract %24 0 
                                 Private f32* %29 = OpAccessChain %9 %26 
                                                      OpStore %29 %27 
                                 Uniform f32* %40 = OpAccessChain %36 %38 %26 
                                          f32 %41 = OpLoad %40 
                                 Private f32* %42 = OpAccessChain %9 %26 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFMul %41 %43 
                                 Uniform f32* %46 = OpAccessChain %36 %38 %45 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %44 %47 
                                 Private f32* %49 = OpAccessChain %9 %26 
                                                      OpStore %49 %48 
                                 Private f32* %51 = OpAccessChain %9 %26 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFDiv %50 %52 
                                 Private f32* %54 = OpAccessChain %9 %26 
                                                      OpStore %54 %53 
                                 Uniform f32* %60 = OpAccessChain %36 %58 %59 
                                          f32 %61 = OpLoad %60 
                                   Input f32* %65 = OpAccessChain vs_TEXCOORD1 %59 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFDiv %61 %66 
                                 Private f32* %68 = OpAccessChain %57 %26 
                                                      OpStore %68 %67 
                                        f32_3 %69 = OpLoad %57 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 0 0 
                                        f32_3 %71 = OpLoad vs_TEXCOORD1 
                                        f32_3 %72 = OpFMul %70 %71 
                                                      OpStore %57 %72 
                                        f32_4 %73 = OpLoad %9 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 0 0 
                                        f32_3 %75 = OpLoad %57 
                                        f32_3 %76 = OpFMul %74 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %9 %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %80 1 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %36 %82 %38 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpFMul %81 %85 
                                                      OpStore %79 %86 
                               Uniform f32_4* %87 = OpAccessChain %36 %82 %58 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_4 %90 = OpVectorShuffle %89 %89 0 0 0 0 
                                        f32_4 %91 = OpFMul %88 %90 
                                        f32_4 %92 = OpLoad %79 
                                        f32_4 %93 = OpFAdd %91 %92 
                                                      OpStore %79 %93 
                               Uniform f32_4* %94 = OpAccessChain %36 %82 %82 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_4 %97 = OpVectorShuffle %96 %96 2 2 2 2 
                                        f32_4 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %79 
                                       f32_4 %100 = OpFAdd %98 %99 
                                                      OpStore %9 %100 
                                       f32_4 %101 = OpLoad %9 
                              Uniform f32_4* %103 = OpAccessChain %36 %82 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpFAdd %101 %104 
                                                      OpStore %9 %105 
                                       f32_4 %106 = OpLoad %9 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                              Uniform f32_4* %109 = OpAccessChain %36 %108 %38 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 3 
                                       f32_3 %112 = OpFMul %107 %111 
                                       f32_4 %113 = OpLoad %79 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 6 3 
                                                      OpStore %79 %114 
                              Uniform f32_4* %115 = OpAccessChain %36 %108 %58 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 3 
                                       f32_4 %118 = OpLoad %9 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 0 0 
                                       f32_3 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %79 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %79 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %79 %125 
                              Uniform f32_4* %126 = OpAccessChain %36 %108 %82 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 3 
                                       f32_4 %129 = OpLoad %9 
                                       f32_3 %130 = OpVectorShuffle %129 %129 2 2 2 
                                       f32_3 %131 = OpFMul %128 %130 
                                       f32_4 %132 = OpLoad %79 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFAdd %131 %133 
                                       f32_4 %135 = OpLoad %79 
                                       f32_4 %136 = OpVectorShuffle %135 %134 4 5 6 3 
                                                      OpStore %79 %136 
                              Uniform f32_4* %137 = OpAccessChain %36 %108 %102 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 3 
                                       f32_4 %140 = OpLoad %9 
                                       f32_3 %141 = OpVectorShuffle %140 %140 3 3 3 
                                       f32_3 %142 = OpFMul %139 %141 
                                       f32_4 %143 = OpLoad %79 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFAdd %142 %144 
                                       f32_4 %146 = OpLoad %79 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %79 %147 
                                       f32_4 %148 = OpLoad %79 
                                       f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                       f32_4 %150 = OpLoad %79 
                                       f32_2 %151 = OpVectorShuffle %150 %150 2 2 
                                       f32_2 %152 = OpFDiv %149 %151 
                                       f32_4 %153 = OpLoad %79 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 2 3 
                                                      OpStore %79 %154 
                                       f32_4 %155 = OpLoad %79 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 1 
                                       f32_2 %158 = OpFAdd %156 %157 
                                       f32_4 %159 = OpLoad %79 
                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 2 3 
                                                      OpStore %79 %160 
                                Private f32* %161 = OpAccessChain %79 %26 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpFMul %162 %163 
                                Private f32* %165 = OpAccessChain %79 %26 
                                                      OpStore %165 %164 
                                Private f32* %166 = OpAccessChain %79 %45 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFNegate %167 
                                         f32 %169 = OpFMul %168 %163 
                                         f32 %170 = OpFAdd %169 %50 
                                Private f32* %171 = OpAccessChain %79 %59 
                                                      OpStore %171 %170 
                                       f32_4 %173 = OpLoad %9 
                                       f32_3 %174 = OpVectorShuffle %173 %173 1 1 1 
                              Uniform f32_4* %175 = OpAccessChain %36 %102 %38 
                                       f32_4 %176 = OpLoad %175 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 3 
                                       f32_3 %178 = OpFMul %174 %177 
                                                      OpStore %172 %178 
                              Uniform f32_4* %179 = OpAccessChain %36 %102 %58 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 3 
                                       f32_4 %182 = OpLoad %9 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 0 0 
                                       f32_3 %184 = OpFMul %181 %183 
                                       f32_3 %185 = OpLoad %172 
                                       f32_3 %186 = OpFAdd %184 %185 
                                                      OpStore %172 %186 
                              Uniform f32_4* %187 = OpAccessChain %36 %102 %82 
                                       f32_4 %188 = OpLoad %187 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 3 
                                       f32_4 %190 = OpLoad %9 
                                       f32_3 %191 = OpVectorShuffle %190 %190 2 2 2 
                                       f32_3 %192 = OpFMul %189 %191 
                                       f32_3 %193 = OpLoad %172 
                                       f32_3 %194 = OpFAdd %192 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %9 %196 
                              Uniform f32_4* %197 = OpAccessChain %36 %102 %102 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 3 
                                       f32_4 %200 = OpLoad %9 
                                       f32_3 %201 = OpVectorShuffle %200 %200 3 3 3 
                                       f32_3 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %9 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpFAdd %202 %204 
                                       f32_4 %206 = OpLoad %9 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %9 %207 
                                       f32_4 %208 = OpLoad %9 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_4 %210 = OpLoad %9 
                                       f32_2 %211 = OpVectorShuffle %210 %210 2 2 
                                       f32_2 %212 = OpFDiv %209 %211 
                                       f32_4 %213 = OpLoad %9 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 2 3 
                                                      OpStore %9 %214 
                                       f32_4 %215 = OpLoad %9 
                                       f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                                       f32_2 %217 = OpFAdd %216 %157 
                                       f32_4 %218 = OpLoad %9 
                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
                                                      OpStore %9 %219 
                                Private f32* %220 = OpAccessChain %9 %26 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFMul %221 %163 
                                Private f32* %223 = OpAccessChain %9 %26 
                                                      OpStore %223 %222 
                                Private f32* %224 = OpAccessChain %9 %45 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFNegate %225 
                                         f32 %227 = OpFMul %226 %163 
                                         f32 %228 = OpFAdd %227 %50 
                                Private f32* %229 = OpAccessChain %9 %59 
                                                      OpStore %229 %228 
                                       f32_4 %230 = OpLoad %79 
                                       f32_2 %231 = OpVectorShuffle %230 %230 0 2 
                                       f32_2 %232 = OpFNegate %231 
                                       f32_4 %233 = OpLoad %9 
                                       f32_2 %234 = OpVectorShuffle %233 %233 0 2 
                                       f32_2 %235 = OpFAdd %232 %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpVectorShuffle %236 %235 4 5 2 3 
                                                      OpStore %9 %237 
                                       f32_4 %240 = OpLoad %9 
                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
                                       f32_4 %242 = OpLoad %239 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 2 3 
                                                      OpStore %239 %243 
                                       f32_4 %246 = OpLoad %239 
                                       f32_4 %247 = OpVectorShuffle %246 %245 0 1 4 5 
                                                      OpStore %239 %247 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %79 %105 %113 %115 
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
                                                     OpMemberDecorate %77 0 BuiltIn 77 
                                                     OpMemberDecorate %77 1 BuiltIn 77 
                                                     OpMemberDecorate %77 2 BuiltIn 77 
                                                     OpDecorate %77 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 105 
                                                     OpDecorate vs_TEXCOORD1 Location 113 
                                                     OpDecorate %115 Location 115 
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
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypeArray %6 %75 
                                             %77 = OpTypeStruct %7 %6 %76 
                                             %78 = OpTypePointer Output %77 
        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                             %81 = OpTypePointer Output %7 
                                             %83 = OpTypePointer Private %6 
                                Private f32* %84 = OpVariable Private 
                                         u32 %87 = OpConstant 0 
                                             %88 = OpTypePointer Uniform %6 
                                             %92 = OpTypeVector %6 2 
                                         f32 %95 = OpConstant 3.674022E-40 
                                       f32_2 %96 = OpConstantComposite %95 %95 
                                        u32 %102 = OpConstant 3 
                                            %104 = OpTypePointer Output %92 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %111 = OpTypeVector %6 3 
                                            %112 = OpTypePointer Output %111 
                      Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                            %114 = OpTypePointer Input %111 
                               Input f32_3* %115 = OpVariable Input 
                                            %117 = OpTypePointer Output %6 
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
                                       f32_4 %80 = OpLoad %9 
                               Output f32_4* %82 = OpAccessChain %79 %27 
                                                     OpStore %82 %80 
                                Private f32* %85 = OpAccessChain %9 %75 
                                         f32 %86 = OpLoad %85 
                                Uniform f32* %89 = OpAccessChain %20 %27 %87 
                                         f32 %90 = OpLoad %89 
                                         f32 %91 = OpFMul %86 %90 
                                                     OpStore %84 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                       f32_2 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %9 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 1 5 3 
                                                     OpStore %9 %99 
                                        f32 %100 = OpLoad %84 
                                        f32 %101 = OpFMul %100 %95 
                               Private f32* %103 = OpAccessChain %9 %102 
                                                     OpStore %103 %101 
                                      f32_4 %106 = OpLoad %9 
                                      f32_2 %107 = OpVectorShuffle %106 %106 2 2 
                                      f32_4 %108 = OpLoad %9 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 3 
                                      f32_2 %110 = OpFAdd %107 %109 
                                                     OpStore vs_TEXCOORD0 %110 
                                      f32_3 %116 = OpLoad %115 
                                                     OpStore vs_TEXCOORD1 %116 
                                Output f32* %118 = OpAccessChain %79 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %79 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 249
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %63 %239 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD0 Location 22 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpDecorate %33 ArrayStride 33 
                                                      OpMemberDecorate %34 0 Offset 34 
                                                      OpMemberDecorate %34 1 Offset 34 
                                                      OpMemberDecorate %34 2 Offset 34 
                                                      OpMemberDecorate %34 3 Offset 34 
                                                      OpMemberDecorate %34 4 Offset 34 
                                                      OpDecorate %34 Block 
                                                      OpDecorate %36 DescriptorSet 36 
                                                      OpDecorate %36 Binding 36 
                                                      OpDecorate vs_TEXCOORD1 Location 63 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          u32 %30 = OpConstant 4 
                                              %31 = OpTypeArray %7 %30 
                                              %32 = OpTypeArray %7 %30 
                                              %33 = OpTypeArray %7 %30 
                                              %34 = OpTypeStruct %7 %7 %31 %32 %33 
                                              %35 = OpTypePointer Uniform %34 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %36 = OpVariable Uniform 
                                              %37 = OpTypeInt 32 1 
                                          i32 %38 = OpConstant 1 
                                              %39 = OpTypePointer Uniform %6 
                                          u32 %45 = OpConstant 1 
                                          f32 %50 = OpConstant 3.674022E-40 
                                              %55 = OpTypeVector %6 3 
                                              %56 = OpTypePointer Private %55 
                               Private f32_3* %57 = OpVariable Private 
                                          i32 %58 = OpConstant 0 
                                          u32 %59 = OpConstant 2 
                                              %62 = OpTypePointer Input %55 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %64 = OpTypePointer Input %6 
                               Private f32_4* %79 = OpVariable Private 
                                          i32 %82 = OpConstant 2 
                                              %83 = OpTypePointer Uniform %7 
                                         i32 %102 = OpConstant 3 
                                         i32 %108 = OpConstant 4 
                                       f32_2 %157 = OpConstantComposite %50 %50 
                                         f32 %163 = OpConstant 3.674022E-40 
                              Private f32_3* %172 = OpVariable Private 
                                             %238 = OpTypePointer Output %7 
                               Output f32_4* %239 = OpVariable Output 
                                         f32 %244 = OpConstant 3.674022E-40 
                                       f32_2 %245 = OpConstantComposite %244 %50 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                          f32 %27 = OpCompositeExtract %24 0 
                                 Private f32* %29 = OpAccessChain %9 %26 
                                                      OpStore %29 %27 
                                 Uniform f32* %40 = OpAccessChain %36 %38 %26 
                                          f32 %41 = OpLoad %40 
                                 Private f32* %42 = OpAccessChain %9 %26 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFMul %41 %43 
                                 Uniform f32* %46 = OpAccessChain %36 %38 %45 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %44 %47 
                                 Private f32* %49 = OpAccessChain %9 %26 
                                                      OpStore %49 %48 
                                 Private f32* %51 = OpAccessChain %9 %26 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFDiv %50 %52 
                                 Private f32* %54 = OpAccessChain %9 %26 
                                                      OpStore %54 %53 
                                 Uniform f32* %60 = OpAccessChain %36 %58 %59 
                                          f32 %61 = OpLoad %60 
                                   Input f32* %65 = OpAccessChain vs_TEXCOORD1 %59 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFDiv %61 %66 
                                 Private f32* %68 = OpAccessChain %57 %26 
                                                      OpStore %68 %67 
                                        f32_3 %69 = OpLoad %57 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 0 0 
                                        f32_3 %71 = OpLoad vs_TEXCOORD1 
                                        f32_3 %72 = OpFMul %70 %71 
                                                      OpStore %57 %72 
                                        f32_4 %73 = OpLoad %9 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 0 0 
                                        f32_3 %75 = OpLoad %57 
                                        f32_3 %76 = OpFMul %74 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %9 %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %80 1 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %36 %82 %38 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpFMul %81 %85 
                                                      OpStore %79 %86 
                               Uniform f32_4* %87 = OpAccessChain %36 %82 %58 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_4 %90 = OpVectorShuffle %89 %89 0 0 0 0 
                                        f32_4 %91 = OpFMul %88 %90 
                                        f32_4 %92 = OpLoad %79 
                                        f32_4 %93 = OpFAdd %91 %92 
                                                      OpStore %79 %93 
                               Uniform f32_4* %94 = OpAccessChain %36 %82 %82 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_4 %97 = OpVectorShuffle %96 %96 2 2 2 2 
                                        f32_4 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %79 
                                       f32_4 %100 = OpFAdd %98 %99 
                                                      OpStore %9 %100 
                                       f32_4 %101 = OpLoad %9 
                              Uniform f32_4* %103 = OpAccessChain %36 %82 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpFAdd %101 %104 
                                                      OpStore %9 %105 
                                       f32_4 %106 = OpLoad %9 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                              Uniform f32_4* %109 = OpAccessChain %36 %108 %38 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 3 
                                       f32_3 %112 = OpFMul %107 %111 
                                       f32_4 %113 = OpLoad %79 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 6 3 
                                                      OpStore %79 %114 
                              Uniform f32_4* %115 = OpAccessChain %36 %108 %58 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 3 
                                       f32_4 %118 = OpLoad %9 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 0 0 
                                       f32_3 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %79 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %79 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %79 %125 
                              Uniform f32_4* %126 = OpAccessChain %36 %108 %82 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 3 
                                       f32_4 %129 = OpLoad %9 
                                       f32_3 %130 = OpVectorShuffle %129 %129 2 2 2 
                                       f32_3 %131 = OpFMul %128 %130 
                                       f32_4 %132 = OpLoad %79 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFAdd %131 %133 
                                       f32_4 %135 = OpLoad %79 
                                       f32_4 %136 = OpVectorShuffle %135 %134 4 5 6 3 
                                                      OpStore %79 %136 
                              Uniform f32_4* %137 = OpAccessChain %36 %108 %102 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 3 
                                       f32_4 %140 = OpLoad %9 
                                       f32_3 %141 = OpVectorShuffle %140 %140 3 3 3 
                                       f32_3 %142 = OpFMul %139 %141 
                                       f32_4 %143 = OpLoad %79 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFAdd %142 %144 
                                       f32_4 %146 = OpLoad %79 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %79 %147 
                                       f32_4 %148 = OpLoad %79 
                                       f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                       f32_4 %150 = OpLoad %79 
                                       f32_2 %151 = OpVectorShuffle %150 %150 2 2 
                                       f32_2 %152 = OpFDiv %149 %151 
                                       f32_4 %153 = OpLoad %79 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 2 3 
                                                      OpStore %79 %154 
                                       f32_4 %155 = OpLoad %79 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 1 
                                       f32_2 %158 = OpFAdd %156 %157 
                                       f32_4 %159 = OpLoad %79 
                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 2 3 
                                                      OpStore %79 %160 
                                Private f32* %161 = OpAccessChain %79 %26 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpFMul %162 %163 
                                Private f32* %165 = OpAccessChain %79 %26 
                                                      OpStore %165 %164 
                                Private f32* %166 = OpAccessChain %79 %45 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFNegate %167 
                                         f32 %169 = OpFMul %168 %163 
                                         f32 %170 = OpFAdd %169 %50 
                                Private f32* %171 = OpAccessChain %79 %59 
                                                      OpStore %171 %170 
                                       f32_4 %173 = OpLoad %9 
                                       f32_3 %174 = OpVectorShuffle %173 %173 1 1 1 
                              Uniform f32_4* %175 = OpAccessChain %36 %102 %38 
                                       f32_4 %176 = OpLoad %175 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 3 
                                       f32_3 %178 = OpFMul %174 %177 
                                                      OpStore %172 %178 
                              Uniform f32_4* %179 = OpAccessChain %36 %102 %58 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 3 
                                       f32_4 %182 = OpLoad %9 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 0 0 
                                       f32_3 %184 = OpFMul %181 %183 
                                       f32_3 %185 = OpLoad %172 
                                       f32_3 %186 = OpFAdd %184 %185 
                                                      OpStore %172 %186 
                              Uniform f32_4* %187 = OpAccessChain %36 %102 %82 
                                       f32_4 %188 = OpLoad %187 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 3 
                                       f32_4 %190 = OpLoad %9 
                                       f32_3 %191 = OpVectorShuffle %190 %190 2 2 2 
                                       f32_3 %192 = OpFMul %189 %191 
                                       f32_3 %193 = OpLoad %172 
                                       f32_3 %194 = OpFAdd %192 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %9 %196 
                              Uniform f32_4* %197 = OpAccessChain %36 %102 %102 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 3 
                                       f32_4 %200 = OpLoad %9 
                                       f32_3 %201 = OpVectorShuffle %200 %200 3 3 3 
                                       f32_3 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %9 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpFAdd %202 %204 
                                       f32_4 %206 = OpLoad %9 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %9 %207 
                                       f32_4 %208 = OpLoad %9 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_4 %210 = OpLoad %9 
                                       f32_2 %211 = OpVectorShuffle %210 %210 2 2 
                                       f32_2 %212 = OpFDiv %209 %211 
                                       f32_4 %213 = OpLoad %9 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 2 3 
                                                      OpStore %9 %214 
                                       f32_4 %215 = OpLoad %9 
                                       f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                                       f32_2 %217 = OpFAdd %216 %157 
                                       f32_4 %218 = OpLoad %9 
                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
                                                      OpStore %9 %219 
                                Private f32* %220 = OpAccessChain %9 %26 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFMul %221 %163 
                                Private f32* %223 = OpAccessChain %9 %26 
                                                      OpStore %223 %222 
                                Private f32* %224 = OpAccessChain %9 %45 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFNegate %225 
                                         f32 %227 = OpFMul %226 %163 
                                         f32 %228 = OpFAdd %227 %50 
                                Private f32* %229 = OpAccessChain %9 %59 
                                                      OpStore %229 %228 
                                       f32_4 %230 = OpLoad %79 
                                       f32_2 %231 = OpVectorShuffle %230 %230 0 2 
                                       f32_2 %232 = OpFNegate %231 
                                       f32_4 %233 = OpLoad %9 
                                       f32_2 %234 = OpVectorShuffle %233 %233 0 2 
                                       f32_2 %235 = OpFAdd %232 %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpVectorShuffle %236 %235 4 5 2 3 
                                                      OpStore %9 %237 
                                       f32_4 %240 = OpLoad %9 
                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
                                       f32_4 %242 = OpLoad %239 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 2 3 
                                                      OpStore %239 %243 
                                       f32_4 %246 = OpLoad %239 
                                       f32_4 %247 = OpVectorShuffle %246 %245 0 1 4 5 
                                                      OpStore %239 %247 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %79 %105 %113 %115 
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
                                                     OpMemberDecorate %77 0 BuiltIn 77 
                                                     OpMemberDecorate %77 1 BuiltIn 77 
                                                     OpMemberDecorate %77 2 BuiltIn 77 
                                                     OpDecorate %77 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 105 
                                                     OpDecorate vs_TEXCOORD1 Location 113 
                                                     OpDecorate %115 Location 115 
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
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypeArray %6 %75 
                                             %77 = OpTypeStruct %7 %6 %76 
                                             %78 = OpTypePointer Output %77 
        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                             %81 = OpTypePointer Output %7 
                                             %83 = OpTypePointer Private %6 
                                Private f32* %84 = OpVariable Private 
                                         u32 %87 = OpConstant 0 
                                             %88 = OpTypePointer Uniform %6 
                                             %92 = OpTypeVector %6 2 
                                         f32 %95 = OpConstant 3.674022E-40 
                                       f32_2 %96 = OpConstantComposite %95 %95 
                                        u32 %102 = OpConstant 3 
                                            %104 = OpTypePointer Output %92 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %111 = OpTypeVector %6 3 
                                            %112 = OpTypePointer Output %111 
                      Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                            %114 = OpTypePointer Input %111 
                               Input f32_3* %115 = OpVariable Input 
                                            %117 = OpTypePointer Output %6 
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
                                       f32_4 %80 = OpLoad %9 
                               Output f32_4* %82 = OpAccessChain %79 %27 
                                                     OpStore %82 %80 
                                Private f32* %85 = OpAccessChain %9 %75 
                                         f32 %86 = OpLoad %85 
                                Uniform f32* %89 = OpAccessChain %20 %27 %87 
                                         f32 %90 = OpLoad %89 
                                         f32 %91 = OpFMul %86 %90 
                                                     OpStore %84 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                       f32_2 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %9 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 1 5 3 
                                                     OpStore %9 %99 
                                        f32 %100 = OpLoad %84 
                                        f32 %101 = OpFMul %100 %95 
                               Private f32* %103 = OpAccessChain %9 %102 
                                                     OpStore %103 %101 
                                      f32_4 %106 = OpLoad %9 
                                      f32_2 %107 = OpVectorShuffle %106 %106 2 2 
                                      f32_4 %108 = OpLoad %9 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 3 
                                      f32_2 %110 = OpFAdd %107 %109 
                                                     OpStore vs_TEXCOORD0 %110 
                                      f32_3 %116 = OpLoad %115 
                                                     OpStore vs_TEXCOORD1 %116 
                                Output f32* %118 = OpAccessChain %79 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %79 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 249
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %22 %63 %239 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %12 DescriptorSet 12 
                                                      OpDecorate %12 Binding 12 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD0 Location 22 
                                                      OpDecorate %31 ArrayStride 31 
                                                      OpDecorate %32 ArrayStride 32 
                                                      OpDecorate %33 ArrayStride 33 
                                                      OpMemberDecorate %34 0 Offset 34 
                                                      OpMemberDecorate %34 1 Offset 34 
                                                      OpMemberDecorate %34 2 Offset 34 
                                                      OpMemberDecorate %34 3 Offset 34 
                                                      OpMemberDecorate %34 4 Offset 34 
                                                      OpDecorate %34 Block 
                                                      OpDecorate %36 DescriptorSet 36 
                                                      OpDecorate %36 Binding 36 
                                                      OpDecorate vs_TEXCOORD1 Location 63 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %239 Location 239 
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
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %28 = OpTypePointer Private %6 
                                          u32 %30 = OpConstant 4 
                                              %31 = OpTypeArray %7 %30 
                                              %32 = OpTypeArray %7 %30 
                                              %33 = OpTypeArray %7 %30 
                                              %34 = OpTypeStruct %7 %7 %31 %32 %33 
                                              %35 = OpTypePointer Uniform %34 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %36 = OpVariable Uniform 
                                              %37 = OpTypeInt 32 1 
                                          i32 %38 = OpConstant 1 
                                              %39 = OpTypePointer Uniform %6 
                                          u32 %45 = OpConstant 1 
                                          f32 %50 = OpConstant 3.674022E-40 
                                              %55 = OpTypeVector %6 3 
                                              %56 = OpTypePointer Private %55 
                               Private f32_3* %57 = OpVariable Private 
                                          i32 %58 = OpConstant 0 
                                          u32 %59 = OpConstant 2 
                                              %62 = OpTypePointer Input %55 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %64 = OpTypePointer Input %6 
                               Private f32_4* %79 = OpVariable Private 
                                          i32 %82 = OpConstant 2 
                                              %83 = OpTypePointer Uniform %7 
                                         i32 %102 = OpConstant 3 
                                         i32 %108 = OpConstant 4 
                                       f32_2 %157 = OpConstantComposite %50 %50 
                                         f32 %163 = OpConstant 3.674022E-40 
                              Private f32_3* %172 = OpVariable Private 
                                             %238 = OpTypePointer Output %7 
                               Output f32_4* %239 = OpVariable Output 
                                         f32 %244 = OpConstant 3.674022E-40 
                                       f32_2 %245 = OpConstantComposite %244 %50 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                          read_only Texture2D %13 = OpLoad %12 
                                      sampler %17 = OpLoad %16 
                   read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                        f32_2 %23 = OpLoad vs_TEXCOORD0 
                                        f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                          f32 %27 = OpCompositeExtract %24 0 
                                 Private f32* %29 = OpAccessChain %9 %26 
                                                      OpStore %29 %27 
                                 Uniform f32* %40 = OpAccessChain %36 %38 %26 
                                          f32 %41 = OpLoad %40 
                                 Private f32* %42 = OpAccessChain %9 %26 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFMul %41 %43 
                                 Uniform f32* %46 = OpAccessChain %36 %38 %45 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %44 %47 
                                 Private f32* %49 = OpAccessChain %9 %26 
                                                      OpStore %49 %48 
                                 Private f32* %51 = OpAccessChain %9 %26 
                                          f32 %52 = OpLoad %51 
                                          f32 %53 = OpFDiv %50 %52 
                                 Private f32* %54 = OpAccessChain %9 %26 
                                                      OpStore %54 %53 
                                 Uniform f32* %60 = OpAccessChain %36 %58 %59 
                                          f32 %61 = OpLoad %60 
                                   Input f32* %65 = OpAccessChain vs_TEXCOORD1 %59 
                                          f32 %66 = OpLoad %65 
                                          f32 %67 = OpFDiv %61 %66 
                                 Private f32* %68 = OpAccessChain %57 %26 
                                                      OpStore %68 %67 
                                        f32_3 %69 = OpLoad %57 
                                        f32_3 %70 = OpVectorShuffle %69 %69 0 0 0 
                                        f32_3 %71 = OpLoad vs_TEXCOORD1 
                                        f32_3 %72 = OpFMul %70 %71 
                                                      OpStore %57 %72 
                                        f32_4 %73 = OpLoad %9 
                                        f32_3 %74 = OpVectorShuffle %73 %73 0 0 0 
                                        f32_3 %75 = OpLoad %57 
                                        f32_3 %76 = OpFMul %74 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %76 4 5 6 3 
                                                      OpStore %9 %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %80 1 1 1 1 
                               Uniform f32_4* %84 = OpAccessChain %36 %82 %38 
                                        f32_4 %85 = OpLoad %84 
                                        f32_4 %86 = OpFMul %81 %85 
                                                      OpStore %79 %86 
                               Uniform f32_4* %87 = OpAccessChain %36 %82 %58 
                                        f32_4 %88 = OpLoad %87 
                                        f32_4 %89 = OpLoad %9 
                                        f32_4 %90 = OpVectorShuffle %89 %89 0 0 0 0 
                                        f32_4 %91 = OpFMul %88 %90 
                                        f32_4 %92 = OpLoad %79 
                                        f32_4 %93 = OpFAdd %91 %92 
                                                      OpStore %79 %93 
                               Uniform f32_4* %94 = OpAccessChain %36 %82 %82 
                                        f32_4 %95 = OpLoad %94 
                                        f32_4 %96 = OpLoad %9 
                                        f32_4 %97 = OpVectorShuffle %96 %96 2 2 2 2 
                                        f32_4 %98 = OpFMul %95 %97 
                                        f32_4 %99 = OpLoad %79 
                                       f32_4 %100 = OpFAdd %98 %99 
                                                      OpStore %9 %100 
                                       f32_4 %101 = OpLoad %9 
                              Uniform f32_4* %103 = OpAccessChain %36 %82 %102 
                                       f32_4 %104 = OpLoad %103 
                                       f32_4 %105 = OpFAdd %101 %104 
                                                      OpStore %9 %105 
                                       f32_4 %106 = OpLoad %9 
                                       f32_3 %107 = OpVectorShuffle %106 %106 1 1 1 
                              Uniform f32_4* %109 = OpAccessChain %36 %108 %38 
                                       f32_4 %110 = OpLoad %109 
                                       f32_3 %111 = OpVectorShuffle %110 %110 0 1 3 
                                       f32_3 %112 = OpFMul %107 %111 
                                       f32_4 %113 = OpLoad %79 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 6 3 
                                                      OpStore %79 %114 
                              Uniform f32_4* %115 = OpAccessChain %36 %108 %58 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 3 
                                       f32_4 %118 = OpLoad %9 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 0 0 
                                       f32_3 %120 = OpFMul %117 %119 
                                       f32_4 %121 = OpLoad %79 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                                       f32_3 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %79 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 6 3 
                                                      OpStore %79 %125 
                              Uniform f32_4* %126 = OpAccessChain %36 %108 %82 
                                       f32_4 %127 = OpLoad %126 
                                       f32_3 %128 = OpVectorShuffle %127 %127 0 1 3 
                                       f32_4 %129 = OpLoad %9 
                                       f32_3 %130 = OpVectorShuffle %129 %129 2 2 2 
                                       f32_3 %131 = OpFMul %128 %130 
                                       f32_4 %132 = OpLoad %79 
                                       f32_3 %133 = OpVectorShuffle %132 %132 0 1 2 
                                       f32_3 %134 = OpFAdd %131 %133 
                                       f32_4 %135 = OpLoad %79 
                                       f32_4 %136 = OpVectorShuffle %135 %134 4 5 6 3 
                                                      OpStore %79 %136 
                              Uniform f32_4* %137 = OpAccessChain %36 %108 %102 
                                       f32_4 %138 = OpLoad %137 
                                       f32_3 %139 = OpVectorShuffle %138 %138 0 1 3 
                                       f32_4 %140 = OpLoad %9 
                                       f32_3 %141 = OpVectorShuffle %140 %140 3 3 3 
                                       f32_3 %142 = OpFMul %139 %141 
                                       f32_4 %143 = OpLoad %79 
                                       f32_3 %144 = OpVectorShuffle %143 %143 0 1 2 
                                       f32_3 %145 = OpFAdd %142 %144 
                                       f32_4 %146 = OpLoad %79 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %79 %147 
                                       f32_4 %148 = OpLoad %79 
                                       f32_2 %149 = OpVectorShuffle %148 %148 0 1 
                                       f32_4 %150 = OpLoad %79 
                                       f32_2 %151 = OpVectorShuffle %150 %150 2 2 
                                       f32_2 %152 = OpFDiv %149 %151 
                                       f32_4 %153 = OpLoad %79 
                                       f32_4 %154 = OpVectorShuffle %153 %152 4 5 2 3 
                                                      OpStore %79 %154 
                                       f32_4 %155 = OpLoad %79 
                                       f32_2 %156 = OpVectorShuffle %155 %155 0 1 
                                       f32_2 %158 = OpFAdd %156 %157 
                                       f32_4 %159 = OpLoad %79 
                                       f32_4 %160 = OpVectorShuffle %159 %158 4 5 2 3 
                                                      OpStore %79 %160 
                                Private f32* %161 = OpAccessChain %79 %26 
                                         f32 %162 = OpLoad %161 
                                         f32 %164 = OpFMul %162 %163 
                                Private f32* %165 = OpAccessChain %79 %26 
                                                      OpStore %165 %164 
                                Private f32* %166 = OpAccessChain %79 %45 
                                         f32 %167 = OpLoad %166 
                                         f32 %168 = OpFNegate %167 
                                         f32 %169 = OpFMul %168 %163 
                                         f32 %170 = OpFAdd %169 %50 
                                Private f32* %171 = OpAccessChain %79 %59 
                                                      OpStore %171 %170 
                                       f32_4 %173 = OpLoad %9 
                                       f32_3 %174 = OpVectorShuffle %173 %173 1 1 1 
                              Uniform f32_4* %175 = OpAccessChain %36 %102 %38 
                                       f32_4 %176 = OpLoad %175 
                                       f32_3 %177 = OpVectorShuffle %176 %176 0 1 3 
                                       f32_3 %178 = OpFMul %174 %177 
                                                      OpStore %172 %178 
                              Uniform f32_4* %179 = OpAccessChain %36 %102 %58 
                                       f32_4 %180 = OpLoad %179 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 3 
                                       f32_4 %182 = OpLoad %9 
                                       f32_3 %183 = OpVectorShuffle %182 %182 0 0 0 
                                       f32_3 %184 = OpFMul %181 %183 
                                       f32_3 %185 = OpLoad %172 
                                       f32_3 %186 = OpFAdd %184 %185 
                                                      OpStore %172 %186 
                              Uniform f32_4* %187 = OpAccessChain %36 %102 %82 
                                       f32_4 %188 = OpLoad %187 
                                       f32_3 %189 = OpVectorShuffle %188 %188 0 1 3 
                                       f32_4 %190 = OpLoad %9 
                                       f32_3 %191 = OpVectorShuffle %190 %190 2 2 2 
                                       f32_3 %192 = OpFMul %189 %191 
                                       f32_3 %193 = OpLoad %172 
                                       f32_3 %194 = OpFAdd %192 %193 
                                       f32_4 %195 = OpLoad %9 
                                       f32_4 %196 = OpVectorShuffle %195 %194 4 5 6 3 
                                                      OpStore %9 %196 
                              Uniform f32_4* %197 = OpAccessChain %36 %102 %102 
                                       f32_4 %198 = OpLoad %197 
                                       f32_3 %199 = OpVectorShuffle %198 %198 0 1 3 
                                       f32_4 %200 = OpLoad %9 
                                       f32_3 %201 = OpVectorShuffle %200 %200 3 3 3 
                                       f32_3 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %9 
                                       f32_3 %204 = OpVectorShuffle %203 %203 0 1 2 
                                       f32_3 %205 = OpFAdd %202 %204 
                                       f32_4 %206 = OpLoad %9 
                                       f32_4 %207 = OpVectorShuffle %206 %205 4 5 6 3 
                                                      OpStore %9 %207 
                                       f32_4 %208 = OpLoad %9 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_4 %210 = OpLoad %9 
                                       f32_2 %211 = OpVectorShuffle %210 %210 2 2 
                                       f32_2 %212 = OpFDiv %209 %211 
                                       f32_4 %213 = OpLoad %9 
                                       f32_4 %214 = OpVectorShuffle %213 %212 4 5 2 3 
                                                      OpStore %9 %214 
                                       f32_4 %215 = OpLoad %9 
                                       f32_2 %216 = OpVectorShuffle %215 %215 0 1 
                                       f32_2 %217 = OpFAdd %216 %157 
                                       f32_4 %218 = OpLoad %9 
                                       f32_4 %219 = OpVectorShuffle %218 %217 4 5 2 3 
                                                      OpStore %9 %219 
                                Private f32* %220 = OpAccessChain %9 %26 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFMul %221 %163 
                                Private f32* %223 = OpAccessChain %9 %26 
                                                      OpStore %223 %222 
                                Private f32* %224 = OpAccessChain %9 %45 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpFNegate %225 
                                         f32 %227 = OpFMul %226 %163 
                                         f32 %228 = OpFAdd %227 %50 
                                Private f32* %229 = OpAccessChain %9 %59 
                                                      OpStore %229 %228 
                                       f32_4 %230 = OpLoad %79 
                                       f32_2 %231 = OpVectorShuffle %230 %230 0 2 
                                       f32_2 %232 = OpFNegate %231 
                                       f32_4 %233 = OpLoad %9 
                                       f32_2 %234 = OpVectorShuffle %233 %233 0 2 
                                       f32_2 %235 = OpFAdd %232 %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_4 %237 = OpVectorShuffle %236 %235 4 5 2 3 
                                                      OpStore %9 %237 
                                       f32_4 %240 = OpLoad %9 
                                       f32_2 %241 = OpVectorShuffle %240 %240 0 1 
                                       f32_4 %242 = OpLoad %239 
                                       f32_4 %243 = OpVectorShuffle %242 %241 4 5 2 3 
                                                      OpStore %239 %243 
                                       f32_4 %246 = OpLoad %239 
                                       f32_4 %247 = OpVectorShuffle %246 %245 0 1 4 5 
                                                      OpStore %239 %247 
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
  ZTest Always
  Cull Off
  GpuProgramID 194660
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD0.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat9 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = _ZBufferParams.x * u_xlat9 + _ZBufferParams.y;
    gl_FragDepth = u_xlat9;
    u_xlat9 = float(1.0) / u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PreviousVP[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[3].xyw * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat1.xy = u_xlat1.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_NonJitteredVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4x4_NonJitteredVP[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[2].xyw * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[3].xyw * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-u_xlat1.xy);
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 1.0);
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD0.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat9 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = _ZBufferParams.x * u_xlat9 + _ZBufferParams.y;
    gl_FragDepth = u_xlat9;
    u_xlat9 = float(1.0) / u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PreviousVP[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[3].xyw * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat1.xy = u_xlat1.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_NonJitteredVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4x4_NonJitteredVP[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[2].xyw * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[3].xyw * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-u_xlat1.xy);
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 1.0);
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat2;
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
    u_xlat2 = u_xlat0.y * _ProjectionParams.x;
    u_xlat0.xz = u_xlat0.xw * vec2(0.5, 0.5);
    u_xlat0.w = u_xlat2 * 0.5;
    vs_TEXCOORD0.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD1.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 hlslcc_mtx4x4_NonJitteredVP[4];
uniform 	vec4 hlslcc_mtx4x4_PreviousVP[4];
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
float u_xlat9;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat9 = texture(_CameraDepthTexture, vs_TEXCOORD0.xy).x;
    u_xlat1.x = _ZBufferParams.x * u_xlat9 + _ZBufferParams.y;
    gl_FragDepth = u_xlat9;
    u_xlat9 = float(1.0) / u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_CameraToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_CameraToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_CameraToWorld[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_CameraToWorld[3];
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4_PreviousVP[1].xyw;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[0].xyw * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[2].xyw * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4_PreviousVP[3].xyw * u_xlat0.www + u_xlat1.xyz;
    u_xlat1.xy = u_xlat1.xy / u_xlat1.zz;
    u_xlat1.xy = u_xlat1.xy + vec2(1.0, 1.0);
    u_xlat1.xy = u_xlat1.xy * vec2(0.5, 0.5);
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4_NonJitteredVP[1].xyw;
    u_xlat2.xyz = hlslcc_mtx4x4_NonJitteredVP[0].xyw * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[2].xyw * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4_NonJitteredVP[3].xyw * u_xlat0.www + u_xlat0.xyz;
    u_xlat0.xy = u_xlat0.xy / u_xlat0.zz;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-u_xlat1.xy);
    SV_Target0.xy = u_xlat0.xy;
    SV_Target0.zw = vec2(0.0, 1.0);
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %79 %105 %113 %115 
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
                                                     OpMemberDecorate %77 0 BuiltIn 77 
                                                     OpMemberDecorate %77 1 BuiltIn 77 
                                                     OpMemberDecorate %77 2 BuiltIn 77 
                                                     OpDecorate %77 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 105 
                                                     OpDecorate vs_TEXCOORD1 Location 113 
                                                     OpDecorate %115 Location 115 
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
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypeArray %6 %75 
                                             %77 = OpTypeStruct %7 %6 %76 
                                             %78 = OpTypePointer Output %77 
        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                             %81 = OpTypePointer Output %7 
                                             %83 = OpTypePointer Private %6 
                                Private f32* %84 = OpVariable Private 
                                         u32 %87 = OpConstant 0 
                                             %88 = OpTypePointer Uniform %6 
                                             %92 = OpTypeVector %6 2 
                                         f32 %95 = OpConstant 3.674022E-40 
                                       f32_2 %96 = OpConstantComposite %95 %95 
                                        u32 %102 = OpConstant 3 
                                            %104 = OpTypePointer Output %92 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %111 = OpTypeVector %6 3 
                                            %112 = OpTypePointer Output %111 
                      Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                            %114 = OpTypePointer Input %111 
                               Input f32_3* %115 = OpVariable Input 
                                            %117 = OpTypePointer Output %6 
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
                                       f32_4 %80 = OpLoad %9 
                               Output f32_4* %82 = OpAccessChain %79 %27 
                                                     OpStore %82 %80 
                                Private f32* %85 = OpAccessChain %9 %75 
                                         f32 %86 = OpLoad %85 
                                Uniform f32* %89 = OpAccessChain %20 %27 %87 
                                         f32 %90 = OpLoad %89 
                                         f32 %91 = OpFMul %86 %90 
                                                     OpStore %84 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                       f32_2 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %9 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 1 5 3 
                                                     OpStore %9 %99 
                                        f32 %100 = OpLoad %84 
                                        f32 %101 = OpFMul %100 %95 
                               Private f32* %103 = OpAccessChain %9 %102 
                                                     OpStore %103 %101 
                                      f32_4 %106 = OpLoad %9 
                                      f32_2 %107 = OpVectorShuffle %106 %106 2 2 
                                      f32_4 %108 = OpLoad %9 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 3 
                                      f32_2 %110 = OpFAdd %107 %109 
                                                     OpStore vs_TEXCOORD0 %110 
                                      f32_3 %116 = OpLoad %115 
                                                     OpStore vs_TEXCOORD1 %116 
                                Output f32* %118 = OpAccessChain %79 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %79 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 252
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %26 %53 %69 %242 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpExecutionMode %4 DepthReplacing 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate vs_TEXCOORD1 Location 26 
                                                      OpDecorate %43 DescriptorSet 43 
                                                      OpDecorate %43 Binding 43 
                                                      OpDecorate %47 DescriptorSet 47 
                                                      OpDecorate %47 Binding 47 
                                                      OpDecorate vs_TEXCOORD0 Location 53 
                                                      OpDecorate %69 BuiltIn 69 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %242 Location 242 
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
                                              %15 = OpTypeStruct %7 %7 %12 %13 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 0 
                                          u32 %20 = OpConstant 2 
                                              %21 = OpTypePointer Uniform %6 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypePointer Input %24 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %27 = OpTypePointer Input %6 
                                          u32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Private %6 
                                 Private f32* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypePointer UniformConstant %41 
         UniformConstant read_only Texture2D* %43 = OpVariable UniformConstant 
                                              %45 = OpTypeSampler 
                                              %46 = OpTypePointer UniformConstant %45 
                     UniformConstant sampler* %47 = OpVariable UniformConstant 
                                              %49 = OpTypeSampledImage %41 
                                              %51 = OpTypeVector %6 2 
                                              %52 = OpTypePointer Input %51 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                               Private f32_4* %57 = OpVariable Private 
                                          i32 %58 = OpConstant 1 
                                          u32 %63 = OpConstant 1 
                                              %68 = OpTypePointer Output %6 
                                  Output f32* %69 = OpVariable Output 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          i32 %84 = OpConstant 2 
                                              %85 = OpTypePointer Uniform %7 
                                         i32 %104 = OpConstant 3 
                                         i32 %110 = OpConstant 4 
                                       f32_2 %159 = OpConstantComposite %71 %71 
                                         f32 %165 = OpConstant 3.674022E-40 
                                             %174 = OpTypePointer Private %24 
                              Private f32_3* %175 = OpVariable Private 
                                             %241 = OpTypePointer Output %7 
                               Output f32_4* %242 = OpVariable Output 
                                         f32 %247 = OpConstant 3.674022E-40 
                                       f32_2 %248 = OpConstantComposite %247 %71 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %17 %19 %20 
                                          f32 %23 = OpLoad %22 
                                   Input f32* %28 = OpAccessChain vs_TEXCOORD1 %20 
                                          f32 %29 = OpLoad %28 
                                          f32 %30 = OpFDiv %23 %29 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                                      OpStore %33 %30 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 0 0 
                                        f32_3 %36 = OpLoad vs_TEXCOORD1 
                                        f32_3 %37 = OpFMul %35 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %9 %39 
                          read_only Texture2D %44 = OpLoad %43 
                                      sampler %48 = OpLoad %47 
                   read_only Texture2DSampled %50 = OpSampledImage %44 %48 
                                        f32_2 %54 = OpLoad vs_TEXCOORD0 
                                        f32_4 %55 = OpImageSampleImplicitLod %50 %54 
                                          f32 %56 = OpCompositeExtract %55 0 
                                                      OpStore %40 %56 
                                 Uniform f32* %59 = OpAccessChain %17 %58 %31 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpLoad %40 
                                          f32 %62 = OpFMul %60 %61 
                                 Uniform f32* %64 = OpAccessChain %17 %58 %63 
                                          f32 %65 = OpLoad %64 
                                          f32 %66 = OpFAdd %62 %65 
                                 Private f32* %67 = OpAccessChain %57 %31 
                                                      OpStore %67 %66 
                                          f32 %70 = OpLoad %40 
                                                      OpStore %69 %70 
                                 Private f32* %72 = OpAccessChain %57 %31 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFDiv %71 %73 
                                                      OpStore %40 %74 
                                          f32 %75 = OpLoad %40 
                                        f32_3 %76 = OpCompositeConstruct %75 %75 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                        f32_3 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                                      OpStore %9 %81 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpVectorShuffle %82 %82 1 1 1 1 
                               Uniform f32_4* %86 = OpAccessChain %17 %84 %58 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpFMul %83 %87 
                                                      OpStore %57 %88 
                               Uniform f32_4* %89 = OpAccessChain %17 %84 %19 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 0 
                                        f32_4 %93 = OpFMul %90 %92 
                                        f32_4 %94 = OpLoad %57 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %57 %95 
                               Uniform f32_4* %96 = OpAccessChain %17 %84 %84 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %57 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %9 %102 
                                       f32_4 %103 = OpLoad %9 
                              Uniform f32_4* %105 = OpAccessChain %17 %84 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpFAdd %103 %106 
                                                      OpStore %9 %107 
                                       f32_4 %108 = OpLoad %9 
                                       f32_3 %109 = OpVectorShuffle %108 %108 1 1 1 
                              Uniform f32_4* %111 = OpAccessChain %17 %110 %58 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 3 
                                       f32_3 %114 = OpFMul %109 %113 
                                       f32_4 %115 = OpLoad %57 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %57 %116 
                              Uniform f32_4* %117 = OpAccessChain %17 %110 %19 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 3 
                                       f32_4 %120 = OpLoad %9 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 0 0 
                                       f32_3 %122 = OpFMul %119 %121 
                                       f32_4 %123 = OpLoad %57 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                       f32_3 %125 = OpFAdd %122 %124 
                                       f32_4 %126 = OpLoad %57 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                      OpStore %57 %127 
                              Uniform f32_4* %128 = OpAccessChain %17 %110 %84 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 3 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 2 2 2 
                                       f32_3 %133 = OpFMul %130 %132 
                                       f32_4 %134 = OpLoad %57 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpFAdd %133 %135 
                                       f32_4 %137 = OpLoad %57 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %57 %138 
                              Uniform f32_4* %139 = OpAccessChain %17 %110 %104 
                                       f32_4 %140 = OpLoad %139 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 3 
                                       f32_4 %142 = OpLoad %9 
                                       f32_3 %143 = OpVectorShuffle %142 %142 3 3 3 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %57 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %57 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %57 %149 
                                       f32_4 %150 = OpLoad %57 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                       f32_4 %152 = OpLoad %57 
                                       f32_2 %153 = OpVectorShuffle %152 %152 2 2 
                                       f32_2 %154 = OpFDiv %151 %153 
                                       f32_4 %155 = OpLoad %57 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 2 3 
                                                      OpStore %57 %156 
                                       f32_4 %157 = OpLoad %57 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_2 %160 = OpFAdd %158 %159 
                                       f32_4 %161 = OpLoad %57 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 3 
                                                      OpStore %57 %162 
                                Private f32* %163 = OpAccessChain %57 %31 
                                         f32 %164 = OpLoad %163 
                                         f32 %166 = OpFMul %164 %165 
                                Private f32* %167 = OpAccessChain %57 %31 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %57 %63 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFNegate %169 
                                         f32 %171 = OpFMul %170 %165 
                                         f32 %172 = OpFAdd %171 %71 
                                Private f32* %173 = OpAccessChain %57 %20 
                                                      OpStore %173 %172 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 1 1 1 
                              Uniform f32_4* %178 = OpAccessChain %17 %104 %58 
                                       f32_4 %179 = OpLoad %178 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 3 
                                       f32_3 %181 = OpFMul %177 %180 
                                                      OpStore %175 %181 
                              Uniform f32_4* %182 = OpAccessChain %17 %104 %19 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 3 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 0 0 
                                       f32_3 %187 = OpFMul %184 %186 
                                       f32_3 %188 = OpLoad %175 
                                       f32_3 %189 = OpFAdd %187 %188 
                                                      OpStore %175 %189 
                              Uniform f32_4* %190 = OpAccessChain %17 %104 %84 
                                       f32_4 %191 = OpLoad %190 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 3 
                                       f32_4 %193 = OpLoad %9 
                                       f32_3 %194 = OpVectorShuffle %193 %193 2 2 2 
                                       f32_3 %195 = OpFMul %192 %194 
                                       f32_3 %196 = OpLoad %175 
                                       f32_3 %197 = OpFAdd %195 %196 
                                       f32_4 %198 = OpLoad %9 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                                      OpStore %9 %199 
                              Uniform f32_4* %200 = OpAccessChain %17 %104 %104 
                                       f32_4 %201 = OpLoad %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 3 
                                       f32_4 %203 = OpLoad %9 
                                       f32_3 %204 = OpVectorShuffle %203 %203 3 3 3 
                                       f32_3 %205 = OpFMul %202 %204 
                                       f32_4 %206 = OpLoad %9 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpFAdd %205 %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %208 4 5 6 3 
                                                      OpStore %9 %210 
                                       f32_4 %211 = OpLoad %9 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                       f32_4 %213 = OpLoad %9 
                                       f32_2 %214 = OpVectorShuffle %213 %213 2 2 
                                       f32_2 %215 = OpFDiv %212 %214 
                                       f32_4 %216 = OpLoad %9 
                                       f32_4 %217 = OpVectorShuffle %216 %215 4 5 2 3 
                                                      OpStore %9 %217 
                                       f32_4 %218 = OpLoad %9 
                                       f32_2 %219 = OpVectorShuffle %218 %218 0 1 
                                       f32_2 %220 = OpFAdd %219 %159 
                                       f32_4 %221 = OpLoad %9 
                                       f32_4 %222 = OpVectorShuffle %221 %220 4 5 2 3 
                                                      OpStore %9 %222 
                                Private f32* %223 = OpAccessChain %9 %31 
                                         f32 %224 = OpLoad %223 
                                         f32 %225 = OpFMul %224 %165 
                                Private f32* %226 = OpAccessChain %9 %31 
                                                      OpStore %226 %225 
                                Private f32* %227 = OpAccessChain %9 %63 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpFMul %229 %165 
                                         f32 %231 = OpFAdd %230 %71 
                                Private f32* %232 = OpAccessChain %9 %20 
                                                      OpStore %232 %231 
                                       f32_4 %233 = OpLoad %57 
                                       f32_2 %234 = OpVectorShuffle %233 %233 0 2 
                                       f32_2 %235 = OpFNegate %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_2 %237 = OpVectorShuffle %236 %236 0 2 
                                       f32_2 %238 = OpFAdd %235 %237 
                                       f32_4 %239 = OpLoad %9 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 2 3 
                                                      OpStore %9 %240 
                                       f32_4 %243 = OpLoad %9 
                                       f32_2 %244 = OpVectorShuffle %243 %243 0 1 
                                       f32_4 %245 = OpLoad %242 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 5 2 3 
                                                      OpStore %242 %246 
                                       f32_4 %249 = OpLoad %242 
                                       f32_4 %250 = OpVectorShuffle %249 %248 0 1 4 5 
                                                      OpStore %242 %250 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %79 %105 %113 %115 
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
                                                     OpMemberDecorate %77 0 BuiltIn 77 
                                                     OpMemberDecorate %77 1 BuiltIn 77 
                                                     OpMemberDecorate %77 2 BuiltIn 77 
                                                     OpDecorate %77 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 105 
                                                     OpDecorate vs_TEXCOORD1 Location 113 
                                                     OpDecorate %115 Location 115 
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
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypeArray %6 %75 
                                             %77 = OpTypeStruct %7 %6 %76 
                                             %78 = OpTypePointer Output %77 
        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                             %81 = OpTypePointer Output %7 
                                             %83 = OpTypePointer Private %6 
                                Private f32* %84 = OpVariable Private 
                                         u32 %87 = OpConstant 0 
                                             %88 = OpTypePointer Uniform %6 
                                             %92 = OpTypeVector %6 2 
                                         f32 %95 = OpConstant 3.674022E-40 
                                       f32_2 %96 = OpConstantComposite %95 %95 
                                        u32 %102 = OpConstant 3 
                                            %104 = OpTypePointer Output %92 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %111 = OpTypeVector %6 3 
                                            %112 = OpTypePointer Output %111 
                      Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                            %114 = OpTypePointer Input %111 
                               Input f32_3* %115 = OpVariable Input 
                                            %117 = OpTypePointer Output %6 
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
                                       f32_4 %80 = OpLoad %9 
                               Output f32_4* %82 = OpAccessChain %79 %27 
                                                     OpStore %82 %80 
                                Private f32* %85 = OpAccessChain %9 %75 
                                         f32 %86 = OpLoad %85 
                                Uniform f32* %89 = OpAccessChain %20 %27 %87 
                                         f32 %90 = OpLoad %89 
                                         f32 %91 = OpFMul %86 %90 
                                                     OpStore %84 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                       f32_2 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %9 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 1 5 3 
                                                     OpStore %9 %99 
                                        f32 %100 = OpLoad %84 
                                        f32 %101 = OpFMul %100 %95 
                               Private f32* %103 = OpAccessChain %9 %102 
                                                     OpStore %103 %101 
                                      f32_4 %106 = OpLoad %9 
                                      f32_2 %107 = OpVectorShuffle %106 %106 2 2 
                                      f32_4 %108 = OpLoad %9 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 3 
                                      f32_2 %110 = OpFAdd %107 %109 
                                                     OpStore vs_TEXCOORD0 %110 
                                      f32_3 %116 = OpLoad %115 
                                                     OpStore vs_TEXCOORD1 %116 
                                Output f32* %118 = OpAccessChain %79 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %79 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 252
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %26 %53 %69 %242 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpExecutionMode %4 DepthReplacing 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate vs_TEXCOORD1 Location 26 
                                                      OpDecorate %43 DescriptorSet 43 
                                                      OpDecorate %43 Binding 43 
                                                      OpDecorate %47 DescriptorSet 47 
                                                      OpDecorate %47 Binding 47 
                                                      OpDecorate vs_TEXCOORD0 Location 53 
                                                      OpDecorate %69 BuiltIn 69 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %242 Location 242 
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
                                              %15 = OpTypeStruct %7 %7 %12 %13 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 0 
                                          u32 %20 = OpConstant 2 
                                              %21 = OpTypePointer Uniform %6 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypePointer Input %24 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %27 = OpTypePointer Input %6 
                                          u32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Private %6 
                                 Private f32* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypePointer UniformConstant %41 
         UniformConstant read_only Texture2D* %43 = OpVariable UniformConstant 
                                              %45 = OpTypeSampler 
                                              %46 = OpTypePointer UniformConstant %45 
                     UniformConstant sampler* %47 = OpVariable UniformConstant 
                                              %49 = OpTypeSampledImage %41 
                                              %51 = OpTypeVector %6 2 
                                              %52 = OpTypePointer Input %51 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                               Private f32_4* %57 = OpVariable Private 
                                          i32 %58 = OpConstant 1 
                                          u32 %63 = OpConstant 1 
                                              %68 = OpTypePointer Output %6 
                                  Output f32* %69 = OpVariable Output 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          i32 %84 = OpConstant 2 
                                              %85 = OpTypePointer Uniform %7 
                                         i32 %104 = OpConstant 3 
                                         i32 %110 = OpConstant 4 
                                       f32_2 %159 = OpConstantComposite %71 %71 
                                         f32 %165 = OpConstant 3.674022E-40 
                                             %174 = OpTypePointer Private %24 
                              Private f32_3* %175 = OpVariable Private 
                                             %241 = OpTypePointer Output %7 
                               Output f32_4* %242 = OpVariable Output 
                                         f32 %247 = OpConstant 3.674022E-40 
                                       f32_2 %248 = OpConstantComposite %247 %71 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %17 %19 %20 
                                          f32 %23 = OpLoad %22 
                                   Input f32* %28 = OpAccessChain vs_TEXCOORD1 %20 
                                          f32 %29 = OpLoad %28 
                                          f32 %30 = OpFDiv %23 %29 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                                      OpStore %33 %30 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 0 0 
                                        f32_3 %36 = OpLoad vs_TEXCOORD1 
                                        f32_3 %37 = OpFMul %35 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %9 %39 
                          read_only Texture2D %44 = OpLoad %43 
                                      sampler %48 = OpLoad %47 
                   read_only Texture2DSampled %50 = OpSampledImage %44 %48 
                                        f32_2 %54 = OpLoad vs_TEXCOORD0 
                                        f32_4 %55 = OpImageSampleImplicitLod %50 %54 
                                          f32 %56 = OpCompositeExtract %55 0 
                                                      OpStore %40 %56 
                                 Uniform f32* %59 = OpAccessChain %17 %58 %31 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpLoad %40 
                                          f32 %62 = OpFMul %60 %61 
                                 Uniform f32* %64 = OpAccessChain %17 %58 %63 
                                          f32 %65 = OpLoad %64 
                                          f32 %66 = OpFAdd %62 %65 
                                 Private f32* %67 = OpAccessChain %57 %31 
                                                      OpStore %67 %66 
                                          f32 %70 = OpLoad %40 
                                                      OpStore %69 %70 
                                 Private f32* %72 = OpAccessChain %57 %31 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFDiv %71 %73 
                                                      OpStore %40 %74 
                                          f32 %75 = OpLoad %40 
                                        f32_3 %76 = OpCompositeConstruct %75 %75 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                        f32_3 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                                      OpStore %9 %81 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpVectorShuffle %82 %82 1 1 1 1 
                               Uniform f32_4* %86 = OpAccessChain %17 %84 %58 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpFMul %83 %87 
                                                      OpStore %57 %88 
                               Uniform f32_4* %89 = OpAccessChain %17 %84 %19 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 0 
                                        f32_4 %93 = OpFMul %90 %92 
                                        f32_4 %94 = OpLoad %57 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %57 %95 
                               Uniform f32_4* %96 = OpAccessChain %17 %84 %84 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %57 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %9 %102 
                                       f32_4 %103 = OpLoad %9 
                              Uniform f32_4* %105 = OpAccessChain %17 %84 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpFAdd %103 %106 
                                                      OpStore %9 %107 
                                       f32_4 %108 = OpLoad %9 
                                       f32_3 %109 = OpVectorShuffle %108 %108 1 1 1 
                              Uniform f32_4* %111 = OpAccessChain %17 %110 %58 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 3 
                                       f32_3 %114 = OpFMul %109 %113 
                                       f32_4 %115 = OpLoad %57 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %57 %116 
                              Uniform f32_4* %117 = OpAccessChain %17 %110 %19 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 3 
                                       f32_4 %120 = OpLoad %9 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 0 0 
                                       f32_3 %122 = OpFMul %119 %121 
                                       f32_4 %123 = OpLoad %57 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                       f32_3 %125 = OpFAdd %122 %124 
                                       f32_4 %126 = OpLoad %57 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                      OpStore %57 %127 
                              Uniform f32_4* %128 = OpAccessChain %17 %110 %84 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 3 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 2 2 2 
                                       f32_3 %133 = OpFMul %130 %132 
                                       f32_4 %134 = OpLoad %57 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpFAdd %133 %135 
                                       f32_4 %137 = OpLoad %57 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %57 %138 
                              Uniform f32_4* %139 = OpAccessChain %17 %110 %104 
                                       f32_4 %140 = OpLoad %139 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 3 
                                       f32_4 %142 = OpLoad %9 
                                       f32_3 %143 = OpVectorShuffle %142 %142 3 3 3 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %57 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %57 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %57 %149 
                                       f32_4 %150 = OpLoad %57 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                       f32_4 %152 = OpLoad %57 
                                       f32_2 %153 = OpVectorShuffle %152 %152 2 2 
                                       f32_2 %154 = OpFDiv %151 %153 
                                       f32_4 %155 = OpLoad %57 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 2 3 
                                                      OpStore %57 %156 
                                       f32_4 %157 = OpLoad %57 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_2 %160 = OpFAdd %158 %159 
                                       f32_4 %161 = OpLoad %57 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 3 
                                                      OpStore %57 %162 
                                Private f32* %163 = OpAccessChain %57 %31 
                                         f32 %164 = OpLoad %163 
                                         f32 %166 = OpFMul %164 %165 
                                Private f32* %167 = OpAccessChain %57 %31 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %57 %63 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFNegate %169 
                                         f32 %171 = OpFMul %170 %165 
                                         f32 %172 = OpFAdd %171 %71 
                                Private f32* %173 = OpAccessChain %57 %20 
                                                      OpStore %173 %172 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 1 1 1 
                              Uniform f32_4* %178 = OpAccessChain %17 %104 %58 
                                       f32_4 %179 = OpLoad %178 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 3 
                                       f32_3 %181 = OpFMul %177 %180 
                                                      OpStore %175 %181 
                              Uniform f32_4* %182 = OpAccessChain %17 %104 %19 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 3 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 0 0 
                                       f32_3 %187 = OpFMul %184 %186 
                                       f32_3 %188 = OpLoad %175 
                                       f32_3 %189 = OpFAdd %187 %188 
                                                      OpStore %175 %189 
                              Uniform f32_4* %190 = OpAccessChain %17 %104 %84 
                                       f32_4 %191 = OpLoad %190 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 3 
                                       f32_4 %193 = OpLoad %9 
                                       f32_3 %194 = OpVectorShuffle %193 %193 2 2 2 
                                       f32_3 %195 = OpFMul %192 %194 
                                       f32_3 %196 = OpLoad %175 
                                       f32_3 %197 = OpFAdd %195 %196 
                                       f32_4 %198 = OpLoad %9 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                                      OpStore %9 %199 
                              Uniform f32_4* %200 = OpAccessChain %17 %104 %104 
                                       f32_4 %201 = OpLoad %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 3 
                                       f32_4 %203 = OpLoad %9 
                                       f32_3 %204 = OpVectorShuffle %203 %203 3 3 3 
                                       f32_3 %205 = OpFMul %202 %204 
                                       f32_4 %206 = OpLoad %9 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpFAdd %205 %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %208 4 5 6 3 
                                                      OpStore %9 %210 
                                       f32_4 %211 = OpLoad %9 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                       f32_4 %213 = OpLoad %9 
                                       f32_2 %214 = OpVectorShuffle %213 %213 2 2 
                                       f32_2 %215 = OpFDiv %212 %214 
                                       f32_4 %216 = OpLoad %9 
                                       f32_4 %217 = OpVectorShuffle %216 %215 4 5 2 3 
                                                      OpStore %9 %217 
                                       f32_4 %218 = OpLoad %9 
                                       f32_2 %219 = OpVectorShuffle %218 %218 0 1 
                                       f32_2 %220 = OpFAdd %219 %159 
                                       f32_4 %221 = OpLoad %9 
                                       f32_4 %222 = OpVectorShuffle %221 %220 4 5 2 3 
                                                      OpStore %9 %222 
                                Private f32* %223 = OpAccessChain %9 %31 
                                         f32 %224 = OpLoad %223 
                                         f32 %225 = OpFMul %224 %165 
                                Private f32* %226 = OpAccessChain %9 %31 
                                                      OpStore %226 %225 
                                Private f32* %227 = OpAccessChain %9 %63 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpFMul %229 %165 
                                         f32 %231 = OpFAdd %230 %71 
                                Private f32* %232 = OpAccessChain %9 %20 
                                                      OpStore %232 %231 
                                       f32_4 %233 = OpLoad %57 
                                       f32_2 %234 = OpVectorShuffle %233 %233 0 2 
                                       f32_2 %235 = OpFNegate %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_2 %237 = OpVectorShuffle %236 %236 0 2 
                                       f32_2 %238 = OpFAdd %235 %237 
                                       f32_4 %239 = OpLoad %9 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 2 3 
                                                      OpStore %9 %240 
                                       f32_4 %243 = OpLoad %9 
                                       f32_2 %244 = OpVectorShuffle %243 %243 0 1 
                                       f32_4 %245 = OpLoad %242 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 5 2 3 
                                                      OpStore %242 %246 
                                       f32_4 %249 = OpLoad %242 
                                       f32_4 %250 = OpVectorShuffle %249 %248 0 1 4 5 
                                                      OpStore %242 %250 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 123
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %79 %105 %113 %115 
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
                                                     OpMemberDecorate %77 0 BuiltIn 77 
                                                     OpMemberDecorate %77 1 BuiltIn 77 
                                                     OpMemberDecorate %77 2 BuiltIn 77 
                                                     OpDecorate %77 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 105 
                                                     OpDecorate vs_TEXCOORD1 Location 113 
                                                     OpDecorate %115 Location 115 
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
                                         u32 %75 = OpConstant 1 
                                             %76 = OpTypeArray %6 %75 
                                             %77 = OpTypeStruct %7 %6 %76 
                                             %78 = OpTypePointer Output %77 
        Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                             %81 = OpTypePointer Output %7 
                                             %83 = OpTypePointer Private %6 
                                Private f32* %84 = OpVariable Private 
                                         u32 %87 = OpConstant 0 
                                             %88 = OpTypePointer Uniform %6 
                                             %92 = OpTypeVector %6 2 
                                         f32 %95 = OpConstant 3.674022E-40 
                                       f32_2 %96 = OpConstantComposite %95 %95 
                                        u32 %102 = OpConstant 3 
                                            %104 = OpTypePointer Output %92 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %111 = OpTypeVector %6 3 
                                            %112 = OpTypePointer Output %111 
                      Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                            %114 = OpTypePointer Input %111 
                               Input f32_3* %115 = OpVariable Input 
                                            %117 = OpTypePointer Output %6 
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
                                       f32_4 %80 = OpLoad %9 
                               Output f32_4* %82 = OpAccessChain %79 %27 
                                                     OpStore %82 %80 
                                Private f32* %85 = OpAccessChain %9 %75 
                                         f32 %86 = OpLoad %85 
                                Uniform f32* %89 = OpAccessChain %20 %27 %87 
                                         f32 %90 = OpLoad %89 
                                         f32 %91 = OpFMul %86 %90 
                                                     OpStore %84 %91 
                                       f32_4 %93 = OpLoad %9 
                                       f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                       f32_2 %97 = OpFMul %94 %96 
                                       f32_4 %98 = OpLoad %9 
                                       f32_4 %99 = OpVectorShuffle %98 %97 4 1 5 3 
                                                     OpStore %9 %99 
                                        f32 %100 = OpLoad %84 
                                        f32 %101 = OpFMul %100 %95 
                               Private f32* %103 = OpAccessChain %9 %102 
                                                     OpStore %103 %101 
                                      f32_4 %106 = OpLoad %9 
                                      f32_2 %107 = OpVectorShuffle %106 %106 2 2 
                                      f32_4 %108 = OpLoad %9 
                                      f32_2 %109 = OpVectorShuffle %108 %108 0 3 
                                      f32_2 %110 = OpFAdd %107 %109 
                                                     OpStore vs_TEXCOORD0 %110 
                                      f32_3 %116 = OpLoad %115 
                                                     OpStore vs_TEXCOORD1 %116 
                                Output f32* %118 = OpAccessChain %79 %27 %75 
                                        f32 %119 = OpLoad %118 
                                        f32 %120 = OpFNegate %119 
                                Output f32* %121 = OpAccessChain %79 %27 %75 
                                                     OpStore %121 %120 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 252
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %26 %53 %69 %242 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpExecutionMode %4 DepthReplacing 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %12 ArrayStride 12 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpMemberDecorate %15 0 Offset 15 
                                                      OpMemberDecorate %15 1 Offset 15 
                                                      OpMemberDecorate %15 2 Offset 15 
                                                      OpMemberDecorate %15 3 Offset 15 
                                                      OpMemberDecorate %15 4 Offset 15 
                                                      OpDecorate %15 Block 
                                                      OpDecorate %17 DescriptorSet 17 
                                                      OpDecorate %17 Binding 17 
                                                      OpDecorate vs_TEXCOORD1 Location 26 
                                                      OpDecorate %43 DescriptorSet 43 
                                                      OpDecorate %43 Binding 43 
                                                      OpDecorate %47 DescriptorSet 47 
                                                      OpDecorate %47 Binding 47 
                                                      OpDecorate vs_TEXCOORD0 Location 53 
                                                      OpDecorate %69 BuiltIn 69 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %242 Location 242 
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
                                              %15 = OpTypeStruct %7 %7 %12 %13 %14 
                                              %16 = OpTypePointer Uniform %15 
Uniform struct {f32_4; f32_4; f32_4[4]; f32_4[4]; f32_4[4];}* %17 = OpVariable Uniform 
                                              %18 = OpTypeInt 32 1 
                                          i32 %19 = OpConstant 0 
                                          u32 %20 = OpConstant 2 
                                              %21 = OpTypePointer Uniform %6 
                                              %24 = OpTypeVector %6 3 
                                              %25 = OpTypePointer Input %24 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %27 = OpTypePointer Input %6 
                                          u32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Private %6 
                                 Private f32* %40 = OpVariable Private 
                                              %41 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %42 = OpTypePointer UniformConstant %41 
         UniformConstant read_only Texture2D* %43 = OpVariable UniformConstant 
                                              %45 = OpTypeSampler 
                                              %46 = OpTypePointer UniformConstant %45 
                     UniformConstant sampler* %47 = OpVariable UniformConstant 
                                              %49 = OpTypeSampledImage %41 
                                              %51 = OpTypeVector %6 2 
                                              %52 = OpTypePointer Input %51 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                               Private f32_4* %57 = OpVariable Private 
                                          i32 %58 = OpConstant 1 
                                          u32 %63 = OpConstant 1 
                                              %68 = OpTypePointer Output %6 
                                  Output f32* %69 = OpVariable Output 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          i32 %84 = OpConstant 2 
                                              %85 = OpTypePointer Uniform %7 
                                         i32 %104 = OpConstant 3 
                                         i32 %110 = OpConstant 4 
                                       f32_2 %159 = OpConstantComposite %71 %71 
                                         f32 %165 = OpConstant 3.674022E-40 
                                             %174 = OpTypePointer Private %24 
                              Private f32_3* %175 = OpVariable Private 
                                             %241 = OpTypePointer Output %7 
                               Output f32_4* %242 = OpVariable Output 
                                         f32 %247 = OpConstant 3.674022E-40 
                                       f32_2 %248 = OpConstantComposite %247 %71 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %22 = OpAccessChain %17 %19 %20 
                                          f32 %23 = OpLoad %22 
                                   Input f32* %28 = OpAccessChain vs_TEXCOORD1 %20 
                                          f32 %29 = OpLoad %28 
                                          f32 %30 = OpFDiv %23 %29 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                                      OpStore %33 %30 
                                        f32_4 %34 = OpLoad %9 
                                        f32_3 %35 = OpVectorShuffle %34 %34 0 0 0 
                                        f32_3 %36 = OpLoad vs_TEXCOORD1 
                                        f32_3 %37 = OpFMul %35 %36 
                                        f32_4 %38 = OpLoad %9 
                                        f32_4 %39 = OpVectorShuffle %38 %37 4 5 6 3 
                                                      OpStore %9 %39 
                          read_only Texture2D %44 = OpLoad %43 
                                      sampler %48 = OpLoad %47 
                   read_only Texture2DSampled %50 = OpSampledImage %44 %48 
                                        f32_2 %54 = OpLoad vs_TEXCOORD0 
                                        f32_4 %55 = OpImageSampleImplicitLod %50 %54 
                                          f32 %56 = OpCompositeExtract %55 0 
                                                      OpStore %40 %56 
                                 Uniform f32* %59 = OpAccessChain %17 %58 %31 
                                          f32 %60 = OpLoad %59 
                                          f32 %61 = OpLoad %40 
                                          f32 %62 = OpFMul %60 %61 
                                 Uniform f32* %64 = OpAccessChain %17 %58 %63 
                                          f32 %65 = OpLoad %64 
                                          f32 %66 = OpFAdd %62 %65 
                                 Private f32* %67 = OpAccessChain %57 %31 
                                                      OpStore %67 %66 
                                          f32 %70 = OpLoad %40 
                                                      OpStore %69 %70 
                                 Private f32* %72 = OpAccessChain %57 %31 
                                          f32 %73 = OpLoad %72 
                                          f32 %74 = OpFDiv %71 %73 
                                                      OpStore %40 %74 
                                          f32 %75 = OpLoad %40 
                                        f32_3 %76 = OpCompositeConstruct %75 %75 %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_3 %78 = OpVectorShuffle %77 %77 0 1 2 
                                        f32_3 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %9 
                                        f32_4 %81 = OpVectorShuffle %80 %79 4 5 6 3 
                                                      OpStore %9 %81 
                                        f32_4 %82 = OpLoad %9 
                                        f32_4 %83 = OpVectorShuffle %82 %82 1 1 1 1 
                               Uniform f32_4* %86 = OpAccessChain %17 %84 %58 
                                        f32_4 %87 = OpLoad %86 
                                        f32_4 %88 = OpFMul %83 %87 
                                                      OpStore %57 %88 
                               Uniform f32_4* %89 = OpAccessChain %17 %84 %19 
                                        f32_4 %90 = OpLoad %89 
                                        f32_4 %91 = OpLoad %9 
                                        f32_4 %92 = OpVectorShuffle %91 %91 0 0 0 0 
                                        f32_4 %93 = OpFMul %90 %92 
                                        f32_4 %94 = OpLoad %57 
                                        f32_4 %95 = OpFAdd %93 %94 
                                                      OpStore %57 %95 
                               Uniform f32_4* %96 = OpAccessChain %17 %84 %84 
                                        f32_4 %97 = OpLoad %96 
                                        f32_4 %98 = OpLoad %9 
                                        f32_4 %99 = OpVectorShuffle %98 %98 2 2 2 2 
                                       f32_4 %100 = OpFMul %97 %99 
                                       f32_4 %101 = OpLoad %57 
                                       f32_4 %102 = OpFAdd %100 %101 
                                                      OpStore %9 %102 
                                       f32_4 %103 = OpLoad %9 
                              Uniform f32_4* %105 = OpAccessChain %17 %84 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpFAdd %103 %106 
                                                      OpStore %9 %107 
                                       f32_4 %108 = OpLoad %9 
                                       f32_3 %109 = OpVectorShuffle %108 %108 1 1 1 
                              Uniform f32_4* %111 = OpAccessChain %17 %110 %58 
                                       f32_4 %112 = OpLoad %111 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 3 
                                       f32_3 %114 = OpFMul %109 %113 
                                       f32_4 %115 = OpLoad %57 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %57 %116 
                              Uniform f32_4* %117 = OpAccessChain %17 %110 %19 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 3 
                                       f32_4 %120 = OpLoad %9 
                                       f32_3 %121 = OpVectorShuffle %120 %120 0 0 0 
                                       f32_3 %122 = OpFMul %119 %121 
                                       f32_4 %123 = OpLoad %57 
                                       f32_3 %124 = OpVectorShuffle %123 %123 0 1 2 
                                       f32_3 %125 = OpFAdd %122 %124 
                                       f32_4 %126 = OpLoad %57 
                                       f32_4 %127 = OpVectorShuffle %126 %125 4 5 6 3 
                                                      OpStore %57 %127 
                              Uniform f32_4* %128 = OpAccessChain %17 %110 %84 
                                       f32_4 %129 = OpLoad %128 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 3 
                                       f32_4 %131 = OpLoad %9 
                                       f32_3 %132 = OpVectorShuffle %131 %131 2 2 2 
                                       f32_3 %133 = OpFMul %130 %132 
                                       f32_4 %134 = OpLoad %57 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                       f32_3 %136 = OpFAdd %133 %135 
                                       f32_4 %137 = OpLoad %57 
                                       f32_4 %138 = OpVectorShuffle %137 %136 4 5 6 3 
                                                      OpStore %57 %138 
                              Uniform f32_4* %139 = OpAccessChain %17 %110 %104 
                                       f32_4 %140 = OpLoad %139 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 3 
                                       f32_4 %142 = OpLoad %9 
                                       f32_3 %143 = OpVectorShuffle %142 %142 3 3 3 
                                       f32_3 %144 = OpFMul %141 %143 
                                       f32_4 %145 = OpLoad %57 
                                       f32_3 %146 = OpVectorShuffle %145 %145 0 1 2 
                                       f32_3 %147 = OpFAdd %144 %146 
                                       f32_4 %148 = OpLoad %57 
                                       f32_4 %149 = OpVectorShuffle %148 %147 4 5 6 3 
                                                      OpStore %57 %149 
                                       f32_4 %150 = OpLoad %57 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                                       f32_4 %152 = OpLoad %57 
                                       f32_2 %153 = OpVectorShuffle %152 %152 2 2 
                                       f32_2 %154 = OpFDiv %151 %153 
                                       f32_4 %155 = OpLoad %57 
                                       f32_4 %156 = OpVectorShuffle %155 %154 4 5 2 3 
                                                      OpStore %57 %156 
                                       f32_4 %157 = OpLoad %57 
                                       f32_2 %158 = OpVectorShuffle %157 %157 0 1 
                                       f32_2 %160 = OpFAdd %158 %159 
                                       f32_4 %161 = OpLoad %57 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 3 
                                                      OpStore %57 %162 
                                Private f32* %163 = OpAccessChain %57 %31 
                                         f32 %164 = OpLoad %163 
                                         f32 %166 = OpFMul %164 %165 
                                Private f32* %167 = OpAccessChain %57 %31 
                                                      OpStore %167 %166 
                                Private f32* %168 = OpAccessChain %57 %63 
                                         f32 %169 = OpLoad %168 
                                         f32 %170 = OpFNegate %169 
                                         f32 %171 = OpFMul %170 %165 
                                         f32 %172 = OpFAdd %171 %71 
                                Private f32* %173 = OpAccessChain %57 %20 
                                                      OpStore %173 %172 
                                       f32_4 %176 = OpLoad %9 
                                       f32_3 %177 = OpVectorShuffle %176 %176 1 1 1 
                              Uniform f32_4* %178 = OpAccessChain %17 %104 %58 
                                       f32_4 %179 = OpLoad %178 
                                       f32_3 %180 = OpVectorShuffle %179 %179 0 1 3 
                                       f32_3 %181 = OpFMul %177 %180 
                                                      OpStore %175 %181 
                              Uniform f32_4* %182 = OpAccessChain %17 %104 %19 
                                       f32_4 %183 = OpLoad %182 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 3 
                                       f32_4 %185 = OpLoad %9 
                                       f32_3 %186 = OpVectorShuffle %185 %185 0 0 0 
                                       f32_3 %187 = OpFMul %184 %186 
                                       f32_3 %188 = OpLoad %175 
                                       f32_3 %189 = OpFAdd %187 %188 
                                                      OpStore %175 %189 
                              Uniform f32_4* %190 = OpAccessChain %17 %104 %84 
                                       f32_4 %191 = OpLoad %190 
                                       f32_3 %192 = OpVectorShuffle %191 %191 0 1 3 
                                       f32_4 %193 = OpLoad %9 
                                       f32_3 %194 = OpVectorShuffle %193 %193 2 2 2 
                                       f32_3 %195 = OpFMul %192 %194 
                                       f32_3 %196 = OpLoad %175 
                                       f32_3 %197 = OpFAdd %195 %196 
                                       f32_4 %198 = OpLoad %9 
                                       f32_4 %199 = OpVectorShuffle %198 %197 4 5 6 3 
                                                      OpStore %9 %199 
                              Uniform f32_4* %200 = OpAccessChain %17 %104 %104 
                                       f32_4 %201 = OpLoad %200 
                                       f32_3 %202 = OpVectorShuffle %201 %201 0 1 3 
                                       f32_4 %203 = OpLoad %9 
                                       f32_3 %204 = OpVectorShuffle %203 %203 3 3 3 
                                       f32_3 %205 = OpFMul %202 %204 
                                       f32_4 %206 = OpLoad %9 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpFAdd %205 %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_4 %210 = OpVectorShuffle %209 %208 4 5 6 3 
                                                      OpStore %9 %210 
                                       f32_4 %211 = OpLoad %9 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                       f32_4 %213 = OpLoad %9 
                                       f32_2 %214 = OpVectorShuffle %213 %213 2 2 
                                       f32_2 %215 = OpFDiv %212 %214 
                                       f32_4 %216 = OpLoad %9 
                                       f32_4 %217 = OpVectorShuffle %216 %215 4 5 2 3 
                                                      OpStore %9 %217 
                                       f32_4 %218 = OpLoad %9 
                                       f32_2 %219 = OpVectorShuffle %218 %218 0 1 
                                       f32_2 %220 = OpFAdd %219 %159 
                                       f32_4 %221 = OpLoad %9 
                                       f32_4 %222 = OpVectorShuffle %221 %220 4 5 2 3 
                                                      OpStore %9 %222 
                                Private f32* %223 = OpAccessChain %9 %31 
                                         f32 %224 = OpLoad %223 
                                         f32 %225 = OpFMul %224 %165 
                                Private f32* %226 = OpAccessChain %9 %31 
                                                      OpStore %226 %225 
                                Private f32* %227 = OpAccessChain %9 %63 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpFMul %229 %165 
                                         f32 %231 = OpFAdd %230 %71 
                                Private f32* %232 = OpAccessChain %9 %20 
                                                      OpStore %232 %231 
                                       f32_4 %233 = OpLoad %57 
                                       f32_2 %234 = OpVectorShuffle %233 %233 0 2 
                                       f32_2 %235 = OpFNegate %234 
                                       f32_4 %236 = OpLoad %9 
                                       f32_2 %237 = OpVectorShuffle %236 %236 0 2 
                                       f32_2 %238 = OpFAdd %235 %237 
                                       f32_4 %239 = OpLoad %9 
                                       f32_4 %240 = OpVectorShuffle %239 %238 4 5 2 3 
                                                      OpStore %9 %240 
                                       f32_4 %243 = OpLoad %9 
                                       f32_2 %244 = OpVectorShuffle %243 %243 0 1 
                                       f32_4 %245 = OpLoad %242 
                                       f32_4 %246 = OpVectorShuffle %245 %244 4 5 2 3 
                                                      OpStore %242 %246 
                                       f32_4 %249 = OpLoad %242 
                                       f32_4 %250 = OpVectorShuffle %249 %248 0 1 4 5 
                                                      OpStore %242 %250 
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