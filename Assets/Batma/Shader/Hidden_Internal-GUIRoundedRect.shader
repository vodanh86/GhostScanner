//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-GUIRoundedRect" {
Properties {
_MainTex ("Texture", any) = "white" { }
_SrcBlend ("SrcBlend", Float) = 5
_DstBlend ("DstBlend", Float) = 10
}
SubShader {
 Pass {
  Blend Zero Zero, One OneMinusSrcAlpha
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 3629
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 628
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %511 %523 %578 %601 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %502 DescriptorSet 502 
                                                      OpDecorate %502 Binding 502 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %506 DescriptorSet 506 
                                                      OpDecorate %506 Binding 506 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 511 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate %518 DescriptorSet 518 
                                                      OpDecorate %518 Binding 518 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %520 DescriptorSet 520 
                                                      OpDecorate %520 Binding 520 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 523 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %572 RelaxedPrecision 
                                                      OpDecorate %573 RelaxedPrecision 
                                                      OpDecorate %575 RelaxedPrecision 
                                                      OpDecorate %577 RelaxedPrecision 
                                                      OpDecorate %578 RelaxedPrecision 
                                                      OpDecorate %578 Location 578 
                                                      OpDecorate %580 RelaxedPrecision 
                                                      OpDecorate %581 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %601 RelaxedPrecision 
                                                      OpDecorate %601 Location 601 
                                                      OpDecorate %606 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 %10 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; i32;}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %314 = OpTypeVector %53 3 
                                             %315 = OpTypePointer Private %314 
                             Private bool_3* %316 = OpVariable Private 
                                         i32 %321 = OpConstant 5 
                                             %322 = OpTypePointer Uniform %10 
                                             %354 = OpTypePointer Function %53 
                                             %500 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %501 = OpTypePointer UniformConstant %500 
        UniformConstant read_only Texture2D* %502 = OpVariable UniformConstant 
                                             %504 = OpTypeSampler 
                                             %505 = OpTypePointer UniformConstant %504 
                    UniformConstant sampler* %506 = OpVariable UniformConstant 
                                             %508 = OpTypeSampledImage %500 
                                             %510 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %514 = OpConstant 3 
                              Private f32_4* %517 = OpVariable Private 
        UniformConstant read_only Texture2D* %518 = OpVariable UniformConstant 
                    UniformConstant sampler* %520 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %526 = OpVariable Private 
                                       f32_3 %529 = OpConstantComposite %56 %56 %56 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                         f32 %549 = OpConstant 3.674022E-40 
                                       f32_3 %550 = OpConstantComposite %549 %549 %549 
                                         f32 %552 = OpConstant 3.674022E-40 
                                       f32_3 %553 = OpConstantComposite %552 %552 %552 
                                             %565 = OpTypePointer Function %7 
                                Private f32* %575 = OpVariable Private 
                                Input f32_4* %578 = OpVariable Input 
                                             %600 = OpTypePointer Output %35 
                               Output f32_4* %601 = OpVariable Output 
                                             %604 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %330 = OpVariable Function 
                              Function bool* %355 = OpVariable Function 
                              Function bool* %366 = OpVariable Function 
                               Function f32* %382 = OpVariable Function 
                               Function f32* %486 = OpVariable Function 
                             Function f32_3* %566 = OpVariable Function 
                             Function f32_3* %618 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFNegate %311 
                                         f32 %313 = OpFAdd %312 %251 
                                                      OpStore %59 %313 
                                Private f32* %317 = OpAccessChain %246 %24 
                                         f32 %318 = OpLoad %317 
                                        bool %319 = OpFOrdEqual %318 %56 
                               Private bool* %320 = OpAccessChain %316 %24 
                                                      OpStore %320 %319 
                                Uniform i32* %323 = OpAccessChain %18 %321 
                                         i32 %324 = OpLoad %323 
                                        bool %325 = OpINotEqual %324 %20 
                                         f32 %326 = OpLoad %59 
                                         f32 %327 = OpSelect %325 %326 %56 
                                                      OpStore %59 %327 
                               Private bool* %328 = OpAccessChain %316 %24 
                                        bool %329 = OpLoad %328 
                                                      OpSelectionMerge %332 None 
                                                      OpBranchConditional %329 %331 %335 
                                             %331 = OpLabel 
                                Private f32* %333 = OpAccessChain %9 %24 
                                         f32 %334 = OpLoad %333 
                                                      OpStore %330 %334 
                                                      OpBranch %332 
                                             %335 = OpLabel 
                                         f32 %336 = OpLoad %59 
                                                      OpStore %330 %336 
                                                      OpBranch %332 
                                             %332 = OpLabel 
                                         f32 %337 = OpLoad %330 
                                Private f32* %338 = OpAccessChain %9 %24 
                                                      OpStore %338 %337 
                                       f32_4 %339 = OpLoad %120 
                                       f32_4 %340 = OpVectorShuffle %339 %339 1 1 3 3 
                                       f32_4 %341 = OpLoad vs_TEXCOORD2 
                                       f32_4 %342 = OpVectorShuffle %341 %341 0 0 1 1 
                                      bool_4 %343 = OpFOrdGreaterThanEqual %340 %342 
                                      bool_2 %344 = OpVectorShuffle %343 %343 0 2 
                                      bool_3 %345 = OpLoad %316 
                                      bool_3 %346 = OpVectorShuffle %345 %344 3 1 4 
                                                      OpStore %316 %346 
                                       f32_4 %347 = OpLoad vs_TEXCOORD2 
                                       f32_4 %348 = OpVectorShuffle %347 %347 0 1 0 0 
                                       f32_4 %349 = OpLoad %120 
                                       f32_4 %350 = OpVectorShuffle %349 %349 1 3 1 1 
                                      bool_4 %351 = OpFOrdGreaterThanEqual %348 %350 
                                      bool_2 %352 = OpVectorShuffle %351 %351 0 1 
                                                      OpStore %280 %352 
                                        bool %353 = OpLoad %55 
                                                      OpSelectionMerge %357 None 
                                                      OpBranchConditional %353 %356 %360 
                                             %356 = OpLabel 
                               Private bool* %358 = OpAccessChain %316 %24 
                                        bool %359 = OpLoad %358 
                                                      OpStore %355 %359 
                                                      OpBranch %357 
                                             %360 = OpLabel 
                               Private bool* %361 = OpAccessChain %280 %24 
                                        bool %362 = OpLoad %361 
                                                      OpStore %355 %362 
                                                      OpBranch %357 
                                             %357 = OpLabel 
                                        bool %363 = OpLoad %355 
                               Private bool* %364 = OpAccessChain %316 %24 
                                                      OpStore %364 %363 
                                        bool %365 = OpLoad %80 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %365 %367 %371 
                                             %367 = OpLabel 
                               Private bool* %369 = OpAccessChain %316 %200 
                                        bool %370 = OpLoad %369 
                                                      OpStore %366 %370 
                                                      OpBranch %368 
                                             %371 = OpLabel 
                               Private bool* %372 = OpAccessChain %280 %66 
                                        bool %373 = OpLoad %372 
                                                      OpStore %366 %373 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                        bool %374 = OpLoad %366 
                                                      OpStore %55 %374 
                                        bool %375 = OpLoad %55 
                               Private bool* %376 = OpAccessChain %316 %24 
                                        bool %377 = OpLoad %376 
                                        bool %378 = OpLogicalAnd %375 %377 
                               Private bool* %379 = OpAccessChain %316 %24 
                                                      OpStore %379 %378 
                               Private bool* %380 = OpAccessChain %316 %24 
                                        bool %381 = OpLoad %380 
                                                      OpSelectionMerge %384 None 
                                                      OpBranchConditional %381 %383 %387 
                                             %383 = OpLabel 
                                Private f32* %385 = OpAccessChain %9 %24 
                                         f32 %386 = OpLoad %385 
                                                      OpStore %382 %386 
                                                      OpBranch %384 
                                             %387 = OpLabel 
                                                      OpStore %382 %251 
                                                      OpBranch %384 
                                             %384 = OpLabel 
                                         f32 %388 = OpLoad %382 
                                Private f32* %389 = OpAccessChain %9 %24 
                                                      OpStore %389 %388 
                                Uniform f32* %390 = OpAccessChain %18 %19 %20 
                                         f32 %391 = OpLoad %390 
                                Uniform f32* %392 = OpAccessChain %18 %19 %30 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFAdd %391 %393 
                                                      OpStore %34 %394 
                                         f32 %395 = OpLoad %34 
                                         f32 %396 = OpFNegate %395 
                                Uniform f32* %397 = OpAccessChain %18 %41 %30 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFAdd %396 %398 
                                                      OpStore %34 %399 
                                Uniform f32* %400 = OpAccessChain %18 %19 %20 
                                         f32 %401 = OpLoad %400 
                                Uniform f32* %402 = OpAccessChain %18 %41 %20 
                                         f32 %403 = OpLoad %402 
                                         f32 %404 = OpFAdd %401 %403 
                                                      OpStore %59 %404 
                                         f32 %405 = OpLoad %34 
                                         f32 %406 = OpLoad %59 
                                         f32 %407 = OpFAdd %405 %406 
                                                      OpStore %34 %407 
                                  Input f32* %408 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpLoad %59 
                                        bool %411 = OpFOrdGreaterThanEqual %409 %410 
                                                      OpStore %285 %411 
                                         f32 %412 = OpLoad %34 
                                  Input f32* %413 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %414 = OpLoad %413 
                                        bool %415 = OpFOrdGreaterThanEqual %412 %414 
                                                      OpStore %55 %415 
                                        bool %416 = OpLoad %55 
                                        bool %417 = OpLoad %285 
                                        bool %418 = OpLogicalAnd %416 %417 
                                                      OpStore %55 %418 
                                Uniform f32* %419 = OpAccessChain %18 %19 %69 
                                         f32 %420 = OpLoad %419 
                                Uniform f32* %421 = OpAccessChain %18 %41 %69 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFAdd %420 %422 
                                                      OpStore %59 %423 
                                  Input f32* %424 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %425 = OpLoad %424 
                                         f32 %426 = OpLoad %59 
                                        bool %427 = OpFOrdGreaterThanEqual %425 %426 
                               Private bool* %428 = OpAccessChain %280 %24 
                                                      OpStore %428 %427 
                                        bool %429 = OpLoad %55 
                               Private bool* %430 = OpAccessChain %280 %24 
                                        bool %431 = OpLoad %430 
                                        bool %432 = OpLogicalAnd %429 %431 
                                                      OpStore %55 %432 
                                Uniform f32* %433 = OpAccessChain %18 %19 %69 
                                         f32 %434 = OpLoad %433 
                                Uniform f32* %435 = OpAccessChain %18 %19 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                Private f32* %439 = OpAccessChain %29 %24 
                                         f32 %440 = OpLoad %439 
                                         f32 %441 = OpFNegate %440 
                                Uniform f32* %442 = OpAccessChain %18 %41 %19 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFAdd %441 %443 
                                Private f32* %445 = OpAccessChain %29 %24 
                                                      OpStore %445 %444 
                                         f32 %446 = OpLoad %59 
                                Private f32* %447 = OpAccessChain %29 %24 
                                         f32 %448 = OpLoad %447 
                                         f32 %449 = OpFAdd %446 %448 
                                                      OpStore %59 %449 
                                         f32 %450 = OpLoad %59 
                                  Input f32* %451 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %452 = OpLoad %451 
                                        bool %453 = OpFOrdGreaterThanEqual %450 %452 
                                                      OpStore %285 %453 
                                        bool %454 = OpLoad %285 
                                        bool %455 = OpLoad %55 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %55 %456 
                                        bool %457 = OpLoad %55 
                                         f32 %458 = OpSelect %457 %56 %251 
                                                      OpStore %34 %458 
                               Private bool* %459 = OpAccessChain %316 %24 
                                        bool %460 = OpLoad %459 
                                         f32 %461 = OpLoad %34 
                                         f32 %462 = OpSelect %460 %251 %461 
                                Private f32* %463 = OpAccessChain %246 %24 
                                                      OpStore %463 %462 
                                Uniform f32* %464 = OpAccessChain %18 %19 %20 
                                         f32 %465 = OpLoad %464 
                                        bool %466 = OpFOrdLessThan %56 %465 
                                                      OpStore %55 %466 
                                Uniform f32* %467 = OpAccessChain %18 %19 %69 
                                         f32 %468 = OpLoad %467 
                                        bool %469 = OpFOrdLessThan %56 %468 
                                                      OpStore %285 %469 
                                        bool %470 = OpLoad %285 
                                        bool %471 = OpLoad %55 
                                        bool %472 = OpLogicalOr %470 %471 
                                                      OpStore %55 %472 
                                Uniform f32* %473 = OpAccessChain %18 %19 %30 
                                         f32 %474 = OpLoad %473 
                                        bool %475 = OpFOrdLessThan %56 %474 
                                                      OpStore %285 %475 
                                        bool %476 = OpLoad %285 
                                        bool %477 = OpLoad %55 
                                        bool %478 = OpLogicalOr %476 %477 
                                                      OpStore %55 %478 
                                Uniform f32* %479 = OpAccessChain %18 %19 %19 
                                         f32 %480 = OpLoad %479 
                                        bool %481 = OpFOrdLessThan %56 %480 
                                                      OpStore %285 %481 
                                        bool %482 = OpLoad %285 
                                        bool %483 = OpLoad %55 
                                        bool %484 = OpLogicalOr %482 %483 
                                                      OpStore %55 %484 
                                        bool %485 = OpLoad %55 
                                                      OpSelectionMerge %488 None 
                                                      OpBranchConditional %485 %487 %491 
                                             %487 = OpLabel 
                                Private f32* %489 = OpAccessChain %246 %24 
                                         f32 %490 = OpLoad %489 
                                                      OpStore %486 %490 
                                                      OpBranch %488 
                                             %491 = OpLabel 
                                                      OpStore %486 %251 
                                                      OpBranch %488 
                                             %488 = OpLabel 
                                         f32 %492 = OpLoad %486 
                                Private f32* %493 = OpAccessChain %246 %24 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %246 %24 
                                         f32 %495 = OpLoad %494 
                                Private f32* %496 = OpAccessChain %9 %24 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpFMul %495 %497 
                                Private f32* %499 = OpAccessChain %9 %200 
                                                      OpStore %499 %498 
                         read_only Texture2D %503 = OpLoad %502 
                                     sampler %507 = OpLoad %506 
                  read_only Texture2DSampled %509 = OpSampledImage %503 %507 
                                       f32_2 %512 = OpLoad vs_TEXCOORD1 
                                       f32_4 %513 = OpImageSampleImplicitLod %509 %512 
                                         f32 %515 = OpCompositeExtract %513 3 
                                Private f32* %516 = OpAccessChain %246 %200 
                                                      OpStore %516 %515 
                         read_only Texture2D %519 = OpLoad %518 
                                     sampler %521 = OpLoad %520 
                  read_only Texture2DSampled %522 = OpSampledImage %519 %521 
                                       f32_2 %524 = OpLoad vs_TEXCOORD0 
                                       f32_4 %525 = OpImageSampleImplicitLod %522 %524 
                                                      OpStore %517 %525 
                                       f32_4 %527 = OpLoad %517 
                                       f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
                                       f32_3 %530 = OpExtInst %1 40 %528 %529 
                                                      OpStore %526 %530 
                                       f32_3 %531 = OpLoad %526 
                                       f32_3 %532 = OpExtInst %1 30 %531 
                                       f32_4 %533 = OpLoad %120 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %120 %534 
                                       f32_4 %535 = OpLoad %120 
                                       f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
                                       f32_3 %539 = OpFMul %536 %538 
                                       f32_4 %540 = OpLoad %120 
                                       f32_4 %541 = OpVectorShuffle %540 %539 4 5 6 3 
                                                      OpStore %120 %541 
                                       f32_4 %542 = OpLoad %120 
                                       f32_3 %543 = OpVectorShuffle %542 %542 0 1 2 
                                       f32_3 %544 = OpExtInst %1 29 %543 
                                       f32_4 %545 = OpLoad %120 
                                       f32_4 %546 = OpVectorShuffle %545 %544 4 5 6 3 
                                                      OpStore %120 %546 
                                       f32_4 %547 = OpLoad %120 
                                       f32_3 %548 = OpVectorShuffle %547 %547 0 1 2 
                                       f32_3 %551 = OpFMul %548 %550 
                                       f32_3 %554 = OpFAdd %551 %553 
                                       f32_4 %555 = OpLoad %120 
                                       f32_4 %556 = OpVectorShuffle %555 %554 4 5 6 3 
                                                      OpStore %120 %556 
                                       f32_4 %557 = OpLoad %120 
                                       f32_3 %558 = OpVectorShuffle %557 %557 0 1 2 
                                       f32_3 %559 = OpExtInst %1 40 %558 %529 
                                       f32_4 %560 = OpLoad %120 
                                       f32_4 %561 = OpVectorShuffle %560 %559 4 5 6 3 
                                                      OpStore %120 %561 
                                Uniform i32* %562 = OpAccessChain %18 %20 
                                         i32 %563 = OpLoad %562 
                                        bool %564 = OpINotEqual %563 %20 
                                                      OpSelectionMerge %568 None 
                                                      OpBranchConditional %564 %567 %571 
                                             %567 = OpLabel 
                                       f32_4 %569 = OpLoad %120 
                                       f32_3 %570 = OpVectorShuffle %569 %569 0 1 2 
                                                      OpStore %566 %570 
                                                      OpBranch %568 
                                             %571 = OpLabel 
                                       f32_4 %572 = OpLoad %517 
                                       f32_3 %573 = OpVectorShuffle %572 %572 0 1 2 
                                                      OpStore %566 %573 
                                                      OpBranch %568 
                                             %568 = OpLabel 
                                       f32_3 %574 = OpLoad %566 
                                                      OpStore %526 %574 
                                Private f32* %576 = OpAccessChain %517 %514 
                                         f32 %577 = OpLoad %576 
                                  Input f32* %579 = OpAccessChain %578 %514 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %577 %580 
                                                      OpStore %575 %581 
                                Private f32* %582 = OpAccessChain %9 %24 
                                         f32 %583 = OpLoad %582 
                                         f32 %584 = OpLoad %575 
                                         f32 %585 = OpFMul %583 %584 
                                Private f32* %586 = OpAccessChain %9 %24 
                                                      OpStore %586 %585 
                                       f32_3 %587 = OpLoad %246 
                                       f32_2 %588 = OpVectorShuffle %587 %587 0 2 
                                       f32_3 %589 = OpLoad %9 
                                       f32_2 %590 = OpVectorShuffle %589 %589 0 2 
                                       f32_2 %591 = OpFMul %588 %590 
                                       f32_3 %592 = OpLoad %9 
                                       f32_3 %593 = OpVectorShuffle %592 %591 3 1 4 
                                                      OpStore %9 %593 
                                Private f32* %594 = OpAccessChain %246 %200 
                                         f32 %595 = OpLoad %594 
                                Private f32* %596 = OpAccessChain %9 %24 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpFMul %595 %597 
                                Private f32* %599 = OpAccessChain %9 %24 
                                                      OpStore %599 %598 
                                Private f32* %602 = OpAccessChain %9 %24 
                                         f32 %603 = OpLoad %602 
                                 Output f32* %605 = OpAccessChain %601 %514 
                                                      OpStore %605 %603 
                                       f32_3 %606 = OpLoad %526 
                                       f32_4 %607 = OpLoad %578 
                                       f32_3 %608 = OpVectorShuffle %607 %607 0 1 2 
                                       f32_3 %609 = OpFMul %606 %608 
                                                      OpStore %526 %609 
                                       f32_3 %610 = OpLoad %9 
                                       f32_3 %611 = OpVectorShuffle %610 %610 2 2 2 
                                       f32_3 %612 = OpLoad %526 
                                       f32_3 %613 = OpFMul %611 %612 
                                                      OpStore %9 %613 
                                Uniform i32* %614 = OpAccessChain %18 %69 
                                         i32 %615 = OpLoad %614 
                                        bool %616 = OpINotEqual %615 %321 
                                                      OpStore %285 %616 
                                        bool %617 = OpLoad %285 
                                                      OpSelectionMerge %620 None 
                                                      OpBranchConditional %617 %619 %622 
                                             %619 = OpLabel 
                                       f32_3 %621 = OpLoad %9 
                                                      OpStore %618 %621 
                                                      OpBranch %620 
                                             %622 = OpLabel 
                                       f32_3 %623 = OpLoad %526 
                                                      OpStore %618 %623 
                                                      OpBranch %620 
                                             %620 = OpLabel 
                                       f32_3 %624 = OpLoad %618 
                                       f32_4 %625 = OpLoad %601 
                                       f32_4 %626 = OpVectorShuffle %625 %624 4 5 6 3 
                                                      OpStore %601 %626 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 628
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %511 %523 %578 %601 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %502 DescriptorSet 502 
                                                      OpDecorate %502 Binding 502 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %506 DescriptorSet 506 
                                                      OpDecorate %506 Binding 506 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 511 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate %518 DescriptorSet 518 
                                                      OpDecorate %518 Binding 518 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %520 DescriptorSet 520 
                                                      OpDecorate %520 Binding 520 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 523 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %572 RelaxedPrecision 
                                                      OpDecorate %573 RelaxedPrecision 
                                                      OpDecorate %575 RelaxedPrecision 
                                                      OpDecorate %577 RelaxedPrecision 
                                                      OpDecorate %578 RelaxedPrecision 
                                                      OpDecorate %578 Location 578 
                                                      OpDecorate %580 RelaxedPrecision 
                                                      OpDecorate %581 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %601 RelaxedPrecision 
                                                      OpDecorate %601 Location 601 
                                                      OpDecorate %606 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 %10 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; i32;}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %314 = OpTypeVector %53 3 
                                             %315 = OpTypePointer Private %314 
                             Private bool_3* %316 = OpVariable Private 
                                         i32 %321 = OpConstant 5 
                                             %322 = OpTypePointer Uniform %10 
                                             %354 = OpTypePointer Function %53 
                                             %500 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %501 = OpTypePointer UniformConstant %500 
        UniformConstant read_only Texture2D* %502 = OpVariable UniformConstant 
                                             %504 = OpTypeSampler 
                                             %505 = OpTypePointer UniformConstant %504 
                    UniformConstant sampler* %506 = OpVariable UniformConstant 
                                             %508 = OpTypeSampledImage %500 
                                             %510 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %514 = OpConstant 3 
                              Private f32_4* %517 = OpVariable Private 
        UniformConstant read_only Texture2D* %518 = OpVariable UniformConstant 
                    UniformConstant sampler* %520 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %526 = OpVariable Private 
                                       f32_3 %529 = OpConstantComposite %56 %56 %56 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                         f32 %549 = OpConstant 3.674022E-40 
                                       f32_3 %550 = OpConstantComposite %549 %549 %549 
                                         f32 %552 = OpConstant 3.674022E-40 
                                       f32_3 %553 = OpConstantComposite %552 %552 %552 
                                             %565 = OpTypePointer Function %7 
                                Private f32* %575 = OpVariable Private 
                                Input f32_4* %578 = OpVariable Input 
                                             %600 = OpTypePointer Output %35 
                               Output f32_4* %601 = OpVariable Output 
                                             %604 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %330 = OpVariable Function 
                              Function bool* %355 = OpVariable Function 
                              Function bool* %366 = OpVariable Function 
                               Function f32* %382 = OpVariable Function 
                               Function f32* %486 = OpVariable Function 
                             Function f32_3* %566 = OpVariable Function 
                             Function f32_3* %618 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFNegate %311 
                                         f32 %313 = OpFAdd %312 %251 
                                                      OpStore %59 %313 
                                Private f32* %317 = OpAccessChain %246 %24 
                                         f32 %318 = OpLoad %317 
                                        bool %319 = OpFOrdEqual %318 %56 
                               Private bool* %320 = OpAccessChain %316 %24 
                                                      OpStore %320 %319 
                                Uniform i32* %323 = OpAccessChain %18 %321 
                                         i32 %324 = OpLoad %323 
                                        bool %325 = OpINotEqual %324 %20 
                                         f32 %326 = OpLoad %59 
                                         f32 %327 = OpSelect %325 %326 %56 
                                                      OpStore %59 %327 
                               Private bool* %328 = OpAccessChain %316 %24 
                                        bool %329 = OpLoad %328 
                                                      OpSelectionMerge %332 None 
                                                      OpBranchConditional %329 %331 %335 
                                             %331 = OpLabel 
                                Private f32* %333 = OpAccessChain %9 %24 
                                         f32 %334 = OpLoad %333 
                                                      OpStore %330 %334 
                                                      OpBranch %332 
                                             %335 = OpLabel 
                                         f32 %336 = OpLoad %59 
                                                      OpStore %330 %336 
                                                      OpBranch %332 
                                             %332 = OpLabel 
                                         f32 %337 = OpLoad %330 
                                Private f32* %338 = OpAccessChain %9 %24 
                                                      OpStore %338 %337 
                                       f32_4 %339 = OpLoad %120 
                                       f32_4 %340 = OpVectorShuffle %339 %339 1 1 3 3 
                                       f32_4 %341 = OpLoad vs_TEXCOORD2 
                                       f32_4 %342 = OpVectorShuffle %341 %341 0 0 1 1 
                                      bool_4 %343 = OpFOrdGreaterThanEqual %340 %342 
                                      bool_2 %344 = OpVectorShuffle %343 %343 0 2 
                                      bool_3 %345 = OpLoad %316 
                                      bool_3 %346 = OpVectorShuffle %345 %344 3 1 4 
                                                      OpStore %316 %346 
                                       f32_4 %347 = OpLoad vs_TEXCOORD2 
                                       f32_4 %348 = OpVectorShuffle %347 %347 0 1 0 0 
                                       f32_4 %349 = OpLoad %120 
                                       f32_4 %350 = OpVectorShuffle %349 %349 1 3 1 1 
                                      bool_4 %351 = OpFOrdGreaterThanEqual %348 %350 
                                      bool_2 %352 = OpVectorShuffle %351 %351 0 1 
                                                      OpStore %280 %352 
                                        bool %353 = OpLoad %55 
                                                      OpSelectionMerge %357 None 
                                                      OpBranchConditional %353 %356 %360 
                                             %356 = OpLabel 
                               Private bool* %358 = OpAccessChain %316 %24 
                                        bool %359 = OpLoad %358 
                                                      OpStore %355 %359 
                                                      OpBranch %357 
                                             %360 = OpLabel 
                               Private bool* %361 = OpAccessChain %280 %24 
                                        bool %362 = OpLoad %361 
                                                      OpStore %355 %362 
                                                      OpBranch %357 
                                             %357 = OpLabel 
                                        bool %363 = OpLoad %355 
                               Private bool* %364 = OpAccessChain %316 %24 
                                                      OpStore %364 %363 
                                        bool %365 = OpLoad %80 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %365 %367 %371 
                                             %367 = OpLabel 
                               Private bool* %369 = OpAccessChain %316 %200 
                                        bool %370 = OpLoad %369 
                                                      OpStore %366 %370 
                                                      OpBranch %368 
                                             %371 = OpLabel 
                               Private bool* %372 = OpAccessChain %280 %66 
                                        bool %373 = OpLoad %372 
                                                      OpStore %366 %373 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                        bool %374 = OpLoad %366 
                                                      OpStore %55 %374 
                                        bool %375 = OpLoad %55 
                               Private bool* %376 = OpAccessChain %316 %24 
                                        bool %377 = OpLoad %376 
                                        bool %378 = OpLogicalAnd %375 %377 
                               Private bool* %379 = OpAccessChain %316 %24 
                                                      OpStore %379 %378 
                               Private bool* %380 = OpAccessChain %316 %24 
                                        bool %381 = OpLoad %380 
                                                      OpSelectionMerge %384 None 
                                                      OpBranchConditional %381 %383 %387 
                                             %383 = OpLabel 
                                Private f32* %385 = OpAccessChain %9 %24 
                                         f32 %386 = OpLoad %385 
                                                      OpStore %382 %386 
                                                      OpBranch %384 
                                             %387 = OpLabel 
                                                      OpStore %382 %251 
                                                      OpBranch %384 
                                             %384 = OpLabel 
                                         f32 %388 = OpLoad %382 
                                Private f32* %389 = OpAccessChain %9 %24 
                                                      OpStore %389 %388 
                                Uniform f32* %390 = OpAccessChain %18 %19 %20 
                                         f32 %391 = OpLoad %390 
                                Uniform f32* %392 = OpAccessChain %18 %19 %30 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFAdd %391 %393 
                                                      OpStore %34 %394 
                                         f32 %395 = OpLoad %34 
                                         f32 %396 = OpFNegate %395 
                                Uniform f32* %397 = OpAccessChain %18 %41 %30 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFAdd %396 %398 
                                                      OpStore %34 %399 
                                Uniform f32* %400 = OpAccessChain %18 %19 %20 
                                         f32 %401 = OpLoad %400 
                                Uniform f32* %402 = OpAccessChain %18 %41 %20 
                                         f32 %403 = OpLoad %402 
                                         f32 %404 = OpFAdd %401 %403 
                                                      OpStore %59 %404 
                                         f32 %405 = OpLoad %34 
                                         f32 %406 = OpLoad %59 
                                         f32 %407 = OpFAdd %405 %406 
                                                      OpStore %34 %407 
                                  Input f32* %408 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpLoad %59 
                                        bool %411 = OpFOrdGreaterThanEqual %409 %410 
                                                      OpStore %285 %411 
                                         f32 %412 = OpLoad %34 
                                  Input f32* %413 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %414 = OpLoad %413 
                                        bool %415 = OpFOrdGreaterThanEqual %412 %414 
                                                      OpStore %55 %415 
                                        bool %416 = OpLoad %55 
                                        bool %417 = OpLoad %285 
                                        bool %418 = OpLogicalAnd %416 %417 
                                                      OpStore %55 %418 
                                Uniform f32* %419 = OpAccessChain %18 %19 %69 
                                         f32 %420 = OpLoad %419 
                                Uniform f32* %421 = OpAccessChain %18 %41 %69 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFAdd %420 %422 
                                                      OpStore %59 %423 
                                  Input f32* %424 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %425 = OpLoad %424 
                                         f32 %426 = OpLoad %59 
                                        bool %427 = OpFOrdGreaterThanEqual %425 %426 
                               Private bool* %428 = OpAccessChain %280 %24 
                                                      OpStore %428 %427 
                                        bool %429 = OpLoad %55 
                               Private bool* %430 = OpAccessChain %280 %24 
                                        bool %431 = OpLoad %430 
                                        bool %432 = OpLogicalAnd %429 %431 
                                                      OpStore %55 %432 
                                Uniform f32* %433 = OpAccessChain %18 %19 %69 
                                         f32 %434 = OpLoad %433 
                                Uniform f32* %435 = OpAccessChain %18 %19 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                Private f32* %439 = OpAccessChain %29 %24 
                                         f32 %440 = OpLoad %439 
                                         f32 %441 = OpFNegate %440 
                                Uniform f32* %442 = OpAccessChain %18 %41 %19 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFAdd %441 %443 
                                Private f32* %445 = OpAccessChain %29 %24 
                                                      OpStore %445 %444 
                                         f32 %446 = OpLoad %59 
                                Private f32* %447 = OpAccessChain %29 %24 
                                         f32 %448 = OpLoad %447 
                                         f32 %449 = OpFAdd %446 %448 
                                                      OpStore %59 %449 
                                         f32 %450 = OpLoad %59 
                                  Input f32* %451 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %452 = OpLoad %451 
                                        bool %453 = OpFOrdGreaterThanEqual %450 %452 
                                                      OpStore %285 %453 
                                        bool %454 = OpLoad %285 
                                        bool %455 = OpLoad %55 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %55 %456 
                                        bool %457 = OpLoad %55 
                                         f32 %458 = OpSelect %457 %56 %251 
                                                      OpStore %34 %458 
                               Private bool* %459 = OpAccessChain %316 %24 
                                        bool %460 = OpLoad %459 
                                         f32 %461 = OpLoad %34 
                                         f32 %462 = OpSelect %460 %251 %461 
                                Private f32* %463 = OpAccessChain %246 %24 
                                                      OpStore %463 %462 
                                Uniform f32* %464 = OpAccessChain %18 %19 %20 
                                         f32 %465 = OpLoad %464 
                                        bool %466 = OpFOrdLessThan %56 %465 
                                                      OpStore %55 %466 
                                Uniform f32* %467 = OpAccessChain %18 %19 %69 
                                         f32 %468 = OpLoad %467 
                                        bool %469 = OpFOrdLessThan %56 %468 
                                                      OpStore %285 %469 
                                        bool %470 = OpLoad %285 
                                        bool %471 = OpLoad %55 
                                        bool %472 = OpLogicalOr %470 %471 
                                                      OpStore %55 %472 
                                Uniform f32* %473 = OpAccessChain %18 %19 %30 
                                         f32 %474 = OpLoad %473 
                                        bool %475 = OpFOrdLessThan %56 %474 
                                                      OpStore %285 %475 
                                        bool %476 = OpLoad %285 
                                        bool %477 = OpLoad %55 
                                        bool %478 = OpLogicalOr %476 %477 
                                                      OpStore %55 %478 
                                Uniform f32* %479 = OpAccessChain %18 %19 %19 
                                         f32 %480 = OpLoad %479 
                                        bool %481 = OpFOrdLessThan %56 %480 
                                                      OpStore %285 %481 
                                        bool %482 = OpLoad %285 
                                        bool %483 = OpLoad %55 
                                        bool %484 = OpLogicalOr %482 %483 
                                                      OpStore %55 %484 
                                        bool %485 = OpLoad %55 
                                                      OpSelectionMerge %488 None 
                                                      OpBranchConditional %485 %487 %491 
                                             %487 = OpLabel 
                                Private f32* %489 = OpAccessChain %246 %24 
                                         f32 %490 = OpLoad %489 
                                                      OpStore %486 %490 
                                                      OpBranch %488 
                                             %491 = OpLabel 
                                                      OpStore %486 %251 
                                                      OpBranch %488 
                                             %488 = OpLabel 
                                         f32 %492 = OpLoad %486 
                                Private f32* %493 = OpAccessChain %246 %24 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %246 %24 
                                         f32 %495 = OpLoad %494 
                                Private f32* %496 = OpAccessChain %9 %24 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpFMul %495 %497 
                                Private f32* %499 = OpAccessChain %9 %200 
                                                      OpStore %499 %498 
                         read_only Texture2D %503 = OpLoad %502 
                                     sampler %507 = OpLoad %506 
                  read_only Texture2DSampled %509 = OpSampledImage %503 %507 
                                       f32_2 %512 = OpLoad vs_TEXCOORD1 
                                       f32_4 %513 = OpImageSampleImplicitLod %509 %512 
                                         f32 %515 = OpCompositeExtract %513 3 
                                Private f32* %516 = OpAccessChain %246 %200 
                                                      OpStore %516 %515 
                         read_only Texture2D %519 = OpLoad %518 
                                     sampler %521 = OpLoad %520 
                  read_only Texture2DSampled %522 = OpSampledImage %519 %521 
                                       f32_2 %524 = OpLoad vs_TEXCOORD0 
                                       f32_4 %525 = OpImageSampleImplicitLod %522 %524 
                                                      OpStore %517 %525 
                                       f32_4 %527 = OpLoad %517 
                                       f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
                                       f32_3 %530 = OpExtInst %1 40 %528 %529 
                                                      OpStore %526 %530 
                                       f32_3 %531 = OpLoad %526 
                                       f32_3 %532 = OpExtInst %1 30 %531 
                                       f32_4 %533 = OpLoad %120 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %120 %534 
                                       f32_4 %535 = OpLoad %120 
                                       f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
                                       f32_3 %539 = OpFMul %536 %538 
                                       f32_4 %540 = OpLoad %120 
                                       f32_4 %541 = OpVectorShuffle %540 %539 4 5 6 3 
                                                      OpStore %120 %541 
                                       f32_4 %542 = OpLoad %120 
                                       f32_3 %543 = OpVectorShuffle %542 %542 0 1 2 
                                       f32_3 %544 = OpExtInst %1 29 %543 
                                       f32_4 %545 = OpLoad %120 
                                       f32_4 %546 = OpVectorShuffle %545 %544 4 5 6 3 
                                                      OpStore %120 %546 
                                       f32_4 %547 = OpLoad %120 
                                       f32_3 %548 = OpVectorShuffle %547 %547 0 1 2 
                                       f32_3 %551 = OpFMul %548 %550 
                                       f32_3 %554 = OpFAdd %551 %553 
                                       f32_4 %555 = OpLoad %120 
                                       f32_4 %556 = OpVectorShuffle %555 %554 4 5 6 3 
                                                      OpStore %120 %556 
                                       f32_4 %557 = OpLoad %120 
                                       f32_3 %558 = OpVectorShuffle %557 %557 0 1 2 
                                       f32_3 %559 = OpExtInst %1 40 %558 %529 
                                       f32_4 %560 = OpLoad %120 
                                       f32_4 %561 = OpVectorShuffle %560 %559 4 5 6 3 
                                                      OpStore %120 %561 
                                Uniform i32* %562 = OpAccessChain %18 %20 
                                         i32 %563 = OpLoad %562 
                                        bool %564 = OpINotEqual %563 %20 
                                                      OpSelectionMerge %568 None 
                                                      OpBranchConditional %564 %567 %571 
                                             %567 = OpLabel 
                                       f32_4 %569 = OpLoad %120 
                                       f32_3 %570 = OpVectorShuffle %569 %569 0 1 2 
                                                      OpStore %566 %570 
                                                      OpBranch %568 
                                             %571 = OpLabel 
                                       f32_4 %572 = OpLoad %517 
                                       f32_3 %573 = OpVectorShuffle %572 %572 0 1 2 
                                                      OpStore %566 %573 
                                                      OpBranch %568 
                                             %568 = OpLabel 
                                       f32_3 %574 = OpLoad %566 
                                                      OpStore %526 %574 
                                Private f32* %576 = OpAccessChain %517 %514 
                                         f32 %577 = OpLoad %576 
                                  Input f32* %579 = OpAccessChain %578 %514 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %577 %580 
                                                      OpStore %575 %581 
                                Private f32* %582 = OpAccessChain %9 %24 
                                         f32 %583 = OpLoad %582 
                                         f32 %584 = OpLoad %575 
                                         f32 %585 = OpFMul %583 %584 
                                Private f32* %586 = OpAccessChain %9 %24 
                                                      OpStore %586 %585 
                                       f32_3 %587 = OpLoad %246 
                                       f32_2 %588 = OpVectorShuffle %587 %587 0 2 
                                       f32_3 %589 = OpLoad %9 
                                       f32_2 %590 = OpVectorShuffle %589 %589 0 2 
                                       f32_2 %591 = OpFMul %588 %590 
                                       f32_3 %592 = OpLoad %9 
                                       f32_3 %593 = OpVectorShuffle %592 %591 3 1 4 
                                                      OpStore %9 %593 
                                Private f32* %594 = OpAccessChain %246 %200 
                                         f32 %595 = OpLoad %594 
                                Private f32* %596 = OpAccessChain %9 %24 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpFMul %595 %597 
                                Private f32* %599 = OpAccessChain %9 %24 
                                                      OpStore %599 %598 
                                Private f32* %602 = OpAccessChain %9 %24 
                                         f32 %603 = OpLoad %602 
                                 Output f32* %605 = OpAccessChain %601 %514 
                                                      OpStore %605 %603 
                                       f32_3 %606 = OpLoad %526 
                                       f32_4 %607 = OpLoad %578 
                                       f32_3 %608 = OpVectorShuffle %607 %607 0 1 2 
                                       f32_3 %609 = OpFMul %606 %608 
                                                      OpStore %526 %609 
                                       f32_3 %610 = OpLoad %9 
                                       f32_3 %611 = OpVectorShuffle %610 %610 2 2 2 
                                       f32_3 %612 = OpLoad %526 
                                       f32_3 %613 = OpFMul %611 %612 
                                                      OpStore %9 %613 
                                Uniform i32* %614 = OpAccessChain %18 %69 
                                         i32 %615 = OpLoad %614 
                                        bool %616 = OpINotEqual %615 %321 
                                                      OpStore %285 %616 
                                        bool %617 = OpLoad %285 
                                                      OpSelectionMerge %620 None 
                                                      OpBranchConditional %617 %619 %622 
                                             %619 = OpLabel 
                                       f32_3 %621 = OpLoad %9 
                                                      OpStore %618 %621 
                                                      OpBranch %620 
                                             %622 = OpLabel 
                                       f32_3 %623 = OpLoad %526 
                                                      OpStore %618 %623 
                                                      OpBranch %620 
                                             %620 = OpLabel 
                                       f32_3 %624 = OpLoad %618 
                                       f32_4 %625 = OpLoad %601 
                                       f32_4 %626 = OpVectorShuffle %625 %624 4 5 6 3 
                                                      OpStore %601 %626 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 628
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %511 %523 %578 %601 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %502 DescriptorSet 502 
                                                      OpDecorate %502 Binding 502 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %506 DescriptorSet 506 
                                                      OpDecorate %506 Binding 506 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 511 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate %518 DescriptorSet 518 
                                                      OpDecorate %518 Binding 518 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %520 DescriptorSet 520 
                                                      OpDecorate %520 Binding 520 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 523 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %572 RelaxedPrecision 
                                                      OpDecorate %573 RelaxedPrecision 
                                                      OpDecorate %575 RelaxedPrecision 
                                                      OpDecorate %577 RelaxedPrecision 
                                                      OpDecorate %578 RelaxedPrecision 
                                                      OpDecorate %578 Location 578 
                                                      OpDecorate %580 RelaxedPrecision 
                                                      OpDecorate %581 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %601 RelaxedPrecision 
                                                      OpDecorate %601 Location 601 
                                                      OpDecorate %606 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 %10 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; i32;}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %314 = OpTypeVector %53 3 
                                             %315 = OpTypePointer Private %314 
                             Private bool_3* %316 = OpVariable Private 
                                         i32 %321 = OpConstant 5 
                                             %322 = OpTypePointer Uniform %10 
                                             %354 = OpTypePointer Function %53 
                                             %500 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %501 = OpTypePointer UniformConstant %500 
        UniformConstant read_only Texture2D* %502 = OpVariable UniformConstant 
                                             %504 = OpTypeSampler 
                                             %505 = OpTypePointer UniformConstant %504 
                    UniformConstant sampler* %506 = OpVariable UniformConstant 
                                             %508 = OpTypeSampledImage %500 
                                             %510 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %514 = OpConstant 3 
                              Private f32_4* %517 = OpVariable Private 
        UniformConstant read_only Texture2D* %518 = OpVariable UniformConstant 
                    UniformConstant sampler* %520 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %526 = OpVariable Private 
                                       f32_3 %529 = OpConstantComposite %56 %56 %56 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                         f32 %549 = OpConstant 3.674022E-40 
                                       f32_3 %550 = OpConstantComposite %549 %549 %549 
                                         f32 %552 = OpConstant 3.674022E-40 
                                       f32_3 %553 = OpConstantComposite %552 %552 %552 
                                             %565 = OpTypePointer Function %7 
                                Private f32* %575 = OpVariable Private 
                                Input f32_4* %578 = OpVariable Input 
                                             %600 = OpTypePointer Output %35 
                               Output f32_4* %601 = OpVariable Output 
                                             %604 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %330 = OpVariable Function 
                              Function bool* %355 = OpVariable Function 
                              Function bool* %366 = OpVariable Function 
                               Function f32* %382 = OpVariable Function 
                               Function f32* %486 = OpVariable Function 
                             Function f32_3* %566 = OpVariable Function 
                             Function f32_3* %618 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFNegate %311 
                                         f32 %313 = OpFAdd %312 %251 
                                                      OpStore %59 %313 
                                Private f32* %317 = OpAccessChain %246 %24 
                                         f32 %318 = OpLoad %317 
                                        bool %319 = OpFOrdEqual %318 %56 
                               Private bool* %320 = OpAccessChain %316 %24 
                                                      OpStore %320 %319 
                                Uniform i32* %323 = OpAccessChain %18 %321 
                                         i32 %324 = OpLoad %323 
                                        bool %325 = OpINotEqual %324 %20 
                                         f32 %326 = OpLoad %59 
                                         f32 %327 = OpSelect %325 %326 %56 
                                                      OpStore %59 %327 
                               Private bool* %328 = OpAccessChain %316 %24 
                                        bool %329 = OpLoad %328 
                                                      OpSelectionMerge %332 None 
                                                      OpBranchConditional %329 %331 %335 
                                             %331 = OpLabel 
                                Private f32* %333 = OpAccessChain %9 %24 
                                         f32 %334 = OpLoad %333 
                                                      OpStore %330 %334 
                                                      OpBranch %332 
                                             %335 = OpLabel 
                                         f32 %336 = OpLoad %59 
                                                      OpStore %330 %336 
                                                      OpBranch %332 
                                             %332 = OpLabel 
                                         f32 %337 = OpLoad %330 
                                Private f32* %338 = OpAccessChain %9 %24 
                                                      OpStore %338 %337 
                                       f32_4 %339 = OpLoad %120 
                                       f32_4 %340 = OpVectorShuffle %339 %339 1 1 3 3 
                                       f32_4 %341 = OpLoad vs_TEXCOORD2 
                                       f32_4 %342 = OpVectorShuffle %341 %341 0 0 1 1 
                                      bool_4 %343 = OpFOrdGreaterThanEqual %340 %342 
                                      bool_2 %344 = OpVectorShuffle %343 %343 0 2 
                                      bool_3 %345 = OpLoad %316 
                                      bool_3 %346 = OpVectorShuffle %345 %344 3 1 4 
                                                      OpStore %316 %346 
                                       f32_4 %347 = OpLoad vs_TEXCOORD2 
                                       f32_4 %348 = OpVectorShuffle %347 %347 0 1 0 0 
                                       f32_4 %349 = OpLoad %120 
                                       f32_4 %350 = OpVectorShuffle %349 %349 1 3 1 1 
                                      bool_4 %351 = OpFOrdGreaterThanEqual %348 %350 
                                      bool_2 %352 = OpVectorShuffle %351 %351 0 1 
                                                      OpStore %280 %352 
                                        bool %353 = OpLoad %55 
                                                      OpSelectionMerge %357 None 
                                                      OpBranchConditional %353 %356 %360 
                                             %356 = OpLabel 
                               Private bool* %358 = OpAccessChain %316 %24 
                                        bool %359 = OpLoad %358 
                                                      OpStore %355 %359 
                                                      OpBranch %357 
                                             %360 = OpLabel 
                               Private bool* %361 = OpAccessChain %280 %24 
                                        bool %362 = OpLoad %361 
                                                      OpStore %355 %362 
                                                      OpBranch %357 
                                             %357 = OpLabel 
                                        bool %363 = OpLoad %355 
                               Private bool* %364 = OpAccessChain %316 %24 
                                                      OpStore %364 %363 
                                        bool %365 = OpLoad %80 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %365 %367 %371 
                                             %367 = OpLabel 
                               Private bool* %369 = OpAccessChain %316 %200 
                                        bool %370 = OpLoad %369 
                                                      OpStore %366 %370 
                                                      OpBranch %368 
                                             %371 = OpLabel 
                               Private bool* %372 = OpAccessChain %280 %66 
                                        bool %373 = OpLoad %372 
                                                      OpStore %366 %373 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                        bool %374 = OpLoad %366 
                                                      OpStore %55 %374 
                                        bool %375 = OpLoad %55 
                               Private bool* %376 = OpAccessChain %316 %24 
                                        bool %377 = OpLoad %376 
                                        bool %378 = OpLogicalAnd %375 %377 
                               Private bool* %379 = OpAccessChain %316 %24 
                                                      OpStore %379 %378 
                               Private bool* %380 = OpAccessChain %316 %24 
                                        bool %381 = OpLoad %380 
                                                      OpSelectionMerge %384 None 
                                                      OpBranchConditional %381 %383 %387 
                                             %383 = OpLabel 
                                Private f32* %385 = OpAccessChain %9 %24 
                                         f32 %386 = OpLoad %385 
                                                      OpStore %382 %386 
                                                      OpBranch %384 
                                             %387 = OpLabel 
                                                      OpStore %382 %251 
                                                      OpBranch %384 
                                             %384 = OpLabel 
                                         f32 %388 = OpLoad %382 
                                Private f32* %389 = OpAccessChain %9 %24 
                                                      OpStore %389 %388 
                                Uniform f32* %390 = OpAccessChain %18 %19 %20 
                                         f32 %391 = OpLoad %390 
                                Uniform f32* %392 = OpAccessChain %18 %19 %30 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFAdd %391 %393 
                                                      OpStore %34 %394 
                                         f32 %395 = OpLoad %34 
                                         f32 %396 = OpFNegate %395 
                                Uniform f32* %397 = OpAccessChain %18 %41 %30 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFAdd %396 %398 
                                                      OpStore %34 %399 
                                Uniform f32* %400 = OpAccessChain %18 %19 %20 
                                         f32 %401 = OpLoad %400 
                                Uniform f32* %402 = OpAccessChain %18 %41 %20 
                                         f32 %403 = OpLoad %402 
                                         f32 %404 = OpFAdd %401 %403 
                                                      OpStore %59 %404 
                                         f32 %405 = OpLoad %34 
                                         f32 %406 = OpLoad %59 
                                         f32 %407 = OpFAdd %405 %406 
                                                      OpStore %34 %407 
                                  Input f32* %408 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpLoad %59 
                                        bool %411 = OpFOrdGreaterThanEqual %409 %410 
                                                      OpStore %285 %411 
                                         f32 %412 = OpLoad %34 
                                  Input f32* %413 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %414 = OpLoad %413 
                                        bool %415 = OpFOrdGreaterThanEqual %412 %414 
                                                      OpStore %55 %415 
                                        bool %416 = OpLoad %55 
                                        bool %417 = OpLoad %285 
                                        bool %418 = OpLogicalAnd %416 %417 
                                                      OpStore %55 %418 
                                Uniform f32* %419 = OpAccessChain %18 %19 %69 
                                         f32 %420 = OpLoad %419 
                                Uniform f32* %421 = OpAccessChain %18 %41 %69 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFAdd %420 %422 
                                                      OpStore %59 %423 
                                  Input f32* %424 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %425 = OpLoad %424 
                                         f32 %426 = OpLoad %59 
                                        bool %427 = OpFOrdGreaterThanEqual %425 %426 
                               Private bool* %428 = OpAccessChain %280 %24 
                                                      OpStore %428 %427 
                                        bool %429 = OpLoad %55 
                               Private bool* %430 = OpAccessChain %280 %24 
                                        bool %431 = OpLoad %430 
                                        bool %432 = OpLogicalAnd %429 %431 
                                                      OpStore %55 %432 
                                Uniform f32* %433 = OpAccessChain %18 %19 %69 
                                         f32 %434 = OpLoad %433 
                                Uniform f32* %435 = OpAccessChain %18 %19 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                Private f32* %439 = OpAccessChain %29 %24 
                                         f32 %440 = OpLoad %439 
                                         f32 %441 = OpFNegate %440 
                                Uniform f32* %442 = OpAccessChain %18 %41 %19 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFAdd %441 %443 
                                Private f32* %445 = OpAccessChain %29 %24 
                                                      OpStore %445 %444 
                                         f32 %446 = OpLoad %59 
                                Private f32* %447 = OpAccessChain %29 %24 
                                         f32 %448 = OpLoad %447 
                                         f32 %449 = OpFAdd %446 %448 
                                                      OpStore %59 %449 
                                         f32 %450 = OpLoad %59 
                                  Input f32* %451 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %452 = OpLoad %451 
                                        bool %453 = OpFOrdGreaterThanEqual %450 %452 
                                                      OpStore %285 %453 
                                        bool %454 = OpLoad %285 
                                        bool %455 = OpLoad %55 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %55 %456 
                                        bool %457 = OpLoad %55 
                                         f32 %458 = OpSelect %457 %56 %251 
                                                      OpStore %34 %458 
                               Private bool* %459 = OpAccessChain %316 %24 
                                        bool %460 = OpLoad %459 
                                         f32 %461 = OpLoad %34 
                                         f32 %462 = OpSelect %460 %251 %461 
                                Private f32* %463 = OpAccessChain %246 %24 
                                                      OpStore %463 %462 
                                Uniform f32* %464 = OpAccessChain %18 %19 %20 
                                         f32 %465 = OpLoad %464 
                                        bool %466 = OpFOrdLessThan %56 %465 
                                                      OpStore %55 %466 
                                Uniform f32* %467 = OpAccessChain %18 %19 %69 
                                         f32 %468 = OpLoad %467 
                                        bool %469 = OpFOrdLessThan %56 %468 
                                                      OpStore %285 %469 
                                        bool %470 = OpLoad %285 
                                        bool %471 = OpLoad %55 
                                        bool %472 = OpLogicalOr %470 %471 
                                                      OpStore %55 %472 
                                Uniform f32* %473 = OpAccessChain %18 %19 %30 
                                         f32 %474 = OpLoad %473 
                                        bool %475 = OpFOrdLessThan %56 %474 
                                                      OpStore %285 %475 
                                        bool %476 = OpLoad %285 
                                        bool %477 = OpLoad %55 
                                        bool %478 = OpLogicalOr %476 %477 
                                                      OpStore %55 %478 
                                Uniform f32* %479 = OpAccessChain %18 %19 %19 
                                         f32 %480 = OpLoad %479 
                                        bool %481 = OpFOrdLessThan %56 %480 
                                                      OpStore %285 %481 
                                        bool %482 = OpLoad %285 
                                        bool %483 = OpLoad %55 
                                        bool %484 = OpLogicalOr %482 %483 
                                                      OpStore %55 %484 
                                        bool %485 = OpLoad %55 
                                                      OpSelectionMerge %488 None 
                                                      OpBranchConditional %485 %487 %491 
                                             %487 = OpLabel 
                                Private f32* %489 = OpAccessChain %246 %24 
                                         f32 %490 = OpLoad %489 
                                                      OpStore %486 %490 
                                                      OpBranch %488 
                                             %491 = OpLabel 
                                                      OpStore %486 %251 
                                                      OpBranch %488 
                                             %488 = OpLabel 
                                         f32 %492 = OpLoad %486 
                                Private f32* %493 = OpAccessChain %246 %24 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %246 %24 
                                         f32 %495 = OpLoad %494 
                                Private f32* %496 = OpAccessChain %9 %24 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpFMul %495 %497 
                                Private f32* %499 = OpAccessChain %9 %200 
                                                      OpStore %499 %498 
                         read_only Texture2D %503 = OpLoad %502 
                                     sampler %507 = OpLoad %506 
                  read_only Texture2DSampled %509 = OpSampledImage %503 %507 
                                       f32_2 %512 = OpLoad vs_TEXCOORD1 
                                       f32_4 %513 = OpImageSampleImplicitLod %509 %512 
                                         f32 %515 = OpCompositeExtract %513 3 
                                Private f32* %516 = OpAccessChain %246 %200 
                                                      OpStore %516 %515 
                         read_only Texture2D %519 = OpLoad %518 
                                     sampler %521 = OpLoad %520 
                  read_only Texture2DSampled %522 = OpSampledImage %519 %521 
                                       f32_2 %524 = OpLoad vs_TEXCOORD0 
                                       f32_4 %525 = OpImageSampleImplicitLod %522 %524 
                                                      OpStore %517 %525 
                                       f32_4 %527 = OpLoad %517 
                                       f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
                                       f32_3 %530 = OpExtInst %1 40 %528 %529 
                                                      OpStore %526 %530 
                                       f32_3 %531 = OpLoad %526 
                                       f32_3 %532 = OpExtInst %1 30 %531 
                                       f32_4 %533 = OpLoad %120 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %120 %534 
                                       f32_4 %535 = OpLoad %120 
                                       f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
                                       f32_3 %539 = OpFMul %536 %538 
                                       f32_4 %540 = OpLoad %120 
                                       f32_4 %541 = OpVectorShuffle %540 %539 4 5 6 3 
                                                      OpStore %120 %541 
                                       f32_4 %542 = OpLoad %120 
                                       f32_3 %543 = OpVectorShuffle %542 %542 0 1 2 
                                       f32_3 %544 = OpExtInst %1 29 %543 
                                       f32_4 %545 = OpLoad %120 
                                       f32_4 %546 = OpVectorShuffle %545 %544 4 5 6 3 
                                                      OpStore %120 %546 
                                       f32_4 %547 = OpLoad %120 
                                       f32_3 %548 = OpVectorShuffle %547 %547 0 1 2 
                                       f32_3 %551 = OpFMul %548 %550 
                                       f32_3 %554 = OpFAdd %551 %553 
                                       f32_4 %555 = OpLoad %120 
                                       f32_4 %556 = OpVectorShuffle %555 %554 4 5 6 3 
                                                      OpStore %120 %556 
                                       f32_4 %557 = OpLoad %120 
                                       f32_3 %558 = OpVectorShuffle %557 %557 0 1 2 
                                       f32_3 %559 = OpExtInst %1 40 %558 %529 
                                       f32_4 %560 = OpLoad %120 
                                       f32_4 %561 = OpVectorShuffle %560 %559 4 5 6 3 
                                                      OpStore %120 %561 
                                Uniform i32* %562 = OpAccessChain %18 %20 
                                         i32 %563 = OpLoad %562 
                                        bool %564 = OpINotEqual %563 %20 
                                                      OpSelectionMerge %568 None 
                                                      OpBranchConditional %564 %567 %571 
                                             %567 = OpLabel 
                                       f32_4 %569 = OpLoad %120 
                                       f32_3 %570 = OpVectorShuffle %569 %569 0 1 2 
                                                      OpStore %566 %570 
                                                      OpBranch %568 
                                             %571 = OpLabel 
                                       f32_4 %572 = OpLoad %517 
                                       f32_3 %573 = OpVectorShuffle %572 %572 0 1 2 
                                                      OpStore %566 %573 
                                                      OpBranch %568 
                                             %568 = OpLabel 
                                       f32_3 %574 = OpLoad %566 
                                                      OpStore %526 %574 
                                Private f32* %576 = OpAccessChain %517 %514 
                                         f32 %577 = OpLoad %576 
                                  Input f32* %579 = OpAccessChain %578 %514 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %577 %580 
                                                      OpStore %575 %581 
                                Private f32* %582 = OpAccessChain %9 %24 
                                         f32 %583 = OpLoad %582 
                                         f32 %584 = OpLoad %575 
                                         f32 %585 = OpFMul %583 %584 
                                Private f32* %586 = OpAccessChain %9 %24 
                                                      OpStore %586 %585 
                                       f32_3 %587 = OpLoad %246 
                                       f32_2 %588 = OpVectorShuffle %587 %587 0 2 
                                       f32_3 %589 = OpLoad %9 
                                       f32_2 %590 = OpVectorShuffle %589 %589 0 2 
                                       f32_2 %591 = OpFMul %588 %590 
                                       f32_3 %592 = OpLoad %9 
                                       f32_3 %593 = OpVectorShuffle %592 %591 3 1 4 
                                                      OpStore %9 %593 
                                Private f32* %594 = OpAccessChain %246 %200 
                                         f32 %595 = OpLoad %594 
                                Private f32* %596 = OpAccessChain %9 %24 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpFMul %595 %597 
                                Private f32* %599 = OpAccessChain %9 %24 
                                                      OpStore %599 %598 
                                Private f32* %602 = OpAccessChain %9 %24 
                                         f32 %603 = OpLoad %602 
                                 Output f32* %605 = OpAccessChain %601 %514 
                                                      OpStore %605 %603 
                                       f32_3 %606 = OpLoad %526 
                                       f32_4 %607 = OpLoad %578 
                                       f32_3 %608 = OpVectorShuffle %607 %607 0 1 2 
                                       f32_3 %609 = OpFMul %606 %608 
                                                      OpStore %526 %609 
                                       f32_3 %610 = OpLoad %9 
                                       f32_3 %611 = OpVectorShuffle %610 %610 2 2 2 
                                       f32_3 %612 = OpLoad %526 
                                       f32_3 %613 = OpFMul %611 %612 
                                                      OpStore %9 %613 
                                Uniform i32* %614 = OpAccessChain %18 %69 
                                         i32 %615 = OpLoad %614 
                                        bool %616 = OpINotEqual %615 %321 
                                                      OpStore %285 %616 
                                        bool %617 = OpLoad %285 
                                                      OpSelectionMerge %620 None 
                                                      OpBranchConditional %617 %619 %622 
                                             %619 = OpLabel 
                                       f32_3 %621 = OpLoad %9 
                                                      OpStore %618 %621 
                                                      OpBranch %620 
                                             %622 = OpLabel 
                                       f32_3 %623 = OpLoad %526 
                                                      OpStore %618 %623 
                                                      OpBranch %620 
                                             %620 = OpLabel 
                                       f32_3 %624 = OpLoad %618 
                                       f32_4 %625 = OpLoad %601 
                                       f32_4 %626 = OpVectorShuffle %625 %624 4 5 6 3 
                                                      OpStore %601 %626 
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
 Pass {
  Blend Zero Zero, Zero Zero
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 83701
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
uniform 	vec4 _MainTex_ST;
uniform 	vec4 hlslcc_mtx4x4unity_GUIClipTextureMatrix[4];
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat2;
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
    vs_COLOR0 = in_COLOR0;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat0.xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_MatrixV[3].xy * u_xlat0.ww + u_xlat0.xy;
    u_xlat2.xy = u_xlat0.yy * hlslcc_mtx4x4unity_GUIClipTextureMatrix[1].xy;
    u_xlat0.xy = hlslcc_mtx4x4unity_GUIClipTextureMatrix[0].xy * u_xlat0.xx + u_xlat2.xy;
    vs_TEXCOORD1.xy = u_xlat0.xy + hlslcc_mtx4x4unity_GUIClipTextureMatrix[3].xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD2 = in_POSITION0;
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
uniform 	int _ManualTex2SRGB;
uniform 	int _SrcBlend;
uniform 	float _CornerRadiuses[4];
uniform 	float _BorderWidths[4];
uniform 	float _Rect[4];
uniform 	int _SmoothCorners;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bvec2 u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
bvec2 u_xlatb1;
vec4 u_xlat2;
ivec2 u_xlati2;
vec3 u_xlat3;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
bvec3 u_xlatb6;
float u_xlat12;
bool u_xlatb12;
float u_xlat13;
bool u_xlatb13;
vec2 u_xlat15;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
int u_xlati19;
mediump float u_xlat16_23;
void main()
{
    u_xlat0.x = _BorderWidths[0];
    u_xlat1.x = _BorderWidths[2];
    u_xlat12 = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat12 = (-_Rect[2]) * 0.5 + u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0>=u_xlat12);
#else
    u_xlatb12 = 0.0>=u_xlat12;
#endif
    u_xlat18 = _Rect[0] + _Rect[2];
    u_xlat13 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat13 = (-_Rect[3]) * 0.5 + u_xlat13;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0>=u_xlat13);
