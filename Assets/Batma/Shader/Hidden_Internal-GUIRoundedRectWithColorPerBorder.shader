//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-GUIRoundedRectWithColorPerBorder" {
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
  GpuProgramID 54034
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
; Bound: 855
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %39 %610 %809 %838 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD2 Location 11 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 39 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpDecorate %73 ArrayStride 73 
                                                      OpMemberDecorate %74 0 Offset 74 
                                                      OpMemberDecorate %74 1 Offset 74 
                                                      OpMemberDecorate %74 2 Offset 74 
                                                      OpMemberDecorate %74 3 Offset 74 
                                                      OpMemberDecorate %74 4 Offset 74 
                                                      OpMemberDecorate %74 5 Offset 74 
                                                      OpDecorate %74 Block 
                                                      OpDecorate %76 DescriptorSet 76 
                                                      OpDecorate %76 Binding 76 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %610 RelaxedPrecision 
                                                      OpDecorate %610 Location 610 
                                                      OpDecorate %611 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %614 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %618 RelaxedPrecision 
                                                      OpDecorate %619 RelaxedPrecision 
                                                      OpDecorate %638 RelaxedPrecision 
                                                      OpDecorate %648 RelaxedPrecision 
                                                      OpDecorate %790 RelaxedPrecision 
                                                      OpDecorate %804 RelaxedPrecision 
                                                      OpDecorate %804 DescriptorSet 804 
                                                      OpDecorate %804 Binding 804 
                                                      OpDecorate %805 RelaxedPrecision 
                                                      OpDecorate %806 RelaxedPrecision 
                                                      OpDecorate %806 DescriptorSet 806 
                                                      OpDecorate %806 Binding 806 
                                                      OpDecorate %807 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 809 
                                                      OpDecorate %833 RelaxedPrecision 
                                                      OpDecorate %838 RelaxedPrecision 
                                                      OpDecorate %838 Location 838 
                                                      OpDecorate %846 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 0 
                                              %14 = OpTypePointer Input %6 
                                              %18 = OpTypePointer Private %6 
                                          f32 %20 = OpConstant 3.674022E-40 
                               Private f32_4* %26 = OpVariable Private 
                                              %27 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %28 = OpTypePointer UniformConstant %27 
         UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
                                              %31 = OpTypeSampler 
                                              %32 = OpTypePointer UniformConstant %31 
                     UniformConstant sampler* %33 = OpVariable UniformConstant 
                                              %35 = OpTypeSampledImage %27 
                                              %37 = OpTypeVector %6 2 
                                              %38 = OpTypePointer Input %37 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Private %42 
                               Private f32_3* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.674022E-40 
                                        f32_3 %48 = OpConstantComposite %47 %47 %47 
                               Private f32_3* %50 = OpVariable Private 
                                          f32 %54 = OpConstant 3.674022E-40 
                                        f32_3 %55 = OpConstantComposite %54 %54 %54 
                                          f32 %60 = OpConstant 3.674022E-40 
                                        f32_3 %61 = OpConstantComposite %60 %60 %60 
                                          f32 %63 = OpConstant 3.674022E-40 
                                        f32_3 %64 = OpConstantComposite %63 %63 %63 
                                              %68 = OpTypeInt 32 1 
                                          u32 %69 = OpConstant 4 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeArray %6 %69 
                                              %72 = OpTypeArray %6 %69 
                                              %73 = OpTypeArray %7 %69 
                                              %74 = OpTypeStruct %68 %68 %70 %71 %72 %73 
                                              %75 = OpTypePointer Uniform %74 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; f32_4[4];}* %76 = OpVariable Uniform 
                                          i32 %77 = OpConstant 0 
                                              %78 = OpTypePointer Uniform %68 
                                              %81 = OpTypeBool 
                                              %83 = OpTypePointer Function %42 
                                          i32 %94 = OpConstant 4 
                                              %95 = OpTypePointer Uniform %6 
                                         i32 %101 = OpConstant 2 
                                         f32 %105 = OpConstant 3.674022E-40 
                                Private f32* %111 = OpVariable Private 
                                         u32 %112 = OpConstant 1 
                                         i32 %115 = OpConstant 1 
                                         i32 %120 = OpConstant 3 
                                             %128 = OpTypeVector %81 2 
                                             %129 = OpTypePointer Private %128 
                             Private bool_2* %130 = OpVariable Private 
                                       f32_4 %131 = OpConstantComposite %47 %47 %47 %47 
                                             %134 = OpTypeVector %81 4 
                                             %137 = OpTypeVector %68 3 
                                             %138 = OpTypePointer Private %137 
                              Private i32_3* %139 = OpVariable Private 
                                             %140 = OpTypePointer Private %81 
                                       i32_3 %143 = OpConstantComposite %77 %115 %101 
                                         i32 %144 = OpConstant 8 
                                       i32_3 %145 = OpConstantComposite %120 %101 %144 
                                             %146 = OpTypeVector %81 3 
                                             %149 = OpTypePointer Private %68 
                                Private i32* %150 = OpVariable Private 
                                             %153 = OpTypePointer Function %68 
                              Private f32_4* %167 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %188 = OpConstant 3 
                              Private f32_4* %196 = OpVariable Private 
                                         u32 %223 = OpConstant 2 
                              Private f32_4* %234 = OpVariable Private 
                                             %267 = OpTypePointer Function %7 
                                             %277 = OpTypePointer Private %146 
                             Private bool_3* %278 = OpVariable Private 
                             Private bool_2* %287 = OpVariable Private 
                                             %296 = OpTypePointer Function %128 
                             Private bool_2* %313 = OpVariable Private 
                                Private f32* %335 = OpVariable Private 
                               Private bool* %359 = OpVariable Private 
                               Private bool* %369 = OpVariable Private 
                                             %402 = OpTypeVector %68 4 
                                       i32_4 %404 = OpConstantComposite %77 %77 %101 %77 
                               Private bool* %423 = OpVariable Private 
                                Private i32* %427 = OpVariable Private 
                               Private bool* %430 = OpVariable Private 
                                Private i32* %434 = OpVariable Private 
                               Private bool* %447 = OpVariable Private 
                               Private bool* %452 = OpVariable Private 
                                Private i32* %457 = OpVariable Private 
                                Private i32* %460 = OpVariable Private 
                                         f32 %487 = OpConstant 3.674022E-40 
                              Private f32_4* %490 = OpVariable Private 
                                         f32 %536 = OpConstant 3.674022E-40 
                                       f32_2 %537 = OpConstantComposite %536 %536 
                                Private f32* %560 = OpVariable Private 
                               Private bool* %591 = OpVariable Private 
                              Private f32_3* %608 = OpVariable Private 
                                Input f32_4* %610 = OpVariable Input 
                                Private f32* %614 = OpVariable Private 
                                       i32_4 %623 = OpConstantComposite %101 %94 %144 %77 
                              Private f32_3* %637 = OpVariable Private 
                                         i32 %639 = OpConstant 5 
                                             %641 = OpTypePointer Uniform %7 
                                Private f32* %646 = OpVariable Private 
                                Private f32* %666 = OpVariable Private 
                                Private f32* %690 = OpVariable Private 
                                Private f32* %698 = OpVariable Private 
                                Private f32* %706 = OpVariable Private 
                               Private bool* %738 = OpVariable Private 
                                             %745 = OpTypePointer Function %6 
        UniformConstant read_only Texture2D* %804 = OpVariable UniformConstant 
                    UniformConstant sampler* %806 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                               Private bool* %814 = OpVariable Private 
                                             %837 = OpTypePointer Output %7 
                               Output f32_4* %838 = OpVariable Output 
                                             %852 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %84 = OpVariable Function 
                               Function i32* %154 = OpVariable Function 
                             Function f32_4* %268 = OpVariable Function 
                            Function bool_2* %297 = OpVariable Function 
                            Function bool_2* %322 = OpVariable Function 
                               Function i32* %581 = OpVariable Function 
                               Function i32* %596 = OpVariable Function 
                               Function f32* %746 = OpVariable Function 
                               Function f32* %755 = OpVariable Function 
                               Function f32* %769 = OpVariable Function 
                               Function f32* %780 = OpVariable Function 
                             Function f32_3* %840 = OpVariable Function 
                                   Input f32* %15 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %16 = OpLoad %15 
                                          f32 %17 = OpDPdx %16 
                                 Private f32* %19 = OpAccessChain %9 %13 
                                                      OpStore %19 %17 
                                 Private f32* %21 = OpAccessChain %9 %13 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpExtInst %1 4 %22 
                                          f32 %24 = OpFDiv %20 %23 
                                 Private f32* %25 = OpAccessChain %9 %13 
                                                      OpStore %25 %24 
                          read_only Texture2D %30 = OpLoad %29 
                                      sampler %34 = OpLoad %33 
                   read_only Texture2DSampled %36 = OpSampledImage %30 %34 
                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
                                        f32_4 %41 = OpImageSampleImplicitLod %36 %40 
                                                      OpStore %26 %41 
                                        f32_4 %45 = OpLoad %26 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %49 = OpExtInst %1 40 %46 %48 
                                                      OpStore %44 %49 
                                        f32_3 %51 = OpLoad %44 
                                        f32_3 %52 = OpExtInst %1 30 %51 
                                                      OpStore %50 %52 
                                        f32_3 %53 = OpLoad %50 
                                        f32_3 %56 = OpFMul %53 %55 
                                                      OpStore %50 %56 
                                        f32_3 %57 = OpLoad %50 
                                        f32_3 %58 = OpExtInst %1 29 %57 
                                                      OpStore %50 %58 
                                        f32_3 %59 = OpLoad %50 
                                        f32_3 %62 = OpFMul %59 %61 
                                        f32_3 %65 = OpFAdd %62 %64 
                                                      OpStore %50 %65 
                                        f32_3 %66 = OpLoad %50 
                                        f32_3 %67 = OpExtInst %1 40 %66 %48 
                                                      OpStore %50 %67 
                                 Uniform i32* %79 = OpAccessChain %76 %77 
                                          i32 %80 = OpLoad %79 
                                         bool %82 = OpINotEqual %80 %77 
                                                      OpSelectionMerge %86 None 
                                                      OpBranchConditional %82 %85 %88 
                                              %85 = OpLabel 
                                        f32_3 %87 = OpLoad %50 
                                                      OpStore %84 %87 
                                                      OpBranch %86 
                                              %88 = OpLabel 
                                        f32_4 %89 = OpLoad %26 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                                      OpStore %84 %90 
                                                      OpBranch %86 
                                              %86 = OpLabel 
                                        f32_3 %91 = OpLoad %84 
                                                      OpStore %44 %91 
                                   Input f32* %92 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %96 = OpAccessChain %76 %94 %77 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                          f32 %99 = OpFAdd %93 %98 
                                Private f32* %100 = OpAccessChain %50 %13 
                                                      OpStore %100 %99 
                                Uniform f32* %102 = OpAccessChain %76 %94 %101 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFNegate %103 
                                         f32 %106 = OpFMul %104 %105 
                                Private f32* %107 = OpAccessChain %50 %13 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFAdd %106 %108 
                                Private f32* %110 = OpAccessChain %50 %13 
                                                      OpStore %110 %109 
                                  Input f32* %113 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %76 %94 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFNegate %117 
                                         f32 %119 = OpFAdd %114 %118 
                                                      OpStore %111 %119 
                                Uniform f32* %121 = OpAccessChain %76 %94 %120 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                         f32 %124 = OpFMul %123 %105 
                                         f32 %125 = OpLoad %111 
                                         f32 %126 = OpFAdd %124 %125 
                                Private f32* %127 = OpAccessChain %50 %112 
                                                      OpStore %127 %126 
                                       f32_3 %132 = OpLoad %50 
                                       f32_4 %133 = OpVectorShuffle %132 %132 0 1 0 0 
                                      bool_4 %135 = OpFOrdGreaterThanEqual %131 %133 
                                      bool_2 %136 = OpVectorShuffle %135 %135 0 1 
                                                      OpStore %130 %136 
                               Private bool* %141 = OpAccessChain %130 %112 
                                        bool %142 = OpLoad %141 
                                      bool_3 %147 = OpCompositeConstruct %142 %142 %142 
                                       i32_3 %148 = OpSelect %147 %143 %145 
                                                      OpStore %139 %148 
                               Private bool* %151 = OpAccessChain %130 %13 
                                        bool %152 = OpLoad %151 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %152 %155 %159 
                                             %155 = OpLabel 
                                Private i32* %157 = OpAccessChain %139 %13 
                                         i32 %158 = OpLoad %157 
                                                      OpStore %154 %158 
                                                      OpBranch %156 
                                             %159 = OpLabel 
                                Private i32* %160 = OpAccessChain %139 %112 
                                         i32 %161 = OpLoad %160 
                                                      OpStore %154 %161 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                         i32 %162 = OpLoad %154 
                                                      OpStore %150 %162 
                               Private bool* %163 = OpAccessChain %130 %13 
                                        bool %164 = OpLoad %163 
                                         i32 %165 = OpSelect %164 %115 %94 
                                Private i32* %166 = OpAccessChain %139 %13 
                                                      OpStore %166 %165 
                                Uniform f32* %168 = OpAccessChain %76 %94 %77 
                                         f32 %169 = OpLoad %168 
                                         i32 %170 = OpLoad %150 
                                Uniform f32* %171 = OpAccessChain %76 %101 %170 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFAdd %169 %172 
                                Private f32* %174 = OpAccessChain %167 %112 
                                                      OpStore %174 %173 
                                Uniform f32* %176 = OpAccessChain %76 %94 %115 
                                         f32 %177 = OpLoad %176 
                                         i32 %178 = OpLoad %150 
                                Uniform f32* %179 = OpAccessChain %76 %101 %178 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFAdd %177 %180 
                                Private f32* %182 = OpAccessChain %175 %112 
                                                      OpStore %182 %181 
                                Uniform f32* %183 = OpAccessChain %76 %120 %77 
                                         f32 %184 = OpLoad %183 
                                Uniform f32* %185 = OpAccessChain %76 %94 %77 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFAdd %184 %186 
                                Private f32* %189 = OpAccessChain %167 %188 
                                                      OpStore %189 %187 
                                Uniform f32* %190 = OpAccessChain %76 %120 %115 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %76 %94 %115 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFAdd %191 %193 
                                Private f32* %195 = OpAccessChain %175 %188 
                                                      OpStore %195 %194 
                                Uniform f32* %197 = OpAccessChain %76 %94 %77 
                                         f32 %198 = OpLoad %197 
                                Uniform f32* %199 = OpAccessChain %76 %94 %101 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFAdd %198 %200 
                                Private f32* %202 = OpAccessChain %196 %13 
                                                      OpStore %202 %201 
                                Private f32* %203 = OpAccessChain %196 %13 
                                         f32 %204 = OpLoad %203 
                                         i32 %205 = OpLoad %150 
                                Uniform f32* %206 = OpAccessChain %76 %101 %205 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFNegate %207 
                                         f32 %209 = OpFAdd %204 %208 
                                Private f32* %210 = OpAccessChain %196 %112 
                                                      OpStore %210 %209 
                                Private f32* %211 = OpAccessChain %196 %13 
                                         f32 %212 = OpLoad %211 
                                Uniform f32* %213 = OpAccessChain %76 %120 %101 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFNegate %214 
                                         f32 %216 = OpFAdd %212 %215 
                                Private f32* %217 = OpAccessChain %196 %188 
                                                      OpStore %217 %216 
                                Uniform f32* %218 = OpAccessChain %76 %94 %77 
                                         f32 %219 = OpLoad %218 
                                Private f32* %220 = OpAccessChain %167 %13 
                                                      OpStore %220 %219 
                                Uniform f32* %221 = OpAccessChain %76 %120 %77 
                                         f32 %222 = OpLoad %221 
                                Private f32* %224 = OpAccessChain %167 %223 
                                                      OpStore %224 %222 
                                Uniform f32* %225 = OpAccessChain %76 %120 %101 
                                         f32 %226 = OpLoad %225 
                                Private f32* %227 = OpAccessChain %196 %223 
                                                      OpStore %227 %226 
                               Private bool* %228 = OpAccessChain %130 %13 
                                        bool %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %167 
                                       f32_4 %231 = OpLoad %196 
                                      bool_4 %232 = OpCompositeConstruct %229 %229 %229 %229 
                                       f32_4 %233 = OpSelect %232 %230 %231 
                                                      OpStore %196 %233 
                                Uniform f32* %235 = OpAccessChain %76 %94 %115 
                                         f32 %236 = OpLoad %235 
                                Uniform f32* %237 = OpAccessChain %76 %94 %120 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFAdd %236 %238 
                                Private f32* %240 = OpAccessChain %234 %13 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %234 %13 
                                         f32 %242 = OpLoad %241 
                                         i32 %243 = OpLoad %150 
                                Uniform f32* %244 = OpAccessChain %76 %101 %243 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFNegate %245 
                                         f32 %247 = OpFAdd %242 %246 
                                Private f32* %248 = OpAccessChain %234 %112 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %234 %13 
                                         f32 %250 = OpLoad %249 
                                Uniform f32* %251 = OpAccessChain %76 %120 %120 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFNegate %252 
                                         f32 %254 = OpFAdd %250 %253 
                                Private f32* %255 = OpAccessChain %234 %188 
                                                      OpStore %255 %254 
                                Uniform f32* %256 = OpAccessChain %76 %94 %115 
                                         f32 %257 = OpLoad %256 
                                Private f32* %258 = OpAccessChain %175 %13 
                                                      OpStore %258 %257 
                                Uniform f32* %259 = OpAccessChain %76 %120 %115 
                                         f32 %260 = OpLoad %259 
                                Private f32* %261 = OpAccessChain %175 %223 
                                                      OpStore %261 %260 
                                Uniform f32* %262 = OpAccessChain %76 %120 %120 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %234 %223 
                                                      OpStore %264 %263 
                               Private bool* %265 = OpAccessChain %130 %112 
                                        bool %266 = OpLoad %265 
                                                      OpSelectionMerge %270 None 
                                                      OpBranchConditional %266 %269 %273 
                                             %269 = OpLabel 
                                       f32_4 %271 = OpLoad %175 
                                       f32_4 %272 = OpVectorShuffle %271 %271 1 0 2 3 
                                                      OpStore %268 %272 
                                                      OpBranch %270 
                                             %273 = OpLabel 
                                       f32_4 %274 = OpLoad %234 
                                       f32_4 %275 = OpVectorShuffle %274 %274 1 0 2 3 
                                                      OpStore %268 %275 
                                                      OpBranch %270 
                                             %270 = OpLabel 
                                       f32_4 %276 = OpLoad %268 
                                                      OpStore %234 %276 
                                       f32_4 %279 = OpLoad %196 
                                       f32_4 %280 = OpVectorShuffle %279 %279 1 3 1 1 
                                       f32_4 %281 = OpLoad vs_TEXCOORD2 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 0 0 0 
                                      bool_4 %283 = OpFOrdGreaterThanEqual %280 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                      bool_3 %285 = OpLoad %278 
                                      bool_3 %286 = OpVectorShuffle %285 %284 3 4 2 
                                                      OpStore %278 %286 
                                       f32_4 %288 = OpLoad vs_TEXCOORD2 
                                       f32_4 %289 = OpVectorShuffle %288 %288 0 0 0 0 
                                       f32_4 %290 = OpLoad %196 
                                       f32_4 %291 = OpVectorShuffle %290 %290 1 3 1 1 
                                      bool_4 %292 = OpFOrdGreaterThanEqual %289 %291 
                                      bool_2 %293 = OpVectorShuffle %292 %292 0 1 
                                                      OpStore %287 %293 
                               Private bool* %294 = OpAccessChain %130 %13 
                                        bool %295 = OpLoad %294 
                                                      OpSelectionMerge %299 None 
                                                      OpBranchConditional %295 %298 %302 
                                             %298 = OpLabel 
                                      bool_3 %300 = OpLoad %278 
                                      bool_2 %301 = OpVectorShuffle %300 %300 0 1 
                                                      OpStore %297 %301 
                                                      OpBranch %299 
                                             %302 = OpLabel 
                                      bool_2 %303 = OpLoad %287 
                                                      OpStore %297 %303 
                                                      OpBranch %299 
                                             %299 = OpLabel 
                                      bool_2 %304 = OpLoad %297 
                                      bool_3 %305 = OpLoad %278 
                                      bool_3 %306 = OpVectorShuffle %305 %304 3 4 2 
                                                      OpStore %278 %306 
                                       f32_4 %307 = OpLoad %234 
                                       f32_4 %308 = OpVectorShuffle %307 %307 0 3 0 0 
                                       f32_4 %309 = OpLoad vs_TEXCOORD2 
                                       f32_4 %310 = OpVectorShuffle %309 %309 1 1 1 1 
                                      bool_4 %311 = OpFOrdGreaterThanEqual %308 %310 
                                      bool_2 %312 = OpVectorShuffle %311 %311 0 1 
                                                      OpStore %287 %312 
                                       f32_4 %314 = OpLoad vs_TEXCOORD2 
                                       f32_4 %315 = OpVectorShuffle %314 %314 1 1 1 1 
                                       f32_4 %316 = OpLoad %234 
                                       f32_4 %317 = OpVectorShuffle %316 %316 0 3 0 0 
                                      bool_4 %318 = OpFOrdGreaterThanEqual %315 %317 
                                      bool_2 %319 = OpVectorShuffle %318 %318 0 1 
                                                      OpStore %313 %319 
                               Private bool* %320 = OpAccessChain %130 %112 
                                        bool %321 = OpLoad %320 
                                                      OpSelectionMerge %324 None 
                                                      OpBranchConditional %321 %323 %326 
                                             %323 = OpLabel 
                                      bool_2 %325 = OpLoad %287 
                                                      OpStore %322 %325 
                                                      OpBranch %324 
                                             %326 = OpLabel 
                                      bool_2 %327 = OpLoad %313 
                                                      OpStore %322 %327 
                                                      OpBranch %324 
                                             %324 = OpLabel 
                                      bool_2 %328 = OpLoad %322 
                                                      OpStore %130 %328 
                               Private bool* %329 = OpAccessChain %130 %13 
                                        bool %330 = OpLoad %329 
                               Private bool* %331 = OpAccessChain %278 %13 
                                        bool %332 = OpLoad %331 
                                        bool %333 = OpLogicalAnd %330 %332 
                               Private bool* %334 = OpAccessChain %130 %13 
                                                      OpStore %334 %333 
                                Uniform f32* %336 = OpAccessChain %76 %120 %77 
                                         f32 %337 = OpLoad %336 
                                Uniform f32* %338 = OpAccessChain %76 %120 %101 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFAdd %337 %339 
                                                      OpStore %335 %340 
                                         f32 %341 = OpLoad %335 
                                         f32 %342 = OpFNegate %341 
                                Uniform f32* %343 = OpAccessChain %76 %94 %101 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFAdd %342 %344 
                                                      OpStore %335 %345 
                                Uniform f32* %346 = OpAccessChain %76 %120 %115 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %348 = OpAccessChain %76 %120 %120 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFAdd %347 %349 
                                Private f32* %351 = OpAccessChain %167 %13 
                                                      OpStore %351 %350 
                                Private f32* %352 = OpAccessChain %167 %13 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpFNegate %353 
                                Uniform f32* %355 = OpAccessChain %76 %94 %120 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFAdd %354 %356 
                                Private f32* %358 = OpAccessChain %167 %13 
                                                      OpStore %358 %357 
                                  Input f32* %360 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %361 = OpLoad %360 
                                Private f32* %362 = OpAccessChain %167 %188 
                                         f32 %363 = OpLoad %362 
                                        bool %364 = OpFOrdGreaterThanEqual %361 %363 
                                                      OpStore %359 %364 
                                         f32 %365 = OpLoad %335 
                                Private f32* %366 = OpAccessChain %167 %188 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFAdd %365 %367 
                                                      OpStore %335 %368 
                                         f32 %370 = OpLoad %335 
                                  Input f32* %371 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %372 = OpLoad %371 
                                        bool %373 = OpFOrdGreaterThanEqual %370 %372 
                                                      OpStore %369 %373 
                                        bool %374 = OpLoad %369 
                                        bool %375 = OpLoad %359 
                                        bool %376 = OpLogicalAnd %374 %375 
                                                      OpStore %369 %376 
                                  Input f32* %377 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %378 = OpLoad %377 
                                Private f32* %379 = OpAccessChain %175 %188 
                                         f32 %380 = OpLoad %379 
                                        bool %381 = OpFOrdGreaterThanEqual %378 %380 
                                                      OpStore %359 %381 
                                        bool %382 = OpLoad %369 
                                        bool %383 = OpLoad %359 
                                        bool %384 = OpLogicalAnd %382 %383 
                                                      OpStore %369 %384 
                                Private f32* %385 = OpAccessChain %167 %13 
                                         f32 %386 = OpLoad %385 
                                Private f32* %387 = OpAccessChain %175 %188 
                                         f32 %388 = OpLoad %387 
                                         f32 %389 = OpFAdd %386 %388 
                                Private f32* %390 = OpAccessChain %167 %13 
                                                      OpStore %390 %389 
                                Private f32* %391 = OpAccessChain %167 %13 
                                         f32 %392 = OpLoad %391 
                                  Input f32* %393 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %394 = OpLoad %393 
                                        bool %395 = OpFOrdGreaterThanEqual %392 %394 
                               Private bool* %396 = OpAccessChain %278 %13 
                                                      OpStore %396 %395 
                                        bool %397 = OpLoad %369 
                               Private bool* %398 = OpAccessChain %278 %13 
                                        bool %399 = OpLoad %398 
                                        bool %400 = OpLogicalAnd %397 %399 
                                                      OpStore %369 %400 
                                         i32 %401 = OpLoad %150 
                                       i32_4 %403 = OpCompositeConstruct %401 %401 %401 %401 
                                      bool_4 %405 = OpIEqual %403 %404 
                                      bool_2 %406 = OpVectorShuffle %405 %405 0 2 
                                      bool_3 %407 = OpLoad %278 
                                      bool_3 %408 = OpVectorShuffle %407 %406 3 1 4 
                                                      OpStore %278 %408 
                               Private bool* %409 = OpAccessChain %278 %223 
                                        bool %410 = OpLoad %409 
                               Private bool* %411 = OpAccessChain %278 %13 
                                        bool %412 = OpLoad %411 
                                        bool %413 = OpLogicalOr %410 %412 
                               Private bool* %414 = OpAccessChain %278 %13 
                                                      OpStore %414 %413 
                                         i32 %415 = OpLoad %150 
                                Uniform f32* %416 = OpAccessChain %76 %101 %415 
                                         f32 %417 = OpLoad %416 
                                        bool %418 = OpFOrdLessThan %47 %417 
                                                      OpStore %359 %418 
                               Private bool* %419 = OpAccessChain %130 %13 
                                        bool %420 = OpLoad %419 
                                        bool %421 = OpLoad %359 
                                        bool %422 = OpLogicalAnd %420 %421 
                                                      OpStore %359 %422 
                                Private f32* %424 = OpAccessChain %196 %223 
                                         f32 %425 = OpLoad %424 
                                        bool %426 = OpFOrdLessThan %47 %425 
                                                      OpStore %423 %426 
                                        bool %428 = OpLoad %423 
                                         i32 %429 = OpSelect %428 %115 %77 
                                                      OpStore %427 %429 
                                Private f32* %431 = OpAccessChain %234 %223 
                                         f32 %432 = OpLoad %431 
                                        bool %433 = OpFOrdLessThan %47 %432 
                                                      OpStore %430 %433 
                                        bool %435 = OpLoad %430 
                                         i32 %436 = OpSelect %435 %115 %77 
                                                      OpStore %434 %436 
                                Private i32* %437 = OpAccessChain %139 %223 
                                         i32 %438 = OpLoad %437 
                                         i32 %439 = OpLoad %434 
                                         i32 %440 = OpIMul %438 %439 
                                                      OpStore %434 %440 
                                         i32 %441 = OpLoad %427 
                                Private i32* %442 = OpAccessChain %139 %13 
                                         i32 %443 = OpLoad %442 
                                         i32 %444 = OpIMul %441 %443 
                                         i32 %445 = OpLoad %434 
                                         i32 %446 = OpIAdd %444 %445 
                                                      OpStore %427 %446 
                               Private bool* %448 = OpAccessChain %278 %112 
                                        bool %449 = OpLoad %448 
                                        bool %450 = OpLoad %423 
                                        bool %451 = OpLogicalAnd %449 %450 
                                                      OpStore %447 %451 
                               Private bool* %453 = OpAccessChain %130 %112 
                                        bool %454 = OpLoad %453 
                                        bool %455 = OpLoad %430 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %452 %456 
                                        bool %458 = OpLoad %447 
                                         i32 %459 = OpSelect %458 %115 %77 
                                                      OpStore %457 %459 
                                        bool %461 = OpLoad %452 
                                         i32 %462 = OpSelect %461 %115 %77 
                                                      OpStore %460 %462 
                                Private i32* %463 = OpAccessChain %139 %223 
                                         i32 %464 = OpLoad %463 
                                         i32 %465 = OpLoad %460 
                                         i32 %466 = OpIMul %464 %465 
                                                      OpStore %460 %466 
                                         i32 %467 = OpLoad %457 
                                Private i32* %468 = OpAccessChain %139 %13 
                                         i32 %469 = OpLoad %468 
                                         i32 %470 = OpIMul %467 %469 
                                         i32 %471 = OpLoad %460 
                                         i32 %472 = OpIAdd %470 %471 
                                                      OpStore %460 %472 
                                        bool %473 = OpLoad %369 
                                         i32 %474 = OpLoad %460 
                                         i32 %475 = OpSelect %473 %77 %474 
                                                      OpStore %460 %475 
                                        bool %476 = OpLoad %359 
                                         i32 %477 = OpLoad %427 
                                         i32 %478 = OpLoad %460 
                                         i32 %479 = OpSelect %476 %477 %478 
                                                      OpStore %460 %479 
                                Private i32* %480 = OpAccessChain %139 %223 
                                         i32 %481 = OpLoad %480 
                                Private i32* %482 = OpAccessChain %139 %13 
                                         i32 %483 = OpLoad %482 
                                         i32 %484 = OpIAdd %481 %483 
                                                      OpStore %457 %484 
                               Private bool* %485 = OpAccessChain %278 %13 
                                        bool %486 = OpLoad %485 
                                         f32 %488 = OpSelect %486 %20 %487 
                                Private f32* %489 = OpAccessChain %167 %13 
                                                      OpStore %489 %488 
                                       f32_4 %491 = OpLoad %196 
                                       f32_2 %492 = OpVectorShuffle %491 %491 3 1 
                                       f32_4 %493 = OpLoad %490 
                                       f32_4 %494 = OpVectorShuffle %493 %492 4 1 5 3 
                                                      OpStore %490 %494 
                                       f32_4 %495 = OpLoad %234 
                                       f32_2 %496 = OpVectorShuffle %495 %495 3 0 
                                       f32_4 %497 = OpLoad %490 
                                       f32_4 %498 = OpVectorShuffle %497 %496 0 4 2 5 
                                                      OpStore %490 %498 
                                Private f32* %499 = OpAccessChain %196 %13 
                                         f32 %500 = OpLoad %499 
                                Private f32* %501 = OpAccessChain %234 %13 
                                                      OpStore %501 %500 
                                       f32_4 %502 = OpLoad %490 
                                       f32_2 %503 = OpVectorShuffle %502 %502 1 0 
                                       f32_2 %504 = OpFNegate %503 
                                       f32_4 %505 = OpLoad %234 
                                       f32_2 %506 = OpVectorShuffle %505 %505 1 0 
                                       f32_2 %507 = OpFAdd %504 %506 
                                       f32_4 %508 = OpLoad %175 
                                       f32_4 %509 = OpVectorShuffle %508 %507 4 1 5 3 
                                                      OpStore %175 %509 
                                       f32_4 %510 = OpLoad %167 
                                       f32_2 %511 = OpVectorShuffle %510 %510 0 0 
                                       f32_4 %512 = OpLoad %175 
                                       f32_2 %513 = OpVectorShuffle %512 %512 0 2 
                                       f32_2 %514 = OpFMul %511 %513 
                                       f32_4 %515 = OpLoad %167 
                                       f32_4 %516 = OpVectorShuffle %515 %514 4 1 5 3 
                                                      OpStore %167 %516 
                                       f32_4 %517 = OpLoad %167 
                                       f32_2 %518 = OpVectorShuffle %517 %517 0 2 
                                       f32_4 %519 = OpLoad %167 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 2 
                                         f32 %521 = OpDot %518 %520 
                                Private f32* %522 = OpAccessChain %175 %13 
                                                      OpStore %522 %521 
                                Private f32* %523 = OpAccessChain %175 %13 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpExtInst %1 32 %524 
                                Private f32* %526 = OpAccessChain %175 %13 
                                                      OpStore %526 %525 
                                       f32_4 %527 = OpLoad %167 
                                       f32_2 %528 = OpVectorShuffle %527 %527 0 2 
                                       f32_4 %529 = OpLoad %175 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 0 
                                       f32_2 %531 = OpFMul %528 %530 
                                       f32_4 %532 = OpLoad %167 
                                       f32_4 %533 = OpVectorShuffle %532 %531 4 1 5 3 
                                                      OpStore %167 %533 
                                       f32_4 %534 = OpLoad %167 
                                       f32_2 %535 = OpVectorShuffle %534 %534 0 2 
                                       f32_2 %538 = OpFMul %535 %537 
                                       f32_4 %539 = OpLoad %234 
                                       f32_2 %540 = OpVectorShuffle %539 %539 1 0 
                                       f32_2 %541 = OpFAdd %538 %540 
                                       f32_4 %542 = OpLoad %167 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 1 5 3 
                                                      OpStore %167 %543 
                                       f32_4 %544 = OpLoad %167 
                                       f32_2 %545 = OpVectorShuffle %544 %544 2 0 
                                       f32_2 %546 = OpFNegate %545 
                                       f32_4 %547 = OpLoad %234 
                                       f32_2 %548 = OpVectorShuffle %547 %547 0 1 
                                       f32_2 %549 = OpFAdd %546 %548 
                                       f32_4 %550 = OpLoad %175 
                                       f32_4 %551 = OpVectorShuffle %550 %549 4 1 5 3 
                                                      OpStore %175 %551 
                                       f32_4 %552 = OpLoad %167 
                                       f32_2 %553 = OpVectorShuffle %552 %552 0 2 
                                       f32_2 %554 = OpFNegate %553 
                                       f32_4 %555 = OpLoad vs_TEXCOORD2 
                                       f32_2 %556 = OpVectorShuffle %555 %555 1 0 
                                       f32_2 %557 = OpFAdd %554 %556 
                                       f32_4 %558 = OpLoad %167 
                                       f32_4 %559 = OpVectorShuffle %558 %557 4 1 5 3 
                                                      OpStore %167 %559 
                                Private f32* %561 = OpAccessChain %167 %223 
                                         f32 %562 = OpLoad %561 
                                Private f32* %563 = OpAccessChain %175 %223 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpFMul %562 %564 
                                                      OpStore %560 %565 
                                Private f32* %566 = OpAccessChain %175 %13 
                                         f32 %567 = OpLoad %566 
                                Private f32* %568 = OpAccessChain %167 %13 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFMul %567 %569 
                                         f32 %571 = OpLoad %560 
                                         f32 %572 = OpFNegate %571 
                                         f32 %573 = OpFAdd %570 %572 
                                Private f32* %574 = OpAccessChain %167 %13 
                                                      OpStore %574 %573 
                                Private f32* %575 = OpAccessChain %167 %13 
                                         f32 %576 = OpLoad %575 
                                        bool %577 = OpFOrdGreaterThanEqual %576 %47 
                               Private bool* %578 = OpAccessChain %278 %13 
                                                      OpStore %578 %577 
                               Private bool* %579 = OpAccessChain %278 %13 
                                        bool %580 = OpLoad %579 
                                                      OpSelectionMerge %583 None 
                                                      OpBranchConditional %580 %582 %586 
                                             %582 = OpLabel 
                                Private i32* %584 = OpAccessChain %139 %13 
                                         i32 %585 = OpLoad %584 
                                                      OpStore %581 %585 
                                                      OpBranch %583 
                                             %586 = OpLabel 
                                Private i32* %587 = OpAccessChain %139 %223 
                                         i32 %588 = OpLoad %587 
                                                      OpStore %581 %588 
                                                      OpBranch %583 
                                             %583 = OpLabel 
                                         i32 %589 = OpLoad %581 
                                Private i32* %590 = OpAccessChain %139 %13 
                                                      OpStore %590 %589 
                                         i32 %592 = OpLoad %460 
                                         i32 %593 = OpLoad %457 
                                        bool %594 = OpINotEqual %592 %593 
                                                      OpStore %591 %594 
                                        bool %595 = OpLoad %591 
                                                      OpSelectionMerge %598 None 
                                                      OpBranchConditional %595 %597 %600 
                                             %597 = OpLabel 
                                         i32 %599 = OpLoad %460 
                                                      OpStore %596 %599 
                                                      OpBranch %598 
                                             %600 = OpLabel 
                                Private i32* %601 = OpAccessChain %139 %13 
                                         i32 %602 = OpLoad %601 
                                                      OpStore %596 %602 
                                                      OpBranch %598 
                                             %598 = OpLabel 
                                         i32 %603 = OpLoad %596 
                                                      OpStore %460 %603 
                                         i32 %604 = OpLoad %460 
                                        bool %605 = OpIEqual %604 %77 
                                                      OpSelectionMerge %607 None 
                                                      OpBranchConditional %605 %606 %620 
                                             %606 = OpLabel 
                                       f32_3 %609 = OpLoad %44 
                                       f32_4 %611 = OpLoad %610 
                                       f32_3 %612 = OpVectorShuffle %611 %611 0 1 2 
                                       f32_3 %613 = OpFMul %609 %612 
                                                      OpStore %608 %613 
                                Private f32* %615 = OpAccessChain %26 %188 
                                         f32 %616 = OpLoad %615 
                                  Input f32* %617 = OpAccessChain %610 %188 
                                         f32 %618 = OpLoad %617 
                                         f32 %619 = OpFMul %616 %618 
                                                      OpStore %614 %619 
                                                      OpBranch %607 
                                             %620 = OpLabel 
                                         i32 %621 = OpLoad %460 
                                       i32_4 %622 = OpCompositeConstruct %621 %621 %621 %621 
                                      bool_4 %624 = OpIEqual %622 %623 
                                      bool_3 %625 = OpVectorShuffle %624 %624 0 1 2 
                                                      OpStore %278 %625 
                               Private bool* %626 = OpAccessChain %278 %223 
                                        bool %627 = OpLoad %626 
                                         i32 %628 = OpSelect %627 %120 %77 
                                                      OpStore %460 %628 
                               Private bool* %629 = OpAccessChain %278 %112 
                                        bool %630 = OpLoad %629 
                                         i32 %631 = OpLoad %460 
                                         i32 %632 = OpSelect %630 %101 %631 
                                                      OpStore %460 %632 
                               Private bool* %633 = OpAccessChain %278 %13 
                                        bool %634 = OpLoad %633 
                                         i32 %635 = OpLoad %460 
                                         i32 %636 = OpSelect %634 %115 %635 
                                                      OpStore %460 %636 
                                       f32_3 %638 = OpLoad %44 
                                         i32 %640 = OpLoad %460 
                              Uniform f32_4* %642 = OpAccessChain %76 %639 %640 
                                       f32_4 %643 = OpLoad %642 
                                       f32_3 %644 = OpVectorShuffle %643 %643 0 1 2 
                                       f32_3 %645 = OpFMul %638 %644 
                                                      OpStore %637 %645 
                                Private f32* %647 = OpAccessChain %26 %188 
                                         f32 %648 = OpLoad %647 
                                         i32 %649 = OpLoad %460 
                                Uniform f32* %650 = OpAccessChain %76 %639 %649 %188 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %648 %651 
                                                      OpStore %646 %652 
                                       f32_3 %653 = OpLoad %637 
                                                      OpStore %608 %653 
                                         f32 %654 = OpLoad %646 
                                                      OpStore %614 %654 
                                                      OpBranch %607 
                                             %607 = OpLabel 
                                        bool %655 = OpLoad %423 
                                        bool %656 = OpLoad %430 
                                        bool %657 = OpLogicalOr %655 %656 
                                                      OpStore %452 %657 
                                       f32_4 %658 = OpLoad %490 
                                       f32_2 %659 = OpVectorShuffle %658 %658 2 3 
                                       f32_2 %660 = OpFNegate %659 
                                       f32_4 %661 = OpLoad vs_TEXCOORD2 
                                       f32_2 %662 = OpVectorShuffle %661 %661 0 1 
                                       f32_2 %663 = OpFAdd %660 %662 
                                       f32_4 %664 = OpLoad %167 
                                       f32_4 %665 = OpVectorShuffle %664 %663 4 5 2 3 
                                                      OpStore %167 %665 
                                       f32_4 %667 = OpLoad %167 
                                       f32_2 %668 = OpVectorShuffle %667 %667 0 1 
                                       f32_4 %669 = OpLoad %167 
                                       f32_2 %670 = OpVectorShuffle %669 %669 0 1 
                                         f32 %671 = OpDot %668 %670 
                                                      OpStore %666 %671 
                                         f32 %672 = OpLoad %666 
                                         f32 %673 = OpExtInst %1 31 %672 
                                                      OpStore %666 %673 
                                         f32 %674 = OpLoad %666 
                                         i32 %675 = OpLoad %150 
                                Uniform f32* %676 = OpAccessChain %76 %101 %675 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFNegate %677 
                                         f32 %679 = OpFAdd %674 %678 
                                                      OpStore %666 %679 
                                         f32 %680 = OpLoad %666 
                                Private f32* %681 = OpAccessChain %9 %13 
                                         f32 %682 = OpLoad %681 
                                         f32 %683 = OpFMul %680 %682 
                                         f32 %684 = OpFAdd %683 %105 
                                                      OpStore %666 %684 
                                         f32 %685 = OpLoad %666 
                                         f32 %686 = OpExtInst %1 43 %685 %47 %20 
                                                      OpStore %666 %686 
                                        bool %687 = OpLoad %452 
                                         f32 %688 = OpLoad %666 
                                         f32 %689 = OpSelect %687 %688 %47 
                                                      OpStore %666 %689 
                                Private f32* %691 = OpAccessChain %196 %223 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpFNegate %692 
                                         i32 %694 = OpLoad %150 
                                Uniform f32* %695 = OpAccessChain %76 %101 %694 
                                         f32 %696 = OpLoad %695 
                                         f32 %697 = OpFAdd %693 %696 
                                                      OpStore %690 %697 
                                Private f32* %699 = OpAccessChain %234 %223 
                                         f32 %700 = OpLoad %699 
                                         f32 %701 = OpFNegate %700 
                                         i32 %702 = OpLoad %150 
                                Uniform f32* %703 = OpAccessChain %76 %101 %702 
                                         f32 %704 = OpLoad %703 
                                         f32 %705 = OpFAdd %701 %704 
                                                      OpStore %698 %705 
                                         f32 %707 = OpLoad %690 
                                         f32 %708 = OpLoad %698 
                                         f32 %709 = OpFDiv %707 %708 
                                                      OpStore %706 %709 
                                         f32 %710 = OpLoad %706 
                                Private f32* %711 = OpAccessChain %167 %112 
                                         f32 %712 = OpLoad %711 
                                         f32 %713 = OpFMul %710 %712 
                                Private f32* %714 = OpAccessChain %167 %223 
                                                      OpStore %714 %713 
                                       f32_4 %715 = OpLoad %167 
                                       f32_2 %716 = OpVectorShuffle %715 %715 0 2 
                                       f32_4 %717 = OpLoad %167 
                                       f32_2 %718 = OpVectorShuffle %717 %717 0 2 
                                         f32 %719 = OpDot %716 %718 
                                                      OpStore %706 %719 
                                         f32 %720 = OpLoad %706 
                                         f32 %721 = OpExtInst %1 31 %720 
                                                      OpStore %706 %721 
                                         f32 %722 = OpLoad %690 
                                         f32 %723 = OpFNegate %722 
                                         f32 %724 = OpLoad %706 
                                         f32 %725 = OpFAdd %723 %724 
                                                      OpStore %706 %725 
                                         f32 %726 = OpLoad %706 
                                Private f32* %727 = OpAccessChain %9 %13 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFMul %726 %728 
                                         f32 %730 = OpFAdd %729 %105 
                                Private f32* %731 = OpAccessChain %9 %13 
                                                      OpStore %731 %730 
                                Private f32* %732 = OpAccessChain %9 %13 
                                         f32 %733 = OpLoad %732 
                                         f32 %734 = OpExtInst %1 43 %733 %47 %20 
                                Private f32* %735 = OpAccessChain %9 %13 
                                                      OpStore %735 %734 
                                         f32 %736 = OpLoad %690 
                                        bool %737 = OpFOrdLessThan %47 %736 
                                                      OpStore %591 %737 
                                         f32 %739 = OpLoad %698 
                                        bool %740 = OpFOrdLessThan %47 %739 
                                                      OpStore %738 %740 
                                        bool %741 = OpLoad %738 
                                        bool %742 = OpLoad %591 
                                        bool %743 = OpLogicalAnd %741 %742 
                                                      OpStore %738 %743 
                                        bool %744 = OpLoad %738 
                                                      OpSelectionMerge %748 None 
                                                      OpBranchConditional %744 %747 %751 
                                             %747 = OpLabel 
                                Private f32* %749 = OpAccessChain %9 %13 
                                         f32 %750 = OpLoad %749 
                                                      OpStore %746 %750 
                                                      OpBranch %748 
                                             %751 = OpLabel 
                                                      OpStore %746 %20 
                                                      OpBranch %748 
                                             %748 = OpLabel 
                                         f32 %752 = OpLoad %746 
                                Private f32* %753 = OpAccessChain %9 %13 
                                                      OpStore %753 %752 
                                        bool %754 = OpLoad %452 
                                                      OpSelectionMerge %757 None 
                                                      OpBranchConditional %754 %756 %760 
                                             %756 = OpLabel 
                                Private f32* %758 = OpAccessChain %9 %13 
                                         f32 %759 = OpLoad %758 
                                                      OpStore %755 %759 
                                                      OpBranch %757 
                                             %760 = OpLabel 
                                                      OpStore %755 %47 
                                                      OpBranch %757 
                                             %757 = OpLabel 
                                         f32 %761 = OpLoad %755 
                                Private f32* %762 = OpAccessChain %9 %13 
                                                      OpStore %762 %761 
                                         f32 %763 = OpLoad %666 
                                        bool %764 = OpFOrdEqual %763 %47 
                                                      OpStore %452 %764 
                                         f32 %765 = OpLoad %666 
                                         f32 %766 = OpFNegate %765 
                                         f32 %767 = OpFAdd %766 %20 
                                                      OpStore %698 %767 
                                        bool %768 = OpLoad %452 
                                                      OpSelectionMerge %771 None 
                                                      OpBranchConditional %768 %770 %774 
                                             %770 = OpLabel 
                                Private f32* %772 = OpAccessChain %9 %13 
                                         f32 %773 = OpLoad %772 
                                                      OpStore %769 %773 
                                                      OpBranch %771 
                                             %774 = OpLabel 
                                         f32 %775 = OpLoad %698 
                                                      OpStore %769 %775 
                                                      OpBranch %771 
                                             %771 = OpLabel 
                                         f32 %776 = OpLoad %769 
                                Private f32* %777 = OpAccessChain %9 %13 
                                                      OpStore %777 %776 
                               Private bool* %778 = OpAccessChain %130 %13 
                                        bool %779 = OpLoad %778 
                                                      OpSelectionMerge %782 None 
                                                      OpBranchConditional %779 %781 %785 
                                             %781 = OpLabel 
                                Private f32* %783 = OpAccessChain %9 %13 
                                         f32 %784 = OpLoad %783 
                                                      OpStore %780 %784 
                                                      OpBranch %782 
                                             %785 = OpLabel 
                                                      OpStore %780 %20 
                                                      OpBranch %782 
                                             %782 = OpLabel 
                                         f32 %786 = OpLoad %780 
                                Private f32* %787 = OpAccessChain %9 %13 
                                                      OpStore %787 %786 
                                Private f32* %788 = OpAccessChain %9 %13 
                                         f32 %789 = OpLoad %788 
                                         f32 %790 = OpLoad %614 
                                         f32 %791 = OpFMul %789 %790 
                                                      OpStore %111 %791 
                                        bool %792 = OpLoad %369 
                                         f32 %793 = OpSelect %792 %47 %20 
                                                      OpStore %698 %793 
                               Private bool* %794 = OpAccessChain %130 %13 
                                        bool %795 = OpLoad %794 
                                         f32 %796 = OpLoad %698 
                                         f32 %797 = OpSelect %795 %20 %796 
                                Private f32* %798 = OpAccessChain %50 %13 
                                                      OpStore %798 %797 
                                Private f32* %799 = OpAccessChain %50 %13 
                                         f32 %800 = OpLoad %799 
                                         f32 %801 = OpLoad %111 
                                         f32 %802 = OpFMul %800 %801 
                                Private f32* %803 = OpAccessChain %9 %223 
                                                      OpStore %803 %802 
                         read_only Texture2D %805 = OpLoad %804 
                                     sampler %807 = OpLoad %806 
                  read_only Texture2DSampled %808 = OpSampledImage %805 %807 
                                       f32_2 %810 = OpLoad vs_TEXCOORD1 
                                       f32_4 %811 = OpImageSampleImplicitLod %808 %810 
                                         f32 %812 = OpCompositeExtract %811 3 
                                Private f32* %813 = OpAccessChain %50 %223 
                                                      OpStore %813 %812 
                                Uniform i32* %815 = OpAccessChain %76 %115 
                                         i32 %816 = OpLoad %815 
                                        bool %817 = OpINotEqual %816 %639 
                                                      OpStore %814 %817 
                                       f32_3 %818 = OpLoad %50 
                                       f32_2 %819 = OpVectorShuffle %818 %818 0 2 
                                       f32_4 %820 = OpLoad %9 
                                       f32_2 %821 = OpVectorShuffle %820 %820 0 2 
                                       f32_2 %822 = OpFMul %819 %821 
                                       f32_4 %823 = OpLoad %9 
                                       f32_4 %824 = OpVectorShuffle %823 %822 4 1 5 3 
                                                      OpStore %9 %824 
                                Private f32* %825 = OpAccessChain %50 %223 
                                         f32 %826 = OpLoad %825 
                                Private f32* %827 = OpAccessChain %9 %13 
                                         f32 %828 = OpLoad %827 
                                         f32 %829 = OpFMul %826 %828 
                                Private f32* %830 = OpAccessChain %9 %13 
                                                      OpStore %830 %829 
                                       f32_4 %831 = OpLoad %9 
                                       f32_3 %832 = OpVectorShuffle %831 %831 0 0 0 
                                       f32_3 %833 = OpLoad %608 
                                       f32_3 %834 = OpFMul %832 %833 
                                       f32_4 %835 = OpLoad %9 
                                       f32_4 %836 = OpVectorShuffle %835 %834 4 5 2 6 
                                                      OpStore %9 %836 
                                        bool %839 = OpLoad %814 
                                                      OpSelectionMerge %842 None 
                                                      OpBranchConditional %839 %841 %845 
                                             %841 = OpLabel 
                                       f32_4 %843 = OpLoad %9 
                                       f32_3 %844 = OpVectorShuffle %843 %843 0 1 3 
                                                      OpStore %840 %844 
                                                      OpBranch %842 
                                             %845 = OpLabel 
                                       f32_3 %846 = OpLoad %608 
                                                      OpStore %840 %846 
                                                      OpBranch %842 
                                             %842 = OpLabel 
                                       f32_3 %847 = OpLoad %840 
                                       f32_4 %848 = OpLoad %838 
                                       f32_4 %849 = OpVectorShuffle %848 %847 4 5 6 3 
                                                      OpStore %838 %849 
                                Private f32* %850 = OpAccessChain %9 %223 
                                         f32 %851 = OpLoad %850 
                                 Output f32* %853 = OpAccessChain %838 %188 
                                                      OpStore %853 %851 
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
; Bound: 855
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %39 %610 %809 %838 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD2 Location 11 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 39 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpDecorate %73 ArrayStride 73 
                                                      OpMemberDecorate %74 0 Offset 74 
                                                      OpMemberDecorate %74 1 Offset 74 
                                                      OpMemberDecorate %74 2 Offset 74 
                                                      OpMemberDecorate %74 3 Offset 74 
                                                      OpMemberDecorate %74 4 Offset 74 
                                                      OpMemberDecorate %74 5 Offset 74 
                                                      OpDecorate %74 Block 
                                                      OpDecorate %76 DescriptorSet 76 
                                                      OpDecorate %76 Binding 76 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %610 RelaxedPrecision 
                                                      OpDecorate %610 Location 610 
                                                      OpDecorate %611 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %614 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %618 RelaxedPrecision 
                                                      OpDecorate %619 RelaxedPrecision 
                                                      OpDecorate %638 RelaxedPrecision 
                                                      OpDecorate %648 RelaxedPrecision 
                                                      OpDecorate %790 RelaxedPrecision 
                                                      OpDecorate %804 RelaxedPrecision 
                                                      OpDecorate %804 DescriptorSet 804 
                                                      OpDecorate %804 Binding 804 
                                                      OpDecorate %805 RelaxedPrecision 
                                                      OpDecorate %806 RelaxedPrecision 
                                                      OpDecorate %806 DescriptorSet 806 
                                                      OpDecorate %806 Binding 806 
                                                      OpDecorate %807 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 809 
                                                      OpDecorate %833 RelaxedPrecision 
                                                      OpDecorate %838 RelaxedPrecision 
                                                      OpDecorate %838 Location 838 
                                                      OpDecorate %846 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 0 
                                              %14 = OpTypePointer Input %6 
                                              %18 = OpTypePointer Private %6 
                                          f32 %20 = OpConstant 3.674022E-40 
                               Private f32_4* %26 = OpVariable Private 
                                              %27 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %28 = OpTypePointer UniformConstant %27 
         UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
                                              %31 = OpTypeSampler 
                                              %32 = OpTypePointer UniformConstant %31 
                     UniformConstant sampler* %33 = OpVariable UniformConstant 
                                              %35 = OpTypeSampledImage %27 
                                              %37 = OpTypeVector %6 2 
                                              %38 = OpTypePointer Input %37 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Private %42 
                               Private f32_3* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.674022E-40 
                                        f32_3 %48 = OpConstantComposite %47 %47 %47 
                               Private f32_3* %50 = OpVariable Private 
                                          f32 %54 = OpConstant 3.674022E-40 
                                        f32_3 %55 = OpConstantComposite %54 %54 %54 
                                          f32 %60 = OpConstant 3.674022E-40 
                                        f32_3 %61 = OpConstantComposite %60 %60 %60 
                                          f32 %63 = OpConstant 3.674022E-40 
                                        f32_3 %64 = OpConstantComposite %63 %63 %63 
                                              %68 = OpTypeInt 32 1 
                                          u32 %69 = OpConstant 4 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeArray %6 %69 
                                              %72 = OpTypeArray %6 %69 
                                              %73 = OpTypeArray %7 %69 
                                              %74 = OpTypeStruct %68 %68 %70 %71 %72 %73 
                                              %75 = OpTypePointer Uniform %74 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; f32_4[4];}* %76 = OpVariable Uniform 
                                          i32 %77 = OpConstant 0 
                                              %78 = OpTypePointer Uniform %68 
                                              %81 = OpTypeBool 
                                              %83 = OpTypePointer Function %42 
                                          i32 %94 = OpConstant 4 
                                              %95 = OpTypePointer Uniform %6 
                                         i32 %101 = OpConstant 2 
                                         f32 %105 = OpConstant 3.674022E-40 
                                Private f32* %111 = OpVariable Private 
                                         u32 %112 = OpConstant 1 
                                         i32 %115 = OpConstant 1 
                                         i32 %120 = OpConstant 3 
                                             %128 = OpTypeVector %81 2 
                                             %129 = OpTypePointer Private %128 
                             Private bool_2* %130 = OpVariable Private 
                                       f32_4 %131 = OpConstantComposite %47 %47 %47 %47 
                                             %134 = OpTypeVector %81 4 
                                             %137 = OpTypeVector %68 3 
                                             %138 = OpTypePointer Private %137 
                              Private i32_3* %139 = OpVariable Private 
                                             %140 = OpTypePointer Private %81 
                                       i32_3 %143 = OpConstantComposite %77 %115 %101 
                                         i32 %144 = OpConstant 8 
                                       i32_3 %145 = OpConstantComposite %120 %101 %144 
                                             %146 = OpTypeVector %81 3 
                                             %149 = OpTypePointer Private %68 
                                Private i32* %150 = OpVariable Private 
                                             %153 = OpTypePointer Function %68 
                              Private f32_4* %167 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %188 = OpConstant 3 
                              Private f32_4* %196 = OpVariable Private 
                                         u32 %223 = OpConstant 2 
                              Private f32_4* %234 = OpVariable Private 
                                             %267 = OpTypePointer Function %7 
                                             %277 = OpTypePointer Private %146 
                             Private bool_3* %278 = OpVariable Private 
                             Private bool_2* %287 = OpVariable Private 
                                             %296 = OpTypePointer Function %128 
                             Private bool_2* %313 = OpVariable Private 
                                Private f32* %335 = OpVariable Private 
                               Private bool* %359 = OpVariable Private 
                               Private bool* %369 = OpVariable Private 
                                             %402 = OpTypeVector %68 4 
                                       i32_4 %404 = OpConstantComposite %77 %77 %101 %77 
                               Private bool* %423 = OpVariable Private 
                                Private i32* %427 = OpVariable Private 
                               Private bool* %430 = OpVariable Private 
                                Private i32* %434 = OpVariable Private 
                               Private bool* %447 = OpVariable Private 
                               Private bool* %452 = OpVariable Private 
                                Private i32* %457 = OpVariable Private 
                                Private i32* %460 = OpVariable Private 
                                         f32 %487 = OpConstant 3.674022E-40 
                              Private f32_4* %490 = OpVariable Private 
                                         f32 %536 = OpConstant 3.674022E-40 
                                       f32_2 %537 = OpConstantComposite %536 %536 
                                Private f32* %560 = OpVariable Private 
                               Private bool* %591 = OpVariable Private 
                              Private f32_3* %608 = OpVariable Private 
                                Input f32_4* %610 = OpVariable Input 
                                Private f32* %614 = OpVariable Private 
                                       i32_4 %623 = OpConstantComposite %101 %94 %144 %77 
                              Private f32_3* %637 = OpVariable Private 
                                         i32 %639 = OpConstant 5 
                                             %641 = OpTypePointer Uniform %7 
                                Private f32* %646 = OpVariable Private 
                                Private f32* %666 = OpVariable Private 
                                Private f32* %690 = OpVariable Private 
                                Private f32* %698 = OpVariable Private 
                                Private f32* %706 = OpVariable Private 
                               Private bool* %738 = OpVariable Private 
                                             %745 = OpTypePointer Function %6 
        UniformConstant read_only Texture2D* %804 = OpVariable UniformConstant 
                    UniformConstant sampler* %806 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                               Private bool* %814 = OpVariable Private 
                                             %837 = OpTypePointer Output %7 
                               Output f32_4* %838 = OpVariable Output 
                                             %852 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %84 = OpVariable Function 
                               Function i32* %154 = OpVariable Function 
                             Function f32_4* %268 = OpVariable Function 
                            Function bool_2* %297 = OpVariable Function 
                            Function bool_2* %322 = OpVariable Function 
                               Function i32* %581 = OpVariable Function 
                               Function i32* %596 = OpVariable Function 
                               Function f32* %746 = OpVariable Function 
                               Function f32* %755 = OpVariable Function 
                               Function f32* %769 = OpVariable Function 
                               Function f32* %780 = OpVariable Function 
                             Function f32_3* %840 = OpVariable Function 
                                   Input f32* %15 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %16 = OpLoad %15 
                                          f32 %17 = OpDPdx %16 
                                 Private f32* %19 = OpAccessChain %9 %13 
                                                      OpStore %19 %17 
                                 Private f32* %21 = OpAccessChain %9 %13 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpExtInst %1 4 %22 
                                          f32 %24 = OpFDiv %20 %23 
                                 Private f32* %25 = OpAccessChain %9 %13 
                                                      OpStore %25 %24 
                          read_only Texture2D %30 = OpLoad %29 
                                      sampler %34 = OpLoad %33 
                   read_only Texture2DSampled %36 = OpSampledImage %30 %34 
                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
                                        f32_4 %41 = OpImageSampleImplicitLod %36 %40 
                                                      OpStore %26 %41 
                                        f32_4 %45 = OpLoad %26 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %49 = OpExtInst %1 40 %46 %48 
                                                      OpStore %44 %49 
                                        f32_3 %51 = OpLoad %44 
                                        f32_3 %52 = OpExtInst %1 30 %51 
                                                      OpStore %50 %52 
                                        f32_3 %53 = OpLoad %50 
                                        f32_3 %56 = OpFMul %53 %55 
                                                      OpStore %50 %56 
                                        f32_3 %57 = OpLoad %50 
                                        f32_3 %58 = OpExtInst %1 29 %57 
                                                      OpStore %50 %58 
                                        f32_3 %59 = OpLoad %50 
                                        f32_3 %62 = OpFMul %59 %61 
                                        f32_3 %65 = OpFAdd %62 %64 
                                                      OpStore %50 %65 
                                        f32_3 %66 = OpLoad %50 
                                        f32_3 %67 = OpExtInst %1 40 %66 %48 
                                                      OpStore %50 %67 
                                 Uniform i32* %79 = OpAccessChain %76 %77 
                                          i32 %80 = OpLoad %79 
                                         bool %82 = OpINotEqual %80 %77 
                                                      OpSelectionMerge %86 None 
                                                      OpBranchConditional %82 %85 %88 
                                              %85 = OpLabel 
                                        f32_3 %87 = OpLoad %50 
                                                      OpStore %84 %87 
                                                      OpBranch %86 
                                              %88 = OpLabel 
                                        f32_4 %89 = OpLoad %26 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                                      OpStore %84 %90 
                                                      OpBranch %86 
                                              %86 = OpLabel 
                                        f32_3 %91 = OpLoad %84 
                                                      OpStore %44 %91 
                                   Input f32* %92 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %96 = OpAccessChain %76 %94 %77 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                          f32 %99 = OpFAdd %93 %98 
                                Private f32* %100 = OpAccessChain %50 %13 
                                                      OpStore %100 %99 
                                Uniform f32* %102 = OpAccessChain %76 %94 %101 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFNegate %103 
                                         f32 %106 = OpFMul %104 %105 
                                Private f32* %107 = OpAccessChain %50 %13 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFAdd %106 %108 
                                Private f32* %110 = OpAccessChain %50 %13 
                                                      OpStore %110 %109 
                                  Input f32* %113 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %76 %94 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFNegate %117 
                                         f32 %119 = OpFAdd %114 %118 
                                                      OpStore %111 %119 
                                Uniform f32* %121 = OpAccessChain %76 %94 %120 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                         f32 %124 = OpFMul %123 %105 
                                         f32 %125 = OpLoad %111 
                                         f32 %126 = OpFAdd %124 %125 
                                Private f32* %127 = OpAccessChain %50 %112 
                                                      OpStore %127 %126 
                                       f32_3 %132 = OpLoad %50 
                                       f32_4 %133 = OpVectorShuffle %132 %132 0 1 0 0 
                                      bool_4 %135 = OpFOrdGreaterThanEqual %131 %133 
                                      bool_2 %136 = OpVectorShuffle %135 %135 0 1 
                                                      OpStore %130 %136 
                               Private bool* %141 = OpAccessChain %130 %112 
                                        bool %142 = OpLoad %141 
                                      bool_3 %147 = OpCompositeConstruct %142 %142 %142 
                                       i32_3 %148 = OpSelect %147 %143 %145 
                                                      OpStore %139 %148 
                               Private bool* %151 = OpAccessChain %130 %13 
                                        bool %152 = OpLoad %151 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %152 %155 %159 
                                             %155 = OpLabel 
                                Private i32* %157 = OpAccessChain %139 %13 
                                         i32 %158 = OpLoad %157 
                                                      OpStore %154 %158 
                                                      OpBranch %156 
                                             %159 = OpLabel 
                                Private i32* %160 = OpAccessChain %139 %112 
                                         i32 %161 = OpLoad %160 
                                                      OpStore %154 %161 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                         i32 %162 = OpLoad %154 
                                                      OpStore %150 %162 
                               Private bool* %163 = OpAccessChain %130 %13 
                                        bool %164 = OpLoad %163 
                                         i32 %165 = OpSelect %164 %115 %94 
                                Private i32* %166 = OpAccessChain %139 %13 
                                                      OpStore %166 %165 
                                Uniform f32* %168 = OpAccessChain %76 %94 %77 
                                         f32 %169 = OpLoad %168 
                                         i32 %170 = OpLoad %150 
                                Uniform f32* %171 = OpAccessChain %76 %101 %170 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFAdd %169 %172 
                                Private f32* %174 = OpAccessChain %167 %112 
                                                      OpStore %174 %173 
                                Uniform f32* %176 = OpAccessChain %76 %94 %115 
                                         f32 %177 = OpLoad %176 
                                         i32 %178 = OpLoad %150 
                                Uniform f32* %179 = OpAccessChain %76 %101 %178 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFAdd %177 %180 
                                Private f32* %182 = OpAccessChain %175 %112 
                                                      OpStore %182 %181 
                                Uniform f32* %183 = OpAccessChain %76 %120 %77 
                                         f32 %184 = OpLoad %183 
                                Uniform f32* %185 = OpAccessChain %76 %94 %77 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFAdd %184 %186 
                                Private f32* %189 = OpAccessChain %167 %188 
                                                      OpStore %189 %187 
                                Uniform f32* %190 = OpAccessChain %76 %120 %115 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %76 %94 %115 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFAdd %191 %193 
                                Private f32* %195 = OpAccessChain %175 %188 
                                                      OpStore %195 %194 
                                Uniform f32* %197 = OpAccessChain %76 %94 %77 
                                         f32 %198 = OpLoad %197 
                                Uniform f32* %199 = OpAccessChain %76 %94 %101 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFAdd %198 %200 
                                Private f32* %202 = OpAccessChain %196 %13 
                                                      OpStore %202 %201 
                                Private f32* %203 = OpAccessChain %196 %13 
                                         f32 %204 = OpLoad %203 
                                         i32 %205 = OpLoad %150 
                                Uniform f32* %206 = OpAccessChain %76 %101 %205 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFNegate %207 
                                         f32 %209 = OpFAdd %204 %208 
                                Private f32* %210 = OpAccessChain %196 %112 
                                                      OpStore %210 %209 
                                Private f32* %211 = OpAccessChain %196 %13 
                                         f32 %212 = OpLoad %211 
                                Uniform f32* %213 = OpAccessChain %76 %120 %101 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFNegate %214 
                                         f32 %216 = OpFAdd %212 %215 
                                Private f32* %217 = OpAccessChain %196 %188 
                                                      OpStore %217 %216 
                                Uniform f32* %218 = OpAccessChain %76 %94 %77 
                                         f32 %219 = OpLoad %218 
                                Private f32* %220 = OpAccessChain %167 %13 
                                                      OpStore %220 %219 
                                Uniform f32* %221 = OpAccessChain %76 %120 %77 
                                         f32 %222 = OpLoad %221 
                                Private f32* %224 = OpAccessChain %167 %223 
                                                      OpStore %224 %222 
                                Uniform f32* %225 = OpAccessChain %76 %120 %101 
                                         f32 %226 = OpLoad %225 
                                Private f32* %227 = OpAccessChain %196 %223 
                                                      OpStore %227 %226 
                               Private bool* %228 = OpAccessChain %130 %13 
                                        bool %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %167 
                                       f32_4 %231 = OpLoad %196 
                                      bool_4 %232 = OpCompositeConstruct %229 %229 %229 %229 
                                       f32_4 %233 = OpSelect %232 %230 %231 
                                                      OpStore %196 %233 
                                Uniform f32* %235 = OpAccessChain %76 %94 %115 
                                         f32 %236 = OpLoad %235 
                                Uniform f32* %237 = OpAccessChain %76 %94 %120 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFAdd %236 %238 
                                Private f32* %240 = OpAccessChain %234 %13 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %234 %13 
                                         f32 %242 = OpLoad %241 
                                         i32 %243 = OpLoad %150 
                                Uniform f32* %244 = OpAccessChain %76 %101 %243 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFNegate %245 
                                         f32 %247 = OpFAdd %242 %246 
                                Private f32* %248 = OpAccessChain %234 %112 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %234 %13 
                                         f32 %250 = OpLoad %249 
                                Uniform f32* %251 = OpAccessChain %76 %120 %120 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFNegate %252 
                                         f32 %254 = OpFAdd %250 %253 
                                Private f32* %255 = OpAccessChain %234 %188 
                                                      OpStore %255 %254 
                                Uniform f32* %256 = OpAccessChain %76 %94 %115 
                                         f32 %257 = OpLoad %256 
                                Private f32* %258 = OpAccessChain %175 %13 
                                                      OpStore %258 %257 
                                Uniform f32* %259 = OpAccessChain %76 %120 %115 
                                         f32 %260 = OpLoad %259 
                                Private f32* %261 = OpAccessChain %175 %223 
                                                      OpStore %261 %260 
                                Uniform f32* %262 = OpAccessChain %76 %120 %120 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %234 %223 
                                                      OpStore %264 %263 
                               Private bool* %265 = OpAccessChain %130 %112 
                                        bool %266 = OpLoad %265 
                                                      OpSelectionMerge %270 None 
                                                      OpBranchConditional %266 %269 %273 
                                             %269 = OpLabel 
                                       f32_4 %271 = OpLoad %175 
                                       f32_4 %272 = OpVectorShuffle %271 %271 1 0 2 3 
                                                      OpStore %268 %272 
                                                      OpBranch %270 
                                             %273 = OpLabel 
                                       f32_4 %274 = OpLoad %234 
                                       f32_4 %275 = OpVectorShuffle %274 %274 1 0 2 3 
                                                      OpStore %268 %275 
                                                      OpBranch %270 
                                             %270 = OpLabel 
                                       f32_4 %276 = OpLoad %268 
                                                      OpStore %234 %276 
                                       f32_4 %279 = OpLoad %196 
                                       f32_4 %280 = OpVectorShuffle %279 %279 1 3 1 1 
                                       f32_4 %281 = OpLoad vs_TEXCOORD2 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 0 0 0 
                                      bool_4 %283 = OpFOrdGreaterThanEqual %280 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                      bool_3 %285 = OpLoad %278 
                                      bool_3 %286 = OpVectorShuffle %285 %284 3 4 2 
                                                      OpStore %278 %286 
                                       f32_4 %288 = OpLoad vs_TEXCOORD2 
                                       f32_4 %289 = OpVectorShuffle %288 %288 0 0 0 0 
                                       f32_4 %290 = OpLoad %196 
                                       f32_4 %291 = OpVectorShuffle %290 %290 1 3 1 1 
                                      bool_4 %292 = OpFOrdGreaterThanEqual %289 %291 
                                      bool_2 %293 = OpVectorShuffle %292 %292 0 1 
                                                      OpStore %287 %293 
                               Private bool* %294 = OpAccessChain %130 %13 
                                        bool %295 = OpLoad %294 
                                                      OpSelectionMerge %299 None 
                                                      OpBranchConditional %295 %298 %302 
                                             %298 = OpLabel 
                                      bool_3 %300 = OpLoad %278 
                                      bool_2 %301 = OpVectorShuffle %300 %300 0 1 
                                                      OpStore %297 %301 
                                                      OpBranch %299 
                                             %302 = OpLabel 
                                      bool_2 %303 = OpLoad %287 
                                                      OpStore %297 %303 
                                                      OpBranch %299 
                                             %299 = OpLabel 
                                      bool_2 %304 = OpLoad %297 
                                      bool_3 %305 = OpLoad %278 
                                      bool_3 %306 = OpVectorShuffle %305 %304 3 4 2 
                                                      OpStore %278 %306 
                                       f32_4 %307 = OpLoad %234 
                                       f32_4 %308 = OpVectorShuffle %307 %307 0 3 0 0 
                                       f32_4 %309 = OpLoad vs_TEXCOORD2 
                                       f32_4 %310 = OpVectorShuffle %309 %309 1 1 1 1 
                                      bool_4 %311 = OpFOrdGreaterThanEqual %308 %310 
                                      bool_2 %312 = OpVectorShuffle %311 %311 0 1 
                                                      OpStore %287 %312 
                                       f32_4 %314 = OpLoad vs_TEXCOORD2 
                                       f32_4 %315 = OpVectorShuffle %314 %314 1 1 1 1 
                                       f32_4 %316 = OpLoad %234 
                                       f32_4 %317 = OpVectorShuffle %316 %316 0 3 0 0 
                                      bool_4 %318 = OpFOrdGreaterThanEqual %315 %317 
                                      bool_2 %319 = OpVectorShuffle %318 %318 0 1 
                                                      OpStore %313 %319 
                               Private bool* %320 = OpAccessChain %130 %112 
                                        bool %321 = OpLoad %320 
                                                      OpSelectionMerge %324 None 
                                                      OpBranchConditional %321 %323 %326 
                                             %323 = OpLabel 
                                      bool_2 %325 = OpLoad %287 
                                                      OpStore %322 %325 
                                                      OpBranch %324 
                                             %326 = OpLabel 
                                      bool_2 %327 = OpLoad %313 
                                                      OpStore %322 %327 
                                                      OpBranch %324 
                                             %324 = OpLabel 
                                      bool_2 %328 = OpLoad %322 
                                                      OpStore %130 %328 
                               Private bool* %329 = OpAccessChain %130 %13 
                                        bool %330 = OpLoad %329 
                               Private bool* %331 = OpAccessChain %278 %13 
                                        bool %332 = OpLoad %331 
                                        bool %333 = OpLogicalAnd %330 %332 
                               Private bool* %334 = OpAccessChain %130 %13 
                                                      OpStore %334 %333 
                                Uniform f32* %336 = OpAccessChain %76 %120 %77 
                                         f32 %337 = OpLoad %336 
                                Uniform f32* %338 = OpAccessChain %76 %120 %101 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFAdd %337 %339 
                                                      OpStore %335 %340 
                                         f32 %341 = OpLoad %335 
                                         f32 %342 = OpFNegate %341 
                                Uniform f32* %343 = OpAccessChain %76 %94 %101 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFAdd %342 %344 
                                                      OpStore %335 %345 
                                Uniform f32* %346 = OpAccessChain %76 %120 %115 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %348 = OpAccessChain %76 %120 %120 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFAdd %347 %349 
                                Private f32* %351 = OpAccessChain %167 %13 
                                                      OpStore %351 %350 
                                Private f32* %352 = OpAccessChain %167 %13 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpFNegate %353 
                                Uniform f32* %355 = OpAccessChain %76 %94 %120 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFAdd %354 %356 
                                Private f32* %358 = OpAccessChain %167 %13 
                                                      OpStore %358 %357 
                                  Input f32* %360 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %361 = OpLoad %360 
                                Private f32* %362 = OpAccessChain %167 %188 
                                         f32 %363 = OpLoad %362 
                                        bool %364 = OpFOrdGreaterThanEqual %361 %363 
                                                      OpStore %359 %364 
                                         f32 %365 = OpLoad %335 
                                Private f32* %366 = OpAccessChain %167 %188 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFAdd %365 %367 
                                                      OpStore %335 %368 
                                         f32 %370 = OpLoad %335 
                                  Input f32* %371 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %372 = OpLoad %371 
                                        bool %373 = OpFOrdGreaterThanEqual %370 %372 
                                                      OpStore %369 %373 
                                        bool %374 = OpLoad %369 
                                        bool %375 = OpLoad %359 
                                        bool %376 = OpLogicalAnd %374 %375 
                                                      OpStore %369 %376 
                                  Input f32* %377 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %378 = OpLoad %377 
                                Private f32* %379 = OpAccessChain %175 %188 
                                         f32 %380 = OpLoad %379 
                                        bool %381 = OpFOrdGreaterThanEqual %378 %380 
                                                      OpStore %359 %381 
                                        bool %382 = OpLoad %369 
                                        bool %383 = OpLoad %359 
                                        bool %384 = OpLogicalAnd %382 %383 
                                                      OpStore %369 %384 
                                Private f32* %385 = OpAccessChain %167 %13 
                                         f32 %386 = OpLoad %385 
                                Private f32* %387 = OpAccessChain %175 %188 
                                         f32 %388 = OpLoad %387 
                                         f32 %389 = OpFAdd %386 %388 
                                Private f32* %390 = OpAccessChain %167 %13 
                                                      OpStore %390 %389 
                                Private f32* %391 = OpAccessChain %167 %13 
                                         f32 %392 = OpLoad %391 
                                  Input f32* %393 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %394 = OpLoad %393 
                                        bool %395 = OpFOrdGreaterThanEqual %392 %394 
                               Private bool* %396 = OpAccessChain %278 %13 
                                                      OpStore %396 %395 
                                        bool %397 = OpLoad %369 
                               Private bool* %398 = OpAccessChain %278 %13 
                                        bool %399 = OpLoad %398 
                                        bool %400 = OpLogicalAnd %397 %399 
                                                      OpStore %369 %400 
                                         i32 %401 = OpLoad %150 
                                       i32_4 %403 = OpCompositeConstruct %401 %401 %401 %401 
                                      bool_4 %405 = OpIEqual %403 %404 
                                      bool_2 %406 = OpVectorShuffle %405 %405 0 2 
                                      bool_3 %407 = OpLoad %278 
                                      bool_3 %408 = OpVectorShuffle %407 %406 3 1 4 
                                                      OpStore %278 %408 
                               Private bool* %409 = OpAccessChain %278 %223 
                                        bool %410 = OpLoad %409 
                               Private bool* %411 = OpAccessChain %278 %13 
                                        bool %412 = OpLoad %411 
                                        bool %413 = OpLogicalOr %410 %412 
                               Private bool* %414 = OpAccessChain %278 %13 
                                                      OpStore %414 %413 
                                         i32 %415 = OpLoad %150 
                                Uniform f32* %416 = OpAccessChain %76 %101 %415 
                                         f32 %417 = OpLoad %416 
                                        bool %418 = OpFOrdLessThan %47 %417 
                                                      OpStore %359 %418 
                               Private bool* %419 = OpAccessChain %130 %13 
                                        bool %420 = OpLoad %419 
                                        bool %421 = OpLoad %359 
                                        bool %422 = OpLogicalAnd %420 %421 
                                                      OpStore %359 %422 
                                Private f32* %424 = OpAccessChain %196 %223 
                                         f32 %425 = OpLoad %424 
                                        bool %426 = OpFOrdLessThan %47 %425 
                                                      OpStore %423 %426 
                                        bool %428 = OpLoad %423 
                                         i32 %429 = OpSelect %428 %115 %77 
                                                      OpStore %427 %429 
                                Private f32* %431 = OpAccessChain %234 %223 
                                         f32 %432 = OpLoad %431 
                                        bool %433 = OpFOrdLessThan %47 %432 
                                                      OpStore %430 %433 
                                        bool %435 = OpLoad %430 
                                         i32 %436 = OpSelect %435 %115 %77 
                                                      OpStore %434 %436 
                                Private i32* %437 = OpAccessChain %139 %223 
                                         i32 %438 = OpLoad %437 
                                         i32 %439 = OpLoad %434 
                                         i32 %440 = OpIMul %438 %439 
                                                      OpStore %434 %440 
                                         i32 %441 = OpLoad %427 
                                Private i32* %442 = OpAccessChain %139 %13 
                                         i32 %443 = OpLoad %442 
                                         i32 %444 = OpIMul %441 %443 
                                         i32 %445 = OpLoad %434 
                                         i32 %446 = OpIAdd %444 %445 
                                                      OpStore %427 %446 
                               Private bool* %448 = OpAccessChain %278 %112 
                                        bool %449 = OpLoad %448 
                                        bool %450 = OpLoad %423 
                                        bool %451 = OpLogicalAnd %449 %450 
                                                      OpStore %447 %451 
                               Private bool* %453 = OpAccessChain %130 %112 
                                        bool %454 = OpLoad %453 
                                        bool %455 = OpLoad %430 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %452 %456 
                                        bool %458 = OpLoad %447 
                                         i32 %459 = OpSelect %458 %115 %77 
                                                      OpStore %457 %459 
                                        bool %461 = OpLoad %452 
                                         i32 %462 = OpSelect %461 %115 %77 
                                                      OpStore %460 %462 
                                Private i32* %463 = OpAccessChain %139 %223 
                                         i32 %464 = OpLoad %463 
                                         i32 %465 = OpLoad %460 
                                         i32 %466 = OpIMul %464 %465 
                                                      OpStore %460 %466 
                                         i32 %467 = OpLoad %457 
                                Private i32* %468 = OpAccessChain %139 %13 
                                         i32 %469 = OpLoad %468 
                                         i32 %470 = OpIMul %467 %469 
                                         i32 %471 = OpLoad %460 
                                         i32 %472 = OpIAdd %470 %471 
                                                      OpStore %460 %472 
                                        bool %473 = OpLoad %369 
                                         i32 %474 = OpLoad %460 
                                         i32 %475 = OpSelect %473 %77 %474 
                                                      OpStore %460 %475 
                                        bool %476 = OpLoad %359 
                                         i32 %477 = OpLoad %427 
                                         i32 %478 = OpLoad %460 
                                         i32 %479 = OpSelect %476 %477 %478 
                                                      OpStore %460 %479 
                                Private i32* %480 = OpAccessChain %139 %223 
                                         i32 %481 = OpLoad %480 
                                Private i32* %482 = OpAccessChain %139 %13 
                                         i32 %483 = OpLoad %482 
                                         i32 %484 = OpIAdd %481 %483 
                                                      OpStore %457 %484 
                               Private bool* %485 = OpAccessChain %278 %13 
                                        bool %486 = OpLoad %485 
                                         f32 %488 = OpSelect %486 %20 %487 
                                Private f32* %489 = OpAccessChain %167 %13 
                                                      OpStore %489 %488 
                                       f32_4 %491 = OpLoad %196 
                                       f32_2 %492 = OpVectorShuffle %491 %491 3 1 
                                       f32_4 %493 = OpLoad %490 
                                       f32_4 %494 = OpVectorShuffle %493 %492 4 1 5 3 
                                                      OpStore %490 %494 
                                       f32_4 %495 = OpLoad %234 
                                       f32_2 %496 = OpVectorShuffle %495 %495 3 0 
                                       f32_4 %497 = OpLoad %490 
                                       f32_4 %498 = OpVectorShuffle %497 %496 0 4 2 5 
                                                      OpStore %490 %498 
                                Private f32* %499 = OpAccessChain %196 %13 
                                         f32 %500 = OpLoad %499 
                                Private f32* %501 = OpAccessChain %234 %13 
                                                      OpStore %501 %500 
                                       f32_4 %502 = OpLoad %490 
                                       f32_2 %503 = OpVectorShuffle %502 %502 1 0 
                                       f32_2 %504 = OpFNegate %503 
                                       f32_4 %505 = OpLoad %234 
                                       f32_2 %506 = OpVectorShuffle %505 %505 1 0 
                                       f32_2 %507 = OpFAdd %504 %506 
                                       f32_4 %508 = OpLoad %175 
                                       f32_4 %509 = OpVectorShuffle %508 %507 4 1 5 3 
                                                      OpStore %175 %509 
                                       f32_4 %510 = OpLoad %167 
                                       f32_2 %511 = OpVectorShuffle %510 %510 0 0 
                                       f32_4 %512 = OpLoad %175 
                                       f32_2 %513 = OpVectorShuffle %512 %512 0 2 
                                       f32_2 %514 = OpFMul %511 %513 
                                       f32_4 %515 = OpLoad %167 
                                       f32_4 %516 = OpVectorShuffle %515 %514 4 1 5 3 
                                                      OpStore %167 %516 
                                       f32_4 %517 = OpLoad %167 
                                       f32_2 %518 = OpVectorShuffle %517 %517 0 2 
                                       f32_4 %519 = OpLoad %167 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 2 
                                         f32 %521 = OpDot %518 %520 
                                Private f32* %522 = OpAccessChain %175 %13 
                                                      OpStore %522 %521 
                                Private f32* %523 = OpAccessChain %175 %13 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpExtInst %1 32 %524 
                                Private f32* %526 = OpAccessChain %175 %13 
                                                      OpStore %526 %525 
                                       f32_4 %527 = OpLoad %167 
                                       f32_2 %528 = OpVectorShuffle %527 %527 0 2 
                                       f32_4 %529 = OpLoad %175 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 0 
                                       f32_2 %531 = OpFMul %528 %530 
                                       f32_4 %532 = OpLoad %167 
                                       f32_4 %533 = OpVectorShuffle %532 %531 4 1 5 3 
                                                      OpStore %167 %533 
                                       f32_4 %534 = OpLoad %167 
                                       f32_2 %535 = OpVectorShuffle %534 %534 0 2 
                                       f32_2 %538 = OpFMul %535 %537 
                                       f32_4 %539 = OpLoad %234 
                                       f32_2 %540 = OpVectorShuffle %539 %539 1 0 
                                       f32_2 %541 = OpFAdd %538 %540 
                                       f32_4 %542 = OpLoad %167 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 1 5 3 
                                                      OpStore %167 %543 
                                       f32_4 %544 = OpLoad %167 
                                       f32_2 %545 = OpVectorShuffle %544 %544 2 0 
                                       f32_2 %546 = OpFNegate %545 
                                       f32_4 %547 = OpLoad %234 
                                       f32_2 %548 = OpVectorShuffle %547 %547 0 1 
                                       f32_2 %549 = OpFAdd %546 %548 
                                       f32_4 %550 = OpLoad %175 
                                       f32_4 %551 = OpVectorShuffle %550 %549 4 1 5 3 
                                                      OpStore %175 %551 
                                       f32_4 %552 = OpLoad %167 
                                       f32_2 %553 = OpVectorShuffle %552 %552 0 2 
                                       f32_2 %554 = OpFNegate %553 
                                       f32_4 %555 = OpLoad vs_TEXCOORD2 
                                       f32_2 %556 = OpVectorShuffle %555 %555 1 0 
                                       f32_2 %557 = OpFAdd %554 %556 
                                       f32_4 %558 = OpLoad %167 
                                       f32_4 %559 = OpVectorShuffle %558 %557 4 1 5 3 
                                                      OpStore %167 %559 
                                Private f32* %561 = OpAccessChain %167 %223 
                                         f32 %562 = OpLoad %561 
                                Private f32* %563 = OpAccessChain %175 %223 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpFMul %562 %564 
                                                      OpStore %560 %565 
                                Private f32* %566 = OpAccessChain %175 %13 
                                         f32 %567 = OpLoad %566 
                                Private f32* %568 = OpAccessChain %167 %13 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFMul %567 %569 
                                         f32 %571 = OpLoad %560 
                                         f32 %572 = OpFNegate %571 
                                         f32 %573 = OpFAdd %570 %572 
                                Private f32* %574 = OpAccessChain %167 %13 
                                                      OpStore %574 %573 
                                Private f32* %575 = OpAccessChain %167 %13 
                                         f32 %576 = OpLoad %575 
                                        bool %577 = OpFOrdGreaterThanEqual %576 %47 
                               Private bool* %578 = OpAccessChain %278 %13 
                                                      OpStore %578 %577 
                               Private bool* %579 = OpAccessChain %278 %13 
                                        bool %580 = OpLoad %579 
                                                      OpSelectionMerge %583 None 
                                                      OpBranchConditional %580 %582 %586 
                                             %582 = OpLabel 
                                Private i32* %584 = OpAccessChain %139 %13 
                                         i32 %585 = OpLoad %584 
                                                      OpStore %581 %585 
                                                      OpBranch %583 
                                             %586 = OpLabel 
                                Private i32* %587 = OpAccessChain %139 %223 
                                         i32 %588 = OpLoad %587 
                                                      OpStore %581 %588 
                                                      OpBranch %583 
                                             %583 = OpLabel 
                                         i32 %589 = OpLoad %581 
                                Private i32* %590 = OpAccessChain %139 %13 
                                                      OpStore %590 %589 
                                         i32 %592 = OpLoad %460 
                                         i32 %593 = OpLoad %457 
                                        bool %594 = OpINotEqual %592 %593 
                                                      OpStore %591 %594 
                                        bool %595 = OpLoad %591 
                                                      OpSelectionMerge %598 None 
                                                      OpBranchConditional %595 %597 %600 
                                             %597 = OpLabel 
                                         i32 %599 = OpLoad %460 
                                                      OpStore %596 %599 
                                                      OpBranch %598 
                                             %600 = OpLabel 
                                Private i32* %601 = OpAccessChain %139 %13 
                                         i32 %602 = OpLoad %601 
                                                      OpStore %596 %602 
                                                      OpBranch %598 
                                             %598 = OpLabel 
                                         i32 %603 = OpLoad %596 
                                                      OpStore %460 %603 
                                         i32 %604 = OpLoad %460 
                                        bool %605 = OpIEqual %604 %77 
                                                      OpSelectionMerge %607 None 
                                                      OpBranchConditional %605 %606 %620 
                                             %606 = OpLabel 
                                       f32_3 %609 = OpLoad %44 
                                       f32_4 %611 = OpLoad %610 
                                       f32_3 %612 = OpVectorShuffle %611 %611 0 1 2 
                                       f32_3 %613 = OpFMul %609 %612 
                                                      OpStore %608 %613 
                                Private f32* %615 = OpAccessChain %26 %188 
                                         f32 %616 = OpLoad %615 
                                  Input f32* %617 = OpAccessChain %610 %188 
                                         f32 %618 = OpLoad %617 
                                         f32 %619 = OpFMul %616 %618 
                                                      OpStore %614 %619 
                                                      OpBranch %607 
                                             %620 = OpLabel 
                                         i32 %621 = OpLoad %460 
                                       i32_4 %622 = OpCompositeConstruct %621 %621 %621 %621 
                                      bool_4 %624 = OpIEqual %622 %623 
                                      bool_3 %625 = OpVectorShuffle %624 %624 0 1 2 
                                                      OpStore %278 %625 
                               Private bool* %626 = OpAccessChain %278 %223 
                                        bool %627 = OpLoad %626 
                                         i32 %628 = OpSelect %627 %120 %77 
                                                      OpStore %460 %628 
                               Private bool* %629 = OpAccessChain %278 %112 
                                        bool %630 = OpLoad %629 
                                         i32 %631 = OpLoad %460 
                                         i32 %632 = OpSelect %630 %101 %631 
                                                      OpStore %460 %632 
                               Private bool* %633 = OpAccessChain %278 %13 
                                        bool %634 = OpLoad %633 
                                         i32 %635 = OpLoad %460 
                                         i32 %636 = OpSelect %634 %115 %635 
                                                      OpStore %460 %636 
                                       f32_3 %638 = OpLoad %44 
                                         i32 %640 = OpLoad %460 
                              Uniform f32_4* %642 = OpAccessChain %76 %639 %640 
                                       f32_4 %643 = OpLoad %642 
                                       f32_3 %644 = OpVectorShuffle %643 %643 0 1 2 
                                       f32_3 %645 = OpFMul %638 %644 
                                                      OpStore %637 %645 
                                Private f32* %647 = OpAccessChain %26 %188 
                                         f32 %648 = OpLoad %647 
                                         i32 %649 = OpLoad %460 
                                Uniform f32* %650 = OpAccessChain %76 %639 %649 %188 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %648 %651 
                                                      OpStore %646 %652 
                                       f32_3 %653 = OpLoad %637 
                                                      OpStore %608 %653 
                                         f32 %654 = OpLoad %646 
                                                      OpStore %614 %654 
                                                      OpBranch %607 
                                             %607 = OpLabel 
                                        bool %655 = OpLoad %423 
                                        bool %656 = OpLoad %430 
                                        bool %657 = OpLogicalOr %655 %656 
                                                      OpStore %452 %657 
                                       f32_4 %658 = OpLoad %490 
                                       f32_2 %659 = OpVectorShuffle %658 %658 2 3 
                                       f32_2 %660 = OpFNegate %659 
                                       f32_4 %661 = OpLoad vs_TEXCOORD2 
                                       f32_2 %662 = OpVectorShuffle %661 %661 0 1 
                                       f32_2 %663 = OpFAdd %660 %662 
                                       f32_4 %664 = OpLoad %167 
                                       f32_4 %665 = OpVectorShuffle %664 %663 4 5 2 3 
                                                      OpStore %167 %665 
                                       f32_4 %667 = OpLoad %167 
                                       f32_2 %668 = OpVectorShuffle %667 %667 0 1 
                                       f32_4 %669 = OpLoad %167 
                                       f32_2 %670 = OpVectorShuffle %669 %669 0 1 
                                         f32 %671 = OpDot %668 %670 
                                                      OpStore %666 %671 
                                         f32 %672 = OpLoad %666 
                                         f32 %673 = OpExtInst %1 31 %672 
                                                      OpStore %666 %673 
                                         f32 %674 = OpLoad %666 
                                         i32 %675 = OpLoad %150 
                                Uniform f32* %676 = OpAccessChain %76 %101 %675 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFNegate %677 
                                         f32 %679 = OpFAdd %674 %678 
                                                      OpStore %666 %679 
                                         f32 %680 = OpLoad %666 
                                Private f32* %681 = OpAccessChain %9 %13 
                                         f32 %682 = OpLoad %681 
                                         f32 %683 = OpFMul %680 %682 
                                         f32 %684 = OpFAdd %683 %105 
                                                      OpStore %666 %684 
                                         f32 %685 = OpLoad %666 
                                         f32 %686 = OpExtInst %1 43 %685 %47 %20 
                                                      OpStore %666 %686 
                                        bool %687 = OpLoad %452 
                                         f32 %688 = OpLoad %666 
                                         f32 %689 = OpSelect %687 %688 %47 
                                                      OpStore %666 %689 
                                Private f32* %691 = OpAccessChain %196 %223 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpFNegate %692 
                                         i32 %694 = OpLoad %150 
                                Uniform f32* %695 = OpAccessChain %76 %101 %694 
                                         f32 %696 = OpLoad %695 
                                         f32 %697 = OpFAdd %693 %696 
                                                      OpStore %690 %697 
                                Private f32* %699 = OpAccessChain %234 %223 
                                         f32 %700 = OpLoad %699 
                                         f32 %701 = OpFNegate %700 
                                         i32 %702 = OpLoad %150 
                                Uniform f32* %703 = OpAccessChain %76 %101 %702 
                                         f32 %704 = OpLoad %703 
                                         f32 %705 = OpFAdd %701 %704 
                                                      OpStore %698 %705 
                                         f32 %707 = OpLoad %690 
                                         f32 %708 = OpLoad %698 
                                         f32 %709 = OpFDiv %707 %708 
                                                      OpStore %706 %709 
                                         f32 %710 = OpLoad %706 
                                Private f32* %711 = OpAccessChain %167 %112 
                                         f32 %712 = OpLoad %711 
                                         f32 %713 = OpFMul %710 %712 
                                Private f32* %714 = OpAccessChain %167 %223 
                                                      OpStore %714 %713 
                                       f32_4 %715 = OpLoad %167 
                                       f32_2 %716 = OpVectorShuffle %715 %715 0 2 
                                       f32_4 %717 = OpLoad %167 
                                       f32_2 %718 = OpVectorShuffle %717 %717 0 2 
                                         f32 %719 = OpDot %716 %718 
                                                      OpStore %706 %719 
                                         f32 %720 = OpLoad %706 
                                         f32 %721 = OpExtInst %1 31 %720 
                                                      OpStore %706 %721 
                                         f32 %722 = OpLoad %690 
                                         f32 %723 = OpFNegate %722 
                                         f32 %724 = OpLoad %706 
                                         f32 %725 = OpFAdd %723 %724 
                                                      OpStore %706 %725 
                                         f32 %726 = OpLoad %706 
                                Private f32* %727 = OpAccessChain %9 %13 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFMul %726 %728 
                                         f32 %730 = OpFAdd %729 %105 
                                Private f32* %731 = OpAccessChain %9 %13 
                                                      OpStore %731 %730 
                                Private f32* %732 = OpAccessChain %9 %13 
                                         f32 %733 = OpLoad %732 
                                         f32 %734 = OpExtInst %1 43 %733 %47 %20 
                                Private f32* %735 = OpAccessChain %9 %13 
                                                      OpStore %735 %734 
                                         f32 %736 = OpLoad %690 
                                        bool %737 = OpFOrdLessThan %47 %736 
                                                      OpStore %591 %737 
                                         f32 %739 = OpLoad %698 
                                        bool %740 = OpFOrdLessThan %47 %739 
                                                      OpStore %738 %740 
                                        bool %741 = OpLoad %738 
                                        bool %742 = OpLoad %591 
                                        bool %743 = OpLogicalAnd %741 %742 
                                                      OpStore %738 %743 
                                        bool %744 = OpLoad %738 
                                                      OpSelectionMerge %748 None 
                                                      OpBranchConditional %744 %747 %751 
                                             %747 = OpLabel 
                                Private f32* %749 = OpAccessChain %9 %13 
                                         f32 %750 = OpLoad %749 
                                                      OpStore %746 %750 
                                                      OpBranch %748 
                                             %751 = OpLabel 
                                                      OpStore %746 %20 
                                                      OpBranch %748 
                                             %748 = OpLabel 
                                         f32 %752 = OpLoad %746 
                                Private f32* %753 = OpAccessChain %9 %13 
                                                      OpStore %753 %752 
                                        bool %754 = OpLoad %452 
                                                      OpSelectionMerge %757 None 
                                                      OpBranchConditional %754 %756 %760 
                                             %756 = OpLabel 
                                Private f32* %758 = OpAccessChain %9 %13 
                                         f32 %759 = OpLoad %758 
                                                      OpStore %755 %759 
                                                      OpBranch %757 
                                             %760 = OpLabel 
                                                      OpStore %755 %47 
                                                      OpBranch %757 
                                             %757 = OpLabel 
                                         f32 %761 = OpLoad %755 
                                Private f32* %762 = OpAccessChain %9 %13 
                                                      OpStore %762 %761 
                                         f32 %763 = OpLoad %666 
                                        bool %764 = OpFOrdEqual %763 %47 
                                                      OpStore %452 %764 
                                         f32 %765 = OpLoad %666 
                                         f32 %766 = OpFNegate %765 
                                         f32 %767 = OpFAdd %766 %20 
                                                      OpStore %698 %767 
                                        bool %768 = OpLoad %452 
                                                      OpSelectionMerge %771 None 
                                                      OpBranchConditional %768 %770 %774 
                                             %770 = OpLabel 
                                Private f32* %772 = OpAccessChain %9 %13 
                                         f32 %773 = OpLoad %772 
                                                      OpStore %769 %773 
                                                      OpBranch %771 
                                             %774 = OpLabel 
                                         f32 %775 = OpLoad %698 
                                                      OpStore %769 %775 
                                                      OpBranch %771 
                                             %771 = OpLabel 
                                         f32 %776 = OpLoad %769 
                                Private f32* %777 = OpAccessChain %9 %13 
                                                      OpStore %777 %776 
                               Private bool* %778 = OpAccessChain %130 %13 
                                        bool %779 = OpLoad %778 
                                                      OpSelectionMerge %782 None 
                                                      OpBranchConditional %779 %781 %785 
                                             %781 = OpLabel 
                                Private f32* %783 = OpAccessChain %9 %13 
                                         f32 %784 = OpLoad %783 
                                                      OpStore %780 %784 
                                                      OpBranch %782 
                                             %785 = OpLabel 
                                                      OpStore %780 %20 
                                                      OpBranch %782 
                                             %782 = OpLabel 
                                         f32 %786 = OpLoad %780 
                                Private f32* %787 = OpAccessChain %9 %13 
                                                      OpStore %787 %786 
                                Private f32* %788 = OpAccessChain %9 %13 
                                         f32 %789 = OpLoad %788 
                                         f32 %790 = OpLoad %614 
                                         f32 %791 = OpFMul %789 %790 
                                                      OpStore %111 %791 
                                        bool %792 = OpLoad %369 
                                         f32 %793 = OpSelect %792 %47 %20 
                                                      OpStore %698 %793 
                               Private bool* %794 = OpAccessChain %130 %13 
                                        bool %795 = OpLoad %794 
                                         f32 %796 = OpLoad %698 
                                         f32 %797 = OpSelect %795 %20 %796 
                                Private f32* %798 = OpAccessChain %50 %13 
                                                      OpStore %798 %797 
                                Private f32* %799 = OpAccessChain %50 %13 
                                         f32 %800 = OpLoad %799 
                                         f32 %801 = OpLoad %111 
                                         f32 %802 = OpFMul %800 %801 
                                Private f32* %803 = OpAccessChain %9 %223 
                                                      OpStore %803 %802 
                         read_only Texture2D %805 = OpLoad %804 
                                     sampler %807 = OpLoad %806 
                  read_only Texture2DSampled %808 = OpSampledImage %805 %807 
                                       f32_2 %810 = OpLoad vs_TEXCOORD1 
                                       f32_4 %811 = OpImageSampleImplicitLod %808 %810 
                                         f32 %812 = OpCompositeExtract %811 3 
                                Private f32* %813 = OpAccessChain %50 %223 
                                                      OpStore %813 %812 
                                Uniform i32* %815 = OpAccessChain %76 %115 
                                         i32 %816 = OpLoad %815 
                                        bool %817 = OpINotEqual %816 %639 
                                                      OpStore %814 %817 
                                       f32_3 %818 = OpLoad %50 
                                       f32_2 %819 = OpVectorShuffle %818 %818 0 2 
                                       f32_4 %820 = OpLoad %9 
                                       f32_2 %821 = OpVectorShuffle %820 %820 0 2 
                                       f32_2 %822 = OpFMul %819 %821 
                                       f32_4 %823 = OpLoad %9 
                                       f32_4 %824 = OpVectorShuffle %823 %822 4 1 5 3 
                                                      OpStore %9 %824 
                                Private f32* %825 = OpAccessChain %50 %223 
                                         f32 %826 = OpLoad %825 
                                Private f32* %827 = OpAccessChain %9 %13 
                                         f32 %828 = OpLoad %827 
                                         f32 %829 = OpFMul %826 %828 
                                Private f32* %830 = OpAccessChain %9 %13 
                                                      OpStore %830 %829 
                                       f32_4 %831 = OpLoad %9 
                                       f32_3 %832 = OpVectorShuffle %831 %831 0 0 0 
                                       f32_3 %833 = OpLoad %608 
                                       f32_3 %834 = OpFMul %832 %833 
                                       f32_4 %835 = OpLoad %9 
                                       f32_4 %836 = OpVectorShuffle %835 %834 4 5 2 6 
                                                      OpStore %9 %836 
                                        bool %839 = OpLoad %814 
                                                      OpSelectionMerge %842 None 
                                                      OpBranchConditional %839 %841 %845 
                                             %841 = OpLabel 
                                       f32_4 %843 = OpLoad %9 
                                       f32_3 %844 = OpVectorShuffle %843 %843 0 1 3 
                                                      OpStore %840 %844 
                                                      OpBranch %842 
                                             %845 = OpLabel 
                                       f32_3 %846 = OpLoad %608 
                                                      OpStore %840 %846 
                                                      OpBranch %842 
                                             %842 = OpLabel 
                                       f32_3 %847 = OpLoad %840 
                                       f32_4 %848 = OpLoad %838 
                                       f32_4 %849 = OpVectorShuffle %848 %847 4 5 6 3 
                                                      OpStore %838 %849 
                                Private f32* %850 = OpAccessChain %9 %223 
                                         f32 %851 = OpLoad %850 
                                 Output f32* %853 = OpAccessChain %838 %188 
                                                      OpStore %853 %851 
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
; Bound: 855
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %39 %610 %809 %838 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD2 Location 11 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 39 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpDecorate %73 ArrayStride 73 
                                                      OpMemberDecorate %74 0 Offset 74 
                                                      OpMemberDecorate %74 1 Offset 74 
                                                      OpMemberDecorate %74 2 Offset 74 
                                                      OpMemberDecorate %74 3 Offset 74 
                                                      OpMemberDecorate %74 4 Offset 74 
                                                      OpMemberDecorate %74 5 Offset 74 
                                                      OpDecorate %74 Block 
                                                      OpDecorate %76 DescriptorSet 76 
                                                      OpDecorate %76 Binding 76 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %610 RelaxedPrecision 
                                                      OpDecorate %610 Location 610 
                                                      OpDecorate %611 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %614 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %618 RelaxedPrecision 
                                                      OpDecorate %619 RelaxedPrecision 
                                                      OpDecorate %638 RelaxedPrecision 
                                                      OpDecorate %648 RelaxedPrecision 
                                                      OpDecorate %790 RelaxedPrecision 
                                                      OpDecorate %804 RelaxedPrecision 
                                                      OpDecorate %804 DescriptorSet 804 
                                                      OpDecorate %804 Binding 804 
                                                      OpDecorate %805 RelaxedPrecision 
                                                      OpDecorate %806 RelaxedPrecision 
                                                      OpDecorate %806 DescriptorSet 806 
                                                      OpDecorate %806 Binding 806 
                                                      OpDecorate %807 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 809 
                                                      OpDecorate %833 RelaxedPrecision 
                                                      OpDecorate %838 RelaxedPrecision 
                                                      OpDecorate %838 Location 838 
                                                      OpDecorate %846 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 0 
                                              %14 = OpTypePointer Input %6 
                                              %18 = OpTypePointer Private %6 
                                          f32 %20 = OpConstant 3.674022E-40 
                               Private f32_4* %26 = OpVariable Private 
                                              %27 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %28 = OpTypePointer UniformConstant %27 
         UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
                                              %31 = OpTypeSampler 
                                              %32 = OpTypePointer UniformConstant %31 
                     UniformConstant sampler* %33 = OpVariable UniformConstant 
                                              %35 = OpTypeSampledImage %27 
                                              %37 = OpTypeVector %6 2 
                                              %38 = OpTypePointer Input %37 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Private %42 
                               Private f32_3* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.674022E-40 
                                        f32_3 %48 = OpConstantComposite %47 %47 %47 
                               Private f32_3* %50 = OpVariable Private 
                                          f32 %54 = OpConstant 3.674022E-40 
                                        f32_3 %55 = OpConstantComposite %54 %54 %54 
                                          f32 %60 = OpConstant 3.674022E-40 
                                        f32_3 %61 = OpConstantComposite %60 %60 %60 
                                          f32 %63 = OpConstant 3.674022E-40 
                                        f32_3 %64 = OpConstantComposite %63 %63 %63 
                                              %68 = OpTypeInt 32 1 
                                          u32 %69 = OpConstant 4 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeArray %6 %69 
                                              %72 = OpTypeArray %6 %69 
                                              %73 = OpTypeArray %7 %69 
                                              %74 = OpTypeStruct %68 %68 %70 %71 %72 %73 
                                              %75 = OpTypePointer Uniform %74 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; f32_4[4];}* %76 = OpVariable Uniform 
                                          i32 %77 = OpConstant 0 
                                              %78 = OpTypePointer Uniform %68 
                                              %81 = OpTypeBool 
                                              %83 = OpTypePointer Function %42 
                                          i32 %94 = OpConstant 4 
                                              %95 = OpTypePointer Uniform %6 
                                         i32 %101 = OpConstant 2 
                                         f32 %105 = OpConstant 3.674022E-40 
                                Private f32* %111 = OpVariable Private 
                                         u32 %112 = OpConstant 1 
                                         i32 %115 = OpConstant 1 
                                         i32 %120 = OpConstant 3 
                                             %128 = OpTypeVector %81 2 
                                             %129 = OpTypePointer Private %128 
                             Private bool_2* %130 = OpVariable Private 
                                       f32_4 %131 = OpConstantComposite %47 %47 %47 %47 
                                             %134 = OpTypeVector %81 4 
                                             %137 = OpTypeVector %68 3 
                                             %138 = OpTypePointer Private %137 
                              Private i32_3* %139 = OpVariable Private 
                                             %140 = OpTypePointer Private %81 
                                       i32_3 %143 = OpConstantComposite %77 %115 %101 
                                         i32 %144 = OpConstant 8 
                                       i32_3 %145 = OpConstantComposite %120 %101 %144 
                                             %146 = OpTypeVector %81 3 
                                             %149 = OpTypePointer Private %68 
                                Private i32* %150 = OpVariable Private 
                                             %153 = OpTypePointer Function %68 
                              Private f32_4* %167 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %188 = OpConstant 3 
                              Private f32_4* %196 = OpVariable Private 
                                         u32 %223 = OpConstant 2 
                              Private f32_4* %234 = OpVariable Private 
                                             %267 = OpTypePointer Function %7 
                                             %277 = OpTypePointer Private %146 
                             Private bool_3* %278 = OpVariable Private 
                             Private bool_2* %287 = OpVariable Private 
                                             %296 = OpTypePointer Function %128 
                             Private bool_2* %313 = OpVariable Private 
                                Private f32* %335 = OpVariable Private 
                               Private bool* %359 = OpVariable Private 
                               Private bool* %369 = OpVariable Private 
                                             %402 = OpTypeVector %68 4 
                                       i32_4 %404 = OpConstantComposite %77 %77 %101 %77 
                               Private bool* %423 = OpVariable Private 
                                Private i32* %427 = OpVariable Private 
                               Private bool* %430 = OpVariable Private 
                                Private i32* %434 = OpVariable Private 
                               Private bool* %447 = OpVariable Private 
                               Private bool* %452 = OpVariable Private 
                                Private i32* %457 = OpVariable Private 
                                Private i32* %460 = OpVariable Private 
                                         f32 %487 = OpConstant 3.674022E-40 
                              Private f32_4* %490 = OpVariable Private 
                                         f32 %536 = OpConstant 3.674022E-40 
                                       f32_2 %537 = OpConstantComposite %536 %536 
                                Private f32* %560 = OpVariable Private 
                               Private bool* %591 = OpVariable Private 
                              Private f32_3* %608 = OpVariable Private 
                                Input f32_4* %610 = OpVariable Input 
                                Private f32* %614 = OpVariable Private 
                                       i32_4 %623 = OpConstantComposite %101 %94 %144 %77 
                              Private f32_3* %637 = OpVariable Private 
                                         i32 %639 = OpConstant 5 
                                             %641 = OpTypePointer Uniform %7 
                                Private f32* %646 = OpVariable Private 
                                Private f32* %666 = OpVariable Private 
                                Private f32* %690 = OpVariable Private 
                                Private f32* %698 = OpVariable Private 
                                Private f32* %706 = OpVariable Private 
                               Private bool* %738 = OpVariable Private 
                                             %745 = OpTypePointer Function %6 
        UniformConstant read_only Texture2D* %804 = OpVariable UniformConstant 
                    UniformConstant sampler* %806 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                               Private bool* %814 = OpVariable Private 
                                             %837 = OpTypePointer Output %7 
                               Output f32_4* %838 = OpVariable Output 
                                             %852 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %84 = OpVariable Function 
                               Function i32* %154 = OpVariable Function 
                             Function f32_4* %268 = OpVariable Function 
                            Function bool_2* %297 = OpVariable Function 
                            Function bool_2* %322 = OpVariable Function 
                               Function i32* %581 = OpVariable Function 
                               Function i32* %596 = OpVariable Function 
                               Function f32* %746 = OpVariable Function 
                               Function f32* %755 = OpVariable Function 
                               Function f32* %769 = OpVariable Function 
                               Function f32* %780 = OpVariable Function 
                             Function f32_3* %840 = OpVariable Function 
                                   Input f32* %15 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %16 = OpLoad %15 
                                          f32 %17 = OpDPdx %16 
                                 Private f32* %19 = OpAccessChain %9 %13 
                                                      OpStore %19 %17 
                                 Private f32* %21 = OpAccessChain %9 %13 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpExtInst %1 4 %22 
                                          f32 %24 = OpFDiv %20 %23 
                                 Private f32* %25 = OpAccessChain %9 %13 
                                                      OpStore %25 %24 
                          read_only Texture2D %30 = OpLoad %29 
                                      sampler %34 = OpLoad %33 
                   read_only Texture2DSampled %36 = OpSampledImage %30 %34 
                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
                                        f32_4 %41 = OpImageSampleImplicitLod %36 %40 
                                                      OpStore %26 %41 
                                        f32_4 %45 = OpLoad %26 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %49 = OpExtInst %1 40 %46 %48 
                                                      OpStore %44 %49 
                                        f32_3 %51 = OpLoad %44 
                                        f32_3 %52 = OpExtInst %1 30 %51 
                                                      OpStore %50 %52 
                                        f32_3 %53 = OpLoad %50 
                                        f32_3 %56 = OpFMul %53 %55 
                                                      OpStore %50 %56 
                                        f32_3 %57 = OpLoad %50 
                                        f32_3 %58 = OpExtInst %1 29 %57 
                                                      OpStore %50 %58 
                                        f32_3 %59 = OpLoad %50 
                                        f32_3 %62 = OpFMul %59 %61 
                                        f32_3 %65 = OpFAdd %62 %64 
                                                      OpStore %50 %65 
                                        f32_3 %66 = OpLoad %50 
                                        f32_3 %67 = OpExtInst %1 40 %66 %48 
                                                      OpStore %50 %67 
                                 Uniform i32* %79 = OpAccessChain %76 %77 
                                          i32 %80 = OpLoad %79 
                                         bool %82 = OpINotEqual %80 %77 
                                                      OpSelectionMerge %86 None 
                                                      OpBranchConditional %82 %85 %88 
                                              %85 = OpLabel 
                                        f32_3 %87 = OpLoad %50 
                                                      OpStore %84 %87 
                                                      OpBranch %86 
                                              %88 = OpLabel 
                                        f32_4 %89 = OpLoad %26 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                                      OpStore %84 %90 
                                                      OpBranch %86 
                                              %86 = OpLabel 
                                        f32_3 %91 = OpLoad %84 
                                                      OpStore %44 %91 
                                   Input f32* %92 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %96 = OpAccessChain %76 %94 %77 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                          f32 %99 = OpFAdd %93 %98 
                                Private f32* %100 = OpAccessChain %50 %13 
                                                      OpStore %100 %99 
                                Uniform f32* %102 = OpAccessChain %76 %94 %101 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFNegate %103 
                                         f32 %106 = OpFMul %104 %105 
                                Private f32* %107 = OpAccessChain %50 %13 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFAdd %106 %108 
                                Private f32* %110 = OpAccessChain %50 %13 
                                                      OpStore %110 %109 
                                  Input f32* %113 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %76 %94 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFNegate %117 
                                         f32 %119 = OpFAdd %114 %118 
                                                      OpStore %111 %119 
                                Uniform f32* %121 = OpAccessChain %76 %94 %120 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                         f32 %124 = OpFMul %123 %105 
                                         f32 %125 = OpLoad %111 
                                         f32 %126 = OpFAdd %124 %125 
                                Private f32* %127 = OpAccessChain %50 %112 
                                                      OpStore %127 %126 
                                       f32_3 %132 = OpLoad %50 
                                       f32_4 %133 = OpVectorShuffle %132 %132 0 1 0 0 
                                      bool_4 %135 = OpFOrdGreaterThanEqual %131 %133 
                                      bool_2 %136 = OpVectorShuffle %135 %135 0 1 
                                                      OpStore %130 %136 
                               Private bool* %141 = OpAccessChain %130 %112 
                                        bool %142 = OpLoad %141 
                                      bool_3 %147 = OpCompositeConstruct %142 %142 %142 
                                       i32_3 %148 = OpSelect %147 %143 %145 
                                                      OpStore %139 %148 
                               Private bool* %151 = OpAccessChain %130 %13 
                                        bool %152 = OpLoad %151 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %152 %155 %159 
                                             %155 = OpLabel 
                                Private i32* %157 = OpAccessChain %139 %13 
                                         i32 %158 = OpLoad %157 
                                                      OpStore %154 %158 
                                                      OpBranch %156 
                                             %159 = OpLabel 
                                Private i32* %160 = OpAccessChain %139 %112 
                                         i32 %161 = OpLoad %160 
                                                      OpStore %154 %161 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                         i32 %162 = OpLoad %154 
                                                      OpStore %150 %162 
                               Private bool* %163 = OpAccessChain %130 %13 
                                        bool %164 = OpLoad %163 
                                         i32 %165 = OpSelect %164 %115 %94 
                                Private i32* %166 = OpAccessChain %139 %13 
                                                      OpStore %166 %165 
                                Uniform f32* %168 = OpAccessChain %76 %94 %77 
                                         f32 %169 = OpLoad %168 
                                         i32 %170 = OpLoad %150 
                                Uniform f32* %171 = OpAccessChain %76 %101 %170 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFAdd %169 %172 
                                Private f32* %174 = OpAccessChain %167 %112 
                                                      OpStore %174 %173 
                                Uniform f32* %176 = OpAccessChain %76 %94 %115 
                                         f32 %177 = OpLoad %176 
                                         i32 %178 = OpLoad %150 
                                Uniform f32* %179 = OpAccessChain %76 %101 %178 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFAdd %177 %180 
                                Private f32* %182 = OpAccessChain %175 %112 
                                                      OpStore %182 %181 
                                Uniform f32* %183 = OpAccessChain %76 %120 %77 
                                         f32 %184 = OpLoad %183 
                                Uniform f32* %185 = OpAccessChain %76 %94 %77 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFAdd %184 %186 
                                Private f32* %189 = OpAccessChain %167 %188 
                                                      OpStore %189 %187 
                                Uniform f32* %190 = OpAccessChain %76 %120 %115 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %76 %94 %115 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFAdd %191 %193 
                                Private f32* %195 = OpAccessChain %175 %188 
                                                      OpStore %195 %194 
                                Uniform f32* %197 = OpAccessChain %76 %94 %77 
                                         f32 %198 = OpLoad %197 
                                Uniform f32* %199 = OpAccessChain %76 %94 %101 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFAdd %198 %200 
                                Private f32* %202 = OpAccessChain %196 %13 
                                                      OpStore %202 %201 
                                Private f32* %203 = OpAccessChain %196 %13 
                                         f32 %204 = OpLoad %203 
                                         i32 %205 = OpLoad %150 
                                Uniform f32* %206 = OpAccessChain %76 %101 %205 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFNegate %207 
                                         f32 %209 = OpFAdd %204 %208 
                                Private f32* %210 = OpAccessChain %196 %112 
                                                      OpStore %210 %209 
                                Private f32* %211 = OpAccessChain %196 %13 
                                         f32 %212 = OpLoad %211 
                                Uniform f32* %213 = OpAccessChain %76 %120 %101 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFNegate %214 
                                         f32 %216 = OpFAdd %212 %215 
                                Private f32* %217 = OpAccessChain %196 %188 
                                                      OpStore %217 %216 
                                Uniform f32* %218 = OpAccessChain %76 %94 %77 
                                         f32 %219 = OpLoad %218 
                                Private f32* %220 = OpAccessChain %167 %13 
                                                      OpStore %220 %219 
                                Uniform f32* %221 = OpAccessChain %76 %120 %77 
                                         f32 %222 = OpLoad %221 
                                Private f32* %224 = OpAccessChain %167 %223 
                                                      OpStore %224 %222 
                                Uniform f32* %225 = OpAccessChain %76 %120 %101 
                                         f32 %226 = OpLoad %225 
                                Private f32* %227 = OpAccessChain %196 %223 
                                                      OpStore %227 %226 
                               Private bool* %228 = OpAccessChain %130 %13 
                                        bool %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %167 
                                       f32_4 %231 = OpLoad %196 
                                      bool_4 %232 = OpCompositeConstruct %229 %229 %229 %229 
                                       f32_4 %233 = OpSelect %232 %230 %231 
                                                      OpStore %196 %233 
                                Uniform f32* %235 = OpAccessChain %76 %94 %115 
                                         f32 %236 = OpLoad %235 
                                Uniform f32* %237 = OpAccessChain %76 %94 %120 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFAdd %236 %238 
                                Private f32* %240 = OpAccessChain %234 %13 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %234 %13 
                                         f32 %242 = OpLoad %241 
                                         i32 %243 = OpLoad %150 
                                Uniform f32* %244 = OpAccessChain %76 %101 %243 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFNegate %245 
                                         f32 %247 = OpFAdd %242 %246 
                                Private f32* %248 = OpAccessChain %234 %112 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %234 %13 
                                         f32 %250 = OpLoad %249 
                                Uniform f32* %251 = OpAccessChain %76 %120 %120 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFNegate %252 
                                         f32 %254 = OpFAdd %250 %253 
                                Private f32* %255 = OpAccessChain %234 %188 
                                                      OpStore %255 %254 
                                Uniform f32* %256 = OpAccessChain %76 %94 %115 
                                         f32 %257 = OpLoad %256 
                                Private f32* %258 = OpAccessChain %175 %13 
                                                      OpStore %258 %257 
                                Uniform f32* %259 = OpAccessChain %76 %120 %115 
                                         f32 %260 = OpLoad %259 
                                Private f32* %261 = OpAccessChain %175 %223 
                                                      OpStore %261 %260 
                                Uniform f32* %262 = OpAccessChain %76 %120 %120 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %234 %223 
                                                      OpStore %264 %263 
                               Private bool* %265 = OpAccessChain %130 %112 
                                        bool %266 = OpLoad %265 
                                                      OpSelectionMerge %270 None 
                                                      OpBranchConditional %266 %269 %273 
                                             %269 = OpLabel 
                                       f32_4 %271 = OpLoad %175 
                                       f32_4 %272 = OpVectorShuffle %271 %271 1 0 2 3 
                                                      OpStore %268 %272 
                                                      OpBranch %270 
                                             %273 = OpLabel 
                                       f32_4 %274 = OpLoad %234 
                                       f32_4 %275 = OpVectorShuffle %274 %274 1 0 2 3 
                                                      OpStore %268 %275 
                                                      OpBranch %270 
                                             %270 = OpLabel 
                                       f32_4 %276 = OpLoad %268 
                                                      OpStore %234 %276 
                                       f32_4 %279 = OpLoad %196 
                                       f32_4 %280 = OpVectorShuffle %279 %279 1 3 1 1 
                                       f32_4 %281 = OpLoad vs_TEXCOORD2 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 0 0 0 
                                      bool_4 %283 = OpFOrdGreaterThanEqual %280 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                      bool_3 %285 = OpLoad %278 
                                      bool_3 %286 = OpVectorShuffle %285 %284 3 4 2 
                                                      OpStore %278 %286 
                                       f32_4 %288 = OpLoad vs_TEXCOORD2 
                                       f32_4 %289 = OpVectorShuffle %288 %288 0 0 0 0 
                                       f32_4 %290 = OpLoad %196 
                                       f32_4 %291 = OpVectorShuffle %290 %290 1 3 1 1 
                                      bool_4 %292 = OpFOrdGreaterThanEqual %289 %291 
                                      bool_2 %293 = OpVectorShuffle %292 %292 0 1 
                                                      OpStore %287 %293 
                               Private bool* %294 = OpAccessChain %130 %13 
                                        bool %295 = OpLoad %294 
                                                      OpSelectionMerge %299 None 
                                                      OpBranchConditional %295 %298 %302 
                                             %298 = OpLabel 
                                      bool_3 %300 = OpLoad %278 
                                      bool_2 %301 = OpVectorShuffle %300 %300 0 1 
                                                      OpStore %297 %301 
                                                      OpBranch %299 
                                             %302 = OpLabel 
                                      bool_2 %303 = OpLoad %287 
                                                      OpStore %297 %303 
                                                      OpBranch %299 
                                             %299 = OpLabel 
                                      bool_2 %304 = OpLoad %297 
                                      bool_3 %305 = OpLoad %278 
                                      bool_3 %306 = OpVectorShuffle %305 %304 3 4 2 
                                                      OpStore %278 %306 
                                       f32_4 %307 = OpLoad %234 
                                       f32_4 %308 = OpVectorShuffle %307 %307 0 3 0 0 
                                       f32_4 %309 = OpLoad vs_TEXCOORD2 
                                       f32_4 %310 = OpVectorShuffle %309 %309 1 1 1 1 
                                      bool_4 %311 = OpFOrdGreaterThanEqual %308 %310 
                                      bool_2 %312 = OpVectorShuffle %311 %311 0 1 
                                                      OpStore %287 %312 
                                       f32_4 %314 = OpLoad vs_TEXCOORD2 
                                       f32_4 %315 = OpVectorShuffle %314 %314 1 1 1 1 
                                       f32_4 %316 = OpLoad %234 
                                       f32_4 %317 = OpVectorShuffle %316 %316 0 3 0 0 
                                      bool_4 %318 = OpFOrdGreaterThanEqual %315 %317 
                                      bool_2 %319 = OpVectorShuffle %318 %318 0 1 
                                                      OpStore %313 %319 
                               Private bool* %320 = OpAccessChain %130 %112 
                                        bool %321 = OpLoad %320 
                                                      OpSelectionMerge %324 None 
                                                      OpBranchConditional %321 %323 %326 
                                             %323 = OpLabel 
                                      bool_2 %325 = OpLoad %287 
                                                      OpStore %322 %325 
                                                      OpBranch %324 
                                             %326 = OpLabel 
                                      bool_2 %327 = OpLoad %313 
                                                      OpStore %322 %327 
                                                      OpBranch %324 
                                             %324 = OpLabel 
                                      bool_2 %328 = OpLoad %322 
                                                      OpStore %130 %328 
                               Private bool* %329 = OpAccessChain %130 %13 
                                        bool %330 = OpLoad %329 
                               Private bool* %331 = OpAccessChain %278 %13 
                                        bool %332 = OpLoad %331 
                                        bool %333 = OpLogicalAnd %330 %332 
                               Private bool* %334 = OpAccessChain %130 %13 
                                                      OpStore %334 %333 
                                Uniform f32* %336 = OpAccessChain %76 %120 %77 
                                         f32 %337 = OpLoad %336 
                                Uniform f32* %338 = OpAccessChain %76 %120 %101 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFAdd %337 %339 
                                                      OpStore %335 %340 
                                         f32 %341 = OpLoad %335 
                                         f32 %342 = OpFNegate %341 
                                Uniform f32* %343 = OpAccessChain %76 %94 %101 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFAdd %342 %344 
                                                      OpStore %335 %345 
                                Uniform f32* %346 = OpAccessChain %76 %120 %115 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %348 = OpAccessChain %76 %120 %120 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFAdd %347 %349 
                                Private f32* %351 = OpAccessChain %167 %13 
                                                      OpStore %351 %350 
                                Private f32* %352 = OpAccessChain %167 %13 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpFNegate %353 
                                Uniform f32* %355 = OpAccessChain %76 %94 %120 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFAdd %354 %356 
                                Private f32* %358 = OpAccessChain %167 %13 
                                                      OpStore %358 %357 
                                  Input f32* %360 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %361 = OpLoad %360 
                                Private f32* %362 = OpAccessChain %167 %188 
                                         f32 %363 = OpLoad %362 
                                        bool %364 = OpFOrdGreaterThanEqual %361 %363 
                                                      OpStore %359 %364 
                                         f32 %365 = OpLoad %335 
                                Private f32* %366 = OpAccessChain %167 %188 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFAdd %365 %367 
                                                      OpStore %335 %368 
                                         f32 %370 = OpLoad %335 
                                  Input f32* %371 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %372 = OpLoad %371 
                                        bool %373 = OpFOrdGreaterThanEqual %370 %372 
                                                      OpStore %369 %373 
                                        bool %374 = OpLoad %369 
                                        bool %375 = OpLoad %359 
                                        bool %376 = OpLogicalAnd %374 %375 
                                                      OpStore %369 %376 
                                  Input f32* %377 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %378 = OpLoad %377 
                                Private f32* %379 = OpAccessChain %175 %188 
                                         f32 %380 = OpLoad %379 
                                        bool %381 = OpFOrdGreaterThanEqual %378 %380 
                                                      OpStore %359 %381 
                                        bool %382 = OpLoad %369 
                                        bool %383 = OpLoad %359 
                                        bool %384 = OpLogicalAnd %382 %383 
                                                      OpStore %369 %384 
                                Private f32* %385 = OpAccessChain %167 %13 
                                         f32 %386 = OpLoad %385 
                                Private f32* %387 = OpAccessChain %175 %188 
                                         f32 %388 = OpLoad %387 
                                         f32 %389 = OpFAdd %386 %388 
                                Private f32* %390 = OpAccessChain %167 %13 
                                                      OpStore %390 %389 
                                Private f32* %391 = OpAccessChain %167 %13 
                                         f32 %392 = OpLoad %391 
                                  Input f32* %393 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %394 = OpLoad %393 
                                        bool %395 = OpFOrdGreaterThanEqual %392 %394 
                               Private bool* %396 = OpAccessChain %278 %13 
                                                      OpStore %396 %395 
                                        bool %397 = OpLoad %369 
                               Private bool* %398 = OpAccessChain %278 %13 
                                        bool %399 = OpLoad %398 
                                        bool %400 = OpLogicalAnd %397 %399 
                                                      OpStore %369 %400 
                                         i32 %401 = OpLoad %150 
                                       i32_4 %403 = OpCompositeConstruct %401 %401 %401 %401 
                                      bool_4 %405 = OpIEqual %403 %404 
                                      bool_2 %406 = OpVectorShuffle %405 %405 0 2 
                                      bool_3 %407 = OpLoad %278 
                                      bool_3 %408 = OpVectorShuffle %407 %406 3 1 4 
                                                      OpStore %278 %408 
                               Private bool* %409 = OpAccessChain %278 %223 
                                        bool %410 = OpLoad %409 
                               Private bool* %411 = OpAccessChain %278 %13 
                                        bool %412 = OpLoad %411 
                                        bool %413 = OpLogicalOr %410 %412 
                               Private bool* %414 = OpAccessChain %278 %13 
                                                      OpStore %414 %413 
                                         i32 %415 = OpLoad %150 
                                Uniform f32* %416 = OpAccessChain %76 %101 %415 
                                         f32 %417 = OpLoad %416 
                                        bool %418 = OpFOrdLessThan %47 %417 
                                                      OpStore %359 %418 
                               Private bool* %419 = OpAccessChain %130 %13 
                                        bool %420 = OpLoad %419 
                                        bool %421 = OpLoad %359 
                                        bool %422 = OpLogicalAnd %420 %421 
                                                      OpStore %359 %422 
                                Private f32* %424 = OpAccessChain %196 %223 
                                         f32 %425 = OpLoad %424 
                                        bool %426 = OpFOrdLessThan %47 %425 
                                                      OpStore %423 %426 
                                        bool %428 = OpLoad %423 
                                         i32 %429 = OpSelect %428 %115 %77 
                                                      OpStore %427 %429 
                                Private f32* %431 = OpAccessChain %234 %223 
                                         f32 %432 = OpLoad %431 
                                        bool %433 = OpFOrdLessThan %47 %432 
                                                      OpStore %430 %433 
                                        bool %435 = OpLoad %430 
                                         i32 %436 = OpSelect %435 %115 %77 
                                                      OpStore %434 %436 
                                Private i32* %437 = OpAccessChain %139 %223 
                                         i32 %438 = OpLoad %437 
                                         i32 %439 = OpLoad %434 
                                         i32 %440 = OpIMul %438 %439 
                                                      OpStore %434 %440 
                                         i32 %441 = OpLoad %427 
                                Private i32* %442 = OpAccessChain %139 %13 
                                         i32 %443 = OpLoad %442 
                                         i32 %444 = OpIMul %441 %443 
                                         i32 %445 = OpLoad %434 
                                         i32 %446 = OpIAdd %444 %445 
                                                      OpStore %427 %446 
                               Private bool* %448 = OpAccessChain %278 %112 
                                        bool %449 = OpLoad %448 
                                        bool %450 = OpLoad %423 
                                        bool %451 = OpLogicalAnd %449 %450 
                                                      OpStore %447 %451 
                               Private bool* %453 = OpAccessChain %130 %112 
                                        bool %454 = OpLoad %453 
                                        bool %455 = OpLoad %430 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %452 %456 
                                        bool %458 = OpLoad %447 
                                         i32 %459 = OpSelect %458 %115 %77 
                                                      OpStore %457 %459 
                                        bool %461 = OpLoad %452 
                                         i32 %462 = OpSelect %461 %115 %77 
                                                      OpStore %460 %462 
                                Private i32* %463 = OpAccessChain %139 %223 
                                         i32 %464 = OpLoad %463 
                                         i32 %465 = OpLoad %460 
                                         i32 %466 = OpIMul %464 %465 
                                                      OpStore %460 %466 
                                         i32 %467 = OpLoad %457 
                                Private i32* %468 = OpAccessChain %139 %13 
                                         i32 %469 = OpLoad %468 
                                         i32 %470 = OpIMul %467 %469 
                                         i32 %471 = OpLoad %460 
                                         i32 %472 = OpIAdd %470 %471 
                                                      OpStore %460 %472 
                                        bool %473 = OpLoad %369 
                                         i32 %474 = OpLoad %460 
                                         i32 %475 = OpSelect %473 %77 %474 
                                                      OpStore %460 %475 
                                        bool %476 = OpLoad %359 
                                         i32 %477 = OpLoad %427 
                                         i32 %478 = OpLoad %460 
                                         i32 %479 = OpSelect %476 %477 %478 
                                                      OpStore %460 %479 
                                Private i32* %480 = OpAccessChain %139 %223 
                                         i32 %481 = OpLoad %480 
                                Private i32* %482 = OpAccessChain %139 %13 
                                         i32 %483 = OpLoad %482 
                                         i32 %484 = OpIAdd %481 %483 
                                                      OpStore %457 %484 
                               Private bool* %485 = OpAccessChain %278 %13 
                                        bool %486 = OpLoad %485 
                                         f32 %488 = OpSelect %486 %20 %487 
                                Private f32* %489 = OpAccessChain %167 %13 
                                                      OpStore %489 %488 
                                       f32_4 %491 = OpLoad %196 
                                       f32_2 %492 = OpVectorShuffle %491 %491 3 1 
                                       f32_4 %493 = OpLoad %490 
                                       f32_4 %494 = OpVectorShuffle %493 %492 4 1 5 3 
                                                      OpStore %490 %494 
                                       f32_4 %495 = OpLoad %234 
                                       f32_2 %496 = OpVectorShuffle %495 %495 3 0 
                                       f32_4 %497 = OpLoad %490 
                                       f32_4 %498 = OpVectorShuffle %497 %496 0 4 2 5 
                                                      OpStore %490 %498 
                                Private f32* %499 = OpAccessChain %196 %13 
                                         f32 %500 = OpLoad %499 
                                Private f32* %501 = OpAccessChain %234 %13 
                                                      OpStore %501 %500 
                                       f32_4 %502 = OpLoad %490 
                                       f32_2 %503 = OpVectorShuffle %502 %502 1 0 
                                       f32_2 %504 = OpFNegate %503 
                                       f32_4 %505 = OpLoad %234 
                                       f32_2 %506 = OpVectorShuffle %505 %505 1 0 
                                       f32_2 %507 = OpFAdd %504 %506 
                                       f32_4 %508 = OpLoad %175 
                                       f32_4 %509 = OpVectorShuffle %508 %507 4 1 5 3 
                                                      OpStore %175 %509 
                                       f32_4 %510 = OpLoad %167 
                                       f32_2 %511 = OpVectorShuffle %510 %510 0 0 
                                       f32_4 %512 = OpLoad %175 
                                       f32_2 %513 = OpVectorShuffle %512 %512 0 2 
                                       f32_2 %514 = OpFMul %511 %513 
                                       f32_4 %515 = OpLoad %167 
                                       f32_4 %516 = OpVectorShuffle %515 %514 4 1 5 3 
                                                      OpStore %167 %516 
                                       f32_4 %517 = OpLoad %167 
                                       f32_2 %518 = OpVectorShuffle %517 %517 0 2 
                                       f32_4 %519 = OpLoad %167 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 2 
                                         f32 %521 = OpDot %518 %520 
                                Private f32* %522 = OpAccessChain %175 %13 
                                                      OpStore %522 %521 
                                Private f32* %523 = OpAccessChain %175 %13 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpExtInst %1 32 %524 
                                Private f32* %526 = OpAccessChain %175 %13 
                                                      OpStore %526 %525 
                                       f32_4 %527 = OpLoad %167 
                                       f32_2 %528 = OpVectorShuffle %527 %527 0 2 
                                       f32_4 %529 = OpLoad %175 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 0 
                                       f32_2 %531 = OpFMul %528 %530 
                                       f32_4 %532 = OpLoad %167 
                                       f32_4 %533 = OpVectorShuffle %532 %531 4 1 5 3 
                                                      OpStore %167 %533 
                                       f32_4 %534 = OpLoad %167 
                                       f32_2 %535 = OpVectorShuffle %534 %534 0 2 
                                       f32_2 %538 = OpFMul %535 %537 
                                       f32_4 %539 = OpLoad %234 
                                       f32_2 %540 = OpVectorShuffle %539 %539 1 0 
                                       f32_2 %541 = OpFAdd %538 %540 
                                       f32_4 %542 = OpLoad %167 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 1 5 3 
                                                      OpStore %167 %543 
                                       f32_4 %544 = OpLoad %167 
                                       f32_2 %545 = OpVectorShuffle %544 %544 2 0 
                                       f32_2 %546 = OpFNegate %545 
                                       f32_4 %547 = OpLoad %234 
                                       f32_2 %548 = OpVectorShuffle %547 %547 0 1 
                                       f32_2 %549 = OpFAdd %546 %548 
                                       f32_4 %550 = OpLoad %175 
                                       f32_4 %551 = OpVectorShuffle %550 %549 4 1 5 3 
                                                      OpStore %175 %551 
                                       f32_4 %552 = OpLoad %167 
                                       f32_2 %553 = OpVectorShuffle %552 %552 0 2 
                                       f32_2 %554 = OpFNegate %553 
                                       f32_4 %555 = OpLoad vs_TEXCOORD2 
                                       f32_2 %556 = OpVectorShuffle %555 %555 1 0 
                                       f32_2 %557 = OpFAdd %554 %556 
                                       f32_4 %558 = OpLoad %167 
                                       f32_4 %559 = OpVectorShuffle %558 %557 4 1 5 3 
                                                      OpStore %167 %559 
                                Private f32* %561 = OpAccessChain %167 %223 
                                         f32 %562 = OpLoad %561 
                                Private f32* %563 = OpAccessChain %175 %223 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpFMul %562 %564 
                                                      OpStore %560 %565 
                                Private f32* %566 = OpAccessChain %175 %13 
                                         f32 %567 = OpLoad %566 
                                Private f32* %568 = OpAccessChain %167 %13 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFMul %567 %569 
                                         f32 %571 = OpLoad %560 
                                         f32 %572 = OpFNegate %571 
                                         f32 %573 = OpFAdd %570 %572 
                                Private f32* %574 = OpAccessChain %167 %13 
                                                      OpStore %574 %573 
                                Private f32* %575 = OpAccessChain %167 %13 
                                         f32 %576 = OpLoad %575 
                                        bool %577 = OpFOrdGreaterThanEqual %576 %47 
                               Private bool* %578 = OpAccessChain %278 %13 
                                                      OpStore %578 %577 
                               Private bool* %579 = OpAccessChain %278 %13 
                                        bool %580 = OpLoad %579 
                                                      OpSelectionMerge %583 None 
                                                      OpBranchConditional %580 %582 %586 
                                             %582 = OpLabel 
                                Private i32* %584 = OpAccessChain %139 %13 
                                         i32 %585 = OpLoad %584 
                                                      OpStore %581 %585 
                                                      OpBranch %583 
                                             %586 = OpLabel 
                                Private i32* %587 = OpAccessChain %139 %223 
                                         i32 %588 = OpLoad %587 
                                                      OpStore %581 %588 
                                                      OpBranch %583 
                                             %583 = OpLabel 
                                         i32 %589 = OpLoad %581 
                                Private i32* %590 = OpAccessChain %139 %13 
                                                      OpStore %590 %589 
                                         i32 %592 = OpLoad %460 
                                         i32 %593 = OpLoad %457 
                                        bool %594 = OpINotEqual %592 %593 
                                                      OpStore %591 %594 
                                        bool %595 = OpLoad %591 
                                                      OpSelectionMerge %598 None 
                                                      OpBranchConditional %595 %597 %600 
                                             %597 = OpLabel 
                                         i32 %599 = OpLoad %460 
                                                      OpStore %596 %599 
                                                      OpBranch %598 
                                             %600 = OpLabel 
                                Private i32* %601 = OpAccessChain %139 %13 
                                         i32 %602 = OpLoad %601 
                                                      OpStore %596 %602 
                                                      OpBranch %598 
                                             %598 = OpLabel 
                                         i32 %603 = OpLoad %596 
                                                      OpStore %460 %603 
                                         i32 %604 = OpLoad %460 
                                        bool %605 = OpIEqual %604 %77 
                                                      OpSelectionMerge %607 None 
                                                      OpBranchConditional %605 %606 %620 
                                             %606 = OpLabel 
                                       f32_3 %609 = OpLoad %44 
                                       f32_4 %611 = OpLoad %610 
                                       f32_3 %612 = OpVectorShuffle %611 %611 0 1 2 
                                       f32_3 %613 = OpFMul %609 %612 
                                                      OpStore %608 %613 
                                Private f32* %615 = OpAccessChain %26 %188 
                                         f32 %616 = OpLoad %615 
                                  Input f32* %617 = OpAccessChain %610 %188 
                                         f32 %618 = OpLoad %617 
                                         f32 %619 = OpFMul %616 %618 
                                                      OpStore %614 %619 
                                                      OpBranch %607 
                                             %620 = OpLabel 
                                         i32 %621 = OpLoad %460 
                                       i32_4 %622 = OpCompositeConstruct %621 %621 %621 %621 
                                      bool_4 %624 = OpIEqual %622 %623 
                                      bool_3 %625 = OpVectorShuffle %624 %624 0 1 2 
                                                      OpStore %278 %625 
                               Private bool* %626 = OpAccessChain %278 %223 
                                        bool %627 = OpLoad %626 
                                         i32 %628 = OpSelect %627 %120 %77 
                                                      OpStore %460 %628 
                               Private bool* %629 = OpAccessChain %278 %112 
                                        bool %630 = OpLoad %629 
                                         i32 %631 = OpLoad %460 
                                         i32 %632 = OpSelect %630 %101 %631 
                                                      OpStore %460 %632 
                               Private bool* %633 = OpAccessChain %278 %13 
                                        bool %634 = OpLoad %633 
                                         i32 %635 = OpLoad %460 
                                         i32 %636 = OpSelect %634 %115 %635 
                                                      OpStore %460 %636 
                                       f32_3 %638 = OpLoad %44 
                                         i32 %640 = OpLoad %460 
                              Uniform f32_4* %642 = OpAccessChain %76 %639 %640 
                                       f32_4 %643 = OpLoad %642 
                                       f32_3 %644 = OpVectorShuffle %643 %643 0 1 2 
                                       f32_3 %645 = OpFMul %638 %644 
                                                      OpStore %637 %645 
                                Private f32* %647 = OpAccessChain %26 %188 
                                         f32 %648 = OpLoad %647 
                                         i32 %649 = OpLoad %460 
                                Uniform f32* %650 = OpAccessChain %76 %639 %649 %188 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %648 %651 
                                                      OpStore %646 %652 
                                       f32_3 %653 = OpLoad %637 
                                                      OpStore %608 %653 
                                         f32 %654 = OpLoad %646 
                                                      OpStore %614 %654 
                                                      OpBranch %607 
                                             %607 = OpLabel 
                                        bool %655 = OpLoad %423 
                                        bool %656 = OpLoad %430 
                                        bool %657 = OpLogicalOr %655 %656 
                                                      OpStore %452 %657 
                                       f32_4 %658 = OpLoad %490 
                                       f32_2 %659 = OpVectorShuffle %658 %658 2 3 
                                       f32_2 %660 = OpFNegate %659 
                                       f32_4 %661 = OpLoad vs_TEXCOORD2 
                                       f32_2 %662 = OpVectorShuffle %661 %661 0 1 
                                       f32_2 %663 = OpFAdd %660 %662 
                                       f32_4 %664 = OpLoad %167 
                                       f32_4 %665 = OpVectorShuffle %664 %663 4 5 2 3 
                                                      OpStore %167 %665 
                                       f32_4 %667 = OpLoad %167 
                                       f32_2 %668 = OpVectorShuffle %667 %667 0 1 
                                       f32_4 %669 = OpLoad %167 
                                       f32_2 %670 = OpVectorShuffle %669 %669 0 1 
                                         f32 %671 = OpDot %668 %670 
                                                      OpStore %666 %671 
                                         f32 %672 = OpLoad %666 
                                         f32 %673 = OpExtInst %1 31 %672 
                                                      OpStore %666 %673 
                                         f32 %674 = OpLoad %666 
                                         i32 %675 = OpLoad %150 
                                Uniform f32* %676 = OpAccessChain %76 %101 %675 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFNegate %677 
                                         f32 %679 = OpFAdd %674 %678 
                                                      OpStore %666 %679 
                                         f32 %680 = OpLoad %666 
                                Private f32* %681 = OpAccessChain %9 %13 
                                         f32 %682 = OpLoad %681 
                                         f32 %683 = OpFMul %680 %682 
                                         f32 %684 = OpFAdd %683 %105 
                                                      OpStore %666 %684 
                                         f32 %685 = OpLoad %666 
                                         f32 %686 = OpExtInst %1 43 %685 %47 %20 
                                                      OpStore %666 %686 
                                        bool %687 = OpLoad %452 
                                         f32 %688 = OpLoad %666 
                                         f32 %689 = OpSelect %687 %688 %47 
                                                      OpStore %666 %689 
                                Private f32* %691 = OpAccessChain %196 %223 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpFNegate %692 
                                         i32 %694 = OpLoad %150 
                                Uniform f32* %695 = OpAccessChain %76 %101 %694 
                                         f32 %696 = OpLoad %695 
                                         f32 %697 = OpFAdd %693 %696 
                                                      OpStore %690 %697 
                                Private f32* %699 = OpAccessChain %234 %223 
                                         f32 %700 = OpLoad %699 
                                         f32 %701 = OpFNegate %700 
                                         i32 %702 = OpLoad %150 
                                Uniform f32* %703 = OpAccessChain %76 %101 %702 
                                         f32 %704 = OpLoad %703 
                                         f32 %705 = OpFAdd %701 %704 
                                                      OpStore %698 %705 
                                         f32 %707 = OpLoad %690 
                                         f32 %708 = OpLoad %698 
                                         f32 %709 = OpFDiv %707 %708 
                                                      OpStore %706 %709 
                                         f32 %710 = OpLoad %706 
                                Private f32* %711 = OpAccessChain %167 %112 
                                         f32 %712 = OpLoad %711 
                                         f32 %713 = OpFMul %710 %712 
                                Private f32* %714 = OpAccessChain %167 %223 
                                                      OpStore %714 %713 
                                       f32_4 %715 = OpLoad %167 
                                       f32_2 %716 = OpVectorShuffle %715 %715 0 2 
                                       f32_4 %717 = OpLoad %167 
                                       f32_2 %718 = OpVectorShuffle %717 %717 0 2 
                                         f32 %719 = OpDot %716 %718 
                                                      OpStore %706 %719 
                                         f32 %720 = OpLoad %706 
                                         f32 %721 = OpExtInst %1 31 %720 
                                                      OpStore %706 %721 
                                         f32 %722 = OpLoad %690 
                                         f32 %723 = OpFNegate %722 
                                         f32 %724 = OpLoad %706 
                                         f32 %725 = OpFAdd %723 %724 
                                                      OpStore %706 %725 
                                         f32 %726 = OpLoad %706 
                                Private f32* %727 = OpAccessChain %9 %13 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFMul %726 %728 
                                         f32 %730 = OpFAdd %729 %105 
                                Private f32* %731 = OpAccessChain %9 %13 
                                                      OpStore %731 %730 
                                Private f32* %732 = OpAccessChain %9 %13 
                                         f32 %733 = OpLoad %732 
                                         f32 %734 = OpExtInst %1 43 %733 %47 %20 
                                Private f32* %735 = OpAccessChain %9 %13 
                                                      OpStore %735 %734 
                                         f32 %736 = OpLoad %690 
                                        bool %737 = OpFOrdLessThan %47 %736 
                                                      OpStore %591 %737 
                                         f32 %739 = OpLoad %698 
                                        bool %740 = OpFOrdLessThan %47 %739 
                                                      OpStore %738 %740 
                                        bool %741 = OpLoad %738 
                                        bool %742 = OpLoad %591 
                                        bool %743 = OpLogicalAnd %741 %742 
                                                      OpStore %738 %743 
                                        bool %744 = OpLoad %738 
                                                      OpSelectionMerge %748 None 
                                                      OpBranchConditional %744 %747 %751 
                                             %747 = OpLabel 
                                Private f32* %749 = OpAccessChain %9 %13 
                                         f32 %750 = OpLoad %749 
                                                      OpStore %746 %750 
                                                      OpBranch %748 
                                             %751 = OpLabel 
                                                      OpStore %746 %20 
                                                      OpBranch %748 
                                             %748 = OpLabel 
                                         f32 %752 = OpLoad %746 
                                Private f32* %753 = OpAccessChain %9 %13 
                                                      OpStore %753 %752 
                                        bool %754 = OpLoad %452 
                                                      OpSelectionMerge %757 None 
                                                      OpBranchConditional %754 %756 %760 
                                             %756 = OpLabel 
                                Private f32* %758 = OpAccessChain %9 %13 
                                         f32 %759 = OpLoad %758 
                                                      OpStore %755 %759 
                                                      OpBranch %757 
                                             %760 = OpLabel 
                                                      OpStore %755 %47 
                                                      OpBranch %757 
                                             %757 = OpLabel 
                                         f32 %761 = OpLoad %755 
                                Private f32* %762 = OpAccessChain %9 %13 
                                                      OpStore %762 %761 
                                         f32 %763 = OpLoad %666 
                                        bool %764 = OpFOrdEqual %763 %47 
                                                      OpStore %452 %764 
                                         f32 %765 = OpLoad %666 
                                         f32 %766 = OpFNegate %765 
                                         f32 %767 = OpFAdd %766 %20 
                                                      OpStore %698 %767 
                                        bool %768 = OpLoad %452 
                                                      OpSelectionMerge %771 None 
                                                      OpBranchConditional %768 %770 %774 
                                             %770 = OpLabel 
                                Private f32* %772 = OpAccessChain %9 %13 
                                         f32 %773 = OpLoad %772 
                                                      OpStore %769 %773 
                                                      OpBranch %771 
                                             %774 = OpLabel 
                                         f32 %775 = OpLoad %698 
                                                      OpStore %769 %775 
                                                      OpBranch %771 
                                             %771 = OpLabel 
                                         f32 %776 = OpLoad %769 
                                Private f32* %777 = OpAccessChain %9 %13 
                                                      OpStore %777 %776 
                               Private bool* %778 = OpAccessChain %130 %13 
                                        bool %779 = OpLoad %778 
                                                      OpSelectionMerge %782 None 
                                                      OpBranchConditional %779 %781 %785 
                                             %781 = OpLabel 
                                Private f32* %783 = OpAccessChain %9 %13 
                                         f32 %784 = OpLoad %783 
                                                      OpStore %780 %784 
                                                      OpBranch %782 
                                             %785 = OpLabel 
                                                      OpStore %780 %20 
                                                      OpBranch %782 
                                             %782 = OpLabel 
                                         f32 %786 = OpLoad %780 
                                Private f32* %787 = OpAccessChain %9 %13 
                                                      OpStore %787 %786 
                                Private f32* %788 = OpAccessChain %9 %13 
                                         f32 %789 = OpLoad %788 
                                         f32 %790 = OpLoad %614 
                                         f32 %791 = OpFMul %789 %790 
                                                      OpStore %111 %791 
                                        bool %792 = OpLoad %369 
                                         f32 %793 = OpSelect %792 %47 %20 
                                                      OpStore %698 %793 
                               Private bool* %794 = OpAccessChain %130 %13 
                                        bool %795 = OpLoad %794 
                                         f32 %796 = OpLoad %698 
                                         f32 %797 = OpSelect %795 %20 %796 
                                Private f32* %798 = OpAccessChain %50 %13 
                                                      OpStore %798 %797 
                                Private f32* %799 = OpAccessChain %50 %13 
                                         f32 %800 = OpLoad %799 
                                         f32 %801 = OpLoad %111 
                                         f32 %802 = OpFMul %800 %801 
                                Private f32* %803 = OpAccessChain %9 %223 
                                                      OpStore %803 %802 
                         read_only Texture2D %805 = OpLoad %804 
                                     sampler %807 = OpLoad %806 
                  read_only Texture2DSampled %808 = OpSampledImage %805 %807 
                                       f32_2 %810 = OpLoad vs_TEXCOORD1 
                                       f32_4 %811 = OpImageSampleImplicitLod %808 %810 
                                         f32 %812 = OpCompositeExtract %811 3 
                                Private f32* %813 = OpAccessChain %50 %223 
                                                      OpStore %813 %812 
                                Uniform i32* %815 = OpAccessChain %76 %115 
                                         i32 %816 = OpLoad %815 
                                        bool %817 = OpINotEqual %816 %639 
                                                      OpStore %814 %817 
                                       f32_3 %818 = OpLoad %50 
                                       f32_2 %819 = OpVectorShuffle %818 %818 0 2 
                                       f32_4 %820 = OpLoad %9 
                                       f32_2 %821 = OpVectorShuffle %820 %820 0 2 
                                       f32_2 %822 = OpFMul %819 %821 
                                       f32_4 %823 = OpLoad %9 
                                       f32_4 %824 = OpVectorShuffle %823 %822 4 1 5 3 
                                                      OpStore %9 %824 
                                Private f32* %825 = OpAccessChain %50 %223 
                                         f32 %826 = OpLoad %825 
                                Private f32* %827 = OpAccessChain %9 %13 
                                         f32 %828 = OpLoad %827 
                                         f32 %829 = OpFMul %826 %828 
                                Private f32* %830 = OpAccessChain %9 %13 
                                                      OpStore %830 %829 
                                       f32_4 %831 = OpLoad %9 
                                       f32_3 %832 = OpVectorShuffle %831 %831 0 0 0 
                                       f32_3 %833 = OpLoad %608 
                                       f32_3 %834 = OpFMul %832 %833 
                                       f32_4 %835 = OpLoad %9 
                                       f32_4 %836 = OpVectorShuffle %835 %834 4 5 2 6 
                                                      OpStore %9 %836 
                                        bool %839 = OpLoad %814 
                                                      OpSelectionMerge %842 None 
                                                      OpBranchConditional %839 %841 %845 
                                             %841 = OpLabel 
                                       f32_4 %843 = OpLoad %9 
                                       f32_3 %844 = OpVectorShuffle %843 %843 0 1 3 
                                                      OpStore %840 %844 
                                                      OpBranch %842 
                                             %845 = OpLabel 
                                       f32_3 %846 = OpLoad %608 
                                                      OpStore %840 %846 
                                                      OpBranch %842 
                                             %842 = OpLabel 
                                       f32_3 %847 = OpLoad %840 
                                       f32_4 %848 = OpLoad %838 
                                       f32_4 %849 = OpVectorShuffle %848 %847 4 5 6 3 
                                                      OpStore %838 %849 
                                Private f32* %850 = OpAccessChain %9 %223 
                                         f32 %851 = OpLoad %850 
                                 Output f32* %853 = OpAccessChain %838 %188 
                                                      OpStore %853 %851 
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
  GpuProgramID 98697
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
uniform 	vec4 _BorderColors[4];
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _GUIClipTexture;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
float u_xlat1;
mediump vec4 u_xlat16_1;
ivec3 u_xlati1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
bvec3 u_xlatb3;
vec4 u_xlat4;
int u_xlati4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat7;
bvec2 u_xlatb7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
bvec2 u_xlatb9;
float u_xlat10;
bool u_xlatb10;
int u_xlati12;
bool u_xlatb12;
bool u_xlatb13;
float u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat21;
bool u_xlatb21;
int u_xlati22;
float u_xlat27;
int u_xlati27;
bool u_xlatb27;
float u_xlat28;
float u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb30;
void main()
{
    u_xlat0.x = dFdx(vs_TEXCOORD2.x);
    u_xlat0.x = float(1.0) / abs(u_xlat0.x);
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = max(u_xlat16_1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat9.xyz = log2(u_xlat16_2.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat9.xyz = exp2(u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat9.xyz = max(u_xlat9.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = (_ManualTex2SRGB != 0) ? u_xlat9.xyz : u_xlat16_1.xyz;
    u_xlat9.x = vs_TEXCOORD2.x + (-_Rect[0]);
    u_xlat9.x = (-_Rect[2]) * 0.5 + u_xlat9.x;
    u_xlat18 = vs_TEXCOORD2.y + (-_Rect[1]);
    u_xlat9.y = (-_Rect[3]) * 0.5 + u_xlat18;
    u_xlatb9.xy = greaterThanEqual(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyxx).xy;
    u_xlati1.xyz = (u_xlatb9.y) ? ivec3(0, 1, 2) : ivec3(3, 2, 8);
    u_xlati27 = (u_xlatb9.x) ? u_xlati1.x : u_xlati1.y;
    u_xlati1.x = (u_xlatb9.x) ? 1 : 4;
    u_xlat3.y = _Rect[0] + _CornerRadiuses[u_xlati27];
    u_xlat4.y = _Rect[1] + _CornerRadiuses[u_xlati27];
    u_xlat3.w = _BorderWidths[0] + _Rect[0];
    u_xlat4.w = _BorderWidths[1] + _Rect[1];
    u_xlat5.x = _Rect[0] + _Rect[2];
    u_xlat5.y = u_xlat5.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat5.w = u_xlat5.x + (-_BorderWidths[2]);
    u_xlat3.x = _Rect[0];
    u_xlat3.z = _BorderWidths[0];
    u_xlat5.z = _BorderWidths[2];
    u_xlat5 = (u_xlatb9.x) ? u_xlat3 : u_xlat5;
    u_xlat6.x = _Rect[1] + _Rect[3];
    u_xlat6.y = u_xlat6.x + (-_CornerRadiuses[u_xlati27]);
    u_xlat6.w = u_xlat6.x + (-_BorderWidths[3]);
    u_xlat4.x = _Rect[1];
    u_xlat4.z = _BorderWidths[1];
    u_xlat6.z = _BorderWidths[3];
    u_xlat6 = (u_xlatb9.y) ? u_xlat4.yxzw : u_xlat6.yxzw;
    u_xlatb3.xy = greaterThanEqual(u_xlat5.ywyy, vs_TEXCOORD2.xxxx).xy;
    u_xlatb4.xy = greaterThanEqual(vs_TEXCOORD2.xxxx, u_xlat5.ywyy).xy;
    u_xlatb3.xy = (u_xlatb9.x) ? u_xlatb3.xy : u_xlatb4.xy;
    u_xlatb4.xy = greaterThanEqual(u_xlat6.xwxx, vs_TEXCOORD2.yyyy).xy;
    u_xlatb7.xy = greaterThanEqual(vs_TEXCOORD2.yyyy, u_xlat6.xwxx).xy;
    u_xlatb9.xy = (u_xlatb9.y) ? u_xlatb4.xy : u_xlatb7.xy;
    u_xlatb9.x = u_xlatb9.x && u_xlatb3.x;
    u_xlat10 = _BorderWidths[0] + _BorderWidths[2];
    u_xlat10 = (-u_xlat10) + _Rect[2];
    u_xlat3.x = _BorderWidths[1] + _BorderWidths[3];
    u_xlat3.x = (-u_xlat3.x) + _Rect[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.x>=u_xlat3.w);
#else
    u_xlatb21 = vs_TEXCOORD2.x>=u_xlat3.w;
#endif
    u_xlat10 = u_xlat10 + u_xlat3.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat10>=vs_TEXCOORD2.x);
#else
    u_xlatb10 = u_xlat10>=vs_TEXCOORD2.x;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(vs_TEXCOORD2.y>=u_xlat4.w);
#else
    u_xlatb21 = vs_TEXCOORD2.y>=u_xlat4.w;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb21;
    u_xlat3.x = u_xlat3.x + u_xlat4.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=vs_TEXCOORD2.y);
#else
    u_xlatb3.x = u_xlat3.x>=vs_TEXCOORD2.y;
#endif
    u_xlatb10 = u_xlatb10 && u_xlatb3.x;
    u_xlatb3.xz = equal(ivec4(u_xlati27), ivec4(0, 0, 2, 0)).xz;
    u_xlatb3.x = u_xlatb3.z || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0.0<_CornerRadiuses[u_xlati27]);
#else
    u_xlatb21 = 0.0<_CornerRadiuses[u_xlati27];
#endif
    u_xlatb21 = u_xlatb9.x && u_xlatb21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(0.0<u_xlat5.z);
#else
    u_xlatb30 = 0.0<u_xlat5.z;
#endif
    u_xlati4 = u_xlatb30 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(0.0<u_xlat6.z);
#else
    u_xlatb13 = 0.0<u_xlat6.z;
#endif
    u_xlati22 = u_xlatb13 ? 1 : int(0);
    u_xlati22 = u_xlati1.z * u_xlati22;
    u_xlati4 = u_xlati4 * u_xlati1.x + u_xlati22;
    u_xlatb12 = u_xlatb3.y && u_xlatb30;
    u_xlatb18 = u_xlatb9.y && u_xlatb13;
    u_xlati12 = u_xlatb12 ? 1 : int(0);
    u_xlati18 = u_xlatb18 ? 1 : int(0);
    u_xlati18 = u_xlati1.z * u_xlati18;
    u_xlati18 = u_xlati12 * u_xlati1.x + u_xlati18;
    u_xlati18 = (u_xlatb10) ? 0 : u_xlati18;
    u_xlati18 = (u_xlatb21) ? u_xlati4 : u_xlati18;
    u_xlati12 = u_xlati1.z + u_xlati1.x;
    u_xlat3.x = (u_xlatb3.x) ? 1.0 : -1.0;
    u_xlat7.xz = u_xlat5.wy;
    u_xlat7.yw = u_xlat6.wx;
    u_xlat6.x = u_xlat5.x;
    u_xlat4.xz = (-u_xlat7.yx) + u_xlat6.yx;
    u_xlat3.xz = u_xlat3.xx * u_xlat4.xz;
    u_xlat4.x = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat3.xz = u_xlat3.xz * u_xlat4.xx;
    u_xlat3.xz = u_xlat3.xz * vec2(100.0, 100.0) + u_xlat6.yx;
    u_xlat4.xz = (-u_xlat3.zx) + u_xlat6.xy;
    u_xlat3.xz = (-u_xlat3.xz) + vs_TEXCOORD2.yx;
    u_xlat21 = u_xlat3.z * u_xlat4.z;
    u_xlat3.x = u_xlat4.x * u_xlat3.x + (-u_xlat21);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3.x = !!(u_xlat3.x>=0.0);
#else
    u_xlatb3.x = u_xlat3.x>=0.0;
#endif
    u_xlati1.x = (u_xlatb3.x) ? u_xlati1.x : u_xlati1.z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(u_xlati18!=u_xlati12);
#else
    u_xlatb19 = u_xlati18!=u_xlati12;
#endif
    u_xlati18 = (u_xlatb19) ? u_xlati18 : u_xlati1.x;
    if(u_xlati18 == 0) {
        u_xlat16_8.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
        u_xlat16_29 = u_xlat16_1.w * vs_COLOR0.w;
    } else {
        u_xlatb3.xyz = equal(ivec4(u_xlati18), ivec4(2, 4, 8, 0)).xyz;
        u_xlati18 = u_xlatb3.z ? 3 : int(0);
        u_xlati18 = (u_xlatb3.y) ? 2 : u_xlati18;
        u_xlati18 = (u_xlatb3.x) ? 1 : u_xlati18;
        u_xlat8.xyz = u_xlat16_2.xyz * _BorderColors[u_xlati18].xyz;
        u_xlat29 = u_xlat16_1.w * _BorderColors[u_xlati18].w;
        u_xlat16_8.xyz = u_xlat8.xyz;
        u_xlat16_29 = u_xlat29;
    }
    u_xlatb18 = u_xlatb30 || u_xlatb13;
    u_xlat3.xy = (-u_xlat7.zw) + vs_TEXCOORD2.xy;
    u_xlat1 = dot(u_xlat3.xy, u_xlat3.xy);
    u_xlat1 = sqrt(u_xlat1);
    u_xlat1 = u_xlat1 + (-_CornerRadiuses[u_xlati27]);
    u_xlat1 = u_xlat1 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat1 = min(max(u_xlat1, 0.0), 1.0);
#else
    u_xlat1 = clamp(u_xlat1, 0.0, 1.0);
#endif
    u_xlat1 = u_xlatb18 ? u_xlat1 : float(0.0);
    u_xlat19 = (-u_xlat5.z) + _CornerRadiuses[u_xlati27];
    u_xlat27 = (-u_xlat6.z) + _CornerRadiuses[u_xlati27];
    u_xlat28 = u_xlat19 / u_xlat27;
    u_xlat3.z = u_xlat28 * u_xlat3.y;
    u_xlat28 = dot(u_xlat3.xz, u_xlat3.xz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = (-u_xlat19) + u_xlat28;
    u_xlat0.x = u_xlat28 * u_xlat0.x + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(0.0<u_xlat19);
#else
    u_xlatb19 = 0.0<u_xlat19;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(0.0<u_xlat27);
#else
    u_xlatb27 = 0.0<u_xlat27;
#endif
    u_xlatb27 = u_xlatb27 && u_xlatb19;
    u_xlat0.x = (u_xlatb27) ? u_xlat0.x : 1.0;
    u_xlat0.x = u_xlatb18 ? u_xlat0.x : float(0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat1==0.0);
#else
    u_xlatb18 = u_xlat1==0.0;
#endif
    u_xlat27 = (-u_xlat1) + 1.0;
    u_xlat0.x = (u_xlatb18) ? u_xlat0.x : u_xlat27;
    u_xlat0.x = (u_xlatb9.x) ? u_xlat0.x : 1.0;
    u_xlat18 = u_xlat0.x * u_xlat16_29;
    u_xlat27 = (u_xlatb10) ? 0.0 : 1.0;
    u_xlat9.x = (u_xlatb9.x) ? 1.0 : u_xlat27;
    u_xlat0.z = u_xlat9.x * u_xlat18;
    u_xlat9.z = texture(_GUIClipTexture, vs_TEXCOORD1.xy).w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_SrcBlend!=5);
#else
    u_xlatb1 = _SrcBlend!=5;
#endif
    u_xlat0.xz = u_xlat9.xz * u_xlat0.xz;
    u_xlat0.x = u_xlat9.z * u_xlat0.x;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_8.xyz;
    SV_Target0.xyz = (bool(u_xlatb1)) ? u_xlat0.xyw : u_xlat16_8.xyz;
    SV_Target0.w = u_xlat0.z;
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
; Bound: 855
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %39 %610 %809 %838 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD2 Location 11 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 39 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpDecorate %73 ArrayStride 73 
                                                      OpMemberDecorate %74 0 Offset 74 
                                                      OpMemberDecorate %74 1 Offset 74 
                                                      OpMemberDecorate %74 2 Offset 74 
                                                      OpMemberDecorate %74 3 Offset 74 
                                                      OpMemberDecorate %74 4 Offset 74 
                                                      OpMemberDecorate %74 5 Offset 74 
                                                      OpDecorate %74 Block 
                                                      OpDecorate %76 DescriptorSet 76 
                                                      OpDecorate %76 Binding 76 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %610 RelaxedPrecision 
                                                      OpDecorate %610 Location 610 
                                                      OpDecorate %611 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %614 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %618 RelaxedPrecision 
                                                      OpDecorate %619 RelaxedPrecision 
                                                      OpDecorate %638 RelaxedPrecision 
                                                      OpDecorate %648 RelaxedPrecision 
                                                      OpDecorate %790 RelaxedPrecision 
                                                      OpDecorate %804 RelaxedPrecision 
                                                      OpDecorate %804 DescriptorSet 804 
                                                      OpDecorate %804 Binding 804 
                                                      OpDecorate %805 RelaxedPrecision 
                                                      OpDecorate %806 RelaxedPrecision 
                                                      OpDecorate %806 DescriptorSet 806 
                                                      OpDecorate %806 Binding 806 
                                                      OpDecorate %807 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 809 
                                                      OpDecorate %833 RelaxedPrecision 
                                                      OpDecorate %838 RelaxedPrecision 
                                                      OpDecorate %838 Location 838 
                                                      OpDecorate %846 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 0 
                                              %14 = OpTypePointer Input %6 
                                              %18 = OpTypePointer Private %6 
                                          f32 %20 = OpConstant 3.674022E-40 
                               Private f32_4* %26 = OpVariable Private 
                                              %27 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %28 = OpTypePointer UniformConstant %27 
         UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
                                              %31 = OpTypeSampler 
                                              %32 = OpTypePointer UniformConstant %31 
                     UniformConstant sampler* %33 = OpVariable UniformConstant 
                                              %35 = OpTypeSampledImage %27 
                                              %37 = OpTypeVector %6 2 
                                              %38 = OpTypePointer Input %37 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Private %42 
                               Private f32_3* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.674022E-40 
                                        f32_3 %48 = OpConstantComposite %47 %47 %47 
                               Private f32_3* %50 = OpVariable Private 
                                          f32 %54 = OpConstant 3.674022E-40 
                                        f32_3 %55 = OpConstantComposite %54 %54 %54 
                                          f32 %60 = OpConstant 3.674022E-40 
                                        f32_3 %61 = OpConstantComposite %60 %60 %60 
                                          f32 %63 = OpConstant 3.674022E-40 
                                        f32_3 %64 = OpConstantComposite %63 %63 %63 
                                              %68 = OpTypeInt 32 1 
                                          u32 %69 = OpConstant 4 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeArray %6 %69 
                                              %72 = OpTypeArray %6 %69 
                                              %73 = OpTypeArray %7 %69 
                                              %74 = OpTypeStruct %68 %68 %70 %71 %72 %73 
                                              %75 = OpTypePointer Uniform %74 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; f32_4[4];}* %76 = OpVariable Uniform 
                                          i32 %77 = OpConstant 0 
                                              %78 = OpTypePointer Uniform %68 
                                              %81 = OpTypeBool 
                                              %83 = OpTypePointer Function %42 
                                          i32 %94 = OpConstant 4 
                                              %95 = OpTypePointer Uniform %6 
                                         i32 %101 = OpConstant 2 
                                         f32 %105 = OpConstant 3.674022E-40 
                                Private f32* %111 = OpVariable Private 
                                         u32 %112 = OpConstant 1 
                                         i32 %115 = OpConstant 1 
                                         i32 %120 = OpConstant 3 
                                             %128 = OpTypeVector %81 2 
                                             %129 = OpTypePointer Private %128 
                             Private bool_2* %130 = OpVariable Private 
                                       f32_4 %131 = OpConstantComposite %47 %47 %47 %47 
                                             %134 = OpTypeVector %81 4 
                                             %137 = OpTypeVector %68 3 
                                             %138 = OpTypePointer Private %137 
                              Private i32_3* %139 = OpVariable Private 
                                             %140 = OpTypePointer Private %81 
                                       i32_3 %143 = OpConstantComposite %77 %115 %101 
                                         i32 %144 = OpConstant 8 
                                       i32_3 %145 = OpConstantComposite %120 %101 %144 
                                             %146 = OpTypeVector %81 3 
                                             %149 = OpTypePointer Private %68 
                                Private i32* %150 = OpVariable Private 
                                             %153 = OpTypePointer Function %68 
                              Private f32_4* %167 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %188 = OpConstant 3 
                              Private f32_4* %196 = OpVariable Private 
                                         u32 %223 = OpConstant 2 
                              Private f32_4* %234 = OpVariable Private 
                                             %267 = OpTypePointer Function %7 
                                             %277 = OpTypePointer Private %146 
                             Private bool_3* %278 = OpVariable Private 
                             Private bool_2* %287 = OpVariable Private 
                                             %296 = OpTypePointer Function %128 
                             Private bool_2* %313 = OpVariable Private 
                                Private f32* %335 = OpVariable Private 
                               Private bool* %359 = OpVariable Private 
                               Private bool* %369 = OpVariable Private 
                                             %402 = OpTypeVector %68 4 
                                       i32_4 %404 = OpConstantComposite %77 %77 %101 %77 
                               Private bool* %423 = OpVariable Private 
                                Private i32* %427 = OpVariable Private 
                               Private bool* %430 = OpVariable Private 
                                Private i32* %434 = OpVariable Private 
                               Private bool* %447 = OpVariable Private 
                               Private bool* %452 = OpVariable Private 
                                Private i32* %457 = OpVariable Private 
                                Private i32* %460 = OpVariable Private 
                                         f32 %487 = OpConstant 3.674022E-40 
                              Private f32_4* %490 = OpVariable Private 
                                         f32 %536 = OpConstant 3.674022E-40 
                                       f32_2 %537 = OpConstantComposite %536 %536 
                                Private f32* %560 = OpVariable Private 
                               Private bool* %591 = OpVariable Private 
                              Private f32_3* %608 = OpVariable Private 
                                Input f32_4* %610 = OpVariable Input 
                                Private f32* %614 = OpVariable Private 
                                       i32_4 %623 = OpConstantComposite %101 %94 %144 %77 
                              Private f32_3* %637 = OpVariable Private 
                                         i32 %639 = OpConstant 5 
                                             %641 = OpTypePointer Uniform %7 
                                Private f32* %646 = OpVariable Private 
                                Private f32* %666 = OpVariable Private 
                                Private f32* %690 = OpVariable Private 
                                Private f32* %698 = OpVariable Private 
                                Private f32* %706 = OpVariable Private 
                               Private bool* %738 = OpVariable Private 
                                             %745 = OpTypePointer Function %6 
        UniformConstant read_only Texture2D* %804 = OpVariable UniformConstant 
                    UniformConstant sampler* %806 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                               Private bool* %814 = OpVariable Private 
                                             %837 = OpTypePointer Output %7 
                               Output f32_4* %838 = OpVariable Output 
                                             %852 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %84 = OpVariable Function 
                               Function i32* %154 = OpVariable Function 
                             Function f32_4* %268 = OpVariable Function 
                            Function bool_2* %297 = OpVariable Function 
                            Function bool_2* %322 = OpVariable Function 
                               Function i32* %581 = OpVariable Function 
                               Function i32* %596 = OpVariable Function 
                               Function f32* %746 = OpVariable Function 
                               Function f32* %755 = OpVariable Function 
                               Function f32* %769 = OpVariable Function 
                               Function f32* %780 = OpVariable Function 
                             Function f32_3* %840 = OpVariable Function 
                                   Input f32* %15 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %16 = OpLoad %15 
                                          f32 %17 = OpDPdx %16 
                                 Private f32* %19 = OpAccessChain %9 %13 
                                                      OpStore %19 %17 
                                 Private f32* %21 = OpAccessChain %9 %13 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpExtInst %1 4 %22 
                                          f32 %24 = OpFDiv %20 %23 
                                 Private f32* %25 = OpAccessChain %9 %13 
                                                      OpStore %25 %24 
                          read_only Texture2D %30 = OpLoad %29 
                                      sampler %34 = OpLoad %33 
                   read_only Texture2DSampled %36 = OpSampledImage %30 %34 
                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
                                        f32_4 %41 = OpImageSampleImplicitLod %36 %40 
                                                      OpStore %26 %41 
                                        f32_4 %45 = OpLoad %26 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %49 = OpExtInst %1 40 %46 %48 
                                                      OpStore %44 %49 
                                        f32_3 %51 = OpLoad %44 
                                        f32_3 %52 = OpExtInst %1 30 %51 
                                                      OpStore %50 %52 
                                        f32_3 %53 = OpLoad %50 
                                        f32_3 %56 = OpFMul %53 %55 
                                                      OpStore %50 %56 
                                        f32_3 %57 = OpLoad %50 
                                        f32_3 %58 = OpExtInst %1 29 %57 
                                                      OpStore %50 %58 
                                        f32_3 %59 = OpLoad %50 
                                        f32_3 %62 = OpFMul %59 %61 
                                        f32_3 %65 = OpFAdd %62 %64 
                                                      OpStore %50 %65 
                                        f32_3 %66 = OpLoad %50 
                                        f32_3 %67 = OpExtInst %1 40 %66 %48 
                                                      OpStore %50 %67 
                                 Uniform i32* %79 = OpAccessChain %76 %77 
                                          i32 %80 = OpLoad %79 
                                         bool %82 = OpINotEqual %80 %77 
                                                      OpSelectionMerge %86 None 
                                                      OpBranchConditional %82 %85 %88 
                                              %85 = OpLabel 
                                        f32_3 %87 = OpLoad %50 
                                                      OpStore %84 %87 
                                                      OpBranch %86 
                                              %88 = OpLabel 
                                        f32_4 %89 = OpLoad %26 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                                      OpStore %84 %90 
                                                      OpBranch %86 
                                              %86 = OpLabel 
                                        f32_3 %91 = OpLoad %84 
                                                      OpStore %44 %91 
                                   Input f32* %92 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %96 = OpAccessChain %76 %94 %77 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                          f32 %99 = OpFAdd %93 %98 
                                Private f32* %100 = OpAccessChain %50 %13 
                                                      OpStore %100 %99 
                                Uniform f32* %102 = OpAccessChain %76 %94 %101 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFNegate %103 
                                         f32 %106 = OpFMul %104 %105 
                                Private f32* %107 = OpAccessChain %50 %13 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFAdd %106 %108 
                                Private f32* %110 = OpAccessChain %50 %13 
                                                      OpStore %110 %109 
                                  Input f32* %113 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %76 %94 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFNegate %117 
                                         f32 %119 = OpFAdd %114 %118 
                                                      OpStore %111 %119 
                                Uniform f32* %121 = OpAccessChain %76 %94 %120 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                         f32 %124 = OpFMul %123 %105 
                                         f32 %125 = OpLoad %111 
                                         f32 %126 = OpFAdd %124 %125 
                                Private f32* %127 = OpAccessChain %50 %112 
                                                      OpStore %127 %126 
                                       f32_3 %132 = OpLoad %50 
                                       f32_4 %133 = OpVectorShuffle %132 %132 0 1 0 0 
                                      bool_4 %135 = OpFOrdGreaterThanEqual %131 %133 
                                      bool_2 %136 = OpVectorShuffle %135 %135 0 1 
                                                      OpStore %130 %136 
                               Private bool* %141 = OpAccessChain %130 %112 
                                        bool %142 = OpLoad %141 
                                      bool_3 %147 = OpCompositeConstruct %142 %142 %142 
                                       i32_3 %148 = OpSelect %147 %143 %145 
                                                      OpStore %139 %148 
                               Private bool* %151 = OpAccessChain %130 %13 
                                        bool %152 = OpLoad %151 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %152 %155 %159 
                                             %155 = OpLabel 
                                Private i32* %157 = OpAccessChain %139 %13 
                                         i32 %158 = OpLoad %157 
                                                      OpStore %154 %158 
                                                      OpBranch %156 
                                             %159 = OpLabel 
                                Private i32* %160 = OpAccessChain %139 %112 
                                         i32 %161 = OpLoad %160 
                                                      OpStore %154 %161 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                         i32 %162 = OpLoad %154 
                                                      OpStore %150 %162 
                               Private bool* %163 = OpAccessChain %130 %13 
                                        bool %164 = OpLoad %163 
                                         i32 %165 = OpSelect %164 %115 %94 
                                Private i32* %166 = OpAccessChain %139 %13 
                                                      OpStore %166 %165 
                                Uniform f32* %168 = OpAccessChain %76 %94 %77 
                                         f32 %169 = OpLoad %168 
                                         i32 %170 = OpLoad %150 
                                Uniform f32* %171 = OpAccessChain %76 %101 %170 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFAdd %169 %172 
                                Private f32* %174 = OpAccessChain %167 %112 
                                                      OpStore %174 %173 
                                Uniform f32* %176 = OpAccessChain %76 %94 %115 
                                         f32 %177 = OpLoad %176 
                                         i32 %178 = OpLoad %150 
                                Uniform f32* %179 = OpAccessChain %76 %101 %178 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFAdd %177 %180 
                                Private f32* %182 = OpAccessChain %175 %112 
                                                      OpStore %182 %181 
                                Uniform f32* %183 = OpAccessChain %76 %120 %77 
                                         f32 %184 = OpLoad %183 
                                Uniform f32* %185 = OpAccessChain %76 %94 %77 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFAdd %184 %186 
                                Private f32* %189 = OpAccessChain %167 %188 
                                                      OpStore %189 %187 
                                Uniform f32* %190 = OpAccessChain %76 %120 %115 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %76 %94 %115 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFAdd %191 %193 
                                Private f32* %195 = OpAccessChain %175 %188 
                                                      OpStore %195 %194 
                                Uniform f32* %197 = OpAccessChain %76 %94 %77 
                                         f32 %198 = OpLoad %197 
                                Uniform f32* %199 = OpAccessChain %76 %94 %101 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFAdd %198 %200 
                                Private f32* %202 = OpAccessChain %196 %13 
                                                      OpStore %202 %201 
                                Private f32* %203 = OpAccessChain %196 %13 
                                         f32 %204 = OpLoad %203 
                                         i32 %205 = OpLoad %150 
                                Uniform f32* %206 = OpAccessChain %76 %101 %205 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFNegate %207 
                                         f32 %209 = OpFAdd %204 %208 
                                Private f32* %210 = OpAccessChain %196 %112 
                                                      OpStore %210 %209 
                                Private f32* %211 = OpAccessChain %196 %13 
                                         f32 %212 = OpLoad %211 
                                Uniform f32* %213 = OpAccessChain %76 %120 %101 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFNegate %214 
                                         f32 %216 = OpFAdd %212 %215 
                                Private f32* %217 = OpAccessChain %196 %188 
                                                      OpStore %217 %216 
                                Uniform f32* %218 = OpAccessChain %76 %94 %77 
                                         f32 %219 = OpLoad %218 
                                Private f32* %220 = OpAccessChain %167 %13 
                                                      OpStore %220 %219 
                                Uniform f32* %221 = OpAccessChain %76 %120 %77 
                                         f32 %222 = OpLoad %221 
                                Private f32* %224 = OpAccessChain %167 %223 
                                                      OpStore %224 %222 
                                Uniform f32* %225 = OpAccessChain %76 %120 %101 
                                         f32 %226 = OpLoad %225 
                                Private f32* %227 = OpAccessChain %196 %223 
                                                      OpStore %227 %226 
                               Private bool* %228 = OpAccessChain %130 %13 
                                        bool %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %167 
                                       f32_4 %231 = OpLoad %196 
                                      bool_4 %232 = OpCompositeConstruct %229 %229 %229 %229 
                                       f32_4 %233 = OpSelect %232 %230 %231 
                                                      OpStore %196 %233 
                                Uniform f32* %235 = OpAccessChain %76 %94 %115 
                                         f32 %236 = OpLoad %235 
                                Uniform f32* %237 = OpAccessChain %76 %94 %120 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFAdd %236 %238 
                                Private f32* %240 = OpAccessChain %234 %13 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %234 %13 
                                         f32 %242 = OpLoad %241 
                                         i32 %243 = OpLoad %150 
                                Uniform f32* %244 = OpAccessChain %76 %101 %243 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFNegate %245 
                                         f32 %247 = OpFAdd %242 %246 
                                Private f32* %248 = OpAccessChain %234 %112 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %234 %13 
                                         f32 %250 = OpLoad %249 
                                Uniform f32* %251 = OpAccessChain %76 %120 %120 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFNegate %252 
                                         f32 %254 = OpFAdd %250 %253 
                                Private f32* %255 = OpAccessChain %234 %188 
                                                      OpStore %255 %254 
                                Uniform f32* %256 = OpAccessChain %76 %94 %115 
                                         f32 %257 = OpLoad %256 
                                Private f32* %258 = OpAccessChain %175 %13 
                                                      OpStore %258 %257 
                                Uniform f32* %259 = OpAccessChain %76 %120 %115 
                                         f32 %260 = OpLoad %259 
                                Private f32* %261 = OpAccessChain %175 %223 
                                                      OpStore %261 %260 
                                Uniform f32* %262 = OpAccessChain %76 %120 %120 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %234 %223 
                                                      OpStore %264 %263 
                               Private bool* %265 = OpAccessChain %130 %112 
                                        bool %266 = OpLoad %265 
                                                      OpSelectionMerge %270 None 
                                                      OpBranchConditional %266 %269 %273 
                                             %269 = OpLabel 
                                       f32_4 %271 = OpLoad %175 
                                       f32_4 %272 = OpVectorShuffle %271 %271 1 0 2 3 
                                                      OpStore %268 %272 
                                                      OpBranch %270 
                                             %273 = OpLabel 
                                       f32_4 %274 = OpLoad %234 
                                       f32_4 %275 = OpVectorShuffle %274 %274 1 0 2 3 
                                                      OpStore %268 %275 
                                                      OpBranch %270 
                                             %270 = OpLabel 
                                       f32_4 %276 = OpLoad %268 
                                                      OpStore %234 %276 
                                       f32_4 %279 = OpLoad %196 
                                       f32_4 %280 = OpVectorShuffle %279 %279 1 3 1 1 
                                       f32_4 %281 = OpLoad vs_TEXCOORD2 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 0 0 0 
                                      bool_4 %283 = OpFOrdGreaterThanEqual %280 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                      bool_3 %285 = OpLoad %278 
                                      bool_3 %286 = OpVectorShuffle %285 %284 3 4 2 
                                                      OpStore %278 %286 
                                       f32_4 %288 = OpLoad vs_TEXCOORD2 
                                       f32_4 %289 = OpVectorShuffle %288 %288 0 0 0 0 
                                       f32_4 %290 = OpLoad %196 
                                       f32_4 %291 = OpVectorShuffle %290 %290 1 3 1 1 
                                      bool_4 %292 = OpFOrdGreaterThanEqual %289 %291 
                                      bool_2 %293 = OpVectorShuffle %292 %292 0 1 
                                                      OpStore %287 %293 
                               Private bool* %294 = OpAccessChain %130 %13 
                                        bool %295 = OpLoad %294 
                                                      OpSelectionMerge %299 None 
                                                      OpBranchConditional %295 %298 %302 
                                             %298 = OpLabel 
                                      bool_3 %300 = OpLoad %278 
                                      bool_2 %301 = OpVectorShuffle %300 %300 0 1 
                                                      OpStore %297 %301 
                                                      OpBranch %299 
                                             %302 = OpLabel 
                                      bool_2 %303 = OpLoad %287 
                                                      OpStore %297 %303 
                                                      OpBranch %299 
                                             %299 = OpLabel 
                                      bool_2 %304 = OpLoad %297 
                                      bool_3 %305 = OpLoad %278 
                                      bool_3 %306 = OpVectorShuffle %305 %304 3 4 2 
                                                      OpStore %278 %306 
                                       f32_4 %307 = OpLoad %234 
                                       f32_4 %308 = OpVectorShuffle %307 %307 0 3 0 0 
                                       f32_4 %309 = OpLoad vs_TEXCOORD2 
                                       f32_4 %310 = OpVectorShuffle %309 %309 1 1 1 1 
                                      bool_4 %311 = OpFOrdGreaterThanEqual %308 %310 
                                      bool_2 %312 = OpVectorShuffle %311 %311 0 1 
                                                      OpStore %287 %312 
                                       f32_4 %314 = OpLoad vs_TEXCOORD2 
                                       f32_4 %315 = OpVectorShuffle %314 %314 1 1 1 1 
                                       f32_4 %316 = OpLoad %234 
                                       f32_4 %317 = OpVectorShuffle %316 %316 0 3 0 0 
                                      bool_4 %318 = OpFOrdGreaterThanEqual %315 %317 
                                      bool_2 %319 = OpVectorShuffle %318 %318 0 1 
                                                      OpStore %313 %319 
                               Private bool* %320 = OpAccessChain %130 %112 
                                        bool %321 = OpLoad %320 
                                                      OpSelectionMerge %324 None 
                                                      OpBranchConditional %321 %323 %326 
                                             %323 = OpLabel 
                                      bool_2 %325 = OpLoad %287 
                                                      OpStore %322 %325 
                                                      OpBranch %324 
                                             %326 = OpLabel 
                                      bool_2 %327 = OpLoad %313 
                                                      OpStore %322 %327 
                                                      OpBranch %324 
                                             %324 = OpLabel 
                                      bool_2 %328 = OpLoad %322 
                                                      OpStore %130 %328 
                               Private bool* %329 = OpAccessChain %130 %13 
                                        bool %330 = OpLoad %329 
                               Private bool* %331 = OpAccessChain %278 %13 
                                        bool %332 = OpLoad %331 
                                        bool %333 = OpLogicalAnd %330 %332 
                               Private bool* %334 = OpAccessChain %130 %13 
                                                      OpStore %334 %333 
                                Uniform f32* %336 = OpAccessChain %76 %120 %77 
                                         f32 %337 = OpLoad %336 
                                Uniform f32* %338 = OpAccessChain %76 %120 %101 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFAdd %337 %339 
                                                      OpStore %335 %340 
                                         f32 %341 = OpLoad %335 
                                         f32 %342 = OpFNegate %341 
                                Uniform f32* %343 = OpAccessChain %76 %94 %101 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFAdd %342 %344 
                                                      OpStore %335 %345 
                                Uniform f32* %346 = OpAccessChain %76 %120 %115 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %348 = OpAccessChain %76 %120 %120 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFAdd %347 %349 
                                Private f32* %351 = OpAccessChain %167 %13 
                                                      OpStore %351 %350 
                                Private f32* %352 = OpAccessChain %167 %13 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpFNegate %353 
                                Uniform f32* %355 = OpAccessChain %76 %94 %120 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFAdd %354 %356 
                                Private f32* %358 = OpAccessChain %167 %13 
                                                      OpStore %358 %357 
                                  Input f32* %360 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %361 = OpLoad %360 
                                Private f32* %362 = OpAccessChain %167 %188 
                                         f32 %363 = OpLoad %362 
                                        bool %364 = OpFOrdGreaterThanEqual %361 %363 
                                                      OpStore %359 %364 
                                         f32 %365 = OpLoad %335 
                                Private f32* %366 = OpAccessChain %167 %188 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFAdd %365 %367 
                                                      OpStore %335 %368 
                                         f32 %370 = OpLoad %335 
                                  Input f32* %371 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %372 = OpLoad %371 
                                        bool %373 = OpFOrdGreaterThanEqual %370 %372 
                                                      OpStore %369 %373 
                                        bool %374 = OpLoad %369 
                                        bool %375 = OpLoad %359 
                                        bool %376 = OpLogicalAnd %374 %375 
                                                      OpStore %369 %376 
                                  Input f32* %377 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %378 = OpLoad %377 
                                Private f32* %379 = OpAccessChain %175 %188 
                                         f32 %380 = OpLoad %379 
                                        bool %381 = OpFOrdGreaterThanEqual %378 %380 
                                                      OpStore %359 %381 
                                        bool %382 = OpLoad %369 
                                        bool %383 = OpLoad %359 
                                        bool %384 = OpLogicalAnd %382 %383 
                                                      OpStore %369 %384 
                                Private f32* %385 = OpAccessChain %167 %13 
                                         f32 %386 = OpLoad %385 
                                Private f32* %387 = OpAccessChain %175 %188 
                                         f32 %388 = OpLoad %387 
                                         f32 %389 = OpFAdd %386 %388 
                                Private f32* %390 = OpAccessChain %167 %13 
                                                      OpStore %390 %389 
                                Private f32* %391 = OpAccessChain %167 %13 
                                         f32 %392 = OpLoad %391 
                                  Input f32* %393 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %394 = OpLoad %393 
                                        bool %395 = OpFOrdGreaterThanEqual %392 %394 
                               Private bool* %396 = OpAccessChain %278 %13 
                                                      OpStore %396 %395 
                                        bool %397 = OpLoad %369 
                               Private bool* %398 = OpAccessChain %278 %13 
                                        bool %399 = OpLoad %398 
                                        bool %400 = OpLogicalAnd %397 %399 
                                                      OpStore %369 %400 
                                         i32 %401 = OpLoad %150 
                                       i32_4 %403 = OpCompositeConstruct %401 %401 %401 %401 
                                      bool_4 %405 = OpIEqual %403 %404 
                                      bool_2 %406 = OpVectorShuffle %405 %405 0 2 
                                      bool_3 %407 = OpLoad %278 
                                      bool_3 %408 = OpVectorShuffle %407 %406 3 1 4 
                                                      OpStore %278 %408 
                               Private bool* %409 = OpAccessChain %278 %223 
                                        bool %410 = OpLoad %409 
                               Private bool* %411 = OpAccessChain %278 %13 
                                        bool %412 = OpLoad %411 
                                        bool %413 = OpLogicalOr %410 %412 
                               Private bool* %414 = OpAccessChain %278 %13 
                                                      OpStore %414 %413 
                                         i32 %415 = OpLoad %150 
                                Uniform f32* %416 = OpAccessChain %76 %101 %415 
                                         f32 %417 = OpLoad %416 
                                        bool %418 = OpFOrdLessThan %47 %417 
                                                      OpStore %359 %418 
                               Private bool* %419 = OpAccessChain %130 %13 
                                        bool %420 = OpLoad %419 
                                        bool %421 = OpLoad %359 
                                        bool %422 = OpLogicalAnd %420 %421 
                                                      OpStore %359 %422 
                                Private f32* %424 = OpAccessChain %196 %223 
                                         f32 %425 = OpLoad %424 
                                        bool %426 = OpFOrdLessThan %47 %425 
                                                      OpStore %423 %426 
                                        bool %428 = OpLoad %423 
                                         i32 %429 = OpSelect %428 %115 %77 
                                                      OpStore %427 %429 
                                Private f32* %431 = OpAccessChain %234 %223 
                                         f32 %432 = OpLoad %431 
                                        bool %433 = OpFOrdLessThan %47 %432 
                                                      OpStore %430 %433 
                                        bool %435 = OpLoad %430 
                                         i32 %436 = OpSelect %435 %115 %77 
                                                      OpStore %434 %436 
                                Private i32* %437 = OpAccessChain %139 %223 
                                         i32 %438 = OpLoad %437 
                                         i32 %439 = OpLoad %434 
                                         i32 %440 = OpIMul %438 %439 
                                                      OpStore %434 %440 
                                         i32 %441 = OpLoad %427 
                                Private i32* %442 = OpAccessChain %139 %13 
                                         i32 %443 = OpLoad %442 
                                         i32 %444 = OpIMul %441 %443 
                                         i32 %445 = OpLoad %434 
                                         i32 %446 = OpIAdd %444 %445 
                                                      OpStore %427 %446 
                               Private bool* %448 = OpAccessChain %278 %112 
                                        bool %449 = OpLoad %448 
                                        bool %450 = OpLoad %423 
                                        bool %451 = OpLogicalAnd %449 %450 
                                                      OpStore %447 %451 
                               Private bool* %453 = OpAccessChain %130 %112 
                                        bool %454 = OpLoad %453 
                                        bool %455 = OpLoad %430 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %452 %456 
                                        bool %458 = OpLoad %447 
                                         i32 %459 = OpSelect %458 %115 %77 
                                                      OpStore %457 %459 
                                        bool %461 = OpLoad %452 
                                         i32 %462 = OpSelect %461 %115 %77 
                                                      OpStore %460 %462 
                                Private i32* %463 = OpAccessChain %139 %223 
                                         i32 %464 = OpLoad %463 
                                         i32 %465 = OpLoad %460 
                                         i32 %466 = OpIMul %464 %465 
                                                      OpStore %460 %466 
                                         i32 %467 = OpLoad %457 
                                Private i32* %468 = OpAccessChain %139 %13 
                                         i32 %469 = OpLoad %468 
                                         i32 %470 = OpIMul %467 %469 
                                         i32 %471 = OpLoad %460 
                                         i32 %472 = OpIAdd %470 %471 
                                                      OpStore %460 %472 
                                        bool %473 = OpLoad %369 
                                         i32 %474 = OpLoad %460 
                                         i32 %475 = OpSelect %473 %77 %474 
                                                      OpStore %460 %475 
                                        bool %476 = OpLoad %359 
                                         i32 %477 = OpLoad %427 
                                         i32 %478 = OpLoad %460 
                                         i32 %479 = OpSelect %476 %477 %478 
                                                      OpStore %460 %479 
                                Private i32* %480 = OpAccessChain %139 %223 
                                         i32 %481 = OpLoad %480 
                                Private i32* %482 = OpAccessChain %139 %13 
                                         i32 %483 = OpLoad %482 
                                         i32 %484 = OpIAdd %481 %483 
                                                      OpStore %457 %484 
                               Private bool* %485 = OpAccessChain %278 %13 
                                        bool %486 = OpLoad %485 
                                         f32 %488 = OpSelect %486 %20 %487 
                                Private f32* %489 = OpAccessChain %167 %13 
                                                      OpStore %489 %488 
                                       f32_4 %491 = OpLoad %196 
                                       f32_2 %492 = OpVectorShuffle %491 %491 3 1 
                                       f32_4 %493 = OpLoad %490 
                                       f32_4 %494 = OpVectorShuffle %493 %492 4 1 5 3 
                                                      OpStore %490 %494 
                                       f32_4 %495 = OpLoad %234 
                                       f32_2 %496 = OpVectorShuffle %495 %495 3 0 
                                       f32_4 %497 = OpLoad %490 
                                       f32_4 %498 = OpVectorShuffle %497 %496 0 4 2 5 
                                                      OpStore %490 %498 
                                Private f32* %499 = OpAccessChain %196 %13 
                                         f32 %500 = OpLoad %499 
                                Private f32* %501 = OpAccessChain %234 %13 
                                                      OpStore %501 %500 
                                       f32_4 %502 = OpLoad %490 
                                       f32_2 %503 = OpVectorShuffle %502 %502 1 0 
                                       f32_2 %504 = OpFNegate %503 
                                       f32_4 %505 = OpLoad %234 
                                       f32_2 %506 = OpVectorShuffle %505 %505 1 0 
                                       f32_2 %507 = OpFAdd %504 %506 
                                       f32_4 %508 = OpLoad %175 
                                       f32_4 %509 = OpVectorShuffle %508 %507 4 1 5 3 
                                                      OpStore %175 %509 
                                       f32_4 %510 = OpLoad %167 
                                       f32_2 %511 = OpVectorShuffle %510 %510 0 0 
                                       f32_4 %512 = OpLoad %175 
                                       f32_2 %513 = OpVectorShuffle %512 %512 0 2 
                                       f32_2 %514 = OpFMul %511 %513 
                                       f32_4 %515 = OpLoad %167 
                                       f32_4 %516 = OpVectorShuffle %515 %514 4 1 5 3 
                                                      OpStore %167 %516 
                                       f32_4 %517 = OpLoad %167 
                                       f32_2 %518 = OpVectorShuffle %517 %517 0 2 
                                       f32_4 %519 = OpLoad %167 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 2 
                                         f32 %521 = OpDot %518 %520 
                                Private f32* %522 = OpAccessChain %175 %13 
                                                      OpStore %522 %521 
                                Private f32* %523 = OpAccessChain %175 %13 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpExtInst %1 32 %524 
                                Private f32* %526 = OpAccessChain %175 %13 
                                                      OpStore %526 %525 
                                       f32_4 %527 = OpLoad %167 
                                       f32_2 %528 = OpVectorShuffle %527 %527 0 2 
                                       f32_4 %529 = OpLoad %175 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 0 
                                       f32_2 %531 = OpFMul %528 %530 
                                       f32_4 %532 = OpLoad %167 
                                       f32_4 %533 = OpVectorShuffle %532 %531 4 1 5 3 
                                                      OpStore %167 %533 
                                       f32_4 %534 = OpLoad %167 
                                       f32_2 %535 = OpVectorShuffle %534 %534 0 2 
                                       f32_2 %538 = OpFMul %535 %537 
                                       f32_4 %539 = OpLoad %234 
                                       f32_2 %540 = OpVectorShuffle %539 %539 1 0 
                                       f32_2 %541 = OpFAdd %538 %540 
                                       f32_4 %542 = OpLoad %167 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 1 5 3 
                                                      OpStore %167 %543 
                                       f32_4 %544 = OpLoad %167 
                                       f32_2 %545 = OpVectorShuffle %544 %544 2 0 
                                       f32_2 %546 = OpFNegate %545 
                                       f32_4 %547 = OpLoad %234 
                                       f32_2 %548 = OpVectorShuffle %547 %547 0 1 
                                       f32_2 %549 = OpFAdd %546 %548 
                                       f32_4 %550 = OpLoad %175 
                                       f32_4 %551 = OpVectorShuffle %550 %549 4 1 5 3 
                                                      OpStore %175 %551 
                                       f32_4 %552 = OpLoad %167 
                                       f32_2 %553 = OpVectorShuffle %552 %552 0 2 
                                       f32_2 %554 = OpFNegate %553 
                                       f32_4 %555 = OpLoad vs_TEXCOORD2 
                                       f32_2 %556 = OpVectorShuffle %555 %555 1 0 
                                       f32_2 %557 = OpFAdd %554 %556 
                                       f32_4 %558 = OpLoad %167 
                                       f32_4 %559 = OpVectorShuffle %558 %557 4 1 5 3 
                                                      OpStore %167 %559 
                                Private f32* %561 = OpAccessChain %167 %223 
                                         f32 %562 = OpLoad %561 
                                Private f32* %563 = OpAccessChain %175 %223 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpFMul %562 %564 
                                                      OpStore %560 %565 
                                Private f32* %566 = OpAccessChain %175 %13 
                                         f32 %567 = OpLoad %566 
                                Private f32* %568 = OpAccessChain %167 %13 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFMul %567 %569 
                                         f32 %571 = OpLoad %560 
                                         f32 %572 = OpFNegate %571 
                                         f32 %573 = OpFAdd %570 %572 
                                Private f32* %574 = OpAccessChain %167 %13 
                                                      OpStore %574 %573 
                                Private f32* %575 = OpAccessChain %167 %13 
                                         f32 %576 = OpLoad %575 
                                        bool %577 = OpFOrdGreaterThanEqual %576 %47 
                               Private bool* %578 = OpAccessChain %278 %13 
                                                      OpStore %578 %577 
                               Private bool* %579 = OpAccessChain %278 %13 
                                        bool %580 = OpLoad %579 
                                                      OpSelectionMerge %583 None 
                                                      OpBranchConditional %580 %582 %586 
                                             %582 = OpLabel 
                                Private i32* %584 = OpAccessChain %139 %13 
                                         i32 %585 = OpLoad %584 
                                                      OpStore %581 %585 
                                                      OpBranch %583 
                                             %586 = OpLabel 
                                Private i32* %587 = OpAccessChain %139 %223 
                                         i32 %588 = OpLoad %587 
                                                      OpStore %581 %588 
                                                      OpBranch %583 
                                             %583 = OpLabel 
                                         i32 %589 = OpLoad %581 
                                Private i32* %590 = OpAccessChain %139 %13 
                                                      OpStore %590 %589 
                                         i32 %592 = OpLoad %460 
                                         i32 %593 = OpLoad %457 
                                        bool %594 = OpINotEqual %592 %593 
                                                      OpStore %591 %594 
                                        bool %595 = OpLoad %591 
                                                      OpSelectionMerge %598 None 
                                                      OpBranchConditional %595 %597 %600 
                                             %597 = OpLabel 
                                         i32 %599 = OpLoad %460 
                                                      OpStore %596 %599 
                                                      OpBranch %598 
                                             %600 = OpLabel 
                                Private i32* %601 = OpAccessChain %139 %13 
                                         i32 %602 = OpLoad %601 
                                                      OpStore %596 %602 
                                                      OpBranch %598 
                                             %598 = OpLabel 
                                         i32 %603 = OpLoad %596 
                                                      OpStore %460 %603 
                                         i32 %604 = OpLoad %460 
                                        bool %605 = OpIEqual %604 %77 
                                                      OpSelectionMerge %607 None 
                                                      OpBranchConditional %605 %606 %620 
                                             %606 = OpLabel 
                                       f32_3 %609 = OpLoad %44 
                                       f32_4 %611 = OpLoad %610 
                                       f32_3 %612 = OpVectorShuffle %611 %611 0 1 2 
                                       f32_3 %613 = OpFMul %609 %612 
                                                      OpStore %608 %613 
                                Private f32* %615 = OpAccessChain %26 %188 
                                         f32 %616 = OpLoad %615 
                                  Input f32* %617 = OpAccessChain %610 %188 
                                         f32 %618 = OpLoad %617 
                                         f32 %619 = OpFMul %616 %618 
                                                      OpStore %614 %619 
                                                      OpBranch %607 
                                             %620 = OpLabel 
                                         i32 %621 = OpLoad %460 
                                       i32_4 %622 = OpCompositeConstruct %621 %621 %621 %621 
                                      bool_4 %624 = OpIEqual %622 %623 
                                      bool_3 %625 = OpVectorShuffle %624 %624 0 1 2 
                                                      OpStore %278 %625 
                               Private bool* %626 = OpAccessChain %278 %223 
                                        bool %627 = OpLoad %626 
                                         i32 %628 = OpSelect %627 %120 %77 
                                                      OpStore %460 %628 
                               Private bool* %629 = OpAccessChain %278 %112 
                                        bool %630 = OpLoad %629 
                                         i32 %631 = OpLoad %460 
                                         i32 %632 = OpSelect %630 %101 %631 
                                                      OpStore %460 %632 
                               Private bool* %633 = OpAccessChain %278 %13 
                                        bool %634 = OpLoad %633 
                                         i32 %635 = OpLoad %460 
                                         i32 %636 = OpSelect %634 %115 %635 
                                                      OpStore %460 %636 
                                       f32_3 %638 = OpLoad %44 
                                         i32 %640 = OpLoad %460 
                              Uniform f32_4* %642 = OpAccessChain %76 %639 %640 
                                       f32_4 %643 = OpLoad %642 
                                       f32_3 %644 = OpVectorShuffle %643 %643 0 1 2 
                                       f32_3 %645 = OpFMul %638 %644 
                                                      OpStore %637 %645 
                                Private f32* %647 = OpAccessChain %26 %188 
                                         f32 %648 = OpLoad %647 
                                         i32 %649 = OpLoad %460 
                                Uniform f32* %650 = OpAccessChain %76 %639 %649 %188 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %648 %651 
                                                      OpStore %646 %652 
                                       f32_3 %653 = OpLoad %637 
                                                      OpStore %608 %653 
                                         f32 %654 = OpLoad %646 
                                                      OpStore %614 %654 
                                                      OpBranch %607 
                                             %607 = OpLabel 
                                        bool %655 = OpLoad %423 
                                        bool %656 = OpLoad %430 
                                        bool %657 = OpLogicalOr %655 %656 
                                                      OpStore %452 %657 
                                       f32_4 %658 = OpLoad %490 
                                       f32_2 %659 = OpVectorShuffle %658 %658 2 3 
                                       f32_2 %660 = OpFNegate %659 
                                       f32_4 %661 = OpLoad vs_TEXCOORD2 
                                       f32_2 %662 = OpVectorShuffle %661 %661 0 1 
                                       f32_2 %663 = OpFAdd %660 %662 
                                       f32_4 %664 = OpLoad %167 
                                       f32_4 %665 = OpVectorShuffle %664 %663 4 5 2 3 
                                                      OpStore %167 %665 
                                       f32_4 %667 = OpLoad %167 
                                       f32_2 %668 = OpVectorShuffle %667 %667 0 1 
                                       f32_4 %669 = OpLoad %167 
                                       f32_2 %670 = OpVectorShuffle %669 %669 0 1 
                                         f32 %671 = OpDot %668 %670 
                                                      OpStore %666 %671 
                                         f32 %672 = OpLoad %666 
                                         f32 %673 = OpExtInst %1 31 %672 
                                                      OpStore %666 %673 
                                         f32 %674 = OpLoad %666 
                                         i32 %675 = OpLoad %150 
                                Uniform f32* %676 = OpAccessChain %76 %101 %675 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFNegate %677 
                                         f32 %679 = OpFAdd %674 %678 
                                                      OpStore %666 %679 
                                         f32 %680 = OpLoad %666 
                                Private f32* %681 = OpAccessChain %9 %13 
                                         f32 %682 = OpLoad %681 
                                         f32 %683 = OpFMul %680 %682 
                                         f32 %684 = OpFAdd %683 %105 
                                                      OpStore %666 %684 
                                         f32 %685 = OpLoad %666 
                                         f32 %686 = OpExtInst %1 43 %685 %47 %20 
                                                      OpStore %666 %686 
                                        bool %687 = OpLoad %452 
                                         f32 %688 = OpLoad %666 
                                         f32 %689 = OpSelect %687 %688 %47 
                                                      OpStore %666 %689 
                                Private f32* %691 = OpAccessChain %196 %223 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpFNegate %692 
                                         i32 %694 = OpLoad %150 
                                Uniform f32* %695 = OpAccessChain %76 %101 %694 
                                         f32 %696 = OpLoad %695 
                                         f32 %697 = OpFAdd %693 %696 
                                                      OpStore %690 %697 
                                Private f32* %699 = OpAccessChain %234 %223 
                                         f32 %700 = OpLoad %699 
                                         f32 %701 = OpFNegate %700 
                                         i32 %702 = OpLoad %150 
                                Uniform f32* %703 = OpAccessChain %76 %101 %702 
                                         f32 %704 = OpLoad %703 
                                         f32 %705 = OpFAdd %701 %704 
                                                      OpStore %698 %705 
                                         f32 %707 = OpLoad %690 
                                         f32 %708 = OpLoad %698 
                                         f32 %709 = OpFDiv %707 %708 
                                                      OpStore %706 %709 
                                         f32 %710 = OpLoad %706 
                                Private f32* %711 = OpAccessChain %167 %112 
                                         f32 %712 = OpLoad %711 
                                         f32 %713 = OpFMul %710 %712 
                                Private f32* %714 = OpAccessChain %167 %223 
                                                      OpStore %714 %713 
                                       f32_4 %715 = OpLoad %167 
                                       f32_2 %716 = OpVectorShuffle %715 %715 0 2 
                                       f32_4 %717 = OpLoad %167 
                                       f32_2 %718 = OpVectorShuffle %717 %717 0 2 
                                         f32 %719 = OpDot %716 %718 
                                                      OpStore %706 %719 
                                         f32 %720 = OpLoad %706 
                                         f32 %721 = OpExtInst %1 31 %720 
                                                      OpStore %706 %721 
                                         f32 %722 = OpLoad %690 
                                         f32 %723 = OpFNegate %722 
                                         f32 %724 = OpLoad %706 
                                         f32 %725 = OpFAdd %723 %724 
                                                      OpStore %706 %725 
                                         f32 %726 = OpLoad %706 
                                Private f32* %727 = OpAccessChain %9 %13 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFMul %726 %728 
                                         f32 %730 = OpFAdd %729 %105 
                                Private f32* %731 = OpAccessChain %9 %13 
                                                      OpStore %731 %730 
                                Private f32* %732 = OpAccessChain %9 %13 
                                         f32 %733 = OpLoad %732 
                                         f32 %734 = OpExtInst %1 43 %733 %47 %20 
                                Private f32* %735 = OpAccessChain %9 %13 
                                                      OpStore %735 %734 
                                         f32 %736 = OpLoad %690 
                                        bool %737 = OpFOrdLessThan %47 %736 
                                                      OpStore %591 %737 
                                         f32 %739 = OpLoad %698 
                                        bool %740 = OpFOrdLessThan %47 %739 
                                                      OpStore %738 %740 
                                        bool %741 = OpLoad %738 
                                        bool %742 = OpLoad %591 
                                        bool %743 = OpLogicalAnd %741 %742 
                                                      OpStore %738 %743 
                                        bool %744 = OpLoad %738 
                                                      OpSelectionMerge %748 None 
                                                      OpBranchConditional %744 %747 %751 
                                             %747 = OpLabel 
                                Private f32* %749 = OpAccessChain %9 %13 
                                         f32 %750 = OpLoad %749 
                                                      OpStore %746 %750 
                                                      OpBranch %748 
                                             %751 = OpLabel 
                                                      OpStore %746 %20 
                                                      OpBranch %748 
                                             %748 = OpLabel 
                                         f32 %752 = OpLoad %746 
                                Private f32* %753 = OpAccessChain %9 %13 
                                                      OpStore %753 %752 
                                        bool %754 = OpLoad %452 
                                                      OpSelectionMerge %757 None 
                                                      OpBranchConditional %754 %756 %760 
                                             %756 = OpLabel 
                                Private f32* %758 = OpAccessChain %9 %13 
                                         f32 %759 = OpLoad %758 
                                                      OpStore %755 %759 
                                                      OpBranch %757 
                                             %760 = OpLabel 
                                                      OpStore %755 %47 
                                                      OpBranch %757 
                                             %757 = OpLabel 
                                         f32 %761 = OpLoad %755 
                                Private f32* %762 = OpAccessChain %9 %13 
                                                      OpStore %762 %761 
                                         f32 %763 = OpLoad %666 
                                        bool %764 = OpFOrdEqual %763 %47 
                                                      OpStore %452 %764 
                                         f32 %765 = OpLoad %666 
                                         f32 %766 = OpFNegate %765 
                                         f32 %767 = OpFAdd %766 %20 
                                                      OpStore %698 %767 
                                        bool %768 = OpLoad %452 
                                                      OpSelectionMerge %771 None 
                                                      OpBranchConditional %768 %770 %774 
                                             %770 = OpLabel 
                                Private f32* %772 = OpAccessChain %9 %13 
                                         f32 %773 = OpLoad %772 
                                                      OpStore %769 %773 
                                                      OpBranch %771 
                                             %774 = OpLabel 
                                         f32 %775 = OpLoad %698 
                                                      OpStore %769 %775 
                                                      OpBranch %771 
                                             %771 = OpLabel 
                                         f32 %776 = OpLoad %769 
                                Private f32* %777 = OpAccessChain %9 %13 
                                                      OpStore %777 %776 
                               Private bool* %778 = OpAccessChain %130 %13 
                                        bool %779 = OpLoad %778 
                                                      OpSelectionMerge %782 None 
                                                      OpBranchConditional %779 %781 %785 
                                             %781 = OpLabel 
                                Private f32* %783 = OpAccessChain %9 %13 
                                         f32 %784 = OpLoad %783 
                                                      OpStore %780 %784 
                                                      OpBranch %782 
                                             %785 = OpLabel 
                                                      OpStore %780 %20 
                                                      OpBranch %782 
                                             %782 = OpLabel 
                                         f32 %786 = OpLoad %780 
                                Private f32* %787 = OpAccessChain %9 %13 
                                                      OpStore %787 %786 
                                Private f32* %788 = OpAccessChain %9 %13 
                                         f32 %789 = OpLoad %788 
                                         f32 %790 = OpLoad %614 
                                         f32 %791 = OpFMul %789 %790 
                                                      OpStore %111 %791 
                                        bool %792 = OpLoad %369 
                                         f32 %793 = OpSelect %792 %47 %20 
                                                      OpStore %698 %793 
                               Private bool* %794 = OpAccessChain %130 %13 
                                        bool %795 = OpLoad %794 
                                         f32 %796 = OpLoad %698 
                                         f32 %797 = OpSelect %795 %20 %796 
                                Private f32* %798 = OpAccessChain %50 %13 
                                                      OpStore %798 %797 
                                Private f32* %799 = OpAccessChain %50 %13 
                                         f32 %800 = OpLoad %799 
                                         f32 %801 = OpLoad %111 
                                         f32 %802 = OpFMul %800 %801 
                                Private f32* %803 = OpAccessChain %9 %223 
                                                      OpStore %803 %802 
                         read_only Texture2D %805 = OpLoad %804 
                                     sampler %807 = OpLoad %806 
                  read_only Texture2DSampled %808 = OpSampledImage %805 %807 
                                       f32_2 %810 = OpLoad vs_TEXCOORD1 
                                       f32_4 %811 = OpImageSampleImplicitLod %808 %810 
                                         f32 %812 = OpCompositeExtract %811 3 
                                Private f32* %813 = OpAccessChain %50 %223 
                                                      OpStore %813 %812 
                                Uniform i32* %815 = OpAccessChain %76 %115 
                                         i32 %816 = OpLoad %815 
                                        bool %817 = OpINotEqual %816 %639 
                                                      OpStore %814 %817 
                                       f32_3 %818 = OpLoad %50 
                                       f32_2 %819 = OpVectorShuffle %818 %818 0 2 
                                       f32_4 %820 = OpLoad %9 
                                       f32_2 %821 = OpVectorShuffle %820 %820 0 2 
                                       f32_2 %822 = OpFMul %819 %821 
                                       f32_4 %823 = OpLoad %9 
                                       f32_4 %824 = OpVectorShuffle %823 %822 4 1 5 3 
                                                      OpStore %9 %824 
                                Private f32* %825 = OpAccessChain %50 %223 
                                         f32 %826 = OpLoad %825 
                                Private f32* %827 = OpAccessChain %9 %13 
                                         f32 %828 = OpLoad %827 
                                         f32 %829 = OpFMul %826 %828 
                                Private f32* %830 = OpAccessChain %9 %13 
                                                      OpStore %830 %829 
                                       f32_4 %831 = OpLoad %9 
                                       f32_3 %832 = OpVectorShuffle %831 %831 0 0 0 
                                       f32_3 %833 = OpLoad %608 
                                       f32_3 %834 = OpFMul %832 %833 
                                       f32_4 %835 = OpLoad %9 
                                       f32_4 %836 = OpVectorShuffle %835 %834 4 5 2 6 
                                                      OpStore %9 %836 
                                        bool %839 = OpLoad %814 
                                                      OpSelectionMerge %842 None 
                                                      OpBranchConditional %839 %841 %845 
                                             %841 = OpLabel 
                                       f32_4 %843 = OpLoad %9 
                                       f32_3 %844 = OpVectorShuffle %843 %843 0 1 3 
                                                      OpStore %840 %844 
                                                      OpBranch %842 
                                             %845 = OpLabel 
                                       f32_3 %846 = OpLoad %608 
                                                      OpStore %840 %846 
                                                      OpBranch %842 
                                             %842 = OpLabel 
                                       f32_3 %847 = OpLoad %840 
                                       f32_4 %848 = OpLoad %838 
                                       f32_4 %849 = OpVectorShuffle %848 %847 4 5 6 3 
                                                      OpStore %838 %849 
                                Private f32* %850 = OpAccessChain %9 %223 
                                         f32 %851 = OpLoad %850 
                                 Output f32* %853 = OpAccessChain %838 %188 
                                                      OpStore %853 %851 
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
; Bound: 855
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %39 %610 %809 %838 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD2 Location 11 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 39 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpDecorate %73 ArrayStride 73 
                                                      OpMemberDecorate %74 0 Offset 74 
                                                      OpMemberDecorate %74 1 Offset 74 
                                                      OpMemberDecorate %74 2 Offset 74 
                                                      OpMemberDecorate %74 3 Offset 74 
                                                      OpMemberDecorate %74 4 Offset 74 
                                                      OpMemberDecorate %74 5 Offset 74 
                                                      OpDecorate %74 Block 
                                                      OpDecorate %76 DescriptorSet 76 
                                                      OpDecorate %76 Binding 76 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %610 RelaxedPrecision 
                                                      OpDecorate %610 Location 610 
                                                      OpDecorate %611 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %614 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %618 RelaxedPrecision 
                                                      OpDecorate %619 RelaxedPrecision 
                                                      OpDecorate %638 RelaxedPrecision 
                                                      OpDecorate %648 RelaxedPrecision 
                                                      OpDecorate %790 RelaxedPrecision 
                                                      OpDecorate %804 RelaxedPrecision 
                                                      OpDecorate %804 DescriptorSet 804 
                                                      OpDecorate %804 Binding 804 
                                                      OpDecorate %805 RelaxedPrecision 
                                                      OpDecorate %806 RelaxedPrecision 
                                                      OpDecorate %806 DescriptorSet 806 
                                                      OpDecorate %806 Binding 806 
                                                      OpDecorate %807 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 809 
                                                      OpDecorate %833 RelaxedPrecision 
                                                      OpDecorate %838 RelaxedPrecision 
                                                      OpDecorate %838 Location 838 
                                                      OpDecorate %846 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 0 
                                              %14 = OpTypePointer Input %6 
                                              %18 = OpTypePointer Private %6 
                                          f32 %20 = OpConstant 3.674022E-40 
                               Private f32_4* %26 = OpVariable Private 
                                              %27 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %28 = OpTypePointer UniformConstant %27 
         UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
                                              %31 = OpTypeSampler 
                                              %32 = OpTypePointer UniformConstant %31 
                     UniformConstant sampler* %33 = OpVariable UniformConstant 
                                              %35 = OpTypeSampledImage %27 
                                              %37 = OpTypeVector %6 2 
                                              %38 = OpTypePointer Input %37 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Private %42 
                               Private f32_3* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.674022E-40 
                                        f32_3 %48 = OpConstantComposite %47 %47 %47 
                               Private f32_3* %50 = OpVariable Private 
                                          f32 %54 = OpConstant 3.674022E-40 
                                        f32_3 %55 = OpConstantComposite %54 %54 %54 
                                          f32 %60 = OpConstant 3.674022E-40 
                                        f32_3 %61 = OpConstantComposite %60 %60 %60 
                                          f32 %63 = OpConstant 3.674022E-40 
                                        f32_3 %64 = OpConstantComposite %63 %63 %63 
                                              %68 = OpTypeInt 32 1 
                                          u32 %69 = OpConstant 4 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeArray %6 %69 
                                              %72 = OpTypeArray %6 %69 
                                              %73 = OpTypeArray %7 %69 
                                              %74 = OpTypeStruct %68 %68 %70 %71 %72 %73 
                                              %75 = OpTypePointer Uniform %74 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; f32_4[4];}* %76 = OpVariable Uniform 
                                          i32 %77 = OpConstant 0 
                                              %78 = OpTypePointer Uniform %68 
                                              %81 = OpTypeBool 
                                              %83 = OpTypePointer Function %42 
                                          i32 %94 = OpConstant 4 
                                              %95 = OpTypePointer Uniform %6 
                                         i32 %101 = OpConstant 2 
                                         f32 %105 = OpConstant 3.674022E-40 
                                Private f32* %111 = OpVariable Private 
                                         u32 %112 = OpConstant 1 
                                         i32 %115 = OpConstant 1 
                                         i32 %120 = OpConstant 3 
                                             %128 = OpTypeVector %81 2 
                                             %129 = OpTypePointer Private %128 
                             Private bool_2* %130 = OpVariable Private 
                                       f32_4 %131 = OpConstantComposite %47 %47 %47 %47 
                                             %134 = OpTypeVector %81 4 
                                             %137 = OpTypeVector %68 3 
                                             %138 = OpTypePointer Private %137 
                              Private i32_3* %139 = OpVariable Private 
                                             %140 = OpTypePointer Private %81 
                                       i32_3 %143 = OpConstantComposite %77 %115 %101 
                                         i32 %144 = OpConstant 8 
                                       i32_3 %145 = OpConstantComposite %120 %101 %144 
                                             %146 = OpTypeVector %81 3 
                                             %149 = OpTypePointer Private %68 
                                Private i32* %150 = OpVariable Private 
                                             %153 = OpTypePointer Function %68 
                              Private f32_4* %167 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %188 = OpConstant 3 
                              Private f32_4* %196 = OpVariable Private 
                                         u32 %223 = OpConstant 2 
                              Private f32_4* %234 = OpVariable Private 
                                             %267 = OpTypePointer Function %7 
                                             %277 = OpTypePointer Private %146 
                             Private bool_3* %278 = OpVariable Private 
                             Private bool_2* %287 = OpVariable Private 
                                             %296 = OpTypePointer Function %128 
                             Private bool_2* %313 = OpVariable Private 
                                Private f32* %335 = OpVariable Private 
                               Private bool* %359 = OpVariable Private 
                               Private bool* %369 = OpVariable Private 
                                             %402 = OpTypeVector %68 4 
                                       i32_4 %404 = OpConstantComposite %77 %77 %101 %77 
                               Private bool* %423 = OpVariable Private 
                                Private i32* %427 = OpVariable Private 
                               Private bool* %430 = OpVariable Private 
                                Private i32* %434 = OpVariable Private 
                               Private bool* %447 = OpVariable Private 
                               Private bool* %452 = OpVariable Private 
                                Private i32* %457 = OpVariable Private 
                                Private i32* %460 = OpVariable Private 
                                         f32 %487 = OpConstant 3.674022E-40 
                              Private f32_4* %490 = OpVariable Private 
                                         f32 %536 = OpConstant 3.674022E-40 
                                       f32_2 %537 = OpConstantComposite %536 %536 
                                Private f32* %560 = OpVariable Private 
                               Private bool* %591 = OpVariable Private 
                              Private f32_3* %608 = OpVariable Private 
                                Input f32_4* %610 = OpVariable Input 
                                Private f32* %614 = OpVariable Private 
                                       i32_4 %623 = OpConstantComposite %101 %94 %144 %77 
                              Private f32_3* %637 = OpVariable Private 
                                         i32 %639 = OpConstant 5 
                                             %641 = OpTypePointer Uniform %7 
                                Private f32* %646 = OpVariable Private 
                                Private f32* %666 = OpVariable Private 
                                Private f32* %690 = OpVariable Private 
                                Private f32* %698 = OpVariable Private 
                                Private f32* %706 = OpVariable Private 
                               Private bool* %738 = OpVariable Private 
                                             %745 = OpTypePointer Function %6 
        UniformConstant read_only Texture2D* %804 = OpVariable UniformConstant 
                    UniformConstant sampler* %806 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                               Private bool* %814 = OpVariable Private 
                                             %837 = OpTypePointer Output %7 
                               Output f32_4* %838 = OpVariable Output 
                                             %852 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %84 = OpVariable Function 
                               Function i32* %154 = OpVariable Function 
                             Function f32_4* %268 = OpVariable Function 
                            Function bool_2* %297 = OpVariable Function 
                            Function bool_2* %322 = OpVariable Function 
                               Function i32* %581 = OpVariable Function 
                               Function i32* %596 = OpVariable Function 
                               Function f32* %746 = OpVariable Function 
                               Function f32* %755 = OpVariable Function 
                               Function f32* %769 = OpVariable Function 
                               Function f32* %780 = OpVariable Function 
                             Function f32_3* %840 = OpVariable Function 
                                   Input f32* %15 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %16 = OpLoad %15 
                                          f32 %17 = OpDPdx %16 
                                 Private f32* %19 = OpAccessChain %9 %13 
                                                      OpStore %19 %17 
                                 Private f32* %21 = OpAccessChain %9 %13 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpExtInst %1 4 %22 
                                          f32 %24 = OpFDiv %20 %23 
                                 Private f32* %25 = OpAccessChain %9 %13 
                                                      OpStore %25 %24 
                          read_only Texture2D %30 = OpLoad %29 
                                      sampler %34 = OpLoad %33 
                   read_only Texture2DSampled %36 = OpSampledImage %30 %34 
                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
                                        f32_4 %41 = OpImageSampleImplicitLod %36 %40 
                                                      OpStore %26 %41 
                                        f32_4 %45 = OpLoad %26 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %49 = OpExtInst %1 40 %46 %48 
                                                      OpStore %44 %49 
                                        f32_3 %51 = OpLoad %44 
                                        f32_3 %52 = OpExtInst %1 30 %51 
                                                      OpStore %50 %52 
                                        f32_3 %53 = OpLoad %50 
                                        f32_3 %56 = OpFMul %53 %55 
                                                      OpStore %50 %56 
                                        f32_3 %57 = OpLoad %50 
                                        f32_3 %58 = OpExtInst %1 29 %57 
                                                      OpStore %50 %58 
                                        f32_3 %59 = OpLoad %50 
                                        f32_3 %62 = OpFMul %59 %61 
                                        f32_3 %65 = OpFAdd %62 %64 
                                                      OpStore %50 %65 
                                        f32_3 %66 = OpLoad %50 
                                        f32_3 %67 = OpExtInst %1 40 %66 %48 
                                                      OpStore %50 %67 
                                 Uniform i32* %79 = OpAccessChain %76 %77 
                                          i32 %80 = OpLoad %79 
                                         bool %82 = OpINotEqual %80 %77 
                                                      OpSelectionMerge %86 None 
                                                      OpBranchConditional %82 %85 %88 
                                              %85 = OpLabel 
                                        f32_3 %87 = OpLoad %50 
                                                      OpStore %84 %87 
                                                      OpBranch %86 
                                              %88 = OpLabel 
                                        f32_4 %89 = OpLoad %26 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                                      OpStore %84 %90 
                                                      OpBranch %86 
                                              %86 = OpLabel 
                                        f32_3 %91 = OpLoad %84 
                                                      OpStore %44 %91 
                                   Input f32* %92 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %96 = OpAccessChain %76 %94 %77 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                          f32 %99 = OpFAdd %93 %98 
                                Private f32* %100 = OpAccessChain %50 %13 
                                                      OpStore %100 %99 
                                Uniform f32* %102 = OpAccessChain %76 %94 %101 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFNegate %103 
                                         f32 %106 = OpFMul %104 %105 
                                Private f32* %107 = OpAccessChain %50 %13 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFAdd %106 %108 
                                Private f32* %110 = OpAccessChain %50 %13 
                                                      OpStore %110 %109 
                                  Input f32* %113 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %76 %94 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFNegate %117 
                                         f32 %119 = OpFAdd %114 %118 
                                                      OpStore %111 %119 
                                Uniform f32* %121 = OpAccessChain %76 %94 %120 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                         f32 %124 = OpFMul %123 %105 
                                         f32 %125 = OpLoad %111 
                                         f32 %126 = OpFAdd %124 %125 
                                Private f32* %127 = OpAccessChain %50 %112 
                                                      OpStore %127 %126 
                                       f32_3 %132 = OpLoad %50 
                                       f32_4 %133 = OpVectorShuffle %132 %132 0 1 0 0 
                                      bool_4 %135 = OpFOrdGreaterThanEqual %131 %133 
                                      bool_2 %136 = OpVectorShuffle %135 %135 0 1 
                                                      OpStore %130 %136 
                               Private bool* %141 = OpAccessChain %130 %112 
                                        bool %142 = OpLoad %141 
                                      bool_3 %147 = OpCompositeConstruct %142 %142 %142 
                                       i32_3 %148 = OpSelect %147 %143 %145 
                                                      OpStore %139 %148 
                               Private bool* %151 = OpAccessChain %130 %13 
                                        bool %152 = OpLoad %151 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %152 %155 %159 
                                             %155 = OpLabel 
                                Private i32* %157 = OpAccessChain %139 %13 
                                         i32 %158 = OpLoad %157 
                                                      OpStore %154 %158 
                                                      OpBranch %156 
                                             %159 = OpLabel 
                                Private i32* %160 = OpAccessChain %139 %112 
                                         i32 %161 = OpLoad %160 
                                                      OpStore %154 %161 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                         i32 %162 = OpLoad %154 
                                                      OpStore %150 %162 
                               Private bool* %163 = OpAccessChain %130 %13 
                                        bool %164 = OpLoad %163 
                                         i32 %165 = OpSelect %164 %115 %94 
                                Private i32* %166 = OpAccessChain %139 %13 
                                                      OpStore %166 %165 
                                Uniform f32* %168 = OpAccessChain %76 %94 %77 
                                         f32 %169 = OpLoad %168 
                                         i32 %170 = OpLoad %150 
                                Uniform f32* %171 = OpAccessChain %76 %101 %170 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFAdd %169 %172 
                                Private f32* %174 = OpAccessChain %167 %112 
                                                      OpStore %174 %173 
                                Uniform f32* %176 = OpAccessChain %76 %94 %115 
                                         f32 %177 = OpLoad %176 
                                         i32 %178 = OpLoad %150 
                                Uniform f32* %179 = OpAccessChain %76 %101 %178 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFAdd %177 %180 
                                Private f32* %182 = OpAccessChain %175 %112 
                                                      OpStore %182 %181 
                                Uniform f32* %183 = OpAccessChain %76 %120 %77 
                                         f32 %184 = OpLoad %183 
                                Uniform f32* %185 = OpAccessChain %76 %94 %77 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFAdd %184 %186 
                                Private f32* %189 = OpAccessChain %167 %188 
                                                      OpStore %189 %187 
                                Uniform f32* %190 = OpAccessChain %76 %120 %115 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %76 %94 %115 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFAdd %191 %193 
                                Private f32* %195 = OpAccessChain %175 %188 
                                                      OpStore %195 %194 
                                Uniform f32* %197 = OpAccessChain %76 %94 %77 
                                         f32 %198 = OpLoad %197 
                                Uniform f32* %199 = OpAccessChain %76 %94 %101 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFAdd %198 %200 
                                Private f32* %202 = OpAccessChain %196 %13 
                                                      OpStore %202 %201 
                                Private f32* %203 = OpAccessChain %196 %13 
                                         f32 %204 = OpLoad %203 
                                         i32 %205 = OpLoad %150 
                                Uniform f32* %206 = OpAccessChain %76 %101 %205 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFNegate %207 
                                         f32 %209 = OpFAdd %204 %208 
                                Private f32* %210 = OpAccessChain %196 %112 
                                                      OpStore %210 %209 
                                Private f32* %211 = OpAccessChain %196 %13 
                                         f32 %212 = OpLoad %211 
                                Uniform f32* %213 = OpAccessChain %76 %120 %101 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFNegate %214 
                                         f32 %216 = OpFAdd %212 %215 
                                Private f32* %217 = OpAccessChain %196 %188 
                                                      OpStore %217 %216 
                                Uniform f32* %218 = OpAccessChain %76 %94 %77 
                                         f32 %219 = OpLoad %218 
                                Private f32* %220 = OpAccessChain %167 %13 
                                                      OpStore %220 %219 
                                Uniform f32* %221 = OpAccessChain %76 %120 %77 
                                         f32 %222 = OpLoad %221 
                                Private f32* %224 = OpAccessChain %167 %223 
                                                      OpStore %224 %222 
                                Uniform f32* %225 = OpAccessChain %76 %120 %101 
                                         f32 %226 = OpLoad %225 
                                Private f32* %227 = OpAccessChain %196 %223 
                                                      OpStore %227 %226 
                               Private bool* %228 = OpAccessChain %130 %13 
                                        bool %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %167 
                                       f32_4 %231 = OpLoad %196 
                                      bool_4 %232 = OpCompositeConstruct %229 %229 %229 %229 
                                       f32_4 %233 = OpSelect %232 %230 %231 
                                                      OpStore %196 %233 
                                Uniform f32* %235 = OpAccessChain %76 %94 %115 
                                         f32 %236 = OpLoad %235 
                                Uniform f32* %237 = OpAccessChain %76 %94 %120 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFAdd %236 %238 
                                Private f32* %240 = OpAccessChain %234 %13 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %234 %13 
                                         f32 %242 = OpLoad %241 
                                         i32 %243 = OpLoad %150 
                                Uniform f32* %244 = OpAccessChain %76 %101 %243 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFNegate %245 
                                         f32 %247 = OpFAdd %242 %246 
                                Private f32* %248 = OpAccessChain %234 %112 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %234 %13 
                                         f32 %250 = OpLoad %249 
                                Uniform f32* %251 = OpAccessChain %76 %120 %120 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFNegate %252 
                                         f32 %254 = OpFAdd %250 %253 
                                Private f32* %255 = OpAccessChain %234 %188 
                                                      OpStore %255 %254 
                                Uniform f32* %256 = OpAccessChain %76 %94 %115 
                                         f32 %257 = OpLoad %256 
                                Private f32* %258 = OpAccessChain %175 %13 
                                                      OpStore %258 %257 
                                Uniform f32* %259 = OpAccessChain %76 %120 %115 
                                         f32 %260 = OpLoad %259 
                                Private f32* %261 = OpAccessChain %175 %223 
                                                      OpStore %261 %260 
                                Uniform f32* %262 = OpAccessChain %76 %120 %120 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %234 %223 
                                                      OpStore %264 %263 
                               Private bool* %265 = OpAccessChain %130 %112 
                                        bool %266 = OpLoad %265 
                                                      OpSelectionMerge %270 None 
                                                      OpBranchConditional %266 %269 %273 
                                             %269 = OpLabel 
                                       f32_4 %271 = OpLoad %175 
                                       f32_4 %272 = OpVectorShuffle %271 %271 1 0 2 3 
                                                      OpStore %268 %272 
                                                      OpBranch %270 
                                             %273 = OpLabel 
                                       f32_4 %274 = OpLoad %234 
                                       f32_4 %275 = OpVectorShuffle %274 %274 1 0 2 3 
                                                      OpStore %268 %275 
                                                      OpBranch %270 
                                             %270 = OpLabel 
                                       f32_4 %276 = OpLoad %268 
                                                      OpStore %234 %276 
                                       f32_4 %279 = OpLoad %196 
                                       f32_4 %280 = OpVectorShuffle %279 %279 1 3 1 1 
                                       f32_4 %281 = OpLoad vs_TEXCOORD2 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 0 0 0 
                                      bool_4 %283 = OpFOrdGreaterThanEqual %280 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                      bool_3 %285 = OpLoad %278 
                                      bool_3 %286 = OpVectorShuffle %285 %284 3 4 2 
                                                      OpStore %278 %286 
                                       f32_4 %288 = OpLoad vs_TEXCOORD2 
                                       f32_4 %289 = OpVectorShuffle %288 %288 0 0 0 0 
                                       f32_4 %290 = OpLoad %196 
                                       f32_4 %291 = OpVectorShuffle %290 %290 1 3 1 1 
                                      bool_4 %292 = OpFOrdGreaterThanEqual %289 %291 
                                      bool_2 %293 = OpVectorShuffle %292 %292 0 1 
                                                      OpStore %287 %293 
                               Private bool* %294 = OpAccessChain %130 %13 
                                        bool %295 = OpLoad %294 
                                                      OpSelectionMerge %299 None 
                                                      OpBranchConditional %295 %298 %302 
                                             %298 = OpLabel 
                                      bool_3 %300 = OpLoad %278 
                                      bool_2 %301 = OpVectorShuffle %300 %300 0 1 
                                                      OpStore %297 %301 
                                                      OpBranch %299 
                                             %302 = OpLabel 
                                      bool_2 %303 = OpLoad %287 
                                                      OpStore %297 %303 
                                                      OpBranch %299 
                                             %299 = OpLabel 
                                      bool_2 %304 = OpLoad %297 
                                      bool_3 %305 = OpLoad %278 
                                      bool_3 %306 = OpVectorShuffle %305 %304 3 4 2 
                                                      OpStore %278 %306 
                                       f32_4 %307 = OpLoad %234 
                                       f32_4 %308 = OpVectorShuffle %307 %307 0 3 0 0 
                                       f32_4 %309 = OpLoad vs_TEXCOORD2 
                                       f32_4 %310 = OpVectorShuffle %309 %309 1 1 1 1 
                                      bool_4 %311 = OpFOrdGreaterThanEqual %308 %310 
                                      bool_2 %312 = OpVectorShuffle %311 %311 0 1 
                                                      OpStore %287 %312 
                                       f32_4 %314 = OpLoad vs_TEXCOORD2 
                                       f32_4 %315 = OpVectorShuffle %314 %314 1 1 1 1 
                                       f32_4 %316 = OpLoad %234 
                                       f32_4 %317 = OpVectorShuffle %316 %316 0 3 0 0 
                                      bool_4 %318 = OpFOrdGreaterThanEqual %315 %317 
                                      bool_2 %319 = OpVectorShuffle %318 %318 0 1 
                                                      OpStore %313 %319 
                               Private bool* %320 = OpAccessChain %130 %112 
                                        bool %321 = OpLoad %320 
                                                      OpSelectionMerge %324 None 
                                                      OpBranchConditional %321 %323 %326 
                                             %323 = OpLabel 
                                      bool_2 %325 = OpLoad %287 
                                                      OpStore %322 %325 
                                                      OpBranch %324 
                                             %326 = OpLabel 
                                      bool_2 %327 = OpLoad %313 
                                                      OpStore %322 %327 
                                                      OpBranch %324 
                                             %324 = OpLabel 
                                      bool_2 %328 = OpLoad %322 
                                                      OpStore %130 %328 
                               Private bool* %329 = OpAccessChain %130 %13 
                                        bool %330 = OpLoad %329 
                               Private bool* %331 = OpAccessChain %278 %13 
                                        bool %332 = OpLoad %331 
                                        bool %333 = OpLogicalAnd %330 %332 
                               Private bool* %334 = OpAccessChain %130 %13 
                                                      OpStore %334 %333 
                                Uniform f32* %336 = OpAccessChain %76 %120 %77 
                                         f32 %337 = OpLoad %336 
                                Uniform f32* %338 = OpAccessChain %76 %120 %101 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFAdd %337 %339 
                                                      OpStore %335 %340 
                                         f32 %341 = OpLoad %335 
                                         f32 %342 = OpFNegate %341 
                                Uniform f32* %343 = OpAccessChain %76 %94 %101 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFAdd %342 %344 
                                                      OpStore %335 %345 
                                Uniform f32* %346 = OpAccessChain %76 %120 %115 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %348 = OpAccessChain %76 %120 %120 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFAdd %347 %349 
                                Private f32* %351 = OpAccessChain %167 %13 
                                                      OpStore %351 %350 
                                Private f32* %352 = OpAccessChain %167 %13 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpFNegate %353 
                                Uniform f32* %355 = OpAccessChain %76 %94 %120 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFAdd %354 %356 
                                Private f32* %358 = OpAccessChain %167 %13 
                                                      OpStore %358 %357 
                                  Input f32* %360 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %361 = OpLoad %360 
                                Private f32* %362 = OpAccessChain %167 %188 
                                         f32 %363 = OpLoad %362 
                                        bool %364 = OpFOrdGreaterThanEqual %361 %363 
                                                      OpStore %359 %364 
                                         f32 %365 = OpLoad %335 
                                Private f32* %366 = OpAccessChain %167 %188 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFAdd %365 %367 
                                                      OpStore %335 %368 
                                         f32 %370 = OpLoad %335 
                                  Input f32* %371 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %372 = OpLoad %371 
                                        bool %373 = OpFOrdGreaterThanEqual %370 %372 
                                                      OpStore %369 %373 
                                        bool %374 = OpLoad %369 
                                        bool %375 = OpLoad %359 
                                        bool %376 = OpLogicalAnd %374 %375 
                                                      OpStore %369 %376 
                                  Input f32* %377 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %378 = OpLoad %377 
                                Private f32* %379 = OpAccessChain %175 %188 
                                         f32 %380 = OpLoad %379 
                                        bool %381 = OpFOrdGreaterThanEqual %378 %380 
                                                      OpStore %359 %381 
                                        bool %382 = OpLoad %369 
                                        bool %383 = OpLoad %359 
                                        bool %384 = OpLogicalAnd %382 %383 
                                                      OpStore %369 %384 
                                Private f32* %385 = OpAccessChain %167 %13 
                                         f32 %386 = OpLoad %385 
                                Private f32* %387 = OpAccessChain %175 %188 
                                         f32 %388 = OpLoad %387 
                                         f32 %389 = OpFAdd %386 %388 
                                Private f32* %390 = OpAccessChain %167 %13 
                                                      OpStore %390 %389 
                                Private f32* %391 = OpAccessChain %167 %13 
                                         f32 %392 = OpLoad %391 
                                  Input f32* %393 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %394 = OpLoad %393 
                                        bool %395 = OpFOrdGreaterThanEqual %392 %394 
                               Private bool* %396 = OpAccessChain %278 %13 
                                                      OpStore %396 %395 
                                        bool %397 = OpLoad %369 
                               Private bool* %398 = OpAccessChain %278 %13 
                                        bool %399 = OpLoad %398 
                                        bool %400 = OpLogicalAnd %397 %399 
                                                      OpStore %369 %400 
                                         i32 %401 = OpLoad %150 
                                       i32_4 %403 = OpCompositeConstruct %401 %401 %401 %401 
                                      bool_4 %405 = OpIEqual %403 %404 
                                      bool_2 %406 = OpVectorShuffle %405 %405 0 2 
                                      bool_3 %407 = OpLoad %278 
                                      bool_3 %408 = OpVectorShuffle %407 %406 3 1 4 
                                                      OpStore %278 %408 
                               Private bool* %409 = OpAccessChain %278 %223 
                                        bool %410 = OpLoad %409 
                               Private bool* %411 = OpAccessChain %278 %13 
                                        bool %412 = OpLoad %411 
                                        bool %413 = OpLogicalOr %410 %412 
                               Private bool* %414 = OpAccessChain %278 %13 
                                                      OpStore %414 %413 
                                         i32 %415 = OpLoad %150 
                                Uniform f32* %416 = OpAccessChain %76 %101 %415 
                                         f32 %417 = OpLoad %416 
                                        bool %418 = OpFOrdLessThan %47 %417 
                                                      OpStore %359 %418 
                               Private bool* %419 = OpAccessChain %130 %13 
                                        bool %420 = OpLoad %419 
                                        bool %421 = OpLoad %359 
                                        bool %422 = OpLogicalAnd %420 %421 
                                                      OpStore %359 %422 
                                Private f32* %424 = OpAccessChain %196 %223 
                                         f32 %425 = OpLoad %424 
                                        bool %426 = OpFOrdLessThan %47 %425 
                                                      OpStore %423 %426 
                                        bool %428 = OpLoad %423 
                                         i32 %429 = OpSelect %428 %115 %77 
                                                      OpStore %427 %429 
                                Private f32* %431 = OpAccessChain %234 %223 
                                         f32 %432 = OpLoad %431 
                                        bool %433 = OpFOrdLessThan %47 %432 
                                                      OpStore %430 %433 
                                        bool %435 = OpLoad %430 
                                         i32 %436 = OpSelect %435 %115 %77 
                                                      OpStore %434 %436 
                                Private i32* %437 = OpAccessChain %139 %223 
                                         i32 %438 = OpLoad %437 
                                         i32 %439 = OpLoad %434 
                                         i32 %440 = OpIMul %438 %439 
                                                      OpStore %434 %440 
                                         i32 %441 = OpLoad %427 
                                Private i32* %442 = OpAccessChain %139 %13 
                                         i32 %443 = OpLoad %442 
                                         i32 %444 = OpIMul %441 %443 
                                         i32 %445 = OpLoad %434 
                                         i32 %446 = OpIAdd %444 %445 
                                                      OpStore %427 %446 
                               Private bool* %448 = OpAccessChain %278 %112 
                                        bool %449 = OpLoad %448 
                                        bool %450 = OpLoad %423 
                                        bool %451 = OpLogicalAnd %449 %450 
                                                      OpStore %447 %451 
                               Private bool* %453 = OpAccessChain %130 %112 
                                        bool %454 = OpLoad %453 
                                        bool %455 = OpLoad %430 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %452 %456 
                                        bool %458 = OpLoad %447 
                                         i32 %459 = OpSelect %458 %115 %77 
                                                      OpStore %457 %459 
                                        bool %461 = OpLoad %452 
                                         i32 %462 = OpSelect %461 %115 %77 
                                                      OpStore %460 %462 
                                Private i32* %463 = OpAccessChain %139 %223 
                                         i32 %464 = OpLoad %463 
                                         i32 %465 = OpLoad %460 
                                         i32 %466 = OpIMul %464 %465 
                                                      OpStore %460 %466 
                                         i32 %467 = OpLoad %457 
                                Private i32* %468 = OpAccessChain %139 %13 
                                         i32 %469 = OpLoad %468 
                                         i32 %470 = OpIMul %467 %469 
                                         i32 %471 = OpLoad %460 
                                         i32 %472 = OpIAdd %470 %471 
                                                      OpStore %460 %472 
                                        bool %473 = OpLoad %369 
                                         i32 %474 = OpLoad %460 
                                         i32 %475 = OpSelect %473 %77 %474 
                                                      OpStore %460 %475 
                                        bool %476 = OpLoad %359 
                                         i32 %477 = OpLoad %427 
                                         i32 %478 = OpLoad %460 
                                         i32 %479 = OpSelect %476 %477 %478 
                                                      OpStore %460 %479 
                                Private i32* %480 = OpAccessChain %139 %223 
                                         i32 %481 = OpLoad %480 
                                Private i32* %482 = OpAccessChain %139 %13 
                                         i32 %483 = OpLoad %482 
                                         i32 %484 = OpIAdd %481 %483 
                                                      OpStore %457 %484 
                               Private bool* %485 = OpAccessChain %278 %13 
                                        bool %486 = OpLoad %485 
                                         f32 %488 = OpSelect %486 %20 %487 
                                Private f32* %489 = OpAccessChain %167 %13 
                                                      OpStore %489 %488 
                                       f32_4 %491 = OpLoad %196 
                                       f32_2 %492 = OpVectorShuffle %491 %491 3 1 
                                       f32_4 %493 = OpLoad %490 
                                       f32_4 %494 = OpVectorShuffle %493 %492 4 1 5 3 
                                                      OpStore %490 %494 
                                       f32_4 %495 = OpLoad %234 
                                       f32_2 %496 = OpVectorShuffle %495 %495 3 0 
                                       f32_4 %497 = OpLoad %490 
                                       f32_4 %498 = OpVectorShuffle %497 %496 0 4 2 5 
                                                      OpStore %490 %498 
                                Private f32* %499 = OpAccessChain %196 %13 
                                         f32 %500 = OpLoad %499 
                                Private f32* %501 = OpAccessChain %234 %13 
                                                      OpStore %501 %500 
                                       f32_4 %502 = OpLoad %490 
                                       f32_2 %503 = OpVectorShuffle %502 %502 1 0 
                                       f32_2 %504 = OpFNegate %503 
                                       f32_4 %505 = OpLoad %234 
                                       f32_2 %506 = OpVectorShuffle %505 %505 1 0 
                                       f32_2 %507 = OpFAdd %504 %506 
                                       f32_4 %508 = OpLoad %175 
                                       f32_4 %509 = OpVectorShuffle %508 %507 4 1 5 3 
                                                      OpStore %175 %509 
                                       f32_4 %510 = OpLoad %167 
                                       f32_2 %511 = OpVectorShuffle %510 %510 0 0 
                                       f32_4 %512 = OpLoad %175 
                                       f32_2 %513 = OpVectorShuffle %512 %512 0 2 
                                       f32_2 %514 = OpFMul %511 %513 
                                       f32_4 %515 = OpLoad %167 
                                       f32_4 %516 = OpVectorShuffle %515 %514 4 1 5 3 
                                                      OpStore %167 %516 
                                       f32_4 %517 = OpLoad %167 
                                       f32_2 %518 = OpVectorShuffle %517 %517 0 2 
                                       f32_4 %519 = OpLoad %167 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 2 
                                         f32 %521 = OpDot %518 %520 
                                Private f32* %522 = OpAccessChain %175 %13 
                                                      OpStore %522 %521 
                                Private f32* %523 = OpAccessChain %175 %13 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpExtInst %1 32 %524 
                                Private f32* %526 = OpAccessChain %175 %13 
                                                      OpStore %526 %525 
                                       f32_4 %527 = OpLoad %167 
                                       f32_2 %528 = OpVectorShuffle %527 %527 0 2 
                                       f32_4 %529 = OpLoad %175 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 0 
                                       f32_2 %531 = OpFMul %528 %530 
                                       f32_4 %532 = OpLoad %167 
                                       f32_4 %533 = OpVectorShuffle %532 %531 4 1 5 3 
                                                      OpStore %167 %533 
                                       f32_4 %534 = OpLoad %167 
                                       f32_2 %535 = OpVectorShuffle %534 %534 0 2 
                                       f32_2 %538 = OpFMul %535 %537 
                                       f32_4 %539 = OpLoad %234 
                                       f32_2 %540 = OpVectorShuffle %539 %539 1 0 
                                       f32_2 %541 = OpFAdd %538 %540 
                                       f32_4 %542 = OpLoad %167 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 1 5 3 
                                                      OpStore %167 %543 
                                       f32_4 %544 = OpLoad %167 
                                       f32_2 %545 = OpVectorShuffle %544 %544 2 0 
                                       f32_2 %546 = OpFNegate %545 
                                       f32_4 %547 = OpLoad %234 
                                       f32_2 %548 = OpVectorShuffle %547 %547 0 1 
                                       f32_2 %549 = OpFAdd %546 %548 
                                       f32_4 %550 = OpLoad %175 
                                       f32_4 %551 = OpVectorShuffle %550 %549 4 1 5 3 
                                                      OpStore %175 %551 
                                       f32_4 %552 = OpLoad %167 
                                       f32_2 %553 = OpVectorShuffle %552 %552 0 2 
                                       f32_2 %554 = OpFNegate %553 
                                       f32_4 %555 = OpLoad vs_TEXCOORD2 
                                       f32_2 %556 = OpVectorShuffle %555 %555 1 0 
                                       f32_2 %557 = OpFAdd %554 %556 
                                       f32_4 %558 = OpLoad %167 
                                       f32_4 %559 = OpVectorShuffle %558 %557 4 1 5 3 
                                                      OpStore %167 %559 
                                Private f32* %561 = OpAccessChain %167 %223 
                                         f32 %562 = OpLoad %561 
                                Private f32* %563 = OpAccessChain %175 %223 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpFMul %562 %564 
                                                      OpStore %560 %565 
                                Private f32* %566 = OpAccessChain %175 %13 
                                         f32 %567 = OpLoad %566 
                                Private f32* %568 = OpAccessChain %167 %13 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFMul %567 %569 
                                         f32 %571 = OpLoad %560 
                                         f32 %572 = OpFNegate %571 
                                         f32 %573 = OpFAdd %570 %572 
                                Private f32* %574 = OpAccessChain %167 %13 
                                                      OpStore %574 %573 
                                Private f32* %575 = OpAccessChain %167 %13 
                                         f32 %576 = OpLoad %575 
                                        bool %577 = OpFOrdGreaterThanEqual %576 %47 
                               Private bool* %578 = OpAccessChain %278 %13 
                                                      OpStore %578 %577 
                               Private bool* %579 = OpAccessChain %278 %13 
                                        bool %580 = OpLoad %579 
                                                      OpSelectionMerge %583 None 
                                                      OpBranchConditional %580 %582 %586 
                                             %582 = OpLabel 
                                Private i32* %584 = OpAccessChain %139 %13 
                                         i32 %585 = OpLoad %584 
                                                      OpStore %581 %585 
                                                      OpBranch %583 
                                             %586 = OpLabel 
                                Private i32* %587 = OpAccessChain %139 %223 
                                         i32 %588 = OpLoad %587 
                                                      OpStore %581 %588 
                                                      OpBranch %583 
                                             %583 = OpLabel 
                                         i32 %589 = OpLoad %581 
                                Private i32* %590 = OpAccessChain %139 %13 
                                                      OpStore %590 %589 
                                         i32 %592 = OpLoad %460 
                                         i32 %593 = OpLoad %457 
                                        bool %594 = OpINotEqual %592 %593 
                                                      OpStore %591 %594 
                                        bool %595 = OpLoad %591 
                                                      OpSelectionMerge %598 None 
                                                      OpBranchConditional %595 %597 %600 
                                             %597 = OpLabel 
                                         i32 %599 = OpLoad %460 
                                                      OpStore %596 %599 
                                                      OpBranch %598 
                                             %600 = OpLabel 
                                Private i32* %601 = OpAccessChain %139 %13 
                                         i32 %602 = OpLoad %601 
                                                      OpStore %596 %602 
                                                      OpBranch %598 
                                             %598 = OpLabel 
                                         i32 %603 = OpLoad %596 
                                                      OpStore %460 %603 
                                         i32 %604 = OpLoad %460 
                                        bool %605 = OpIEqual %604 %77 
                                                      OpSelectionMerge %607 None 
                                                      OpBranchConditional %605 %606 %620 
                                             %606 = OpLabel 
                                       f32_3 %609 = OpLoad %44 
                                       f32_4 %611 = OpLoad %610 
                                       f32_3 %612 = OpVectorShuffle %611 %611 0 1 2 
                                       f32_3 %613 = OpFMul %609 %612 
                                                      OpStore %608 %613 
                                Private f32* %615 = OpAccessChain %26 %188 
                                         f32 %616 = OpLoad %615 
                                  Input f32* %617 = OpAccessChain %610 %188 
                                         f32 %618 = OpLoad %617 
                                         f32 %619 = OpFMul %616 %618 
                                                      OpStore %614 %619 
                                                      OpBranch %607 
                                             %620 = OpLabel 
                                         i32 %621 = OpLoad %460 
                                       i32_4 %622 = OpCompositeConstruct %621 %621 %621 %621 
                                      bool_4 %624 = OpIEqual %622 %623 
                                      bool_3 %625 = OpVectorShuffle %624 %624 0 1 2 
                                                      OpStore %278 %625 
                               Private bool* %626 = OpAccessChain %278 %223 
                                        bool %627 = OpLoad %626 
                                         i32 %628 = OpSelect %627 %120 %77 
                                                      OpStore %460 %628 
                               Private bool* %629 = OpAccessChain %278 %112 
                                        bool %630 = OpLoad %629 
                                         i32 %631 = OpLoad %460 
                                         i32 %632 = OpSelect %630 %101 %631 
                                                      OpStore %460 %632 
                               Private bool* %633 = OpAccessChain %278 %13 
                                        bool %634 = OpLoad %633 
                                         i32 %635 = OpLoad %460 
                                         i32 %636 = OpSelect %634 %115 %635 
                                                      OpStore %460 %636 
                                       f32_3 %638 = OpLoad %44 
                                         i32 %640 = OpLoad %460 
                              Uniform f32_4* %642 = OpAccessChain %76 %639 %640 
                                       f32_4 %643 = OpLoad %642 
                                       f32_3 %644 = OpVectorShuffle %643 %643 0 1 2 
                                       f32_3 %645 = OpFMul %638 %644 
                                                      OpStore %637 %645 
                                Private f32* %647 = OpAccessChain %26 %188 
                                         f32 %648 = OpLoad %647 
                                         i32 %649 = OpLoad %460 
                                Uniform f32* %650 = OpAccessChain %76 %639 %649 %188 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %648 %651 
                                                      OpStore %646 %652 
                                       f32_3 %653 = OpLoad %637 
                                                      OpStore %608 %653 
                                         f32 %654 = OpLoad %646 
                                                      OpStore %614 %654 
                                                      OpBranch %607 
                                             %607 = OpLabel 
                                        bool %655 = OpLoad %423 
                                        bool %656 = OpLoad %430 
                                        bool %657 = OpLogicalOr %655 %656 
                                                      OpStore %452 %657 
                                       f32_4 %658 = OpLoad %490 
                                       f32_2 %659 = OpVectorShuffle %658 %658 2 3 
                                       f32_2 %660 = OpFNegate %659 
                                       f32_4 %661 = OpLoad vs_TEXCOORD2 
                                       f32_2 %662 = OpVectorShuffle %661 %661 0 1 
                                       f32_2 %663 = OpFAdd %660 %662 
                                       f32_4 %664 = OpLoad %167 
                                       f32_4 %665 = OpVectorShuffle %664 %663 4 5 2 3 
                                                      OpStore %167 %665 
                                       f32_4 %667 = OpLoad %167 
                                       f32_2 %668 = OpVectorShuffle %667 %667 0 1 
                                       f32_4 %669 = OpLoad %167 
                                       f32_2 %670 = OpVectorShuffle %669 %669 0 1 
                                         f32 %671 = OpDot %668 %670 
                                                      OpStore %666 %671 
                                         f32 %672 = OpLoad %666 
                                         f32 %673 = OpExtInst %1 31 %672 
                                                      OpStore %666 %673 
                                         f32 %674 = OpLoad %666 
                                         i32 %675 = OpLoad %150 
                                Uniform f32* %676 = OpAccessChain %76 %101 %675 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFNegate %677 
                                         f32 %679 = OpFAdd %674 %678 
                                                      OpStore %666 %679 
                                         f32 %680 = OpLoad %666 
                                Private f32* %681 = OpAccessChain %9 %13 
                                         f32 %682 = OpLoad %681 
                                         f32 %683 = OpFMul %680 %682 
                                         f32 %684 = OpFAdd %683 %105 
                                                      OpStore %666 %684 
                                         f32 %685 = OpLoad %666 
                                         f32 %686 = OpExtInst %1 43 %685 %47 %20 
                                                      OpStore %666 %686 
                                        bool %687 = OpLoad %452 
                                         f32 %688 = OpLoad %666 
                                         f32 %689 = OpSelect %687 %688 %47 
                                                      OpStore %666 %689 
                                Private f32* %691 = OpAccessChain %196 %223 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpFNegate %692 
                                         i32 %694 = OpLoad %150 
                                Uniform f32* %695 = OpAccessChain %76 %101 %694 
                                         f32 %696 = OpLoad %695 
                                         f32 %697 = OpFAdd %693 %696 
                                                      OpStore %690 %697 
                                Private f32* %699 = OpAccessChain %234 %223 
                                         f32 %700 = OpLoad %699 
                                         f32 %701 = OpFNegate %700 
                                         i32 %702 = OpLoad %150 
                                Uniform f32* %703 = OpAccessChain %76 %101 %702 
                                         f32 %704 = OpLoad %703 
                                         f32 %705 = OpFAdd %701 %704 
                                                      OpStore %698 %705 
                                         f32 %707 = OpLoad %690 
                                         f32 %708 = OpLoad %698 
                                         f32 %709 = OpFDiv %707 %708 
                                                      OpStore %706 %709 
                                         f32 %710 = OpLoad %706 
                                Private f32* %711 = OpAccessChain %167 %112 
                                         f32 %712 = OpLoad %711 
                                         f32 %713 = OpFMul %710 %712 
                                Private f32* %714 = OpAccessChain %167 %223 
                                                      OpStore %714 %713 
                                       f32_4 %715 = OpLoad %167 
                                       f32_2 %716 = OpVectorShuffle %715 %715 0 2 
                                       f32_4 %717 = OpLoad %167 
                                       f32_2 %718 = OpVectorShuffle %717 %717 0 2 
                                         f32 %719 = OpDot %716 %718 
                                                      OpStore %706 %719 
                                         f32 %720 = OpLoad %706 
                                         f32 %721 = OpExtInst %1 31 %720 
                                                      OpStore %706 %721 
                                         f32 %722 = OpLoad %690 
                                         f32 %723 = OpFNegate %722 
                                         f32 %724 = OpLoad %706 
                                         f32 %725 = OpFAdd %723 %724 
                                                      OpStore %706 %725 
                                         f32 %726 = OpLoad %706 
                                Private f32* %727 = OpAccessChain %9 %13 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFMul %726 %728 
                                         f32 %730 = OpFAdd %729 %105 
                                Private f32* %731 = OpAccessChain %9 %13 
                                                      OpStore %731 %730 
                                Private f32* %732 = OpAccessChain %9 %13 
                                         f32 %733 = OpLoad %732 
                                         f32 %734 = OpExtInst %1 43 %733 %47 %20 
                                Private f32* %735 = OpAccessChain %9 %13 
                                                      OpStore %735 %734 
                                         f32 %736 = OpLoad %690 
                                        bool %737 = OpFOrdLessThan %47 %736 
                                                      OpStore %591 %737 
                                         f32 %739 = OpLoad %698 
                                        bool %740 = OpFOrdLessThan %47 %739 
                                                      OpStore %738 %740 
                                        bool %741 = OpLoad %738 
                                        bool %742 = OpLoad %591 
                                        bool %743 = OpLogicalAnd %741 %742 
                                                      OpStore %738 %743 
                                        bool %744 = OpLoad %738 
                                                      OpSelectionMerge %748 None 
                                                      OpBranchConditional %744 %747 %751 
                                             %747 = OpLabel 
                                Private f32* %749 = OpAccessChain %9 %13 
                                         f32 %750 = OpLoad %749 
                                                      OpStore %746 %750 
                                                      OpBranch %748 
                                             %751 = OpLabel 
                                                      OpStore %746 %20 
                                                      OpBranch %748 
                                             %748 = OpLabel 
                                         f32 %752 = OpLoad %746 
                                Private f32* %753 = OpAccessChain %9 %13 
                                                      OpStore %753 %752 
                                        bool %754 = OpLoad %452 
                                                      OpSelectionMerge %757 None 
                                                      OpBranchConditional %754 %756 %760 
                                             %756 = OpLabel 
                                Private f32* %758 = OpAccessChain %9 %13 
                                         f32 %759 = OpLoad %758 
                                                      OpStore %755 %759 
                                                      OpBranch %757 
                                             %760 = OpLabel 
                                                      OpStore %755 %47 
                                                      OpBranch %757 
                                             %757 = OpLabel 
                                         f32 %761 = OpLoad %755 
                                Private f32* %762 = OpAccessChain %9 %13 
                                                      OpStore %762 %761 
                                         f32 %763 = OpLoad %666 
                                        bool %764 = OpFOrdEqual %763 %47 
                                                      OpStore %452 %764 
                                         f32 %765 = OpLoad %666 
                                         f32 %766 = OpFNegate %765 
                                         f32 %767 = OpFAdd %766 %20 
                                                      OpStore %698 %767 
                                        bool %768 = OpLoad %452 
                                                      OpSelectionMerge %771 None 
                                                      OpBranchConditional %768 %770 %774 
                                             %770 = OpLabel 
                                Private f32* %772 = OpAccessChain %9 %13 
                                         f32 %773 = OpLoad %772 
                                                      OpStore %769 %773 
                                                      OpBranch %771 
                                             %774 = OpLabel 
                                         f32 %775 = OpLoad %698 
                                                      OpStore %769 %775 
                                                      OpBranch %771 
                                             %771 = OpLabel 
                                         f32 %776 = OpLoad %769 
                                Private f32* %777 = OpAccessChain %9 %13 
                                                      OpStore %777 %776 
                               Private bool* %778 = OpAccessChain %130 %13 
                                        bool %779 = OpLoad %778 
                                                      OpSelectionMerge %782 None 
                                                      OpBranchConditional %779 %781 %785 
                                             %781 = OpLabel 
                                Private f32* %783 = OpAccessChain %9 %13 
                                         f32 %784 = OpLoad %783 
                                                      OpStore %780 %784 
                                                      OpBranch %782 
                                             %785 = OpLabel 
                                                      OpStore %780 %20 
                                                      OpBranch %782 
                                             %782 = OpLabel 
                                         f32 %786 = OpLoad %780 
                                Private f32* %787 = OpAccessChain %9 %13 
                                                      OpStore %787 %786 
                                Private f32* %788 = OpAccessChain %9 %13 
                                         f32 %789 = OpLoad %788 
                                         f32 %790 = OpLoad %614 
                                         f32 %791 = OpFMul %789 %790 
                                                      OpStore %111 %791 
                                        bool %792 = OpLoad %369 
                                         f32 %793 = OpSelect %792 %47 %20 
                                                      OpStore %698 %793 
                               Private bool* %794 = OpAccessChain %130 %13 
                                        bool %795 = OpLoad %794 
                                         f32 %796 = OpLoad %698 
                                         f32 %797 = OpSelect %795 %20 %796 
                                Private f32* %798 = OpAccessChain %50 %13 
                                                      OpStore %798 %797 
                                Private f32* %799 = OpAccessChain %50 %13 
                                         f32 %800 = OpLoad %799 
                                         f32 %801 = OpLoad %111 
                                         f32 %802 = OpFMul %800 %801 
                                Private f32* %803 = OpAccessChain %9 %223 
                                                      OpStore %803 %802 
                         read_only Texture2D %805 = OpLoad %804 
                                     sampler %807 = OpLoad %806 
                  read_only Texture2DSampled %808 = OpSampledImage %805 %807 
                                       f32_2 %810 = OpLoad vs_TEXCOORD1 
                                       f32_4 %811 = OpImageSampleImplicitLod %808 %810 
                                         f32 %812 = OpCompositeExtract %811 3 
                                Private f32* %813 = OpAccessChain %50 %223 
                                                      OpStore %813 %812 
                                Uniform i32* %815 = OpAccessChain %76 %115 
                                         i32 %816 = OpLoad %815 
                                        bool %817 = OpINotEqual %816 %639 
                                                      OpStore %814 %817 
                                       f32_3 %818 = OpLoad %50 
                                       f32_2 %819 = OpVectorShuffle %818 %818 0 2 
                                       f32_4 %820 = OpLoad %9 
                                       f32_2 %821 = OpVectorShuffle %820 %820 0 2 
                                       f32_2 %822 = OpFMul %819 %821 
                                       f32_4 %823 = OpLoad %9 
                                       f32_4 %824 = OpVectorShuffle %823 %822 4 1 5 3 
                                                      OpStore %9 %824 
                                Private f32* %825 = OpAccessChain %50 %223 
                                         f32 %826 = OpLoad %825 
                                Private f32* %827 = OpAccessChain %9 %13 
                                         f32 %828 = OpLoad %827 
                                         f32 %829 = OpFMul %826 %828 
                                Private f32* %830 = OpAccessChain %9 %13 
                                                      OpStore %830 %829 
                                       f32_4 %831 = OpLoad %9 
                                       f32_3 %832 = OpVectorShuffle %831 %831 0 0 0 
                                       f32_3 %833 = OpLoad %608 
                                       f32_3 %834 = OpFMul %832 %833 
                                       f32_4 %835 = OpLoad %9 
                                       f32_4 %836 = OpVectorShuffle %835 %834 4 5 2 6 
                                                      OpStore %9 %836 
                                        bool %839 = OpLoad %814 
                                                      OpSelectionMerge %842 None 
                                                      OpBranchConditional %839 %841 %845 
                                             %841 = OpLabel 
                                       f32_4 %843 = OpLoad %9 
                                       f32_3 %844 = OpVectorShuffle %843 %843 0 1 3 
                                                      OpStore %840 %844 
                                                      OpBranch %842 
                                             %845 = OpLabel 
                                       f32_3 %846 = OpLoad %608 
                                                      OpStore %840 %846 
                                                      OpBranch %842 
                                             %842 = OpLabel 
                                       f32_3 %847 = OpLoad %840 
                                       f32_4 %848 = OpLoad %838 
                                       f32_4 %849 = OpVectorShuffle %848 %847 4 5 6 3 
                                                      OpStore %838 %849 
                                Private f32* %850 = OpAccessChain %9 %223 
                                         f32 %851 = OpLoad %850 
                                 Output f32* %853 = OpAccessChain %838 %188 
                                                      OpStore %853 %851 
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
; Bound: 855
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %39 %610 %809 %838 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpDecorate vs_TEXCOORD2 Location 11 
                                                      OpDecorate %26 RelaxedPrecision 
                                                      OpDecorate %29 RelaxedPrecision 
                                                      OpDecorate %29 DescriptorSet 29 
                                                      OpDecorate %29 Binding 29 
                                                      OpDecorate %30 RelaxedPrecision 
                                                      OpDecorate %33 RelaxedPrecision 
                                                      OpDecorate %33 DescriptorSet 33 
                                                      OpDecorate %33 Binding 33 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 39 
                                                      OpDecorate %44 RelaxedPrecision 
                                                      OpDecorate %45 RelaxedPrecision 
                                                      OpDecorate %46 RelaxedPrecision 
                                                      OpDecorate %49 RelaxedPrecision 
                                                      OpDecorate %51 RelaxedPrecision 
                                                      OpDecorate %52 RelaxedPrecision 
                                                      OpDecorate %70 ArrayStride 70 
                                                      OpDecorate %71 ArrayStride 71 
                                                      OpDecorate %72 ArrayStride 72 
                                                      OpDecorate %73 ArrayStride 73 
                                                      OpMemberDecorate %74 0 Offset 74 
                                                      OpMemberDecorate %74 1 Offset 74 
                                                      OpMemberDecorate %74 2 Offset 74 
                                                      OpMemberDecorate %74 3 Offset 74 
                                                      OpMemberDecorate %74 4 Offset 74 
                                                      OpMemberDecorate %74 5 Offset 74 
                                                      OpDecorate %74 Block 
                                                      OpDecorate %76 DescriptorSet 76 
                                                      OpDecorate %76 Binding 76 
                                                      OpDecorate %89 RelaxedPrecision 
                                                      OpDecorate %90 RelaxedPrecision 
                                                      OpDecorate %608 RelaxedPrecision 
                                                      OpDecorate %609 RelaxedPrecision 
                                                      OpDecorate %610 RelaxedPrecision 
                                                      OpDecorate %610 Location 610 
                                                      OpDecorate %611 RelaxedPrecision 
                                                      OpDecorate %612 RelaxedPrecision 
                                                      OpDecorate %613 RelaxedPrecision 
                                                      OpDecorate %614 RelaxedPrecision 
                                                      OpDecorate %616 RelaxedPrecision 
                                                      OpDecorate %618 RelaxedPrecision 
                                                      OpDecorate %619 RelaxedPrecision 
                                                      OpDecorate %638 RelaxedPrecision 
                                                      OpDecorate %648 RelaxedPrecision 
                                                      OpDecorate %790 RelaxedPrecision 
                                                      OpDecorate %804 RelaxedPrecision 
                                                      OpDecorate %804 DescriptorSet 804 
                                                      OpDecorate %804 Binding 804 
                                                      OpDecorate %805 RelaxedPrecision 
                                                      OpDecorate %806 RelaxedPrecision 
                                                      OpDecorate %806 DescriptorSet 806 
                                                      OpDecorate %806 Binding 806 
                                                      OpDecorate %807 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Location 809 
                                                      OpDecorate %833 RelaxedPrecision 
                                                      OpDecorate %838 RelaxedPrecision 
                                                      OpDecorate %838 Location 838 
                                                      OpDecorate %846 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                        Input f32_4* vs_TEXCOORD2 = OpVariable Input 
                                              %12 = OpTypeInt 32 0 
                                          u32 %13 = OpConstant 0 
                                              %14 = OpTypePointer Input %6 
                                              %18 = OpTypePointer Private %6 
                                          f32 %20 = OpConstant 3.674022E-40 
                               Private f32_4* %26 = OpVariable Private 
                                              %27 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                              %28 = OpTypePointer UniformConstant %27 
         UniformConstant read_only Texture2D* %29 = OpVariable UniformConstant 
                                              %31 = OpTypeSampler 
                                              %32 = OpTypePointer UniformConstant %31 
                     UniformConstant sampler* %33 = OpVariable UniformConstant 
                                              %35 = OpTypeSampledImage %27 
                                              %37 = OpTypeVector %6 2 
                                              %38 = OpTypePointer Input %37 
                        Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                                              %42 = OpTypeVector %6 3 
                                              %43 = OpTypePointer Private %42 
                               Private f32_3* %44 = OpVariable Private 
                                          f32 %47 = OpConstant 3.674022E-40 
                                        f32_3 %48 = OpConstantComposite %47 %47 %47 
                               Private f32_3* %50 = OpVariable Private 
                                          f32 %54 = OpConstant 3.674022E-40 
                                        f32_3 %55 = OpConstantComposite %54 %54 %54 
                                          f32 %60 = OpConstant 3.674022E-40 
                                        f32_3 %61 = OpConstantComposite %60 %60 %60 
                                          f32 %63 = OpConstant 3.674022E-40 
                                        f32_3 %64 = OpConstantComposite %63 %63 %63 
                                              %68 = OpTypeInt 32 1 
                                          u32 %69 = OpConstant 4 
                                              %70 = OpTypeArray %6 %69 
                                              %71 = OpTypeArray %6 %69 
                                              %72 = OpTypeArray %6 %69 
                                              %73 = OpTypeArray %7 %69 
                                              %74 = OpTypeStruct %68 %68 %70 %71 %72 %73 
                                              %75 = OpTypePointer Uniform %74 
Uniform struct {i32; i32; f32[4]; f32[4]; f32[4]; f32_4[4];}* %76 = OpVariable Uniform 
                                          i32 %77 = OpConstant 0 
                                              %78 = OpTypePointer Uniform %68 
                                              %81 = OpTypeBool 
                                              %83 = OpTypePointer Function %42 
                                          i32 %94 = OpConstant 4 
                                              %95 = OpTypePointer Uniform %6 
                                         i32 %101 = OpConstant 2 
                                         f32 %105 = OpConstant 3.674022E-40 
                                Private f32* %111 = OpVariable Private 
                                         u32 %112 = OpConstant 1 
                                         i32 %115 = OpConstant 1 
                                         i32 %120 = OpConstant 3 
                                             %128 = OpTypeVector %81 2 
                                             %129 = OpTypePointer Private %128 
                             Private bool_2* %130 = OpVariable Private 
                                       f32_4 %131 = OpConstantComposite %47 %47 %47 %47 
                                             %134 = OpTypeVector %81 4 
                                             %137 = OpTypeVector %68 3 
                                             %138 = OpTypePointer Private %137 
                              Private i32_3* %139 = OpVariable Private 
                                             %140 = OpTypePointer Private %81 
                                       i32_3 %143 = OpConstantComposite %77 %115 %101 
                                         i32 %144 = OpConstant 8 
                                       i32_3 %145 = OpConstantComposite %120 %101 %144 
                                             %146 = OpTypeVector %81 3 
                                             %149 = OpTypePointer Private %68 
                                Private i32* %150 = OpVariable Private 
                                             %153 = OpTypePointer Function %68 
                              Private f32_4* %167 = OpVariable Private 
                              Private f32_4* %175 = OpVariable Private 
                                         u32 %188 = OpConstant 3 
                              Private f32_4* %196 = OpVariable Private 
                                         u32 %223 = OpConstant 2 
                              Private f32_4* %234 = OpVariable Private 
                                             %267 = OpTypePointer Function %7 
                                             %277 = OpTypePointer Private %146 
                             Private bool_3* %278 = OpVariable Private 
                             Private bool_2* %287 = OpVariable Private 
                                             %296 = OpTypePointer Function %128 
                             Private bool_2* %313 = OpVariable Private 
                                Private f32* %335 = OpVariable Private 
                               Private bool* %359 = OpVariable Private 
                               Private bool* %369 = OpVariable Private 
                                             %402 = OpTypeVector %68 4 
                                       i32_4 %404 = OpConstantComposite %77 %77 %101 %77 
                               Private bool* %423 = OpVariable Private 
                                Private i32* %427 = OpVariable Private 
                               Private bool* %430 = OpVariable Private 
                                Private i32* %434 = OpVariable Private 
                               Private bool* %447 = OpVariable Private 
                               Private bool* %452 = OpVariable Private 
                                Private i32* %457 = OpVariable Private 
                                Private i32* %460 = OpVariable Private 
                                         f32 %487 = OpConstant 3.674022E-40 
                              Private f32_4* %490 = OpVariable Private 
                                         f32 %536 = OpConstant 3.674022E-40 
                                       f32_2 %537 = OpConstantComposite %536 %536 
                                Private f32* %560 = OpVariable Private 
                               Private bool* %591 = OpVariable Private 
                              Private f32_3* %608 = OpVariable Private 
                                Input f32_4* %610 = OpVariable Input 
                                Private f32* %614 = OpVariable Private 
                                       i32_4 %623 = OpConstantComposite %101 %94 %144 %77 
                              Private f32_3* %637 = OpVariable Private 
                                         i32 %639 = OpConstant 5 
                                             %641 = OpTypePointer Uniform %7 
                                Private f32* %646 = OpVariable Private 
                                Private f32* %666 = OpVariable Private 
                                Private f32* %690 = OpVariable Private 
                                Private f32* %698 = OpVariable Private 
                                Private f32* %706 = OpVariable Private 
                               Private bool* %738 = OpVariable Private 
                                             %745 = OpTypePointer Function %6 
        UniformConstant read_only Texture2D* %804 = OpVariable UniformConstant 
                    UniformConstant sampler* %806 = OpVariable UniformConstant 
                        Input f32_2* vs_TEXCOORD1 = OpVariable Input 
                               Private bool* %814 = OpVariable Private 
                                             %837 = OpTypePointer Output %7 
                               Output f32_4* %838 = OpVariable Output 
                                             %852 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                              Function f32_3* %84 = OpVariable Function 
                               Function i32* %154 = OpVariable Function 
                             Function f32_4* %268 = OpVariable Function 
                            Function bool_2* %297 = OpVariable Function 
                            Function bool_2* %322 = OpVariable Function 
                               Function i32* %581 = OpVariable Function 
                               Function i32* %596 = OpVariable Function 
                               Function f32* %746 = OpVariable Function 
                               Function f32* %755 = OpVariable Function 
                               Function f32* %769 = OpVariable Function 
                               Function f32* %780 = OpVariable Function 
                             Function f32_3* %840 = OpVariable Function 
                                   Input f32* %15 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %16 = OpLoad %15 
                                          f32 %17 = OpDPdx %16 
                                 Private f32* %19 = OpAccessChain %9 %13 
                                                      OpStore %19 %17 
                                 Private f32* %21 = OpAccessChain %9 %13 
                                          f32 %22 = OpLoad %21 
                                          f32 %23 = OpExtInst %1 4 %22 
                                          f32 %24 = OpFDiv %20 %23 
                                 Private f32* %25 = OpAccessChain %9 %13 
                                                      OpStore %25 %24 
                          read_only Texture2D %30 = OpLoad %29 
                                      sampler %34 = OpLoad %33 
                   read_only Texture2DSampled %36 = OpSampledImage %30 %34 
                                        f32_2 %40 = OpLoad vs_TEXCOORD0 
                                        f32_4 %41 = OpImageSampleImplicitLod %36 %40 
                                                      OpStore %26 %41 
                                        f32_4 %45 = OpLoad %26 
                                        f32_3 %46 = OpVectorShuffle %45 %45 0 1 2 
                                        f32_3 %49 = OpExtInst %1 40 %46 %48 
                                                      OpStore %44 %49 
                                        f32_3 %51 = OpLoad %44 
                                        f32_3 %52 = OpExtInst %1 30 %51 
                                                      OpStore %50 %52 
                                        f32_3 %53 = OpLoad %50 
                                        f32_3 %56 = OpFMul %53 %55 
                                                      OpStore %50 %56 
                                        f32_3 %57 = OpLoad %50 
                                        f32_3 %58 = OpExtInst %1 29 %57 
                                                      OpStore %50 %58 
                                        f32_3 %59 = OpLoad %50 
                                        f32_3 %62 = OpFMul %59 %61 
                                        f32_3 %65 = OpFAdd %62 %64 
                                                      OpStore %50 %65 
                                        f32_3 %66 = OpLoad %50 
                                        f32_3 %67 = OpExtInst %1 40 %66 %48 
                                                      OpStore %50 %67 
                                 Uniform i32* %79 = OpAccessChain %76 %77 
                                          i32 %80 = OpLoad %79 
                                         bool %82 = OpINotEqual %80 %77 
                                                      OpSelectionMerge %86 None 
                                                      OpBranchConditional %82 %85 %88 
                                              %85 = OpLabel 
                                        f32_3 %87 = OpLoad %50 
                                                      OpStore %84 %87 
                                                      OpBranch %86 
                                              %88 = OpLabel 
                                        f32_4 %89 = OpLoad %26 
                                        f32_3 %90 = OpVectorShuffle %89 %89 0 1 2 
                                                      OpStore %84 %90 
                                                      OpBranch %86 
                                              %86 = OpLabel 
                                        f32_3 %91 = OpLoad %84 
                                                      OpStore %44 %91 
                                   Input f32* %92 = OpAccessChain vs_TEXCOORD2 %13 
                                          f32 %93 = OpLoad %92 
                                 Uniform f32* %96 = OpAccessChain %76 %94 %77 
                                          f32 %97 = OpLoad %96 
                                          f32 %98 = OpFNegate %97 
                                          f32 %99 = OpFAdd %93 %98 
                                Private f32* %100 = OpAccessChain %50 %13 
                                                      OpStore %100 %99 
                                Uniform f32* %102 = OpAccessChain %76 %94 %101 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFNegate %103 
                                         f32 %106 = OpFMul %104 %105 
                                Private f32* %107 = OpAccessChain %50 %13 
                                         f32 %108 = OpLoad %107 
                                         f32 %109 = OpFAdd %106 %108 
                                Private f32* %110 = OpAccessChain %50 %13 
                                                      OpStore %110 %109 
                                  Input f32* %113 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %114 = OpLoad %113 
                                Uniform f32* %116 = OpAccessChain %76 %94 %115 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFNegate %117 
                                         f32 %119 = OpFAdd %114 %118 
                                                      OpStore %111 %119 
                                Uniform f32* %121 = OpAccessChain %76 %94 %120 
                                         f32 %122 = OpLoad %121 
                                         f32 %123 = OpFNegate %122 
                                         f32 %124 = OpFMul %123 %105 
                                         f32 %125 = OpLoad %111 
                                         f32 %126 = OpFAdd %124 %125 
                                Private f32* %127 = OpAccessChain %50 %112 
                                                      OpStore %127 %126 
                                       f32_3 %132 = OpLoad %50 
                                       f32_4 %133 = OpVectorShuffle %132 %132 0 1 0 0 
                                      bool_4 %135 = OpFOrdGreaterThanEqual %131 %133 
                                      bool_2 %136 = OpVectorShuffle %135 %135 0 1 
                                                      OpStore %130 %136 
                               Private bool* %141 = OpAccessChain %130 %112 
                                        bool %142 = OpLoad %141 
                                      bool_3 %147 = OpCompositeConstruct %142 %142 %142 
                                       i32_3 %148 = OpSelect %147 %143 %145 
                                                      OpStore %139 %148 
                               Private bool* %151 = OpAccessChain %130 %13 
                                        bool %152 = OpLoad %151 
                                                      OpSelectionMerge %156 None 
                                                      OpBranchConditional %152 %155 %159 
                                             %155 = OpLabel 
                                Private i32* %157 = OpAccessChain %139 %13 
                                         i32 %158 = OpLoad %157 
                                                      OpStore %154 %158 
                                                      OpBranch %156 
                                             %159 = OpLabel 
                                Private i32* %160 = OpAccessChain %139 %112 
                                         i32 %161 = OpLoad %160 
                                                      OpStore %154 %161 
                                                      OpBranch %156 
                                             %156 = OpLabel 
                                         i32 %162 = OpLoad %154 
                                                      OpStore %150 %162 
                               Private bool* %163 = OpAccessChain %130 %13 
                                        bool %164 = OpLoad %163 
                                         i32 %165 = OpSelect %164 %115 %94 
                                Private i32* %166 = OpAccessChain %139 %13 
                                                      OpStore %166 %165 
                                Uniform f32* %168 = OpAccessChain %76 %94 %77 
                                         f32 %169 = OpLoad %168 
                                         i32 %170 = OpLoad %150 
                                Uniform f32* %171 = OpAccessChain %76 %101 %170 
                                         f32 %172 = OpLoad %171 
                                         f32 %173 = OpFAdd %169 %172 
                                Private f32* %174 = OpAccessChain %167 %112 
                                                      OpStore %174 %173 
                                Uniform f32* %176 = OpAccessChain %76 %94 %115 
                                         f32 %177 = OpLoad %176 
                                         i32 %178 = OpLoad %150 
                                Uniform f32* %179 = OpAccessChain %76 %101 %178 
                                         f32 %180 = OpLoad %179 
                                         f32 %181 = OpFAdd %177 %180 
                                Private f32* %182 = OpAccessChain %175 %112 
                                                      OpStore %182 %181 
                                Uniform f32* %183 = OpAccessChain %76 %120 %77 
                                         f32 %184 = OpLoad %183 
                                Uniform f32* %185 = OpAccessChain %76 %94 %77 
                                         f32 %186 = OpLoad %185 
                                         f32 %187 = OpFAdd %184 %186 
                                Private f32* %189 = OpAccessChain %167 %188 
                                                      OpStore %189 %187 
                                Uniform f32* %190 = OpAccessChain %76 %120 %115 
                                         f32 %191 = OpLoad %190 
                                Uniform f32* %192 = OpAccessChain %76 %94 %115 
                                         f32 %193 = OpLoad %192 
                                         f32 %194 = OpFAdd %191 %193 
                                Private f32* %195 = OpAccessChain %175 %188 
                                                      OpStore %195 %194 
                                Uniform f32* %197 = OpAccessChain %76 %94 %77 
                                         f32 %198 = OpLoad %197 
                                Uniform f32* %199 = OpAccessChain %76 %94 %101 
                                         f32 %200 = OpLoad %199 
                                         f32 %201 = OpFAdd %198 %200 
                                Private f32* %202 = OpAccessChain %196 %13 
                                                      OpStore %202 %201 
                                Private f32* %203 = OpAccessChain %196 %13 
                                         f32 %204 = OpLoad %203 
                                         i32 %205 = OpLoad %150 
                                Uniform f32* %206 = OpAccessChain %76 %101 %205 
                                         f32 %207 = OpLoad %206 
                                         f32 %208 = OpFNegate %207 
                                         f32 %209 = OpFAdd %204 %208 
                                Private f32* %210 = OpAccessChain %196 %112 
                                                      OpStore %210 %209 
                                Private f32* %211 = OpAccessChain %196 %13 
                                         f32 %212 = OpLoad %211 
                                Uniform f32* %213 = OpAccessChain %76 %120 %101 
                                         f32 %214 = OpLoad %213 
                                         f32 %215 = OpFNegate %214 
                                         f32 %216 = OpFAdd %212 %215 
                                Private f32* %217 = OpAccessChain %196 %188 
                                                      OpStore %217 %216 
                                Uniform f32* %218 = OpAccessChain %76 %94 %77 
                                         f32 %219 = OpLoad %218 
                                Private f32* %220 = OpAccessChain %167 %13 
                                                      OpStore %220 %219 
                                Uniform f32* %221 = OpAccessChain %76 %120 %77 
                                         f32 %222 = OpLoad %221 
                                Private f32* %224 = OpAccessChain %167 %223 
                                                      OpStore %224 %222 
                                Uniform f32* %225 = OpAccessChain %76 %120 %101 
                                         f32 %226 = OpLoad %225 
                                Private f32* %227 = OpAccessChain %196 %223 
                                                      OpStore %227 %226 
                               Private bool* %228 = OpAccessChain %130 %13 
                                        bool %229 = OpLoad %228 
                                       f32_4 %230 = OpLoad %167 
                                       f32_4 %231 = OpLoad %196 
                                      bool_4 %232 = OpCompositeConstruct %229 %229 %229 %229 
                                       f32_4 %233 = OpSelect %232 %230 %231 
                                                      OpStore %196 %233 
                                Uniform f32* %235 = OpAccessChain %76 %94 %115 
                                         f32 %236 = OpLoad %235 
                                Uniform f32* %237 = OpAccessChain %76 %94 %120 
                                         f32 %238 = OpLoad %237 
                                         f32 %239 = OpFAdd %236 %238 
                                Private f32* %240 = OpAccessChain %234 %13 
                                                      OpStore %240 %239 
                                Private f32* %241 = OpAccessChain %234 %13 
                                         f32 %242 = OpLoad %241 
                                         i32 %243 = OpLoad %150 
                                Uniform f32* %244 = OpAccessChain %76 %101 %243 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFNegate %245 
                                         f32 %247 = OpFAdd %242 %246 
                                Private f32* %248 = OpAccessChain %234 %112 
                                                      OpStore %248 %247 
                                Private f32* %249 = OpAccessChain %234 %13 
                                         f32 %250 = OpLoad %249 
                                Uniform f32* %251 = OpAccessChain %76 %120 %120 
                                         f32 %252 = OpLoad %251 
                                         f32 %253 = OpFNegate %252 
                                         f32 %254 = OpFAdd %250 %253 
                                Private f32* %255 = OpAccessChain %234 %188 
                                                      OpStore %255 %254 
                                Uniform f32* %256 = OpAccessChain %76 %94 %115 
                                         f32 %257 = OpLoad %256 
                                Private f32* %258 = OpAccessChain %175 %13 
                                                      OpStore %258 %257 
                                Uniform f32* %259 = OpAccessChain %76 %120 %115 
                                         f32 %260 = OpLoad %259 
                                Private f32* %261 = OpAccessChain %175 %223 
                                                      OpStore %261 %260 
                                Uniform f32* %262 = OpAccessChain %76 %120 %120 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %234 %223 
                                                      OpStore %264 %263 
                               Private bool* %265 = OpAccessChain %130 %112 
                                        bool %266 = OpLoad %265 
                                                      OpSelectionMerge %270 None 
                                                      OpBranchConditional %266 %269 %273 
                                             %269 = OpLabel 
                                       f32_4 %271 = OpLoad %175 
                                       f32_4 %272 = OpVectorShuffle %271 %271 1 0 2 3 
                                                      OpStore %268 %272 
                                                      OpBranch %270 
                                             %273 = OpLabel 
                                       f32_4 %274 = OpLoad %234 
                                       f32_4 %275 = OpVectorShuffle %274 %274 1 0 2 3 
                                                      OpStore %268 %275 
                                                      OpBranch %270 
                                             %270 = OpLabel 
                                       f32_4 %276 = OpLoad %268 
                                                      OpStore %234 %276 
                                       f32_4 %279 = OpLoad %196 
                                       f32_4 %280 = OpVectorShuffle %279 %279 1 3 1 1 
                                       f32_4 %281 = OpLoad vs_TEXCOORD2 
                                       f32_4 %282 = OpVectorShuffle %281 %281 0 0 0 0 
                                      bool_4 %283 = OpFOrdGreaterThanEqual %280 %282 
                                      bool_2 %284 = OpVectorShuffle %283 %283 0 1 
                                      bool_3 %285 = OpLoad %278 
                                      bool_3 %286 = OpVectorShuffle %285 %284 3 4 2 
                                                      OpStore %278 %286 
                                       f32_4 %288 = OpLoad vs_TEXCOORD2 
                                       f32_4 %289 = OpVectorShuffle %288 %288 0 0 0 0 
                                       f32_4 %290 = OpLoad %196 
                                       f32_4 %291 = OpVectorShuffle %290 %290 1 3 1 1 
                                      bool_4 %292 = OpFOrdGreaterThanEqual %289 %291 
                                      bool_2 %293 = OpVectorShuffle %292 %292 0 1 
                                                      OpStore %287 %293 
                               Private bool* %294 = OpAccessChain %130 %13 
                                        bool %295 = OpLoad %294 
                                                      OpSelectionMerge %299 None 
                                                      OpBranchConditional %295 %298 %302 
                                             %298 = OpLabel 
                                      bool_3 %300 = OpLoad %278 
                                      bool_2 %301 = OpVectorShuffle %300 %300 0 1 
                                                      OpStore %297 %301 
                                                      OpBranch %299 
                                             %302 = OpLabel 
                                      bool_2 %303 = OpLoad %287 
                                                      OpStore %297 %303 
                                                      OpBranch %299 
                                             %299 = OpLabel 
                                      bool_2 %304 = OpLoad %297 
                                      bool_3 %305 = OpLoad %278 
                                      bool_3 %306 = OpVectorShuffle %305 %304 3 4 2 
                                                      OpStore %278 %306 
                                       f32_4 %307 = OpLoad %234 
                                       f32_4 %308 = OpVectorShuffle %307 %307 0 3 0 0 
                                       f32_4 %309 = OpLoad vs_TEXCOORD2 
                                       f32_4 %310 = OpVectorShuffle %309 %309 1 1 1 1 
                                      bool_4 %311 = OpFOrdGreaterThanEqual %308 %310 
                                      bool_2 %312 = OpVectorShuffle %311 %311 0 1 
                                                      OpStore %287 %312 
                                       f32_4 %314 = OpLoad vs_TEXCOORD2 
                                       f32_4 %315 = OpVectorShuffle %314 %314 1 1 1 1 
                                       f32_4 %316 = OpLoad %234 
                                       f32_4 %317 = OpVectorShuffle %316 %316 0 3 0 0 
                                      bool_4 %318 = OpFOrdGreaterThanEqual %315 %317 
                                      bool_2 %319 = OpVectorShuffle %318 %318 0 1 
                                                      OpStore %313 %319 
                               Private bool* %320 = OpAccessChain %130 %112 
                                        bool %321 = OpLoad %320 
                                                      OpSelectionMerge %324 None 
                                                      OpBranchConditional %321 %323 %326 
                                             %323 = OpLabel 
                                      bool_2 %325 = OpLoad %287 
                                                      OpStore %322 %325 
                                                      OpBranch %324 
                                             %326 = OpLabel 
                                      bool_2 %327 = OpLoad %313 
                                                      OpStore %322 %327 
                                                      OpBranch %324 
                                             %324 = OpLabel 
                                      bool_2 %328 = OpLoad %322 
                                                      OpStore %130 %328 
                               Private bool* %329 = OpAccessChain %130 %13 
                                        bool %330 = OpLoad %329 
                               Private bool* %331 = OpAccessChain %278 %13 
                                        bool %332 = OpLoad %331 
                                        bool %333 = OpLogicalAnd %330 %332 
                               Private bool* %334 = OpAccessChain %130 %13 
                                                      OpStore %334 %333 
                                Uniform f32* %336 = OpAccessChain %76 %120 %77 
                                         f32 %337 = OpLoad %336 
                                Uniform f32* %338 = OpAccessChain %76 %120 %101 
                                         f32 %339 = OpLoad %338 
                                         f32 %340 = OpFAdd %337 %339 
                                                      OpStore %335 %340 
                                         f32 %341 = OpLoad %335 
                                         f32 %342 = OpFNegate %341 
                                Uniform f32* %343 = OpAccessChain %76 %94 %101 
                                         f32 %344 = OpLoad %343 
                                         f32 %345 = OpFAdd %342 %344 
                                                      OpStore %335 %345 
                                Uniform f32* %346 = OpAccessChain %76 %120 %115 
                                         f32 %347 = OpLoad %346 
                                Uniform f32* %348 = OpAccessChain %76 %120 %120 
                                         f32 %349 = OpLoad %348 
                                         f32 %350 = OpFAdd %347 %349 
                                Private f32* %351 = OpAccessChain %167 %13 
                                                      OpStore %351 %350 
                                Private f32* %352 = OpAccessChain %167 %13 
                                         f32 %353 = OpLoad %352 
                                         f32 %354 = OpFNegate %353 
                                Uniform f32* %355 = OpAccessChain %76 %94 %120 
                                         f32 %356 = OpLoad %355 
                                         f32 %357 = OpFAdd %354 %356 
                                Private f32* %358 = OpAccessChain %167 %13 
                                                      OpStore %358 %357 
                                  Input f32* %360 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %361 = OpLoad %360 
                                Private f32* %362 = OpAccessChain %167 %188 
                                         f32 %363 = OpLoad %362 
                                        bool %364 = OpFOrdGreaterThanEqual %361 %363 
                                                      OpStore %359 %364 
                                         f32 %365 = OpLoad %335 
                                Private f32* %366 = OpAccessChain %167 %188 
                                         f32 %367 = OpLoad %366 
                                         f32 %368 = OpFAdd %365 %367 
                                                      OpStore %335 %368 
                                         f32 %370 = OpLoad %335 
                                  Input f32* %371 = OpAccessChain vs_TEXCOORD2 %13 
                                         f32 %372 = OpLoad %371 
                                        bool %373 = OpFOrdGreaterThanEqual %370 %372 
                                                      OpStore %369 %373 
                                        bool %374 = OpLoad %369 
                                        bool %375 = OpLoad %359 
                                        bool %376 = OpLogicalAnd %374 %375 
                                                      OpStore %369 %376 
                                  Input f32* %377 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %378 = OpLoad %377 
                                Private f32* %379 = OpAccessChain %175 %188 
                                         f32 %380 = OpLoad %379 
                                        bool %381 = OpFOrdGreaterThanEqual %378 %380 
                                                      OpStore %359 %381 
                                        bool %382 = OpLoad %369 
                                        bool %383 = OpLoad %359 
                                        bool %384 = OpLogicalAnd %382 %383 
                                                      OpStore %369 %384 
                                Private f32* %385 = OpAccessChain %167 %13 
                                         f32 %386 = OpLoad %385 
                                Private f32* %387 = OpAccessChain %175 %188 
                                         f32 %388 = OpLoad %387 
                                         f32 %389 = OpFAdd %386 %388 
                                Private f32* %390 = OpAccessChain %167 %13 
                                                      OpStore %390 %389 
                                Private f32* %391 = OpAccessChain %167 %13 
                                         f32 %392 = OpLoad %391 
                                  Input f32* %393 = OpAccessChain vs_TEXCOORD2 %112 
                                         f32 %394 = OpLoad %393 
                                        bool %395 = OpFOrdGreaterThanEqual %392 %394 
                               Private bool* %396 = OpAccessChain %278 %13 
                                                      OpStore %396 %395 
                                        bool %397 = OpLoad %369 
                               Private bool* %398 = OpAccessChain %278 %13 
                                        bool %399 = OpLoad %398 
                                        bool %400 = OpLogicalAnd %397 %399 
                                                      OpStore %369 %400 
                                         i32 %401 = OpLoad %150 
                                       i32_4 %403 = OpCompositeConstruct %401 %401 %401 %401 
                                      bool_4 %405 = OpIEqual %403 %404 
                                      bool_2 %406 = OpVectorShuffle %405 %405 0 2 
                                      bool_3 %407 = OpLoad %278 
                                      bool_3 %408 = OpVectorShuffle %407 %406 3 1 4 
                                                      OpStore %278 %408 
                               Private bool* %409 = OpAccessChain %278 %223 
                                        bool %410 = OpLoad %409 
                               Private bool* %411 = OpAccessChain %278 %13 
                                        bool %412 = OpLoad %411 
                                        bool %413 = OpLogicalOr %410 %412 
                               Private bool* %414 = OpAccessChain %278 %13 
                                                      OpStore %414 %413 
                                         i32 %415 = OpLoad %150 
                                Uniform f32* %416 = OpAccessChain %76 %101 %415 
                                         f32 %417 = OpLoad %416 
                                        bool %418 = OpFOrdLessThan %47 %417 
                                                      OpStore %359 %418 
                               Private bool* %419 = OpAccessChain %130 %13 
                                        bool %420 = OpLoad %419 
                                        bool %421 = OpLoad %359 
                                        bool %422 = OpLogicalAnd %420 %421 
                                                      OpStore %359 %422 
                                Private f32* %424 = OpAccessChain %196 %223 
                                         f32 %425 = OpLoad %424 
                                        bool %426 = OpFOrdLessThan %47 %425 
                                                      OpStore %423 %426 
                                        bool %428 = OpLoad %423 
                                         i32 %429 = OpSelect %428 %115 %77 
                                                      OpStore %427 %429 
                                Private f32* %431 = OpAccessChain %234 %223 
                                         f32 %432 = OpLoad %431 
                                        bool %433 = OpFOrdLessThan %47 %432 
                                                      OpStore %430 %433 
                                        bool %435 = OpLoad %430 
                                         i32 %436 = OpSelect %435 %115 %77 
                                                      OpStore %434 %436 
                                Private i32* %437 = OpAccessChain %139 %223 
                                         i32 %438 = OpLoad %437 
                                         i32 %439 = OpLoad %434 
                                         i32 %440 = OpIMul %438 %439 
                                                      OpStore %434 %440 
                                         i32 %441 = OpLoad %427 
                                Private i32* %442 = OpAccessChain %139 %13 
                                         i32 %443 = OpLoad %442 
                                         i32 %444 = OpIMul %441 %443 
                                         i32 %445 = OpLoad %434 
                                         i32 %446 = OpIAdd %444 %445 
                                                      OpStore %427 %446 
                               Private bool* %448 = OpAccessChain %278 %112 
                                        bool %449 = OpLoad %448 
                                        bool %450 = OpLoad %423 
                                        bool %451 = OpLogicalAnd %449 %450 
                                                      OpStore %447 %451 
                               Private bool* %453 = OpAccessChain %130 %112 
                                        bool %454 = OpLoad %453 
                                        bool %455 = OpLoad %430 
                                        bool %456 = OpLogicalAnd %454 %455 
                                                      OpStore %452 %456 
                                        bool %458 = OpLoad %447 
                                         i32 %459 = OpSelect %458 %115 %77 
                                                      OpStore %457 %459 
                                        bool %461 = OpLoad %452 
                                         i32 %462 = OpSelect %461 %115 %77 
                                                      OpStore %460 %462 
                                Private i32* %463 = OpAccessChain %139 %223 
                                         i32 %464 = OpLoad %463 
                                         i32 %465 = OpLoad %460 
                                         i32 %466 = OpIMul %464 %465 
                                                      OpStore %460 %466 
                                         i32 %467 = OpLoad %457 
                                Private i32* %468 = OpAccessChain %139 %13 
                                         i32 %469 = OpLoad %468 
                                         i32 %470 = OpIMul %467 %469 
                                         i32 %471 = OpLoad %460 
                                         i32 %472 = OpIAdd %470 %471 
                                                      OpStore %460 %472 
                                        bool %473 = OpLoad %369 
                                         i32 %474 = OpLoad %460 
                                         i32 %475 = OpSelect %473 %77 %474 
                                                      OpStore %460 %475 
                                        bool %476 = OpLoad %359 
                                         i32 %477 = OpLoad %427 
                                         i32 %478 = OpLoad %460 
                                         i32 %479 = OpSelect %476 %477 %478 
                                                      OpStore %460 %479 
                                Private i32* %480 = OpAccessChain %139 %223 
                                         i32 %481 = OpLoad %480 
                                Private i32* %482 = OpAccessChain %139 %13 
                                         i32 %483 = OpLoad %482 
                                         i32 %484 = OpIAdd %481 %483 
                                                      OpStore %457 %484 
                               Private bool* %485 = OpAccessChain %278 %13 
                                        bool %486 = OpLoad %485 
                                         f32 %488 = OpSelect %486 %20 %487 
                                Private f32* %489 = OpAccessChain %167 %13 
                                                      OpStore %489 %488 
                                       f32_4 %491 = OpLoad %196 
                                       f32_2 %492 = OpVectorShuffle %491 %491 3 1 
                                       f32_4 %493 = OpLoad %490 
                                       f32_4 %494 = OpVectorShuffle %493 %492 4 1 5 3 
                                                      OpStore %490 %494 
                                       f32_4 %495 = OpLoad %234 
                                       f32_2 %496 = OpVectorShuffle %495 %495 3 0 
                                       f32_4 %497 = OpLoad %490 
                                       f32_4 %498 = OpVectorShuffle %497 %496 0 4 2 5 
                                                      OpStore %490 %498 
                                Private f32* %499 = OpAccessChain %196 %13 
                                         f32 %500 = OpLoad %499 
                                Private f32* %501 = OpAccessChain %234 %13 
                                                      OpStore %501 %500 
                                       f32_4 %502 = OpLoad %490 
                                       f32_2 %503 = OpVectorShuffle %502 %502 1 0 
                                       f32_2 %504 = OpFNegate %503 
                                       f32_4 %505 = OpLoad %234 
                                       f32_2 %506 = OpVectorShuffle %505 %505 1 0 
                                       f32_2 %507 = OpFAdd %504 %506 
                                       f32_4 %508 = OpLoad %175 
                                       f32_4 %509 = OpVectorShuffle %508 %507 4 1 5 3 
                                                      OpStore %175 %509 
                                       f32_4 %510 = OpLoad %167 
                                       f32_2 %511 = OpVectorShuffle %510 %510 0 0 
                                       f32_4 %512 = OpLoad %175 
                                       f32_2 %513 = OpVectorShuffle %512 %512 0 2 
                                       f32_2 %514 = OpFMul %511 %513 
                                       f32_4 %515 = OpLoad %167 
                                       f32_4 %516 = OpVectorShuffle %515 %514 4 1 5 3 
                                                      OpStore %167 %516 
                                       f32_4 %517 = OpLoad %167 
                                       f32_2 %518 = OpVectorShuffle %517 %517 0 2 
                                       f32_4 %519 = OpLoad %167 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 2 
                                         f32 %521 = OpDot %518 %520 
                                Private f32* %522 = OpAccessChain %175 %13 
                                                      OpStore %522 %521 
                                Private f32* %523 = OpAccessChain %175 %13 
                                         f32 %524 = OpLoad %523 
                                         f32 %525 = OpExtInst %1 32 %524 
                                Private f32* %526 = OpAccessChain %175 %13 
                                                      OpStore %526 %525 
                                       f32_4 %527 = OpLoad %167 
                                       f32_2 %528 = OpVectorShuffle %527 %527 0 2 
                                       f32_4 %529 = OpLoad %175 
                                       f32_2 %530 = OpVectorShuffle %529 %529 0 0 
                                       f32_2 %531 = OpFMul %528 %530 
                                       f32_4 %532 = OpLoad %167 
                                       f32_4 %533 = OpVectorShuffle %532 %531 4 1 5 3 
                                                      OpStore %167 %533 
                                       f32_4 %534 = OpLoad %167 
                                       f32_2 %535 = OpVectorShuffle %534 %534 0 2 
                                       f32_2 %538 = OpFMul %535 %537 
                                       f32_4 %539 = OpLoad %234 
                                       f32_2 %540 = OpVectorShuffle %539 %539 1 0 
                                       f32_2 %541 = OpFAdd %538 %540 
                                       f32_4 %542 = OpLoad %167 
                                       f32_4 %543 = OpVectorShuffle %542 %541 4 1 5 3 
                                                      OpStore %167 %543 
                                       f32_4 %544 = OpLoad %167 
                                       f32_2 %545 = OpVectorShuffle %544 %544 2 0 
                                       f32_2 %546 = OpFNegate %545 
                                       f32_4 %547 = OpLoad %234 
                                       f32_2 %548 = OpVectorShuffle %547 %547 0 1 
                                       f32_2 %549 = OpFAdd %546 %548 
                                       f32_4 %550 = OpLoad %175 
                                       f32_4 %551 = OpVectorShuffle %550 %549 4 1 5 3 
                                                      OpStore %175 %551 
                                       f32_4 %552 = OpLoad %167 
                                       f32_2 %553 = OpVectorShuffle %552 %552 0 2 
                                       f32_2 %554 = OpFNegate %553 
                                       f32_4 %555 = OpLoad vs_TEXCOORD2 
                                       f32_2 %556 = OpVectorShuffle %555 %555 1 0 
                                       f32_2 %557 = OpFAdd %554 %556 
                                       f32_4 %558 = OpLoad %167 
                                       f32_4 %559 = OpVectorShuffle %558 %557 4 1 5 3 
                                                      OpStore %167 %559 
                                Private f32* %561 = OpAccessChain %167 %223 
                                         f32 %562 = OpLoad %561 
                                Private f32* %563 = OpAccessChain %175 %223 
                                         f32 %564 = OpLoad %563 
                                         f32 %565 = OpFMul %562 %564 
                                                      OpStore %560 %565 
                                Private f32* %566 = OpAccessChain %175 %13 
                                         f32 %567 = OpLoad %566 
                                Private f32* %568 = OpAccessChain %167 %13 
                                         f32 %569 = OpLoad %568 
                                         f32 %570 = OpFMul %567 %569 
                                         f32 %571 = OpLoad %560 
                                         f32 %572 = OpFNegate %571 
                                         f32 %573 = OpFAdd %570 %572 
                                Private f32* %574 = OpAccessChain %167 %13 
                                                      OpStore %574 %573 
                                Private f32* %575 = OpAccessChain %167 %13 
                                         f32 %576 = OpLoad %575 
                                        bool %577 = OpFOrdGreaterThanEqual %576 %47 
                               Private bool* %578 = OpAccessChain %278 %13 
                                                      OpStore %578 %577 
                               Private bool* %579 = OpAccessChain %278 %13 
                                        bool %580 = OpLoad %579 
                                                      OpSelectionMerge %583 None 
                                                      OpBranchConditional %580 %582 %586 
                                             %582 = OpLabel 
                                Private i32* %584 = OpAccessChain %139 %13 
                                         i32 %585 = OpLoad %584 
                                                      OpStore %581 %585 
                                                      OpBranch %583 
                                             %586 = OpLabel 
                                Private i32* %587 = OpAccessChain %139 %223 
                                         i32 %588 = OpLoad %587 
                                                      OpStore %581 %588 
                                                      OpBranch %583 
                                             %583 = OpLabel 
                                         i32 %589 = OpLoad %581 
                                Private i32* %590 = OpAccessChain %139 %13 
                                                      OpStore %590 %589 
                                         i32 %592 = OpLoad %460 
                                         i32 %593 = OpLoad %457 
                                        bool %594 = OpINotEqual %592 %593 
                                                      OpStore %591 %594 
                                        bool %595 = OpLoad %591 
                                                      OpSelectionMerge %598 None 
                                                      OpBranchConditional %595 %597 %600 
                                             %597 = OpLabel 
                                         i32 %599 = OpLoad %460 
                                                      OpStore %596 %599 
                                                      OpBranch %598 
                                             %600 = OpLabel 
                                Private i32* %601 = OpAccessChain %139 %13 
                                         i32 %602 = OpLoad %601 
                                                      OpStore %596 %602 
                                                      OpBranch %598 
                                             %598 = OpLabel 
                                         i32 %603 = OpLoad %596 
                                                      OpStore %460 %603 
                                         i32 %604 = OpLoad %460 
                                        bool %605 = OpIEqual %604 %77 
                                                      OpSelectionMerge %607 None 
                                                      OpBranchConditional %605 %606 %620 
                                             %606 = OpLabel 
                                       f32_3 %609 = OpLoad %44 
                                       f32_4 %611 = OpLoad %610 
                                       f32_3 %612 = OpVectorShuffle %611 %611 0 1 2 
                                       f32_3 %613 = OpFMul %609 %612 
                                                      OpStore %608 %613 
                                Private f32* %615 = OpAccessChain %26 %188 
                                         f32 %616 = OpLoad %615 
                                  Input f32* %617 = OpAccessChain %610 %188 
                                         f32 %618 = OpLoad %617 
                                         f32 %619 = OpFMul %616 %618 
                                                      OpStore %614 %619 
                                                      OpBranch %607 
                                             %620 = OpLabel 
                                         i32 %621 = OpLoad %460 
                                       i32_4 %622 = OpCompositeConstruct %621 %621 %621 %621 
                                      bool_4 %624 = OpIEqual %622 %623 
                                      bool_3 %625 = OpVectorShuffle %624 %624 0 1 2 
                                                      OpStore %278 %625 
                               Private bool* %626 = OpAccessChain %278 %223 
                                        bool %627 = OpLoad %626 
                                         i32 %628 = OpSelect %627 %120 %77 
                                                      OpStore %460 %628 
                               Private bool* %629 = OpAccessChain %278 %112 
                                        bool %630 = OpLoad %629 
                                         i32 %631 = OpLoad %460 
                                         i32 %632 = OpSelect %630 %101 %631 
                                                      OpStore %460 %632 
                               Private bool* %633 = OpAccessChain %278 %13 
                                        bool %634 = OpLoad %633 
                                         i32 %635 = OpLoad %460 
                                         i32 %636 = OpSelect %634 %115 %635 
                                                      OpStore %460 %636 
                                       f32_3 %638 = OpLoad %44 
                                         i32 %640 = OpLoad %460 
                              Uniform f32_4* %642 = OpAccessChain %76 %639 %640 
                                       f32_4 %643 = OpLoad %642 
                                       f32_3 %644 = OpVectorShuffle %643 %643 0 1 2 
                                       f32_3 %645 = OpFMul %638 %644 
                                                      OpStore %637 %645 
                                Private f32* %647 = OpAccessChain %26 %188 
                                         f32 %648 = OpLoad %647 
                                         i32 %649 = OpLoad %460 
                                Uniform f32* %650 = OpAccessChain %76 %639 %649 %188 
                                         f32 %651 = OpLoad %650 
                                         f32 %652 = OpFMul %648 %651 
                                                      OpStore %646 %652 
                                       f32_3 %653 = OpLoad %637 
                                                      OpStore %608 %653 
                                         f32 %654 = OpLoad %646 
                                                      OpStore %614 %654 
                                                      OpBranch %607 
                                             %607 = OpLabel 
                                        bool %655 = OpLoad %423 
                                        bool %656 = OpLoad %430 
                                        bool %657 = OpLogicalOr %655 %656 
                                                      OpStore %452 %657 
                                       f32_4 %658 = OpLoad %490 
                                       f32_2 %659 = OpVectorShuffle %658 %658 2 3 
                                       f32_2 %660 = OpFNegate %659 
                                       f32_4 %661 = OpLoad vs_TEXCOORD2 
                                       f32_2 %662 = OpVectorShuffle %661 %661 0 1 
                                       f32_2 %663 = OpFAdd %660 %662 
                                       f32_4 %664 = OpLoad %167 
                                       f32_4 %665 = OpVectorShuffle %664 %663 4 5 2 3 
                                                      OpStore %167 %665 
                                       f32_4 %667 = OpLoad %167 
                                       f32_2 %668 = OpVectorShuffle %667 %667 0 1 
                                       f32_4 %669 = OpLoad %167 
                                       f32_2 %670 = OpVectorShuffle %669 %669 0 1 
                                         f32 %671 = OpDot %668 %670 
                                                      OpStore %666 %671 
                                         f32 %672 = OpLoad %666 
                                         f32 %673 = OpExtInst %1 31 %672 
                                                      OpStore %666 %673 
                                         f32 %674 = OpLoad %666 
                                         i32 %675 = OpLoad %150 
                                Uniform f32* %676 = OpAccessChain %76 %101 %675 
                                         f32 %677 = OpLoad %676 
                                         f32 %678 = OpFNegate %677 
                                         f32 %679 = OpFAdd %674 %678 
                                                      OpStore %666 %679 
                                         f32 %680 = OpLoad %666 
                                Private f32* %681 = OpAccessChain %9 %13 
                                         f32 %682 = OpLoad %681 
                                         f32 %683 = OpFMul %680 %682 
                                         f32 %684 = OpFAdd %683 %105 
                                                      OpStore %666 %684 
                                         f32 %685 = OpLoad %666 
                                         f32 %686 = OpExtInst %1 43 %685 %47 %20 
                                                      OpStore %666 %686 
                                        bool %687 = OpLoad %452 
                                         f32 %688 = OpLoad %666 
                                         f32 %689 = OpSelect %687 %688 %47 
                                                      OpStore %666 %689 
                                Private f32* %691 = OpAccessChain %196 %223 
                                         f32 %692 = OpLoad %691 
                                         f32 %693 = OpFNegate %692 
                                         i32 %694 = OpLoad %150 
                                Uniform f32* %695 = OpAccessChain %76 %101 %694 
                                         f32 %696 = OpLoad %695 
                                         f32 %697 = OpFAdd %693 %696 
                                                      OpStore %690 %697 
                                Private f32* %699 = OpAccessChain %234 %223 
                                         f32 %700 = OpLoad %699 
                                         f32 %701 = OpFNegate %700 
                                         i32 %702 = OpLoad %150 
                                Uniform f32* %703 = OpAccessChain %76 %101 %702 
                                         f32 %704 = OpLoad %703 
                                         f32 %705 = OpFAdd %701 %704 
                                                      OpStore %698 %705 
                                         f32 %707 = OpLoad %690 
                                         f32 %708 = OpLoad %698 
                                         f32 %709 = OpFDiv %707 %708 
                                                      OpStore %706 %709 
                                         f32 %710 = OpLoad %706 
                                Private f32* %711 = OpAccessChain %167 %112 
                                         f32 %712 = OpLoad %711 
                                         f32 %713 = OpFMul %710 %712 
                                Private f32* %714 = OpAccessChain %167 %223 
                                                      OpStore %714 %713 
                                       f32_4 %715 = OpLoad %167 
                                       f32_2 %716 = OpVectorShuffle %715 %715 0 2 
                                       f32_4 %717 = OpLoad %167 
                                       f32_2 %718 = OpVectorShuffle %717 %717 0 2 
                                         f32 %719 = OpDot %716 %718 
                                                      OpStore %706 %719 
                                         f32 %720 = OpLoad %706 
                                         f32 %721 = OpExtInst %1 31 %720 
                                                      OpStore %706 %721 
                                         f32 %722 = OpLoad %690 
                                         f32 %723 = OpFNegate %722 
                                         f32 %724 = OpLoad %706 
                                         f32 %725 = OpFAdd %723 %724 
                                                      OpStore %706 %725 
                                         f32 %726 = OpLoad %706 
                                Private f32* %727 = OpAccessChain %9 %13 
                                         f32 %728 = OpLoad %727 
                                         f32 %729 = OpFMul %726 %728 
                                         f32 %730 = OpFAdd %729 %105 
                                Private f32* %731 = OpAccessChain %9 %13 
                                                      OpStore %731 %730 
                                Private f32* %732 = OpAccessChain %9 %13 
                                         f32 %733 = OpLoad %732 
                                         f32 %734 = OpExtInst %1 43 %733 %47 %20 
                                Private f32* %735 = OpAccessChain %9 %13 
                                                      OpStore %735 %734 
                                         f32 %736 = OpLoad %690 
                                        bool %737 = OpFOrdLessThan %47 %736 
                                                      OpStore %591 %737 
                                         f32 %739 = OpLoad %698 
                                        bool %740 = OpFOrdLessThan %47 %739 
                                                      OpStore %738 %740 
                                        bool %741 = OpLoad %738 
                                        bool %742 = OpLoad %591 
                                        bool %743 = OpLogicalAnd %741 %742 
                                                      OpStore %738 %743 
                                        bool %744 = OpLoad %738 
                                                      OpSelectionMerge %748 None 
                                                      OpBranchConditional %744 %747 %751 
                                             %747 = OpLabel 
                                Private f32* %749 = OpAccessChain %9 %13 
                                         f32 %750 = OpLoad %749 
                                                      OpStore %746 %750 
                                                      OpBranch %748 
                                             %751 = OpLabel 
                                                      OpStore %746 %20 
                                                      OpBranch %748 
                                             %748 = OpLabel 
                                         f32 %752 = OpLoad %746 
                                Private f32* %753 = OpAccessChain %9 %13 
                                                      OpStore %753 %752 
                                        bool %754 = OpLoad %452 
                                                      OpSelectionMerge %757 None 
                                                      OpBranchConditional %754 %756 %760 
                                             %756 = OpLabel 
                                Private f32* %758 = OpAccessChain %9 %13 
                                         f32 %759 = OpLoad %758 
                                                      OpStore %755 %759 
                                                      OpBranch %757 
                                             %760 = OpLabel 
                                                      OpStore %755 %47 
                                                      OpBranch %757 
                                             %757 = OpLabel 
                                         f32 %761 = OpLoad %755 
                                Private f32* %762 = OpAccessChain %9 %13 
                                                      OpStore %762 %761 
                                         f32 %763 = OpLoad %666 
                                        bool %764 = OpFOrdEqual %763 %47 
                                                      OpStore %452 %764 
                                         f32 %765 = OpLoad %666 
                                         f32 %766 = OpFNegate %765 
                                         f32 %767 = OpFAdd %766 %20 
                                                      OpStore %698 %767 
                                        bool %768 = OpLoad %452 
                                                      OpSelectionMerge %771 None 
                                                      OpBranchConditional %768 %770 %774 
                                             %770 = OpLabel 
                                Private f32* %772 = OpAccessChain %9 %13 
                                         f32 %773 = OpLoad %772 
                                                      OpStore %769 %773 
                                                      OpBranch %771 
                                             %774 = OpLabel 
                                         f32 %775 = OpLoad %698 
                                                      OpStore %769 %775 
                                                      OpBranch %771 
                                             %771 = OpLabel 
                                         f32 %776 = OpLoad %769 
                                Private f32* %777 = OpAccessChain %9 %13 
                                                      OpStore %777 %776 
                               Private bool* %778 = OpAccessChain %130 %13 
                                        bool %779 = OpLoad %778 
                                                      OpSelectionMerge %782 None 
                                                      OpBranchConditional %779 %781 %785 
                                             %781 = OpLabel 
                                Private f32* %783 = OpAccessChain %9 %13 
                                         f32 %784 = OpLoad %783 
                                                      OpStore %780 %784 
                                                      OpBranch %782 
                                             %785 = OpLabel 
                                                      OpStore %780 %20 
                                                      OpBranch %782 
                                             %782 = OpLabel 
                                         f32 %786 = OpLoad %780 
                                Private f32* %787 = OpAccessChain %9 %13 
                                                      OpStore %787 %786 
                                Private f32* %788 = OpAccessChain %9 %13 
                                         f32 %789 = OpLoad %788 
                                         f32 %790 = OpLoad %614 
                                         f32 %791 = OpFMul %789 %790 
                                                      OpStore %111 %791 
                                        bool %792 = OpLoad %369 
                                         f32 %793 = OpSelect %792 %47 %20 
                                                      OpStore %698 %793 
                               Private bool* %794 = OpAccessChain %130 %13 
                                        bool %795 = OpLoad %794 
                                         f32 %796 = OpLoad %698 
                                         f32 %797 = OpSelect %795 %20 %796 
                                Private f32* %798 = OpAccessChain %50 %13 
                                                      OpStore %798 %797 
                                Private f32* %799 = OpAccessChain %50 %13 
                                         f32 %800 = OpLoad %799 
                                         f32 %801 = OpLoad %111 
                                         f32 %802 = OpFMul %800 %801 
                                Private f32* %803 = OpAccessChain %9 %223 
                                                      OpStore %803 %802 
                         read_only Texture2D %805 = OpLoad %804 
                                     sampler %807 = OpLoad %806 
                  read_only Texture2DSampled %808 = OpSampledImage %805 %807 
                                       f32_2 %810 = OpLoad vs_TEXCOORD1 
                                       f32_4 %811 = OpImageSampleImplicitLod %808 %810 
                                         f32 %812 = OpCompositeExtract %811 3 
                                Private f32* %813 = OpAccessChain %50 %223 
                                                      OpStore %813 %812 
                                Uniform i32* %815 = OpAccessChain %76 %115 
                                         i32 %816 = OpLoad %815 
                                        bool %817 = OpINotEqual %816 %639 
                                                      OpStore %814 %817 
                                       f32_3 %818 = OpLoad %50 
                                       f32_2 %819 = OpVectorShuffle %818 %818 0 2 
                                       f32_4 %820 = OpLoad %9 
                                       f32_2 %821 = OpVectorShuffle %820 %820 0 2 
                                       f32_2 %822 = OpFMul %819 %821 
                                       f32_4 %823 = OpLoad %9 
                                       f32_4 %824 = OpVectorShuffle %823 %822 4 1 5 3 
                                                      OpStore %9 %824 
                                Private f32* %825 = OpAccessChain %50 %223 
                                         f32 %826 = OpLoad %825 
                                Private f32* %827 = OpAccessChain %9 %13 
                                         f32 %828 = OpLoad %827 
                                         f32 %829 = OpFMul %826 %828 
                                Private f32* %830 = OpAccessChain %9 %13 
                                                      OpStore %830 %829 
                                       f32_4 %831 = OpLoad %9 
                                       f32_3 %832 = OpVectorShuffle %831 %831 0 0 0 
                                       f32_3 %833 = OpLoad %608 
                                       f32_3 %834 = OpFMul %832 %833 
                                       f32_4 %835 = OpLoad %9 
                                       f32_4 %836 = OpVectorShuffle %835 %834 4 5 2 6 
                                                      OpStore %9 %836 
                                        bool %839 = OpLoad %814 
                                                      OpSelectionMerge %842 None 
                                                      OpBranchConditional %839 %841 %845 
                                             %841 = OpLabel 
                                       f32_4 %843 = OpLoad %9 
                                       f32_3 %844 = OpVectorShuffle %843 %843 0 1 3 
                                                      OpStore %840 %844 
                                                      OpBranch %842 
                                             %845 = OpLabel 
                                       f32_3 %846 = OpLoad %608 
                                                      OpStore %840 %846 
                                                      OpBranch %842 
                                             %842 = OpLabel 
                                       f32_3 %847 = OpLoad %840 
                                       f32_4 %848 = OpLoad %838 
                                       f32_4 %849 = OpVectorShuffle %848 %847 4 5 6 3 
                                                      OpStore %838 %849 
                                Private f32* %850 = OpAccessChain %9 %223 
                                         f32 %851 = OpLoad %850 
                                 Output f32* %853 = OpAccessChain %838 %188 
                                                      OpStore %853 %851 
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