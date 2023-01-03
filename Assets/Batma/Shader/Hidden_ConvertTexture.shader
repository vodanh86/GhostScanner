//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ConvertTexture" {
Properties {
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 35090
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
vec3 ImmCB_0_0_0[4];
vec2 ImmCB_0_4_2[6];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _faceIndex;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
int u_xlati4;
void main()
{
	ImmCB_0_0_0[0] = vec3(0.0, 0.0, -1.0);
	ImmCB_0_0_0[1] = vec3(0.0, 0.0, 1.0);
	ImmCB_0_0_0[2] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_0_0[3] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_4_2[0] = vec2(0.0, -1.0);
	ImmCB_0_4_2[1] = vec2(0.0, -1.0);
	ImmCB_0_4_2[2] = vec2(1.0, 0.0);
	ImmCB_0_4_2[3] = vec2(-1.0, 0.0);
	ImmCB_0_4_2[4] = vec2(0.0, -1.0);
	ImmCB_0_4_2[5] = vec2(0.0, -1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = 0.0;
    u_xlat1.z = 0.0;
    u_xlati4 = int(_faceIndex);
    u_xlat1.xy = ImmCB_0_0_0[u_xlati4].zx * ImmCB_0_4_2[u_xlati4].yx;
    u_xlat2.xz = ImmCB_0_4_2[u_xlati4].xy;
    u_xlat2.y = ImmCB_0_0_0[u_xlati4].z;
    u_xlat0.z = ImmCB_0_0_0[u_xlati4].x;
    u_xlat0.xzw = (-u_xlat2.xyz) * u_xlat0.xxz + u_xlat1.xyz;
    u_xlat1.y = 0.0;
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xz = ImmCB_0_0_0[u_xlati4].xz;
    u_xlat3.yz = ImmCB_0_4_2[u_xlati4].yx;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat3.x = 0.0;
    vs_TEXCOORD0.xyz = u_xlat2.yyy * u_xlat3.xyz + u_xlat0.xyz;
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
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
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
vec3 ImmCB_0_0_0[4];
vec2 ImmCB_0_4_2[6];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _faceIndex;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
int u_xlati4;
void main()
{
	ImmCB_0_0_0[0] = vec3(0.0, 0.0, -1.0);
	ImmCB_0_0_0[1] = vec3(0.0, 0.0, 1.0);
	ImmCB_0_0_0[2] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_0_0[3] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_4_2[0] = vec2(0.0, -1.0);
	ImmCB_0_4_2[1] = vec2(0.0, -1.0);
	ImmCB_0_4_2[2] = vec2(1.0, 0.0);
	ImmCB_0_4_2[3] = vec2(-1.0, 0.0);
	ImmCB_0_4_2[4] = vec2(0.0, -1.0);
	ImmCB_0_4_2[5] = vec2(0.0, -1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = 0.0;
    u_xlat1.z = 0.0;
    u_xlati4 = int(_faceIndex);
    u_xlat1.xy = ImmCB_0_0_0[u_xlati4].zx * ImmCB_0_4_2[u_xlati4].yx;
    u_xlat2.xz = ImmCB_0_4_2[u_xlati4].xy;
    u_xlat2.y = ImmCB_0_0_0[u_xlati4].z;
    u_xlat0.z = ImmCB_0_0_0[u_xlati4].x;
    u_xlat0.xzw = (-u_xlat2.xyz) * u_xlat0.xxz + u_xlat1.xyz;
    u_xlat1.y = 0.0;
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xz = ImmCB_0_0_0[u_xlati4].xz;
    u_xlat3.yz = ImmCB_0_4_2[u_xlati4].yx;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat3.x = 0.0;
    vs_TEXCOORD0.xyz = u_xlat2.yyy * u_xlat3.xyz + u_xlat0.xyz;
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
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
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
vec3 ImmCB_0_0_0[4];
vec2 ImmCB_0_4_2[6];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _faceIndex;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec3 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
int u_xlati4;
void main()
{
	ImmCB_0_0_0[0] = vec3(0.0, 0.0, -1.0);
	ImmCB_0_0_0[1] = vec3(0.0, 0.0, 1.0);
	ImmCB_0_0_0[2] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_0_0[3] = vec3(1.0, 0.0, 0.0);
	ImmCB_0_4_2[0] = vec2(0.0, -1.0);
	ImmCB_0_4_2[1] = vec2(0.0, -1.0);
	ImmCB_0_4_2[2] = vec2(1.0, 0.0);
	ImmCB_0_4_2[3] = vec2(-1.0, 0.0);
	ImmCB_0_4_2[4] = vec2(0.0, -1.0);
	ImmCB_0_4_2[5] = vec2(0.0, -1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.x = 0.0;
    u_xlat1.z = 0.0;
    u_xlati4 = int(_faceIndex);
    u_xlat1.xy = ImmCB_0_0_0[u_xlati4].zx * ImmCB_0_4_2[u_xlati4].yx;
    u_xlat2.xz = ImmCB_0_4_2[u_xlati4].xy;
    u_xlat2.y = ImmCB_0_0_0[u_xlati4].z;
    u_xlat0.z = ImmCB_0_0_0[u_xlati4].x;
    u_xlat0.xzw = (-u_xlat2.xyz) * u_xlat0.xxz + u_xlat1.xyz;
    u_xlat1.y = 0.0;
    u_xlat2.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.xy = u_xlat2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xz = ImmCB_0_0_0[u_xlati4].xz;
    u_xlat3.yz = ImmCB_0_4_2[u_xlati4].yx;
    u_xlat0.xyz = u_xlat2.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat3.x = 0.0;
    vs_TEXCOORD0.xyz = u_xlat2.yyy * u_xlat3.xyz + u_xlat0.xyz;
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
in highp vec3 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xyz);
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
; Bound: 230
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %164 %216 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %164 Location 164 
                                                      OpDecorate vs_TEXCOORD0 Location 216 
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
                                              %18 = OpTypeStruct %16 %17 %7 %6 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32;}* %20 = OpVariable Uniform 
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
                                          f32 %82 = OpConstant 3.674022E-40 
                                          u32 %83 = OpConstant 0 
                                              %84 = OpTypePointer Private %6 
                                          u32 %86 = OpConstant 2 
                                              %88 = OpTypePointer Private %21 
                                 Private i32* %89 = OpVariable Private 
                                              %90 = OpTypePointer Uniform %6 
                                              %94 = OpTypeVector %14 4 
                                          u32 %95 = OpConstant 10 
                                              %96 = OpTypeArray %94 %95 
                                          u32 %97 = OpConstant 3212836864 
                                        u32_4 %98 = OpConstantComposite %83 %83 %97 %83 
                                          u32 %99 = OpConstant 1065353216 
                                       u32_4 %100 = OpConstantComposite %83 %83 %99 %83 
                                       u32_4 %101 = OpConstantComposite %99 %83 %83 %83 
                                       u32_4 %102 = OpConstantComposite %99 %83 %83 %97 
                                       u32_4 %103 = OpConstantComposite %97 %83 %83 %97 
                                       u32_4 %104 = OpConstantComposite %83 %83 %83 %97 
                                   u32_4[10] %105 = OpConstantComposite %98 %100 %101 %101 %102 %103 %100 %98 %104 %104 
                                             %107 = OpTypeVector %14 2 
                                             %108 = OpTypePointer Function %96 
                                             %110 = OpTypePointer Function %94 
                                             %114 = OpTypeVector %6 2 
                                         i32 %117 = OpConstant 4 
                                             %127 = OpTypeVector %6 3 
                                             %128 = OpTypePointer Private %127 
                              Private f32_3* %129 = OpVariable Private 
                                             %141 = OpTypePointer Function %14 
                                             %163 = OpTypePointer Input %114 
                                Input f32_2* %164 = OpVariable Input 
                                         f32 %178 = OpConstant 3.674022E-40 
                                       f32_2 %179 = OpConstantComposite %178 %178 
                                         f32 %181 = OpConstant 3.674022E-40 
                                       f32_2 %182 = OpConstantComposite %181 %181 
                              Private f32_3* %194 = OpVariable Private 
                                             %215 = OpTypePointer Output %127 
                       Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                             %224 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                         Function u32_4[10]* %109 = OpVariable Function 
                         Function u32_4[10]* %119 = OpVariable Function 
                         Function u32_4[10]* %132 = OpVariable Function 
                         Function u32_4[10]* %140 = OpVariable Function 
                         Function u32_4[10]* %147 = OpVariable Function 
                         Function u32_4[10]* %187 = OpVariable Function 
                         Function u32_4[10]* %197 = OpVariable Function 
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
                                 Private f32* %85 = OpAccessChain %9 %83 
                                                      OpStore %85 %82 
                                 Private f32* %87 = OpAccessChain %48 %86 
                                                      OpStore %87 %82 
                                 Uniform f32* %91 = OpAccessChain %20 %44 
                                          f32 %92 = OpLoad %91 
                                          i32 %93 = OpConvertFToS %92 
                                                      OpStore %89 %93 
                                         i32 %106 = OpLoad %89 
                                                      OpStore %109 %105 
                             Function u32_4* %111 = OpAccessChain %109 %106 
                                       u32_4 %112 = OpLoad %111 
                                       u32_2 %113 = OpVectorShuffle %112 %112 2 0 
                                       f32_2 %115 = OpBitcast %113 
                                         i32 %116 = OpLoad %89 
                                         i32 %118 = OpIAdd %116 %117 
                                                      OpStore %119 %105 
                             Function u32_4* %120 = OpAccessChain %119 %118 
                                       u32_4 %121 = OpLoad %120 
                                       u32_2 %122 = OpVectorShuffle %121 %121 3 2 
                                       f32_2 %123 = OpBitcast %122 
                                       f32_2 %124 = OpFMul %115 %123 
                                       f32_4 %125 = OpLoad %48 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 2 3 
                                                      OpStore %48 %126 
                                         i32 %130 = OpLoad %89 
                                         i32 %131 = OpIAdd %130 %117 
                                                      OpStore %132 %105 
                             Function u32_4* %133 = OpAccessChain %132 %131 
                                       u32_4 %134 = OpLoad %133 
                                       u32_2 %135 = OpVectorShuffle %134 %134 2 3 
                                       f32_2 %136 = OpBitcast %135 
                                       f32_3 %137 = OpLoad %129 
                                       f32_3 %138 = OpVectorShuffle %137 %136 3 1 4 
                                                      OpStore %129 %138 
                                         i32 %139 = OpLoad %89 
                                                      OpStore %140 %105 
                               Function u32* %142 = OpAccessChain %140 %139 %86 
                                         u32 %143 = OpLoad %142 
                                         f32 %144 = OpBitcast %143 
                                Private f32* %145 = OpAccessChain %129 %68 
                                                      OpStore %145 %144 
                                         i32 %146 = OpLoad %89 
                                                      OpStore %147 %105 
                               Function u32* %148 = OpAccessChain %147 %146 %83 
                                         u32 %149 = OpLoad %148 
                                         f32 %150 = OpBitcast %149 
                                Private f32* %151 = OpAccessChain %9 %86 
                                                      OpStore %151 %150 
                                       f32_3 %152 = OpLoad %129 
                                       f32_3 %153 = OpFNegate %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 0 2 
                                       f32_3 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %48 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpFAdd %156 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 6 
                                                      OpStore %9 %161 
                                Private f32* %162 = OpAccessChain %48 %68 
                                                      OpStore %162 %82 
                                       f32_2 %165 = OpLoad %164 
                              Uniform f32_4* %166 = OpAccessChain %20 %35 
                                       f32_4 %167 = OpLoad %166 
                                       f32_2 %168 = OpVectorShuffle %167 %167 0 1 
                                       f32_2 %169 = OpFMul %165 %168 
                              Uniform f32_4* %170 = OpAccessChain %20 %35 
                                       f32_4 %171 = OpLoad %170 
                                       f32_2 %172 = OpVectorShuffle %171 %171 2 3 
                                       f32_2 %173 = OpFAdd %169 %172 
                                       f32_3 %174 = OpLoad %129 
                                       f32_3 %175 = OpVectorShuffle %174 %173 3 4 2 
                                                      OpStore %129 %175 
                                       f32_3 %176 = OpLoad %129 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 1 
                                       f32_2 %180 = OpFMul %177 %179 
                                       f32_2 %183 = OpFAdd %180 %182 
                                       f32_3 %184 = OpLoad %129 
                                       f32_3 %185 = OpVectorShuffle %184 %183 3 4 2 
                                                      OpStore %129 %185 
                                         i32 %186 = OpLoad %89 
                                                      OpStore %187 %105 
                             Function u32_4* %188 = OpAccessChain %187 %186 
                                       u32_4 %189 = OpLoad %188 
                                       u32_2 %190 = OpVectorShuffle %189 %189 0 2 
                                       f32_2 %191 = OpBitcast %190 
                                       f32_4 %192 = OpLoad %48 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 1 5 3 
                                                      OpStore %48 %193 
                                         i32 %195 = OpLoad %89 
                                         i32 %196 = OpIAdd %195 %117 
                                                      OpStore %197 %105 
                             Function u32_4* %198 = OpAccessChain %197 %196 
                                       u32_4 %199 = OpLoad %198 
                                       u32_2 %200 = OpVectorShuffle %199 %199 3 2 
                                       f32_2 %201 = OpBitcast %200 
                                       f32_3 %202 = OpLoad %194 
                                       f32_3 %203 = OpVectorShuffle %202 %201 0 3 4 
                                                      OpStore %194 %203 
                                       f32_3 %204 = OpLoad %129 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 0 0 
                                       f32_4 %206 = OpLoad %48 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 2 3 
                                       f32_3 %211 = OpFAdd %208 %210 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpVectorShuffle %212 %211 4 5 6 3 
                                                      OpStore %9 %213 
                                Private f32* %214 = OpAccessChain %194 %83 
                                                      OpStore %214 %82 
                                       f32_3 %217 = OpLoad %129 
                                       f32_3 %218 = OpVectorShuffle %217 %217 1 1 1 
                                       f32_3 %219 = OpLoad %194 
                                       f32_3 %220 = OpFMul %218 %219 
                                       f32_4 %221 = OpLoad %9 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                                       f32_3 %223 = OpFAdd %220 %222 
                                                      OpStore vs_TEXCOORD0 %223 
                                 Output f32* %225 = OpAccessChain %72 %22 %68 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFNegate %226 
                                 Output f32* %228 = OpAccessChain %72 %22 %68 
                                                      OpStore %228 %227 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 29
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %22 %26 
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
                                               OpDecorate %26 Location 26 
                                               OpDecorate %27 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypeVector %6 3 
                                       %21 = OpTypePointer Input %20 
                 Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                       %25 = OpTypePointer Output %7 
                         Output f32_4* %26 = OpVariable Output 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_3 %23 = OpLoad vs_TEXCOORD0 
                                 f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                               OpStore %9 %24 
                                 f32_4 %27 = OpLoad %9 
                                               OpStore %26 %27 
                                               OpReturn
                                               OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 230
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %164 %216 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %164 Location 164 
                                                      OpDecorate vs_TEXCOORD0 Location 216 
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
                                              %18 = OpTypeStruct %16 %17 %7 %6 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32;}* %20 = OpVariable Uniform 
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
                                          f32 %82 = OpConstant 3.674022E-40 
                                          u32 %83 = OpConstant 0 
                                              %84 = OpTypePointer Private %6 
                                          u32 %86 = OpConstant 2 
                                              %88 = OpTypePointer Private %21 
                                 Private i32* %89 = OpVariable Private 
                                              %90 = OpTypePointer Uniform %6 
                                              %94 = OpTypeVector %14 4 
                                          u32 %95 = OpConstant 10 
                                              %96 = OpTypeArray %94 %95 
                                          u32 %97 = OpConstant 3212836864 
                                        u32_4 %98 = OpConstantComposite %83 %83 %97 %83 
                                          u32 %99 = OpConstant 1065353216 
                                       u32_4 %100 = OpConstantComposite %83 %83 %99 %83 
                                       u32_4 %101 = OpConstantComposite %99 %83 %83 %83 
                                       u32_4 %102 = OpConstantComposite %99 %83 %83 %97 
                                       u32_4 %103 = OpConstantComposite %97 %83 %83 %97 
                                       u32_4 %104 = OpConstantComposite %83 %83 %83 %97 
                                   u32_4[10] %105 = OpConstantComposite %98 %100 %101 %101 %102 %103 %100 %98 %104 %104 
                                             %107 = OpTypeVector %14 2 
                                             %108 = OpTypePointer Function %96 
                                             %110 = OpTypePointer Function %94 
                                             %114 = OpTypeVector %6 2 
                                         i32 %117 = OpConstant 4 
                                             %127 = OpTypeVector %6 3 
                                             %128 = OpTypePointer Private %127 
                              Private f32_3* %129 = OpVariable Private 
                                             %141 = OpTypePointer Function %14 
                                             %163 = OpTypePointer Input %114 
                                Input f32_2* %164 = OpVariable Input 
                                         f32 %178 = OpConstant 3.674022E-40 
                                       f32_2 %179 = OpConstantComposite %178 %178 
                                         f32 %181 = OpConstant 3.674022E-40 
                                       f32_2 %182 = OpConstantComposite %181 %181 
                              Private f32_3* %194 = OpVariable Private 
                                             %215 = OpTypePointer Output %127 
                       Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                             %224 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                         Function u32_4[10]* %109 = OpVariable Function 
                         Function u32_4[10]* %119 = OpVariable Function 
                         Function u32_4[10]* %132 = OpVariable Function 
                         Function u32_4[10]* %140 = OpVariable Function 
                         Function u32_4[10]* %147 = OpVariable Function 
                         Function u32_4[10]* %187 = OpVariable Function 
                         Function u32_4[10]* %197 = OpVariable Function 
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
                                 Private f32* %85 = OpAccessChain %9 %83 
                                                      OpStore %85 %82 
                                 Private f32* %87 = OpAccessChain %48 %86 
                                                      OpStore %87 %82 
                                 Uniform f32* %91 = OpAccessChain %20 %44 
                                          f32 %92 = OpLoad %91 
                                          i32 %93 = OpConvertFToS %92 
                                                      OpStore %89 %93 
                                         i32 %106 = OpLoad %89 
                                                      OpStore %109 %105 
                             Function u32_4* %111 = OpAccessChain %109 %106 
                                       u32_4 %112 = OpLoad %111 
                                       u32_2 %113 = OpVectorShuffle %112 %112 2 0 
                                       f32_2 %115 = OpBitcast %113 
                                         i32 %116 = OpLoad %89 
                                         i32 %118 = OpIAdd %116 %117 
                                                      OpStore %119 %105 
                             Function u32_4* %120 = OpAccessChain %119 %118 
                                       u32_4 %121 = OpLoad %120 
                                       u32_2 %122 = OpVectorShuffle %121 %121 3 2 
                                       f32_2 %123 = OpBitcast %122 
                                       f32_2 %124 = OpFMul %115 %123 
                                       f32_4 %125 = OpLoad %48 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 2 3 
                                                      OpStore %48 %126 
                                         i32 %130 = OpLoad %89 
                                         i32 %131 = OpIAdd %130 %117 
                                                      OpStore %132 %105 
                             Function u32_4* %133 = OpAccessChain %132 %131 
                                       u32_4 %134 = OpLoad %133 
                                       u32_2 %135 = OpVectorShuffle %134 %134 2 3 
                                       f32_2 %136 = OpBitcast %135 
                                       f32_3 %137 = OpLoad %129 
                                       f32_3 %138 = OpVectorShuffle %137 %136 3 1 4 
                                                      OpStore %129 %138 
                                         i32 %139 = OpLoad %89 
                                                      OpStore %140 %105 
                               Function u32* %142 = OpAccessChain %140 %139 %86 
                                         u32 %143 = OpLoad %142 
                                         f32 %144 = OpBitcast %143 
                                Private f32* %145 = OpAccessChain %129 %68 
                                                      OpStore %145 %144 
                                         i32 %146 = OpLoad %89 
                                                      OpStore %147 %105 
                               Function u32* %148 = OpAccessChain %147 %146 %83 
                                         u32 %149 = OpLoad %148 
                                         f32 %150 = OpBitcast %149 
                                Private f32* %151 = OpAccessChain %9 %86 
                                                      OpStore %151 %150 
                                       f32_3 %152 = OpLoad %129 
                                       f32_3 %153 = OpFNegate %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 0 2 
                                       f32_3 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %48 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpFAdd %156 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 6 
                                                      OpStore %9 %161 
                                Private f32* %162 = OpAccessChain %48 %68 
                                                      OpStore %162 %82 
                                       f32_2 %165 = OpLoad %164 
                              Uniform f32_4* %166 = OpAccessChain %20 %35 
                                       f32_4 %167 = OpLoad %166 
                                       f32_2 %168 = OpVectorShuffle %167 %167 0 1 
                                       f32_2 %169 = OpFMul %165 %168 
                              Uniform f32_4* %170 = OpAccessChain %20 %35 
                                       f32_4 %171 = OpLoad %170 
                                       f32_2 %172 = OpVectorShuffle %171 %171 2 3 
                                       f32_2 %173 = OpFAdd %169 %172 
                                       f32_3 %174 = OpLoad %129 
                                       f32_3 %175 = OpVectorShuffle %174 %173 3 4 2 
                                                      OpStore %129 %175 
                                       f32_3 %176 = OpLoad %129 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 1 
                                       f32_2 %180 = OpFMul %177 %179 
                                       f32_2 %183 = OpFAdd %180 %182 
                                       f32_3 %184 = OpLoad %129 
                                       f32_3 %185 = OpVectorShuffle %184 %183 3 4 2 
                                                      OpStore %129 %185 
                                         i32 %186 = OpLoad %89 
                                                      OpStore %187 %105 
                             Function u32_4* %188 = OpAccessChain %187 %186 
                                       u32_4 %189 = OpLoad %188 
                                       u32_2 %190 = OpVectorShuffle %189 %189 0 2 
                                       f32_2 %191 = OpBitcast %190 
                                       f32_4 %192 = OpLoad %48 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 1 5 3 
                                                      OpStore %48 %193 
                                         i32 %195 = OpLoad %89 
                                         i32 %196 = OpIAdd %195 %117 
                                                      OpStore %197 %105 
                             Function u32_4* %198 = OpAccessChain %197 %196 
                                       u32_4 %199 = OpLoad %198 
                                       u32_2 %200 = OpVectorShuffle %199 %199 3 2 
                                       f32_2 %201 = OpBitcast %200 
                                       f32_3 %202 = OpLoad %194 
                                       f32_3 %203 = OpVectorShuffle %202 %201 0 3 4 
                                                      OpStore %194 %203 
                                       f32_3 %204 = OpLoad %129 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 0 0 
                                       f32_4 %206 = OpLoad %48 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 2 3 
                                       f32_3 %211 = OpFAdd %208 %210 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpVectorShuffle %212 %211 4 5 6 3 
                                                      OpStore %9 %213 
                                Private f32* %214 = OpAccessChain %194 %83 
                                                      OpStore %214 %82 
                                       f32_3 %217 = OpLoad %129 
                                       f32_3 %218 = OpVectorShuffle %217 %217 1 1 1 
                                       f32_3 %219 = OpLoad %194 
                                       f32_3 %220 = OpFMul %218 %219 
                                       f32_4 %221 = OpLoad %9 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                                       f32_3 %223 = OpFAdd %220 %222 
                                                      OpStore vs_TEXCOORD0 %223 
                                 Output f32* %225 = OpAccessChain %72 %22 %68 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFNegate %226 
                                 Output f32* %228 = OpAccessChain %72 %22 %68 
                                                      OpStore %228 %227 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 29
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %22 %26 
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
                                               OpDecorate %26 Location 26 
                                               OpDecorate %27 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypeVector %6 3 
                                       %21 = OpTypePointer Input %20 
                 Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                       %25 = OpTypePointer Output %7 
                         Output f32_4* %26 = OpVariable Output 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_3 %23 = OpLoad vs_TEXCOORD0 
                                 f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                               OpStore %9 %24 
                                 f32_4 %27 = OpLoad %9 
                                               OpStore %26 %27 
                                               OpReturn
                                               OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 230
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %72 %164 %216 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpMemberDecorate %18 0 Offset 18 
                                                      OpMemberDecorate %18 1 Offset 18 
                                                      OpMemberDecorate %18 2 Offset 18 
                                                      OpMemberDecorate %18 3 Offset 18 
                                                      OpDecorate %18 Block 
                                                      OpDecorate %20 DescriptorSet 20 
                                                      OpDecorate %20 Binding 20 
                                                      OpMemberDecorate %70 0 BuiltIn 70 
                                                      OpMemberDecorate %70 1 BuiltIn 70 
                                                      OpMemberDecorate %70 2 BuiltIn 70 
                                                      OpDecorate %70 Block 
                                                      OpDecorate %164 Location 164 
                                                      OpDecorate vs_TEXCOORD0 Location 216 
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
                                              %18 = OpTypeStruct %16 %17 %7 %6 
                                              %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32;}* %20 = OpVariable Uniform 
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
                                          f32 %82 = OpConstant 3.674022E-40 
                                          u32 %83 = OpConstant 0 
                                              %84 = OpTypePointer Private %6 
                                          u32 %86 = OpConstant 2 
                                              %88 = OpTypePointer Private %21 
                                 Private i32* %89 = OpVariable Private 
                                              %90 = OpTypePointer Uniform %6 
                                              %94 = OpTypeVector %14 4 
                                          u32 %95 = OpConstant 10 
                                              %96 = OpTypeArray %94 %95 
                                          u32 %97 = OpConstant 3212836864 
                                        u32_4 %98 = OpConstantComposite %83 %83 %97 %83 
                                          u32 %99 = OpConstant 1065353216 
                                       u32_4 %100 = OpConstantComposite %83 %83 %99 %83 
                                       u32_4 %101 = OpConstantComposite %99 %83 %83 %83 
                                       u32_4 %102 = OpConstantComposite %99 %83 %83 %97 
                                       u32_4 %103 = OpConstantComposite %97 %83 %83 %97 
                                       u32_4 %104 = OpConstantComposite %83 %83 %83 %97 
                                   u32_4[10] %105 = OpConstantComposite %98 %100 %101 %101 %102 %103 %100 %98 %104 %104 
                                             %107 = OpTypeVector %14 2 
                                             %108 = OpTypePointer Function %96 
                                             %110 = OpTypePointer Function %94 
                                             %114 = OpTypeVector %6 2 
                                         i32 %117 = OpConstant 4 
                                             %127 = OpTypeVector %6 3 
                                             %128 = OpTypePointer Private %127 
                              Private f32_3* %129 = OpVariable Private 
                                             %141 = OpTypePointer Function %14 
                                             %163 = OpTypePointer Input %114 
                                Input f32_2* %164 = OpVariable Input 
                                         f32 %178 = OpConstant 3.674022E-40 
                                       f32_2 %179 = OpConstantComposite %178 %178 
                                         f32 %181 = OpConstant 3.674022E-40 
                                       f32_2 %182 = OpConstantComposite %181 %181 
                              Private f32_3* %194 = OpVariable Private 
                                             %215 = OpTypePointer Output %127 
                       Output f32_3* vs_TEXCOORD0 = OpVariable Output 
                                             %224 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                         Function u32_4[10]* %109 = OpVariable Function 
                         Function u32_4[10]* %119 = OpVariable Function 
                         Function u32_4[10]* %132 = OpVariable Function 
                         Function u32_4[10]* %140 = OpVariable Function 
                         Function u32_4[10]* %147 = OpVariable Function 
                         Function u32_4[10]* %187 = OpVariable Function 
                         Function u32_4[10]* %197 = OpVariable Function 
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
                                 Private f32* %85 = OpAccessChain %9 %83 
                                                      OpStore %85 %82 
                                 Private f32* %87 = OpAccessChain %48 %86 
                                                      OpStore %87 %82 
                                 Uniform f32* %91 = OpAccessChain %20 %44 
                                          f32 %92 = OpLoad %91 
                                          i32 %93 = OpConvertFToS %92 
                                                      OpStore %89 %93 
                                         i32 %106 = OpLoad %89 
                                                      OpStore %109 %105 
                             Function u32_4* %111 = OpAccessChain %109 %106 
                                       u32_4 %112 = OpLoad %111 
                                       u32_2 %113 = OpVectorShuffle %112 %112 2 0 
                                       f32_2 %115 = OpBitcast %113 
                                         i32 %116 = OpLoad %89 
                                         i32 %118 = OpIAdd %116 %117 
                                                      OpStore %119 %105 
                             Function u32_4* %120 = OpAccessChain %119 %118 
                                       u32_4 %121 = OpLoad %120 
                                       u32_2 %122 = OpVectorShuffle %121 %121 3 2 
                                       f32_2 %123 = OpBitcast %122 
                                       f32_2 %124 = OpFMul %115 %123 
                                       f32_4 %125 = OpLoad %48 
                                       f32_4 %126 = OpVectorShuffle %125 %124 4 5 2 3 
                                                      OpStore %48 %126 
                                         i32 %130 = OpLoad %89 
                                         i32 %131 = OpIAdd %130 %117 
                                                      OpStore %132 %105 
                             Function u32_4* %133 = OpAccessChain %132 %131 
                                       u32_4 %134 = OpLoad %133 
                                       u32_2 %135 = OpVectorShuffle %134 %134 2 3 
                                       f32_2 %136 = OpBitcast %135 
                                       f32_3 %137 = OpLoad %129 
                                       f32_3 %138 = OpVectorShuffle %137 %136 3 1 4 
                                                      OpStore %129 %138 
                                         i32 %139 = OpLoad %89 
                                                      OpStore %140 %105 
                               Function u32* %142 = OpAccessChain %140 %139 %86 
                                         u32 %143 = OpLoad %142 
                                         f32 %144 = OpBitcast %143 
                                Private f32* %145 = OpAccessChain %129 %68 
                                                      OpStore %145 %144 
                                         i32 %146 = OpLoad %89 
                                                      OpStore %147 %105 
                               Function u32* %148 = OpAccessChain %147 %146 %83 
                                         u32 %149 = OpLoad %148 
                                         f32 %150 = OpBitcast %149 
                                Private f32* %151 = OpAccessChain %9 %86 
                                                      OpStore %151 %150 
                                       f32_3 %152 = OpLoad %129 
                                       f32_3 %153 = OpFNegate %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_3 %155 = OpVectorShuffle %154 %154 0 0 2 
                                       f32_3 %156 = OpFMul %153 %155 
                                       f32_4 %157 = OpLoad %48 
                                       f32_3 %158 = OpVectorShuffle %157 %157 0 1 2 
                                       f32_3 %159 = OpFAdd %156 %158 
                                       f32_4 %160 = OpLoad %9 
                                       f32_4 %161 = OpVectorShuffle %160 %159 4 1 5 6 
                                                      OpStore %9 %161 
                                Private f32* %162 = OpAccessChain %48 %68 
                                                      OpStore %162 %82 
                                       f32_2 %165 = OpLoad %164 
                              Uniform f32_4* %166 = OpAccessChain %20 %35 
                                       f32_4 %167 = OpLoad %166 
                                       f32_2 %168 = OpVectorShuffle %167 %167 0 1 
                                       f32_2 %169 = OpFMul %165 %168 
                              Uniform f32_4* %170 = OpAccessChain %20 %35 
                                       f32_4 %171 = OpLoad %170 
                                       f32_2 %172 = OpVectorShuffle %171 %171 2 3 
                                       f32_2 %173 = OpFAdd %169 %172 
                                       f32_3 %174 = OpLoad %129 
                                       f32_3 %175 = OpVectorShuffle %174 %173 3 4 2 
                                                      OpStore %129 %175 
                                       f32_3 %176 = OpLoad %129 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 1 
                                       f32_2 %180 = OpFMul %177 %179 
                                       f32_2 %183 = OpFAdd %180 %182 
                                       f32_3 %184 = OpLoad %129 
                                       f32_3 %185 = OpVectorShuffle %184 %183 3 4 2 
                                                      OpStore %129 %185 
                                         i32 %186 = OpLoad %89 
                                                      OpStore %187 %105 
                             Function u32_4* %188 = OpAccessChain %187 %186 
                                       u32_4 %189 = OpLoad %188 
                                       u32_2 %190 = OpVectorShuffle %189 %189 0 2 
                                       f32_2 %191 = OpBitcast %190 
                                       f32_4 %192 = OpLoad %48 
                                       f32_4 %193 = OpVectorShuffle %192 %191 4 1 5 3 
                                                      OpStore %48 %193 
                                         i32 %195 = OpLoad %89 
                                         i32 %196 = OpIAdd %195 %117 
                                                      OpStore %197 %105 
                             Function u32_4* %198 = OpAccessChain %197 %196 
                                       u32_4 %199 = OpLoad %198 
                                       u32_2 %200 = OpVectorShuffle %199 %199 3 2 
                                       f32_2 %201 = OpBitcast %200 
                                       f32_3 %202 = OpLoad %194 
                                       f32_3 %203 = OpVectorShuffle %202 %201 0 3 4 
                                                      OpStore %194 %203 
                                       f32_3 %204 = OpLoad %129 
                                       f32_3 %205 = OpVectorShuffle %204 %204 0 0 0 
                                       f32_4 %206 = OpLoad %48 
                                       f32_3 %207 = OpVectorShuffle %206 %206 0 1 2 
                                       f32_3 %208 = OpFMul %205 %207 
                                       f32_4 %209 = OpLoad %9 
                                       f32_3 %210 = OpVectorShuffle %209 %209 0 2 3 
                                       f32_3 %211 = OpFAdd %208 %210 
                                       f32_4 %212 = OpLoad %9 
                                       f32_4 %213 = OpVectorShuffle %212 %211 4 5 6 3 
                                                      OpStore %9 %213 
                                Private f32* %214 = OpAccessChain %194 %83 
                                                      OpStore %214 %82 
                                       f32_3 %217 = OpLoad %129 
                                       f32_3 %218 = OpVectorShuffle %217 %217 1 1 1 
                                       f32_3 %219 = OpLoad %194 
                                       f32_3 %220 = OpFMul %218 %219 
                                       f32_4 %221 = OpLoad %9 
                                       f32_3 %222 = OpVectorShuffle %221 %221 0 1 2 
                                       f32_3 %223 = OpFAdd %220 %222 
                                                      OpStore vs_TEXCOORD0 %223 
                                 Output f32* %225 = OpAccessChain %72 %22 %68 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFNegate %226 
                                 Output f32* %228 = OpAccessChain %72 %22 %68 
                                                      OpStore %228 %227 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 29
; Schema: 0
                                               OpCapability Shader 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Fragment %4 "main" %22 %26 
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
                                               OpDecorate %26 Location 26 
                                               OpDecorate %27 RelaxedPrecision 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypePointer Private %7 
                         Private f32_4* %9 = OpVariable Private 
                                       %10 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                       %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only TextureCube* %12 = OpVariable UniformConstant 
                                       %14 = OpTypeSampler 
                                       %15 = OpTypePointer UniformConstant %14 
              UniformConstant sampler* %16 = OpVariable UniformConstant 
                                       %18 = OpTypeSampledImage %10 
                                       %20 = OpTypeVector %6 3 
                                       %21 = OpTypePointer Input %20 
                 Input f32_3* vs_TEXCOORD0 = OpVariable Input 
                                       %25 = OpTypePointer Output %7 
                         Output f32_4* %26 = OpVariable Output 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                 read_only TextureCube %13 = OpLoad %12 
                               sampler %17 = OpLoad %16 
          read_only TextureCubeSampled %19 = OpSampledImage %13 %17 
                                 f32_3 %23 = OpLoad vs_TEXCOORD0 
                                 f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                               OpStore %9 %24 
                                 f32_4 %27 = OpLoad %9 
                                               OpStore %26 %27 
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