#else
    u_xlatb13 = 0.0>=u_xlat13;
#endif
    u_xlati2.xy = (bool(u_xlatb13)) ? ivec2(0, 1) : ivec2(3, 2);
    u_xlati19 = (u_xlatb12) ? u_xlati2.x : u_xlati2.y;
    u_xlat1.y = u_xlat18 + (-_CornerRadiuses[u_xlati19]);
    u_xlat0.y = _Rect[0] + _CornerRadiuses[u_xlati19];
    u_xlat2.xy = (bool(u_xlatb12)) ? u_xlat0.xy : u_xlat1.xy;
    u_xlat15.x = _BorderWidths[1];
    u_xlat16.x = _BorderWidths[3];
    u_xlat0.x = _Rect[1] + _Rect[3];
    u_xlat16.y = u_xlat0.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat15.y = _Rect[1] + _CornerRadiuses[u_xlati19];
    u_xlat2.zw = (bool(u_xlatb13)) ? u_xlat15.xy : u_xlat16.xy;
    u_xlat0.xy = (-u_xlat2.xz) + vec2(_CornerRadiuses[u_xlati19]);
    u_xlat18 = u_xlat0.x / u_xlat0.y;
    u_xlat3.xy = (-u_xlat2.yw) + vs_TEXCOORD2.xy;
    u_xlat3.z = u_xlat18 * u_xlat3.y;
    u_xlat18 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat1.x = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = u_xlat1.x + (-_CornerRadiuses[u_xlati19]);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = (-u_xlat0.x) + u_xlat18;
    u_xlatb0.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat0.xyxx).xy;
    u_xlatb0.x = u_xlatb0.y && u_xlatb0.x;
    u_xlat6.x = dFdx(vs_TEXCOORD2.x);
    u_xlat6.x = float(1.0) / abs(u_xlat6.x);
    u_xlat18 = u_xlat18 * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat18 = min(max(u_xlat18, 0.0), 1.0);
