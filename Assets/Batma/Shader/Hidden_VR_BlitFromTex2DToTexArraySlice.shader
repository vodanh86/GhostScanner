//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/VR/BlitFromTex2DToTexArraySlice" {
Properties {
_MainTex ("Texture", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 4191
Program "vp" {
SubProgram "gles3 hw_tier00 " {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ArraySliceIndex;
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
    gl_Layer = int(uint(_ArraySliceIndex));
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
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ArraySliceIndex;
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
    gl_Layer = int(uint(_ArraySliceIndex));
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
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
uniform 	float _ArraySliceIndex;
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
    gl_Layer = int(uint(_ArraySliceIndex));
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
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
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
}
}
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 126208
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 310 es

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
layout(location = 0) out highp vec2 vs_TEXCOORD0;
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
#version 310 es

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
layout(location = 0) in highp vec2 gs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, gs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
#ifdef GEOMETRY
#version 310 es
#ifdef GL_ARB_geometry_shader
#extension GL_ARB_geometry_shader : enable
#endif
#ifdef GL_OES_geometry_shader
#extension GL_OES_geometry_shader : enable
#endif
#ifdef GL_EXT_geometry_shader
#extension GL_EXT_geometry_shader : enable
#endif

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
uniform 	float _ArraySliceIndex;
layout(location = 0) in highp vec2 vs_TEXCOORD0 [3];
uint u_xlatu0;
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out highp vec2 gs_TEXCOORD0;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TEXCOORD0.xy = vs_TEXCOORD0[0].xy;
    u_xlatu0 = uint(_ArraySliceIndex);
    gl_Layer = int(u_xlatu0);
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TEXCOORD0.xy = vs_TEXCOORD0[1].xy;
    gl_Layer = int(u_xlatu0);
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TEXCOORD0.xy = vs_TEXCOORD0[2].xy;
    gl_Layer = int(u_xlatu0);
    EmitVertex();
    EndPrimitive();
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 310 es

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
layout(location = 0) out highp vec2 vs_TEXCOORD0;
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
#version 310 es

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
layout(location = 0) in highp vec2 gs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, gs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
#ifdef GEOMETRY
#version 310 es
#ifdef GL_ARB_geometry_shader
#extension GL_ARB_geometry_shader : enable
#endif
#ifdef GL_OES_geometry_shader
#extension GL_OES_geometry_shader : enable
#endif
#ifdef GL_EXT_geometry_shader
#extension GL_EXT_geometry_shader : enable
#endif

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
uniform 	float _ArraySliceIndex;
layout(location = 0) in highp vec2 vs_TEXCOORD0 [3];
uint u_xlatu0;
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out highp vec2 gs_TEXCOORD0;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TEXCOORD0.xy = vs_TEXCOORD0[0].xy;
    u_xlatu0 = uint(_ArraySliceIndex);
    gl_Layer = int(u_xlatu0);
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TEXCOORD0.xy = vs_TEXCOORD0[1].xy;
    gl_Layer = int(u_xlatu0);
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TEXCOORD0.xy = vs_TEXCOORD0[2].xy;
    gl_Layer = int(u_xlatu0);
    EmitVertex();
    EndPrimitive();
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 310 es

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
layout(location = 0) out highp vec2 vs_TEXCOORD0;
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
#version 310 es

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
layout(location = 0) in highp vec2 gs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, gs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
#ifdef GEOMETRY
#version 310 es
#ifdef GL_ARB_geometry_shader
#extension GL_ARB_geometry_shader : enable
#endif
#ifdef GL_OES_geometry_shader
#extension GL_OES_geometry_shader : enable
#endif
#ifdef GL_EXT_geometry_shader
#extension GL_EXT_geometry_shader : enable
#endif

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
uniform 	float _ArraySliceIndex;
layout(location = 0) in highp vec2 vs_TEXCOORD0 [3];
uint u_xlatu0;
layout(triangles) in;
layout(triangle_strip) out;
layout(location = 0) out highp vec2 gs_TEXCOORD0;
layout(max_vertices = 3) out;
void main()
{
    gl_Position = gl_in[0].gl_Position;
    gs_TEXCOORD0.xy = vs_TEXCOORD0[0].xy;
    u_xlatu0 = uint(_ArraySliceIndex);
    gl_Layer = int(u_xlatu0);
    EmitVertex();
    gl_Position = gl_in[1].gl_Position;
    gs_TEXCOORD0.xy = vs_TEXCOORD0[1].xy;
    gl_Layer = int(u_xlatu0);
    EmitVertex();
    gl_Position = gl_in[2].gl_Position;
    gs_TEXCOORD0.xy = vs_TEXCOORD0[2].xy;
    gl_Layer = int(u_xlatu0);
    EmitVertex();
    EndPrimitive();
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
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate %22 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %26 Location 26 
                                             OpDecorate %27 RelaxedPrecision 
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
                        Input f32_2* %22 = OpVariable Input 
                                     %25 = OpTypePointer Output %7 
                       Output f32_4* %26 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad %22 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %27 = OpLoad %9 
                                             OpStore %26 %27 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 90
; Schema: 0
                                               OpCapability Geometry 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Geometry %4 "main" %13 %20 %28 %31 %45 
                                               OpExecutionMode %4 Triangles 
                                               OpExecutionMode %4 Invocations 4 
                                               OpExecutionMode %4 OutputTriangleStrip 
                                               OpExecutionMode %4 OutputVertices 4 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                               OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                               OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                               OpDecorate %11 Block 
                                               OpMemberDecorate %16 0 BuiltIn PointCoord 
                                               OpMemberDecorate %16 1 BuiltIn PointCoord 
                                               OpMemberDecorate %16 2 BuiltIn PointCoord 
                                               OpDecorate %16 Block 
                                               OpDecorate %28 Location 28 
                                               OpDecorate vs_TEXCOORD0 Location 31 
                                               OpMemberDecorate %37 0 Offset 37 
                                               OpDecorate %37 Block 
                                               OpDecorate %39 DescriptorSet 39 
                                               OpDecorate %39 Binding 39 
                                               OpDecorate %45 BuiltIn 45 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypeInt 32 0 
                                    u32 %9 = OpConstant 1 
                                       %10 = OpTypeArray %6 %9 
                                       %11 = OpTypeStruct %7 %6 %10 
                                       %12 = OpTypePointer Output %11 
  Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                       %14 = OpTypeInt 32 1 
                                   i32 %15 = OpConstant 0 
                                       %16 = OpTypeStruct %7 %6 %10 
                                   u32 %17 = OpConstant 3 
                                       %18 = OpTypeArray %16 %17 
                                       %19 = OpTypePointer Input %18 
Input struct {f32_4; f32; f32[1];}[3]* %20 = OpVariable Input 
                                       %21 = OpTypePointer Input %7 
                                       %24 = OpTypePointer Output %7 
                                       %26 = OpTypeVector %6 2 
                                       %27 = OpTypePointer Output %26 
                         Output f32_2* %28 = OpVariable Output 
                                       %29 = OpTypeArray %26 %17 
                                       %30 = OpTypePointer Input %29 
              Input f32_2[3]* vs_TEXCOORD0 = OpVariable Input 
                                       %32 = OpTypePointer Input %26 
                                       %35 = OpTypePointer Private %8 
                          Private u32* %36 = OpVariable Private 
                                       %37 = OpTypeStruct %6 
                                       %38 = OpTypePointer Uniform %37 
                Uniform struct {f32;}* %39 = OpVariable Uniform 
                                       %40 = OpTypePointer Uniform %6 
                                       %44 = OpTypePointer Output %14 
                           Output i32* %45 = OpVariable Output 
                                       %48 = OpTypePointer Output %6 
                                   i32 %57 = OpConstant 1 
                                   i32 %73 = OpConstant 2 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                          Input f32_4* %22 = OpAccessChain %20 %15 %15 
                                 f32_4 %23 = OpLoad %22 
                         Output f32_4* %25 = OpAccessChain %13 %15 
                                               OpStore %25 %23 
                          Input f32_2* %33 = OpAccessChain vs_TEXCOORD0 %15 
                                 f32_2 %34 = OpLoad %33 
                                               OpStore %28 %34 
                          Uniform f32* %41 = OpAccessChain %39 %15 
                                   f32 %42 = OpLoad %41 
                                   u32 %43 = OpConvertFToU %42 
                                               OpStore %36 %43 
                                   u32 %46 = OpLoad %36 
                                   i32 %47 = OpBitcast %46 
                                               OpStore %45 %47 
                           Output f32* %49 = OpAccessChain %13 %15 %9 
                                   f32 %50 = OpLoad %49 
                                   f32 %51 = OpFNegate %50 
                           Output f32* %52 = OpAccessChain %13 %15 %9 
                                               OpStore %52 %51 
                                               OpEmitVertex
                           Output f32* %53 = OpAccessChain %13 %15 %9 
                                   f32 %54 = OpLoad %53 
                                   f32 %55 = OpFNegate %54 
                           Output f32* %56 = OpAccessChain %13 %15 %9 
                                               OpStore %56 %55 
                          Input f32_4* %58 = OpAccessChain %20 %57 %15 
                                 f32_4 %59 = OpLoad %58 
                         Output f32_4* %60 = OpAccessChain %13 %15 
                                               OpStore %60 %59 
                          Input f32_2* %61 = OpAccessChain vs_TEXCOORD0 %57 
                                 f32_2 %62 = OpLoad %61 
                                               OpStore %28 %62 
                                   u32 %63 = OpLoad %36 
                                   i32 %64 = OpBitcast %63 
                                               OpStore %45 %64 
                           Output f32* %65 = OpAccessChain %13 %15 %9 
                                   f32 %66 = OpLoad %65 
                                   f32 %67 = OpFNegate %66 
                           Output f32* %68 = OpAccessChain %13 %15 %9 
                                               OpStore %68 %67 
                                               OpEmitVertex
                           Output f32* %69 = OpAccessChain %13 %15 %9 
                                   f32 %70 = OpLoad %69 
                                   f32 %71 = OpFNegate %70 
                           Output f32* %72 = OpAccessChain %13 %15 %9 
                                               OpStore %72 %71 
                          Input f32_4* %74 = OpAccessChain %20 %73 %15 
                                 f32_4 %75 = OpLoad %74 
                         Output f32_4* %76 = OpAccessChain %13 %15 
                                               OpStore %76 %75 
                          Input f32_2* %77 = OpAccessChain vs_TEXCOORD0 %73 
                                 f32_2 %78 = OpLoad %77 
                                               OpStore %28 %78 
                                   u32 %79 = OpLoad %36 
                                   i32 %80 = OpBitcast %79 
                                               OpStore %45 %80 
                           Output f32* %81 = OpAccessChain %13 %15 %9 
                                   f32 %82 = OpLoad %81 
                                   f32 %83 = OpFNegate %82 
                           Output f32* %84 = OpAccessChain %13 %15 %9 
                                               OpStore %84 %83 
                                               OpEmitVertex
                           Output f32* %85 = OpAccessChain %13 %15 %9 
                                   f32 %86 = OpLoad %85 
                                   f32 %87 = OpFNegate %86 
                           Output f32* %88 = OpAccessChain %13 %15 %9 
                                               OpStore %88 %87 
                                               OpEndPrimitive
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
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate %22 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %26 Location 26 
                                             OpDecorate %27 RelaxedPrecision 
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
                        Input f32_2* %22 = OpVariable Input 
                                     %25 = OpTypePointer Output %7 
                       Output f32_4* %26 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad %22 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %27 = OpLoad %9 
                                             OpStore %26 %27 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 90
; Schema: 0
                                               OpCapability Geometry 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Geometry %4 "main" %13 %20 %28 %31 %45 
                                               OpExecutionMode %4 Triangles 
                                               OpExecutionMode %4 Invocations 4 
                                               OpExecutionMode %4 OutputTriangleStrip 
                                               OpExecutionMode %4 OutputVertices 4 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                               OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                               OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                               OpDecorate %11 Block 
                                               OpMemberDecorate %16 0 BuiltIn PointCoord 
                                               OpMemberDecorate %16 1 BuiltIn PointCoord 
                                               OpMemberDecorate %16 2 BuiltIn PointCoord 
                                               OpDecorate %16 Block 
                                               OpDecorate %28 Location 28 
                                               OpDecorate vs_TEXCOORD0 Location 31 
                                               OpMemberDecorate %37 0 Offset 37 
                                               OpDecorate %37 Block 
                                               OpDecorate %39 DescriptorSet 39 
                                               OpDecorate %39 Binding 39 
                                               OpDecorate %45 BuiltIn 45 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypeInt 32 0 
                                    u32 %9 = OpConstant 1 
                                       %10 = OpTypeArray %6 %9 
                                       %11 = OpTypeStruct %7 %6 %10 
                                       %12 = OpTypePointer Output %11 
  Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                       %14 = OpTypeInt 32 1 
                                   i32 %15 = OpConstant 0 
                                       %16 = OpTypeStruct %7 %6 %10 
                                   u32 %17 = OpConstant 3 
                                       %18 = OpTypeArray %16 %17 
                                       %19 = OpTypePointer Input %18 
Input struct {f32_4; f32; f32[1];}[3]* %20 = OpVariable Input 
                                       %21 = OpTypePointer Input %7 
                                       %24 = OpTypePointer Output %7 
                                       %26 = OpTypeVector %6 2 
                                       %27 = OpTypePointer Output %26 
                         Output f32_2* %28 = OpVariable Output 
                                       %29 = OpTypeArray %26 %17 
                                       %30 = OpTypePointer Input %29 
              Input f32_2[3]* vs_TEXCOORD0 = OpVariable Input 
                                       %32 = OpTypePointer Input %26 
                                       %35 = OpTypePointer Private %8 
                          Private u32* %36 = OpVariable Private 
                                       %37 = OpTypeStruct %6 
                                       %38 = OpTypePointer Uniform %37 
                Uniform struct {f32;}* %39 = OpVariable Uniform 
                                       %40 = OpTypePointer Uniform %6 
                                       %44 = OpTypePointer Output %14 
                           Output i32* %45 = OpVariable Output 
                                       %48 = OpTypePointer Output %6 
                                   i32 %57 = OpConstant 1 
                                   i32 %73 = OpConstant 2 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                          Input f32_4* %22 = OpAccessChain %20 %15 %15 
                                 f32_4 %23 = OpLoad %22 
                         Output f32_4* %25 = OpAccessChain %13 %15 
                                               OpStore %25 %23 
                          Input f32_2* %33 = OpAccessChain vs_TEXCOORD0 %15 
                                 f32_2 %34 = OpLoad %33 
                                               OpStore %28 %34 
                          Uniform f32* %41 = OpAccessChain %39 %15 
                                   f32 %42 = OpLoad %41 
                                   u32 %43 = OpConvertFToU %42 
                                               OpStore %36 %43 
                                   u32 %46 = OpLoad %36 
                                   i32 %47 = OpBitcast %46 
                                               OpStore %45 %47 
                           Output f32* %49 = OpAccessChain %13 %15 %9 
                                   f32 %50 = OpLoad %49 
                                   f32 %51 = OpFNegate %50 
                           Output f32* %52 = OpAccessChain %13 %15 %9 
                                               OpStore %52 %51 
                                               OpEmitVertex
                           Output f32* %53 = OpAccessChain %13 %15 %9 
                                   f32 %54 = OpLoad %53 
                                   f32 %55 = OpFNegate %54 
                           Output f32* %56 = OpAccessChain %13 %15 %9 
                                               OpStore %56 %55 
                          Input f32_4* %58 = OpAccessChain %20 %57 %15 
                                 f32_4 %59 = OpLoad %58 
                         Output f32_4* %60 = OpAccessChain %13 %15 
                                               OpStore %60 %59 
                          Input f32_2* %61 = OpAccessChain vs_TEXCOORD0 %57 
                                 f32_2 %62 = OpLoad %61 
                                               OpStore %28 %62 
                                   u32 %63 = OpLoad %36 
                                   i32 %64 = OpBitcast %63 
                                               OpStore %45 %64 
                           Output f32* %65 = OpAccessChain %13 %15 %9 
                                   f32 %66 = OpLoad %65 
                                   f32 %67 = OpFNegate %66 
                           Output f32* %68 = OpAccessChain %13 %15 %9 
                                               OpStore %68 %67 
                                               OpEmitVertex
                           Output f32* %69 = OpAccessChain %13 %15 %9 
                                   f32 %70 = OpLoad %69 
                                   f32 %71 = OpFNegate %70 
                           Output f32* %72 = OpAccessChain %13 %15 %9 
                                               OpStore %72 %71 
                          Input f32_4* %74 = OpAccessChain %20 %73 %15 
                                 f32_4 %75 = OpLoad %74 
                         Output f32_4* %76 = OpAccessChain %13 %15 
                                               OpStore %76 %75 
                          Input f32_2* %77 = OpAccessChain vs_TEXCOORD0 %73 
                                 f32_2 %78 = OpLoad %77 
                                               OpStore %28 %78 
                                   u32 %79 = OpLoad %36 
                                   i32 %80 = OpBitcast %79 
                                               OpStore %45 %80 
                           Output f32* %81 = OpAccessChain %13 %15 %9 
                                   f32 %82 = OpLoad %81 
                                   f32 %83 = OpFNegate %82 
                           Output f32* %84 = OpAccessChain %13 %15 %9 
                                               OpStore %84 %83 
                                               OpEmitVertex
                           Output f32* %85 = OpAccessChain %13 %15 %9 
                                   f32 %86 = OpLoad %85 
                                   f32 %87 = OpFNegate %86 
                           Output f32* %88 = OpAccessChain %13 %15 %9 
                                               OpStore %88 %87 
                                               OpEndPrimitive
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
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate %22 Location 22 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpDecorate %26 Location 26 
                                             OpDecorate %27 RelaxedPrecision 
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
                        Input f32_2* %22 = OpVariable Input 
                                     %25 = OpTypePointer Output %7 
                       Output f32_4* %26 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad %22 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %27 = OpLoad %9 
                                             OpStore %26 %27 
                                             OpReturn
                                             OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 90
; Schema: 0
                                               OpCapability Geometry 
                                        %1 = OpExtInstImport "GLSL.std.450" 
                                               OpMemoryModel Logical GLSL450 
                                               OpEntryPoint Geometry %4 "main" %13 %20 %28 %31 %45 
                                               OpExecutionMode %4 Triangles 
                                               OpExecutionMode %4 Invocations 4 
                                               OpExecutionMode %4 OutputTriangleStrip 
                                               OpExecutionMode %4 OutputVertices 4 
                                               OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                               OpMemberDecorate %11 0 BuiltIn TessLevelOuter 
                                               OpMemberDecorate %11 1 BuiltIn TessLevelOuter 
                                               OpMemberDecorate %11 2 BuiltIn TessLevelOuter 
                                               OpDecorate %11 Block 
                                               OpMemberDecorate %16 0 BuiltIn PointCoord 
                                               OpMemberDecorate %16 1 BuiltIn PointCoord 
                                               OpMemberDecorate %16 2 BuiltIn PointCoord 
                                               OpDecorate %16 Block 
                                               OpDecorate %28 Location 28 
                                               OpDecorate vs_TEXCOORD0 Location 31 
                                               OpMemberDecorate %37 0 Offset 37 
                                               OpDecorate %37 Block 
                                               OpDecorate %39 DescriptorSet 39 
                                               OpDecorate %39 Binding 39 
                                               OpDecorate %45 BuiltIn 45 
                                        %2 = OpTypeVoid 
                                        %3 = OpTypeFunction %2 
                                        %6 = OpTypeFloat 32 
                                        %7 = OpTypeVector %6 4 
                                        %8 = OpTypeInt 32 0 
                                    u32 %9 = OpConstant 1 
                                       %10 = OpTypeArray %6 %9 
                                       %11 = OpTypeStruct %7 %6 %10 
                                       %12 = OpTypePointer Output %11 
  Output struct {f32_4; f32; f32[1];}* %13 = OpVariable Output 
                                       %14 = OpTypeInt 32 1 
                                   i32 %15 = OpConstant 0 
                                       %16 = OpTypeStruct %7 %6 %10 
                                   u32 %17 = OpConstant 3 
                                       %18 = OpTypeArray %16 %17 
                                       %19 = OpTypePointer Input %18 
Input struct {f32_4; f32; f32[1];}[3]* %20 = OpVariable Input 
                                       %21 = OpTypePointer Input %7 
                                       %24 = OpTypePointer Output %7 
                                       %26 = OpTypeVector %6 2 
                                       %27 = OpTypePointer Output %26 
                         Output f32_2* %28 = OpVariable Output 
                                       %29 = OpTypeArray %26 %17 
                                       %30 = OpTypePointer Input %29 
              Input f32_2[3]* vs_TEXCOORD0 = OpVariable Input 
                                       %32 = OpTypePointer Input %26 
                                       %35 = OpTypePointer Private %8 
                          Private u32* %36 = OpVariable Private 
                                       %37 = OpTypeStruct %6 
                                       %38 = OpTypePointer Uniform %37 
                Uniform struct {f32;}* %39 = OpVariable Uniform 
                                       %40 = OpTypePointer Uniform %6 
                                       %44 = OpTypePointer Output %14 
                           Output i32* %45 = OpVariable Output 
                                       %48 = OpTypePointer Output %6 
                                   i32 %57 = OpConstant 1 
                                   i32 %73 = OpConstant 2 
                                   void %4 = OpFunction None %3 
                                        %5 = OpLabel 
                          Input f32_4* %22 = OpAccessChain %20 %15 %15 
                                 f32_4 %23 = OpLoad %22 
                         Output f32_4* %25 = OpAccessChain %13 %15 
                                               OpStore %25 %23 
                          Input f32_2* %33 = OpAccessChain vs_TEXCOORD0 %15 
                                 f32_2 %34 = OpLoad %33 
                                               OpStore %28 %34 
                          Uniform f32* %41 = OpAccessChain %39 %15 
                                   f32 %42 = OpLoad %41 
                                   u32 %43 = OpConvertFToU %42 
                                               OpStore %36 %43 
                                   u32 %46 = OpLoad %36 
                                   i32 %47 = OpBitcast %46 
                                               OpStore %45 %47 
                           Output f32* %49 = OpAccessChain %13 %15 %9 
                                   f32 %50 = OpLoad %49 
                                   f32 %51 = OpFNegate %50 
                           Output f32* %52 = OpAccessChain %13 %15 %9 
                                               OpStore %52 %51 
                                               OpEmitVertex
                           Output f32* %53 = OpAccessChain %13 %15 %9 
                                   f32 %54 = OpLoad %53 
                                   f32 %55 = OpFNegate %54 
                           Output f32* %56 = OpAccessChain %13 %15 %9 
                                               OpStore %56 %55 
                          Input f32_4* %58 = OpAccessChain %20 %57 %15 
                                 f32_4 %59 = OpLoad %58 
                         Output f32_4* %60 = OpAccessChain %13 %15 
                                               OpStore %60 %59 
                          Input f32_2* %61 = OpAccessChain vs_TEXCOORD0 %57 
                                 f32_2 %62 = OpLoad %61 
                                               OpStore %28 %62 
                                   u32 %63 = OpLoad %36 
                                   i32 %64 = OpBitcast %63 
                                               OpStore %45 %64 
                           Output f32* %65 = OpAccessChain %13 %15 %9 
                                   f32 %66 = OpLoad %65 
                                   f32 %67 = OpFNegate %66 
                           Output f32* %68 = OpAccessChain %13 %15 %9 
                                               OpStore %68 %67 
                                               OpEmitVertex
                           Output f32* %69 = OpAccessChain %13 %15 %9 
                                   f32 %70 = OpLoad %69 
                                   f32 %71 = OpFNegate %70 
                           Output f32* %72 = OpAccessChain %13 %15 %9 
                                               OpStore %72 %71 
                          Input f32_4* %74 = OpAccessChain %20 %73 %15 
                                 f32_4 %75 = OpLoad %74 
                         Output f32_4* %76 = OpAccessChain %13 %15 
                                               OpStore %76 %75 
                          Input f32_2* %77 = OpAccessChain vs_TEXCOORD0 %73 
                                 f32_2 %78 = OpLoad %77 
                                               OpStore %28 %78 
                                   u32 %79 = OpLoad %36 
                                   i32 %80 = OpBitcast %79 
                                               OpStore %45 %80 
                           Output f32* %81 = OpAccessChain %13 %15 %9 
                                   f32 %82 = OpLoad %81 
                                   f32 %83 = OpFNegate %82 
                           Output f32* %84 = OpAccessChain %13 %15 %9 
                                               OpStore %84 %83 
                                               OpEmitVertex
                           Output f32* %85 = OpAccessChain %13 %15 %9 
                                   f32 %86 = OpLoad %85 
                                   f32 %87 = OpFNegate %86 
                           Output f32* %88 = OpAccessChain %13 %15 %9 
                                               OpStore %88 %87 
                                               OpEndPrimitive
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
Program "gp" {
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