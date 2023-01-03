//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-DeferredReflections" {
Properties {
_SrcBlend ("", Float) = 1
_DstBlend ("", Float) = 1
}
SubShader {
 Pass {
  Blend Zero Zero, Zero Zero
  ZWrite Off
  GpuProgramID 19311
Program "vp" {
SubProgram "gles3 " {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_ProbePosition;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraGBufferTexture0;
UNITY_LOCATION(2) uniform mediump sampler2D _CameraGBufferTexture1;
UNITY_LOCATION(3) uniform mediump sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
mediump float u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat21;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat21 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat21 = _ZBufferParams.x * u_xlat21 + _ZBufferParams.y;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat3.xyz;
    u_xlat21 = dot(u_xlat3.xyz, (-u_xlat2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
    u_xlat16_4.x = (-u_xlat21) + 1.0;
    u_xlat21 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat21 = u_xlat16_4.x * u_xlat21;
    u_xlat21 = u_xlat16_4.x * u_xlat21;
    u_xlat16_4 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_1 = texture(_CameraGBufferTexture0, u_xlat1.xy).w;
    u_xlat16_5.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_5.x = max(u_xlat16_4.z, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat16_4.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xxx;
    u_xlat16_5.xyz = vec3(u_xlat21) * u_xlat16_5.xyz + u_xlat16_4.xyz;
    u_xlat21 = (-u_xlat16_4.w) + 1.0;
    u_xlat16_26 = (-u_xlat21) * 0.699999988 + 1.70000005;
    u_xlat16_26 = u_xlat21 * u_xlat16_26;
    u_xlat16_26 = u_xlat16_26 * 6.0;
    u_xlat16_6.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_6.xyz = u_xlat3.xyz * (-u_xlat16_6.xxx) + u_xlat2.xyz;
    u_xlat16_2 = textureLod(unity_SpecCube0, u_xlat16_6.xyz, u_xlat16_26);
    u_xlat16_26 = u_xlat16_2.w + -1.0;
    u_xlat16_26 = unity_SpecCube0_HDR.w * u_xlat16_26 + 1.0;
    u_xlat16_26 = u_xlat16_26 * unity_SpecCube0_HDR.x;
    u_xlat16_6.xyz = u_xlat16_2.xyz * vec3(u_xlat16_26);
    u_xlat16_6.xyz = vec3(u_xlat16_1) * u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz + (-unity_SpecCube0_BoxMax.xyz);
    u_xlat16_6.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, u_xlat16_6.xyz);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.x = dot(u_xlat16_5.xyz, u_xlat16_5.xyz);
    u_xlat16_5.x = sqrt(u_xlat16_5.x);
    u_xlat0.x = u_xlat16_5.x / unity_SpecCube1_ProbePosition.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "vulkan " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %102 %169 %175 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 102 
                                                      OpDecorate %169 Location 169 
                                                      OpDecorate vs_TEXCOORD1 Location 175 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32;}* %21 = OpVariable Uniform 
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
                                              %84 = OpTypePointer Private %6 
                                          u32 %87 = OpConstant 0 
                                              %88 = OpTypePointer Uniform %6 
                               Private f32_4* %93 = OpVariable Private 
                                              %94 = OpTypeVector %6 3 
                                          f32 %97 = OpConstant 3.674022E-40 
                                        f32_3 %98 = OpConstantComposite %97 %97 %97 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %103 = OpTypeVector %6 2 
                                         f32 %158 = OpConstant 3.674022E-40 
                                         f32 %159 = OpConstant 3.674022E-40 
                                       f32_3 %160 = OpConstantComposite %158 %158 %159 
                                             %168 = OpTypePointer Input %94 
                                Input f32_3* %169 = OpVariable Input 
                                             %174 = OpTypePointer Output %94 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %176 = OpConstant 4 
                                             %186 = OpTypePointer Output %6 
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
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                 Private f32* %85 = OpAccessChain %49 %76 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %89 = OpAccessChain %21 %28 %87 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %86 %90 
                                 Private f32* %92 = OpAccessChain %49 %76 
                                                      OpStore %92 %91 
                                        f32_4 %95 = OpLoad %49 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 3 1 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %93 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 1 5 6 
                                                      OpStore %93 %101 
                                       f32_4 %104 = OpLoad %49 
                                       f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                       f32_4 %106 = OpLoad vs_TEXCOORD0 
                                       f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %107 
                                       f32_4 %108 = OpLoad %93 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 2 
                                       f32_4 %110 = OpLoad %93 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 3 
                                       f32_2 %112 = OpFAdd %109 %111 
                                       f32_4 %113 = OpLoad vs_TEXCOORD0 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %114 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 1 1 1 
                              Uniform f32_4* %117 = OpAccessChain %21 %36 %23 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %49 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %49 %122 
                              Uniform f32_4* %123 = OpAccessChain %21 %36 %28 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_4 %129 = OpLoad %49 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %49 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %49 %133 
                              Uniform f32_4* %134 = OpAccessChain %21 %36 %36 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 2 2 2 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %49 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %9 %144 
                              Uniform f32_4* %145 = OpAccessChain %21 %36 %45 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %9 %155 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %161 = OpFMul %157 %160 
                                       f32_4 %162 = OpLoad %49 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %49 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFNegate %165 
                                       f32_3 %167 = OpFMul %166 %160 
                                       f32_3 %170 = OpLoad %169 
                                       f32_3 %171 = OpFAdd %167 %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %9 %173 
                                Uniform f32* %177 = OpAccessChain %21 %176 
                                         f32 %178 = OpLoad %177 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %49 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                                      OpStore vs_TEXCOORD1 %185 
                                 Output f32* %187 = OpAccessChain %80 %28 %76 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %80 %28 %76 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 374
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %24 %42 %317 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 RelaxedPrecision 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 24 
                                                      OpDecorate vs_TEXCOORD0 Location 42 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %140 DescriptorSet 140 
                                                      OpDecorate %140 Binding 140 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %147 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %184 DescriptorSet 184 
                                                      OpDecorate %184 Binding 184 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %186 DescriptorSet 186 
                                                      OpDecorate %186 Binding 186 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %192 DescriptorSet 192 
                                                      OpDecorate %192 Binding 192 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %194 DescriptorSet 194 
                                                      OpDecorate %194 Binding 194 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %215 RelaxedPrecision 
                                                      OpDecorate %216 RelaxedPrecision 
                                                      OpDecorate %217 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %225 RelaxedPrecision 
                                                      OpDecorate %227 RelaxedPrecision 
                                                      OpDecorate %228 RelaxedPrecision 
                                                      OpDecorate %231 RelaxedPrecision 
                                                      OpDecorate %232 RelaxedPrecision 
                                                      OpDecorate %234 RelaxedPrecision 
                                                      OpDecorate %235 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %237 RelaxedPrecision 
                                                      OpDecorate %238 RelaxedPrecision 
                                                      OpDecorate %239 RelaxedPrecision 
                                                      OpDecorate %241 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %243 RelaxedPrecision 
                                                      OpDecorate %244 RelaxedPrecision 
                                                      OpDecorate %245 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %250 RelaxedPrecision 
                                                      OpDecorate %251 RelaxedPrecision 
                                                      OpDecorate %259 RelaxedPrecision 
                                                      OpDecorate %261 RelaxedPrecision 
                                                      OpDecorate %263 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %270 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %285 DescriptorSet 285 
                                                      OpDecorate %285 Binding 285 
                                                      OpDecorate %286 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %287 DescriptorSet 287 
                                                      OpDecorate %287 Binding 287 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %293 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %312 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %317 Location 317 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %320 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %354 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %7 %12 
                                              %14 = OpTypeStruct %10 %7 %7 %13 %7 %7 %7 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_3; f32_4; f32_4; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          u32 %19 = OpConstant 2 
                                              %20 = OpTypePointer Uniform %6 
                                              %23 = OpTypePointer Input %10 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %25 = OpTypePointer Input %6 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %38 = OpTypeVector %6 2 
                                              %39 = OpTypePointer Private %38 
                               Private f32_2* %40 = OpVariable Private 
                                              %41 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                 Private f32* %48 = OpVariable Private 
                                              %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %50 = OpTypePointer UniformConstant %49 
         UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                              %53 = OpTypeSampler 
                                              %54 = OpTypePointer UniformConstant %53 
                     UniformConstant sampler* %55 = OpVariable UniformConstant 
                                              %57 = OpTypeSampledImage %49 
                                          i32 %62 = OpConstant 2 
                                          u32 %67 = OpConstant 1 
                                          f32 %71 = OpConstant 3.674022E-40 
                                              %81 = OpTypePointer Private %10 
                               Private f32_3* %82 = OpVariable Private 
                                          i32 %85 = OpConstant 3 
                                              %86 = OpTypePointer Uniform %7 
                                          i32 %91 = OpConstant 0 
                                             %123 = OpTypePointer Uniform %10 
                              Private f32_3* %137 = OpVariable Private 
        UniformConstant read_only Texture2D* %138 = OpVariable UniformConstant 
                    UniformConstant sampler* %140 = OpVariable UniformConstant 
                              Private f32_3* %146 = OpVariable Private 
                                         f32 %148 = OpConstant 3.674022E-40 
                                       f32_3 %149 = OpConstantComposite %148 %148 %148 
                                         f32 %151 = OpConstant 3.674022E-40 
                                       f32_3 %152 = OpConstantComposite %151 %151 %151 
                                         f32 %168 = OpConstant 3.674022E-40 
                                Private f32* %170 = OpVariable Private 
                              Private f32_4* %183 = OpVariable Private 
        UniformConstant read_only Texture2D* %184 = OpVariable UniformConstant 
                    UniformConstant sampler* %186 = OpVariable UniformConstant 
                                Private f32* %191 = OpVariable Private 
        UniformConstant read_only Texture2D* %192 = OpVariable UniformConstant 
                    UniformConstant sampler* %194 = OpVariable UniformConstant 
                                         u32 %199 = OpConstant 3 
                              Private f32_3* %201 = OpVariable Private 
                                Private f32* %251 = OpVariable Private 
                                         f32 %254 = OpConstant 3.674022E-40 
                                         f32 %256 = OpConstant 3.674022E-40 
                                         f32 %262 = OpConstant 3.674022E-40 
                              Private f32_3* %264 = OpVariable Private 
                              Private f32_4* %282 = OpVariable Private 
                                             %283 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %284 = OpTypePointer UniformConstant %283 
      UniformConstant read_only TextureCube* %285 = OpVariable UniformConstant 
                    UniformConstant sampler* %287 = OpVariable UniformConstant 
                                             %289 = OpTypeSampledImage %283 
                                         i32 %297 = OpConstant 6 
                                             %316 = OpTypePointer Output %7 
                               Output f32_4* %317 = OpVariable Output 
                                         i32 %325 = OpConstant 4 
                                         i32 %334 = OpConstant 5 
                                       f32_3 %343 = OpConstantComposite %168 %168 %168 
                                         i32 %355 = OpConstant 7 
                                             %371 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                   Input f32* %26 = OpAccessChain vs_TEXCOORD1 %19 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFDiv %22 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 0 0 
                                        f32_3 %34 = OpLoad vs_TEXCOORD1 
                                        f32_3 %35 = OpFMul %33 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                                      OpStore %9 %37 
                                        f32_4 %43 = OpLoad vs_TEXCOORD0 
                                        f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                        f32_4 %45 = OpLoad vs_TEXCOORD0 
                                        f32_2 %46 = OpVectorShuffle %45 %45 3 3 
                                        f32_2 %47 = OpFDiv %44 %46 
                                                      OpStore %40 %47 
                          read_only Texture2D %52 = OpLoad %51 
                                      sampler %56 = OpLoad %55 
                   read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                                        f32_2 %59 = OpLoad %40 
                                        f32_4 %60 = OpImageSampleImplicitLod %58 %59 
                                          f32 %61 = OpCompositeExtract %60 0 
                                                      OpStore %48 %61 
                                 Uniform f32* %63 = OpAccessChain %16 %62 %29 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpLoad %48 
                                          f32 %66 = OpFMul %64 %65 
                                 Uniform f32* %68 = OpAccessChain %16 %62 %67 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpFAdd %66 %69 
                                                      OpStore %48 %70 
                                          f32 %72 = OpLoad %48 
                                          f32 %73 = OpFDiv %71 %72 
                                                      OpStore %48 %73 
                                          f32 %74 = OpLoad %48 
                                        f32_3 %75 = OpCompositeConstruct %74 %74 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                                      OpStore %9 %80 
                                        f32_4 %83 = OpLoad %9 
                                        f32_3 %84 = OpVectorShuffle %83 %83 1 1 1 
                               Uniform f32_4* %87 = OpAccessChain %16 %85 %18 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFMul %84 %89 
                                                      OpStore %82 %90 
                               Uniform f32_4* %92 = OpAccessChain %16 %85 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 0 0 
                                        f32_3 %97 = OpFMul %94 %96 
                                        f32_3 %98 = OpLoad %82 
                                        f32_3 %99 = OpFAdd %97 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 6 
                                                      OpStore %9 %101 
                              Uniform f32_4* %102 = OpAccessChain %16 %85 %62 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_4 %105 = OpLoad %9 
                                       f32_3 %106 = OpVectorShuffle %105 %105 2 2 2 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 3 
                                       f32_3 %110 = OpFAdd %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %9 %112 
                                       f32_4 %113 = OpLoad %9 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %16 %85 %85 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                              Uniform f32_3* %124 = OpAccessChain %16 %91 
                                       f32_3 %125 = OpLoad %124 
                                       f32_3 %126 = OpFNegate %125 
                                       f32_3 %127 = OpFAdd %122 %126 
                                                      OpStore %82 %127 
                                       f32_3 %128 = OpLoad %82 
                                       f32_3 %129 = OpLoad %82 
                                         f32 %130 = OpDot %128 %129 
                                                      OpStore %48 %130 
                                         f32 %131 = OpLoad %48 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %48 %132 
                                         f32 %133 = OpLoad %48 
                                       f32_3 %134 = OpCompositeConstruct %133 %133 %133 
                                       f32_3 %135 = OpLoad %82 
                                       f32_3 %136 = OpFMul %134 %135 
                                                      OpStore %82 %136 
                         read_only Texture2D %139 = OpLoad %138 
                                     sampler %141 = OpLoad %140 
                  read_only Texture2DSampled %142 = OpSampledImage %139 %141 
                                       f32_2 %143 = OpLoad %40 
                                       f32_4 %144 = OpImageSampleImplicitLod %142 %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                                      OpStore %137 %145 
                                       f32_3 %147 = OpLoad %137 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_3 %153 = OpFAdd %150 %152 
                                                      OpStore %146 %153 
                                       f32_3 %154 = OpLoad %146 
                                       f32_3 %155 = OpLoad %146 
                                         f32 %156 = OpDot %154 %155 
                                                      OpStore %48 %156 
                                         f32 %157 = OpLoad %48 
                                         f32 %158 = OpExtInst %1 32 %157 
                                                      OpStore %48 %158 
                                         f32 %159 = OpLoad %48 
                                       f32_3 %160 = OpCompositeConstruct %159 %159 %159 
                                       f32_3 %161 = OpLoad %146 
                                       f32_3 %162 = OpFMul %160 %161 
                                                      OpStore %146 %162 
                                       f32_3 %163 = OpLoad %146 
                                       f32_3 %164 = OpLoad %82 
                                       f32_3 %165 = OpFNegate %164 
                                         f32 %166 = OpDot %163 %165 
                                                      OpStore %48 %166 
                                         f32 %167 = OpLoad %48 
                                         f32 %169 = OpExtInst %1 43 %167 %168 %71 
                                                      OpStore %48 %169 
                                         f32 %171 = OpLoad %48 
                                         f32 %172 = OpFNegate %171 
                                         f32 %173 = OpFAdd %172 %71 
                                                      OpStore %170 %173 
                                         f32 %174 = OpLoad %170 
                                         f32 %175 = OpLoad %170 
                                         f32 %176 = OpFMul %174 %175 
                                                      OpStore %48 %176 
                                         f32 %177 = OpLoad %170 
                                         f32 %178 = OpLoad %48 
                                         f32 %179 = OpFMul %177 %178 
                                                      OpStore %48 %179 
                                         f32 %180 = OpLoad %170 
                                         f32 %181 = OpLoad %48 
                                         f32 %182 = OpFMul %180 %181 
                                                      OpStore %48 %182 
                         read_only Texture2D %185 = OpLoad %184 
                                     sampler %187 = OpLoad %186 
                  read_only Texture2DSampled %188 = OpSampledImage %185 %187 
                                       f32_2 %189 = OpLoad %40 
                                       f32_4 %190 = OpImageSampleImplicitLod %188 %189 
                                                      OpStore %183 %190 
                         read_only Texture2D %193 = OpLoad %192 
                                     sampler %195 = OpLoad %194 
                  read_only Texture2DSampled %196 = OpSampledImage %193 %195 
                                       f32_2 %197 = OpLoad %40 
                                       f32_4 %198 = OpImageSampleImplicitLod %196 %197 
                                         f32 %200 = OpCompositeExtract %198 3 
                                                      OpStore %191 %200 
                                Private f32* %202 = OpAccessChain %183 %67 
                                         f32 %203 = OpLoad %202 
                                Private f32* %204 = OpAccessChain %183 %29 
                                         f32 %205 = OpLoad %204 
                                         f32 %206 = OpExtInst %1 40 %203 %205 
                                Private f32* %207 = OpAccessChain %201 %29 
                                                      OpStore %207 %206 
                                Private f32* %208 = OpAccessChain %183 %19 
                                         f32 %209 = OpLoad %208 
                                Private f32* %210 = OpAccessChain %201 %29 
                                         f32 %211 = OpLoad %210 
                                         f32 %212 = OpExtInst %1 40 %209 %211 
                                Private f32* %213 = OpAccessChain %201 %29 
                                                      OpStore %213 %212 
                                Private f32* %214 = OpAccessChain %201 %29 
                                         f32 %215 = OpLoad %214 
                                         f32 %216 = OpFNegate %215 
                                         f32 %217 = OpFAdd %216 %71 
                                Private f32* %218 = OpAccessChain %201 %29 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %201 %29 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFNegate %220 
                                         f32 %222 = OpFAdd %221 %71 
                                Private f32* %223 = OpAccessChain %201 %29 
                                                      OpStore %223 %222 
                                Private f32* %224 = OpAccessChain %183 %199 
                                         f32 %225 = OpLoad %224 
                                Private f32* %226 = OpAccessChain %201 %29 
                                         f32 %227 = OpLoad %226 
                                         f32 %228 = OpFAdd %225 %227 
                                Private f32* %229 = OpAccessChain %201 %29 
                                                      OpStore %229 %228 
                                Private f32* %230 = OpAccessChain %201 %29 
                                         f32 %231 = OpLoad %230 
                                         f32 %232 = OpExtInst %1 43 %231 %168 %71 
                                Private f32* %233 = OpAccessChain %201 %29 
                                                      OpStore %233 %232 
                                       f32_4 %234 = OpLoad %183 
                                       f32_3 %235 = OpVectorShuffle %234 %234 0 1 2 
                                       f32_3 %236 = OpFNegate %235 
                                       f32_3 %237 = OpLoad %201 
                                       f32_3 %238 = OpVectorShuffle %237 %237 0 0 0 
                                       f32_3 %239 = OpFAdd %236 %238 
                                                      OpStore %201 %239 
                                         f32 %240 = OpLoad %48 
                                       f32_3 %241 = OpCompositeConstruct %240 %240 %240 
                                       f32_3 %242 = OpLoad %201 
                                       f32_3 %243 = OpFMul %241 %242 
                                       f32_4 %244 = OpLoad %183 
                                       f32_3 %245 = OpVectorShuffle %244 %244 0 1 2 
                                       f32_3 %246 = OpFAdd %243 %245 
                                                      OpStore %201 %246 
                                Private f32* %247 = OpAccessChain %183 %199 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpFNegate %248 
                                         f32 %250 = OpFAdd %249 %71 
                                                      OpStore %48 %250 
                                         f32 %252 = OpLoad %48 
                                         f32 %253 = OpFNegate %252 
                                         f32 %255 = OpFMul %253 %254 
                                         f32 %257 = OpFAdd %255 %256 
                                                      OpStore %251 %257 
                                         f32 %258 = OpLoad %48 
                                         f32 %259 = OpLoad %251 
                                         f32 %260 = OpFMul %258 %259 
                                                      OpStore %251 %260 
                                         f32 %261 = OpLoad %251 
                                         f32 %263 = OpFMul %261 %262 
                                                      OpStore %251 %263 
                                       f32_3 %265 = OpLoad %82 
                                       f32_3 %266 = OpLoad %146 
                                         f32 %267 = OpDot %265 %266 
                                Private f32* %268 = OpAccessChain %264 %29 
                                                      OpStore %268 %267 
                                Private f32* %269 = OpAccessChain %264 %29 
                                         f32 %270 = OpLoad %269 
                                Private f32* %271 = OpAccessChain %264 %29 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFAdd %270 %272 
                                Private f32* %274 = OpAccessChain %264 %29 
                                                      OpStore %274 %273 
                                       f32_3 %275 = OpLoad %146 
                                       f32_3 %276 = OpLoad %264 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 0 0 
                                       f32_3 %278 = OpFNegate %277 
                                       f32_3 %279 = OpFMul %275 %278 
                                       f32_3 %280 = OpLoad %82 
                                       f32_3 %281 = OpFAdd %279 %280 
                                                      OpStore %264 %281 
                       read_only TextureCube %286 = OpLoad %285 
                                     sampler %288 = OpLoad %287 
                read_only TextureCubeSampled %290 = OpSampledImage %286 %288 
                                       f32_3 %291 = OpLoad %264 
                                         f32 %292 = OpLoad %251 
                                       f32_4 %293 = OpImageSampleExplicitLod %290 %291 Lod %7 
                                                      OpStore %282 %293 
                                Private f32* %294 = OpAccessChain %282 %199 
                                         f32 %295 = OpLoad %294 
                                         f32 %296 = OpFAdd %295 %151 
                                                      OpStore %251 %296 
                                Uniform f32* %298 = OpAccessChain %16 %297 %199 
                                         f32 %299 = OpLoad %298 
                                         f32 %300 = OpLoad %251 
                                         f32 %301 = OpFMul %299 %300 
                                         f32 %302 = OpFAdd %301 %71 
                                                      OpStore %251 %302 
                                         f32 %303 = OpLoad %251 
                                Uniform f32* %304 = OpAccessChain %16 %297 %29 
                                         f32 %305 = OpLoad %304 
                                         f32 %306 = OpFMul %303 %305 
                                                      OpStore %251 %306 
                                       f32_4 %307 = OpLoad %282 
                                       f32_3 %308 = OpVectorShuffle %307 %307 0 1 2 
                                         f32 %309 = OpLoad %251 
                                       f32_3 %310 = OpCompositeConstruct %309 %309 %309 
                                       f32_3 %311 = OpFMul %308 %310 
                                                      OpStore %264 %311 
                                         f32 %312 = OpLoad %191 
                                       f32_3 %313 = OpCompositeConstruct %312 %312 %312 
                                       f32_3 %314 = OpLoad %264 
                                       f32_3 %315 = OpFMul %313 %314 
                                                      OpStore %264 %315 
                                       f32_3 %318 = OpLoad %201 
                                       f32_3 %319 = OpLoad %264 
                                       f32_3 %320 = OpFMul %318 %319 
                                       f32_4 %321 = OpLoad %317 
                                       f32_4 %322 = OpVectorShuffle %321 %320 4 5 6 3 
                                                      OpStore %317 %322 
                                       f32_4 %323 = OpLoad %9 
                                       f32_3 %324 = OpVectorShuffle %323 %323 0 1 2 
                              Uniform f32_4* %326 = OpAccessChain %16 %325 
                                       f32_4 %327 = OpLoad %326 
                                       f32_3 %328 = OpVectorShuffle %327 %327 0 1 2 
                                       f32_3 %329 = OpFNegate %328 
                                       f32_3 %330 = OpFAdd %324 %329 
                                                      OpStore %201 %330 
                                       f32_4 %331 = OpLoad %9 
                                       f32_3 %332 = OpVectorShuffle %331 %331 0 1 2 
                                       f32_3 %333 = OpFNegate %332 
                              Uniform f32_4* %335 = OpAccessChain %16 %334 
                                       f32_4 %336 = OpLoad %335 
                                       f32_3 %337 = OpVectorShuffle %336 %336 0 1 2 
                                       f32_3 %338 = OpFAdd %333 %337 
                                                      OpStore %264 %338 
                                       f32_3 %339 = OpLoad %201 
                                       f32_3 %340 = OpLoad %264 
                                       f32_3 %341 = OpExtInst %1 40 %339 %340 
                                                      OpStore %201 %341 
                                       f32_3 %342 = OpLoad %201 
                                       f32_3 %344 = OpExtInst %1 40 %342 %343 
                                                      OpStore %201 %344 
                                       f32_3 %345 = OpLoad %201 
                                       f32_3 %346 = OpLoad %201 
                                         f32 %347 = OpDot %345 %346 
                                Private f32* %348 = OpAccessChain %201 %29 
                                                      OpStore %348 %347 
                                Private f32* %349 = OpAccessChain %201 %29 
                                         f32 %350 = OpLoad %349 
                                         f32 %351 = OpExtInst %1 31 %350 
                                Private f32* %352 = OpAccessChain %201 %29 
                                                      OpStore %352 %351 
                                Private f32* %353 = OpAccessChain %201 %29 
                                         f32 %354 = OpLoad %353 
                                Uniform f32* %356 = OpAccessChain %16 %355 %199 
                                         f32 %357 = OpLoad %356 
                                         f32 %358 = OpFDiv %354 %357 
                                Private f32* %359 = OpAccessChain %9 %29 
                                                      OpStore %359 %358 
                                Private f32* %360 = OpAccessChain %9 %29 
                                         f32 %361 = OpLoad %360 
                                         f32 %362 = OpFNegate %361 
                                         f32 %363 = OpFAdd %362 %71 
                                Private f32* %364 = OpAccessChain %9 %29 
                                                      OpStore %364 %363 
                                Private f32* %365 = OpAccessChain %9 %29 
                                         f32 %366 = OpLoad %365 
                                         f32 %367 = OpExtInst %1 43 %366 %168 %71 
                                Private f32* %368 = OpAccessChain %9 %29 
                                                      OpStore %368 %367 
                                Private f32* %369 = OpAccessChain %9 %29 
                                         f32 %370 = OpLoad %369 
                                 Output f32* %372 = OpAccessChain %317 %199 
                                                      OpStore %372 %370 
                                                      OpReturn
                                                      OpFunctionEnd
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_ProbePosition;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraGBufferTexture0;
UNITY_LOCATION(2) uniform mediump sampler2D _CameraGBufferTexture1;
UNITY_LOCATION(3) uniform mediump sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
mediump float u_xlat16_18;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat16_4.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat3.xyz * (-u_xlat16_4.xxx) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, (-u_xlat2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_22 = (-u_xlat18) + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_18 = texture(_CameraGBufferTexture0, u_xlat1.xy).w;
    u_xlat1.x = (-u_xlat16_2.w) + 1.0;
    u_xlat16_5.x = (-u_xlat1.x) * 0.699999988 + 1.70000005;
    u_xlat16_5.x = u_xlat1.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * 6.0;
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat16_4.xyz, u_xlat16_5.x);
    u_xlat16_4.x = u_xlat16_3.w + -1.0;
    u_xlat16_4.x = unity_SpecCube0_HDR.w * u_xlat16_4.x + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube0_HDR.x;
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = vec3(u_xlat16_18) * u_xlat16_4.xyz;
    u_xlat18 = u_xlat1.x * u_xlat1.x;
    u_xlat16_5.x = u_xlat1.x * u_xlat18;
    u_xlat16_5.x = (-u_xlat16_5.x) * 0.280000001 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xxx;
    u_xlat16_5.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_5.x = max(u_xlat16_2.z, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat16_2.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = (-u_xlat16_2.xyz) + u_xlat16_5.xxx;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + (-unity_SpecCube0_BoxMax.xyz);
    u_xlat16_5.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = sqrt(u_xlat16_4.x);
    u_xlat0.x = u_xlat16_4.x / unity_SpecCube1_ProbePosition.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	float _LightAsQuad;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat1;
    u_xlat1.y = u_xlat1.y * _ProjectionParams.x;
    u_xlat2.xzw = u_xlat1.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD0.zw = u_xlat1.zw;
    vs_TEXCOORD0.xy = u_xlat2.zz + u_xlat2.xw;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat0.zzz + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.xyz * vec3(-1.0, -1.0, 1.0);
    u_xlat0.xyz = (-u_xlat0.xyz) * vec3(-1.0, -1.0, 1.0) + in_NORMAL0.xyz;
    vs_TEXCOORD1.xyz = vec3(_LightAsQuad) * u_xlat0.xyz + u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _ProjectionParams;
uniform 	vec4 _ZBufferParams;
uniform 	vec4 hlslcc_mtx4x4unity_CameraToWorld[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	mediump vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_ProbePosition;
UNITY_LOCATION(0) uniform highp sampler2D _CameraDepthTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _CameraGBufferTexture0;
UNITY_LOCATION(2) uniform mediump sampler2D _CameraGBufferTexture1;
UNITY_LOCATION(3) uniform mediump sampler2D _CameraGBufferTexture2;
UNITY_LOCATION(4) uniform mediump samplerCube unity_SpecCube0;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec2 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat18;
mediump float u_xlat16_18;
mediump float u_xlat16_22;
void main()
{
    u_xlat0.x = _ProjectionParams.z / vs_TEXCOORD1.z;
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat1.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat18 = texture(_CameraDepthTexture, u_xlat1.xy).x;
    u_xlat18 = _ZBufferParams.x * u_xlat18 + _ZBufferParams.y;
    u_xlat18 = float(1.0) / u_xlat18;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_CameraToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_CameraToWorld[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_CameraToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_CameraToWorld[3].xyz;
    u_xlat2.xyz = u_xlat0.xyz + (-_WorldSpaceCameraPos.xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    u_xlat16_3.xyz = texture(_CameraGBufferTexture2, u_xlat1.xy).xyz;
    u_xlat3.xyz = u_xlat16_3.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat3.xyz = vec3(u_xlat18) * u_xlat3.xyz;
    u_xlat16_4.x = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_4.xyz = u_xlat3.xyz * (-u_xlat16_4.xxx) + u_xlat2.xyz;
    u_xlat18 = dot(u_xlat3.xyz, (-u_xlat2.xyz));
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat16_22 = (-u_xlat18) + 1.0;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_22 = u_xlat16_22 * u_xlat16_22;
    u_xlat16_2 = texture(_CameraGBufferTexture1, u_xlat1.xy);
    u_xlat16_18 = texture(_CameraGBufferTexture0, u_xlat1.xy).w;
    u_xlat1.x = (-u_xlat16_2.w) + 1.0;
    u_xlat16_5.x = (-u_xlat1.x) * 0.699999988 + 1.70000005;
    u_xlat16_5.x = u_xlat1.x * u_xlat16_5.x;
    u_xlat16_5.x = u_xlat16_5.x * 6.0;
    u_xlat16_3 = textureLod(unity_SpecCube0, u_xlat16_4.xyz, u_xlat16_5.x);
    u_xlat16_4.x = u_xlat16_3.w + -1.0;
    u_xlat16_4.x = unity_SpecCube0_HDR.w * u_xlat16_4.x + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * unity_SpecCube0_HDR.x;
    u_xlat16_4.xyz = u_xlat16_3.xyz * u_xlat16_4.xxx;
    u_xlat16_4.xyz = vec3(u_xlat16_18) * u_xlat16_4.xyz;
    u_xlat18 = u_xlat1.x * u_xlat1.x;
    u_xlat16_5.x = u_xlat1.x * u_xlat18;
    u_xlat16_5.x = (-u_xlat16_5.x) * 0.280000001 + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_5.xxx;
    u_xlat16_5.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_5.x = max(u_xlat16_2.z, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    u_xlat16_5.x = u_xlat16_2.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = (-u_xlat16_2.xyz) + u_xlat16_5.xxx;
    u_xlat16_5.xyz = vec3(u_xlat16_22) * u_xlat16_5.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat16_4.xyz * u_xlat16_5.xyz;
    u_xlat16_4.xyz = u_xlat0.xyz + (-unity_SpecCube0_BoxMax.xyz);
    u_xlat16_5.xyz = (-u_xlat0.xyz) + unity_SpecCube0_BoxMin.xyz;
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_4.x = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat16_4.x = sqrt(u_xlat16_4.x);
    u_xlat0.x = u_xlat16_4.x / unity_SpecCube1_ProbePosition.w;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %102 %169 %175 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 102 
                                                      OpDecorate %169 Location 169 
                                                      OpDecorate vs_TEXCOORD1 Location 175 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32;}* %21 = OpVariable Uniform 
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
                                              %84 = OpTypePointer Private %6 
                                          u32 %87 = OpConstant 0 
                                              %88 = OpTypePointer Uniform %6 
                               Private f32_4* %93 = OpVariable Private 
                                              %94 = OpTypeVector %6 3 
                                          f32 %97 = OpConstant 3.674022E-40 
                                        f32_3 %98 = OpConstantComposite %97 %97 %97 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %103 = OpTypeVector %6 2 
                                         f32 %158 = OpConstant 3.674022E-40 
                                         f32 %159 = OpConstant 3.674022E-40 
                                       f32_3 %160 = OpConstantComposite %158 %158 %159 
                                             %168 = OpTypePointer Input %94 
                                Input f32_3* %169 = OpVariable Input 
                                             %174 = OpTypePointer Output %94 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %176 = OpConstant 4 
                                             %186 = OpTypePointer Output %6 
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
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                 Private f32* %85 = OpAccessChain %49 %76 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %89 = OpAccessChain %21 %28 %87 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %86 %90 
                                 Private f32* %92 = OpAccessChain %49 %76 
                                                      OpStore %92 %91 
                                        f32_4 %95 = OpLoad %49 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 3 1 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %93 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 1 5 6 
                                                      OpStore %93 %101 
                                       f32_4 %104 = OpLoad %49 
                                       f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                       f32_4 %106 = OpLoad vs_TEXCOORD0 
                                       f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %107 
                                       f32_4 %108 = OpLoad %93 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 2 
                                       f32_4 %110 = OpLoad %93 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 3 
                                       f32_2 %112 = OpFAdd %109 %111 
                                       f32_4 %113 = OpLoad vs_TEXCOORD0 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %114 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 1 1 1 
                              Uniform f32_4* %117 = OpAccessChain %21 %36 %23 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %49 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %49 %122 
                              Uniform f32_4* %123 = OpAccessChain %21 %36 %28 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_4 %129 = OpLoad %49 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %49 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %49 %133 
                              Uniform f32_4* %134 = OpAccessChain %21 %36 %36 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 2 2 2 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %49 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %9 %144 
                              Uniform f32_4* %145 = OpAccessChain %21 %36 %45 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %9 %155 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %161 = OpFMul %157 %160 
                                       f32_4 %162 = OpLoad %49 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %49 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFNegate %165 
                                       f32_3 %167 = OpFMul %166 %160 
                                       f32_3 %170 = OpLoad %169 
                                       f32_3 %171 = OpFAdd %167 %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %9 %173 
                                Uniform f32* %177 = OpAccessChain %21 %176 
                                         f32 %178 = OpLoad %177 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %49 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                                      OpStore vs_TEXCOORD1 %185 
                                 Output f32* %187 = OpAccessChain %80 %28 %76 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %80 %28 %76 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 407
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %24 %42 %350 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 RelaxedPrecision 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 24 
                                                      OpDecorate vs_TEXCOORD0 Location 42 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %140 DescriptorSet 140 
                                                      OpDecorate %140 Binding 140 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %202 DescriptorSet 202 
                                                      OpDecorate %202 Binding 202 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %204 DescriptorSet 204 
                                                      OpDecorate %204 Binding 204 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %212 DescriptorSet 212 
                                                      OpDecorate %212 Binding 212 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %246 DescriptorSet 246 
                                                      OpDecorate %246 Binding 246 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %350 Location 350 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %7 %12 
                                              %14 = OpTypeStruct %10 %7 %7 %13 %7 %7 %7 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_3; f32_4; f32_4; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          u32 %19 = OpConstant 2 
                                              %20 = OpTypePointer Uniform %6 
                                              %23 = OpTypePointer Input %10 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %25 = OpTypePointer Input %6 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %38 = OpTypeVector %6 2 
                                              %39 = OpTypePointer Private %38 
                               Private f32_2* %40 = OpVariable Private 
                                              %41 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                 Private f32* %48 = OpVariable Private 
                                              %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %50 = OpTypePointer UniformConstant %49 
         UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                              %53 = OpTypeSampler 
                                              %54 = OpTypePointer UniformConstant %53 
                     UniformConstant sampler* %55 = OpVariable UniformConstant 
                                              %57 = OpTypeSampledImage %49 
                                          i32 %62 = OpConstant 2 
                                          u32 %67 = OpConstant 1 
                                          f32 %71 = OpConstant 3.674022E-40 
                                              %81 = OpTypePointer Private %10 
                               Private f32_3* %82 = OpVariable Private 
                                          i32 %85 = OpConstant 3 
                                              %86 = OpTypePointer Uniform %7 
                                          i32 %91 = OpConstant 0 
                                             %123 = OpTypePointer Uniform %10 
                              Private f32_4* %137 = OpVariable Private 
        UniformConstant read_only Texture2D* %138 = OpVariable UniformConstant 
                    UniformConstant sampler* %140 = OpVariable UniformConstant 
                              Private f32_3* %148 = OpVariable Private 
                                         f32 %151 = OpConstant 3.674022E-40 
                                       f32_3 %152 = OpConstantComposite %151 %151 %151 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_3 %155 = OpConstantComposite %154 %154 %154 
                              Private f32_3* %166 = OpVariable Private 
                                         f32 %189 = OpConstant 3.674022E-40 
                                Private f32* %191 = OpVariable Private 
                              Private f32_4* %201 = OpVariable Private 
        UniformConstant read_only Texture2D* %202 = OpVariable UniformConstant 
                    UniformConstant sampler* %204 = OpVariable UniformConstant 
                                Private f32* %209 = OpVariable Private 
        UniformConstant read_only Texture2D* %210 = OpVariable UniformConstant 
                    UniformConstant sampler* %212 = OpVariable UniformConstant 
                                         u32 %217 = OpConstant 3 
                              Private f32_3* %224 = OpVariable Private 
                                         f32 %228 = OpConstant 3.674022E-40 
                                         f32 %230 = OpConstant 3.674022E-40 
                                         f32 %241 = OpConstant 3.674022E-40 
                                             %244 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %245 = OpTypePointer UniformConstant %244 
      UniformConstant read_only TextureCube* %246 = OpVariable UniformConstant 
                    UniformConstant sampler* %248 = OpVariable UniformConstant 
                                             %250 = OpTypeSampledImage %244 
                                         i32 %260 = OpConstant 6 
                                         f32 %296 = OpConstant 3.674022E-40 
                                             %349 = OpTypePointer Output %7 
                               Output f32_4* %350 = OpVariable Output 
                                         i32 %358 = OpConstant 4 
                                         i32 %367 = OpConstant 5 
                                       f32_3 %376 = OpConstantComposite %189 %189 %189 
                                         i32 %388 = OpConstant 7 
                                             %404 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                   Input f32* %26 = OpAccessChain vs_TEXCOORD1 %19 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFDiv %22 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 0 0 
                                        f32_3 %34 = OpLoad vs_TEXCOORD1 
                                        f32_3 %35 = OpFMul %33 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                                      OpStore %9 %37 
                                        f32_4 %43 = OpLoad vs_TEXCOORD0 
                                        f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                        f32_4 %45 = OpLoad vs_TEXCOORD0 
                                        f32_2 %46 = OpVectorShuffle %45 %45 3 3 
                                        f32_2 %47 = OpFDiv %44 %46 
                                                      OpStore %40 %47 
                          read_only Texture2D %52 = OpLoad %51 
                                      sampler %56 = OpLoad %55 
                   read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                                        f32_2 %59 = OpLoad %40 
                                        f32_4 %60 = OpImageSampleImplicitLod %58 %59 
                                          f32 %61 = OpCompositeExtract %60 0 
                                                      OpStore %48 %61 
                                 Uniform f32* %63 = OpAccessChain %16 %62 %29 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpLoad %48 
                                          f32 %66 = OpFMul %64 %65 
                                 Uniform f32* %68 = OpAccessChain %16 %62 %67 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpFAdd %66 %69 
                                                      OpStore %48 %70 
                                          f32 %72 = OpLoad %48 
                                          f32 %73 = OpFDiv %71 %72 
                                                      OpStore %48 %73 
                                          f32 %74 = OpLoad %48 
                                        f32_3 %75 = OpCompositeConstruct %74 %74 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                                      OpStore %9 %80 
                                        f32_4 %83 = OpLoad %9 
                                        f32_3 %84 = OpVectorShuffle %83 %83 1 1 1 
                               Uniform f32_4* %87 = OpAccessChain %16 %85 %18 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFMul %84 %89 
                                                      OpStore %82 %90 
                               Uniform f32_4* %92 = OpAccessChain %16 %85 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 0 0 
                                        f32_3 %97 = OpFMul %94 %96 
                                        f32_3 %98 = OpLoad %82 
                                        f32_3 %99 = OpFAdd %97 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 6 
                                                      OpStore %9 %101 
                              Uniform f32_4* %102 = OpAccessChain %16 %85 %62 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_4 %105 = OpLoad %9 
                                       f32_3 %106 = OpVectorShuffle %105 %105 2 2 2 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 3 
                                       f32_3 %110 = OpFAdd %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %9 %112 
                                       f32_4 %113 = OpLoad %9 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %16 %85 %85 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                              Uniform f32_3* %124 = OpAccessChain %16 %91 
                                       f32_3 %125 = OpLoad %124 
                                       f32_3 %126 = OpFNegate %125 
                                       f32_3 %127 = OpFAdd %122 %126 
                                                      OpStore %82 %127 
                                       f32_3 %128 = OpLoad %82 
                                       f32_3 %129 = OpLoad %82 
                                         f32 %130 = OpDot %128 %129 
                                                      OpStore %48 %130 
                                         f32 %131 = OpLoad %48 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %48 %132 
                                         f32 %133 = OpLoad %48 
                                       f32_3 %134 = OpCompositeConstruct %133 %133 %133 
                                       f32_3 %135 = OpLoad %82 
                                       f32_3 %136 = OpFMul %134 %135 
                                                      OpStore %82 %136 
                         read_only Texture2D %139 = OpLoad %138 
                                     sampler %141 = OpLoad %140 
                  read_only Texture2DSampled %142 = OpSampledImage %139 %141 
                                       f32_2 %143 = OpLoad %40 
                                       f32_4 %144 = OpImageSampleImplicitLod %142 %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_4 %146 = OpLoad %137 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %137 %147 
                                       f32_4 %149 = OpLoad %137 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_3 %156 = OpFAdd %153 %155 
                                                      OpStore %148 %156 
                                       f32_3 %157 = OpLoad %148 
                                       f32_3 %158 = OpLoad %148 
                                         f32 %159 = OpDot %157 %158 
                                                      OpStore %48 %159 
                                         f32 %160 = OpLoad %48 
                                         f32 %161 = OpExtInst %1 32 %160 
                                                      OpStore %48 %161 
                                         f32 %162 = OpLoad %48 
                                       f32_3 %163 = OpCompositeConstruct %162 %162 %162 
                                       f32_3 %164 = OpLoad %148 
                                       f32_3 %165 = OpFMul %163 %164 
                                                      OpStore %148 %165 
                                       f32_3 %167 = OpLoad %82 
                                       f32_3 %168 = OpLoad %148 
                                         f32 %169 = OpDot %167 %168 
                                Private f32* %170 = OpAccessChain %166 %29 
                                                      OpStore %170 %169 
                                Private f32* %171 = OpAccessChain %166 %29 
                                         f32 %172 = OpLoad %171 
                                Private f32* %173 = OpAccessChain %166 %29 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFAdd %172 %174 
                                Private f32* %176 = OpAccessChain %166 %29 
                                                      OpStore %176 %175 
                                       f32_3 %177 = OpLoad %148 
                                       f32_3 %178 = OpLoad %166 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 0 0 
                                       f32_3 %180 = OpFNegate %179 
                                       f32_3 %181 = OpFMul %177 %180 
                                       f32_3 %182 = OpLoad %82 
                                       f32_3 %183 = OpFAdd %181 %182 
                                                      OpStore %166 %183 
                                       f32_3 %184 = OpLoad %148 
                                       f32_3 %185 = OpLoad %82 
                                       f32_3 %186 = OpFNegate %185 
                                         f32 %187 = OpDot %184 %186 
                                                      OpStore %48 %187 
                                         f32 %188 = OpLoad %48 
                                         f32 %190 = OpExtInst %1 43 %188 %189 %71 
                                                      OpStore %48 %190 
                                         f32 %192 = OpLoad %48 
                                         f32 %193 = OpFNegate %192 
                                         f32 %194 = OpFAdd %193 %71 
                                                      OpStore %191 %194 
                                         f32 %195 = OpLoad %191 
                                         f32 %196 = OpLoad %191 
                                         f32 %197 = OpFMul %195 %196 
                                                      OpStore %191 %197 
                                         f32 %198 = OpLoad %191 
                                         f32 %199 = OpLoad %191 
                                         f32 %200 = OpFMul %198 %199 
                                                      OpStore %191 %200 
                         read_only Texture2D %203 = OpLoad %202 
                                     sampler %205 = OpLoad %204 
                  read_only Texture2DSampled %206 = OpSampledImage %203 %205 
                                       f32_2 %207 = OpLoad %40 
                                       f32_4 %208 = OpImageSampleImplicitLod %206 %207 
                                                      OpStore %201 %208 
                         read_only Texture2D %211 = OpLoad %210 
                                     sampler %213 = OpLoad %212 
                  read_only Texture2DSampled %214 = OpSampledImage %211 %213 
                                       f32_2 %215 = OpLoad %40 
                                       f32_4 %216 = OpImageSampleImplicitLod %214 %215 
                                         f32 %218 = OpCompositeExtract %216 3 
                                                      OpStore %209 %218 
                                Private f32* %219 = OpAccessChain %201 %217 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFNegate %220 
                                         f32 %222 = OpFAdd %221 %71 
                                Private f32* %223 = OpAccessChain %40 %29 
                                                      OpStore %223 %222 
                                Private f32* %225 = OpAccessChain %40 %29 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFNegate %226 
                                         f32 %229 = OpFMul %227 %228 
                                         f32 %231 = OpFAdd %229 %230 
                                Private f32* %232 = OpAccessChain %224 %29 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %40 %29 
                                         f32 %234 = OpLoad %233 
                                Private f32* %235 = OpAccessChain %224 %29 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFMul %234 %236 
                                Private f32* %238 = OpAccessChain %224 %29 
                                                      OpStore %238 %237 
                                Private f32* %239 = OpAccessChain %224 %29 
                                         f32 %240 = OpLoad %239 
                                         f32 %242 = OpFMul %240 %241 
                                Private f32* %243 = OpAccessChain %224 %29 
                                                      OpStore %243 %242 
                       read_only TextureCube %247 = OpLoad %246 
                                     sampler %249 = OpLoad %248 
                read_only TextureCubeSampled %251 = OpSampledImage %247 %249 
                                       f32_3 %252 = OpLoad %166 
                                Private f32* %253 = OpAccessChain %224 %29 
                                         f32 %254 = OpLoad %253 
                                       f32_4 %255 = OpImageSampleExplicitLod %251 %252 Lod %7 
                                                      OpStore %137 %255 
                                Private f32* %256 = OpAccessChain %137 %217 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFAdd %257 %154 
                                Private f32* %259 = OpAccessChain %166 %29 
                                                      OpStore %259 %258 
                                Uniform f32* %261 = OpAccessChain %16 %260 %217 
                                         f32 %262 = OpLoad %261 
                                Private f32* %263 = OpAccessChain %166 %29 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFMul %262 %264 
                                         f32 %266 = OpFAdd %265 %71 
                                Private f32* %267 = OpAccessChain %166 %29 
                                                      OpStore %267 %266 
                                Private f32* %268 = OpAccessChain %166 %29 
                                         f32 %269 = OpLoad %268 
                                Uniform f32* %270 = OpAccessChain %16 %260 %29 
                                         f32 %271 = OpLoad %270 
                                         f32 %272 = OpFMul %269 %271 
                                Private f32* %273 = OpAccessChain %166 %29 
                                                      OpStore %273 %272 
                                       f32_4 %274 = OpLoad %137 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                       f32_3 %276 = OpLoad %166 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 0 0 
                                       f32_3 %278 = OpFMul %275 %277 
                                                      OpStore %166 %278 
                                         f32 %279 = OpLoad %209 
                                       f32_3 %280 = OpCompositeConstruct %279 %279 %279 
                                       f32_3 %281 = OpLoad %166 
                                       f32_3 %282 = OpFMul %280 %281 
                                                      OpStore %166 %282 
                                Private f32* %283 = OpAccessChain %40 %29 
                                         f32 %284 = OpLoad %283 
                                Private f32* %285 = OpAccessChain %40 %29 
                                         f32 %286 = OpLoad %285 
                                         f32 %287 = OpFMul %284 %286 
                                                      OpStore %48 %287 
                                Private f32* %288 = OpAccessChain %40 %29 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpLoad %48 
                                         f32 %291 = OpFMul %289 %290 
                                Private f32* %292 = OpAccessChain %224 %29 
                                                      OpStore %292 %291 
                                Private f32* %293 = OpAccessChain %224 %29 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpFNegate %294 
                                         f32 %297 = OpFMul %295 %296 
                                         f32 %298 = OpFAdd %297 %71 
                                Private f32* %299 = OpAccessChain %224 %29 
                                                      OpStore %299 %298 
                                       f32_3 %300 = OpLoad %166 
                                       f32_3 %301 = OpLoad %224 
                                       f32_3 %302 = OpVectorShuffle %301 %301 0 0 0 
                                       f32_3 %303 = OpFMul %300 %302 
                                                      OpStore %166 %303 
                                Private f32* %304 = OpAccessChain %201 %67 
                                         f32 %305 = OpLoad %304 
                                Private f32* %306 = OpAccessChain %201 %29 
                                         f32 %307 = OpLoad %306 
                                         f32 %308 = OpExtInst %1 40 %305 %307 
                                Private f32* %309 = OpAccessChain %224 %29 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %201 %19 
                                         f32 %311 = OpLoad %310 
                                Private f32* %312 = OpAccessChain %224 %29 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpExtInst %1 40 %311 %313 
                                Private f32* %315 = OpAccessChain %224 %29 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %224 %29 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFNegate %317 
                                         f32 %319 = OpFAdd %318 %71 
                                Private f32* %320 = OpAccessChain %224 %29 
                                                      OpStore %320 %319 
                                Private f32* %321 = OpAccessChain %224 %29 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFNegate %322 
                                         f32 %324 = OpFAdd %323 %71 
                                Private f32* %325 = OpAccessChain %224 %29 
                                                      OpStore %325 %324 
                                Private f32* %326 = OpAccessChain %201 %217 
                                         f32 %327 = OpLoad %326 
                                Private f32* %328 = OpAccessChain %224 %29 
                                         f32 %329 = OpLoad %328 
                                         f32 %330 = OpFAdd %327 %329 
                                Private f32* %331 = OpAccessChain %224 %29 
                                                      OpStore %331 %330 
                                Private f32* %332 = OpAccessChain %224 %29 
                                         f32 %333 = OpLoad %332 
                                         f32 %334 = OpExtInst %1 43 %333 %189 %71 
                                Private f32* %335 = OpAccessChain %224 %29 
                                                      OpStore %335 %334 
                                       f32_4 %336 = OpLoad %201 
                                       f32_3 %337 = OpVectorShuffle %336 %336 0 1 2 
                                       f32_3 %338 = OpFNegate %337 
                                       f32_3 %339 = OpLoad %224 
                                       f32_3 %340 = OpVectorShuffle %339 %339 0 0 0 
                                       f32_3 %341 = OpFAdd %338 %340 
                                                      OpStore %224 %341 
                                         f32 %342 = OpLoad %191 
                                       f32_3 %343 = OpCompositeConstruct %342 %342 %342 
                                       f32_3 %344 = OpLoad %224 
                                       f32_3 %345 = OpFMul %343 %344 
                                       f32_4 %346 = OpLoad %201 
                                       f32_3 %347 = OpVectorShuffle %346 %346 0 1 2 
                                       f32_3 %348 = OpFAdd %345 %347 
                                                      OpStore %224 %348 
                                       f32_3 %351 = OpLoad %166 
                                       f32_3 %352 = OpLoad %224 
                                       f32_3 %353 = OpFMul %351 %352 
                                       f32_4 %354 = OpLoad %350 
                                       f32_4 %355 = OpVectorShuffle %354 %353 4 5 6 3 
                                                      OpStore %350 %355 
                                       f32_4 %356 = OpLoad %9 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                              Uniform f32_4* %359 = OpAccessChain %16 %358 
                                       f32_4 %360 = OpLoad %359 
                                       f32_3 %361 = OpVectorShuffle %360 %360 0 1 2 
                                       f32_3 %362 = OpFNegate %361 
                                       f32_3 %363 = OpFAdd %357 %362 
                                                      OpStore %166 %363 
                                       f32_4 %364 = OpLoad %9 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_3 %366 = OpFNegate %365 
                              Uniform f32_4* %368 = OpAccessChain %16 %367 
                                       f32_4 %369 = OpLoad %368 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                       f32_3 %371 = OpFAdd %366 %370 
                                                      OpStore %224 %371 
                                       f32_3 %372 = OpLoad %166 
                                       f32_3 %373 = OpLoad %224 
                                       f32_3 %374 = OpExtInst %1 40 %372 %373 
                                                      OpStore %166 %374 
                                       f32_3 %375 = OpLoad %166 
                                       f32_3 %377 = OpExtInst %1 40 %375 %376 
                                                      OpStore %166 %377 
                                       f32_3 %378 = OpLoad %166 
                                       f32_3 %379 = OpLoad %166 
                                         f32 %380 = OpDot %378 %379 
                                Private f32* %381 = OpAccessChain %166 %29 
                                                      OpStore %381 %380 
                                Private f32* %382 = OpAccessChain %166 %29 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpExtInst %1 31 %383 
                                Private f32* %385 = OpAccessChain %166 %29 
                                                      OpStore %385 %384 
                                Private f32* %386 = OpAccessChain %166 %29 
                                         f32 %387 = OpLoad %386 
                                Uniform f32* %389 = OpAccessChain %16 %388 %217 
                                         f32 %390 = OpLoad %389 
                                         f32 %391 = OpFDiv %387 %390 
                                Private f32* %392 = OpAccessChain %9 %29 
                                                      OpStore %392 %391 
                                Private f32* %393 = OpAccessChain %9 %29 
                                         f32 %394 = OpLoad %393 
                                         f32 %395 = OpFNegate %394 
                                         f32 %396 = OpFAdd %395 %71 
                                Private f32* %397 = OpAccessChain %9 %29 
                                                      OpStore %397 %396 
                                Private f32* %398 = OpAccessChain %9 %29 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpExtInst %1 43 %399 %189 %71 
                                Private f32* %401 = OpAccessChain %9 %29 
                                                      OpStore %401 %400 
                                Private f32* %402 = OpAccessChain %9 %29 
                                         f32 %403 = OpLoad %402 
                                 Output f32* %405 = OpAccessChain %350 %217 
                                                      OpStore %405 %403 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 192
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %80 %102 %169 %175 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpMemberDecorate %19 0 Offset 19 
                                                      OpMemberDecorate %19 1 Offset 19 
                                                      OpMemberDecorate %19 2 Offset 19 
                                                      OpMemberDecorate %19 3 Offset 19 
                                                      OpMemberDecorate %19 4 Offset 19 
                                                      OpDecorate %19 Block 
                                                      OpDecorate %21 DescriptorSet 21 
                                                      OpDecorate %21 Binding 21 
                                                      OpMemberDecorate %78 0 BuiltIn 78 
                                                      OpMemberDecorate %78 1 BuiltIn 78 
                                                      OpMemberDecorate %78 2 BuiltIn 78 
                                                      OpDecorate %78 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 102 
                                                      OpDecorate %169 Location 169 
                                                      OpDecorate vs_TEXCOORD1 Location 175 
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
                                              %19 = OpTypeStruct %7 %16 %17 %18 %6 
                                              %20 = OpTypePointer Uniform %19 
Uniform struct {f32_4; f32_4[4]; f32_4[4]; f32_4[4]; f32;}* %21 = OpVariable Uniform 
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
                                              %84 = OpTypePointer Private %6 
                                          u32 %87 = OpConstant 0 
                                              %88 = OpTypePointer Uniform %6 
                               Private f32_4* %93 = OpVariable Private 
                                              %94 = OpTypeVector %6 3 
                                          f32 %97 = OpConstant 3.674022E-40 
                                        f32_3 %98 = OpConstantComposite %97 %97 %97 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %103 = OpTypeVector %6 2 
                                         f32 %158 = OpConstant 3.674022E-40 
                                         f32 %159 = OpConstant 3.674022E-40 
                                       f32_3 %160 = OpConstantComposite %158 %158 %159 
                                             %168 = OpTypePointer Input %94 
                                Input f32_3* %169 = OpVariable Input 
                                             %174 = OpTypePointer Output %94 
                       Output f32_3* vs_TEXCOORD1 = OpVariable Output 
                                         i32 %176 = OpConstant 4 
                                             %186 = OpTypePointer Output %6 
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
                                                      OpStore %49 %75 
                                        f32_4 %81 = OpLoad %49 
                                Output f32_4* %83 = OpAccessChain %80 %28 
                                                      OpStore %83 %81 
                                 Private f32* %85 = OpAccessChain %49 %76 
                                          f32 %86 = OpLoad %85 
                                 Uniform f32* %89 = OpAccessChain %21 %28 %87 
                                          f32 %90 = OpLoad %89 
                                          f32 %91 = OpFMul %86 %90 
                                 Private f32* %92 = OpAccessChain %49 %76 
                                                      OpStore %92 %91 
                                        f32_4 %95 = OpLoad %49 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 3 1 
                                        f32_3 %99 = OpFMul %96 %98 
                                       f32_4 %100 = OpLoad %93 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 1 5 6 
                                                      OpStore %93 %101 
                                       f32_4 %104 = OpLoad %49 
                                       f32_2 %105 = OpVectorShuffle %104 %104 2 3 
                                       f32_4 %106 = OpLoad vs_TEXCOORD0 
                                       f32_4 %107 = OpVectorShuffle %106 %105 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %107 
                                       f32_4 %108 = OpLoad %93 
                                       f32_2 %109 = OpVectorShuffle %108 %108 2 2 
                                       f32_4 %110 = OpLoad %93 
                                       f32_2 %111 = OpVectorShuffle %110 %110 0 3 
                                       f32_2 %112 = OpFAdd %109 %111 
                                       f32_4 %113 = OpLoad vs_TEXCOORD0 
                                       f32_4 %114 = OpVectorShuffle %113 %112 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %114 
                                       f32_4 %115 = OpLoad %9 
                                       f32_3 %116 = OpVectorShuffle %115 %115 1 1 1 
                              Uniform f32_4* %117 = OpAccessChain %21 %36 %23 
                                       f32_4 %118 = OpLoad %117 
                                       f32_3 %119 = OpVectorShuffle %118 %118 0 1 2 
                                       f32_3 %120 = OpFMul %116 %119 
                                       f32_4 %121 = OpLoad %49 
                                       f32_4 %122 = OpVectorShuffle %121 %120 4 5 6 3 
                                                      OpStore %49 %122 
                              Uniform f32_4* %123 = OpAccessChain %21 %36 %28 
                                       f32_4 %124 = OpLoad %123 
                                       f32_3 %125 = OpVectorShuffle %124 %124 0 1 2 
                                       f32_4 %126 = OpLoad %9 
                                       f32_3 %127 = OpVectorShuffle %126 %126 0 0 0 
                                       f32_3 %128 = OpFMul %125 %127 
                                       f32_4 %129 = OpLoad %49 
                                       f32_3 %130 = OpVectorShuffle %129 %129 0 1 2 
                                       f32_3 %131 = OpFAdd %128 %130 
                                       f32_4 %132 = OpLoad %49 
                                       f32_4 %133 = OpVectorShuffle %132 %131 4 5 6 3 
                                                      OpStore %49 %133 
                              Uniform f32_4* %134 = OpAccessChain %21 %36 %36 
                                       f32_4 %135 = OpLoad %134 
                                       f32_3 %136 = OpVectorShuffle %135 %135 0 1 2 
                                       f32_4 %137 = OpLoad %9 
                                       f32_3 %138 = OpVectorShuffle %137 %137 2 2 2 
                                       f32_3 %139 = OpFMul %136 %138 
                                       f32_4 %140 = OpLoad %49 
                                       f32_3 %141 = OpVectorShuffle %140 %140 0 1 2 
                                       f32_3 %142 = OpFAdd %139 %141 
                                       f32_4 %143 = OpLoad %9 
                                       f32_4 %144 = OpVectorShuffle %143 %142 4 5 6 3 
                                                      OpStore %9 %144 
                              Uniform f32_4* %145 = OpAccessChain %21 %36 %45 
                                       f32_4 %146 = OpLoad %145 
                                       f32_3 %147 = OpVectorShuffle %146 %146 0 1 2 
                                       f32_4 %148 = OpLoad %9 
                                       f32_3 %149 = OpVectorShuffle %148 %148 3 3 3 
                                       f32_3 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_3 %152 = OpVectorShuffle %151 %151 0 1 2 
                                       f32_3 %153 = OpFAdd %150 %152 
                                       f32_4 %154 = OpLoad %9 
                                       f32_4 %155 = OpVectorShuffle %154 %153 4 5 6 3 
                                                      OpStore %9 %155 
                                       f32_4 %156 = OpLoad %9 
                                       f32_3 %157 = OpVectorShuffle %156 %156 0 1 2 
                                       f32_3 %161 = OpFMul %157 %160 
                                       f32_4 %162 = OpLoad %49 
                                       f32_4 %163 = OpVectorShuffle %162 %161 4 5 6 3 
                                                      OpStore %49 %163 
                                       f32_4 %164 = OpLoad %9 
                                       f32_3 %165 = OpVectorShuffle %164 %164 0 1 2 
                                       f32_3 %166 = OpFNegate %165 
                                       f32_3 %167 = OpFMul %166 %160 
                                       f32_3 %170 = OpLoad %169 
                                       f32_3 %171 = OpFAdd %167 %170 
                                       f32_4 %172 = OpLoad %9 
                                       f32_4 %173 = OpVectorShuffle %172 %171 4 5 6 3 
                                                      OpStore %9 %173 
                                Uniform f32* %177 = OpAccessChain %21 %176 
                                         f32 %178 = OpLoad %177 
                                       f32_3 %179 = OpCompositeConstruct %178 %178 %178 
                                       f32_4 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %180 0 1 2 
                                       f32_3 %182 = OpFMul %179 %181 
                                       f32_4 %183 = OpLoad %49 
                                       f32_3 %184 = OpVectorShuffle %183 %183 0 1 2 
                                       f32_3 %185 = OpFAdd %182 %184 
                                                      OpStore vs_TEXCOORD1 %185 
                                 Output f32* %187 = OpAccessChain %80 %28 %76 
                                         f32 %188 = OpLoad %187 
                                         f32 %189 = OpFNegate %188 
                                 Output f32* %190 = OpAccessChain %80 %28 %76 
                                                      OpStore %190 %189 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 407
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %24 %42 %350 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpMemberDecorate %14 0 Offset 14 
                                                      OpMemberDecorate %14 1 Offset 14 
                                                      OpMemberDecorate %14 2 Offset 14 
                                                      OpMemberDecorate %14 3 Offset 14 
                                                      OpMemberDecorate %14 4 Offset 14 
                                                      OpMemberDecorate %14 5 Offset 14 
                                                      OpMemberDecorate %14 6 RelaxedPrecision 
                                                      OpMemberDecorate %14 6 Offset 14 
                                                      OpMemberDecorate %14 7 Offset 14 
                                                      OpDecorate %14 Block 
                                                      OpDecorate %16 DescriptorSet 16 
                                                      OpDecorate %16 Binding 16 
                                                      OpDecorate vs_TEXCOORD1 Location 24 
                                                      OpDecorate vs_TEXCOORD0 Location 42 
                                                      OpDecorate %51 DescriptorSet 51 
                                                      OpDecorate %51 Binding 51 
                                                      OpDecorate %55 DescriptorSet 55 
                                                      OpDecorate %55 Binding 55 
                                                      OpDecorate %137 RelaxedPrecision 
                                                      OpDecorate %138 RelaxedPrecision 
                                                      OpDecorate %138 DescriptorSet 138 
                                                      OpDecorate %138 Binding 138 
                                                      OpDecorate %139 RelaxedPrecision 
                                                      OpDecorate %140 RelaxedPrecision 
                                                      OpDecorate %140 DescriptorSet 140 
                                                      OpDecorate %140 Binding 140 
                                                      OpDecorate %141 RelaxedPrecision 
                                                      OpDecorate %145 RelaxedPrecision 
                                                      OpDecorate %149 RelaxedPrecision 
                                                      OpDecorate %150 RelaxedPrecision 
                                                      OpDecorate %153 RelaxedPrecision 
                                                      OpDecorate %156 RelaxedPrecision 
                                                      OpDecorate %166 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %175 RelaxedPrecision 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %179 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %195 RelaxedPrecision 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %198 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %202 DescriptorSet 202 
                                                      OpDecorate %202 Binding 202 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %204 DescriptorSet 204 
                                                      OpDecorate %204 Binding 204 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %210 DescriptorSet 210 
                                                      OpDecorate %210 Binding 210 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %212 DescriptorSet 212 
                                                      OpDecorate %212 Binding 212 
                                                      OpDecorate %213 RelaxedPrecision 
                                                      OpDecorate %218 RelaxedPrecision 
                                                      OpDecorate %220 RelaxedPrecision 
                                                      OpDecorate %221 RelaxedPrecision 
                                                      OpDecorate %222 RelaxedPrecision 
                                                      OpDecorate %224 RelaxedPrecision 
                                                      OpDecorate %236 RelaxedPrecision 
                                                      OpDecorate %240 RelaxedPrecision 
                                                      OpDecorate %242 RelaxedPrecision 
                                                      OpDecorate %246 RelaxedPrecision 
                                                      OpDecorate %246 DescriptorSet 246 
                                                      OpDecorate %246 Binding 246 
                                                      OpDecorate %247 RelaxedPrecision 
                                                      OpDecorate %248 RelaxedPrecision 
                                                      OpDecorate %248 DescriptorSet 248 
                                                      OpDecorate %248 Binding 248 
                                                      OpDecorate %249 RelaxedPrecision 
                                                      OpDecorate %252 RelaxedPrecision 
                                                      OpDecorate %254 RelaxedPrecision 
                                                      OpDecorate %255 RelaxedPrecision 
                                                      OpDecorate %257 RelaxedPrecision 
                                                      OpDecorate %258 RelaxedPrecision 
                                                      OpDecorate %262 RelaxedPrecision 
                                                      OpDecorate %264 RelaxedPrecision 
                                                      OpDecorate %265 RelaxedPrecision 
                                                      OpDecorate %266 RelaxedPrecision 
                                                      OpDecorate %269 RelaxedPrecision 
                                                      OpDecorate %271 RelaxedPrecision 
                                                      OpDecorate %272 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %275 RelaxedPrecision 
                                                      OpDecorate %276 RelaxedPrecision 
                                                      OpDecorate %277 RelaxedPrecision 
                                                      OpDecorate %278 RelaxedPrecision 
                                                      OpDecorate %279 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %295 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate %302 RelaxedPrecision 
                                                      OpDecorate %303 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %311 RelaxedPrecision 
                                                      OpDecorate %313 RelaxedPrecision 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %318 RelaxedPrecision 
                                                      OpDecorate %319 RelaxedPrecision 
                                                      OpDecorate %322 RelaxedPrecision 
                                                      OpDecorate %323 RelaxedPrecision 
                                                      OpDecorate %324 RelaxedPrecision 
                                                      OpDecorate %327 RelaxedPrecision 
                                                      OpDecorate %329 RelaxedPrecision 
                                                      OpDecorate %330 RelaxedPrecision 
                                                      OpDecorate %333 RelaxedPrecision 
                                                      OpDecorate %334 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %338 RelaxedPrecision 
                                                      OpDecorate %339 RelaxedPrecision 
                                                      OpDecorate %340 RelaxedPrecision 
                                                      OpDecorate %341 RelaxedPrecision 
                                                      OpDecorate %342 RelaxedPrecision 
                                                      OpDecorate %343 RelaxedPrecision 
                                                      OpDecorate %344 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %347 RelaxedPrecision 
                                                      OpDecorate %348 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %350 Location 350 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %374 RelaxedPrecision 
                                                      OpDecorate %375 RelaxedPrecision 
                                                      OpDecorate %377 RelaxedPrecision 
                                                      OpDecorate %378 RelaxedPrecision 
                                                      OpDecorate %379 RelaxedPrecision 
                                                      OpDecorate %380 RelaxedPrecision 
                                                      OpDecorate %383 RelaxedPrecision 
                                                      OpDecorate %384 RelaxedPrecision 
                                                      OpDecorate %387 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypeVector %6 3 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %7 %12 
                                              %14 = OpTypeStruct %10 %7 %7 %13 %7 %7 %7 %7 
                                              %15 = OpTypePointer Uniform %14 
Uniform struct {f32_3; f32_4; f32_4; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %16 = OpVariable Uniform 
                                              %17 = OpTypeInt 32 1 
                                          i32 %18 = OpConstant 1 
                                          u32 %19 = OpConstant 2 
                                              %20 = OpTypePointer Uniform %6 
                                              %23 = OpTypePointer Input %10 
                        Input f32_3* vs_TEXCOORD1 = OpVariable Input 
                                              %25 = OpTypePointer Input %6 
                                          u32 %29 = OpConstant 0 
                                              %30 = OpTypePointer Private %6 
                                              %38 = OpTypeVector %6 2 
                                              %39 = OpTypePointer Private %38 
                               Private f32_2* %40 = OpVariable Private 
                                              %41 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                 Private f32* %48 = OpVariable Private 
                                              %49 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %50 = OpTypePointer UniformConstant %49 
         UniformConstant read_only Texture2D* %51 = OpVariable UniformConstant 
                                              %53 = OpTypeSampler 
                                              %54 = OpTypePointer UniformConstant %53 
                     UniformConstant sampler* %55 = OpVariable UniformConstant 
                                              %57 = OpTypeSampledImage %49 
                                          i32 %62 = OpConstant 2 
                                          u32 %67 = OpConstant 1 
                                          f32 %71 = OpConstant 3.674022E-40 
                                              %81 = OpTypePointer Private %10 
                               Private f32_3* %82 = OpVariable Private 
                                          i32 %85 = OpConstant 3 
                                              %86 = OpTypePointer Uniform %7 
                                          i32 %91 = OpConstant 0 
                                             %123 = OpTypePointer Uniform %10 
                              Private f32_4* %137 = OpVariable Private 
        UniformConstant read_only Texture2D* %138 = OpVariable UniformConstant 
                    UniformConstant sampler* %140 = OpVariable UniformConstant 
                              Private f32_3* %148 = OpVariable Private 
                                         f32 %151 = OpConstant 3.674022E-40 
                                       f32_3 %152 = OpConstantComposite %151 %151 %151 
                                         f32 %154 = OpConstant 3.674022E-40 
                                       f32_3 %155 = OpConstantComposite %154 %154 %154 
                              Private f32_3* %166 = OpVariable Private 
                                         f32 %189 = OpConstant 3.674022E-40 
                                Private f32* %191 = OpVariable Private 
                              Private f32_4* %201 = OpVariable Private 
        UniformConstant read_only Texture2D* %202 = OpVariable UniformConstant 
                    UniformConstant sampler* %204 = OpVariable UniformConstant 
                                Private f32* %209 = OpVariable Private 
        UniformConstant read_only Texture2D* %210 = OpVariable UniformConstant 
                    UniformConstant sampler* %212 = OpVariable UniformConstant 
                                         u32 %217 = OpConstant 3 
                              Private f32_3* %224 = OpVariable Private 
                                         f32 %228 = OpConstant 3.674022E-40 
                                         f32 %230 = OpConstant 3.674022E-40 
                                         f32 %241 = OpConstant 3.674022E-40 
                                             %244 = OpTypeImage %6 Cube 0 0 0 1 Unknown 
                                             %245 = OpTypePointer UniformConstant %244 
      UniformConstant read_only TextureCube* %246 = OpVariable UniformConstant 
                    UniformConstant sampler* %248 = OpVariable UniformConstant 
                                             %250 = OpTypeSampledImage %244 
                                         i32 %260 = OpConstant 6 
                                         f32 %296 = OpConstant 3.674022E-40 
                                             %349 = OpTypePointer Output %7 
                               Output f32_4* %350 = OpVariable Output 
                                         i32 %358 = OpConstant 4 
                                         i32 %367 = OpConstant 5 
                                       f32_3 %376 = OpConstantComposite %189 %189 %189 
                                         i32 %388 = OpConstant 7 
                                             %404 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                 Uniform f32* %21 = OpAccessChain %16 %18 %19 
                                          f32 %22 = OpLoad %21 
                                   Input f32* %26 = OpAccessChain vs_TEXCOORD1 %19 
                                          f32 %27 = OpLoad %26 
                                          f32 %28 = OpFDiv %22 %27 
                                 Private f32* %31 = OpAccessChain %9 %29 
                                                      OpStore %31 %28 
                                        f32_4 %32 = OpLoad %9 
                                        f32_3 %33 = OpVectorShuffle %32 %32 0 0 0 
                                        f32_3 %34 = OpLoad vs_TEXCOORD1 
                                        f32_3 %35 = OpFMul %33 %34 
                                        f32_4 %36 = OpLoad %9 
                                        f32_4 %37 = OpVectorShuffle %36 %35 4 5 6 3 
                                                      OpStore %9 %37 
                                        f32_4 %43 = OpLoad vs_TEXCOORD0 
                                        f32_2 %44 = OpVectorShuffle %43 %43 0 1 
                                        f32_4 %45 = OpLoad vs_TEXCOORD0 
                                        f32_2 %46 = OpVectorShuffle %45 %45 3 3 
                                        f32_2 %47 = OpFDiv %44 %46 
                                                      OpStore %40 %47 
                          read_only Texture2D %52 = OpLoad %51 
                                      sampler %56 = OpLoad %55 
                   read_only Texture2DSampled %58 = OpSampledImage %52 %56 
                                        f32_2 %59 = OpLoad %40 
                                        f32_4 %60 = OpImageSampleImplicitLod %58 %59 
                                          f32 %61 = OpCompositeExtract %60 0 
                                                      OpStore %48 %61 
                                 Uniform f32* %63 = OpAccessChain %16 %62 %29 
                                          f32 %64 = OpLoad %63 
                                          f32 %65 = OpLoad %48 
                                          f32 %66 = OpFMul %64 %65 
                                 Uniform f32* %68 = OpAccessChain %16 %62 %67 
                                          f32 %69 = OpLoad %68 
                                          f32 %70 = OpFAdd %66 %69 
                                                      OpStore %48 %70 
                                          f32 %72 = OpLoad %48 
                                          f32 %73 = OpFDiv %71 %72 
                                                      OpStore %48 %73 
                                          f32 %74 = OpLoad %48 
                                        f32_3 %75 = OpCompositeConstruct %74 %74 %74 
                                        f32_4 %76 = OpLoad %9 
                                        f32_3 %77 = OpVectorShuffle %76 %76 0 1 2 
                                        f32_3 %78 = OpFMul %75 %77 
                                        f32_4 %79 = OpLoad %9 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 6 3 
                                                      OpStore %9 %80 
                                        f32_4 %83 = OpLoad %9 
                                        f32_3 %84 = OpVectorShuffle %83 %83 1 1 1 
                               Uniform f32_4* %87 = OpAccessChain %16 %85 %18 
                                        f32_4 %88 = OpLoad %87 
                                        f32_3 %89 = OpVectorShuffle %88 %88 0 1 2 
                                        f32_3 %90 = OpFMul %84 %89 
                                                      OpStore %82 %90 
                               Uniform f32_4* %92 = OpAccessChain %16 %85 %91 
                                        f32_4 %93 = OpLoad %92 
                                        f32_3 %94 = OpVectorShuffle %93 %93 0 1 2 
                                        f32_4 %95 = OpLoad %9 
                                        f32_3 %96 = OpVectorShuffle %95 %95 0 0 0 
                                        f32_3 %97 = OpFMul %94 %96 
                                        f32_3 %98 = OpLoad %82 
                                        f32_3 %99 = OpFAdd %97 %98 
                                       f32_4 %100 = OpLoad %9 
                                       f32_4 %101 = OpVectorShuffle %100 %99 4 5 2 6 
                                                      OpStore %9 %101 
                              Uniform f32_4* %102 = OpAccessChain %16 %85 %62 
                                       f32_4 %103 = OpLoad %102 
                                       f32_3 %104 = OpVectorShuffle %103 %103 0 1 2 
                                       f32_4 %105 = OpLoad %9 
                                       f32_3 %106 = OpVectorShuffle %105 %105 2 2 2 
                                       f32_3 %107 = OpFMul %104 %106 
                                       f32_4 %108 = OpLoad %9 
                                       f32_3 %109 = OpVectorShuffle %108 %108 0 1 3 
                                       f32_3 %110 = OpFAdd %107 %109 
                                       f32_4 %111 = OpLoad %9 
                                       f32_4 %112 = OpVectorShuffle %111 %110 4 5 6 3 
                                                      OpStore %9 %112 
                                       f32_4 %113 = OpLoad %9 
                                       f32_3 %114 = OpVectorShuffle %113 %113 0 1 2 
                              Uniform f32_4* %115 = OpAccessChain %16 %85 %85 
                                       f32_4 %116 = OpLoad %115 
                                       f32_3 %117 = OpVectorShuffle %116 %116 0 1 2 
                                       f32_3 %118 = OpFAdd %114 %117 
                                       f32_4 %119 = OpLoad %9 
                                       f32_4 %120 = OpVectorShuffle %119 %118 4 5 6 3 
                                                      OpStore %9 %120 
                                       f32_4 %121 = OpLoad %9 
                                       f32_3 %122 = OpVectorShuffle %121 %121 0 1 2 
                              Uniform f32_3* %124 = OpAccessChain %16 %91 
                                       f32_3 %125 = OpLoad %124 
                                       f32_3 %126 = OpFNegate %125 
                                       f32_3 %127 = OpFAdd %122 %126 
                                                      OpStore %82 %127 
                                       f32_3 %128 = OpLoad %82 
                                       f32_3 %129 = OpLoad %82 
                                         f32 %130 = OpDot %128 %129 
                                                      OpStore %48 %130 
                                         f32 %131 = OpLoad %48 
                                         f32 %132 = OpExtInst %1 32 %131 
                                                      OpStore %48 %132 
                                         f32 %133 = OpLoad %48 
                                       f32_3 %134 = OpCompositeConstruct %133 %133 %133 
                                       f32_3 %135 = OpLoad %82 
                                       f32_3 %136 = OpFMul %134 %135 
                                                      OpStore %82 %136 
                         read_only Texture2D %139 = OpLoad %138 
                                     sampler %141 = OpLoad %140 
                  read_only Texture2DSampled %142 = OpSampledImage %139 %141 
                                       f32_2 %143 = OpLoad %40 
                                       f32_4 %144 = OpImageSampleImplicitLod %142 %143 
                                       f32_3 %145 = OpVectorShuffle %144 %144 0 1 2 
                                       f32_4 %146 = OpLoad %137 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 6 3 
                                                      OpStore %137 %147 
                                       f32_4 %149 = OpLoad %137 
                                       f32_3 %150 = OpVectorShuffle %149 %149 0 1 2 
                                       f32_3 %153 = OpFMul %150 %152 
                                       f32_3 %156 = OpFAdd %153 %155 
                                                      OpStore %148 %156 
                                       f32_3 %157 = OpLoad %148 
                                       f32_3 %158 = OpLoad %148 
                                         f32 %159 = OpDot %157 %158 
                                                      OpStore %48 %159 
                                         f32 %160 = OpLoad %48 
                                         f32 %161 = OpExtInst %1 32 %160 
                                                      OpStore %48 %161 
                                         f32 %162 = OpLoad %48 
                                       f32_3 %163 = OpCompositeConstruct %162 %162 %162 
                                       f32_3 %164 = OpLoad %148 
                                       f32_3 %165 = OpFMul %163 %164 
                                                      OpStore %148 %165 
                                       f32_3 %167 = OpLoad %82 
                                       f32_3 %168 = OpLoad %148 
                                         f32 %169 = OpDot %167 %168 
                                Private f32* %170 = OpAccessChain %166 %29 
                                                      OpStore %170 %169 
                                Private f32* %171 = OpAccessChain %166 %29 
                                         f32 %172 = OpLoad %171 
                                Private f32* %173 = OpAccessChain %166 %29 
                                         f32 %174 = OpLoad %173 
                                         f32 %175 = OpFAdd %172 %174 
                                Private f32* %176 = OpAccessChain %166 %29 
                                                      OpStore %176 %175 
                                       f32_3 %177 = OpLoad %148 
                                       f32_3 %178 = OpLoad %166 
                                       f32_3 %179 = OpVectorShuffle %178 %178 0 0 0 
                                       f32_3 %180 = OpFNegate %179 
                                       f32_3 %181 = OpFMul %177 %180 
                                       f32_3 %182 = OpLoad %82 
                                       f32_3 %183 = OpFAdd %181 %182 
                                                      OpStore %166 %183 
                                       f32_3 %184 = OpLoad %148 
                                       f32_3 %185 = OpLoad %82 
                                       f32_3 %186 = OpFNegate %185 
                                         f32 %187 = OpDot %184 %186 
                                                      OpStore %48 %187 
                                         f32 %188 = OpLoad %48 
                                         f32 %190 = OpExtInst %1 43 %188 %189 %71 
                                                      OpStore %48 %190 
                                         f32 %192 = OpLoad %48 
                                         f32 %193 = OpFNegate %192 
                                         f32 %194 = OpFAdd %193 %71 
                                                      OpStore %191 %194 
                                         f32 %195 = OpLoad %191 
                                         f32 %196 = OpLoad %191 
                                         f32 %197 = OpFMul %195 %196 
                                                      OpStore %191 %197 
                                         f32 %198 = OpLoad %191 
                                         f32 %199 = OpLoad %191 
                                         f32 %200 = OpFMul %198 %199 
                                                      OpStore %191 %200 
                         read_only Texture2D %203 = OpLoad %202 
                                     sampler %205 = OpLoad %204 
                  read_only Texture2DSampled %206 = OpSampledImage %203 %205 
                                       f32_2 %207 = OpLoad %40 
                                       f32_4 %208 = OpImageSampleImplicitLod %206 %207 
                                                      OpStore %201 %208 
                         read_only Texture2D %211 = OpLoad %210 
                                     sampler %213 = OpLoad %212 
                  read_only Texture2DSampled %214 = OpSampledImage %211 %213 
                                       f32_2 %215 = OpLoad %40 
                                       f32_4 %216 = OpImageSampleImplicitLod %214 %215 
                                         f32 %218 = OpCompositeExtract %216 3 
                                                      OpStore %209 %218 
                                Private f32* %219 = OpAccessChain %201 %217 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpFNegate %220 
                                         f32 %222 = OpFAdd %221 %71 
                                Private f32* %223 = OpAccessChain %40 %29 
                                                      OpStore %223 %222 
                                Private f32* %225 = OpAccessChain %40 %29 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpFNegate %226 
                                         f32 %229 = OpFMul %227 %228 
                                         f32 %231 = OpFAdd %229 %230 
                                Private f32* %232 = OpAccessChain %224 %29 
                                                      OpStore %232 %231 
                                Private f32* %233 = OpAccessChain %40 %29 
                                         f32 %234 = OpLoad %233 
                                Private f32* %235 = OpAccessChain %224 %29 
                                         f32 %236 = OpLoad %235 
                                         f32 %237 = OpFMul %234 %236 
                                Private f32* %238 = OpAccessChain %224 %29 
                                                      OpStore %238 %237 
                                Private f32* %239 = OpAccessChain %224 %29 
                                         f32 %240 = OpLoad %239 
                                         f32 %242 = OpFMul %240 %241 
                                Private f32* %243 = OpAccessChain %224 %29 
                                                      OpStore %243 %242 
                       read_only TextureCube %247 = OpLoad %246 
                                     sampler %249 = OpLoad %248 
                read_only TextureCubeSampled %251 = OpSampledImage %247 %249 
                                       f32_3 %252 = OpLoad %166 
                                Private f32* %253 = OpAccessChain %224 %29 
                                         f32 %254 = OpLoad %253 
                                       f32_4 %255 = OpImageSampleExplicitLod %251 %252 Lod %7 
                                                      OpStore %137 %255 
                                Private f32* %256 = OpAccessChain %137 %217 
                                         f32 %257 = OpLoad %256 
                                         f32 %258 = OpFAdd %257 %154 
                                Private f32* %259 = OpAccessChain %166 %29 
                                                      OpStore %259 %258 
                                Uniform f32* %261 = OpAccessChain %16 %260 %217 
                                         f32 %262 = OpLoad %261 
                                Private f32* %263 = OpAccessChain %166 %29 
                                         f32 %264 = OpLoad %263 
                                         f32 %265 = OpFMul %262 %264 
                                         f32 %266 = OpFAdd %265 %71 
                                Private f32* %267 = OpAccessChain %166 %29 
                                                      OpStore %267 %266 
                                Private f32* %268 = OpAccessChain %166 %29 
                                         f32 %269 = OpLoad %268 
                                Uniform f32* %270 = OpAccessChain %16 %260 %29 
                                         f32 %271 = OpLoad %270 
                                         f32 %272 = OpFMul %269 %271 
                                Private f32* %273 = OpAccessChain %166 %29 
                                                      OpStore %273 %272 
                                       f32_4 %274 = OpLoad %137 
                                       f32_3 %275 = OpVectorShuffle %274 %274 0 1 2 
                                       f32_3 %276 = OpLoad %166 
                                       f32_3 %277 = OpVectorShuffle %276 %276 0 0 0 
                                       f32_3 %278 = OpFMul %275 %277 
                                                      OpStore %166 %278 
                                         f32 %279 = OpLoad %209 
                                       f32_3 %280 = OpCompositeConstruct %279 %279 %279 
                                       f32_3 %281 = OpLoad %166 
                                       f32_3 %282 = OpFMul %280 %281 
                                                      OpStore %166 %282 
                                Private f32* %283 = OpAccessChain %40 %29 
                                         f32 %284 = OpLoad %283 
                                Private f32* %285 = OpAccessChain %40 %29 
                                         f32 %286 = OpLoad %285 
                                         f32 %287 = OpFMul %284 %286 
                                                      OpStore %48 %287 
                                Private f32* %288 = OpAccessChain %40 %29 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpLoad %48 
                                         f32 %291 = OpFMul %289 %290 
                                Private f32* %292 = OpAccessChain %224 %29 
                                                      OpStore %292 %291 
                                Private f32* %293 = OpAccessChain %224 %29 
                                         f32 %294 = OpLoad %293 
                                         f32 %295 = OpFNegate %294 
                                         f32 %297 = OpFMul %295 %296 
                                         f32 %298 = OpFAdd %297 %71 
                                Private f32* %299 = OpAccessChain %224 %29 
                                                      OpStore %299 %298 
                                       f32_3 %300 = OpLoad %166 
                                       f32_3 %301 = OpLoad %224 
                                       f32_3 %302 = OpVectorShuffle %301 %301 0 0 0 
                                       f32_3 %303 = OpFMul %300 %302 
                                                      OpStore %166 %303 
                                Private f32* %304 = OpAccessChain %201 %67 
                                         f32 %305 = OpLoad %304 
                                Private f32* %306 = OpAccessChain %201 %29 
                                         f32 %307 = OpLoad %306 
                                         f32 %308 = OpExtInst %1 40 %305 %307 
                                Private f32* %309 = OpAccessChain %224 %29 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %201 %19 
                                         f32 %311 = OpLoad %310 
                                Private f32* %312 = OpAccessChain %224 %29 
                                         f32 %313 = OpLoad %312 
                                         f32 %314 = OpExtInst %1 40 %311 %313 
                                Private f32* %315 = OpAccessChain %224 %29 
                                                      OpStore %315 %314 
                                Private f32* %316 = OpAccessChain %224 %29 
                                         f32 %317 = OpLoad %316 
                                         f32 %318 = OpFNegate %317 
                                         f32 %319 = OpFAdd %318 %71 
                                Private f32* %320 = OpAccessChain %224 %29 
                                                      OpStore %320 %319 
                                Private f32* %321 = OpAccessChain %224 %29 
                                         f32 %322 = OpLoad %321 
                                         f32 %323 = OpFNegate %322 
                                         f32 %324 = OpFAdd %323 %71 
                                Private f32* %325 = OpAccessChain %224 %29 
                                                      OpStore %325 %324 
                                Private f32* %326 = OpAccessChain %201 %217 
                                         f32 %327 = OpLoad %326 
                                Private f32* %328 = OpAccessChain %224 %29 
                                         f32 %329 = OpLoad %328 
                                         f32 %330 = OpFAdd %327 %329 
                                Private f32* %331 = OpAccessChain %224 %29 
                                                      OpStore %331 %330 
                                Private f32* %332 = OpAccessChain %224 %29 
                                         f32 %333 = OpLoad %332 
                                         f32 %334 = OpExtInst %1 43 %333 %189 %71 
                                Private f32* %335 = OpAccessChain %224 %29 
                                                      OpStore %335 %334 
                                       f32_4 %336 = OpLoad %201 
                                       f32_3 %337 = OpVectorShuffle %336 %336 0 1 2 
                                       f32_3 %338 = OpFNegate %337 
                                       f32_3 %339 = OpLoad %224 
                                       f32_3 %340 = OpVectorShuffle %339 %339 0 0 0 
                                       f32_3 %341 = OpFAdd %338 %340 
                                                      OpStore %224 %341 
                                         f32 %342 = OpLoad %191 
                                       f32_3 %343 = OpCompositeConstruct %342 %342 %342 
                                       f32_3 %344 = OpLoad %224 
                                       f32_3 %345 = OpFMul %343 %344 
                                       f32_4 %346 = OpLoad %201 
                                       f32_3 %347 = OpVectorShuffle %346 %346 0 1 2 
                                       f32_3 %348 = OpFAdd %345 %347 
                                                      OpStore %224 %348 
                                       f32_3 %351 = OpLoad %166 
                                       f32_3 %352 = OpLoad %224 
                                       f32_3 %353 = OpFMul %351 %352 
                                       f32_4 %354 = OpLoad %350 
                                       f32_4 %355 = OpVectorShuffle %354 %353 4 5 6 3 
                                                      OpStore %350 %355 
                                       f32_4 %356 = OpLoad %9 
                                       f32_3 %357 = OpVectorShuffle %356 %356 0 1 2 
                              Uniform f32_4* %359 = OpAccessChain %16 %358 
                                       f32_4 %360 = OpLoad %359 
                                       f32_3 %361 = OpVectorShuffle %360 %360 0 1 2 
                                       f32_3 %362 = OpFNegate %361 
                                       f32_3 %363 = OpFAdd %357 %362 
                                                      OpStore %166 %363 
                                       f32_4 %364 = OpLoad %9 
                                       f32_3 %365 = OpVectorShuffle %364 %364 0 1 2 
                                       f32_3 %366 = OpFNegate %365 
                              Uniform f32_4* %368 = OpAccessChain %16 %367 
                                       f32_4 %369 = OpLoad %368 
                                       f32_3 %370 = OpVectorShuffle %369 %369 0 1 2 
                                       f32_3 %371 = OpFAdd %366 %370 
                                                      OpStore %224 %371 
                                       f32_3 %372 = OpLoad %166 
                                       f32_3 %373 = OpLoad %224 
                                       f32_3 %374 = OpExtInst %1 40 %372 %373 
                                                      OpStore %166 %374 
                                       f32_3 %375 = OpLoad %166 
                                       f32_3 %377 = OpExtInst %1 40 %375 %376 
                                                      OpStore %166 %377 
                                       f32_3 %378 = OpLoad %166 
                                       f32_3 %379 = OpLoad %166 
                                         f32 %380 = OpDot %378 %379 
                                Private f32* %381 = OpAccessChain %166 %29 
                                                      OpStore %381 %380 
                                Private f32* %382 = OpAccessChain %166 %29 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpExtInst %1 31 %383 
                                Private f32* %385 = OpAccessChain %166 %29 
                                                      OpStore %385 %384 
                                Private f32* %386 = OpAccessChain %166 %29 
                                         f32 %387 = OpLoad %386 
                                Uniform f32* %389 = OpAccessChain %16 %388 %217 
                                         f32 %390 = OpLoad %389 
                                         f32 %391 = OpFDiv %387 %390 
                                Private f32* %392 = OpAccessChain %9 %29 
                                                      OpStore %392 %391 
                                Private f32* %393 = OpAccessChain %9 %29 
                                         f32 %394 = OpLoad %393 
                                         f32 %395 = OpFNegate %394 
                                         f32 %396 = OpFAdd %395 %71 
                                Private f32* %397 = OpAccessChain %9 %29 
                                                      OpStore %397 %396 
                                Private f32* %398 = OpAccessChain %9 %29 
                                         f32 %399 = OpLoad %398 
                                         f32 %400 = OpExtInst %1 43 %399 %189 %71 
                                Private f32* %401 = OpAccessChain %9 %29 
                                                      OpStore %401 %400 
                                Private f32* %402 = OpAccessChain %9 %29 
                                         f32 %403 = OpLoad %402 
                                 Output f32* %405 = OpAccessChain %350 %217 
                                                      OpStore %405 %403 
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
  Blend Zero Zero, Zero Zero
  ZTest Always
  ZWrite Off
  GpuProgramID 113442
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = exp2((-u_xlat16_0.xyz));
    SV_Target0.w = 0.0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = exp2((-u_xlat16_0.xyz));
    SV_Target0.w = 0.0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = exp2((-u_xlat16_0.xyz));
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 40
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %34 = OpConstant 3.674022E-40 
                                     %35 = OpTypeInt 32 0 
                                 u32 %36 = OpConstant 3 
                                     %37 = OpTypePointer Output %6 
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
                               f32_3 %30 = OpFNegate %29 
                               f32_3 %31 = OpExtInst %1 29 %30 
                               f32_4 %32 = OpLoad %28 
                               f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
                                             OpStore %28 %33 
                         Output f32* %38 = OpAccessChain %28 %36 
                                             OpStore %38 %34 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 40
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %34 = OpConstant 3.674022E-40 
                                     %35 = OpTypeInt 32 0 
                                 u32 %36 = OpConstant 3 
                                     %37 = OpTypePointer Output %6 
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
                               f32_3 %30 = OpFNegate %29 
                               f32_3 %31 = OpExtInst %1 29 %30 
                               f32_4 %32 = OpLoad %28 
                               f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
                                             OpStore %28 %33 
                         Output f32* %38 = OpAccessChain %28 %36 
                                             OpStore %38 %34 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 40
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
                                             OpDecorate %30 RelaxedPrecision 
                                             OpDecorate %31 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %34 = OpConstant 3.674022E-40 
                                     %35 = OpTypeInt 32 0 
                                 u32 %36 = OpConstant 3 
                                     %37 = OpTypePointer Output %6 
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
                               f32_3 %30 = OpFNegate %29 
                               f32_3 %31 = OpExtInst %1 29 %30 
                               f32_4 %32 = OpLoad %28 
                               f32_4 %33 = OpVectorShuffle %32 %31 4 5 6 3 
                                             OpStore %28 %33 
                         Output f32* %38 = OpAccessChain %28 %36 
                                             OpStore %38 %34 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_HDR_ON" }
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _CameraReflectionsTexture;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
void main()
{
    u_xlat16_0.xyz = texture(_CameraReflectionsTexture, vs_TEXCOORD0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
    SV_Target0.w = 0.0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_HDR_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 38
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %32 = OpConstant 3.674022E-40 
                                     %33 = OpTypeInt 32 0 
                                 u32 %34 = OpConstant 3 
                                     %35 = OpTypePointer Output %6 
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
                               f32_4 %30 = OpLoad %28 
                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                             OpStore %28 %31 
                         Output f32* %36 = OpAccessChain %28 %34 
                                             OpStore %36 %32 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 38
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %32 = OpConstant 3.674022E-40 
                                     %33 = OpTypeInt 32 0 
                                 u32 %34 = OpConstant 3 
                                     %35 = OpTypePointer Output %6 
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
                               f32_4 %30 = OpLoad %28 
                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                             OpStore %28 %31 
                         Output f32* %36 = OpAccessChain %28 %34 
                                             OpStore %36 %32 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 118
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %101 %106 
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
                                                     OpMemberDecorate %99 0 BuiltIn 99 
                                                     OpMemberDecorate %99 1 BuiltIn 99 
                                                     OpMemberDecorate %99 2 BuiltIn 99 
                                                     OpDecorate %99 Block 
                                                     OpDecorate vs_TEXCOORD0 Location 106 
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
                                             %76 = OpTypePointer Private %6 
                                         u32 %79 = OpConstant 0 
                                             %80 = OpTypePointer Uniform %6 
                                         f32 %87 = OpConstant 3.674022E-40 
                                         u32 %89 = OpConstant 3 
                                             %91 = OpTypeVector %6 2 
                                       f32_2 %94 = OpConstantComposite %87 %87 
                                             %98 = OpTypeArray %6 %75 
                                             %99 = OpTypeStruct %7 %6 %98 
                                            %100 = OpTypePointer Output %99 
       Output struct {f32_4; f32; f32[1];}* %101 = OpVariable Output 
                                            %103 = OpTypePointer Output %7 
                                            %105 = OpTypePointer Output %91 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                            %112 = OpTypePointer Output %6 
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
                                Private f32* %77 = OpAccessChain %9 %75 
                                         f32 %78 = OpLoad %77 
                                Uniform f32* %81 = OpAccessChain %20 %27 %79 
                                         f32 %82 = OpLoad %81 
                                         f32 %83 = OpFMul %78 %82 
                                Private f32* %84 = OpAccessChain %48 %79 
                                                     OpStore %84 %83 
                                Private f32* %85 = OpAccessChain %48 %79 
                                         f32 %86 = OpLoad %85 
                                         f32 %88 = OpFMul %86 %87 
                                Private f32* %90 = OpAccessChain %48 %89 
                                                     OpStore %90 %88 
                                       f32_4 %92 = OpLoad %9 
                                       f32_2 %93 = OpVectorShuffle %92 %92 0 3 
                                       f32_2 %95 = OpFMul %93 %94 
                                       f32_4 %96 = OpLoad %48 
                                       f32_4 %97 = OpVectorShuffle %96 %95 4 1 5 3 
                                                     OpStore %48 %97 
                                      f32_4 %102 = OpLoad %9 
                              Output f32_4* %104 = OpAccessChain %101 %27 
                                                     OpStore %104 %102 
                                      f32_4 %107 = OpLoad %48 
                                      f32_2 %108 = OpVectorShuffle %107 %107 2 2 
                                      f32_4 %109 = OpLoad %48 
                                      f32_2 %110 = OpVectorShuffle %109 %109 0 3 
                                      f32_2 %111 = OpFAdd %108 %110 
                                                     OpStore vs_TEXCOORD0 %111 
                                Output f32* %113 = OpAccessChain %101 %27 %75 
                                        f32 %114 = OpLoad %113 
                                        f32 %115 = OpFNegate %114 
                                Output f32* %116 = OpAccessChain %101 %27 %75 
                                                     OpStore %116 %115 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 38
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %28 
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
                                             OpDecorate %28 RelaxedPrecision 
                                             OpDecorate %28 Location 28 
                                             OpDecorate %29 RelaxedPrecision 
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
                                     %27 = OpTypePointer Output %24 
                       Output f32_4* %28 = OpVariable Output 
                                 f32 %32 = OpConstant 3.674022E-40 
                                     %33 = OpTypeInt 32 0 
                                 u32 %34 = OpConstant 3 
                                     %35 = OpTypePointer Output %6 
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
                               f32_4 %30 = OpLoad %28 
                               f32_4 %31 = OpVectorShuffle %30 %29 4 5 6 3 
                                             OpStore %28 %31 
                         Output f32* %36 = OpAccessChain %28 %34 
                                             OpStore %36 %32 
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
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_HDR_ON" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_HDR_ON" }
""
}
}
}
}
}