#else
    u_xlat18 = clamp(u_xlat18, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat1.x * u_xlat6.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat0.x = (u_xlatb0.x) ? u_xlat18 : 1.0;
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat2.xzxx).xy;
    u_xlatb18 = u_xlatb1.y || u_xlatb1.x;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
    u_xlat6.x = u_xlatb18 ? u_xlat6.x : float(0.0);
    u_xlat18 = (-u_xlat6.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6.x = !!(u_xlat6.x==0.0);
#else
    u_xlatb6.x = u_xlat6.x==0.0;
#endif
    u_xlat18 = (_SmoothCorners != 0) ? u_xlat18 : 0.0;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : u_xlat18;
    u_xlatb6.xz = greaterThanEqual(u_xlat2.yyww, vs_TEXCOORD2.xxyy).xz;
    u_xlatb1.xy = greaterThanEqual(vs_TEXCOORD2.xyxx, u_xlat2.ywyy).xy;
    u_xlatb6.x = (u_xlatb12) ? u_xlatb6.x : u_xlatb1.x;
    u_xlatb12 = (u_xlatb13) ? u_xlatb6.z : u_xlatb1.y;
    u_xlatb6.x = u_xlatb12 && u_xlatb6.x;
    u_xlat0.x = (u_xlatb6.x) ? u_xlat0.x : 1.0;
    u_xlat12 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat12 = (-u_xlat12) + _Rect[2];
    u_xlat18 = _BorderWidths[0] + _Rect[0];
    u_xlat12 = u_xlat12 + u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(vs_TEXCOORD2.x>=u_xlat18);
#else
    u_xlatb18 = vs_TEXCOORD2.x>=u_xlat18;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat12>=vs_TEXCOORD2.x);
