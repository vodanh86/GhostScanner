//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/TextCore/Distance Field SSD" {
Properties {
_FaceColor ("Face Color", Color) = (1,1,1,1)
_FaceDilate ("Face Dilate", Range(-1, 1)) = 0
_OutlineColor ("Outline Color", Color) = (0,0,0,1)
_OutlineWidth ("Outline Thickness", Range(0, 1)) = 0
_OutlineSoftness ("Outline Softness", Range(0, 1)) = 0
_UnderlayColor ("Border Color", Color) = (0,0,0,0.5)
_UnderlayOffsetX ("Border OffsetX", Range(-1, 1)) = 0
_UnderlayOffsetY ("Border OffsetY", Range(-1, 1)) = 0
_UnderlayDilate ("Border Dilate", Range(-1, 1)) = 0
_UnderlaySoftness ("Border Softness", Range(0, 1)) = 0
_WeightNormal ("Weight Normal", Float) = 0
_WeightBold ("Weight Bold", Float) = 0.5
_ShaderFlags ("Flags", Float) = 0
_ScaleRatioA ("Scale RatioA", Float) = 1
_ScaleRatioB ("Scale RatioB", Float) = 1
_ScaleRatioC ("Scale RatioC", Float) = 1
_MainTex ("Font Atlas", 2D) = "white" { }
_TextureWidth ("Texture Width", Float) = 512
_TextureHeight ("Texture Height", Float) = 512
_GradientScale ("Gradient Scale", Float) = 5
_ScaleX ("Scale X", Float) = 1
_ScaleY ("Scale Y", Float) = 1
_Sharpness ("Sharpness", Range(-1, 1)) = 0
_VertexOffsetX ("Vertex OffsetX", Float) = 0
_VertexOffsetY ("Vertex OffsetY", Float) = 0
}
SubShader {
 Tags { "ForceSupported" = "true" }
 Pass {
  Tags { "ForceSupported" = "true" }
  Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 33620
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec2 u_xlat3;
void main()
{
    u_xlat0.x = in_POSITION0.y + _VertexOffsetY;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1.x = in_POSITION0.x + _VertexOffsetX;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_0 = in_COLOR0 * _FaceColor;
    vs_COLOR0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    vs_COLOR0.w = u_xlat16_0.w;
    u_xlat1.x = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR1.xyz = u_xlat1.xxx * _OutlineColor.xyz;
    vs_COLOR1.w = u_xlat1.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat1.xy;
    u_xlat3.xy = u_xlat1.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat1.xx + u_xlat3.xy;
    vs_TEXCOORD1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
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
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _ScaleRatioA;
uniform 	float _Sharpness;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = dFdx(u_xlat0.x);
    u_xlat16_4 = dFdy(u_xlat0.x);
    u_xlat16_1 = abs(u_xlat16_4) + abs(u_xlat16_1);
    u_xlat3 = (-_Sharpness) + 1.0;
    u_xlat6 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat16_1 * u_xlat3 + u_xlat6;
    u_xlat6 = _FaceDilate * _ScaleRatioA;
    u_xlat6 = (-u_xlat6) * 0.5 + 0.5;
    u_xlat16_1 = u_xlat3 + u_xlat6;
    u_xlat16_4 = (-u_xlat3) + u_xlat6;
    u_xlat16_1 = (-u_xlat16_4) + u_xlat16_1;
    u_xlat16_4 = u_xlat0.x + (-u_xlat16_4);
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat16_0 = vec4(u_xlat16_1) * vs_COLOR0;
    u_xlat16_2 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vec4(u_xlat16_2);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec2 u_xlat3;
void main()
{
    u_xlat0.x = in_POSITION0.y + _VertexOffsetY;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1.x = in_POSITION0.x + _VertexOffsetX;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_0 = in_COLOR0 * _FaceColor;
    vs_COLOR0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    vs_COLOR0.w = u_xlat16_0.w;
    u_xlat1.x = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR1.xyz = u_xlat1.xxx * _OutlineColor.xyz;
    vs_COLOR1.w = u_xlat1.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat1.xy;
    u_xlat3.xy = u_xlat1.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat1.xx + u_xlat3.xy;
    vs_TEXCOORD1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
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
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _ScaleRatioA;
uniform 	float _Sharpness;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = dFdx(u_xlat0.x);
    u_xlat16_4 = dFdy(u_xlat0.x);
    u_xlat16_1 = abs(u_xlat16_4) + abs(u_xlat16_1);
    u_xlat3 = (-_Sharpness) + 1.0;
    u_xlat6 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat16_1 * u_xlat3 + u_xlat6;
    u_xlat6 = _FaceDilate * _ScaleRatioA;
    u_xlat6 = (-u_xlat6) * 0.5 + 0.5;
    u_xlat16_1 = u_xlat3 + u_xlat6;
    u_xlat16_4 = (-u_xlat3) + u_xlat6;
    u_xlat16_1 = (-u_xlat16_4) + u_xlat16_1;
    u_xlat16_4 = u_xlat0.x + (-u_xlat16_4);
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat16_0 = vec4(u_xlat16_1) * vs_COLOR0;
    u_xlat16_2 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vec4(u_xlat16_2);
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _FaceColor;
uniform 	mediump vec4 _OutlineColor;
uniform 	float _VertexOffsetX;
uniform 	float _VertexOffsetY;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec2 u_xlat3;
void main()
{
    u_xlat0.x = in_POSITION0.y + _VertexOffsetY;
    u_xlat0 = u_xlat0.xxxx * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1.x = in_POSITION0.x + _VertexOffsetX;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat16_0 = in_COLOR0 * _FaceColor;
    vs_COLOR0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    vs_COLOR0.w = u_xlat16_0.w;
    u_xlat1.x = in_COLOR0.w * _OutlineColor.w;
    vs_COLOR1.xyz = u_xlat1.xxx * _OutlineColor.xyz;
    vs_COLOR1.w = u_xlat1.x;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat1.xy;
    u_xlat3.xy = u_xlat1.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat1.xx + u_xlat3.xy;
    vs_TEXCOORD1.xy = u_xlat1.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
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
uniform 	float _FaceDilate;
uniform 	float _OutlineSoftness;
uniform 	float _ScaleRatioA;
uniform 	float _Sharpness;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat3;
mediump float u_xlat16_4;
float u_xlat6;
void main()
{
    u_xlat0.x = texture(_MainTex, vs_TEXCOORD0.xy).w;
    u_xlat16_1 = dFdx(u_xlat0.x);
    u_xlat16_4 = dFdy(u_xlat0.x);
    u_xlat16_1 = abs(u_xlat16_4) + abs(u_xlat16_1);
    u_xlat3 = (-_Sharpness) + 1.0;
    u_xlat6 = _OutlineSoftness * _ScaleRatioA;
    u_xlat3 = u_xlat16_1 * u_xlat3 + u_xlat6;
    u_xlat6 = _FaceDilate * _ScaleRatioA;
    u_xlat6 = (-u_xlat6) * 0.5 + 0.5;
    u_xlat16_1 = u_xlat3 + u_xlat6;
    u_xlat16_4 = (-u_xlat3) + u_xlat6;
    u_xlat16_1 = (-u_xlat16_4) + u_xlat16_1;
    u_xlat16_4 = u_xlat0.x + (-u_xlat16_4);
    u_xlat16_1 = float(1.0) / u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat16_4 = u_xlat16_1 * -2.0 + 3.0;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_1;
    u_xlat16_1 = u_xlat16_1 * u_xlat16_4;
    u_xlat16_0 = vec4(u_xlat16_1) * vs_COLOR0;
    u_xlat16_2 = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat0 = u_xlat16_0 * vec4(u_xlat16_2);
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
; Bound: 242
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %103 %108 %129 %226 %233 %235 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 RelaxedPrecision 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 RelaxedPrecision 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpMemberDecorate %22 7 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %103 Location 103 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %108 Location 108 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %111 RelaxedPrecision 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %126 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %129 RelaxedPrecision 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %133 RelaxedPrecision 
                                                      OpDecorate %134 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 226 
                                                      OpDecorate vs_TEXCOORD0 Location 233 
                                                      OpDecorate %235 Location 235 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 1 
                                              %14 = OpTypePointer Input %6 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeArray %7 %17 
                                              %22 = OpTypeStruct %18 %19 %20 %7 %7 %6 %6 %21 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32; f32_4[4];}* %24 = OpVariable Uniform 
                                              %25 = OpTypeInt 32 1 
                                          i32 %26 = OpConstant 6 
                                              %27 = OpTypePointer Uniform %6 
                                          u32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Private %6 
                                          i32 %36 = OpConstant 0 
                                          i32 %37 = OpConstant 1 
                                              %38 = OpTypePointer Uniform %7 
                               Private f32_4* %42 = OpVariable Private 
                                          i32 %45 = OpConstant 5 
                                          i32 %57 = OpConstant 2 
                                          i32 %66 = OpConstant 3 
                                              %89 = OpTypeArray %6 %13 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                             %100 = OpTypePointer Output %7 
                              Private f32_4* %102 = OpVariable Private 
                                Input f32_4* %103 = OpVariable Input 
                               Output f32_4* %108 = OpVariable Output 
                                             %109 = OpTypeVector %6 3 
                                         u32 %117 = OpConstant 3 
                                             %120 = OpTypePointer Output %6 
                                         i32 %124 = OpConstant 4 
                               Output f32_4* %129 = OpVariable Output 
                                             %164 = OpTypeVector %6 2 
                                             %206 = OpTypePointer Private %164 
                              Private f32_2* %207 = OpVariable Private 
                                         i32 %210 = OpConstant 7 
                                             %225 = OpTypePointer Output %164 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %234 = OpTypePointer Input %164 
                                Input f32_2* %235 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                   Input f32* %15 = OpAccessChain %11 %13 
                                          f32 %16 = OpLoad %15 
                                 Uniform f32* %28 = OpAccessChain %24 %26 
                                          f32 %29 = OpLoad %28 
                                          f32 %30 = OpFAdd %16 %29 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                                      OpStore %33 %30 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                               Uniform f32_4* %39 = OpAccessChain %24 %36 %37 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpFMul %35 %40 
                                                      OpStore %9 %41 
                                   Input f32* %43 = OpAccessChain %11 %31 
                                          f32 %44 = OpLoad %43 
                                 Uniform f32* %46 = OpAccessChain %24 %45 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %44 %47 
                                 Private f32* %49 = OpAccessChain %42 %31 
                                                      OpStore %49 %48 
                               Uniform f32_4* %50 = OpAccessChain %24 %36 %36 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %42 
                                        f32_4 %53 = OpVectorShuffle %52 %52 0 0 0 0 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                               Uniform f32_4* %58 = OpAccessChain %24 %36 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %11 
                                        f32_4 %61 = OpVectorShuffle %60 %60 2 2 2 2 
                                        f32_4 %62 = OpFMul %59 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpFAdd %62 %63 
                                                      OpStore %9 %64 
                                        f32_4 %65 = OpLoad %9 
                               Uniform f32_4* %67 = OpAccessChain %24 %36 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpFAdd %65 %68 
                                                      OpStore %9 %69 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 1 1 1 1 
                               Uniform f32_4* %72 = OpAccessChain %24 %57 %37 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpFMul %71 %73 
                                                      OpStore %42 %74 
                               Uniform f32_4* %75 = OpAccessChain %24 %57 %36 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 0 0 0 0 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %42 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %42 %81 
                               Uniform f32_4* %82 = OpAccessChain %24 %57 %57 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 2 2 2 2 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %42 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %42 %88 
                               Uniform f32_4* %93 = OpAccessChain %24 %57 %66 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpVectorShuffle %95 %95 3 3 3 3 
                                        f32_4 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %42 
                                        f32_4 %99 = OpFAdd %97 %98 
                               Output f32_4* %101 = OpAccessChain %92 %36 
                                                      OpStore %101 %99 
                                       f32_4 %104 = OpLoad %103 
                              Uniform f32_4* %105 = OpAccessChain %24 %66 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpFMul %104 %106 
                                                      OpStore %102 %107 
                                       f32_4 %110 = OpLoad %102 
                                       f32_3 %111 = OpVectorShuffle %110 %110 3 3 3 
                                       f32_4 %112 = OpLoad %102 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %108 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %108 %116 
                                Private f32* %118 = OpAccessChain %102 %117 
                                         f32 %119 = OpLoad %118 
                                 Output f32* %121 = OpAccessChain %108 %117 
                                                      OpStore %121 %119 
                                  Input f32* %122 = OpAccessChain %103 %117 
                                         f32 %123 = OpLoad %122 
                                Uniform f32* %125 = OpAccessChain %24 %124 %117 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFMul %123 %126 
                                Private f32* %128 = OpAccessChain %42 %31 
                                                      OpStore %128 %127 
                                       f32_4 %130 = OpLoad %42 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 0 0 
                              Uniform f32_4* %132 = OpAccessChain %24 %124 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFMul %131 %134 
                                       f32_4 %136 = OpLoad %129 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %129 %137 
                                Private f32* %138 = OpAccessChain %42 %31 
                                         f32 %139 = OpLoad %138 
                                 Output f32* %140 = OpAccessChain %129 %117 
                                                      OpStore %140 %139 
                                       f32_4 %141 = OpLoad %11 
                                       f32_4 %142 = OpVectorShuffle %141 %141 1 1 1 1 
                              Uniform f32_4* %143 = OpAccessChain %24 %36 %37 
                                       f32_4 %144 = OpLoad %143 
                                       f32_4 %145 = OpFMul %142 %144 
                                                      OpStore %9 %145 
                              Uniform f32_4* %146 = OpAccessChain %24 %36 %36 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpLoad %11 
                                       f32_4 %149 = OpVectorShuffle %148 %148 0 0 0 0 
                                       f32_4 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_4 %152 = OpFAdd %150 %151 
                                                      OpStore %9 %152 
                              Uniform f32_4* %153 = OpAccessChain %24 %36 %57 
                                       f32_4 %154 = OpLoad %153 
                                       f32_4 %155 = OpLoad %11 
                                       f32_4 %156 = OpVectorShuffle %155 %155 2 2 2 2 
                                       f32_4 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %9 
                                       f32_4 %159 = OpFAdd %157 %158 
                                                      OpStore %9 %159 
                                       f32_4 %160 = OpLoad %9 
                              Uniform f32_4* %161 = OpAccessChain %24 %36 %66 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %160 %162 
                                                      OpStore %9 %163 
                                       f32_4 %165 = OpLoad %9 
                                       f32_2 %166 = OpVectorShuffle %165 %165 1 1 
                              Uniform f32_4* %167 = OpAccessChain %24 %37 %37 
                                       f32_4 %168 = OpLoad %167 
                                       f32_2 %169 = OpVectorShuffle %168 %168 0 1 
                                       f32_2 %170 = OpFMul %166 %169 
                                       f32_4 %171 = OpLoad %42 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 2 3 
                                                      OpStore %42 %172 
                              Uniform f32_4* %173 = OpAccessChain %24 %37 %36 
                                       f32_4 %174 = OpLoad %173 
                                       f32_2 %175 = OpVectorShuffle %174 %174 0 1 
                                       f32_4 %176 = OpLoad %9 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 0 
                                       f32_2 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %42 
                                       f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                                       f32_2 %181 = OpFAdd %178 %180 
                                       f32_4 %182 = OpLoad %42 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 2 3 
                                                      OpStore %42 %183 
                              Uniform f32_4* %184 = OpAccessChain %24 %37 %57 
                                       f32_4 %185 = OpLoad %184 
                                       f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                                       f32_4 %187 = OpLoad %9 
                                       f32_2 %188 = OpVectorShuffle %187 %187 2 2 
                                       f32_2 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %42 
                                       f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                                       f32_2 %192 = OpFAdd %189 %191 
                                       f32_4 %193 = OpLoad %42 
                                       f32_4 %194 = OpVectorShuffle %193 %192 4 5 2 3 
                                                      OpStore %42 %194 
                              Uniform f32_4* %195 = OpAccessChain %24 %37 %66 
                                       f32_4 %196 = OpLoad %195 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_4 %198 = OpLoad %9 
                                       f32_2 %199 = OpVectorShuffle %198 %198 3 3 
                                       f32_2 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %42 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_2 %203 = OpFAdd %200 %202 
                                       f32_4 %204 = OpLoad %42 
                                       f32_4 %205 = OpVectorShuffle %204 %203 4 5 2 3 
                                                      OpStore %42 %205 
                                       f32_4 %208 = OpLoad %42 
                                       f32_2 %209 = OpVectorShuffle %208 %208 1 1 
                              Uniform f32_4* %211 = OpAccessChain %24 %210 %37 
                                       f32_4 %212 = OpLoad %211 
                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
                                       f32_2 %214 = OpFMul %209 %213 
                                                      OpStore %207 %214 
                              Uniform f32_4* %215 = OpAccessChain %24 %210 %36 
                                       f32_4 %216 = OpLoad %215 
                                       f32_2 %217 = OpVectorShuffle %216 %216 0 1 
                                       f32_4 %218 = OpLoad %42 
                                       f32_2 %219 = OpVectorShuffle %218 %218 0 0 
                                       f32_2 %220 = OpFMul %217 %219 
                                       f32_2 %221 = OpLoad %207 
                                       f32_2 %222 = OpFAdd %220 %221 
                                       f32_4 %223 = OpLoad %42 
                                       f32_4 %224 = OpVectorShuffle %223 %222 4 5 2 3 
                                                      OpStore %42 %224 
                                       f32_4 %227 = OpLoad %42 
                                       f32_2 %228 = OpVectorShuffle %227 %227 0 1 
                              Uniform f32_4* %229 = OpAccessChain %24 %210 %66 
                                       f32_4 %230 = OpLoad %229 
                                       f32_2 %231 = OpVectorShuffle %230 %230 0 1 
                                       f32_2 %232 = OpFAdd %228 %231 
                                                      OpStore vs_TEXCOORD1 %232 
                                       f32_2 %236 = OpLoad %235 
                                                      OpStore vs_TEXCOORD0 %236 
                                 Output f32* %237 = OpAccessChain %92 %36 %13 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFNegate %238 
                                 Output f32* %240 = OpAccessChain %92 %36 %13 
                                                      OpStore %240 %239 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 140
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %119 %128 %137 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %12 RelaxedPrecision 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate %13 RelaxedPrecision 
                                              OpDecorate %16 RelaxedPrecision 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate %17 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 22 
                                              OpDecorate %31 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %39 RelaxedPrecision 
                                              OpDecorate %40 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpDecorate %43 RelaxedPrecision 
                                              OpMemberDecorate %45 0 Offset 45 
                                              OpMemberDecorate %45 1 Offset 45 
                                              OpMemberDecorate %45 2 Offset 45 
                                              OpMemberDecorate %45 3 Offset 45 
                                              OpDecorate %45 Block 
                                              OpDecorate %47 DescriptorSet 47 
                                              OpDecorate %47 Binding 47 
                                              OpDecorate %64 RelaxedPrecision 
                                              OpDecorate %87 RelaxedPrecision 
                                              OpDecorate %88 RelaxedPrecision 
                                              OpDecorate %89 RelaxedPrecision 
                                              OpDecorate %90 RelaxedPrecision 
                                              OpDecorate %93 RelaxedPrecision 
                                              OpDecorate %94 RelaxedPrecision 
                                              OpDecorate %96 RelaxedPrecision 
                                              OpDecorate %97 RelaxedPrecision 
                                              OpDecorate %98 RelaxedPrecision 
                                              OpDecorate %99 RelaxedPrecision 
                                              OpDecorate %100 RelaxedPrecision 
                                              OpDecorate %101 RelaxedPrecision 
                                              OpDecorate %103 RelaxedPrecision 
                                              OpDecorate %104 RelaxedPrecision 
                                              OpDecorate %106 RelaxedPrecision 
                                              OpDecorate %108 RelaxedPrecision 
                                              OpDecorate %109 RelaxedPrecision 
                                              OpDecorate %110 RelaxedPrecision 
                                              OpDecorate %111 RelaxedPrecision 
                                              OpDecorate %112 RelaxedPrecision 
                                              OpDecorate %113 RelaxedPrecision 
                                              OpDecorate %114 RelaxedPrecision 
                                              OpDecorate %115 RelaxedPrecision 
                                              OpDecorate %116 RelaxedPrecision 
                                              OpDecorate %117 RelaxedPrecision 
                                              OpDecorate %119 RelaxedPrecision 
                                              OpDecorate %119 Location 119 
                                              OpDecorate %120 RelaxedPrecision 
                                              OpDecorate %121 RelaxedPrecision 
                                              OpDecorate %122 RelaxedPrecision 
                                              OpDecorate %123 RelaxedPrecision 
                                              OpDecorate %123 DescriptorSet 123 
                                              OpDecorate %123 Binding 123 
                                              OpDecorate %124 RelaxedPrecision 
                                              OpDecorate %125 RelaxedPrecision 
                                              OpDecorate %125 DescriptorSet 125 
                                              OpDecorate %125 Binding 125 
                                              OpDecorate %126 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Location 128 
                                              OpDecorate %131 RelaxedPrecision 
                                              OpDecorate %132 RelaxedPrecision 
                                              OpDecorate %133 RelaxedPrecision 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %135 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 Location 137 
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
                                  u32 %26 = OpConstant 3 
                                  u32 %28 = OpConstant 0 
                                      %29 = OpTypePointer Private %6 
                         Private f32* %31 = OpVariable Private 
                         Private f32* %35 = OpVariable Private 
                         Private f32* %44 = OpVariable Private 
                                      %45 = OpTypeStruct %6 %6 %6 %6 
                                      %46 = OpTypePointer Uniform %45 
Uniform struct {f32; f32; f32; f32;}* %47 = OpVariable Uniform 
                                      %48 = OpTypeInt 32 1 
                                  i32 %49 = OpConstant 3 
                                      %50 = OpTypePointer Uniform %6 
                                  f32 %54 = OpConstant 3.674022E-40 
                         Private f32* %56 = OpVariable Private 
                                  i32 %57 = OpConstant 1 
                                  i32 %60 = OpConstant 2 
                                  i32 %69 = OpConstant 0 
                                  f32 %77 = OpConstant 3.674022E-40 
                                 f32 %102 = OpConstant 3.674022E-40 
                                 f32 %105 = OpConstant 3.674022E-40 
                                 f32 %107 = OpConstant 3.674022E-40 
                      Private f32_4* %115 = OpVariable Private 
                                     %118 = OpTypePointer Input %7 
                        Input f32_4* %119 = OpVariable Input 
                        Private f32* %122 = OpVariable Private 
UniformConstant read_only Texture2D* %123 = OpVariable UniformConstant 
            UniformConstant sampler* %125 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %136 = OpTypePointer Output %7 
                       Output f32_4* %137 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                  f32 %27 = OpCompositeExtract %24 3 
                         Private f32* %30 = OpAccessChain %9 %28 
                                              OpStore %30 %27 
                         Private f32* %32 = OpAccessChain %9 %28 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpDPdx %33 
                                              OpStore %31 %34 
                         Private f32* %36 = OpAccessChain %9 %28 
                                  f32 %37 = OpLoad %36 
                                  f32 %38 = OpDPdy %37 
                                              OpStore %35 %38 
                                  f32 %39 = OpLoad %35 
                                  f32 %40 = OpExtInst %1 4 %39 
                                  f32 %41 = OpLoad %31 
                                  f32 %42 = OpExtInst %1 4 %41 
                                  f32 %43 = OpFAdd %40 %42 
                                              OpStore %31 %43 
                         Uniform f32* %51 = OpAccessChain %47 %49 
                                  f32 %52 = OpLoad %51 
                                  f32 %53 = OpFNegate %52 
                                  f32 %55 = OpFAdd %53 %54 
                                              OpStore %44 %55 
                         Uniform f32* %58 = OpAccessChain %47 %57 
                                  f32 %59 = OpLoad %58 
                         Uniform f32* %61 = OpAccessChain %47 %60 
                                  f32 %62 = OpLoad %61 
                                  f32 %63 = OpFMul %59 %62 
                                              OpStore %56 %63 
                                  f32 %64 = OpLoad %31 
                                  f32 %65 = OpLoad %44 
                                  f32 %66 = OpFMul %64 %65 
                                  f32 %67 = OpLoad %56 
                                  f32 %68 = OpFAdd %66 %67 
                                              OpStore %44 %68 
                         Uniform f32* %70 = OpAccessChain %47 %69 
                                  f32 %71 = OpLoad %70 
                         Uniform f32* %72 = OpAccessChain %47 %60 
                                  f32 %73 = OpLoad %72 
                                  f32 %74 = OpFMul %71 %73 
                                              OpStore %56 %74 
                                  f32 %75 = OpLoad %56 
                                  f32 %76 = OpFNegate %75 
                                  f32 %78 = OpFMul %76 %77 
                                  f32 %79 = OpFAdd %78 %77 
                                              OpStore %56 %79 
                                  f32 %80 = OpLoad %44 
                                  f32 %81 = OpLoad %56 
                                  f32 %82 = OpFAdd %80 %81 
                                              OpStore %31 %82 
                                  f32 %83 = OpLoad %44 
                                  f32 %84 = OpFNegate %83 
                                  f32 %85 = OpLoad %56 
                                  f32 %86 = OpFAdd %84 %85 
                                              OpStore %35 %86 
                                  f32 %87 = OpLoad %35 
                                  f32 %88 = OpFNegate %87 
                                  f32 %89 = OpLoad %31 
                                  f32 %90 = OpFAdd %88 %89 
                                              OpStore %31 %90 
                         Private f32* %91 = OpAccessChain %9 %28 
                                  f32 %92 = OpLoad %91 
                                  f32 %93 = OpLoad %35 
                                  f32 %94 = OpFNegate %93 
                                  f32 %95 = OpFAdd %92 %94 
                                              OpStore %35 %95 
                                  f32 %96 = OpLoad %31 
                                  f32 %97 = OpFDiv %54 %96 
                                              OpStore %31 %97 
                                  f32 %98 = OpLoad %31 
                                  f32 %99 = OpLoad %35 
                                 f32 %100 = OpFMul %98 %99 
                                              OpStore %31 %100 
                                 f32 %101 = OpLoad %31 
                                 f32 %103 = OpExtInst %1 43 %101 %102 %54 
                                              OpStore %31 %103 
                                 f32 %104 = OpLoad %31 
                                 f32 %106 = OpFMul %104 %105 
                                 f32 %108 = OpFAdd %106 %107 
                                              OpStore %35 %108 
                                 f32 %109 = OpLoad %31 
                                 f32 %110 = OpLoad %31 
                                 f32 %111 = OpFMul %109 %110 
                                              OpStore %31 %111 
                                 f32 %112 = OpLoad %31 
                                 f32 %113 = OpLoad %35 
                                 f32 %114 = OpFMul %112 %113 
                                              OpStore %31 %114 
                                 f32 %116 = OpLoad %31 
                               f32_4 %117 = OpCompositeConstruct %116 %116 %116 %116 
                               f32_4 %120 = OpLoad %119 
                               f32_4 %121 = OpFMul %117 %120 
                                              OpStore %115 %121 
                 read_only Texture2D %124 = OpLoad %123 
                             sampler %126 = OpLoad %125 
          read_only Texture2DSampled %127 = OpSampledImage %124 %126 
                               f32_2 %129 = OpLoad vs_TEXCOORD1 
                               f32_4 %130 = OpImageSampleImplicitLod %127 %129 
                                 f32 %131 = OpCompositeExtract %130 3 
                                              OpStore %122 %131 
                               f32_4 %132 = OpLoad %115 
                                 f32 %133 = OpLoad %122 
                               f32_4 %134 = OpCompositeConstruct %133 %133 %133 %133 
                               f32_4 %135 = OpFMul %132 %134 
                                              OpStore %9 %135 
                               f32_4 %138 = OpLoad %9 
                                              OpStore %137 %138 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 242
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %103 %108 %129 %226 %233 %235 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 RelaxedPrecision 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 RelaxedPrecision 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpMemberDecorate %22 7 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %103 Location 103 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %108 Location 108 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %111 RelaxedPrecision 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %126 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %129 RelaxedPrecision 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %133 RelaxedPrecision 
                                                      OpDecorate %134 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 226 
                                                      OpDecorate vs_TEXCOORD0 Location 233 
                                                      OpDecorate %235 Location 235 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 1 
                                              %14 = OpTypePointer Input %6 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeArray %7 %17 
                                              %22 = OpTypeStruct %18 %19 %20 %7 %7 %6 %6 %21 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32; f32_4[4];}* %24 = OpVariable Uniform 
                                              %25 = OpTypeInt 32 1 
                                          i32 %26 = OpConstant 6 
                                              %27 = OpTypePointer Uniform %6 
                                          u32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Private %6 
                                          i32 %36 = OpConstant 0 
                                          i32 %37 = OpConstant 1 
                                              %38 = OpTypePointer Uniform %7 
                               Private f32_4* %42 = OpVariable Private 
                                          i32 %45 = OpConstant 5 
                                          i32 %57 = OpConstant 2 
                                          i32 %66 = OpConstant 3 
                                              %89 = OpTypeArray %6 %13 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                             %100 = OpTypePointer Output %7 
                              Private f32_4* %102 = OpVariable Private 
                                Input f32_4* %103 = OpVariable Input 
                               Output f32_4* %108 = OpVariable Output 
                                             %109 = OpTypeVector %6 3 
                                         u32 %117 = OpConstant 3 
                                             %120 = OpTypePointer Output %6 
                                         i32 %124 = OpConstant 4 
                               Output f32_4* %129 = OpVariable Output 
                                             %164 = OpTypeVector %6 2 
                                             %206 = OpTypePointer Private %164 
                              Private f32_2* %207 = OpVariable Private 
                                         i32 %210 = OpConstant 7 
                                             %225 = OpTypePointer Output %164 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %234 = OpTypePointer Input %164 
                                Input f32_2* %235 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                   Input f32* %15 = OpAccessChain %11 %13 
                                          f32 %16 = OpLoad %15 
                                 Uniform f32* %28 = OpAccessChain %24 %26 
                                          f32 %29 = OpLoad %28 
                                          f32 %30 = OpFAdd %16 %29 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                                      OpStore %33 %30 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                               Uniform f32_4* %39 = OpAccessChain %24 %36 %37 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpFMul %35 %40 
                                                      OpStore %9 %41 
                                   Input f32* %43 = OpAccessChain %11 %31 
                                          f32 %44 = OpLoad %43 
                                 Uniform f32* %46 = OpAccessChain %24 %45 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %44 %47 
                                 Private f32* %49 = OpAccessChain %42 %31 
                                                      OpStore %49 %48 
                               Uniform f32_4* %50 = OpAccessChain %24 %36 %36 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %42 
                                        f32_4 %53 = OpVectorShuffle %52 %52 0 0 0 0 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                               Uniform f32_4* %58 = OpAccessChain %24 %36 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %11 
                                        f32_4 %61 = OpVectorShuffle %60 %60 2 2 2 2 
                                        f32_4 %62 = OpFMul %59 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpFAdd %62 %63 
                                                      OpStore %9 %64 
                                        f32_4 %65 = OpLoad %9 
                               Uniform f32_4* %67 = OpAccessChain %24 %36 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpFAdd %65 %68 
                                                      OpStore %9 %69 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 1 1 1 1 
                               Uniform f32_4* %72 = OpAccessChain %24 %57 %37 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpFMul %71 %73 
                                                      OpStore %42 %74 
                               Uniform f32_4* %75 = OpAccessChain %24 %57 %36 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 0 0 0 0 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %42 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %42 %81 
                               Uniform f32_4* %82 = OpAccessChain %24 %57 %57 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 2 2 2 2 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %42 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %42 %88 
                               Uniform f32_4* %93 = OpAccessChain %24 %57 %66 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpVectorShuffle %95 %95 3 3 3 3 
                                        f32_4 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %42 
                                        f32_4 %99 = OpFAdd %97 %98 
                               Output f32_4* %101 = OpAccessChain %92 %36 
                                                      OpStore %101 %99 
                                       f32_4 %104 = OpLoad %103 
                              Uniform f32_4* %105 = OpAccessChain %24 %66 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpFMul %104 %106 
                                                      OpStore %102 %107 
                                       f32_4 %110 = OpLoad %102 
                                       f32_3 %111 = OpVectorShuffle %110 %110 3 3 3 
                                       f32_4 %112 = OpLoad %102 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %108 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %108 %116 
                                Private f32* %118 = OpAccessChain %102 %117 
                                         f32 %119 = OpLoad %118 
                                 Output f32* %121 = OpAccessChain %108 %117 
                                                      OpStore %121 %119 
                                  Input f32* %122 = OpAccessChain %103 %117 
                                         f32 %123 = OpLoad %122 
                                Uniform f32* %125 = OpAccessChain %24 %124 %117 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFMul %123 %126 
                                Private f32* %128 = OpAccessChain %42 %31 
                                                      OpStore %128 %127 
                                       f32_4 %130 = OpLoad %42 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 0 0 
                              Uniform f32_4* %132 = OpAccessChain %24 %124 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFMul %131 %134 
                                       f32_4 %136 = OpLoad %129 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %129 %137 
                                Private f32* %138 = OpAccessChain %42 %31 
                                         f32 %139 = OpLoad %138 
                                 Output f32* %140 = OpAccessChain %129 %117 
                                                      OpStore %140 %139 
                                       f32_4 %141 = OpLoad %11 
                                       f32_4 %142 = OpVectorShuffle %141 %141 1 1 1 1 
                              Uniform f32_4* %143 = OpAccessChain %24 %36 %37 
                                       f32_4 %144 = OpLoad %143 
                                       f32_4 %145 = OpFMul %142 %144 
                                                      OpStore %9 %145 
                              Uniform f32_4* %146 = OpAccessChain %24 %36 %36 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpLoad %11 
                                       f32_4 %149 = OpVectorShuffle %148 %148 0 0 0 0 
                                       f32_4 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_4 %152 = OpFAdd %150 %151 
                                                      OpStore %9 %152 
                              Uniform f32_4* %153 = OpAccessChain %24 %36 %57 
                                       f32_4 %154 = OpLoad %153 
                                       f32_4 %155 = OpLoad %11 
                                       f32_4 %156 = OpVectorShuffle %155 %155 2 2 2 2 
                                       f32_4 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %9 
                                       f32_4 %159 = OpFAdd %157 %158 
                                                      OpStore %9 %159 
                                       f32_4 %160 = OpLoad %9 
                              Uniform f32_4* %161 = OpAccessChain %24 %36 %66 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %160 %162 
                                                      OpStore %9 %163 
                                       f32_4 %165 = OpLoad %9 
                                       f32_2 %166 = OpVectorShuffle %165 %165 1 1 
                              Uniform f32_4* %167 = OpAccessChain %24 %37 %37 
                                       f32_4 %168 = OpLoad %167 
                                       f32_2 %169 = OpVectorShuffle %168 %168 0 1 
                                       f32_2 %170 = OpFMul %166 %169 
                                       f32_4 %171 = OpLoad %42 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 2 3 
                                                      OpStore %42 %172 
                              Uniform f32_4* %173 = OpAccessChain %24 %37 %36 
                                       f32_4 %174 = OpLoad %173 
                                       f32_2 %175 = OpVectorShuffle %174 %174 0 1 
                                       f32_4 %176 = OpLoad %9 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 0 
                                       f32_2 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %42 
                                       f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                                       f32_2 %181 = OpFAdd %178 %180 
                                       f32_4 %182 = OpLoad %42 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 2 3 
                                                      OpStore %42 %183 
                              Uniform f32_4* %184 = OpAccessChain %24 %37 %57 
                                       f32_4 %185 = OpLoad %184 
                                       f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                                       f32_4 %187 = OpLoad %9 
                                       f32_2 %188 = OpVectorShuffle %187 %187 2 2 
                                       f32_2 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %42 
                                       f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                                       f32_2 %192 = OpFAdd %189 %191 
                                       f32_4 %193 = OpLoad %42 
                                       f32_4 %194 = OpVectorShuffle %193 %192 4 5 2 3 
                                                      OpStore %42 %194 
                              Uniform f32_4* %195 = OpAccessChain %24 %37 %66 
                                       f32_4 %196 = OpLoad %195 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_4 %198 = OpLoad %9 
                                       f32_2 %199 = OpVectorShuffle %198 %198 3 3 
                                       f32_2 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %42 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_2 %203 = OpFAdd %200 %202 
                                       f32_4 %204 = OpLoad %42 
                                       f32_4 %205 = OpVectorShuffle %204 %203 4 5 2 3 
                                                      OpStore %42 %205 
                                       f32_4 %208 = OpLoad %42 
                                       f32_2 %209 = OpVectorShuffle %208 %208 1 1 
                              Uniform f32_4* %211 = OpAccessChain %24 %210 %37 
                                       f32_4 %212 = OpLoad %211 
                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
                                       f32_2 %214 = OpFMul %209 %213 
                                                      OpStore %207 %214 
                              Uniform f32_4* %215 = OpAccessChain %24 %210 %36 
                                       f32_4 %216 = OpLoad %215 
                                       f32_2 %217 = OpVectorShuffle %216 %216 0 1 
                                       f32_4 %218 = OpLoad %42 
                                       f32_2 %219 = OpVectorShuffle %218 %218 0 0 
                                       f32_2 %220 = OpFMul %217 %219 
                                       f32_2 %221 = OpLoad %207 
                                       f32_2 %222 = OpFAdd %220 %221 
                                       f32_4 %223 = OpLoad %42 
                                       f32_4 %224 = OpVectorShuffle %223 %222 4 5 2 3 
                                                      OpStore %42 %224 
                                       f32_4 %227 = OpLoad %42 
                                       f32_2 %228 = OpVectorShuffle %227 %227 0 1 
                              Uniform f32_4* %229 = OpAccessChain %24 %210 %66 
                                       f32_4 %230 = OpLoad %229 
                                       f32_2 %231 = OpVectorShuffle %230 %230 0 1 
                                       f32_2 %232 = OpFAdd %228 %231 
                                                      OpStore vs_TEXCOORD1 %232 
                                       f32_2 %236 = OpLoad %235 
                                                      OpStore vs_TEXCOORD0 %236 
                                 Output f32* %237 = OpAccessChain %92 %36 %13 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFNegate %238 
                                 Output f32* %240 = OpAccessChain %92 %36 %13 
                                                      OpStore %240 %239 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 140
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %119 %128 %137 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %12 RelaxedPrecision 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate %13 RelaxedPrecision 
                                              OpDecorate %16 RelaxedPrecision 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate %17 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 22 
                                              OpDecorate %31 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %39 RelaxedPrecision 
                                              OpDecorate %40 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpDecorate %43 RelaxedPrecision 
                                              OpMemberDecorate %45 0 Offset 45 
                                              OpMemberDecorate %45 1 Offset 45 
                                              OpMemberDecorate %45 2 Offset 45 
                                              OpMemberDecorate %45 3 Offset 45 
                                              OpDecorate %45 Block 
                                              OpDecorate %47 DescriptorSet 47 
                                              OpDecorate %47 Binding 47 
                                              OpDecorate %64 RelaxedPrecision 
                                              OpDecorate %87 RelaxedPrecision 
                                              OpDecorate %88 RelaxedPrecision 
                                              OpDecorate %89 RelaxedPrecision 
                                              OpDecorate %90 RelaxedPrecision 
                                              OpDecorate %93 RelaxedPrecision 
                                              OpDecorate %94 RelaxedPrecision 
                                              OpDecorate %96 RelaxedPrecision 
                                              OpDecorate %97 RelaxedPrecision 
                                              OpDecorate %98 RelaxedPrecision 
                                              OpDecorate %99 RelaxedPrecision 
                                              OpDecorate %100 RelaxedPrecision 
                                              OpDecorate %101 RelaxedPrecision 
                                              OpDecorate %103 RelaxedPrecision 
                                              OpDecorate %104 RelaxedPrecision 
                                              OpDecorate %106 RelaxedPrecision 
                                              OpDecorate %108 RelaxedPrecision 
                                              OpDecorate %109 RelaxedPrecision 
                                              OpDecorate %110 RelaxedPrecision 
                                              OpDecorate %111 RelaxedPrecision 
                                              OpDecorate %112 RelaxedPrecision 
                                              OpDecorate %113 RelaxedPrecision 
                                              OpDecorate %114 RelaxedPrecision 
                                              OpDecorate %115 RelaxedPrecision 
                                              OpDecorate %116 RelaxedPrecision 
                                              OpDecorate %117 RelaxedPrecision 
                                              OpDecorate %119 RelaxedPrecision 
                                              OpDecorate %119 Location 119 
                                              OpDecorate %120 RelaxedPrecision 
                                              OpDecorate %121 RelaxedPrecision 
                                              OpDecorate %122 RelaxedPrecision 
                                              OpDecorate %123 RelaxedPrecision 
                                              OpDecorate %123 DescriptorSet 123 
                                              OpDecorate %123 Binding 123 
                                              OpDecorate %124 RelaxedPrecision 
                                              OpDecorate %125 RelaxedPrecision 
                                              OpDecorate %125 DescriptorSet 125 
                                              OpDecorate %125 Binding 125 
                                              OpDecorate %126 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Location 128 
                                              OpDecorate %131 RelaxedPrecision 
                                              OpDecorate %132 RelaxedPrecision 
                                              OpDecorate %133 RelaxedPrecision 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %135 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 Location 137 
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
                                  u32 %26 = OpConstant 3 
                                  u32 %28 = OpConstant 0 
                                      %29 = OpTypePointer Private %6 
                         Private f32* %31 = OpVariable Private 
                         Private f32* %35 = OpVariable Private 
                         Private f32* %44 = OpVariable Private 
                                      %45 = OpTypeStruct %6 %6 %6 %6 
                                      %46 = OpTypePointer Uniform %45 
Uniform struct {f32; f32; f32; f32;}* %47 = OpVariable Uniform 
                                      %48 = OpTypeInt 32 1 
                                  i32 %49 = OpConstant 3 
                                      %50 = OpTypePointer Uniform %6 
                                  f32 %54 = OpConstant 3.674022E-40 
                         Private f32* %56 = OpVariable Private 
                                  i32 %57 = OpConstant 1 
                                  i32 %60 = OpConstant 2 
                                  i32 %69 = OpConstant 0 
                                  f32 %77 = OpConstant 3.674022E-40 
                                 f32 %102 = OpConstant 3.674022E-40 
                                 f32 %105 = OpConstant 3.674022E-40 
                                 f32 %107 = OpConstant 3.674022E-40 
                      Private f32_4* %115 = OpVariable Private 
                                     %118 = OpTypePointer Input %7 
                        Input f32_4* %119 = OpVariable Input 
                        Private f32* %122 = OpVariable Private 
UniformConstant read_only Texture2D* %123 = OpVariable UniformConstant 
            UniformConstant sampler* %125 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %136 = OpTypePointer Output %7 
                       Output f32_4* %137 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                  f32 %27 = OpCompositeExtract %24 3 
                         Private f32* %30 = OpAccessChain %9 %28 
                                              OpStore %30 %27 
                         Private f32* %32 = OpAccessChain %9 %28 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpDPdx %33 
                                              OpStore %31 %34 
                         Private f32* %36 = OpAccessChain %9 %28 
                                  f32 %37 = OpLoad %36 
                                  f32 %38 = OpDPdy %37 
                                              OpStore %35 %38 
                                  f32 %39 = OpLoad %35 
                                  f32 %40 = OpExtInst %1 4 %39 
                                  f32 %41 = OpLoad %31 
                                  f32 %42 = OpExtInst %1 4 %41 
                                  f32 %43 = OpFAdd %40 %42 
                                              OpStore %31 %43 
                         Uniform f32* %51 = OpAccessChain %47 %49 
                                  f32 %52 = OpLoad %51 
                                  f32 %53 = OpFNegate %52 
                                  f32 %55 = OpFAdd %53 %54 
                                              OpStore %44 %55 
                         Uniform f32* %58 = OpAccessChain %47 %57 
                                  f32 %59 = OpLoad %58 
                         Uniform f32* %61 = OpAccessChain %47 %60 
                                  f32 %62 = OpLoad %61 
                                  f32 %63 = OpFMul %59 %62 
                                              OpStore %56 %63 
                                  f32 %64 = OpLoad %31 
                                  f32 %65 = OpLoad %44 
                                  f32 %66 = OpFMul %64 %65 
                                  f32 %67 = OpLoad %56 
                                  f32 %68 = OpFAdd %66 %67 
                                              OpStore %44 %68 
                         Uniform f32* %70 = OpAccessChain %47 %69 
                                  f32 %71 = OpLoad %70 
                         Uniform f32* %72 = OpAccessChain %47 %60 
                                  f32 %73 = OpLoad %72 
                                  f32 %74 = OpFMul %71 %73 
                                              OpStore %56 %74 
                                  f32 %75 = OpLoad %56 
                                  f32 %76 = OpFNegate %75 
                                  f32 %78 = OpFMul %76 %77 
                                  f32 %79 = OpFAdd %78 %77 
                                              OpStore %56 %79 
                                  f32 %80 = OpLoad %44 
                                  f32 %81 = OpLoad %56 
                                  f32 %82 = OpFAdd %80 %81 
                                              OpStore %31 %82 
                                  f32 %83 = OpLoad %44 
                                  f32 %84 = OpFNegate %83 
                                  f32 %85 = OpLoad %56 
                                  f32 %86 = OpFAdd %84 %85 
                                              OpStore %35 %86 
                                  f32 %87 = OpLoad %35 
                                  f32 %88 = OpFNegate %87 
                                  f32 %89 = OpLoad %31 
                                  f32 %90 = OpFAdd %88 %89 
                                              OpStore %31 %90 
                         Private f32* %91 = OpAccessChain %9 %28 
                                  f32 %92 = OpLoad %91 
                                  f32 %93 = OpLoad %35 
                                  f32 %94 = OpFNegate %93 
                                  f32 %95 = OpFAdd %92 %94 
                                              OpStore %35 %95 
                                  f32 %96 = OpLoad %31 
                                  f32 %97 = OpFDiv %54 %96 
                                              OpStore %31 %97 
                                  f32 %98 = OpLoad %31 
                                  f32 %99 = OpLoad %35 
                                 f32 %100 = OpFMul %98 %99 
                                              OpStore %31 %100 
                                 f32 %101 = OpLoad %31 
                                 f32 %103 = OpExtInst %1 43 %101 %102 %54 
                                              OpStore %31 %103 
                                 f32 %104 = OpLoad %31 
                                 f32 %106 = OpFMul %104 %105 
                                 f32 %108 = OpFAdd %106 %107 
                                              OpStore %35 %108 
                                 f32 %109 = OpLoad %31 
                                 f32 %110 = OpLoad %31 
                                 f32 %111 = OpFMul %109 %110 
                                              OpStore %31 %111 
                                 f32 %112 = OpLoad %31 
                                 f32 %113 = OpLoad %35 
                                 f32 %114 = OpFMul %112 %113 
                                              OpStore %31 %114 
                                 f32 %116 = OpLoad %31 
                               f32_4 %117 = OpCompositeConstruct %116 %116 %116 %116 
                               f32_4 %120 = OpLoad %119 
                               f32_4 %121 = OpFMul %117 %120 
                                              OpStore %115 %121 
                 read_only Texture2D %124 = OpLoad %123 
                             sampler %126 = OpLoad %125 
          read_only Texture2DSampled %127 = OpSampledImage %124 %126 
                               f32_2 %129 = OpLoad vs_TEXCOORD1 
                               f32_4 %130 = OpImageSampleImplicitLod %127 %129 
                                 f32 %131 = OpCompositeExtract %130 3 
                                              OpStore %122 %131 
                               f32_4 %132 = OpLoad %115 
                                 f32 %133 = OpLoad %122 
                               f32_4 %134 = OpCompositeConstruct %133 %133 %133 %133 
                               f32_4 %135 = OpFMul %132 %134 
                                              OpStore %9 %135 
                               f32_4 %138 = OpLoad %9 
                                              OpStore %137 %138 
                                              OpReturn
                                              OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 242
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %92 %103 %108 %129 %226 %233 %235 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpDecorate %20 ArrayStride 20 
                                                      OpDecorate %21 ArrayStride 21 
                                                      OpMemberDecorate %22 0 Offset 22 
                                                      OpMemberDecorate %22 1 Offset 22 
                                                      OpMemberDecorate %22 2 Offset 22 
                                                      OpMemberDecorate %22 3 RelaxedPrecision 
                                                      OpMemberDecorate %22 3 Offset 22 
                                                      OpMemberDecorate %22 4 RelaxedPrecision 
                                                      OpMemberDecorate %22 4 Offset 22 
                                                      OpMemberDecorate %22 5 Offset 22 
                                                      OpMemberDecorate %22 6 Offset 22 
                                                      OpMemberDecorate %22 7 Offset 22 
                                                      OpDecorate %22 Block 
                                                      OpDecorate %24 DescriptorSet 24 
                                                      OpDecorate %24 Binding 24 
                                                      OpMemberDecorate %90 0 BuiltIn 90 
                                                      OpMemberDecorate %90 1 BuiltIn 90 
                                                      OpMemberDecorate %90 2 BuiltIn 90 
                                                      OpDecorate %90 Block 
                                                      OpDecorate %102 RelaxedPrecision 
                                                      OpDecorate %103 RelaxedPrecision 
                                                      OpDecorate %103 Location 103 
                                                      OpDecorate %104 RelaxedPrecision 
                                                      OpDecorate %106 RelaxedPrecision 
                                                      OpDecorate %107 RelaxedPrecision 
                                                      OpDecorate %108 RelaxedPrecision 
                                                      OpDecorate %108 Location 108 
                                                      OpDecorate %110 RelaxedPrecision 
                                                      OpDecorate %111 RelaxedPrecision 
                                                      OpDecorate %112 RelaxedPrecision 
                                                      OpDecorate %113 RelaxedPrecision 
                                                      OpDecorate %114 RelaxedPrecision 
                                                      OpDecorate %119 RelaxedPrecision 
                                                      OpDecorate %123 RelaxedPrecision 
                                                      OpDecorate %126 RelaxedPrecision 
                                                      OpDecorate %127 RelaxedPrecision 
                                                      OpDecorate %129 RelaxedPrecision 
                                                      OpDecorate %129 Location 129 
                                                      OpDecorate %133 RelaxedPrecision 
                                                      OpDecorate %134 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 226 
                                                      OpDecorate vs_TEXCOORD0 Location 233 
                                                      OpDecorate %235 Location 235 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 1 
                                              %14 = OpTypePointer Input %6 
                                          u32 %17 = OpConstant 4 
                                              %18 = OpTypeArray %7 %17 
                                              %19 = OpTypeArray %7 %17 
                                              %20 = OpTypeArray %7 %17 
                                              %21 = OpTypeArray %7 %17 
                                              %22 = OpTypeStruct %18 %19 %20 %7 %7 %6 %6 %21 
                                              %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4; f32; f32; f32_4[4];}* %24 = OpVariable Uniform 
                                              %25 = OpTypeInt 32 1 
                                          i32 %26 = OpConstant 6 
                                              %27 = OpTypePointer Uniform %6 
                                          u32 %31 = OpConstant 0 
                                              %32 = OpTypePointer Private %6 
                                          i32 %36 = OpConstant 0 
                                          i32 %37 = OpConstant 1 
                                              %38 = OpTypePointer Uniform %7 
                               Private f32_4* %42 = OpVariable Private 
                                          i32 %45 = OpConstant 5 
                                          i32 %57 = OpConstant 2 
                                          i32 %66 = OpConstant 3 
                                              %89 = OpTypeArray %6 %13 
                                              %90 = OpTypeStruct %7 %6 %89 
                                              %91 = OpTypePointer Output %90 
         Output struct {f32_4; f32; f32[1];}* %92 = OpVariable Output 
                                             %100 = OpTypePointer Output %7 
                              Private f32_4* %102 = OpVariable Private 
                                Input f32_4* %103 = OpVariable Input 
                               Output f32_4* %108 = OpVariable Output 
                                             %109 = OpTypeVector %6 3 
                                         u32 %117 = OpConstant 3 
                                             %120 = OpTypePointer Output %6 
                                         i32 %124 = OpConstant 4 
                               Output f32_4* %129 = OpVariable Output 
                                             %164 = OpTypeVector %6 2 
                                             %206 = OpTypePointer Private %164 
                              Private f32_2* %207 = OpVariable Private 
                                         i32 %210 = OpConstant 7 
                                             %225 = OpTypePointer Output %164 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %234 = OpTypePointer Input %164 
                                Input f32_2* %235 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                   Input f32* %15 = OpAccessChain %11 %13 
                                          f32 %16 = OpLoad %15 
                                 Uniform f32* %28 = OpAccessChain %24 %26 
                                          f32 %29 = OpLoad %28 
                                          f32 %30 = OpFAdd %16 %29 
                                 Private f32* %33 = OpAccessChain %9 %31 
                                                      OpStore %33 %30 
                                        f32_4 %34 = OpLoad %9 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 0 0 0 
                               Uniform f32_4* %39 = OpAccessChain %24 %36 %37 
                                        f32_4 %40 = OpLoad %39 
                                        f32_4 %41 = OpFMul %35 %40 
                                                      OpStore %9 %41 
                                   Input f32* %43 = OpAccessChain %11 %31 
                                          f32 %44 = OpLoad %43 
                                 Uniform f32* %46 = OpAccessChain %24 %45 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFAdd %44 %47 
                                 Private f32* %49 = OpAccessChain %42 %31 
                                                      OpStore %49 %48 
                               Uniform f32_4* %50 = OpAccessChain %24 %36 %36 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpLoad %42 
                                        f32_4 %53 = OpVectorShuffle %52 %52 0 0 0 0 
                                        f32_4 %54 = OpFMul %51 %53 
                                        f32_4 %55 = OpLoad %9 
                                        f32_4 %56 = OpFAdd %54 %55 
                                                      OpStore %9 %56 
                               Uniform f32_4* %58 = OpAccessChain %24 %36 %57 
                                        f32_4 %59 = OpLoad %58 
                                        f32_4 %60 = OpLoad %11 
                                        f32_4 %61 = OpVectorShuffle %60 %60 2 2 2 2 
                                        f32_4 %62 = OpFMul %59 %61 
                                        f32_4 %63 = OpLoad %9 
                                        f32_4 %64 = OpFAdd %62 %63 
                                                      OpStore %9 %64 
                                        f32_4 %65 = OpLoad %9 
                               Uniform f32_4* %67 = OpAccessChain %24 %36 %66 
                                        f32_4 %68 = OpLoad %67 
                                        f32_4 %69 = OpFAdd %65 %68 
                                                      OpStore %9 %69 
                                        f32_4 %70 = OpLoad %9 
                                        f32_4 %71 = OpVectorShuffle %70 %70 1 1 1 1 
                               Uniform f32_4* %72 = OpAccessChain %24 %57 %37 
                                        f32_4 %73 = OpLoad %72 
                                        f32_4 %74 = OpFMul %71 %73 
                                                      OpStore %42 %74 
                               Uniform f32_4* %75 = OpAccessChain %24 %57 %36 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 0 0 0 0 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %42 
                                        f32_4 %81 = OpFAdd %79 %80 
                                                      OpStore %42 %81 
                               Uniform f32_4* %82 = OpAccessChain %24 %57 %57 
                                        f32_4 %83 = OpLoad %82 
                                        f32_4 %84 = OpLoad %9 
                                        f32_4 %85 = OpVectorShuffle %84 %84 2 2 2 2 
                                        f32_4 %86 = OpFMul %83 %85 
                                        f32_4 %87 = OpLoad %42 
                                        f32_4 %88 = OpFAdd %86 %87 
                                                      OpStore %42 %88 
                               Uniform f32_4* %93 = OpAccessChain %24 %57 %66 
                                        f32_4 %94 = OpLoad %93 
                                        f32_4 %95 = OpLoad %9 
                                        f32_4 %96 = OpVectorShuffle %95 %95 3 3 3 3 
                                        f32_4 %97 = OpFMul %94 %96 
                                        f32_4 %98 = OpLoad %42 
                                        f32_4 %99 = OpFAdd %97 %98 
                               Output f32_4* %101 = OpAccessChain %92 %36 
                                                      OpStore %101 %99 
                                       f32_4 %104 = OpLoad %103 
                              Uniform f32_4* %105 = OpAccessChain %24 %66 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpFMul %104 %106 
                                                      OpStore %102 %107 
                                       f32_4 %110 = OpLoad %102 
                                       f32_3 %111 = OpVectorShuffle %110 %110 3 3 3 
                                       f32_4 %112 = OpLoad %102 
                                       f32_3 %113 = OpVectorShuffle %112 %112 0 1 2 
                                       f32_3 %114 = OpFMul %111 %113 
                                       f32_4 %115 = OpLoad %108 
                                       f32_4 %116 = OpVectorShuffle %115 %114 4 5 6 3 
                                                      OpStore %108 %116 
                                Private f32* %118 = OpAccessChain %102 %117 
                                         f32 %119 = OpLoad %118 
                                 Output f32* %121 = OpAccessChain %108 %117 
                                                      OpStore %121 %119 
                                  Input f32* %122 = OpAccessChain %103 %117 
                                         f32 %123 = OpLoad %122 
                                Uniform f32* %125 = OpAccessChain %24 %124 %117 
                                         f32 %126 = OpLoad %125 
                                         f32 %127 = OpFMul %123 %126 
                                Private f32* %128 = OpAccessChain %42 %31 
                                                      OpStore %128 %127 
                                       f32_4 %130 = OpLoad %42 
                                       f32_3 %131 = OpVectorShuffle %130 %130 0 0 0 
                              Uniform f32_4* %132 = OpAccessChain %24 %124 
                                       f32_4 %133 = OpLoad %132 
                                       f32_3 %134 = OpVectorShuffle %133 %133 0 1 2 
                                       f32_3 %135 = OpFMul %131 %134 
                                       f32_4 %136 = OpLoad %129 
                                       f32_4 %137 = OpVectorShuffle %136 %135 4 5 6 3 
                                                      OpStore %129 %137 
                                Private f32* %138 = OpAccessChain %42 %31 
                                         f32 %139 = OpLoad %138 
                                 Output f32* %140 = OpAccessChain %129 %117 
                                                      OpStore %140 %139 
                                       f32_4 %141 = OpLoad %11 
                                       f32_4 %142 = OpVectorShuffle %141 %141 1 1 1 1 
                              Uniform f32_4* %143 = OpAccessChain %24 %36 %37 
                                       f32_4 %144 = OpLoad %143 
                                       f32_4 %145 = OpFMul %142 %144 
                                                      OpStore %9 %145 
                              Uniform f32_4* %146 = OpAccessChain %24 %36 %36 
                                       f32_4 %147 = OpLoad %146 
                                       f32_4 %148 = OpLoad %11 
                                       f32_4 %149 = OpVectorShuffle %148 %148 0 0 0 0 
                                       f32_4 %150 = OpFMul %147 %149 
                                       f32_4 %151 = OpLoad %9 
                                       f32_4 %152 = OpFAdd %150 %151 
                                                      OpStore %9 %152 
                              Uniform f32_4* %153 = OpAccessChain %24 %36 %57 
                                       f32_4 %154 = OpLoad %153 
                                       f32_4 %155 = OpLoad %11 
                                       f32_4 %156 = OpVectorShuffle %155 %155 2 2 2 2 
                                       f32_4 %157 = OpFMul %154 %156 
                                       f32_4 %158 = OpLoad %9 
                                       f32_4 %159 = OpFAdd %157 %158 
                                                      OpStore %9 %159 
                                       f32_4 %160 = OpLoad %9 
                              Uniform f32_4* %161 = OpAccessChain %24 %36 %66 
                                       f32_4 %162 = OpLoad %161 
                                       f32_4 %163 = OpFAdd %160 %162 
                                                      OpStore %9 %163 
                                       f32_4 %165 = OpLoad %9 
                                       f32_2 %166 = OpVectorShuffle %165 %165 1 1 
                              Uniform f32_4* %167 = OpAccessChain %24 %37 %37 
                                       f32_4 %168 = OpLoad %167 
                                       f32_2 %169 = OpVectorShuffle %168 %168 0 1 
                                       f32_2 %170 = OpFMul %166 %169 
                                       f32_4 %171 = OpLoad %42 
                                       f32_4 %172 = OpVectorShuffle %171 %170 4 5 2 3 
                                                      OpStore %42 %172 
                              Uniform f32_4* %173 = OpAccessChain %24 %37 %36 
                                       f32_4 %174 = OpLoad %173 
                                       f32_2 %175 = OpVectorShuffle %174 %174 0 1 
                                       f32_4 %176 = OpLoad %9 
                                       f32_2 %177 = OpVectorShuffle %176 %176 0 0 
                                       f32_2 %178 = OpFMul %175 %177 
                                       f32_4 %179 = OpLoad %42 
                                       f32_2 %180 = OpVectorShuffle %179 %179 0 1 
                                       f32_2 %181 = OpFAdd %178 %180 
                                       f32_4 %182 = OpLoad %42 
                                       f32_4 %183 = OpVectorShuffle %182 %181 4 5 2 3 
                                                      OpStore %42 %183 
                              Uniform f32_4* %184 = OpAccessChain %24 %37 %57 
                                       f32_4 %185 = OpLoad %184 
                                       f32_2 %186 = OpVectorShuffle %185 %185 0 1 
                                       f32_4 %187 = OpLoad %9 
                                       f32_2 %188 = OpVectorShuffle %187 %187 2 2 
                                       f32_2 %189 = OpFMul %186 %188 
                                       f32_4 %190 = OpLoad %42 
                                       f32_2 %191 = OpVectorShuffle %190 %190 0 1 
                                       f32_2 %192 = OpFAdd %189 %191 
                                       f32_4 %193 = OpLoad %42 
                                       f32_4 %194 = OpVectorShuffle %193 %192 4 5 2 3 
                                                      OpStore %42 %194 
                              Uniform f32_4* %195 = OpAccessChain %24 %37 %66 
                                       f32_4 %196 = OpLoad %195 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_4 %198 = OpLoad %9 
                                       f32_2 %199 = OpVectorShuffle %198 %198 3 3 
                                       f32_2 %200 = OpFMul %197 %199 
                                       f32_4 %201 = OpLoad %42 
                                       f32_2 %202 = OpVectorShuffle %201 %201 0 1 
                                       f32_2 %203 = OpFAdd %200 %202 
                                       f32_4 %204 = OpLoad %42 
                                       f32_4 %205 = OpVectorShuffle %204 %203 4 5 2 3 
                                                      OpStore %42 %205 
                                       f32_4 %208 = OpLoad %42 
                                       f32_2 %209 = OpVectorShuffle %208 %208 1 1 
                              Uniform f32_4* %211 = OpAccessChain %24 %210 %37 
                                       f32_4 %212 = OpLoad %211 
                                       f32_2 %213 = OpVectorShuffle %212 %212 0 1 
                                       f32_2 %214 = OpFMul %209 %213 
                                                      OpStore %207 %214 
                              Uniform f32_4* %215 = OpAccessChain %24 %210 %36 
                                       f32_4 %216 = OpLoad %215 
                                       f32_2 %217 = OpVectorShuffle %216 %216 0 1 
                                       f32_4 %218 = OpLoad %42 
                                       f32_2 %219 = OpVectorShuffle %218 %218 0 0 
                                       f32_2 %220 = OpFMul %217 %219 
                                       f32_2 %221 = OpLoad %207 
                                       f32_2 %222 = OpFAdd %220 %221 
                                       f32_4 %223 = OpLoad %42 
                                       f32_4 %224 = OpVectorShuffle %223 %222 4 5 2 3 
                                                      OpStore %42 %224 
                                       f32_4 %227 = OpLoad %42 
                                       f32_2 %228 = OpVectorShuffle %227 %227 0 1 
                              Uniform f32_4* %229 = OpAccessChain %24 %210 %66 
                                       f32_4 %230 = OpLoad %229 
                                       f32_2 %231 = OpVectorShuffle %230 %230 0 1 
                                       f32_2 %232 = OpFAdd %228 %231 
                                                      OpStore vs_TEXCOORD1 %232 
                                       f32_2 %236 = OpLoad %235 
                                                      OpStore vs_TEXCOORD0 %236 
                                 Output f32* %237 = OpAccessChain %92 %36 %13 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFNegate %238 
                                 Output f32* %240 = OpAccessChain %92 %36 %13 
                                                      OpStore %240 %239 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 140
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Fragment %4 "main" %22 %119 %128 %137 
                                              OpExecutionMode %4 OriginUpperLeft 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                              OpDecorate %12 RelaxedPrecision 
                                              OpDecorate %12 DescriptorSet 12 
                                              OpDecorate %12 Binding 12 
                                              OpDecorate %13 RelaxedPrecision 
                                              OpDecorate %16 RelaxedPrecision 
                                              OpDecorate %16 DescriptorSet 16 
                                              OpDecorate %16 Binding 16 
                                              OpDecorate %17 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD0 Location 22 
                                              OpDecorate %31 RelaxedPrecision 
                                              OpDecorate %35 RelaxedPrecision 
                                              OpDecorate %39 RelaxedPrecision 
                                              OpDecorate %40 RelaxedPrecision 
                                              OpDecorate %41 RelaxedPrecision 
                                              OpDecorate %42 RelaxedPrecision 
                                              OpDecorate %43 RelaxedPrecision 
                                              OpMemberDecorate %45 0 Offset 45 
                                              OpMemberDecorate %45 1 Offset 45 
                                              OpMemberDecorate %45 2 Offset 45 
                                              OpMemberDecorate %45 3 Offset 45 
                                              OpDecorate %45 Block 
                                              OpDecorate %47 DescriptorSet 47 
                                              OpDecorate %47 Binding 47 
                                              OpDecorate %64 RelaxedPrecision 
                                              OpDecorate %87 RelaxedPrecision 
                                              OpDecorate %88 RelaxedPrecision 
                                              OpDecorate %89 RelaxedPrecision 
                                              OpDecorate %90 RelaxedPrecision 
                                              OpDecorate %93 RelaxedPrecision 
                                              OpDecorate %94 RelaxedPrecision 
                                              OpDecorate %96 RelaxedPrecision 
                                              OpDecorate %97 RelaxedPrecision 
                                              OpDecorate %98 RelaxedPrecision 
                                              OpDecorate %99 RelaxedPrecision 
                                              OpDecorate %100 RelaxedPrecision 
                                              OpDecorate %101 RelaxedPrecision 
                                              OpDecorate %103 RelaxedPrecision 
                                              OpDecorate %104 RelaxedPrecision 
                                              OpDecorate %106 RelaxedPrecision 
                                              OpDecorate %108 RelaxedPrecision 
                                              OpDecorate %109 RelaxedPrecision 
                                              OpDecorate %110 RelaxedPrecision 
                                              OpDecorate %111 RelaxedPrecision 
                                              OpDecorate %112 RelaxedPrecision 
                                              OpDecorate %113 RelaxedPrecision 
                                              OpDecorate %114 RelaxedPrecision 
                                              OpDecorate %115 RelaxedPrecision 
                                              OpDecorate %116 RelaxedPrecision 
                                              OpDecorate %117 RelaxedPrecision 
                                              OpDecorate %119 RelaxedPrecision 
                                              OpDecorate %119 Location 119 
                                              OpDecorate %120 RelaxedPrecision 
                                              OpDecorate %121 RelaxedPrecision 
                                              OpDecorate %122 RelaxedPrecision 
                                              OpDecorate %123 RelaxedPrecision 
                                              OpDecorate %123 DescriptorSet 123 
                                              OpDecorate %123 Binding 123 
                                              OpDecorate %124 RelaxedPrecision 
                                              OpDecorate %125 RelaxedPrecision 
                                              OpDecorate %125 DescriptorSet 125 
                                              OpDecorate %125 Binding 125 
                                              OpDecorate %126 RelaxedPrecision 
                                              OpDecorate vs_TEXCOORD1 Location 128 
                                              OpDecorate %131 RelaxedPrecision 
                                              OpDecorate %132 RelaxedPrecision 
                                              OpDecorate %133 RelaxedPrecision 
                                              OpDecorate %134 RelaxedPrecision 
                                              OpDecorate %135 RelaxedPrecision 
                                              OpDecorate %137 RelaxedPrecision 
                                              OpDecorate %137 Location 137 
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
                                  u32 %26 = OpConstant 3 
                                  u32 %28 = OpConstant 0 
                                      %29 = OpTypePointer Private %6 
                         Private f32* %31 = OpVariable Private 
                         Private f32* %35 = OpVariable Private 
                         Private f32* %44 = OpVariable Private 
                                      %45 = OpTypeStruct %6 %6 %6 %6 
                                      %46 = OpTypePointer Uniform %45 
Uniform struct {f32; f32; f32; f32;}* %47 = OpVariable Uniform 
                                      %48 = OpTypeInt 32 1 
                                  i32 %49 = OpConstant 3 
                                      %50 = OpTypePointer Uniform %6 
                                  f32 %54 = OpConstant 3.674022E-40 
                         Private f32* %56 = OpVariable Private 
                                  i32 %57 = OpConstant 1 
                                  i32 %60 = OpConstant 2 
                                  i32 %69 = OpConstant 0 
                                  f32 %77 = OpConstant 3.674022E-40 
                                 f32 %102 = OpConstant 3.674022E-40 
                                 f32 %105 = OpConstant 3.674022E-40 
                                 f32 %107 = OpConstant 3.674022E-40 
                      Private f32_4* %115 = OpVariable Private 
                                     %118 = OpTypePointer Input %7 
                        Input f32_4* %119 = OpVariable Input 
                        Private f32* %122 = OpVariable Private 
UniformConstant read_only Texture2D* %123 = OpVariable UniformConstant 
            UniformConstant sampler* %125 = OpVariable UniformConstant 
                Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                     %136 = OpTypePointer Output %7 
                       Output f32_4* %137 = OpVariable Output 
                                  void %4 = OpFunction None %3 
                                       %5 = OpLabel 
                  read_only Texture2D %13 = OpLoad %12 
                              sampler %17 = OpLoad %16 
           read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                                f32_2 %23 = OpLoad vs_TEXCOORD0 
                                f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                  f32 %27 = OpCompositeExtract %24 3 
                         Private f32* %30 = OpAccessChain %9 %28 
                                              OpStore %30 %27 
                         Private f32* %32 = OpAccessChain %9 %28 
                                  f32 %33 = OpLoad %32 
                                  f32 %34 = OpDPdx %33 
                                              OpStore %31 %34 
                         Private f32* %36 = OpAccessChain %9 %28 
                                  f32 %37 = OpLoad %36 
                                  f32 %38 = OpDPdy %37 
                                              OpStore %35 %38 
                                  f32 %39 = OpLoad %35 
                                  f32 %40 = OpExtInst %1 4 %39 
                                  f32 %41 = OpLoad %31 
                                  f32 %42 = OpExtInst %1 4 %41 
                                  f32 %43 = OpFAdd %40 %42 
                                              OpStore %31 %43 
                         Uniform f32* %51 = OpAccessChain %47 %49 
                                  f32 %52 = OpLoad %51 
                                  f32 %53 = OpFNegate %52 
                                  f32 %55 = OpFAdd %53 %54 
                                              OpStore %44 %55 
                         Uniform f32* %58 = OpAccessChain %47 %57 
                                  f32 %59 = OpLoad %58 
                         Uniform f32* %61 = OpAccessChain %47 %60 
                                  f32 %62 = OpLoad %61 
                                  f32 %63 = OpFMul %59 %62 
                                              OpStore %56 %63 
                                  f32 %64 = OpLoad %31 
                                  f32 %65 = OpLoad %44 
                                  f32 %66 = OpFMul %64 %65 
                                  f32 %67 = OpLoad %56 
                                  f32 %68 = OpFAdd %66 %67 
                                              OpStore %44 %68 
                         Uniform f32* %70 = OpAccessChain %47 %69 
                                  f32 %71 = OpLoad %70 
                         Uniform f32* %72 = OpAccessChain %47 %60 
                                  f32 %73 = OpLoad %72 
                                  f32 %74 = OpFMul %71 %73 
                                              OpStore %56 %74 
                                  f32 %75 = OpLoad %56 
                                  f32 %76 = OpFNegate %75 
                                  f32 %78 = OpFMul %76 %77 
                                  f32 %79 = OpFAdd %78 %77 
                                              OpStore %56 %79 
                                  f32 %80 = OpLoad %44 
                                  f32 %81 = OpLoad %56 
                                  f32 %82 = OpFAdd %80 %81 
                                              OpStore %31 %82 
                                  f32 %83 = OpLoad %44 
                                  f32 %84 = OpFNegate %83 
                                  f32 %85 = OpLoad %56 
                                  f32 %86 = OpFAdd %84 %85 
                                              OpStore %35 %86 
                                  f32 %87 = OpLoad %35 
                                  f32 %88 = OpFNegate %87 
                                  f32 %89 = OpLoad %31 
                                  f32 %90 = OpFAdd %88 %89 
                                              OpStore %31 %90 
                         Private f32* %91 = OpAccessChain %9 %28 
                                  f32 %92 = OpLoad %91 
                                  f32 %93 = OpLoad %35 
                                  f32 %94 = OpFNegate %93 
                                  f32 %95 = OpFAdd %92 %94 
                                              OpStore %35 %95 
                                  f32 %96 = OpLoad %31 
                                  f32 %97 = OpFDiv %54 %96 
                                              OpStore %31 %97 
                                  f32 %98 = OpLoad %31 
                                  f32 %99 = OpLoad %35 
                                 f32 %100 = OpFMul %98 %99 
                                              OpStore %31 %100 
                                 f32 %101 = OpLoad %31 
                                 f32 %103 = OpExtInst %1 43 %101 %102 %54 
                                              OpStore %31 %103 
                                 f32 %104 = OpLoad %31 
                                 f32 %106 = OpFMul %104 %105 
                                 f32 %108 = OpFAdd %106 %107 
                                              OpStore %35 %108 
                                 f32 %109 = OpLoad %31 
                                 f32 %110 = OpLoad %31 
                                 f32 %111 = OpFMul %109 %110 
                                              OpStore %31 %111 
                                 f32 %112 = OpLoad %31 
                                 f32 %113 = OpLoad %35 
                                 f32 %114 = OpFMul %112 %113 
                                              OpStore %31 %114 
                                 f32 %116 = OpLoad %31 
                               f32_4 %117 = OpCompositeConstruct %116 %116 %116 %116 
                               f32_4 %120 = OpLoad %119 
                               f32_4 %121 = OpFMul %117 %120 
                                              OpStore %115 %121 
                 read_only Texture2D %124 = OpLoad %123 
                             sampler %126 = OpLoad %125 
          read_only Texture2DSampled %127 = OpSampledImage %124 %126 
                               f32_2 %129 = OpLoad vs_TEXCOORD1 
                               f32_4 %130 = OpImageSampleImplicitLod %127 %129 
                                 f32 %131 = OpCompositeExtract %130 3 
                                              OpStore %122 %131 
                               f32_4 %132 = OpLoad %115 
                                 f32 %133 = OpLoad %122 
                               f32_4 %134 = OpCompositeConstruct %133 %133 %133 %133 
                               f32_4 %135 = OpFMul %132 %134 
                                              OpStore %9 %135 
                               f32_4 %138 = OpLoad %9 
                                              OpStore %137 %138 
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