#else
    u_xlatb12 = u_xlat12>=vs_TEXCOORD2.x;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb18;
    u_xlat18 = _BorderWidths[1] + _Rect[1];
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(vs_TEXCOORD2.y>=u_xlat18);
#else
    u_xlatb1.x = vs_TEXCOORD2.y>=u_xlat18;
#endif
    u_xlatb12 = u_xlatb12 && u_xlatb1.x;
    u_xlat1.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat1.x = (-u_xlat1.x) + _Rect[3];
    u_xlat18 = u_xlat18 + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=vs_TEXCOORD2.y);
#else
    u_xlatb18 = u_xlat18>=vs_TEXCOORD2.y;
#endif
    u_xlatb12 = u_xlatb18 && u_xlatb12;
    u_xlat12 = (u_xlatb12) ? 0.0 : 1.0;
    u_xlat6.x = (u_xlatb6.x) ? 1.0 : u_xlat12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(0.0<_BorderWidths[0]);
#else
    u_xlatb12 = 0.0<_BorderWidths[0];
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[1]);
#else
    u_xlatb18 = 0.0<_BorderWidths[1];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[2]);
#else
    u_xlatb18 = 0.0<_BorderWidths[2];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_BorderWidths[3]);
#else
    u_xlatb18 = 0.0<_BorderWidths[3];
#endif
    u_xlatb12 = u_xlatb18 || u_xlatb12;
    u_xlat6.x = (u_xlatb12) ? u_xlat6.x : 1.0;
    u_xlat0.z = u_xlat6.x * u_xlat0.x;
    u_xlat6.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_5.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_5.xyz = (_ManualTex2SRGB != 0) ? u_xlat2.xyz : u_xlat16_1.xyz;
    u_xlat16_23 = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat0.x = u_xlat0.x * u_xlat16_23;
    u_xlat0.xz = u_xlat6.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat6.z * u_xlat0.x;
    SV_Target0.w = u_xlat0.x;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.zzz * u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(_SrcBlend!=5);
#else
    u_xlatb18 = _SrcBlend!=5;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 628
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %511 %523 %578 %601 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %502 DescriptorSet 502 
                                                      OpDecorate %502 Binding 502 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %506 DescriptorSet 506 
                                                      OpDecorate %506 Binding 506 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 511 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate %518 DescriptorSet 518 
                                                      OpDecorate %518 Binding 518 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %520 DescriptorSet 520 
                                                      OpDecorate %520 Binding 520 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 523 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %572 RelaxedPrecision 
                                                      OpDecorate %573 RelaxedPrecision 
                                                      OpDecorate %575 RelaxedPrecision 
                                                      OpDecorate %577 RelaxedPrecision 
                                                      OpDecorate %578 RelaxedPrecision 
                                                      OpDecorate %578 Location 578 
                                                      OpDecorate %580 RelaxedPrecision 
                                                      OpDecorate %581 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %601 RelaxedPrecision 
                                                      OpDecorate %601 Location 601 
                                                      OpDecorate %606 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 %10 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; i32;}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %314 = OpTypeVector %53 3 
                                             %315 = OpTypePointer Private %314 
                             Private bool_3* %316 = OpVariable Private 
                                         i32 %321 = OpConstant 5 
                                             %322 = OpTypePointer Uniform %10 
                                             %354 = OpTypePointer Function %53 
                                             %500 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %501 = OpTypePointer UniformConstant %500 
        UniformConstant read_only Texture2D* %502 = OpVariable UniformConstant 
                                             %504 = OpTypeSampler 
                                             %505 = OpTypePointer UniformConstant %504 
                    UniformConstant sampler* %506 = OpVariable UniformConstant 
                                             %508 = OpTypeSampledImage %500 
                                             %510 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %514 = OpConstant 3 
                              Private f32_4* %517 = OpVariable Private 
        UniformConstant read_only Texture2D* %518 = OpVariable UniformConstant 
                    UniformConstant sampler* %520 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %526 = OpVariable Private 
                                       f32_3 %529 = OpConstantComposite %56 %56 %56 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                         f32 %549 = OpConstant 3.674022E-40 
                                       f32_3 %550 = OpConstantComposite %549 %549 %549 
                                         f32 %552 = OpConstant 3.674022E-40 
                                       f32_3 %553 = OpConstantComposite %552 %552 %552 
                                             %565 = OpTypePointer Function %7 
                                Private f32* %575 = OpVariable Private 
                                Input f32_4* %578 = OpVariable Input 
                                             %600 = OpTypePointer Output %35 
                               Output f32_4* %601 = OpVariable Output 
                                             %604 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %330 = OpVariable Function 
                              Function bool* %355 = OpVariable Function 
                              Function bool* %366 = OpVariable Function 
                               Function f32* %382 = OpVariable Function 
                               Function f32* %486 = OpVariable Function 
                             Function f32_3* %566 = OpVariable Function 
                             Function f32_3* %618 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFNegate %311 
                                         f32 %313 = OpFAdd %312 %251 
                                                      OpStore %59 %313 
                                Private f32* %317 = OpAccessChain %246 %24 
                                         f32 %318 = OpLoad %317 
                                        bool %319 = OpFOrdEqual %318 %56 
                               Private bool* %320 = OpAccessChain %316 %24 
                                                      OpStore %320 %319 
                                Uniform i32* %323 = OpAccessChain %18 %321 
                                         i32 %324 = OpLoad %323 
                                        bool %325 = OpINotEqual %324 %20 
                                         f32 %326 = OpLoad %59 
                                         f32 %327 = OpSelect %325 %326 %56 
                                                      OpStore %59 %327 
                               Private bool* %328 = OpAccessChain %316 %24 
                                        bool %329 = OpLoad %328 
                                                      OpSelectionMerge %332 None 
                                                      OpBranchConditional %329 %331 %335 
                                             %331 = OpLabel 
                                Private f32* %333 = OpAccessChain %9 %24 
                                         f32 %334 = OpLoad %333 
                                                      OpStore %330 %334 
                                                      OpBranch %332 
                                             %335 = OpLabel 
                                         f32 %336 = OpLoad %59 
                                                      OpStore %330 %336 
                                                      OpBranch %332 
                                             %332 = OpLabel 
                                         f32 %337 = OpLoad %330 
                                Private f32* %338 = OpAccessChain %9 %24 
                                                      OpStore %338 %337 
                                       f32_4 %339 = OpLoad %120 
                                       f32_4 %340 = OpVectorShuffle %339 %339 1 1 3 3 
                                       f32_4 %341 = OpLoad vs_TEXCOORD2 
                                       f32_4 %342 = OpVectorShuffle %341 %341 0 0 1 1 
                                      bool_4 %343 = OpFOrdGreaterThanEqual %340 %342 
                                      bool_2 %344 = OpVectorShuffle %343 %343 0 2 
                                      bool_3 %345 = OpLoad %316 
                                      bool_3 %346 = OpVectorShuffle %345 %344 3 1 4 
                                                      OpStore %316 %346 
                                       f32_4 %347 = OpLoad vs_TEXCOORD2 
                                       f32_4 %348 = OpVectorShuffle %347 %347 0 1 0 0 
                                       f32_4 %349 = OpLoad %120 
                                       f32_4 %350 = OpVectorShuffle %349 %349 1 3 1 1 
                                      bool_4 %351 = OpFOrdGreaterThanEqual %348 %350 
                                      bool_2 %352 = OpVectorShuffle %351 %351 0 1 
                                                      OpStore %280 %352 
                                        bool %353 = OpLoad %55 
                                                      OpSelectionMerge %357 None 
                                                      OpBranchConditional %353 %356 %360 
                                             %356 = OpLabel 
                               Private bool* %358 = OpAccessChain %316 %24 
                                        bool %359 = OpLoad %358 
                                                      OpStore %355 %359 
                                                      OpBranch %357 
                                             %360 = OpLabel 
                               Private bool* %361 = OpAccessChain %280 %24 
                                        bool %362 = OpLoad %361 
                                                      OpStore %355 %362 
                                                      OpBranch %357 
                                             %357 = OpLabel 
                                        bool %363 = OpLoad %355 
                               Private bool* %364 = OpAccessChain %316 %24 
                                                      OpStore %364 %363 
                                        bool %365 = OpLoad %80 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %365 %367 %371 
                                             %367 = OpLabel 
                               Private bool* %369 = OpAccessChain %316 %200 
                                        bool %370 = OpLoad %369 
                                                      OpStore %366 %370 
                                                      OpBranch %368 
                                             %371 = OpLabel 
                               Private bool* %372 = OpAccessChain %280 %66 
                                        bool %373 = OpLoad %372 
                                                      OpStore %366 %373 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                        bool %374 = OpLoad %366 
                                                      OpStore %55 %374 
                                        bool %375 = OpLoad %55 
                               Private bool* %376 = OpAccessChain %316 %24 
                                        bool %377 = OpLoad %376 
                                        bool %378 = OpLogicalAnd %375 %377 
                               Private bool* %379 = OpAccessChain %316 %24 
                                                      OpStore %379 %378 
                               Private bool* %380 = OpAccessChain %316 %24 
                                        bool %381 = OpLoad %380 
                                                      OpSelectionMerge %384 None 
                                                      OpBranchConditional %381 %383 %387 
                                             %383 = OpLabel 
                                Private f32* %385 = OpAccessChain %9 %24 
                                         f32 %386 = OpLoad %385 
                                                      OpStore %382 %386 
                                                      OpBranch %384 
                                             %387 = OpLabel 
                                                      OpStore %382 %251 
                                                      OpBranch %384 
                                             %384 = OpLabel 
                                         f32 %388 = OpLoad %382 
                                Private f32* %389 = OpAccessChain %9 %24 
                                                      OpStore %389 %388 
                                Uniform f32* %390 = OpAccessChain %18 %19 %20 
                                         f32 %391 = OpLoad %390 
                                Uniform f32* %392 = OpAccessChain %18 %19 %30 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFAdd %391 %393 
                                                      OpStore %34 %394 
                                         f32 %395 = OpLoad %34 
                                         f32 %396 = OpFNegate %395 
                                Uniform f32* %397 = OpAccessChain %18 %41 %30 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFAdd %396 %398 
                                                      OpStore %34 %399 
                                Uniform f32* %400 = OpAccessChain %18 %19 %20 
                                         f32 %401 = OpLoad %400 
                                Uniform f32* %402 = OpAccessChain %18 %41 %20 
                                         f32 %403 = OpLoad %402 
                                         f32 %404 = OpFAdd %401 %403 
                                                      OpStore %59 %404 
                                         f32 %405 = OpLoad %34 
                                         f32 %406 = OpLoad %59 
                                         f32 %407 = OpFAdd %405 %406 
                                                      OpStore %34 %407 
                                  Input f32* %408 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpLoad %59 
                                        bool %411 = OpFOrdGreaterThanEqual %409 %410 
                                                      OpStore %285 %411 
                                         f32 %412 = OpLoad %34 
                                  Input f32* %413 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %414 = OpLoad %413 
                                        bool %415 = OpFOrdGreaterThanEqual %412 %414 
                                                      OpStore %55 %415 
                                        bool %416 = OpLoad %55 
                                        bool %417 = OpLoad %285 
                                        bool %418 = OpLogicalAnd %416 %417 
                                                      OpStore %55 %418 
                                Uniform f32* %419 = OpAccessChain %18 %19 %69 
                                         f32 %420 = OpLoad %419 
                                Uniform f32* %421 = OpAccessChain %18 %41 %69 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFAdd %420 %422 
                                                      OpStore %59 %423 
                                  Input f32* %424 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %425 = OpLoad %424 
                                         f32 %426 = OpLoad %59 
                                        bool %427 = OpFOrdGreaterThanEqual %425 %426 
                               Private bool* %428 = OpAccessChain %280 %24 
                                                      OpStore %428 %427 
                                        bool %429 = OpLoad %55 
                               Private bool* %430 = OpAccessChain %280 %24 
                                        bool %431 = OpLoad %430 
                                        bool %432 = OpLogicalAnd %429 %431 
                                                      OpStore %55 %432 
                                Uniform f32* %433 = OpAccessChain %18 %19 %69 
                                         f32 %434 = OpLoad %433 
                                Uniform f32* %435 = OpAccessChain %18 %19 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                Private f32* %439 = OpAccessChain %29 %24 
                                         f32 %440 = OpLoad %439 
                                         f32 %441 = OpFNegate %440 
                                Uniform f32* %442 = OpAccessChain %18 %41 %19 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFAdd %441 %443 
                                Private f32* %445 = OpAccessChain %29 %24 
                                                      OpStore %445 %444 
                                         f32 %446 = OpLoad %59 
                                Private f32* %447 = OpAccessChain %29 %24 
                                         f32 %448 = OpLoad %447 
                                         f32 %449 = OpFAdd %446 %448 
                                                      OpStore %59 %449 
                                         f32 %450 = OpLoad %59 
                                  Input f32* %451 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %452 = OpLoad %451 
                                        bool %453 = OpFOrdGreaterThanEqual %450 %452 
                                                      OpStore %285 %453 
                                        bool %454 = OpLoad %285 
                                        bool %455 = OpLoad %55 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %55 %456 
                                        bool %457 = OpLoad %55 
                                         f32 %458 = OpSelect %457 %56 %251 
                                                      OpStore %34 %458 
                               Private bool* %459 = OpAccessChain %316 %24 
                                        bool %460 = OpLoad %459 
                                         f32 %461 = OpLoad %34 
                                         f32 %462 = OpSelect %460 %251 %461 
                                Private f32* %463 = OpAccessChain %246 %24 
                                                      OpStore %463 %462 
                                Uniform f32* %464 = OpAccessChain %18 %19 %20 
                                         f32 %465 = OpLoad %464 
                                        bool %466 = OpFOrdLessThan %56 %465 
                                                      OpStore %55 %466 
                                Uniform f32* %467 = OpAccessChain %18 %19 %69 
                                         f32 %468 = OpLoad %467 
                                        bool %469 = OpFOrdLessThan %56 %468 
                                                      OpStore %285 %469 
                                        bool %470 = OpLoad %285 
                                        bool %471 = OpLoad %55 
                                        bool %472 = OpLogicalOr %470 %471 
                                                      OpStore %55 %472 
                                Uniform f32* %473 = OpAccessChain %18 %19 %30 
                                         f32 %474 = OpLoad %473 
                                        bool %475 = OpFOrdLessThan %56 %474 
                                                      OpStore %285 %475 
                                        bool %476 = OpLoad %285 
                                        bool %477 = OpLoad %55 
                                        bool %478 = OpLogicalOr %476 %477 
                                                      OpStore %55 %478 
                                Uniform f32* %479 = OpAccessChain %18 %19 %19 
                                         f32 %480 = OpLoad %479 
                                        bool %481 = OpFOrdLessThan %56 %480 
                                                      OpStore %285 %481 
                                        bool %482 = OpLoad %285 
                                        bool %483 = OpLoad %55 
                                        bool %484 = OpLogicalOr %482 %483 
                                                      OpStore %55 %484 
                                        bool %485 = OpLoad %55 
                                                      OpSelectionMerge %488 None 
                                                      OpBranchConditional %485 %487 %491 
                                             %487 = OpLabel 
                                Private f32* %489 = OpAccessChain %246 %24 
                                         f32 %490 = OpLoad %489 
                                                      OpStore %486 %490 
                                                      OpBranch %488 
                                             %491 = OpLabel 
                                                      OpStore %486 %251 
                                                      OpBranch %488 
                                             %488 = OpLabel 
                                         f32 %492 = OpLoad %486 
                                Private f32* %493 = OpAccessChain %246 %24 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %246 %24 
                                         f32 %495 = OpLoad %494 
                                Private f32* %496 = OpAccessChain %9 %24 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpFMul %495 %497 
                                Private f32* %499 = OpAccessChain %9 %200 
                                                      OpStore %499 %498 
                         read_only Texture2D %503 = OpLoad %502 
                                     sampler %507 = OpLoad %506 
                  read_only Texture2DSampled %509 = OpSampledImage %503 %507 
                                       f32_2 %512 = OpLoad vs_TEXCOORD1 
                                       f32_4 %513 = OpImageSampleImplicitLod %509 %512 
                                         f32 %515 = OpCompositeExtract %513 3 
                                Private f32* %516 = OpAccessChain %246 %200 
                                                      OpStore %516 %515 
                         read_only Texture2D %519 = OpLoad %518 
                                     sampler %521 = OpLoad %520 
                  read_only Texture2DSampled %522 = OpSampledImage %519 %521 
                                       f32_2 %524 = OpLoad vs_TEXCOORD0 
                                       f32_4 %525 = OpImageSampleImplicitLod %522 %524 
                                                      OpStore %517 %525 
                                       f32_4 %527 = OpLoad %517 
                                       f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
                                       f32_3 %530 = OpExtInst %1 40 %528 %529 
                                                      OpStore %526 %530 
                                       f32_3 %531 = OpLoad %526 
                                       f32_3 %532 = OpExtInst %1 30 %531 
                                       f32_4 %533 = OpLoad %120 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %120 %534 
                                       f32_4 %535 = OpLoad %120 
                                       f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
                                       f32_3 %539 = OpFMul %536 %538 
                                       f32_4 %540 = OpLoad %120 
                                       f32_4 %541 = OpVectorShuffle %540 %539 4 5 6 3 
                                                      OpStore %120 %541 
                                       f32_4 %542 = OpLoad %120 
                                       f32_3 %543 = OpVectorShuffle %542 %542 0 1 2 
                                       f32_3 %544 = OpExtInst %1 29 %543 
                                       f32_4 %545 = OpLoad %120 
                                       f32_4 %546 = OpVectorShuffle %545 %544 4 5 6 3 
                                                      OpStore %120 %546 
                                       f32_4 %547 = OpLoad %120 
                                       f32_3 %548 = OpVectorShuffle %547 %547 0 1 2 
                                       f32_3 %551 = OpFMul %548 %550 
                                       f32_3 %554 = OpFAdd %551 %553 
                                       f32_4 %555 = OpLoad %120 
                                       f32_4 %556 = OpVectorShuffle %555 %554 4 5 6 3 
                                                      OpStore %120 %556 
                                       f32_4 %557 = OpLoad %120 
                                       f32_3 %558 = OpVectorShuffle %557 %557 0 1 2 
                                       f32_3 %559 = OpExtInst %1 40 %558 %529 
                                       f32_4 %560 = OpLoad %120 
                                       f32_4 %561 = OpVectorShuffle %560 %559 4 5 6 3 
                                                      OpStore %120 %561 
                                Uniform i32* %562 = OpAccessChain %18 %20 
                                         i32 %563 = OpLoad %562 
                                        bool %564 = OpINotEqual %563 %20 
                                                      OpSelectionMerge %568 None 
                                                      OpBranchConditional %564 %567 %571 
                                             %567 = OpLabel 
                                       f32_4 %569 = OpLoad %120 
                                       f32_3 %570 = OpVectorShuffle %569 %569 0 1 2 
                                                      OpStore %566 %570 
                                                      OpBranch %568 
                                             %571 = OpLabel 
                                       f32_4 %572 = OpLoad %517 
                                       f32_3 %573 = OpVectorShuffle %572 %572 0 1 2 
                                                      OpStore %566 %573 
                                                      OpBranch %568 
                                             %568 = OpLabel 
                                       f32_3 %574 = OpLoad %566 
                                                      OpStore %526 %574 
                                Private f32* %576 = OpAccessChain %517 %514 
                                         f32 %577 = OpLoad %576 
                                  Input f32* %579 = OpAccessChain %578 %514 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %577 %580 
                                                      OpStore %575 %581 
                                Private f32* %582 = OpAccessChain %9 %24 
                                         f32 %583 = OpLoad %582 
                                         f32 %584 = OpLoad %575 
                                         f32 %585 = OpFMul %583 %584 
                                Private f32* %586 = OpAccessChain %9 %24 
                                                      OpStore %586 %585 
                                       f32_3 %587 = OpLoad %246 
                                       f32_2 %588 = OpVectorShuffle %587 %587 0 2 
                                       f32_3 %589 = OpLoad %9 
                                       f32_2 %590 = OpVectorShuffle %589 %589 0 2 
                                       f32_2 %591 = OpFMul %588 %590 
                                       f32_3 %592 = OpLoad %9 
                                       f32_3 %593 = OpVectorShuffle %592 %591 3 1 4 
                                                      OpStore %9 %593 
                                Private f32* %594 = OpAccessChain %246 %200 
                                         f32 %595 = OpLoad %594 
                                Private f32* %596 = OpAccessChain %9 %24 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpFMul %595 %597 
                                Private f32* %599 = OpAccessChain %9 %24 
                                                      OpStore %599 %598 
                                Private f32* %602 = OpAccessChain %9 %24 
                                         f32 %603 = OpLoad %602 
                                 Output f32* %605 = OpAccessChain %601 %514 
                                                      OpStore %605 %603 
                                       f32_3 %606 = OpLoad %526 
                                       f32_4 %607 = OpLoad %578 
                                       f32_3 %608 = OpVectorShuffle %607 %607 0 1 2 
                                       f32_3 %609 = OpFMul %606 %608 
                                                      OpStore %526 %609 
                                       f32_3 %610 = OpLoad %9 
                                       f32_3 %611 = OpVectorShuffle %610 %610 2 2 2 
                                       f32_3 %612 = OpLoad %526 
                                       f32_3 %613 = OpFMul %611 %612 
                                                      OpStore %9 %613 
                                Uniform i32* %614 = OpAccessChain %18 %69 
                                         i32 %615 = OpLoad %614 
                                        bool %616 = OpINotEqual %615 %321 
                                                      OpStore %285 %616 
                                        bool %617 = OpLoad %285 
                                                      OpSelectionMerge %620 None 
                                                      OpBranchConditional %617 %619 %622 
                                             %619 = OpLabel 
                                       f32_3 %621 = OpLoad %9 
                                                      OpStore %618 %621 
                                                      OpBranch %620 
                                             %622 = OpLabel 
                                       f32_3 %623 = OpLoad %526 
                                                      OpStore %618 %623 
                                                      OpBranch %620 
                                             %620 = OpLabel 
                                       f32_3 %624 = OpLoad %618 
                                       f32_4 %625 = OpLoad %601 
                                       f32_4 %626 = OpVectorShuffle %625 %624 4 5 6 3 
                                                      OpStore %601 %626 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 628
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %511 %523 %578 %601 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %502 DescriptorSet 502 
                                                      OpDecorate %502 Binding 502 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %506 DescriptorSet 506 
                                                      OpDecorate %506 Binding 506 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 511 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate %518 DescriptorSet 518 
                                                      OpDecorate %518 Binding 518 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %520 DescriptorSet 520 
                                                      OpDecorate %520 Binding 520 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 523 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %572 RelaxedPrecision 
                                                      OpDecorate %573 RelaxedPrecision 
                                                      OpDecorate %575 RelaxedPrecision 
                                                      OpDecorate %577 RelaxedPrecision 
                                                      OpDecorate %578 RelaxedPrecision 
                                                      OpDecorate %578 Location 578 
                                                      OpDecorate %580 RelaxedPrecision 
                                                      OpDecorate %581 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %601 RelaxedPrecision 
                                                      OpDecorate %601 Location 601 
                                                      OpDecorate %606 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 %10 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; i32;}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %314 = OpTypeVector %53 3 
                                             %315 = OpTypePointer Private %314 
                             Private bool_3* %316 = OpVariable Private 
                                         i32 %321 = OpConstant 5 
                                             %322 = OpTypePointer Uniform %10 
                                             %354 = OpTypePointer Function %53 
                                             %500 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %501 = OpTypePointer UniformConstant %500 
        UniformConstant read_only Texture2D* %502 = OpVariable UniformConstant 
                                             %504 = OpTypeSampler 
                                             %505 = OpTypePointer UniformConstant %504 
                    UniformConstant sampler* %506 = OpVariable UniformConstant 
                                             %508 = OpTypeSampledImage %500 
                                             %510 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %514 = OpConstant 3 
                              Private f32_4* %517 = OpVariable Private 
        UniformConstant read_only Texture2D* %518 = OpVariable UniformConstant 
                    UniformConstant sampler* %520 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %526 = OpVariable Private 
                                       f32_3 %529 = OpConstantComposite %56 %56 %56 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                         f32 %549 = OpConstant 3.674022E-40 
                                       f32_3 %550 = OpConstantComposite %549 %549 %549 
                                         f32 %552 = OpConstant 3.674022E-40 
                                       f32_3 %553 = OpConstantComposite %552 %552 %552 
                                             %565 = OpTypePointer Function %7 
                                Private f32* %575 = OpVariable Private 
                                Input f32_4* %578 = OpVariable Input 
                                             %600 = OpTypePointer Output %35 
                               Output f32_4* %601 = OpVariable Output 
                                             %604 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %330 = OpVariable Function 
                              Function bool* %355 = OpVariable Function 
                              Function bool* %366 = OpVariable Function 
                               Function f32* %382 = OpVariable Function 
                               Function f32* %486 = OpVariable Function 
                             Function f32_3* %566 = OpVariable Function 
                             Function f32_3* %618 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFNegate %311 
                                         f32 %313 = OpFAdd %312 %251 
                                                      OpStore %59 %313 
                                Private f32* %317 = OpAccessChain %246 %24 
                                         f32 %318 = OpLoad %317 
                                        bool %319 = OpFOrdEqual %318 %56 
                               Private bool* %320 = OpAccessChain %316 %24 
                                                      OpStore %320 %319 
                                Uniform i32* %323 = OpAccessChain %18 %321 
                                         i32 %324 = OpLoad %323 
                                        bool %325 = OpINotEqual %324 %20 
                                         f32 %326 = OpLoad %59 
                                         f32 %327 = OpSelect %325 %326 %56 
                                                      OpStore %59 %327 
                               Private bool* %328 = OpAccessChain %316 %24 
                                        bool %329 = OpLoad %328 
                                                      OpSelectionMerge %332 None 
                                                      OpBranchConditional %329 %331 %335 
                                             %331 = OpLabel 
                                Private f32* %333 = OpAccessChain %9 %24 
                                         f32 %334 = OpLoad %333 
                                                      OpStore %330 %334 
                                                      OpBranch %332 
                                             %335 = OpLabel 
                                         f32 %336 = OpLoad %59 
                                                      OpStore %330 %336 
                                                      OpBranch %332 
                                             %332 = OpLabel 
                                         f32 %337 = OpLoad %330 
                                Private f32* %338 = OpAccessChain %9 %24 
                                                      OpStore %338 %337 
                                       f32_4 %339 = OpLoad %120 
                                       f32_4 %340 = OpVectorShuffle %339 %339 1 1 3 3 
                                       f32_4 %341 = OpLoad vs_TEXCOORD2 
                                       f32_4 %342 = OpVectorShuffle %341 %341 0 0 1 1 
                                      bool_4 %343 = OpFOrdGreaterThanEqual %340 %342 
                                      bool_2 %344 = OpVectorShuffle %343 %343 0 2 
                                      bool_3 %345 = OpLoad %316 
                                      bool_3 %346 = OpVectorShuffle %345 %344 3 1 4 
                                                      OpStore %316 %346 
                                       f32_4 %347 = OpLoad vs_TEXCOORD2 
                                       f32_4 %348 = OpVectorShuffle %347 %347 0 1 0 0 
                                       f32_4 %349 = OpLoad %120 
                                       f32_4 %350 = OpVectorShuffle %349 %349 1 3 1 1 
                                      bool_4 %351 = OpFOrdGreaterThanEqual %348 %350 
                                      bool_2 %352 = OpVectorShuffle %351 %351 0 1 
                                                      OpStore %280 %352 
                                        bool %353 = OpLoad %55 
                                                      OpSelectionMerge %357 None 
                                                      OpBranchConditional %353 %356 %360 
                                             %356 = OpLabel 
                               Private bool* %358 = OpAccessChain %316 %24 
                                        bool %359 = OpLoad %358 
                                                      OpStore %355 %359 
                                                      OpBranch %357 
                                             %360 = OpLabel 
                               Private bool* %361 = OpAccessChain %280 %24 
                                        bool %362 = OpLoad %361 
                                                      OpStore %355 %362 
                                                      OpBranch %357 
                                             %357 = OpLabel 
                                        bool %363 = OpLoad %355 
                               Private bool* %364 = OpAccessChain %316 %24 
                                                      OpStore %364 %363 
                                        bool %365 = OpLoad %80 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %365 %367 %371 
                                             %367 = OpLabel 
                               Private bool* %369 = OpAccessChain %316 %200 
                                        bool %370 = OpLoad %369 
                                                      OpStore %366 %370 
                                                      OpBranch %368 
                                             %371 = OpLabel 
                               Private bool* %372 = OpAccessChain %280 %66 
                                        bool %373 = OpLoad %372 
                                                      OpStore %366 %373 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                        bool %374 = OpLoad %366 
                                                      OpStore %55 %374 
                                        bool %375 = OpLoad %55 
                               Private bool* %376 = OpAccessChain %316 %24 
                                        bool %377 = OpLoad %376 
                                        bool %378 = OpLogicalAnd %375 %377 
                               Private bool* %379 = OpAccessChain %316 %24 
                                                      OpStore %379 %378 
                               Private bool* %380 = OpAccessChain %316 %24 
                                        bool %381 = OpLoad %380 
                                                      OpSelectionMerge %384 None 
                                                      OpBranchConditional %381 %383 %387 
                                             %383 = OpLabel 
                                Private f32* %385 = OpAccessChain %9 %24 
                                         f32 %386 = OpLoad %385 
                                                      OpStore %382 %386 
                                                      OpBranch %384 
                                             %387 = OpLabel 
                                                      OpStore %382 %251 
                                                      OpBranch %384 
                                             %384 = OpLabel 
                                         f32 %388 = OpLoad %382 
                                Private f32* %389 = OpAccessChain %9 %24 
                                                      OpStore %389 %388 
                                Uniform f32* %390 = OpAccessChain %18 %19 %20 
                                         f32 %391 = OpLoad %390 
                                Uniform f32* %392 = OpAccessChain %18 %19 %30 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFAdd %391 %393 
                                                      OpStore %34 %394 
                                         f32 %395 = OpLoad %34 
                                         f32 %396 = OpFNegate %395 
                                Uniform f32* %397 = OpAccessChain %18 %41 %30 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFAdd %396 %398 
                                                      OpStore %34 %399 
                                Uniform f32* %400 = OpAccessChain %18 %19 %20 
                                         f32 %401 = OpLoad %400 
                                Uniform f32* %402 = OpAccessChain %18 %41 %20 
                                         f32 %403 = OpLoad %402 
                                         f32 %404 = OpFAdd %401 %403 
                                                      OpStore %59 %404 
                                         f32 %405 = OpLoad %34 
                                         f32 %406 = OpLoad %59 
                                         f32 %407 = OpFAdd %405 %406 
                                                      OpStore %34 %407 
                                  Input f32* %408 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpLoad %59 
                                        bool %411 = OpFOrdGreaterThanEqual %409 %410 
                                                      OpStore %285 %411 
                                         f32 %412 = OpLoad %34 
                                  Input f32* %413 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %414 = OpLoad %413 
                                        bool %415 = OpFOrdGreaterThanEqual %412 %414 
                                                      OpStore %55 %415 
                                        bool %416 = OpLoad %55 
                                        bool %417 = OpLoad %285 
                                        bool %418 = OpLogicalAnd %416 %417 
                                                      OpStore %55 %418 
                                Uniform f32* %419 = OpAccessChain %18 %19 %69 
                                         f32 %420 = OpLoad %419 
                                Uniform f32* %421 = OpAccessChain %18 %41 %69 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFAdd %420 %422 
                                                      OpStore %59 %423 
                                  Input f32* %424 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %425 = OpLoad %424 
                                         f32 %426 = OpLoad %59 
                                        bool %427 = OpFOrdGreaterThanEqual %425 %426 
                               Private bool* %428 = OpAccessChain %280 %24 
                                                      OpStore %428 %427 
                                        bool %429 = OpLoad %55 
                               Private bool* %430 = OpAccessChain %280 %24 
                                        bool %431 = OpLoad %430 
                                        bool %432 = OpLogicalAnd %429 %431 
                                                      OpStore %55 %432 
                                Uniform f32* %433 = OpAccessChain %18 %19 %69 
                                         f32 %434 = OpLoad %433 
                                Uniform f32* %435 = OpAccessChain %18 %19 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                Private f32* %439 = OpAccessChain %29 %24 
                                         f32 %440 = OpLoad %439 
                                         f32 %441 = OpFNegate %440 
                                Uniform f32* %442 = OpAccessChain %18 %41 %19 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFAdd %441 %443 
                                Private f32* %445 = OpAccessChain %29 %24 
                                                      OpStore %445 %444 
                                         f32 %446 = OpLoad %59 
                                Private f32* %447 = OpAccessChain %29 %24 
                                         f32 %448 = OpLoad %447 
                                         f32 %449 = OpFAdd %446 %448 
                                                      OpStore %59 %449 
                                         f32 %450 = OpLoad %59 
                                  Input f32* %451 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %452 = OpLoad %451 
                                        bool %453 = OpFOrdGreaterThanEqual %450 %452 
                                                      OpStore %285 %453 
                                        bool %454 = OpLoad %285 
                                        bool %455 = OpLoad %55 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %55 %456 
                                        bool %457 = OpLoad %55 
                                         f32 %458 = OpSelect %457 %56 %251 
                                                      OpStore %34 %458 
                               Private bool* %459 = OpAccessChain %316 %24 
                                        bool %460 = OpLoad %459 
                                         f32 %461 = OpLoad %34 
                                         f32 %462 = OpSelect %460 %251 %461 
                                Private f32* %463 = OpAccessChain %246 %24 
                                                      OpStore %463 %462 
                                Uniform f32* %464 = OpAccessChain %18 %19 %20 
                                         f32 %465 = OpLoad %464 
                                        bool %466 = OpFOrdLessThan %56 %465 
                                                      OpStore %55 %466 
                                Uniform f32* %467 = OpAccessChain %18 %19 %69 
                                         f32 %468 = OpLoad %467 
                                        bool %469 = OpFOrdLessThan %56 %468 
                                                      OpStore %285 %469 
                                        bool %470 = OpLoad %285 
                                        bool %471 = OpLoad %55 
                                        bool %472 = OpLogicalOr %470 %471 
                                                      OpStore %55 %472 
                                Uniform f32* %473 = OpAccessChain %18 %19 %30 
                                         f32 %474 = OpLoad %473 
                                        bool %475 = OpFOrdLessThan %56 %474 
                                                      OpStore %285 %475 
                                        bool %476 = OpLoad %285 
                                        bool %477 = OpLoad %55 
                                        bool %478 = OpLogicalOr %476 %477 
                                                      OpStore %55 %478 
                                Uniform f32* %479 = OpAccessChain %18 %19 %19 
                                         f32 %480 = OpLoad %479 
                                        bool %481 = OpFOrdLessThan %56 %480 
                                                      OpStore %285 %481 
                                        bool %482 = OpLoad %285 
                                        bool %483 = OpLoad %55 
                                        bool %484 = OpLogicalOr %482 %483 
                                                      OpStore %55 %484 
                                        bool %485 = OpLoad %55 
                                                      OpSelectionMerge %488 None 
                                                      OpBranchConditional %485 %487 %491 
                                             %487 = OpLabel 
                                Private f32* %489 = OpAccessChain %246 %24 
                                         f32 %490 = OpLoad %489 
                                                      OpStore %486 %490 
                                                      OpBranch %488 
                                             %491 = OpLabel 
                                                      OpStore %486 %251 
                                                      OpBranch %488 
                                             %488 = OpLabel 
                                         f32 %492 = OpLoad %486 
                                Private f32* %493 = OpAccessChain %246 %24 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %246 %24 
                                         f32 %495 = OpLoad %494 
                                Private f32* %496 = OpAccessChain %9 %24 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpFMul %495 %497 
                                Private f32* %499 = OpAccessChain %9 %200 
                                                      OpStore %499 %498 
                         read_only Texture2D %503 = OpLoad %502 
                                     sampler %507 = OpLoad %506 
                  read_only Texture2DSampled %509 = OpSampledImage %503 %507 
                                       f32_2 %512 = OpLoad vs_TEXCOORD1 
                                       f32_4 %513 = OpImageSampleImplicitLod %509 %512 
                                         f32 %515 = OpCompositeExtract %513 3 
                                Private f32* %516 = OpAccessChain %246 %200 
                                                      OpStore %516 %515 
                         read_only Texture2D %519 = OpLoad %518 
                                     sampler %521 = OpLoad %520 
                  read_only Texture2DSampled %522 = OpSampledImage %519 %521 
                                       f32_2 %524 = OpLoad vs_TEXCOORD0 
                                       f32_4 %525 = OpImageSampleImplicitLod %522 %524 
                                                      OpStore %517 %525 
                                       f32_4 %527 = OpLoad %517 
                                       f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
                                       f32_3 %530 = OpExtInst %1 40 %528 %529 
                                                      OpStore %526 %530 
                                       f32_3 %531 = OpLoad %526 
                                       f32_3 %532 = OpExtInst %1 30 %531 
                                       f32_4 %533 = OpLoad %120 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %120 %534 
                                       f32_4 %535 = OpLoad %120 
                                       f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
                                       f32_3 %539 = OpFMul %536 %538 
                                       f32_4 %540 = OpLoad %120 
                                       f32_4 %541 = OpVectorShuffle %540 %539 4 5 6 3 
                                                      OpStore %120 %541 
                                       f32_4 %542 = OpLoad %120 
                                       f32_3 %543 = OpVectorShuffle %542 %542 0 1 2 
                                       f32_3 %544 = OpExtInst %1 29 %543 
                                       f32_4 %545 = OpLoad %120 
                                       f32_4 %546 = OpVectorShuffle %545 %544 4 5 6 3 
                                                      OpStore %120 %546 
                                       f32_4 %547 = OpLoad %120 
                                       f32_3 %548 = OpVectorShuffle %547 %547 0 1 2 
                                       f32_3 %551 = OpFMul %548 %550 
                                       f32_3 %554 = OpFAdd %551 %553 
                                       f32_4 %555 = OpLoad %120 
                                       f32_4 %556 = OpVectorShuffle %555 %554 4 5 6 3 
                                                      OpStore %120 %556 
                                       f32_4 %557 = OpLoad %120 
                                       f32_3 %558 = OpVectorShuffle %557 %557 0 1 2 
                                       f32_3 %559 = OpExtInst %1 40 %558 %529 
                                       f32_4 %560 = OpLoad %120 
                                       f32_4 %561 = OpVectorShuffle %560 %559 4 5 6 3 
                                                      OpStore %120 %561 
                                Uniform i32* %562 = OpAccessChain %18 %20 
                                         i32 %563 = OpLoad %562 
                                        bool %564 = OpINotEqual %563 %20 
                                                      OpSelectionMerge %568 None 
                                                      OpBranchConditional %564 %567 %571 
                                             %567 = OpLabel 
                                       f32_4 %569 = OpLoad %120 
                                       f32_3 %570 = OpVectorShuffle %569 %569 0 1 2 
                                                      OpStore %566 %570 
                                                      OpBranch %568 
                                             %571 = OpLabel 
                                       f32_4 %572 = OpLoad %517 
                                       f32_3 %573 = OpVectorShuffle %572 %572 0 1 2 
                                                      OpStore %566 %573 
                                                      OpBranch %568 
                                             %568 = OpLabel 
                                       f32_3 %574 = OpLoad %566 
                                                      OpStore %526 %574 
                                Private f32* %576 = OpAccessChain %517 %514 
                                         f32 %577 = OpLoad %576 
                                  Input f32* %579 = OpAccessChain %578 %514 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %577 %580 
                                                      OpStore %575 %581 
                                Private f32* %582 = OpAccessChain %9 %24 
                                         f32 %583 = OpLoad %582 
                                         f32 %584 = OpLoad %575 
                                         f32 %585 = OpFMul %583 %584 
                                Private f32* %586 = OpAccessChain %9 %24 
                                                      OpStore %586 %585 
                                       f32_3 %587 = OpLoad %246 
                                       f32_2 %588 = OpVectorShuffle %587 %587 0 2 
                                       f32_3 %589 = OpLoad %9 
                                       f32_2 %590 = OpVectorShuffle %589 %589 0 2 
                                       f32_2 %591 = OpFMul %588 %590 
                                       f32_3 %592 = OpLoad %9 
                                       f32_3 %593 = OpVectorShuffle %592 %591 3 1 4 
                                                      OpStore %9 %593 
                                Private f32* %594 = OpAccessChain %246 %200 
                                         f32 %595 = OpLoad %594 
                                Private f32* %596 = OpAccessChain %9 %24 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpFMul %595 %597 
                                Private f32* %599 = OpAccessChain %9 %24 
                                                      OpStore %599 %598 
                                Private f32* %602 = OpAccessChain %9 %24 
                                         f32 %603 = OpLoad %602 
                                 Output f32* %605 = OpAccessChain %601 %514 
                                                      OpStore %605 %603 
                                       f32_3 %606 = OpLoad %526 
                                       f32_4 %607 = OpLoad %578 
                                       f32_3 %608 = OpVectorShuffle %607 %607 0 1 2 
                                       f32_3 %609 = OpFMul %606 %608 
                                                      OpStore %526 %609 
                                       f32_3 %610 = OpLoad %9 
                                       f32_3 %611 = OpVectorShuffle %610 %610 2 2 2 
                                       f32_3 %612 = OpLoad %526 
                                       f32_3 %613 = OpFMul %611 %612 
                                                      OpStore %9 %613 
                                Uniform i32* %614 = OpAccessChain %18 %69 
                                         i32 %615 = OpLoad %614 
                                        bool %616 = OpINotEqual %615 %321 
                                                      OpStore %285 %616 
                                        bool %617 = OpLoad %285 
                                                      OpSelectionMerge %620 None 
                                                      OpBranchConditional %617 %619 %622 
                                             %619 = OpLabel 
                                       f32_3 %621 = OpLoad %9 
                                                      OpStore %618 %621 
                                                      OpBranch %620 
                                             %622 = OpLabel 
                                       f32_3 %623 = OpLoad %526 
                                                      OpStore %618 %623 
                                                      OpBranch %620 
                                             %620 = OpLabel 
                                       f32_3 %624 = OpLoad %618 
                                       f32_4 %625 = OpLoad %601 
                                       f32_4 %626 = OpVectorShuffle %625 %624 4 5 6 3 
                                                      OpStore %601 %626 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 176
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %74 %84 %85 %149 %156 %158 %168 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %16 ArrayStride 16 
                                                      OpDecorate %17 ArrayStride 17 
                                                      OpDecorate %18 ArrayStride 18 
                                                      OpDecorate %19 ArrayStride 19 
                                                      OpMemberDecorate %20 0 Offset 20 
                                                      OpMemberDecorate %20 1 Offset 20 
                                                      OpMemberDecorate %20 2 Offset 20 
                                                      OpMemberDecorate %20 3 Offset 20 
                                                      OpMemberDecorate %20 4 Offset 20 
                                                      OpDecorate %20 Block 
                                                      OpDecorate %22 DescriptorSet 22 
                                                      OpDecorate %22 Binding 22 
                                                      OpMemberDecorate %72 0 BuiltIn 72 
                                                      OpMemberDecorate %72 1 BuiltIn 72 
                                                      OpMemberDecorate %72 2 BuiltIn 72 
                                                      OpDecorate %72 Block 
                                                      OpDecorate %84 RelaxedPrecision 
                                                      OpDecorate %84 Location 84 
                                                      OpDecorate %85 RelaxedPrecision 
                                                      OpDecorate %85 Location 85 
                                                      OpDecorate %86 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 149 
                                                      OpDecorate vs_TEXCOORD0 Location 156 
                                                      OpDecorate %158 Location 158 
                                                      OpDecorate vs_TEXCOORD2 Location 168 
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
                                              %20 = OpTypeStruct %16 %17 %18 %7 %19 
                                              %21 = OpTypePointer Uniform %20 
Uniform struct {f32_4[4]; f32_4[4]; f32_4[4]; f32_4; f32_4[4];}* %22 = OpVariable Uniform 
                                              %23 = OpTypeInt 32 1 
                                          i32 %24 = OpConstant 0 
                                          i32 %25 = OpConstant 1 
                                              %26 = OpTypePointer Uniform %7 
                                          i32 %37 = OpConstant 2 
                                          i32 %46 = OpConstant 3 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %70 = OpConstant 1 
                                              %71 = OpTypeArray %6 %70 
                                              %72 = OpTypeStruct %7 %6 %71 
                                              %73 = OpTypePointer Output %72 
         Output struct {f32_4; f32; f32[1];}* %74 = OpVariable Output 
                                              %82 = OpTypePointer Output %7 
                                Output f32_4* %84 = OpVariable Output 
                                 Input f32_4* %85 = OpVariable Input 
                                              %87 = OpTypeVector %6 2 
                                             %129 = OpTypePointer Private %87 
                              Private f32_2* %130 = OpVariable Private 
                                         i32 %133 = OpConstant 4 
                                             %148 = OpTypePointer Output %87 
                       Output f32_2* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %157 = OpTypePointer Input %87 
                                Input f32_2* %158 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD2 = OpVariable Output 
                                             %170 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                               Uniform f32_4* %27 = OpAccessChain %22 %24 %25 
                                        f32_4 %28 = OpLoad %27 
                                        f32_4 %29 = OpFMul %13 %28 
                                                      OpStore %9 %29 
                               Uniform f32_4* %30 = OpAccessChain %22 %24 %24 
                                        f32_4 %31 = OpLoad %30 
                                        f32_4 %32 = OpLoad %11 
                                        f32_4 %33 = OpVectorShuffle %32 %32 0 0 0 0 
                                        f32_4 %34 = OpFMul %31 %33 
                                        f32_4 %35 = OpLoad %9 
                                        f32_4 %36 = OpFAdd %34 %35 
                                                      OpStore %9 %36 
                               Uniform f32_4* %38 = OpAccessChain %22 %24 %37 
                                        f32_4 %39 = OpLoad %38 
                                        f32_4 %40 = OpLoad %11 
                                        f32_4 %41 = OpVectorShuffle %40 %40 2 2 2 2 
                                        f32_4 %42 = OpFMul %39 %41 
                                        f32_4 %43 = OpLoad %9 
                                        f32_4 %44 = OpFAdd %42 %43 
                                                      OpStore %9 %44 
                                        f32_4 %45 = OpLoad %9 
                               Uniform f32_4* %47 = OpAccessChain %22 %24 %46 
                                        f32_4 %48 = OpLoad %47 
                                        f32_4 %49 = OpFAdd %45 %48 
                                                      OpStore %9 %49 
                                        f32_4 %51 = OpLoad %9 
                                        f32_4 %52 = OpVectorShuffle %51 %51 1 1 1 1 
                               Uniform f32_4* %53 = OpAccessChain %22 %37 %25 
                                        f32_4 %54 = OpLoad %53 
                                        f32_4 %55 = OpFMul %52 %54 
                                                      OpStore %50 %55 
                               Uniform f32_4* %56 = OpAccessChain %22 %37 %24 
                                        f32_4 %57 = OpLoad %56 
                                        f32_4 %58 = OpLoad %9 
                                        f32_4 %59 = OpVectorShuffle %58 %58 0 0 0 0 
                                        f32_4 %60 = OpFMul %57 %59 
                                        f32_4 %61 = OpLoad %50 
                                        f32_4 %62 = OpFAdd %60 %61 
                                                      OpStore %50 %62 
                               Uniform f32_4* %63 = OpAccessChain %22 %37 %37 
                                        f32_4 %64 = OpLoad %63 
                                        f32_4 %65 = OpLoad %9 
                                        f32_4 %66 = OpVectorShuffle %65 %65 2 2 2 2 
                                        f32_4 %67 = OpFMul %64 %66 
                                        f32_4 %68 = OpLoad %50 
                                        f32_4 %69 = OpFAdd %67 %68 
                                                      OpStore %50 %69 
                               Uniform f32_4* %75 = OpAccessChain %22 %37 %46 
                                        f32_4 %76 = OpLoad %75 
                                        f32_4 %77 = OpLoad %9 
                                        f32_4 %78 = OpVectorShuffle %77 %77 3 3 3 3 
                                        f32_4 %79 = OpFMul %76 %78 
                                        f32_4 %80 = OpLoad %50 
                                        f32_4 %81 = OpFAdd %79 %80 
                                Output f32_4* %83 = OpAccessChain %74 %24 
                                                      OpStore %83 %81 
                                        f32_4 %86 = OpLoad %85 
                                                      OpStore %84 %86 
                                        f32_4 %88 = OpLoad %9 
                                        f32_2 %89 = OpVectorShuffle %88 %88 1 1 
                               Uniform f32_4* %90 = OpAccessChain %22 %25 %25 
                                        f32_4 %91 = OpLoad %90 
                                        f32_2 %92 = OpVectorShuffle %91 %91 0 1 
                                        f32_2 %93 = OpFMul %89 %92 
                                        f32_4 %94 = OpLoad %50 
                                        f32_4 %95 = OpVectorShuffle %94 %93 4 5 2 3 
                                                      OpStore %50 %95 
                               Uniform f32_4* %96 = OpAccessChain %22 %25 %24 
                                        f32_4 %97 = OpLoad %96 
                                        f32_2 %98 = OpVectorShuffle %97 %97 0 1 
                                        f32_4 %99 = OpLoad %9 
                                       f32_2 %100 = OpVectorShuffle %99 %99 0 0 
                                       f32_2 %101 = OpFMul %98 %100 
                                       f32_4 %102 = OpLoad %50 
                                       f32_2 %103 = OpVectorShuffle %102 %102 0 1 
                                       f32_2 %104 = OpFAdd %101 %103 
                                       f32_4 %105 = OpLoad %9 
                                       f32_4 %106 = OpVectorShuffle %105 %104 4 5 2 3 
                                                      OpStore %9 %106 
                              Uniform f32_4* %107 = OpAccessChain %22 %25 %37 
                                       f32_4 %108 = OpLoad %107 
                                       f32_2 %109 = OpVectorShuffle %108 %108 0 1 
                                       f32_4 %110 = OpLoad %9 
                                       f32_2 %111 = OpVectorShuffle %110 %110 2 2 
                                       f32_2 %112 = OpFMul %109 %111 
                                       f32_4 %113 = OpLoad %9 
                                       f32_2 %114 = OpVectorShuffle %113 %113 0 1 
                                       f32_2 %115 = OpFAdd %112 %114 
                                       f32_4 %116 = OpLoad %9 
                                       f32_4 %117 = OpVectorShuffle %116 %115 4 5 2 3 
                                                      OpStore %9 %117 
                              Uniform f32_4* %118 = OpAccessChain %22 %25 %46 
                                       f32_4 %119 = OpLoad %118 
                                       f32_2 %120 = OpVectorShuffle %119 %119 0 1 
                                       f32_4 %121 = OpLoad %9 
                                       f32_2 %122 = OpVectorShuffle %121 %121 3 3 
                                       f32_2 %123 = OpFMul %120 %122 
                                       f32_4 %124 = OpLoad %9 
                                       f32_2 %125 = OpVectorShuffle %124 %124 0 1 
                                       f32_2 %126 = OpFAdd %123 %125 
                                       f32_4 %127 = OpLoad %9 
                                       f32_4 %128 = OpVectorShuffle %127 %126 4 5 2 3 
                                                      OpStore %9 %128 
                                       f32_4 %131 = OpLoad %9 
                                       f32_2 %132 = OpVectorShuffle %131 %131 1 1 
                              Uniform f32_4* %134 = OpAccessChain %22 %133 %25 
                                       f32_4 %135 = OpLoad %134 
                                       f32_2 %136 = OpVectorShuffle %135 %135 0 1 
                                       f32_2 %137 = OpFMul %132 %136 
                                                      OpStore %130 %137 
                              Uniform f32_4* %138 = OpAccessChain %22 %133 %24 
                                       f32_4 %139 = OpLoad %138 
                                       f32_2 %140 = OpVectorShuffle %139 %139 0 1 
                                       f32_4 %141 = OpLoad %9 
                                       f32_2 %142 = OpVectorShuffle %141 %141 0 0 
                                       f32_2 %143 = OpFMul %140 %142 
                                       f32_2 %144 = OpLoad %130 
                                       f32_2 %145 = OpFAdd %143 %144 
                                       f32_4 %146 = OpLoad %9 
                                       f32_4 %147 = OpVectorShuffle %146 %145 4 5 2 3 
                                                      OpStore %9 %147 
                                       f32_4 %150 = OpLoad %9 
                                       f32_2 %151 = OpVectorShuffle %150 %150 0 1 
                              Uniform f32_4* %152 = OpAccessChain %22 %133 %46 
                                       f32_4 %153 = OpLoad %152 
                                       f32_2 %154 = OpVectorShuffle %153 %153 0 1 
                                       f32_2 %155 = OpFAdd %151 %154 
                                                      OpStore vs_TEXCOORD1 %155 
                                       f32_2 %159 = OpLoad %158 
                              Uniform f32_4* %160 = OpAccessChain %22 %46 
                                       f32_4 %161 = OpLoad %160 
                                       f32_2 %162 = OpVectorShuffle %161 %161 0 1 
                                       f32_2 %163 = OpFMul %159 %162 
                              Uniform f32_4* %164 = OpAccessChain %22 %46 
                                       f32_4 %165 = OpLoad %164 
                                       f32_2 %166 = OpVectorShuffle %165 %165 2 3 
                                       f32_2 %167 = OpFAdd %163 %166 
                                                      OpStore vs_TEXCOORD0 %167 
                                       f32_4 %169 = OpLoad %11 
                                                      OpStore vs_TEXCOORD2 %169 
                                 Output f32* %171 = OpAccessChain %74 %24 %70 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFNegate %172 
                                 Output f32* %174 = OpAccessChain %74 %24 %70 
                                                      OpStore %174 %173 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 628
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %37 %511 %523 %578 %601 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpDecorate %13 ArrayStride 13 
                                                      OpDecorate %14 ArrayStride 14 
                                                      OpDecorate %15 ArrayStride 15 
                                                      OpMemberDecorate %16 0 Offset 16 
                                                      OpMemberDecorate %16 1 Offset 16 
                                                      OpMemberDecorate %16 2 Offset 16 
                                                      OpMemberDecorate %16 3 Offset 16 
                                                      OpMemberDecorate %16 4 Offset 16 
                                                      OpMemberDecorate %16 5 Offset 16 
                                                      OpDecorate %16 Block 
                                                      OpDecorate %18 DescriptorSet 18 
                                                      OpDecorate %18 Binding 18 
                                                      OpDecorate vs_TEXCOORD2 Location 37 
                                                      OpDecorate %502 RelaxedPrecision 
                                                      OpDecorate %502 DescriptorSet 502 
                                                      OpDecorate %502 Binding 502 
                                                      OpDecorate %503 RelaxedPrecision 
                                                      OpDecorate %506 RelaxedPrecision 
                                                      OpDecorate %506 DescriptorSet 506 
                                                      OpDecorate %506 Binding 506 
                                                      OpDecorate %507 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 511 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %518 RelaxedPrecision 
                                                      OpDecorate %518 DescriptorSet 518 
                                                      OpDecorate %518 Binding 518 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %520 RelaxedPrecision 
                                                      OpDecorate %520 DescriptorSet 520 
                                                      OpDecorate %520 Binding 520 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 523 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %527 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %530 RelaxedPrecision 
                                                      OpDecorate %531 RelaxedPrecision 
                                                      OpDecorate %532 RelaxedPrecision 
                                                      OpDecorate %572 RelaxedPrecision 
                                                      OpDecorate %573 RelaxedPrecision 
                                                      OpDecorate %575 RelaxedPrecision 
                                                      OpDecorate %577 RelaxedPrecision 
                                                      OpDecorate %578 RelaxedPrecision 
                                                      OpDecorate %578 Location 578 
                                                      OpDecorate %580 RelaxedPrecision 
                                                      OpDecorate %581 RelaxedPrecision 
                                                      OpDecorate %584 RelaxedPrecision 
                                                      OpDecorate %601 RelaxedPrecision 
                                                      OpDecorate %601 Location 601 
                                                      OpDecorate %606 RelaxedPrecision 
                                                      OpDecorate %607 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %623 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 3 
                                               %8 = OpTypePointer Private %7 
                                Private f32_3* %9 = OpVariable Private 
                                              %10 = OpTypeInt 32 1 
                                              %11 = OpTypeInt 32 0 
                                          u32 %12 = OpConstant 4 
                                              %13 = OpTypeArray %6 %12 
                                              %14 = OpTypeArray %6 %12 
                                              %15 = OpTypeArray %6 %12 
                                              %16 = OpTypeStruct %10 %10 %13 %14 %15 %10 
                                              %17 = OpTypePointer Uniform %16 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; i32;}* %18 = OpVariable Uniform 
                                          i32 %19 = OpConstant 3 
                                          i32 %20 = OpConstant 0 
                                              %21 = OpTypePointer Uniform %6 
                                          u32 %24 = OpConstant 0 
                                              %25 = OpTypePointer Private %6 
                                              %27 = OpTypeVector %6 2 
                                              %28 = OpTypePointer Private %27 
                               Private f32_2* %29 = OpVariable Private 
                                          i32 %30 = OpConstant 2 
                                 Private f32* %34 = OpVariable Private 
                                              %35 = OpTypeVector %6 4 
                                              %36 = OpTypePointer Input %35 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %38 = OpTypePointer Input %6 
                                          i32 %41 = OpConstant 4 
                                          f32 %49 = OpConstant 3.674022E-40 
                                              %53 = OpTypeBool 
                                              %54 = OpTypePointer Private %53 
                                Private bool* %55 = OpVariable Private 
                                          f32 %56 = OpConstant 3.674022E-40 
                                 Private f32* %59 = OpVariable Private 
                                 Private f32* %65 = OpVariable Private 
                                          u32 %66 = OpConstant 1 
                                          i32 %69 = OpConstant 1 
                                Private bool* %80 = OpVariable Private 
                                              %83 = OpTypeVector %10 2 
                                              %84 = OpTypePointer Private %83 
                               Private i32_2* %85 = OpVariable Private 
                                        i32_2 %87 = OpConstantComposite %20 %69 
                                        i32_2 %88 = OpConstantComposite %19 %30 
                                              %89 = OpTypeVector %53 2 
                                              %92 = OpTypePointer Private %10 
                                 Private i32* %93 = OpVariable Private 
                                              %95 = OpTypePointer Function %10 
                                             %119 = OpTypePointer Private %35 
                              Private f32_4* %120 = OpVariable Private 
                                             %122 = OpTypePointer Function %27 
                              Private f32_2* %133 = OpVariable Private 
                              Private f32_2* %137 = OpVariable Private 
                              Private f32_3* %187 = OpVariable Private 
                                         u32 %200 = OpConstant 2 
                                             %232 = OpTypePointer Private %89 
                             Private bool_2* %233 = OpVariable Private 
                                       f32_4 %234 = OpConstantComposite %56 %56 %56 %56 
                                             %237 = OpTypeVector %53 4 
                              Private f32_3* %246 = OpVariable Private 
                                         f32 %251 = OpConstant 3.674022E-40 
                             Private bool_2* %280 = OpVariable Private 
                               Private bool* %285 = OpVariable Private 
                                             %292 = OpTypePointer Function %6 
                                             %314 = OpTypeVector %53 3 
                                             %315 = OpTypePointer Private %314 
                             Private bool_3* %316 = OpVariable Private 
                                         i32 %321 = OpConstant 5 
                                             %322 = OpTypePointer Uniform %10 
                                             %354 = OpTypePointer Function %53 
                                             %500 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %501 = OpTypePointer UniformConstant %500 
        UniformConstant read_only Texture2D* %502 = OpVariable UniformConstant 
                                             %504 = OpTypeSampler 
                                             %505 = OpTypePointer UniformConstant %504 
                    UniformConstant sampler* %506 = OpVariable UniformConstant 
                                             %508 = OpTypeSampledImage %500 
                                             %510 = OpTypePointer Input %27 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                                         u32 %514 = OpConstant 3 
                              Private f32_4* %517 = OpVariable Private 
        UniformConstant read_only Texture2D* %518 = OpVariable UniformConstant 
                    UniformConstant sampler* %520 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                              Private f32_3* %526 = OpVariable Private 
                                       f32_3 %529 = OpConstantComposite %56 %56 %56 
                                         f32 %537 = OpConstant 3.674022E-40 
                                       f32_3 %538 = OpConstantComposite %537 %537 %537 
                                         f32 %549 = OpConstant 3.674022E-40 
                                       f32_3 %550 = OpConstantComposite %549 %549 %549 
                                         f32 %552 = OpConstant 3.674022E-40 
                                       f32_3 %553 = OpConstantComposite %552 %552 %552 
                                             %565 = OpTypePointer Function %7 
                                Private f32* %575 = OpVariable Private 
                                Input f32_4* %578 = OpVariable Input 
                                             %600 = OpTypePointer Output %35 
                               Output f32_4* %601 = OpVariable Output 
                                             %604 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                                Function i32* %96 = OpVariable Function 
                             Function f32_2* %123 = OpVariable Function 
                             Function f32_2* %163 = OpVariable Function 
                               Function f32* %293 = OpVariable Function 
                               Function f32* %302 = OpVariable Function 
                               Function f32* %330 = OpVariable Function 
                              Function bool* %355 = OpVariable Function 
                              Function bool* %366 = OpVariable Function 
                               Function f32* %382 = OpVariable Function 
                               Function f32* %486 = OpVariable Function 
                             Function f32_3* %566 = OpVariable Function 
                             Function f32_3* %618 = OpVariable Function 
                                 Uniform f32* %22 = OpAccessChain %18 %19 %20 
                                          f32 %23 = OpLoad %22 
                                 Private f32* %26 = OpAccessChain %9 %24 
                                                      OpStore %26 %23 
                                 Uniform f32* %31 = OpAccessChain %18 %19 %30 
                                          f32 %32 = OpLoad %31 
                                 Private f32* %33 = OpAccessChain %29 %24 
                                                      OpStore %33 %32 
                                   Input f32* %39 = OpAccessChain vs_TEXCOORD2 %24 
                                          f32 %40 = OpLoad %39 
                                 Uniform f32* %42 = OpAccessChain %18 %41 %20 
                                          f32 %43 = OpLoad %42 
                                          f32 %44 = OpFNegate %43 
                                          f32 %45 = OpFAdd %40 %44 
                                                      OpStore %34 %45 
                                 Uniform f32* %46 = OpAccessChain %18 %41 %30 
                                          f32 %47 = OpLoad %46 
                                          f32 %48 = OpFNegate %47 
                                          f32 %50 = OpFMul %48 %49 
                                          f32 %51 = OpLoad %34 
                                          f32 %52 = OpFAdd %50 %51 
                                                      OpStore %34 %52 
                                          f32 %57 = OpLoad %34 
                                         bool %58 = OpFOrdGreaterThanEqual %56 %57 
                                                      OpStore %55 %58 
                                 Uniform f32* %60 = OpAccessChain %18 %41 %20 
                                          f32 %61 = OpLoad %60 
                                 Uniform f32* %62 = OpAccessChain %18 %41 %30 
                                          f32 %63 = OpLoad %62 
                                          f32 %64 = OpFAdd %61 %63 
                                                      OpStore %59 %64 
                                   Input f32* %67 = OpAccessChain vs_TEXCOORD2 %66 
                                          f32 %68 = OpLoad %67 
                                 Uniform f32* %70 = OpAccessChain %18 %41 %69 
                                          f32 %71 = OpLoad %70 
                                          f32 %72 = OpFNegate %71 
                                          f32 %73 = OpFAdd %68 %72 
                                                      OpStore %65 %73 
                                 Uniform f32* %74 = OpAccessChain %18 %41 %19 
                                          f32 %75 = OpLoad %74 
                                          f32 %76 = OpFNegate %75 
                                          f32 %77 = OpFMul %76 %49 
                                          f32 %78 = OpLoad %65 
                                          f32 %79 = OpFAdd %77 %78 
                                                      OpStore %65 %79 
                                          f32 %81 = OpLoad %65 
                                         bool %82 = OpFOrdGreaterThanEqual %56 %81 
                                                      OpStore %80 %82 
                                         bool %86 = OpLoad %80 
                                       bool_2 %90 = OpCompositeConstruct %86 %86 
                                        i32_2 %91 = OpSelect %90 %87 %88 
                                                      OpStore %85 %91 
                                         bool %94 = OpLoad %55 
                                                      OpSelectionMerge %98 None 
                                                      OpBranchConditional %94 %97 %101 
                                              %97 = OpLabel 
                                 Private i32* %99 = OpAccessChain %85 %24 
                                         i32 %100 = OpLoad %99 
                                                      OpStore %96 %100 
                                                      OpBranch %98 
                                             %101 = OpLabel 
                                Private i32* %102 = OpAccessChain %85 %66 
                                         i32 %103 = OpLoad %102 
                                                      OpStore %96 %103 
                                                      OpBranch %98 
                                              %98 = OpLabel 
                                         i32 %104 = OpLoad %96 
                                                      OpStore %93 %104 
                                         f32 %105 = OpLoad %59 
                                         i32 %106 = OpLoad %93 
                                Uniform f32* %107 = OpAccessChain %18 %30 %106 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFNegate %108 
                                         f32 %110 = OpFAdd %105 %109 
                                Private f32* %111 = OpAccessChain %29 %66 
                                                      OpStore %111 %110 
                                Uniform f32* %112 = OpAccessChain %18 %41 %20 
                                         f32 %113 = OpLoad %112 
                                         i32 %114 = OpLoad %93 
                                Uniform f32* %115 = OpAccessChain %18 %30 %114 
                                         f32 %116 = OpLoad %115 
                                         f32 %117 = OpFAdd %113 %116 
                                Private f32* %118 = OpAccessChain %9 %66 
                                                      OpStore %118 %117 
                                        bool %121 = OpLoad %55 
                                                      OpSelectionMerge %125 None 
                                                      OpBranchConditional %121 %124 %128 
                                             %124 = OpLabel 
                                       f32_3 %126 = OpLoad %9 
                                       f32_2 %127 = OpVectorShuffle %126 %126 0 1 
                                                      OpStore %123 %127 
                                                      OpBranch %125 
                                             %128 = OpLabel 
                                       f32_2 %129 = OpLoad %29 
                                                      OpStore %123 %129 
                                                      OpBranch %125 
                                             %125 = OpLabel 
                                       f32_2 %130 = OpLoad %123 
                                       f32_4 %131 = OpLoad %120 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %120 %132 
                                Uniform f32* %134 = OpAccessChain %18 %19 %69 
                                         f32 %135 = OpLoad %134 
                                Private f32* %136 = OpAccessChain %133 %24 
                                                      OpStore %136 %135 
                                Uniform f32* %138 = OpAccessChain %18 %19 %19 
                                         f32 %139 = OpLoad %138 
                                Private f32* %140 = OpAccessChain %137 %24 
                                                      OpStore %140 %139 
                                Uniform f32* %141 = OpAccessChain %18 %41 %69 
                                         f32 %142 = OpLoad %141 
                                Uniform f32* %143 = OpAccessChain %18 %41 %19 
                                         f32 %144 = OpLoad %143 
                                         f32 %145 = OpFAdd %142 %144 
                                Private f32* %146 = OpAccessChain %9 %24 
                                                      OpStore %146 %145 
                                Private f32* %147 = OpAccessChain %9 %24 
                                         f32 %148 = OpLoad %147 
                                         i32 %149 = OpLoad %93 
                                Uniform f32* %150 = OpAccessChain %18 %30 %149 
                                         f32 %151 = OpLoad %150 
                                         f32 %152 = OpFNegate %151 
                                         f32 %153 = OpFAdd %148 %152 
                                Private f32* %154 = OpAccessChain %137 %66 
                                                      OpStore %154 %153 
                                Uniform f32* %155 = OpAccessChain %18 %41 %69 
                                         f32 %156 = OpLoad %155 
                                         i32 %157 = OpLoad %93 
                                Uniform f32* %158 = OpAccessChain %18 %30 %157 
                                         f32 %159 = OpLoad %158 
                                         f32 %160 = OpFAdd %156 %159 
                                Private f32* %161 = OpAccessChain %133 %66 
                                                      OpStore %161 %160 
                                        bool %162 = OpLoad %80 
                                                      OpSelectionMerge %165 None 
                                                      OpBranchConditional %162 %164 %167 
                                             %164 = OpLabel 
                                       f32_2 %166 = OpLoad %133 
                                                      OpStore %163 %166 
                                                      OpBranch %165 
                                             %167 = OpLabel 
                                       f32_2 %168 = OpLoad %137 
                                                      OpStore %163 %168 
                                                      OpBranch %165 
                                             %165 = OpLabel 
                                       f32_2 %169 = OpLoad %163 
                                       f32_4 %170 = OpLoad %120 
                                       f32_4 %171 = OpVectorShuffle %170 %169 0 1 4 5 
                                                      OpStore %120 %171 
                                       f32_4 %172 = OpLoad %120 
                                       f32_2 %173 = OpVectorShuffle %172 %172 0 2 
                                       f32_2 %174 = OpFNegate %173 
                                         i32 %175 = OpLoad %93 
                                Uniform f32* %176 = OpAccessChain %18 %30 %175 
                                         f32 %177 = OpLoad %176 
                                       f32_2 %178 = OpCompositeConstruct %177 %177 
                                       f32_2 %179 = OpFAdd %174 %178 
                                       f32_3 %180 = OpLoad %9 
                                       f32_3 %181 = OpVectorShuffle %180 %179 3 4 2 
                                                      OpStore %9 %181 
                                Private f32* %182 = OpAccessChain %9 %24 
                                         f32 %183 = OpLoad %182 
                                Private f32* %184 = OpAccessChain %9 %66 
                                         f32 %185 = OpLoad %184 
                                         f32 %186 = OpFDiv %183 %185 
                                                      OpStore %59 %186 
                                       f32_4 %188 = OpLoad %120 
                                       f32_2 %189 = OpVectorShuffle %188 %188 1 3 
                                       f32_2 %190 = OpFNegate %189 
                                       f32_4 %191 = OpLoad vs_TEXCOORD2 
                                       f32_2 %192 = OpVectorShuffle %191 %191 0 1 
                                       f32_2 %193 = OpFAdd %190 %192 
                                       f32_3 %194 = OpLoad %187 
                                       f32_3 %195 = OpVectorShuffle %194 %193 3 4 2 
                                                      OpStore %187 %195 
                                         f32 %196 = OpLoad %59 
                                Private f32* %197 = OpAccessChain %187 %66 
                                         f32 %198 = OpLoad %197 
                                         f32 %199 = OpFMul %196 %198 
                                Private f32* %201 = OpAccessChain %187 %200 
                                                      OpStore %201 %199 
                                       f32_3 %202 = OpLoad %187 
                                       f32_2 %203 = OpVectorShuffle %202 %202 0 2 
                                       f32_3 %204 = OpLoad %187 
                                       f32_2 %205 = OpVectorShuffle %204 %204 0 2 
                                         f32 %206 = OpDot %203 %205 
                                                      OpStore %59 %206 
                                       f32_3 %207 = OpLoad %187 
                                       f32_2 %208 = OpVectorShuffle %207 %207 0 1 
                                       f32_3 %209 = OpLoad %187 
                                       f32_2 %210 = OpVectorShuffle %209 %209 0 1 
                                         f32 %211 = OpDot %208 %210 
                                Private f32* %212 = OpAccessChain %29 %24 
                                                      OpStore %212 %211 
                                Private f32* %213 = OpAccessChain %29 %24 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpExtInst %1 31 %214 
                                Private f32* %216 = OpAccessChain %29 %24 
                                                      OpStore %216 %215 
                                Private f32* %217 = OpAccessChain %29 %24 
                                         f32 %218 = OpLoad %217 
                                         i32 %219 = OpLoad %93 
                                Uniform f32* %220 = OpAccessChain %18 %30 %219 
                                         f32 %221 = OpLoad %220 
                                         f32 %222 = OpFNegate %221 
                                         f32 %223 = OpFAdd %218 %222 
                                Private f32* %224 = OpAccessChain %29 %24 
                                                      OpStore %224 %223 
                                         f32 %225 = OpLoad %59 
                                         f32 %226 = OpExtInst %1 31 %225 
                                                      OpStore %59 %226 
                                Private f32* %227 = OpAccessChain %9 %24 
                                         f32 %228 = OpLoad %227 
                                         f32 %229 = OpFNegate %228 
                                         f32 %230 = OpLoad %59 
                                         f32 %231 = OpFAdd %229 %230 
                                                      OpStore %59 %231 
                                       f32_3 %235 = OpLoad %9 
                                       f32_4 %236 = OpVectorShuffle %235 %235 0 1 0 0 
                                      bool_4 %238 = OpFOrdLessThan %234 %236 
                                      bool_2 %239 = OpVectorShuffle %238 %238 0 1 
                                                      OpStore %233 %239 
                               Private bool* %240 = OpAccessChain %233 %66 
                                        bool %241 = OpLoad %240 
                               Private bool* %242 = OpAccessChain %233 %24 
                                        bool %243 = OpLoad %242 
                                        bool %244 = OpLogicalAnd %241 %243 
                               Private bool* %245 = OpAccessChain %233 %24 
                                                      OpStore %245 %244 
                                  Input f32* %247 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %248 = OpLoad %247 
                                         f32 %249 = OpDPdx %248 
                                Private f32* %250 = OpAccessChain %246 %24 
                                                      OpStore %250 %249 
                                Private f32* %252 = OpAccessChain %246 %24 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 4 %253 
                                         f32 %255 = OpFDiv %251 %254 
                                Private f32* %256 = OpAccessChain %246 %24 
                                                      OpStore %256 %255 
                                         f32 %257 = OpLoad %59 
                                Private f32* %258 = OpAccessChain %246 %24 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpFMul %257 %259 
                                         f32 %261 = OpFAdd %260 %49 
                                                      OpStore %59 %261 
                                         f32 %262 = OpLoad %59 
                                         f32 %263 = OpExtInst %1 43 %262 %56 %251 
                                                      OpStore %59 %263 
                                Private f32* %264 = OpAccessChain %29 %24 
                                         f32 %265 = OpLoad %264 
                                Private f32* %266 = OpAccessChain %246 %24 
                                         f32 %267 = OpLoad %266 
                                         f32 %268 = OpFMul %265 %267 
                                         f32 %269 = OpFAdd %268 %49 
                                Private f32* %270 = OpAccessChain %246 %24 
                                                      OpStore %270 %269 
                                Private f32* %271 = OpAccessChain %246 %24 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpExtInst %1 43 %272 %56 %251 
                                Private f32* %274 = OpAccessChain %246 %24 
                                                      OpStore %274 %273 
                               Private bool* %275 = OpAccessChain %233 %24 
                                        bool %276 = OpLoad %275 
                                         f32 %277 = OpLoad %59 
                                         f32 %278 = OpSelect %276 %277 %251 
                                Private f32* %279 = OpAccessChain %9 %24 
                                                      OpStore %279 %278 
                                       f32_4 %281 = OpLoad %120 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 2 0 0 
                                      bool_4 %283 = OpFOrdLessThan %234 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                                      OpStore %280 %284 
                               Private bool* %286 = OpAccessChain %280 %66 
                                        bool %287 = OpLoad %286 
                               Private bool* %288 = OpAccessChain %280 %24 
                                        bool %289 = OpLoad %288 
                                        bool %290 = OpLogicalOr %287 %289 
                                                      OpStore %285 %290 
                                        bool %291 = OpLoad %285 
                                                      OpSelectionMerge %295 None 
                                                      OpBranchConditional %291 %294 %298 
                                             %294 = OpLabel 
                                Private f32* %296 = OpAccessChain %9 %24 
                                         f32 %297 = OpLoad %296 
                                                      OpStore %293 %297 
                                                      OpBranch %295 
                                             %298 = OpLabel 
                                                      OpStore %293 %56 
                                                      OpBranch %295 
                                             %295 = OpLabel 
                                         f32 %299 = OpLoad %293 
                                Private f32* %300 = OpAccessChain %9 %24 
                                                      OpStore %300 %299 
                                        bool %301 = OpLoad %285 
                                                      OpSelectionMerge %304 None 
                                                      OpBranchConditional %301 %303 %307 
                                             %303 = OpLabel 
                                Private f32* %305 = OpAccessChain %246 %24 
                                         f32 %306 = OpLoad %305 
                                                      OpStore %302 %306 
                                                      OpBranch %304 
                                             %307 = OpLabel 
                                                      OpStore %302 %56 
                                                      OpBranch %304 
                                             %304 = OpLabel 
                                         f32 %308 = OpLoad %302 
                                Private f32* %309 = OpAccessChain %246 %24 
                                                      OpStore %309 %308 
                                Private f32* %310 = OpAccessChain %246 %24 
                                         f32 %311 = OpLoad %310 
                                         f32 %312 = OpFNegate %311 
                                         f32 %313 = OpFAdd %312 %251 
                                                      OpStore %59 %313 
                                Private f32* %317 = OpAccessChain %246 %24 
                                         f32 %318 = OpLoad %317 
                                        bool %319 = OpFOrdEqual %318 %56 
                               Private bool* %320 = OpAccessChain %316 %24 
                                                      OpStore %320 %319 
                                Uniform i32* %323 = OpAccessChain %18 %321 
                                         i32 %324 = OpLoad %323 
                                        bool %325 = OpINotEqual %324 %20 
                                         f32 %326 = OpLoad %59 
                                         f32 %327 = OpSelect %325 %326 %56 
                                                      OpStore %59 %327 
                               Private bool* %328 = OpAccessChain %316 %24 
                                        bool %329 = OpLoad %328 
                                                      OpSelectionMerge %332 None 
                                                      OpBranchConditional %329 %331 %335 
                                             %331 = OpLabel 
                                Private f32* %333 = OpAccessChain %9 %24 
                                         f32 %334 = OpLoad %333 
                                                      OpStore %330 %334 
                                                      OpBranch %332 
                                             %335 = OpLabel 
                                         f32 %336 = OpLoad %59 
                                                      OpStore %330 %336 
                                                      OpBranch %332 
                                             %332 = OpLabel 
                                         f32 %337 = OpLoad %330 
                                Private f32* %338 = OpAccessChain %9 %24 
                                                      OpStore %338 %337 
                                       f32_4 %339 = OpLoad %120 
                                       f32_4 %340 = OpVectorShuffle %339 %339 1 1 3 3 
                                       f32_4 %341 = OpLoad vs_TEXCOORD2 
                                       f32_4 %342 = OpVectorShuffle %341 %341 0 0 1 1 
                                      bool_4 %343 = OpFOrdGreaterThanEqual %340 %342 
                                      bool_2 %344 = OpVectorShuffle %343 %343 0 2 
                                      bool_3 %345 = OpLoad %316 
                                      bool_3 %346 = OpVectorShuffle %345 %344 3 1 4 
                                                      OpStore %316 %346 
                                       f32_4 %347 = OpLoad vs_TEXCOORD2 
                                       f32_4 %348 = OpVectorShuffle %347 %347 0 1 0 0 
                                       f32_4 %349 = OpLoad %120 
                                       f32_4 %350 = OpVectorShuffle %349 %349 1 3 1 1 
                                      bool_4 %351 = OpFOrdGreaterThanEqual %348 %350 
                                      bool_2 %352 = OpVectorShuffle %351 %351 0 1 
                                                      OpStore %280 %352 
                                        bool %353 = OpLoad %55 
                                                      OpSelectionMerge %357 None 
                                                      OpBranchConditional %353 %356 %360 
                                             %356 = OpLabel 
                               Private bool* %358 = OpAccessChain %316 %24 
                                        bool %359 = OpLoad %358 
                                                      OpStore %355 %359 
                                                      OpBranch %357 
                                             %360 = OpLabel 
                               Private bool* %361 = OpAccessChain %280 %24 
                                        bool %362 = OpLoad %361 
                                                      OpStore %355 %362 
                                                      OpBranch %357 
                                             %357 = OpLabel 
                                        bool %363 = OpLoad %355 
                               Private bool* %364 = OpAccessChain %316 %24 
                                                      OpStore %364 %363 
                                        bool %365 = OpLoad %80 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %365 %367 %371 
                                             %367 = OpLabel 
                               Private bool* %369 = OpAccessChain %316 %200 
                                        bool %370 = OpLoad %369 
                                                      OpStore %366 %370 
                                                      OpBranch %368 
                                             %371 = OpLabel 
                               Private bool* %372 = OpAccessChain %280 %66 
                                        bool %373 = OpLoad %372 
                                                      OpStore %366 %373 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                        bool %374 = OpLoad %366 
                                                      OpStore %55 %374 
                                        bool %375 = OpLoad %55 
                               Private bool* %376 = OpAccessChain %316 %24 
                                        bool %377 = OpLoad %376 
                                        bool %378 = OpLogicalAnd %375 %377 
                               Private bool* %379 = OpAccessChain %316 %24 
                                                      OpStore %379 %378 
                               Private bool* %380 = OpAccessChain %316 %24 
                                        bool %381 = OpLoad %380 
                                                      OpSelectionMerge %384 None 
                                                      OpBranchConditional %381 %383 %387 
                                             %383 = OpLabel 
                                Private f32* %385 = OpAccessChain %9 %24 
                                         f32 %386 = OpLoad %385 
                                                      OpStore %382 %386 
                                                      OpBranch %384 
                                             %387 = OpLabel 
                                                      OpStore %382 %251 
                                                      OpBranch %384 
                                             %384 = OpLabel 
                                         f32 %388 = OpLoad %382 
                                Private f32* %389 = OpAccessChain %9 %24 
                                                      OpStore %389 %388 
                                Uniform f32* %390 = OpAccessChain %18 %19 %20 
                                         f32 %391 = OpLoad %390 
                                Uniform f32* %392 = OpAccessChain %18 %19 %30 
                                         f32 %393 = OpLoad %392 
                                         f32 %394 = OpFAdd %391 %393 
                                                      OpStore %34 %394 
                                         f32 %395 = OpLoad %34 
                                         f32 %396 = OpFNegate %395 
                                Uniform f32* %397 = OpAccessChain %18 %41 %30 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpFAdd %396 %398 
                                                      OpStore %34 %399 
                                Uniform f32* %400 = OpAccessChain %18 %19 %20 
                                         f32 %401 = OpLoad %400 
                                Uniform f32* %402 = OpAccessChain %18 %41 %20 
                                         f32 %403 = OpLoad %402 
                                         f32 %404 = OpFAdd %401 %403 
                                                      OpStore %59 %404 
                                         f32 %405 = OpLoad %34 
                                         f32 %406 = OpLoad %59 
                                         f32 %407 = OpFAdd %405 %406 
                                                      OpStore %34 %407 
                                  Input f32* %408 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %409 = OpLoad %408 
                                         f32 %410 = OpLoad %59 
                                        bool %411 = OpFOrdGreaterThanEqual %409 %410 
                                                      OpStore %285 %411 
                                         f32 %412 = OpLoad %34 
                                  Input f32* %413 = OpAccessChain vs_TEXCOORD2 %24 
                                         f32 %414 = OpLoad %413 
                                        bool %415 = OpFOrdGreaterThanEqual %412 %414 
                                                      OpStore %55 %415 
                                        bool %416 = OpLoad %55 
                                        bool %417 = OpLoad %285 
                                        bool %418 = OpLogicalAnd %416 %417 
                                                      OpStore %55 %418 
                                Uniform f32* %419 = OpAccessChain %18 %19 %69 
                                         f32 %420 = OpLoad %419 
                                Uniform f32* %421 = OpAccessChain %18 %41 %69 
                                         f32 %422 = OpLoad %421 
                                         f32 %423 = OpFAdd %420 %422 
                                                      OpStore %59 %423 
                                  Input f32* %424 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %425 = OpLoad %424 
                                         f32 %426 = OpLoad %59 
                                        bool %427 = OpFOrdGreaterThanEqual %425 %426 
                               Private bool* %428 = OpAccessChain %280 %24 
                                                      OpStore %428 %427 
                                        bool %429 = OpLoad %55 
                               Private bool* %430 = OpAccessChain %280 %24 
                                        bool %431 = OpLoad %430 
                                        bool %432 = OpLogicalAnd %429 %431 
                                                      OpStore %55 %432 
                                Uniform f32* %433 = OpAccessChain %18 %19 %69 
                                         f32 %434 = OpLoad %433 
                                Uniform f32* %435 = OpAccessChain %18 %19 %19 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpFAdd %434 %436 
                                Private f32* %438 = OpAccessChain %29 %24 
                                                      OpStore %438 %437 
                                Private f32* %439 = OpAccessChain %29 %24 
                                         f32 %440 = OpLoad %439 
                                         f32 %441 = OpFNegate %440 
                                Uniform f32* %442 = OpAccessChain %18 %41 %19 
                                         f32 %443 = OpLoad %442 
                                         f32 %444 = OpFAdd %441 %443 
                                Private f32* %445 = OpAccessChain %29 %24 
                                                      OpStore %445 %444 
                                         f32 %446 = OpLoad %59 
                                Private f32* %447 = OpAccessChain %29 %24 
                                         f32 %448 = OpLoad %447 
                                         f32 %449 = OpFAdd %446 %448 
                                                      OpStore %59 %449 
                                         f32 %450 = OpLoad %59 
                                  Input f32* %451 = OpAccessChain vs_TEXCOORD2 %66 
                                         f32 %452 = OpLoad %451 
                                        bool %453 = OpFOrdGreaterThanEqual %450 %452 
                                                      OpStore %285 %453 
                                        bool %454 = OpLoad %285 
                                        bool %455 = OpLoad %55 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %55 %456 
                                        bool %457 = OpLoad %55 
                                         f32 %458 = OpSelect %457 %56 %251 
                                                      OpStore %34 %458 
                               Private bool* %459 = OpAccessChain %316 %24 
                                        bool %460 = OpLoad %459 
                                         f32 %461 = OpLoad %34 
                                         f32 %462 = OpSelect %460 %251 %461 
                                Private f32* %463 = OpAccessChain %246 %24 
                                                      OpStore %463 %462 
                                Uniform f32* %464 = OpAccessChain %18 %19 %20 
                                         f32 %465 = OpLoad %464 
                                        bool %466 = OpFOrdLessThan %56 %465 
                                                      OpStore %55 %466 
                                Uniform f32* %467 = OpAccessChain %18 %19 %69 
                                         f32 %468 = OpLoad %467 
                                        bool %469 = OpFOrdLessThan %56 %468 
                                                      OpStore %285 %469 
                                        bool %470 = OpLoad %285 
                                        bool %471 = OpLoad %55 
                                        bool %472 = OpLogicalOr %470 %471 
                                                      OpStore %55 %472 
                                Uniform f32* %473 = OpAccessChain %18 %19 %30 
                                         f32 %474 = OpLoad %473 
                                        bool %475 = OpFOrdLessThan %56 %474 
                                                      OpStore %285 %475 
                                        bool %476 = OpLoad %285 
                                        bool %477 = OpLoad %55 
                                        bool %478 = OpLogicalOr %476 %477 
                                                      OpStore %55 %478 
                                Uniform f32* %479 = OpAccessChain %18 %19 %19 
                                         f32 %480 = OpLoad %479 
                                        bool %481 = OpFOrdLessThan %56 %480 
                                                      OpStore %285 %481 
                                        bool %482 = OpLoad %285 
                                        bool %483 = OpLoad %55 
                                        bool %484 = OpLogicalOr %482 %483 
                                                      OpStore %55 %484 
                                        bool %485 = OpLoad %55 
                                                      OpSelectionMerge %488 None 
                                                      OpBranchConditional %485 %487 %491 
                                             %487 = OpLabel 
                                Private f32* %489 = OpAccessChain %246 %24 
                                         f32 %490 = OpLoad %489 
                                                      OpStore %486 %490 
                                                      OpBranch %488 
                                             %491 = OpLabel 
                                                      OpStore %486 %251 
                                                      OpBranch %488 
                                             %488 = OpLabel 
                                         f32 %492 = OpLoad %486 
                                Private f32* %493 = OpAccessChain %246 %24 
                                                      OpStore %493 %492 
                                Private f32* %494 = OpAccessChain %246 %24 
                                         f32 %495 = OpLoad %494 
                                Private f32* %496 = OpAccessChain %9 %24 
                                         f32 %497 = OpLoad %496 
                                         f32 %498 = OpFMul %495 %497 
                                Private f32* %499 = OpAccessChain %9 %200 
                                                      OpStore %499 %498 
                         read_only Texture2D %503 = OpLoad %502 
                                     sampler %507 = OpLoad %506 
                  read_only Texture2DSampled %509 = OpSampledImage %503 %507 
                                       f32_2 %512 = OpLoad vs_TEXCOORD1 
                                       f32_4 %513 = OpImageSampleImplicitLod %509 %512 
                                         f32 %515 = OpCompositeExtract %513 3 
                                Private f32* %516 = OpAccessChain %246 %200 
                                                      OpStore %516 %515 
                         read_only Texture2D %519 = OpLoad %518 
                                     sampler %521 = OpLoad %520 
                  read_only Texture2DSampled %522 = OpSampledImage %519 %521 
                                       f32_2 %524 = OpLoad vs_TEXCOORD0 
                                       f32_4 %525 = OpImageSampleImplicitLod %522 %524 
                                                      OpStore %517 %525 
                                       f32_4 %527 = OpLoad %517 
                                       f32_3 %528 = OpVectorShuffle %527 %527 0 1 2 
                                       f32_3 %530 = OpExtInst %1 40 %528 %529 
                                                      OpStore %526 %530 
                                       f32_3 %531 = OpLoad %526 
                                       f32_3 %532 = OpExtInst %1 30 %531 
                                       f32_4 %533 = OpLoad %120 
                                       f32_4 %534 = OpVectorShuffle %533 %532 4 5 6 3 
                                                      OpStore %120 %534 
                                       f32_4 %535 = OpLoad %120 
                                       f32_3 %536 = OpVectorShuffle %535 %535 0 1 2 
                                       f32_3 %539 = OpFMul %536 %538 
                                       f32_4 %540 = OpLoad %120 
                                       f32_4 %541 = OpVectorShuffle %540 %539 4 5 6 3 
                                                      OpStore %120 %541 
                                       f32_4 %542 = OpLoad %120 
                                       f32_3 %543 = OpVectorShuffle %542 %542 0 1 2 
                                       f32_3 %544 = OpExtInst %1 29 %543 
                                       f32_4 %545 = OpLoad %120 
                                       f32_4 %546 = OpVectorShuffle %545 %544 4 5 6 3 
                                                      OpStore %120 %546 
                                       f32_4 %547 = OpLoad %120 
                                       f32_3 %548 = OpVectorShuffle %547 %547 0 1 2 
                                       f32_3 %551 = OpFMul %548 %550 
                                       f32_3 %554 = OpFAdd %551 %553 
                                       f32_4 %555 = OpLoad %120 
                                       f32_4 %556 = OpVectorShuffle %555 %554 4 5 6 3 
                                                      OpStore %120 %556 
                                       f32_4 %557 = OpLoad %120 
                                       f32_3 %558 = OpVectorShuffle %557 %557 0 1 2 
                                       f32_3 %559 = OpExtInst %1 40 %558 %529 
                                       f32_4 %560 = OpLoad %120 
                                       f32_4 %561 = OpVectorShuffle %560 %559 4 5 6 3 
                                                      OpStore %120 %561 
                                Uniform i32* %562 = OpAccessChain %18 %20 
                                         i32 %563 = OpLoad %562 
                                        bool %564 = OpINotEqual %563 %20 
                                                      OpSelectionMerge %568 None 
                                                      OpBranchConditional %564 %567 %571 
                                             %567 = OpLabel 
                                       f32_4 %569 = OpLoad %120 
                                       f32_3 %570 = OpVectorShuffle %569 %569 0 1 2 
                                                      OpStore %566 %570 
                                                      OpBranch %568 
                                             %571 = OpLabel 
                                       f32_4 %572 = OpLoad %517 
                                       f32_3 %573 = OpVectorShuffle %572 %572 0 1 2 
                                                      OpStore %566 %573 
                                                      OpBranch %568 
                                             %568 = OpLabel 
                                       f32_3 %574 = OpLoad %566 
                                                      OpStore %526 %574 
                                Private f32* %576 = OpAccessChain %517 %514 
                                         f32 %577 = OpLoad %576 
                                  Input f32* %579 = OpAccessChain %578 %514 
                                         f32 %580 = OpLoad %579 
                                         f32 %581 = OpFMul %577 %580 
                                                      OpStore %575 %581 
                                Private f32* %582 = OpAccessChain %9 %24 
                                         f32 %583 = OpLoad %582 
                                         f32 %584 = OpLoad %575 
                                         f32 %585 = OpFMul %583 %584 
                                Private f32* %586 = OpAccessChain %9 %24 
                                                      OpStore %586 %585 
                                       f32_3 %587 = OpLoad %246 
                                       f32_2 %588 = OpVectorShuffle %587 %587 0 2 
                                       f32_3 %589 = OpLoad %9 
                                       f32_2 %590 = OpVectorShuffle %589 %589 0 2 
                                       f32_2 %591 = OpFMul %588 %590 
                                       f32_3 %592 = OpLoad %9 
                                       f32_3 %593 = OpVectorShuffle %592 %591 3 1 4 
                                                      OpStore %9 %593 
                                Private f32* %594 = OpAccessChain %246 %200 
                                         f32 %595 = OpLoad %594 
                                Private f32* %596 = OpAccessChain %9 %24 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpFMul %595 %597 
                                Private f32* %599 = OpAccessChain %9 %24 
                                                      OpStore %599 %598 
                                Private f32* %602 = OpAccessChain %9 %24 
                                         f32 %603 = OpLoad %602 
                                 Output f32* %605 = OpAccessChain %601 %514 
                                                      OpStore %605 %603 
                                       f32_3 %606 = OpLoad %526 
                                       f32_4 %607 = OpLoad %578 
                                       f32_3 %608 = OpVectorShuffle %607 %607 0 1 2 
                                       f32_3 %609 = OpFMul %606 %608 
                                                      OpStore %526 %609 
                                       f32_3 %610 = OpLoad %9 
                                       f32_3 %611 = OpVectorShuffle %610 %610 2 2 2 
                                       f32_3 %612 = OpLoad %526 
                                       f32_3 %613 = OpFMul %611 %612 
                                                      OpStore %9 %613 
                                Uniform i32* %614 = OpAccessChain %18 %69 
                                         i32 %615 = OpLoad %614 
                                        bool %616 = OpINotEqual %615 %321 
                                                      OpStore %285 %616 
                                        bool %617 = OpLoad %285 
                                                      OpSelectionMerge %620 None 
                                                      OpBranchConditional %617 %619 %622 
                                             %619 = OpLabel 
                                       f32_3 %621 = OpLoad %9 
                                                      OpStore %618 %621 
                                                      OpBranch %620 
                                             %622 = OpLabel 
                                       f32_3 %623 = OpLoad %526 
                                                      OpStore %618 %623 
                                                      OpBranch %620 
                                             %620 = OpLabel 
                                       f32_3 %624 = OpLoad %618 
                                       f32_4 %625 = OpLoad %601 
                                       f32_4 %626 = OpVectorShuffle %625 %624 4 5 6 3 
                                                      OpStore %601 %626 
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
Fallback "Hidden/Internal-GUITextureClip"
}