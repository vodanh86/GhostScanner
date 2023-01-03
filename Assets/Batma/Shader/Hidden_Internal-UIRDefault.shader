//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Internal-UIRDefault" {
Properties {
_MainTex ("Atlas", 2D) = "white" { }
_FontTex ("Font", 2D) = "black" { }
_CustomTex ("Custom", 2D) = "black" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilCompFront ("__scf", Float) = 3
_StencilPassFront ("__spf", Float) = 0
_StencilZFailFront ("__szf", Float) = 1
_StencilFailFront ("__sff", Float) = 0
_StencilCompBack ("__scb", Float) = 8
_StencilPassBack ("__spb", Float) = 0
_StencilZFailBack ("__szb", Float) = 2
_StencilFailBack ("__sfb", Float) = 0
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_VertexTexturingIsAvailable" = "1" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" "UIE_VertexTexturingIsAvailable" = "1" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest GEqual
  ZWrite Off
  Cull Off
  Stencil {
   Ref 255
   CompFront Disabled
   PassFront Keep
   FailFront Keep
   ZFailFront Keep
   CompBack Disabled
   PassBack Keep
   FailBack Keep
   ZFailBack Keep
  }
  GpuProgramID 24877
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
UNITY_LOCATION(4) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
flat out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat7;
vec2 u_xlat10;
vec2 u_xlat11;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat10.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat10.xy = u_xlat10.xy * vec2(0.03125, 0.03125);
    u_xlat10.x = in_TEXCOORD1.y * 2040.0 + u_xlat10.x;
    u_xlat11.y = in_TEXCOORD3.y * 2040.0 + u_xlat10.y;
    u_xlat1.y = u_xlat10.x * 3.0;
    u_xlat1.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat11.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.y;
    u_xlat0.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat0.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat2 = u_xlat1.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 2.5);
    u_xlat1.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
    u_xlat1.x = dot(u_xlat1, in_POSITION0);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat11.x = dot(u_xlat3.xy, in_TEXCOORD0.xy);
    u_xlat13.x = dot(u_xlat3, in_POSITION0);
    u_xlat11.y = dot(u_xlat2.xy, in_TEXCOORD0.xy);
    u_xlat13.y = dot(u_xlat2, in_POSITION0);
    u_xlat2.xy = u_xlat11.xy * _1PixelClipInvView.zw;
    u_xlat12.xy = abs(u_xlat2.xy) + vec2(9.99999997e-07, 9.99999997e-07);
    u_xlat2.xy = max(abs(u_xlat2.xy), vec2(1.0, 1.0));
    u_xlat3.xy = roundEven(u_xlat2.xy);
    u_xlat2.xy = max(u_xlat2.xy, u_xlat3.xy);
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    {
        vec4 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb4.w) ? u_xlat2.x : u_xlat3.x;
        hlslcc_movcTemp.y = (u_xlatb4.z) ? u_xlat2.y : u_xlat3.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy / u_xlat12.xy;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = min(u_xlat2.xy, vec2(100.0, 100.0));
    u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat6.xy = u_xlat11.xy * u_xlat2.xy;
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlatb16 = u_xlatb4.w || u_xlatb2.x;
    u_xlatb16 = u_xlatb4.z || u_xlatb16;
    u_xlat4.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.x ? float(1.0) : 0.0;
;
    u_xlat6.xy = bool(u_xlatb16) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat6.xy = u_xlat6.xy + u_xlat13.xy;
    u_xlat3 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat3;
    vs_TEXCOORD0.zw = u_xlat6.xy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
    u_xlat1.x = textureLod(_ShaderInfoTex, u_xlat0.zw, 0.0).w;
    u_xlat1.w = u_xlat1.x * in_COLOR0.w;
    u_xlat1.xyz = in_COLOR0.xyz;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat11.xy = u_xlat1.xy * _MainTex_TexelSize.xy;
    u_xlat2.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat17 = (u_xlatb2.w) ? -1.0 : -0.0;
    u_xlat3.y = u_xlat17 + u_xlat2.y;
    u_xlat7 = u_xlat2.z + u_xlat2.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat7==1.0);
#else
    u_xlatb12 = u_xlat7==1.0;
#endif
    vs_TEXCOORD0.xy = (bool(u_xlatb12)) ? u_xlat11.xy : u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb1.x = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat3.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat3.x;
    u_xlat1.x = u_xlat2.x + u_xlat1.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat1.x = u_xlat4.x + u_xlat1.x;
    u_xlat1.x = u_xlat4.y + u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat3.w = (-u_xlat1.x) + 1.0;
    vs_TEXCOORD1 = u_xlat3;
    u_xlat4.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat1.xy = in_TEXCOORD2.yy * vec2(255.0, 8160.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.y>=(-u_xlat1.y));
#else
    u_xlatb6 = u_xlat1.y>=(-u_xlat1.y);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat1.x = u_xlat6.y * u_xlat1.x;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat6.x;
    u_xlat6.x = in_TEXCOORD2.y * 255.0 + (-u_xlat1.x);
    u_xlat2.x = in_TEXCOORD1.z * 8160.0 + u_xlat1.x;
    u_xlat1.x = in_TEXCOORD1.w * 2040.0;
    u_xlat2.y = u_xlat6.x * 0.03125 + u_xlat1.x;
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = textureLod(_ShaderInfoTex, u_xlat0.xy, 0.0);
    vs_TEXCOORD4 = u_xlat0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GradientSettingsTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec3 vs_TEXCOORD2;
flat in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb10;
vec2 u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
vec2 u_xlat16;
vec2 u_xlat17;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD4.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD4.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_1.x = (-vs_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_8 = vs_TEXCOORD1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * u_xlat16_1.xxxx + vs_TEXCOORD1.wwww;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_2 * vec4(u_xlat16_8) + u_xlat0;
    u_xlat2.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat9 = dFdx(u_xlat2.x);
    u_xlat16.x = dFdy(u_xlat2.x);
    u_xlat9 = abs(u_xlat16.x) + abs(u_xlat9);
    u_xlat16.x = (-u_xlat9) + 0.5;
    u_xlat2.y = u_xlat9 + 0.5;
    u_xlat2.xy = (-u_xlat16.xx) + u_xlat2.xy;
    u_xlat9 = float(1.0) / u_xlat2.y;
    u_xlat2.x = u_xlat9 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat9;
    u_xlat16_1.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_1.w = u_xlat2.x * vs_TEXCOORD1.x;
    u_xlat16_0 = u_xlat0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    u_xlatb2.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y || u_xlatb2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = (u_xlatb2.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat1.y = vs_TEXCOORD2.z + 0.5;
        u_xlat1.x = float(0.5);
        u_xlat15.y = float(0.0);
        u_xlat16.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat16.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.0<u_xlat16_3.x);
#else
        u_xlatb3.x = 0.0<u_xlat16_3.x;
#endif
        u_xlat17.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat18.x = dot(u_xlat4.xy, u_xlat4.xy);
        u_xlat18.x = inversesqrt(u_xlat18.x);
        u_xlat18.xy = u_xlat18.xx * u_xlat4.xy;
        u_xlat5 = dot((-u_xlat17.xy), u_xlat18.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat5) * u_xlat5 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat5;
        u_xlat17.x = u_xlat17.x + u_xlat5;
        u_xlat5 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(u_xlat5<0.0);
#else
        u_xlatb12 = u_xlat5<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb12) ? u_xlat17.x : u_xlat5;
        u_xlat17.xy = u_xlat17.xx * u_xlat18.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb18 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb25 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xy / u_xlat17.xy;
        u_xlat24 = u_xlatb25 ? u_xlat17.y : float(0.0);
        u_xlat11.x = (u_xlatb18) ? u_xlat24 : u_xlat17.x;
        u_xlat11.y = 0.0;
        u_xlat4.yz = (u_xlatb3.x) ? u_xlat11.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_3.y * 255.0;
        u_xlati3 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat4.y>=(-u_xlat4.y));
#else
        u_xlatb10 = u_xlat4.y>=(-u_xlat4.y);
#endif
        u_xlat17.x = fract(abs(u_xlat4.y));
        u_xlat10.x = (u_xlatb10) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat10.x = (u_xlati3 != 0) ? u_xlat4.y : u_xlat10.x;
        u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
        u_xlat24 = u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
        u_xlat3.x = (u_xlatb3.x) ? u_xlat24 : u_xlat10.x;
        u_xlat10.x = u_xlat3.x * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat10.x>=(-u_xlat10.x));
#else
        u_xlatb24 = u_xlat10.x>=(-u_xlat10.x);
#endif
        u_xlat10.x = fract(abs(u_xlat10.x));
        u_xlat10.x = (u_xlatb24) ? u_xlat10.x : (-u_xlat10.x);
        u_xlat24 = u_xlat10.x + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(0.5<u_xlat10.x);
#else
        u_xlatb10 = 0.5<u_xlat10.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb11 = u_xlat24>=(-u_xlat24);
#endif
        u_xlat25 = fract(abs(u_xlat24));
        u_xlat11.x = (u_xlatb11) ? u_xlat25 : (-u_xlat25);
        u_xlat11.x = (-u_xlat11.x) + 1.0;
        u_xlat10.x = (u_xlatb10) ? u_xlat11.x : u_xlat24;
        u_xlat4.x = (u_xlatb3.z) ? u_xlat10.x : u_xlat3.x;
        u_xlat15.x = _GradientSettingsTex_TexelSize.x;
        u_xlat3.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy + u_xlat15.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat10.xz = u_xlat16_3.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat10.xz;
        u_xlat3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat16.xy = u_xlat15.xy * vec2(2.0, 2.0) + u_xlat16.xy;
        u_xlat16_1 = texture(_GradientSettingsTex, u_xlat16.xy);
        u_xlat16.xy = u_xlat16_1.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_1.xz * vec2(65025.0, 65025.0) + u_xlat16.xy;
        u_xlat16.xy = u_xlat2.xy * u_xlat3.xy;
        u_xlat2.xy = u_xlat2.xy * u_xlat16_6.xy;
        u_xlat2.xy = u_xlat4.xz * u_xlat2.xy + u_xlat16.xy;
        u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
        u_xlat1 = u_xlat10_1 * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat16_2 = texture(_CustomTex, u_xlat2.xy);
        u_xlat1 = u_xlat16_2 * vs_TEXCOORD2.yyyy + u_xlat1;
        u_xlat16_1 = u_xlat1;
    } else {
        u_xlat16_1 = u_xlat0;
    }
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
UNITY_LOCATION(4) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
flat out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat7;
vec2 u_xlat10;
vec2 u_xlat11;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat10.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat10.xy = u_xlat10.xy * vec2(0.03125, 0.03125);
    u_xlat10.x = in_TEXCOORD1.y * 2040.0 + u_xlat10.x;
    u_xlat11.y = in_TEXCOORD3.y * 2040.0 + u_xlat10.y;
    u_xlat1.y = u_xlat10.x * 3.0;
    u_xlat1.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat11.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.y;
    u_xlat0.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat0.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat2 = u_xlat1.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 2.5);
    u_xlat1.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
    u_xlat1.x = dot(u_xlat1, in_POSITION0);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat11.x = dot(u_xlat3.xy, in_TEXCOORD0.xy);
    u_xlat13.x = dot(u_xlat3, in_POSITION0);
    u_xlat11.y = dot(u_xlat2.xy, in_TEXCOORD0.xy);
    u_xlat13.y = dot(u_xlat2, in_POSITION0);
    u_xlat2.xy = u_xlat11.xy * _1PixelClipInvView.zw;
    u_xlat12.xy = abs(u_xlat2.xy) + vec2(9.99999997e-07, 9.99999997e-07);
    u_xlat2.xy = max(abs(u_xlat2.xy), vec2(1.0, 1.0));
    u_xlat3.xy = roundEven(u_xlat2.xy);
    u_xlat2.xy = max(u_xlat2.xy, u_xlat3.xy);
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    {
        vec4 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb4.w) ? u_xlat2.x : u_xlat3.x;
        hlslcc_movcTemp.y = (u_xlatb4.z) ? u_xlat2.y : u_xlat3.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy / u_xlat12.xy;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = min(u_xlat2.xy, vec2(100.0, 100.0));
    u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat6.xy = u_xlat11.xy * u_xlat2.xy;
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlatb16 = u_xlatb4.w || u_xlatb2.x;
    u_xlatb16 = u_xlatb4.z || u_xlatb16;
    u_xlat4.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.x ? float(1.0) : 0.0;
;
    u_xlat6.xy = bool(u_xlatb16) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat6.xy = u_xlat6.xy + u_xlat13.xy;
    u_xlat3 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat3;
    vs_TEXCOORD0.zw = u_xlat6.xy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
    u_xlat1.x = textureLod(_ShaderInfoTex, u_xlat0.zw, 0.0).w;
    u_xlat1.w = u_xlat1.x * in_COLOR0.w;
    u_xlat1.xyz = in_COLOR0.xyz;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat11.xy = u_xlat1.xy * _MainTex_TexelSize.xy;
    u_xlat2.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat17 = (u_xlatb2.w) ? -1.0 : -0.0;
    u_xlat3.y = u_xlat17 + u_xlat2.y;
    u_xlat7 = u_xlat2.z + u_xlat2.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat7==1.0);
#else
    u_xlatb12 = u_xlat7==1.0;
#endif
    vs_TEXCOORD0.xy = (bool(u_xlatb12)) ? u_xlat11.xy : u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb1.x = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat3.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat3.x;
    u_xlat1.x = u_xlat2.x + u_xlat1.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat1.x = u_xlat4.x + u_xlat1.x;
    u_xlat1.x = u_xlat4.y + u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat3.w = (-u_xlat1.x) + 1.0;
    vs_TEXCOORD1 = u_xlat3;
    u_xlat4.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat1.xy = in_TEXCOORD2.yy * vec2(255.0, 8160.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.y>=(-u_xlat1.y));
#else
    u_xlatb6 = u_xlat1.y>=(-u_xlat1.y);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat1.x = u_xlat6.y * u_xlat1.x;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat6.x;
    u_xlat6.x = in_TEXCOORD2.y * 255.0 + (-u_xlat1.x);
    u_xlat2.x = in_TEXCOORD1.z * 8160.0 + u_xlat1.x;
    u_xlat1.x = in_TEXCOORD1.w * 2040.0;
    u_xlat2.y = u_xlat6.x * 0.03125 + u_xlat1.x;
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = textureLod(_ShaderInfoTex, u_xlat0.xy, 0.0);
    vs_TEXCOORD4 = u_xlat0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GradientSettingsTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec3 vs_TEXCOORD2;
flat in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb10;
vec2 u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
vec2 u_xlat16;
vec2 u_xlat17;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD4.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD4.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_1.x = (-vs_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_8 = vs_TEXCOORD1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * u_xlat16_1.xxxx + vs_TEXCOORD1.wwww;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_2 * vec4(u_xlat16_8) + u_xlat0;
    u_xlat2.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat9 = dFdx(u_xlat2.x);
    u_xlat16.x = dFdy(u_xlat2.x);
    u_xlat9 = abs(u_xlat16.x) + abs(u_xlat9);
    u_xlat16.x = (-u_xlat9) + 0.5;
    u_xlat2.y = u_xlat9 + 0.5;
    u_xlat2.xy = (-u_xlat16.xx) + u_xlat2.xy;
    u_xlat9 = float(1.0) / u_xlat2.y;
    u_xlat2.x = u_xlat9 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat9;
    u_xlat16_1.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_1.w = u_xlat2.x * vs_TEXCOORD1.x;
    u_xlat16_0 = u_xlat0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    u_xlatb2.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y || u_xlatb2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = (u_xlatb2.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat1.y = vs_TEXCOORD2.z + 0.5;
        u_xlat1.x = float(0.5);
        u_xlat15.y = float(0.0);
        u_xlat16.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat16.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.0<u_xlat16_3.x);
#else
        u_xlatb3.x = 0.0<u_xlat16_3.x;
#endif
        u_xlat17.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat18.x = dot(u_xlat4.xy, u_xlat4.xy);
        u_xlat18.x = inversesqrt(u_xlat18.x);
        u_xlat18.xy = u_xlat18.xx * u_xlat4.xy;
        u_xlat5 = dot((-u_xlat17.xy), u_xlat18.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat5) * u_xlat5 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat5;
        u_xlat17.x = u_xlat17.x + u_xlat5;
        u_xlat5 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(u_xlat5<0.0);
#else
        u_xlatb12 = u_xlat5<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb12) ? u_xlat17.x : u_xlat5;
        u_xlat17.xy = u_xlat17.xx * u_xlat18.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb18 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb25 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xy / u_xlat17.xy;
        u_xlat24 = u_xlatb25 ? u_xlat17.y : float(0.0);
        u_xlat11.x = (u_xlatb18) ? u_xlat24 : u_xlat17.x;
        u_xlat11.y = 0.0;
        u_xlat4.yz = (u_xlatb3.x) ? u_xlat11.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_3.y * 255.0;
        u_xlati3 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat4.y>=(-u_xlat4.y));
#else
        u_xlatb10 = u_xlat4.y>=(-u_xlat4.y);
#endif
        u_xlat17.x = fract(abs(u_xlat4.y));
        u_xlat10.x = (u_xlatb10) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat10.x = (u_xlati3 != 0) ? u_xlat4.y : u_xlat10.x;
        u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
        u_xlat24 = u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
        u_xlat3.x = (u_xlatb3.x) ? u_xlat24 : u_xlat10.x;
        u_xlat10.x = u_xlat3.x * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat10.x>=(-u_xlat10.x));
#else
        u_xlatb24 = u_xlat10.x>=(-u_xlat10.x);
#endif
        u_xlat10.x = fract(abs(u_xlat10.x));
        u_xlat10.x = (u_xlatb24) ? u_xlat10.x : (-u_xlat10.x);
        u_xlat24 = u_xlat10.x + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(0.5<u_xlat10.x);
#else
        u_xlatb10 = 0.5<u_xlat10.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb11 = u_xlat24>=(-u_xlat24);
#endif
        u_xlat25 = fract(abs(u_xlat24));
        u_xlat11.x = (u_xlatb11) ? u_xlat25 : (-u_xlat25);
        u_xlat11.x = (-u_xlat11.x) + 1.0;
        u_xlat10.x = (u_xlatb10) ? u_xlat11.x : u_xlat24;
        u_xlat4.x = (u_xlatb3.z) ? u_xlat10.x : u_xlat3.x;
        u_xlat15.x = _GradientSettingsTex_TexelSize.x;
        u_xlat3.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy + u_xlat15.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat10.xz = u_xlat16_3.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat10.xz;
        u_xlat3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat16.xy = u_xlat15.xy * vec2(2.0, 2.0) + u_xlat16.xy;
        u_xlat16_1 = texture(_GradientSettingsTex, u_xlat16.xy);
        u_xlat16.xy = u_xlat16_1.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_1.xz * vec2(65025.0, 65025.0) + u_xlat16.xy;
        u_xlat16.xy = u_xlat2.xy * u_xlat3.xy;
        u_xlat2.xy = u_xlat2.xy * u_xlat16_6.xy;
        u_xlat2.xy = u_xlat4.xz * u_xlat2.xy + u_xlat16.xy;
        u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
        u_xlat1 = u_xlat10_1 * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat16_2 = texture(_CustomTex, u_xlat2.xy);
        u_xlat1 = u_xlat16_2 * vs_TEXCOORD2.yyyy + u_xlat1;
        u_xlat16_1 = u_xlat1;
    } else {
        u_xlat16_1 = u_xlat0;
    }
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
UNITY_LOCATION(4) uniform mediump sampler2D _ShaderInfoTex;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec3 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
flat out mediump vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
bvec4 u_xlatb1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec4 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec2 u_xlat6;
bool u_xlatb6;
float u_xlat7;
vec2 u_xlat10;
vec2 u_xlat11;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
bool u_xlatb16;
float u_xlat17;
void main()
{
    u_xlat0 = in_TEXCOORD2.xxzz * vec4(255.0, 8160.0, 255.0, 8160.0);
    u_xlatb1 = greaterThanEqual(u_xlat0.yyww, (-u_xlat0.yyww));
    u_xlat1.x = (u_xlatb1.x) ? float(32.0) : float(-32.0);
    u_xlat1.y = (u_xlatb1.y) ? float(0.03125) : float(-0.03125);
    u_xlat1.z = (u_xlatb1.z) ? float(32.0) : float(-32.0);
    u_xlat1.w = (u_xlatb1.w) ? float(0.03125) : float(-0.03125);
    u_xlat0.xy = u_xlat0.xz * u_xlat1.yw;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xz;
    u_xlat10.xy = in_TEXCOORD2.xz * vec2(255.0, 255.0) + (-u_xlat0.xy);
    u_xlat10.xy = u_xlat10.xy * vec2(0.03125, 0.03125);
    u_xlat10.x = in_TEXCOORD1.y * 2040.0 + u_xlat10.x;
    u_xlat11.y = in_TEXCOORD3.y * 2040.0 + u_xlat10.y;
    u_xlat1.y = u_xlat10.x * 3.0;
    u_xlat1.x = in_TEXCOORD1.x * 8160.0 + u_xlat0.x;
    u_xlat11.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.y;
    u_xlat0.xy = u_xlat11.xy + vec2(0.5, 0.5);
    u_xlat0.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat2 = u_xlat1.xyxy + vec4(0.5, 0.5, 0.5, 1.5);
    u_xlat1.xy = u_xlat1.xy + vec2(0.5, 2.5);
    u_xlat1.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    u_xlat1 = textureLod(_ShaderInfoTex, u_xlat1.xy, 0.0);
    u_xlat1.x = dot(u_xlat1, in_POSITION0);
    u_xlat2 = u_xlat2 * _ShaderInfoTex_TexelSize.xyxy;
    u_xlat3 = textureLod(_ShaderInfoTex, u_xlat2.xy, 0.0);
    u_xlat2 = textureLod(_ShaderInfoTex, u_xlat2.zw, 0.0);
    u_xlat11.x = dot(u_xlat3.xy, in_TEXCOORD0.xy);
    u_xlat13.x = dot(u_xlat3, in_POSITION0);
    u_xlat11.y = dot(u_xlat2.xy, in_TEXCOORD0.xy);
    u_xlat13.y = dot(u_xlat2, in_POSITION0);
    u_xlat2.xy = u_xlat11.xy * _1PixelClipInvView.zw;
    u_xlat12.xy = abs(u_xlat2.xy) + vec2(9.99999997e-07, 9.99999997e-07);
    u_xlat2.xy = max(abs(u_xlat2.xy), vec2(1.0, 1.0));
    u_xlat3.xy = roundEven(u_xlat2.xy);
    u_xlat2.xy = max(u_xlat2.xy, u_xlat3.xy);
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    {
        vec4 hlslcc_movcTemp = u_xlat2;
        hlslcc_movcTemp.x = (u_xlatb4.w) ? u_xlat2.x : u_xlat3.x;
        hlslcc_movcTemp.y = (u_xlatb4.z) ? u_xlat2.y : u_xlat3.y;
        u_xlat2 = hlslcc_movcTemp;
    }
    u_xlat2.xy = u_xlat2.xy / u_xlat12.xy;
    u_xlat2.xy = max(u_xlat2.xy, vec2(0.00999999978, 0.00999999978));
    u_xlat2.xy = min(u_xlat2.xy, vec2(100.0, 100.0));
    u_xlat2.xy = u_xlat2.xy + vec2(-1.0, -1.0);
    u_xlat6.xy = u_xlat11.xy * u_xlat2.xy;
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlatb16 = u_xlatb4.w || u_xlatb2.x;
    u_xlatb16 = u_xlatb4.z || u_xlatb16;
    u_xlat4.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat4.y = u_xlatb4.x ? float(1.0) : 0.0;
;
    u_xlat6.xy = bool(u_xlatb16) ? u_xlat6.xy : vec2(0.0, 0.0);
    u_xlat6.xy = u_xlat6.xy + u_xlat13.xy;
    u_xlat3 = u_xlat6.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat3 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat6.xxxx + u_xlat3;
    vs_TEXCOORD0.zw = u_xlat6.xy;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat3 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat3;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat3;
    u_xlat1.x = textureLod(_ShaderInfoTex, u_xlat0.zw, 0.0).w;
    u_xlat1.w = u_xlat1.x * in_COLOR0.w;
    u_xlat1.xyz = in_COLOR0.xyz;
    vs_COLOR0 = u_xlat1;
    u_xlat1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat11.xy = u_xlat1.xy * _MainTex_TexelSize.xy;
    u_xlat2.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat2.y = u_xlatb2.z ? float(1.0) : 0.0;
    u_xlat2.z = u_xlatb2.w ? float(1.0) : 0.0;
;
    u_xlat17 = (u_xlatb2.w) ? -1.0 : -0.0;
    u_xlat3.y = u_xlat17 + u_xlat2.y;
    u_xlat7 = u_xlat2.z + u_xlat2.y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat7==1.0);
#else
    u_xlatb12 = u_xlat7==1.0;
#endif
    vs_TEXCOORD0.xy = (bool(u_xlatb12)) ? u_xlat11.xy : u_xlat1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb1.x = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat3.x = u_xlatb1.x ? 1.0 : float(0.0);
    u_xlat1.x = u_xlat7 + u_xlat3.x;
    u_xlat1.x = u_xlat2.x + u_xlat1.x;
    u_xlat3.z = u_xlat2.x;
    u_xlat1.x = u_xlat4.x + u_xlat1.x;
    u_xlat1.x = u_xlat4.y + u_xlat1.x;
    u_xlat1.x = min(u_xlat1.x, 1.0);
    u_xlat3.w = (-u_xlat1.x) + 1.0;
    vs_TEXCOORD1 = u_xlat3;
    u_xlat4.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
    vs_TEXCOORD2.xyz = u_xlat4.xyz;
    u_xlat1.xy = in_TEXCOORD2.yy * vec2(255.0, 8160.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat1.y>=(-u_xlat1.y));
#else
    u_xlatb6 = u_xlat1.y>=(-u_xlat1.y);
#endif
    u_xlat6.xy = (bool(u_xlatb6)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat1.x = u_xlat6.y * u_xlat1.x;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * u_xlat6.x;
    u_xlat6.x = in_TEXCOORD2.y * 255.0 + (-u_xlat1.x);
    u_xlat2.x = in_TEXCOORD1.z * 8160.0 + u_xlat1.x;
    u_xlat1.x = in_TEXCOORD1.w * 2040.0;
    u_xlat2.y = u_xlat6.x * 0.03125 + u_xlat1.x;
    u_xlat1.xy = u_xlat2.xy + vec2(0.5, 0.5);
    u_xlat0.xy = u_xlat1.xy * _ShaderInfoTex_TexelSize.xy;
    vs_TEXCOORD3 = u_xlat0;
    u_xlat0 = textureLod(_ShaderInfoTex, u_xlat0.xy, 0.0);
    vs_TEXCOORD4 = u_xlat0;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _PixelClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(1) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GradientSettingsTex;
UNITY_LOCATION(3) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec3 vs_TEXCOORD2;
flat in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat10_0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat10_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat10_2;
bvec2 u_xlatb2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
int u_xlati3;
bvec3 u_xlatb3;
vec3 u_xlat4;
float u_xlat5;
mediump vec2 u_xlat16_6;
mediump float u_xlat16_8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb10;
vec2 u_xlat11;
bool u_xlatb11;
bool u_xlatb12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat15;
vec2 u_xlat16;
vec2 u_xlat17;
vec2 u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD0.zwzz, vs_TEXCOORD4.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(vs_TEXCOORD4.zzzw, vs_TEXCOORD0.zzzw).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_1.x = (-vs_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_8 = vs_TEXCOORD1.y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8 = min(max(u_xlat16_8, 0.0), 1.0);
#else
    u_xlat16_8 = clamp(u_xlat16_8, 0.0, 1.0);
#endif
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_0 * u_xlat16_1.xxxx + vs_TEXCOORD1.wwww;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat10_2 * vec4(u_xlat16_8) + u_xlat0;
    u_xlat2.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat9 = dFdx(u_xlat2.x);
    u_xlat16.x = dFdy(u_xlat2.x);
    u_xlat9 = abs(u_xlat16.x) + abs(u_xlat9);
    u_xlat16.x = (-u_xlat9) + 0.5;
    u_xlat2.y = u_xlat9 + 0.5;
    u_xlat2.xy = (-u_xlat16.xx) + u_xlat2.xy;
    u_xlat9 = float(1.0) / u_xlat2.y;
    u_xlat2.x = u_xlat9 * u_xlat2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat2.x * -2.0 + 3.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat9;
    u_xlat16_1.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_1.w = u_xlat2.x * vs_TEXCOORD1.x;
    u_xlat16_0 = u_xlat0 + u_xlat16_1;
    u_xlat16_1 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_1 * vs_TEXCOORD1.zzzz + u_xlat16_0;
    u_xlatb2.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb2.x = u_xlatb2.y || u_xlatb2.x;
    if(u_xlatb2.x){
        u_xlat2.xy = (u_xlatb2.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat1.y = vs_TEXCOORD2.z + 0.5;
        u_xlat1.x = float(0.5);
        u_xlat15.y = float(0.0);
        u_xlat16.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat16.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.0<u_xlat16_3.x);
#else
        u_xlatb3.x = 0.0<u_xlat16_3.x;
#endif
        u_xlat17.xy = u_xlat16_3.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xy = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xy = u_xlat4.xy * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat18.x = dot(u_xlat4.xy, u_xlat4.xy);
        u_xlat18.x = inversesqrt(u_xlat18.x);
        u_xlat18.xy = u_xlat18.xx * u_xlat4.xy;
        u_xlat5 = dot((-u_xlat17.xy), u_xlat18.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat5) * u_xlat5 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat5;
        u_xlat17.x = u_xlat17.x + u_xlat5;
        u_xlat5 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb12 = !!(u_xlat5<0.0);
#else
        u_xlatb12 = u_xlat5<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb12) ? u_xlat17.x : u_xlat5;
        u_xlat17.xy = u_xlat17.xx * u_xlat18.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb18 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb18 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb25 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xy / u_xlat17.xy;
        u_xlat24 = u_xlatb25 ? u_xlat17.y : float(0.0);
        u_xlat11.x = (u_xlatb18) ? u_xlat24 : u_xlat17.x;
        u_xlat11.y = 0.0;
        u_xlat4.yz = (u_xlatb3.x) ? u_xlat11.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_3.y * 255.0;
        u_xlati3 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(u_xlat4.y>=(-u_xlat4.y));
#else
        u_xlatb10 = u_xlat4.y>=(-u_xlat4.y);
#endif
        u_xlat17.x = fract(abs(u_xlat4.y));
        u_xlat10.x = (u_xlatb10) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat10.x = (u_xlati3 != 0) ? u_xlat4.y : u_xlat10.x;
        u_xlatb3.xz = equal(ivec4(u_xlati3), ivec4(1, 0, 2, 0)).xz;
        u_xlat24 = u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat24 = min(max(u_xlat24, 0.0), 1.0);
#else
        u_xlat24 = clamp(u_xlat24, 0.0, 1.0);
#endif
        u_xlat3.x = (u_xlatb3.x) ? u_xlat24 : u_xlat10.x;
        u_xlat10.x = u_xlat3.x * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat10.x>=(-u_xlat10.x));
#else
        u_xlatb24 = u_xlat10.x>=(-u_xlat10.x);
#endif
        u_xlat10.x = fract(abs(u_xlat10.x));
        u_xlat10.x = (u_xlatb24) ? u_xlat10.x : (-u_xlat10.x);
        u_xlat24 = u_xlat10.x + u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb10 = !!(0.5<u_xlat10.x);
#else
        u_xlatb10 = 0.5<u_xlat10.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb11 = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb11 = u_xlat24>=(-u_xlat24);
#endif
        u_xlat25 = fract(abs(u_xlat24));
        u_xlat11.x = (u_xlatb11) ? u_xlat25 : (-u_xlat25);
        u_xlat11.x = (-u_xlat11.x) + 1.0;
        u_xlat10.x = (u_xlatb10) ? u_xlat11.x : u_xlat24;
        u_xlat4.x = (u_xlatb3.z) ? u_xlat10.x : u_xlat3.x;
        u_xlat15.x = _GradientSettingsTex_TexelSize.x;
        u_xlat3.xy = u_xlat1.xy * _GradientSettingsTex_TexelSize.xy + u_xlat15.xy;
        u_xlat16_3 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat10.xz = u_xlat16_3.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_3.xz * vec2(65025.0, 65025.0) + u_xlat10.xz;
        u_xlat3.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat16.xy = u_xlat15.xy * vec2(2.0, 2.0) + u_xlat16.xy;
        u_xlat16_1 = texture(_GradientSettingsTex, u_xlat16.xy);
        u_xlat16.xy = u_xlat16_1.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_1.xz * vec2(65025.0, 65025.0) + u_xlat16.xy;
        u_xlat16.xy = u_xlat2.xy * u_xlat3.xy;
        u_xlat2.xy = u_xlat2.xy * u_xlat16_6.xy;
        u_xlat2.xy = u_xlat4.xz * u_xlat2.xy + u_xlat16.xy;
        u_xlat10_1 = texture(_MainTex, u_xlat2.xy);
        u_xlat1 = u_xlat10_1 * vs_TEXCOORD2.xxxx + u_xlat0;
        u_xlat16_2 = texture(_CustomTex, u_xlat2.xy);
        u_xlat1 = u_xlat16_2 * vs_TEXCOORD2.yyyy + u_xlat1;
        u_xlat16_1 = u_xlat1;
    } else {
        u_xlat16_1 = u_xlat0;
    }
    SV_Target0 = u_xlat16_1 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 664
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %89 %100 %186 %211 %391 %430 %449 %458 %563 %572 %648 %656 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %100 Location 100 
                                                      OpDecorate %136 ArrayStride 136 
                                                      OpDecorate %137 ArrayStride 137 
                                                      OpMemberDecorate %138 0 Offset 138 
                                                      OpMemberDecorate %138 1 Offset 138 
                                                      OpMemberDecorate %138 2 Offset 138 
                                                      OpMemberDecorate %138 3 Offset 138 
                                                      OpMemberDecorate %138 4 Offset 138 
                                                      OpMemberDecorate %138 5 Offset 138 
                                                      OpDecorate %138 Block 
                                                      OpDecorate %140 DescriptorSet 140 
                                                      OpDecorate %140 Binding 140 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %173 DescriptorSet 173 
                                                      OpDecorate %173 Binding 173 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %177 DescriptorSet 177 
                                                      OpDecorate %177 Binding 177 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %211 Location 211 
                                                      OpDecorate vs_TEXCOORD0 Location 391 
                                                      OpMemberDecorate %428 0 BuiltIn 428 
                                                      OpMemberDecorate %428 1 BuiltIn 428 
                                                      OpMemberDecorate %428 2 BuiltIn 428 
                                                      OpDecorate %428 Block 
                                                      OpDecorate %439 RelaxedPrecision 
                                                      OpDecorate %440 RelaxedPrecision 
                                                      OpDecorate %449 Location 449 
                                                      OpDecorate %458 RelaxedPrecision 
                                                      OpDecorate %458 Location 458 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 563 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 572 
                                                      OpDecorate vs_TEXCOORD3 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD3 Location 648 
                                                      OpDecorate %650 RelaxedPrecision 
                                                      OpDecorate %651 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD4 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD4 Flat 
                                                      OpDecorate vs_TEXCOORD4 Location 656 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                          f32 %14 = OpConstant 3.674022E-40 
                                          f32 %15 = OpConstant 3.674022E-40 
                                        f32_4 %16 = OpConstantComposite %14 %15 %14 %15 
                                              %18 = OpTypeBool 
                                              %19 = OpTypeVector %18 4 
                                              %20 = OpTypePointer Private %19 
                              Private bool_4* %21 = OpVariable Private 
                               Private f32_4* %28 = OpVariable Private 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %18 
                                          f32 %34 = OpConstant 3.674022E-40 
                                          f32 %35 = OpConstant 3.674022E-40 
                                              %37 = OpTypePointer Private %6 
                                          u32 %39 = OpConstant 1 
                                          f32 %42 = OpConstant 3.674022E-40 
                                          f32 %43 = OpConstant 3.674022E-40 
                                          u32 %46 = OpConstant 2 
                                          u32 %51 = OpConstant 3 
                                              %56 = OpTypeVector %6 2 
                                              %76 = OpTypePointer Private %56 
                               Private f32_2* %77 = OpVariable Private 
                                        f32_2 %80 = OpConstantComposite %14 %14 
                                        f32_2 %87 = OpConstantComposite %42 %42 
                                 Input f32_4* %89 = OpVariable Input 
                                              %90 = OpTypePointer Input %6 
                                          f32 %93 = OpConstant 3.674022E-40 
                               Private f32_2* %99 = OpVariable Private 
                                Input f32_4* %100 = OpVariable Input 
                                         f32 %110 = OpConstant 3.674022E-40 
                                         f32 %128 = OpConstant 3.674022E-40 
                                       f32_2 %129 = OpConstantComposite %128 %128 
                                         u32 %135 = OpConstant 4 
                                             %136 = OpTypeArray %7 %135 
                                             %137 = OpTypeArray %7 %135 
                                             %138 = OpTypeStruct %136 %137 %7 %7 %7 %7 
                                             %139 = OpTypePointer Uniform %138 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %140 = OpVariable Uniform 
                                             %141 = OpTypeInt 32 1 
                                         i32 %142 = OpConstant 4 
                                             %143 = OpTypePointer Uniform %7 
                              Private f32_4* %150 = OpVariable Private 
                                         f32 %153 = OpConstant 3.674022E-40 
                                       f32_4 %154 = OpConstantComposite %128 %128 %128 %153 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_2 %159 = OpConstantComposite %128 %158 
                                             %171 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %172 = OpTypePointer UniformConstant %171 
        UniformConstant read_only Texture2D* %173 = OpVariable UniformConstant 
                                             %175 = OpTypeSampler 
                                             %176 = OpTypePointer UniformConstant %175 
                    UniformConstant sampler* %177 = OpVariable UniformConstant 
                                             %179 = OpTypeSampledImage %171 
                                         f32 %183 = OpConstant 3.674022E-40 
                                Input f32_4* %186 = OpVariable Input 
                              Private f32_4* %195 = OpVariable Private 
                                             %210 = OpTypePointer Input %56 
                                Input f32_2* %211 = OpVariable Input 
                              Private f32_2* %215 = OpVariable Private 
                                         i32 %230 = OpConstant 5 
                              Private f32_2* %237 = OpVariable Private 
                                         f32 %241 = OpConstant 3.674022E-40 
                                       f32_2 %242 = OpConstantComposite %241 %241 
                                         f32 %247 = OpConstant 3.674022E-40 
                                       f32_2 %248 = OpConstantComposite %247 %247 
                             Private bool_4* %264 = OpVariable Private 
                                         f32 %267 = OpConstant 3.674022E-40 
                                         f32 %268 = OpConstant 3.674022E-40 
                                         f32 %269 = OpConstant 3.674022E-40 
                                         f32 %270 = OpConstant 3.674022E-40 
                                       f32_4 %271 = OpConstantComposite %267 %268 %269 %270 
                                             %273 = OpTypePointer Function %7 
                                             %278 = OpTypePointer Function %6 
                                         f32 %310 = OpConstant 3.674022E-40 
                                       f32_2 %311 = OpConstantComposite %310 %310 
                                         f32 %317 = OpConstant 3.674022E-40 
                                       f32_2 %318 = OpConstantComposite %317 %317 
                                         f32 %324 = OpConstant 3.674022E-40 
                                       f32_2 %325 = OpConstantComposite %324 %324 
                              Private f32_2* %329 = OpVariable Private 
                             Private bool_4* %334 = OpVariable Private 
                                         f32 %337 = OpConstant 3.674022E-40 
                                         f32 %338 = OpConstant 3.674022E-40 
                                         f32 %339 = OpConstant 3.674022E-40 
                                         f32 %340 = OpConstant 3.674022E-40 
                                       f32_4 %341 = OpConstantComposite %337 %338 %339 %340 
                               Private bool* %343 = OpVariable Private 
                                             %353 = OpTypeVector %6 3 
                                             %354 = OpTypePointer Private %353 
                              Private f32_3* %355 = OpVariable Private 
                                             %365 = OpTypePointer Function %56 
                                       f32_2 %371 = OpConstantComposite %183 %183 
                                         i32 %378 = OpConstant 0 
                                         i32 %379 = OpConstant 1 
                                             %390 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                         i32 %395 = OpConstant 2 
                                         i32 %404 = OpConstant 3 
                                             %427 = OpTypeArray %6 %39 
                                             %428 = OpTypeStruct %7 %6 %427 
                                             %429 = OpTypePointer Output %428 
        Output struct {f32_4; f32; f32[1];}* %430 = OpVariable Output 
                                Input f32_4* %449 = OpVariable Input 
                               Output f32_4* %458 = OpVariable Output 
                                Private f32* %489 = OpVariable Private 
                                         f32 %492 = OpConstant 3.674022E-40 
                                Private f32* %499 = OpVariable Private 
                               Private bool* %505 = OpVariable Private 
                                         f32 %521 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         f32 %567 = OpConstant 3.674022E-40 
                                       f32_2 %568 = OpConstantComposite %567 %14 
                                             %571 = OpTypePointer Output %353 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                       f32_2 %576 = OpConstantComposite %14 %15 
                               Private bool* %580 = OpVariable Private 
                                       f32_2 %588 = OpConstantComposite %34 %42 
                                       f32_2 %589 = OpConstantComposite %35 %43 
                                             %590 = OpTypeVector %18 2 
                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
                                             %658 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_4* %274 = OpVariable Function 
                               Function f32* %279 = OpVariable Function 
                               Function f32* %291 = OpVariable Function 
                             Function f32_2* %366 = OpVariable Function 
                             Function f32_2* %509 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 0 0 2 2 
                                        f32_4 %17 = OpFMul %13 %16 
                                                      OpStore %9 %17 
                                        f32_4 %22 = OpLoad %9 
                                        f32_4 %23 = OpVectorShuffle %22 %22 1 1 3 3 
                                        f32_4 %24 = OpLoad %9 
                                        f32_4 %25 = OpVectorShuffle %24 %24 1 1 3 3 
                                        f32_4 %26 = OpFNegate %25 
                                       bool_4 %27 = OpFOrdGreaterThanEqual %23 %26 
                                                      OpStore %21 %27 
                                Private bool* %32 = OpAccessChain %21 %30 
                                         bool %33 = OpLoad %32 
                                          f32 %36 = OpSelect %33 %34 %35 
                                 Private f32* %38 = OpAccessChain %28 %30 
                                                      OpStore %38 %36 
                                Private bool* %40 = OpAccessChain %21 %39 
                                         bool %41 = OpLoad %40 
                                          f32 %44 = OpSelect %41 %42 %43 
                                 Private f32* %45 = OpAccessChain %28 %39 
                                                      OpStore %45 %44 
                                Private bool* %47 = OpAccessChain %21 %46 
                                         bool %48 = OpLoad %47 
                                          f32 %49 = OpSelect %48 %34 %35 
                                 Private f32* %50 = OpAccessChain %28 %46 
                                                      OpStore %50 %49 
                                Private bool* %52 = OpAccessChain %21 %51 
                                         bool %53 = OpLoad %52 
                                          f32 %54 = OpSelect %53 %42 %43 
                                 Private f32* %55 = OpAccessChain %28 %51 
                                                      OpStore %55 %54 
                                        f32_4 %57 = OpLoad %9 
                                        f32_2 %58 = OpVectorShuffle %57 %57 0 2 
                                        f32_4 %59 = OpLoad %28 
                                        f32_2 %60 = OpVectorShuffle %59 %59 1 3 
                                        f32_2 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 3 
                                                      OpStore %9 %63 
                                        f32_4 %64 = OpLoad %9 
                                        f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                        f32_2 %66 = OpExtInst %1 10 %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpVectorShuffle %67 %66 4 5 2 3 
                                                      OpStore %9 %68 
                                        f32_4 %69 = OpLoad %9 
                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                        f32_4 %71 = OpLoad %28 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 2 
                                        f32_2 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 2 3 
                                                      OpStore %9 %75 
                                        f32_4 %78 = OpLoad %11 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 2 
                                        f32_2 %81 = OpFMul %79 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_2 %84 = OpFNegate %83 
                                        f32_2 %85 = OpFAdd %81 %84 
                                                      OpStore %77 %85 
                                        f32_2 %86 = OpLoad %77 
                                        f32_2 %88 = OpFMul %86 %87 
                                                      OpStore %77 %88 
                                   Input f32* %91 = OpAccessChain %89 %39 
                                          f32 %92 = OpLoad %91 
                                          f32 %94 = OpFMul %92 %93 
                                 Private f32* %95 = OpAccessChain %77 %30 
                                          f32 %96 = OpLoad %95 
                                          f32 %97 = OpFAdd %94 %96 
                                 Private f32* %98 = OpAccessChain %77 %30 
                                                      OpStore %98 %97 
                                  Input f32* %101 = OpAccessChain %100 %39 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFMul %102 %93 
                                Private f32* %104 = OpAccessChain %77 %39 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFAdd %103 %105 
                                Private f32* %107 = OpAccessChain %99 %39 
                                                      OpStore %107 %106 
                                Private f32* %108 = OpAccessChain %77 %30 
                                         f32 %109 = OpLoad %108 
                                         f32 %111 = OpFMul %109 %110 
                                Private f32* %112 = OpAccessChain %28 %39 
                                                      OpStore %112 %111 
                                  Input f32* %113 = OpAccessChain %89 %30 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %114 %15 
                                Private f32* %116 = OpAccessChain %9 %30 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFAdd %115 %117 
                                Private f32* %119 = OpAccessChain %28 %30 
                                                      OpStore %119 %118 
                                  Input f32* %120 = OpAccessChain %100 %30 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFMul %121 %15 
                                Private f32* %123 = OpAccessChain %9 %39 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFAdd %122 %124 
                                Private f32* %126 = OpAccessChain %99 %30 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %99 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                              Uniform f32_4* %144 = OpAccessChain %140 %142 
                                       f32_4 %145 = OpLoad %144 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %147 = OpFMul %134 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 0 1 4 5 
                                                      OpStore %9 %149 
                                       f32_4 %151 = OpLoad %28 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 1 0 1 
                                       f32_4 %155 = OpFAdd %152 %154 
                                                      OpStore %150 %155 
                                       f32_4 %156 = OpLoad %28 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                                       f32_2 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %28 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 3 
                                                      OpStore %28 %162 
                                       f32_4 %163 = OpLoad %28 
                                       f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                              Uniform f32_4* %165 = OpAccessChain %140 %142 
                                       f32_4 %166 = OpLoad %165 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFMul %164 %167 
                                       f32_4 %169 = OpLoad %28 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 2 3 
                                                      OpStore %28 %170 
                         read_only Texture2D %174 = OpLoad %173 
                                     sampler %178 = OpLoad %177 
                  read_only Texture2DSampled %180 = OpSampledImage %174 %178 
                                       f32_4 %181 = OpLoad %28 
                                       f32_2 %182 = OpVectorShuffle %181 %181 0 1 
                                       f32_4 %184 = OpImageSampleExplicitLod %180 %182 Lod %7 
                                                      OpStore %28 %184 
                                       f32_4 %185 = OpLoad %28 
                                       f32_4 %187 = OpLoad %186 
                                         f32 %188 = OpDot %185 %187 
                                Private f32* %189 = OpAccessChain %28 %30 
                                                      OpStore %189 %188 
                                       f32_4 %190 = OpLoad %150 
                              Uniform f32_4* %191 = OpAccessChain %140 %142 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpVectorShuffle %192 %192 0 1 0 1 
                                       f32_4 %194 = OpFMul %190 %193 
                                                      OpStore %150 %194 
                         read_only Texture2D %196 = OpLoad %173 
                                     sampler %197 = OpLoad %177 
                  read_only Texture2DSampled %198 = OpSampledImage %196 %197 
                                       f32_4 %199 = OpLoad %150 
                                       f32_2 %200 = OpVectorShuffle %199 %199 0 1 
                                       f32_4 %201 = OpImageSampleExplicitLod %198 %200 Lod %7 
                                                      OpStore %195 %201 
                         read_only Texture2D %202 = OpLoad %173 
                                     sampler %203 = OpLoad %177 
                  read_only Texture2DSampled %204 = OpSampledImage %202 %203 
                                       f32_4 %205 = OpLoad %150 
                                       f32_2 %206 = OpVectorShuffle %205 %205 2 3 
                                       f32_4 %207 = OpImageSampleExplicitLod %204 %206 Lod %7 
                                                      OpStore %150 %207 
                                       f32_4 %208 = OpLoad %195 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_2 %212 = OpLoad %211 
                                         f32 %213 = OpDot %209 %212 
                                Private f32* %214 = OpAccessChain %99 %30 
                                                      OpStore %214 %213 
                                       f32_4 %216 = OpLoad %195 
                                       f32_4 %217 = OpLoad %186 
                                         f32 %218 = OpDot %216 %217 
                                Private f32* %219 = OpAccessChain %215 %30 
                                                      OpStore %219 %218 
                                       f32_4 %220 = OpLoad %150 
                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                       f32_2 %222 = OpLoad %211 
                                         f32 %223 = OpDot %221 %222 
                                Private f32* %224 = OpAccessChain %99 %39 
                                                      OpStore %224 %223 
                                       f32_4 %225 = OpLoad %150 
                                       f32_4 %226 = OpLoad %186 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %215 %39 
                                                      OpStore %228 %227 
                                       f32_2 %229 = OpLoad %99 
                              Uniform f32_4* %231 = OpAccessChain %140 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_2 %233 = OpVectorShuffle %232 %232 2 3 
                                       f32_2 %234 = OpFMul %229 %233 
                                       f32_4 %235 = OpLoad %150 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
                                                      OpStore %150 %236 
                                       f32_4 %238 = OpLoad %150 
                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
                                       f32_2 %240 = OpExtInst %1 4 %239 
                                       f32_2 %243 = OpFAdd %240 %242 
                                                      OpStore %237 %243 
                                       f32_4 %244 = OpLoad %150 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_2 %246 = OpExtInst %1 4 %245 
                                       f32_2 %249 = OpExtInst %1 40 %246 %248 
                                       f32_4 %250 = OpLoad %150 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 2 3 
                                                      OpStore %150 %251 
                                       f32_4 %252 = OpLoad %150 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                                       f32_2 %254 = OpExtInst %1 2 %253 
                                       f32_4 %255 = OpLoad %195 
                                       f32_4 %256 = OpVectorShuffle %255 %254 4 5 2 3 
                                                      OpStore %195 %256 
                                       f32_4 %257 = OpLoad %150 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 1 
                                       f32_4 %259 = OpLoad %195 
                                       f32_2 %260 = OpVectorShuffle %259 %259 0 1 
                                       f32_2 %261 = OpExtInst %1 40 %258 %260 
                                       f32_4 %262 = OpLoad %150 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 3 
                                                      OpStore %150 %263 
                                       f32_4 %265 = OpLoad %11 
                                       f32_4 %266 = OpVectorShuffle %265 %265 3 3 3 3 
                                      bool_4 %272 = OpFOrdEqual %266 %271 
                                                      OpStore %264 %272 
                                       f32_4 %275 = OpLoad %150 
                                                      OpStore %274 %275 
                               Private bool* %276 = OpAccessChain %264 %51 
                                        bool %277 = OpLoad %276 
                                                      OpSelectionMerge %281 None 
                                                      OpBranchConditional %277 %280 %284 
                                             %280 = OpLabel 
                                Private f32* %282 = OpAccessChain %150 %30 
                                         f32 %283 = OpLoad %282 
                                                      OpStore %279 %283 
                                                      OpBranch %281 
                                             %284 = OpLabel 
                                Private f32* %285 = OpAccessChain %195 %30 
                                         f32 %286 = OpLoad %285 
                                                      OpStore %279 %286 
                                                      OpBranch %281 
                                             %281 = OpLabel 
                                         f32 %287 = OpLoad %279 
                               Function f32* %288 = OpAccessChain %274 %30 
                                                      OpStore %288 %287 
                               Private bool* %289 = OpAccessChain %264 %46 
                                        bool %290 = OpLoad %289 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %290 %292 %296 
                                             %292 = OpLabel 
                                Private f32* %294 = OpAccessChain %150 %39 
                                         f32 %295 = OpLoad %294 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                Private f32* %297 = OpAccessChain %195 %39 
                                         f32 %298 = OpLoad %297 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                         f32 %299 = OpLoad %291 
                               Function f32* %300 = OpAccessChain %274 %39 
                                                      OpStore %300 %299 
                                       f32_4 %301 = OpLoad %274 
                                                      OpStore %150 %301 
                                       f32_4 %302 = OpLoad %150 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                       f32_2 %304 = OpLoad %237 
                                       f32_2 %305 = OpFDiv %303 %304 
                                       f32_4 %306 = OpLoad %150 
                                       f32_4 %307 = OpVectorShuffle %306 %305 4 5 2 3 
                                                      OpStore %150 %307 
                                       f32_4 %308 = OpLoad %150 
                                       f32_2 %309 = OpVectorShuffle %308 %308 0 1 
                                       f32_2 %312 = OpExtInst %1 40 %309 %311 
                                       f32_4 %313 = OpLoad %150 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 5 2 3 
                                                      OpStore %150 %314 
                                       f32_4 %315 = OpLoad %150 
                                       f32_2 %316 = OpVectorShuffle %315 %315 0 1 
                                       f32_2 %319 = OpExtInst %1 37 %316 %318 
                                       f32_4 %320 = OpLoad %150 
                                       f32_4 %321 = OpVectorShuffle %320 %319 4 5 2 3 
                                                      OpStore %150 %321 
                                       f32_4 %322 = OpLoad %150 
                                       f32_2 %323 = OpVectorShuffle %322 %322 0 1 
                                       f32_2 %326 = OpFAdd %323 %325 
                                       f32_4 %327 = OpLoad %150 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 2 3 
                                                      OpStore %150 %328 
                                       f32_2 %330 = OpLoad %99 
                                       f32_4 %331 = OpLoad %150 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                       f32_2 %333 = OpFMul %330 %332 
                                                      OpStore %329 %333 
                                       f32_4 %335 = OpLoad %11 
                                       f32_4 %336 = OpVectorShuffle %335 %335 3 3 3 3 
                                      bool_4 %342 = OpFOrdEqual %336 %341 
                                                      OpStore %334 %342 
                               Private bool* %344 = OpAccessChain %264 %51 
                                        bool %345 = OpLoad %344 
                               Private bool* %346 = OpAccessChain %334 %30 
                                        bool %347 = OpLoad %346 
                                        bool %348 = OpLogicalOr %345 %347 
                                                      OpStore %343 %348 
                               Private bool* %349 = OpAccessChain %264 %46 
                                        bool %350 = OpLoad %349 
                                        bool %351 = OpLoad %343 
                                        bool %352 = OpLogicalOr %350 %351 
                                                      OpStore %343 %352 
                               Private bool* %356 = OpAccessChain %264 %39 
                                        bool %357 = OpLoad %356 
                                         f32 %358 = OpSelect %357 %247 %183 
                                Private f32* %359 = OpAccessChain %355 %30 
                                                      OpStore %359 %358 
                               Private bool* %360 = OpAccessChain %264 %30 
                                        bool %361 = OpLoad %360 
                                         f32 %362 = OpSelect %361 %247 %183 
                                Private f32* %363 = OpAccessChain %355 %39 
                                                      OpStore %363 %362 
                                        bool %364 = OpLoad %343 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %364 %367 %370 
                                             %367 = OpLabel 
                                       f32_2 %369 = OpLoad %329 
                                                      OpStore %366 %369 
                                                      OpBranch %368 
                                             %370 = OpLabel 
                                                      OpStore %366 %371 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                       f32_2 %372 = OpLoad %366 
                                                      OpStore %329 %372 
                                       f32_2 %373 = OpLoad %329 
                                       f32_2 %374 = OpLoad %215 
                                       f32_2 %375 = OpFAdd %373 %374 
                                                      OpStore %329 %375 
                                       f32_2 %376 = OpLoad %329 
                                       f32_4 %377 = OpVectorShuffle %376 %376 1 1 1 1 
                              Uniform f32_4* %380 = OpAccessChain %140 %378 %379 
                                       f32_4 %381 = OpLoad %380 
                                       f32_4 %382 = OpFMul %377 %381 
                                                      OpStore %195 %382 
                              Uniform f32_4* %383 = OpAccessChain %140 %378 %378 
                                       f32_4 %384 = OpLoad %383 
                                       f32_2 %385 = OpLoad %329 
                                       f32_4 %386 = OpVectorShuffle %385 %385 0 0 0 0 
                                       f32_4 %387 = OpFMul %384 %386 
                                       f32_4 %388 = OpLoad %195 
                                       f32_4 %389 = OpFAdd %387 %388 
                                                      OpStore %195 %389 
                                       f32_2 %392 = OpLoad %329 
                                       f32_4 %393 = OpLoad vs_TEXCOORD0 
                                       f32_4 %394 = OpVectorShuffle %393 %392 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %394 
                              Uniform f32_4* %396 = OpAccessChain %140 %378 %395 
                                       f32_4 %397 = OpLoad %396 
                                       f32_4 %398 = OpLoad %28 
                                       f32_4 %399 = OpVectorShuffle %398 %398 0 0 0 0 
                                       f32_4 %400 = OpFMul %397 %399 
                                       f32_4 %401 = OpLoad %195 
                                       f32_4 %402 = OpFAdd %400 %401 
                                                      OpStore %28 %402 
                                       f32_4 %403 = OpLoad %28 
                              Uniform f32_4* %405 = OpAccessChain %140 %378 %404 
                                       f32_4 %406 = OpLoad %405 
                                       f32_4 %407 = OpFAdd %403 %406 
                                                      OpStore %28 %407 
                                       f32_4 %408 = OpLoad %28 
                                       f32_4 %409 = OpVectorShuffle %408 %408 1 1 1 1 
                              Uniform f32_4* %410 = OpAccessChain %140 %379 %379 
                                       f32_4 %411 = OpLoad %410 
                                       f32_4 %412 = OpFMul %409 %411 
                                                      OpStore %195 %412 
                              Uniform f32_4* %413 = OpAccessChain %140 %379 %378 
                                       f32_4 %414 = OpLoad %413 
                                       f32_4 %415 = OpLoad %28 
                                       f32_4 %416 = OpVectorShuffle %415 %415 0 0 0 0 
                                       f32_4 %417 = OpFMul %414 %416 
                                       f32_4 %418 = OpLoad %195 
                                       f32_4 %419 = OpFAdd %417 %418 
                                                      OpStore %195 %419 
                              Uniform f32_4* %420 = OpAccessChain %140 %379 %395 
                                       f32_4 %421 = OpLoad %420 
                                       f32_4 %422 = OpLoad %28 
                                       f32_4 %423 = OpVectorShuffle %422 %422 2 2 2 2 
                                       f32_4 %424 = OpFMul %421 %423 
                                       f32_4 %425 = OpLoad %195 
                                       f32_4 %426 = OpFAdd %424 %425 
                                                      OpStore %195 %426 
                              Uniform f32_4* %431 = OpAccessChain %140 %379 %404 
                                       f32_4 %432 = OpLoad %431 
                                       f32_4 %433 = OpLoad %28 
                                       f32_4 %434 = OpVectorShuffle %433 %433 3 3 3 3 
                                       f32_4 %435 = OpFMul %432 %434 
                                       f32_4 %436 = OpLoad %195 
                                       f32_4 %437 = OpFAdd %435 %436 
                               Output f32_4* %438 = OpAccessChain %430 %378 
                                                      OpStore %438 %437 
                         read_only Texture2D %439 = OpLoad %173 
                                     sampler %440 = OpLoad %177 
                  read_only Texture2DSampled %441 = OpSampledImage %439 %440 
                                       f32_4 %442 = OpLoad %9 
                                       f32_2 %443 = OpVectorShuffle %442 %442 2 3 
                                       f32_4 %444 = OpImageSampleExplicitLod %441 %443 Lod %7 
                                         f32 %445 = OpCompositeExtract %444 3 
                                Private f32* %446 = OpAccessChain %28 %30 
                                                      OpStore %446 %445 
                                Private f32* %447 = OpAccessChain %28 %30 
                                         f32 %448 = OpLoad %447 
                                  Input f32* %450 = OpAccessChain %449 %51 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpFMul %448 %451 
                                Private f32* %453 = OpAccessChain %28 %51 
                                                      OpStore %453 %452 
                                       f32_4 %454 = OpLoad %449 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_4 %456 = OpLoad %28 
                                       f32_4 %457 = OpVectorShuffle %456 %455 4 5 6 3 
                                                      OpStore %28 %457 
                                       f32_4 %459 = OpLoad %28 
                                                      OpStore %458 %459 
                                       f32_2 %460 = OpLoad %211 
                              Uniform f32_4* %461 = OpAccessChain %140 %395 
                                       f32_4 %462 = OpLoad %461 
                                       f32_2 %463 = OpVectorShuffle %462 %462 0 1 
                                       f32_2 %464 = OpFMul %460 %463 
                              Uniform f32_4* %465 = OpAccessChain %140 %395 
                                       f32_4 %466 = OpLoad %465 
                                       f32_2 %467 = OpVectorShuffle %466 %466 2 3 
                                       f32_2 %468 = OpFAdd %464 %467 
                                       f32_4 %469 = OpLoad %28 
                                       f32_4 %470 = OpVectorShuffle %469 %468 4 5 2 3 
                                                      OpStore %28 %470 
                                       f32_4 %471 = OpLoad %28 
                                       f32_2 %472 = OpVectorShuffle %471 %471 0 1 
                              Uniform f32_4* %473 = OpAccessChain %140 %404 
                                       f32_4 %474 = OpLoad %473 
                                       f32_2 %475 = OpVectorShuffle %474 %474 0 1 
                                       f32_2 %476 = OpFMul %472 %475 
                                                      OpStore %99 %476 
                               Private bool* %477 = OpAccessChain %334 %39 
                                        bool %478 = OpLoad %477 
                                         f32 %479 = OpSelect %478 %247 %183 
                                Private f32* %480 = OpAccessChain %150 %30 
                                                      OpStore %480 %479 
                               Private bool* %481 = OpAccessChain %334 %46 
                                        bool %482 = OpLoad %481 
                                         f32 %483 = OpSelect %482 %247 %183 
                                Private f32* %484 = OpAccessChain %150 %39 
                                                      OpStore %484 %483 
                               Private bool* %485 = OpAccessChain %334 %51 
                                        bool %486 = OpLoad %485 
                                         f32 %487 = OpSelect %486 %247 %183 
                                Private f32* %488 = OpAccessChain %150 %46 
                                                      OpStore %488 %487 
                               Private bool* %490 = OpAccessChain %334 %51 
                                        bool %491 = OpLoad %490 
                                         f32 %493 = OpSelect %491 %324 %492 
                                                      OpStore %489 %493 
                                         f32 %494 = OpLoad %489 
                                Private f32* %495 = OpAccessChain %150 %39 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpFAdd %494 %496 
                                Private f32* %498 = OpAccessChain %195 %39 
                                                      OpStore %498 %497 
                                Private f32* %500 = OpAccessChain %150 %46 
                                         f32 %501 = OpLoad %500 
                                Private f32* %502 = OpAccessChain %150 %39 
                                         f32 %503 = OpLoad %502 
                                         f32 %504 = OpFAdd %501 %503 
                                                      OpStore %499 %504 
                                         f32 %506 = OpLoad %499 
                                        bool %507 = OpFOrdEqual %506 %247 
                                                      OpStore %505 %507 
                                        bool %508 = OpLoad %505 
                                                      OpSelectionMerge %511 None 
                                                      OpBranchConditional %508 %510 %513 
                                             %510 = OpLabel 
                                       f32_2 %512 = OpLoad %99 
                                                      OpStore %509 %512 
                                                      OpBranch %511 
                                             %513 = OpLabel 
                                       f32_4 %514 = OpLoad %28 
                                       f32_2 %515 = OpVectorShuffle %514 %514 0 1 
                                                      OpStore %509 %515 
                                                      OpBranch %511 
                                             %511 = OpLabel 
                                       f32_2 %516 = OpLoad %509 
                                       f32_4 %517 = OpLoad vs_TEXCOORD0 
                                       f32_4 %518 = OpVectorShuffle %517 %516 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %518 
                                  Input f32* %519 = OpAccessChain %11 %51 
                                         f32 %520 = OpLoad %519 
                                        bool %522 = OpFOrdEqual %520 %521 
                               Private bool* %523 = OpAccessChain %21 %30 
                                                      OpStore %523 %522 
                               Private bool* %524 = OpAccessChain %21 %30 
                                        bool %525 = OpLoad %524 
                                         f32 %526 = OpSelect %525 %247 %183 
                                Private f32* %527 = OpAccessChain %195 %30 
                                                      OpStore %527 %526 
                                         f32 %528 = OpLoad %499 
                                Private f32* %529 = OpAccessChain %195 %30 
                                         f32 %530 = OpLoad %529 
                                         f32 %531 = OpFAdd %528 %530 
                                Private f32* %532 = OpAccessChain %28 %30 
                                                      OpStore %532 %531 
                                Private f32* %533 = OpAccessChain %150 %30 
                                         f32 %534 = OpLoad %533 
                                Private f32* %535 = OpAccessChain %28 %30 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpFAdd %534 %536 
                                Private f32* %538 = OpAccessChain %28 %30 
                                                      OpStore %538 %537 
                                Private f32* %539 = OpAccessChain %150 %30 
                                         f32 %540 = OpLoad %539 
                                Private f32* %541 = OpAccessChain %195 %46 
                                                      OpStore %541 %540 
                                Private f32* %542 = OpAccessChain %355 %30 
                                         f32 %543 = OpLoad %542 
                                Private f32* %544 = OpAccessChain %28 %30 
                                         f32 %545 = OpLoad %544 
                                         f32 %546 = OpFAdd %543 %545 
                                Private f32* %547 = OpAccessChain %28 %30 
                                                      OpStore %547 %546 
                                Private f32* %548 = OpAccessChain %355 %39 
                                         f32 %549 = OpLoad %548 
                                Private f32* %550 = OpAccessChain %28 %30 
                                         f32 %551 = OpLoad %550 
                                         f32 %552 = OpFAdd %549 %551 
                                Private f32* %553 = OpAccessChain %28 %30 
                                                      OpStore %553 %552 
                                Private f32* %554 = OpAccessChain %28 %30 
                                         f32 %555 = OpLoad %554 
                                         f32 %556 = OpExtInst %1 37 %555 %247 
                                Private f32* %557 = OpAccessChain %28 %30 
                                                      OpStore %557 %556 
                                Private f32* %558 = OpAccessChain %28 %30 
                                         f32 %559 = OpLoad %558 
                                         f32 %560 = OpFNegate %559 
                                         f32 %561 = OpFAdd %560 %247 
                                Private f32* %562 = OpAccessChain %195 %51 
                                                      OpStore %562 %561 
                                       f32_4 %564 = OpLoad %195 
                                                      OpStore vs_TEXCOORD1 %564 
                                       f32_4 %565 = OpLoad %100 
                                       f32_2 %566 = OpVectorShuffle %565 %565 2 3 
                                         f32 %569 = OpDot %566 %568 
                                Private f32* %570 = OpAccessChain %355 %46 
                                                      OpStore %570 %569 
                                       f32_3 %573 = OpLoad %355 
                                                      OpStore vs_TEXCOORD2 %573 
                                       f32_4 %574 = OpLoad %11 
                                       f32_2 %575 = OpVectorShuffle %574 %574 1 1 
                                       f32_2 %577 = OpFMul %575 %576 
                                       f32_4 %578 = OpLoad %28 
                                       f32_4 %579 = OpVectorShuffle %578 %577 4 5 2 3 
                                                      OpStore %28 %579 
                                Private f32* %581 = OpAccessChain %28 %39 
                                         f32 %582 = OpLoad %581 
                                Private f32* %583 = OpAccessChain %28 %39 
                                         f32 %584 = OpLoad %583 
                                         f32 %585 = OpFNegate %584 
                                        bool %586 = OpFOrdGreaterThanEqual %582 %585 
                                                      OpStore %580 %586 
                                        bool %587 = OpLoad %580 
                                      bool_2 %591 = OpCompositeConstruct %587 %587 
                                       f32_2 %592 = OpSelect %591 %588 %589 
                                                      OpStore %329 %592 
                                Private f32* %593 = OpAccessChain %329 %39 
                                         f32 %594 = OpLoad %593 
                                Private f32* %595 = OpAccessChain %28 %30 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFMul %594 %596 
                                Private f32* %598 = OpAccessChain %28 %30 
                                                      OpStore %598 %597 
                                Private f32* %599 = OpAccessChain %28 %30 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpExtInst %1 10 %600 
                                Private f32* %602 = OpAccessChain %28 %30 
                                                      OpStore %602 %601 
                                Private f32* %603 = OpAccessChain %28 %30 
                                         f32 %604 = OpLoad %603 
                                Private f32* %605 = OpAccessChain %329 %30 
                                         f32 %606 = OpLoad %605 
                                         f32 %607 = OpFMul %604 %606 
                                Private f32* %608 = OpAccessChain %28 %30 
                                                      OpStore %608 %607 
                                  Input f32* %609 = OpAccessChain %11 %39 
                                         f32 %610 = OpLoad %609 
                                         f32 %611 = OpFMul %610 %14 
                                Private f32* %612 = OpAccessChain %28 %30 
                                         f32 %613 = OpLoad %612 
                                         f32 %614 = OpFNegate %613 
                                         f32 %615 = OpFAdd %611 %614 
                                Private f32* %616 = OpAccessChain %329 %30 
                                                      OpStore %616 %615 
                                  Input f32* %617 = OpAccessChain %89 %46 
                                         f32 %618 = OpLoad %617 
                                         f32 %619 = OpFMul %618 %15 
                                Private f32* %620 = OpAccessChain %28 %30 
                                         f32 %621 = OpLoad %620 
                                         f32 %622 = OpFAdd %619 %621 
                                Private f32* %623 = OpAccessChain %150 %30 
                                                      OpStore %623 %622 
                                  Input f32* %624 = OpAccessChain %89 %51 
                                         f32 %625 = OpLoad %624 
                                         f32 %626 = OpFMul %625 %93 
                                Private f32* %627 = OpAccessChain %28 %30 
                                                      OpStore %627 %626 
                                Private f32* %628 = OpAccessChain %329 %30 
                                         f32 %629 = OpLoad %628 
                                         f32 %630 = OpFMul %629 %42 
                                Private f32* %631 = OpAccessChain %28 %30 
                                         f32 %632 = OpLoad %631 
                                         f32 %633 = OpFAdd %630 %632 
                                Private f32* %634 = OpAccessChain %150 %39 
                                                      OpStore %634 %633 
                                       f32_4 %635 = OpLoad %150 
                                       f32_2 %636 = OpVectorShuffle %635 %635 0 1 
                                       f32_2 %637 = OpFAdd %636 %129 
                                       f32_4 %638 = OpLoad %28 
                                       f32_4 %639 = OpVectorShuffle %638 %637 4 5 2 3 
                                                      OpStore %28 %639 
                                       f32_4 %640 = OpLoad %28 
                                       f32_2 %641 = OpVectorShuffle %640 %640 0 1 
                              Uniform f32_4* %642 = OpAccessChain %140 %142 
                                       f32_4 %643 = OpLoad %642 
                                       f32_2 %644 = OpVectorShuffle %643 %643 0 1 
                                       f32_2 %645 = OpFMul %641 %644 
                                       f32_4 %646 = OpLoad %9 
                                       f32_4 %647 = OpVectorShuffle %646 %645 4 5 2 3 
                                                      OpStore %9 %647 
                                       f32_4 %649 = OpLoad %9 
                                                      OpStore vs_TEXCOORD3 %649 
                         read_only Texture2D %650 = OpLoad %173 
                                     sampler %651 = OpLoad %177 
                  read_only Texture2DSampled %652 = OpSampledImage %650 %651 
                                       f32_4 %653 = OpLoad %9 
                                       f32_2 %654 = OpVectorShuffle %653 %653 0 1 
                                       f32_4 %655 = OpImageSampleExplicitLod %652 %654 Lod %7 
                                                      OpStore %9 %655 
                                       f32_4 %657 = OpLoad %9 
                                                      OpStore vs_TEXCOORD4 %657 
                                 Output f32* %659 = OpAccessChain %430 %378 %39 
                                         f32 %660 = OpLoad %659 
                                         f32 %661 = OpFNegate %660 
                                 Output f32* %662 = OpAccessChain %430 %378 %39 
                                                      OpStore %662 %661 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 766
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %30 %33 %156 %304 %760 %762 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 BuiltIn TessLevelOuter 
                                                      OpDecorate vs_TEXCOORD0 Location 30 
                                                      OpDecorate vs_TEXCOORD4 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD4 Flat 
                                                      OpDecorate vs_TEXCOORD4 Location 33 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpMemberDecorate %85 0 Offset 85 
                                                      OpMemberDecorate %85 1 Offset 85 
                                                      OpMemberDecorate %85 2 Offset 85 
                                                      OpMemberDecorate %85 3 Offset 85 
                                                      OpDecorate %85 Block 
                                                      OpDecorate %87 DescriptorSet 87 
                                                      OpDecorate %87 Binding 87 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 156 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %173 DescriptorSet 173 
                                                      OpDecorate %173 Binding 173 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %177 DescriptorSet 177 
                                                      OpDecorate %177 Binding 177 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 DescriptorSet 193 
                                                      OpDecorate %193 Binding 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %206 DescriptorSet 206 
                                                      OpDecorate %206 Binding 206 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %208 DescriptorSet 208 
                                                      OpDecorate %208 Binding 208 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %288 DescriptorSet 288 
                                                      OpDecorate %288 Binding 288 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %290 DescriptorSet 290 
                                                      OpDecorate %290 Binding 290 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 304 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %350 DescriptorSet 350 
                                                      OpDecorate %350 Binding 350 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %352 DescriptorSet 352 
                                                      OpDecorate %352 Binding 352 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %365 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %683 RelaxedPrecision 
                                                      OpDecorate %684 RelaxedPrecision 
                                                      OpDecorate %688 RelaxedPrecision 
                                                      OpDecorate %689 RelaxedPrecision 
                                                      OpDecorate %691 RelaxedPrecision 
                                                      OpDecorate %694 RelaxedPrecision 
                                                      OpDecorate %695 RelaxedPrecision 
                                                      OpDecorate %698 RelaxedPrecision 
                                                      OpDecorate %702 RelaxedPrecision 
                                                      OpDecorate %704 RelaxedPrecision 
                                                      OpDecorate %709 RelaxedPrecision 
                                                      OpDecorate %710 RelaxedPrecision 
                                                      OpDecorate %714 RelaxedPrecision 
                                                      OpDecorate %715 RelaxedPrecision 
                                                      OpDecorate %716 RelaxedPrecision 
                                                      OpDecorate %717 RelaxedPrecision 
                                                      OpDecorate %718 RelaxedPrecision 
                                                      OpDecorate %719 RelaxedPrecision 
                                                      OpDecorate %726 RelaxedPrecision 
                                                      OpDecorate %734 RelaxedPrecision 
                                                      OpDecorate %735 RelaxedPrecision 
                                                      OpDecorate %739 RelaxedPrecision 
                                                      OpDecorate %740 RelaxedPrecision 
                                                      OpDecorate %741 RelaxedPrecision 
                                                      OpDecorate %742 RelaxedPrecision 
                                                      OpDecorate %745 RelaxedPrecision 
                                                      OpDecorate %746 RelaxedPrecision 
                                                      OpDecorate %750 RelaxedPrecision 
                                                      OpDecorate %751 RelaxedPrecision 
                                                      OpDecorate %752 RelaxedPrecision 
                                                      OpDecorate %753 RelaxedPrecision 
                                                      OpDecorate %760 RelaxedPrecision 
                                                      OpDecorate %760 Location 760 
                                                      OpDecorate %761 RelaxedPrecision 
                                                      OpDecorate %762 RelaxedPrecision 
                                                      OpDecorate %762 Location 762 
                                                      OpDecorate %763 RelaxedPrecision 
                                                      OpDecorate %764 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Function %7 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 3 
                                              %18 = OpTypePointer Input %6 
                                              %26 = OpTypeBool 
                                              %27 = OpTypeVector %26 4 
                                              %28 = OpTypePointer Private %27 
                              Private bool_4* %29 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
                                              %37 = OpTypeVector %26 2 
                                              %49 = OpTypePointer Private %7 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %51 = OpConstant 0 
                                              %52 = OpTypePointer Private %26 
                                          f32 %55 = OpConstant 3.674022E-40 
                                              %57 = OpTypePointer Private %6 
                                          u32 %59 = OpConstant 1 
                                          u32 %64 = OpConstant 2 
                                              %73 = OpTypeVector %6 2 
                                              %81 = OpTypePointer Private %37 
                              Private bool_2* %82 = OpVariable Private 
                                              %85 = OpTypeStruct %7 %7 %7 %7 
                                              %86 = OpTypePointer Uniform %85 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %87 = OpVariable Uniform 
                                              %88 = OpTypeInt 32 1 
                                          i32 %89 = OpConstant 3 
                                              %90 = OpTypePointer Uniform %7 
                                              %96 = OpTypePointer Private %73 
                               Private f32_2* %97 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                       f32_3 %137 = OpConstantComposite %15 %15 %136 
                                         i32 %146 = OpConstant 0 
                                         i32 %147 = OpConstant 1 
                                         i32 %149 = OpConstant -1 
                              Private f32_4* %155 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                Private f32* %165 = OpVariable Private 
                              Private f32_4* %170 = OpVariable Private 
                                             %171 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %172 = OpTypePointer UniformConstant %171 
        UniformConstant read_only Texture2D* %173 = OpVariable UniformConstant 
                                             %175 = OpTypeSampler 
                                             %176 = OpTypePointer UniformConstant %175 
                    UniformConstant sampler* %177 = OpVariable UniformConstant 
                                             %179 = OpTypeSampledImage %171 
                              Private f32_4* %191 = OpVariable Private 
                    UniformConstant sampler* %193 = OpVariable UniformConstant 
                              Private f32_2* %205 = OpVariable Private 
        UniformConstant read_only Texture2D* %206 = OpVariable UniformConstant 
                    UniformConstant sampler* %208 = OpVariable UniformConstant 
                                Private f32* %216 = OpVariable Private 
                              Private f32_2* %220 = OpVariable Private 
                                         f32 %233 = OpConstant 3.674022E-40 
                                         f32 %258 = OpConstant 3.674022E-40 
                                         f32 %260 = OpConstant 3.674022E-40 
                              Private f32_4* %283 = OpVariable Private 
                              Private f32_4* %287 = OpVariable Private 
        UniformConstant read_only Texture2D* %288 = OpVariable UniformConstant 
                    UniformConstant sampler* %290 = OpVariable UniformConstant 
                             Private bool_2* %302 = OpVariable Private 
                                             %303 = OpTypePointer Input %12 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                       f32_4 %307 = OpConstantComposite %15 %15 %55 %55 
                                             %322 = OpTypePointer Function %73 
                              Private f32_4* %334 = OpVariable Private 
                              Private f32_2* %340 = OpVariable Private 
                                         i32 %344 = OpConstant 2 
                              Private f32_4* %349 = OpVariable Private 
        UniformConstant read_only Texture2D* %350 = OpVariable UniformConstant 
                    UniformConstant sampler* %352 = OpVariable UniformConstant 
                                             %357 = OpTypeVector %26 3 
                                             %358 = OpTypePointer Private %357 
                             Private bool_3* %359 = OpVariable Private 
                              Private f32_2* %364 = OpVariable Private 
                                         f32 %367 = OpConstant 3.674022E-40 
                                       f32_2 %368 = OpConstantComposite %367 %367 
                                             %373 = OpTypePointer Private %12 
                              Private f32_3* %374 = OpVariable Private 
                                         f32 %382 = OpConstant 3.674022E-40 
                                       f32_2 %383 = OpConstantComposite %382 %382 
                              Private f32_2* %390 = OpVariable Private 
                                Private f32* %406 = OpVariable Private 
                                Private f32* %432 = OpVariable Private 
                               Private bool* %447 = OpVariable Private 
                                             %456 = OpTypePointer Function %6 
                               Private bool* %470 = OpVariable Private 
                                         f32 %471 = OpConstant 3.674022E-40 
                               Private bool* %476 = OpVariable Private 
                              Private f32_2* %493 = OpVariable Private 
                              Private f32_2* %517 = OpVariable Private 
                                         f32 %520 = OpConstant 3.674022E-40 
                                             %523 = OpTypePointer Private %88 
                                Private i32* %524 = OpVariable Private 
                               Private bool* %528 = OpVariable Private 
                              Private f32_3* %540 = OpVariable Private 
                                             %566 = OpTypeVector %88 4 
                                       i32_4 %568 = OpConstantComposite %147 %146 %344 %146 
                              Private f32_2* %577 = OpVariable Private 
                               Private bool* %593 = OpVariable Private 
                               Private bool* %625 = OpVariable Private 
                                Private f32* %630 = OpVariable Private 
                                             %671 = OpTypePointer Uniform %6 
                                       f32_2 %690 = OpConstantComposite %520 %520 
                                         f32 %696 = OpConstant 3.674022E-40 
                                       f32_2 %697 = OpConstantComposite %696 %696 
                                       f32_2 %703 = OpConstantComposite %233 %233 
                                             %759 = OpTypePointer Output %7 
                               Output f32_4* %760 = OpVariable Output 
                                Input f32_4* %762 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32_4* %9 = OpVariable Function 
                             Function f32_2* %323 = OpVariable Function 
                               Function f32* %457 = OpVariable Function 
                               Function f32* %486 = OpVariable Function 
                               Function f32* %495 = OpVariable Function 
                             Function f32_2* %507 = OpVariable Function 
                               Function f32* %542 = OpVariable Function 
                               Function f32* %555 = OpVariable Function 
                               Function f32* %580 = OpVariable Function 
                               Function f32* %606 = OpVariable Function 
                               Function f32* %635 = OpVariable Function 
                               Function f32* %650 = OpVariable Function 
                               Function f32* %661 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                                   Input f32* %19 = OpAccessChain %11 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFDiv %15 %20 
                                          f32 %22 = OpCompositeExtract %14 0 
                                          f32 %23 = OpCompositeExtract %14 1 
                                          f32 %24 = OpCompositeExtract %14 2 
                                        f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                                      OpStore %9 %25 
                                        f32_4 %31 = OpLoad vs_TEXCOORD0 
                                        f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                        f32_4 %34 = OpLoad vs_TEXCOORD4 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                                       bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                                       bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                                       bool_4 %39 = OpLoad %29 
                                       bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                                      OpStore %29 %40 
                                        f32_4 %41 = OpLoad vs_TEXCOORD4 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                        f32_4 %43 = OpLoad vs_TEXCOORD0 
                                        f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                                       bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                                       bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                                       bool_4 %47 = OpLoad %29 
                                       bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                                      OpStore %29 %48 
                                Private bool* %53 = OpAccessChain %29 %51 
                                         bool %54 = OpLoad %53 
                                          f32 %56 = OpSelect %54 %15 %55 
                                 Private f32* %58 = OpAccessChain %50 %51 
                                                      OpStore %58 %56 
                                Private bool* %60 = OpAccessChain %29 %59 
                                         bool %61 = OpLoad %60 
                                          f32 %62 = OpSelect %61 %15 %55 
                                 Private f32* %63 = OpAccessChain %50 %59 
                                                      OpStore %63 %62 
                                Private bool* %65 = OpAccessChain %29 %64 
                                         bool %66 = OpLoad %65 
                                          f32 %67 = OpSelect %66 %15 %55 
                                 Private f32* %68 = OpAccessChain %50 %64 
                                                      OpStore %68 %67 
                                Private bool* %69 = OpAccessChain %29 %17 
                                         bool %70 = OpLoad %69 
                                          f32 %71 = OpSelect %70 %15 %55 
                                 Private f32* %72 = OpAccessChain %50 %17 
                                                      OpStore %72 %71 
                                        f32_4 %74 = OpLoad %50 
                                        f32_2 %75 = OpVectorShuffle %74 %74 2 3 
                                        f32_4 %76 = OpLoad %50 
                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                        f32_2 %78 = OpFAdd %75 %77 
                                        f32_4 %79 = OpLoad %50 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 2 3 
                                                      OpStore %50 %80 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 1 0 1 
                               Uniform f32_4* %91 = OpAccessChain %87 %89 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpVectorShuffle %92 %92 0 1 0 1 
                                       bool_4 %94 = OpFOrdGreaterThanEqual %84 %93 
                                       bool_2 %95 = OpVectorShuffle %94 %94 0 1 
                                                      OpStore %82 %95 
                                Private bool* %98 = OpAccessChain %82 %51 
                                         bool %99 = OpLoad %98 
                                         f32 %100 = OpSelect %99 %15 %55 
                                Private f32* %101 = OpAccessChain %97 %51 
                                                      OpStore %101 %100 
                               Private bool* %102 = OpAccessChain %82 %59 
                                        bool %103 = OpLoad %102 
                                         f32 %104 = OpSelect %103 %15 %55 
                                Private f32* %105 = OpAccessChain %97 %59 
                                                      OpStore %105 %104 
                                       f32_2 %106 = OpLoad %97 
                                       f32_4 %107 = OpLoad %50 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %50 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                      OpStore %50 %111 
                              Uniform f32_4* %112 = OpAccessChain %87 %89 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpVectorShuffle %113 %113 2 3 2 3 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %115 0 1 0 1 
                                      bool_4 %117 = OpFOrdGreaterThanEqual %114 %116 
                                      bool_2 %118 = OpVectorShuffle %117 %117 0 1 
                                                      OpStore %82 %118 
                               Private bool* %119 = OpAccessChain %82 %51 
                                        bool %120 = OpLoad %119 
                                         f32 %121 = OpSelect %120 %15 %55 
                                Private f32* %122 = OpAccessChain %97 %51 
                                                      OpStore %122 %121 
                               Private bool* %123 = OpAccessChain %82 %59 
                                        bool %124 = OpLoad %123 
                                         f32 %125 = OpSelect %124 %15 %55 
                                Private f32* %126 = OpAccessChain %97 %59 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %97 
                                       f32_4 %128 = OpLoad %50 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %50 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %50 %132 
                                Private f32* %133 = OpAccessChain %50 %64 
                                                      OpStore %133 %15 
                                       f32_4 %134 = OpLoad %50 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                         f32 %138 = OpDot %135 %137 
                                Private f32* %139 = OpAccessChain %50 %51 
                                                      OpStore %139 %138 
                                Private f32* %140 = OpAccessChain %50 %51 
                                         f32 %141 = OpLoad %140 
                                        bool %142 = OpFOrdLessThan %141 %55 
                               Private bool* %143 = OpAccessChain %29 %51 
                                                      OpStore %143 %142 
                               Private bool* %144 = OpAccessChain %29 %51 
                                        bool %145 = OpLoad %144 
                                         i32 %148 = OpSelect %145 %147 %146 
                                         i32 %150 = OpIMul %148 %149 
                                        bool %151 = OpINotEqual %150 %146 
                                                      OpSelectionMerge %153 None 
                                                      OpBranchConditional %151 %152 %153 
                                             %152 = OpLabel 
                                                      OpKill
                                             %153 = OpLabel 
                                  Input f32* %157 = OpAccessChain vs_TEXCOORD1 %59 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                Private f32* %160 = OpAccessChain %155 %51 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %155 %51 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpExtInst %1 43 %162 %55 %15 
                                Private f32* %164 = OpAccessChain %155 %51 
                                                      OpStore %164 %163 
                                  Input f32* %166 = OpAccessChain vs_TEXCOORD1 %59 
                                         f32 %167 = OpLoad %166 
                                                      OpStore %165 %167 
                                         f32 %168 = OpLoad %165 
                                         f32 %169 = OpExtInst %1 43 %168 %55 %15 
                                                      OpStore %165 %169 
                         read_only Texture2D %174 = OpLoad %173 
                                     sampler %178 = OpLoad %177 
                  read_only Texture2DSampled %180 = OpSampledImage %174 %178 
                                       f32_4 %181 = OpLoad vs_TEXCOORD0 
                                       f32_2 %182 = OpVectorShuffle %181 %181 0 1 
                                       f32_4 %183 = OpImageSampleImplicitLod %180 %182 
                                                      OpStore %170 %183 
                                       f32_4 %184 = OpLoad %170 
                                       f32_4 %185 = OpLoad %155 
                                       f32_4 %186 = OpVectorShuffle %185 %185 0 0 0 0 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad vs_TEXCOORD1 
                                       f32_4 %189 = OpVectorShuffle %188 %188 3 3 3 3 
                                       f32_4 %190 = OpFAdd %187 %189 
                                                      OpStore %50 %190 
                         read_only Texture2D %192 = OpLoad %173 
                                     sampler %194 = OpLoad %193 
                  read_only Texture2DSampled %195 = OpSampledImage %192 %194 
                                       f32_4 %196 = OpLoad vs_TEXCOORD0 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_4 %198 = OpImageSampleImplicitLod %195 %197 
                                                      OpStore %191 %198 
                                       f32_4 %199 = OpLoad %191 
                                         f32 %200 = OpLoad %165 
                                       f32_4 %201 = OpCompositeConstruct %200 %200 %200 %200 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %50 
                                       f32_4 %204 = OpFAdd %202 %203 
                                                      OpStore %50 %204 
                         read_only Texture2D %207 = OpLoad %206 
                                     sampler %209 = OpLoad %208 
                  read_only Texture2DSampled %210 = OpSampledImage %207 %209 
                                       f32_4 %211 = OpLoad vs_TEXCOORD0 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                       f32_4 %213 = OpImageSampleImplicitLod %210 %212 
                                         f32 %214 = OpCompositeExtract %213 3 
                                Private f32* %215 = OpAccessChain %205 %51 
                                                      OpStore %215 %214 
                                Private f32* %217 = OpAccessChain %205 %51 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpDPdx %218 
                                                      OpStore %216 %219 
                                Private f32* %221 = OpAccessChain %205 %51 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpDPdy %222 
                                Private f32* %224 = OpAccessChain %220 %51 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %220 %51 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpExtInst %1 4 %226 
                                         f32 %228 = OpLoad %216 
                                         f32 %229 = OpExtInst %1 4 %228 
                                         f32 %230 = OpFAdd %227 %229 
                                                      OpStore %216 %230 
                                         f32 %231 = OpLoad %216 
                                         f32 %232 = OpFNegate %231 
                                         f32 %234 = OpFAdd %232 %233 
                                Private f32* %235 = OpAccessChain %220 %51 
                                                      OpStore %235 %234 
                                         f32 %236 = OpLoad %216 
                                         f32 %237 = OpFAdd %236 %233 
                                Private f32* %238 = OpAccessChain %205 %59 
                                                      OpStore %238 %237 
                                       f32_2 %239 = OpLoad %220 
                                       f32_2 %240 = OpVectorShuffle %239 %239 0 0 
                                       f32_2 %241 = OpFNegate %240 
                                       f32_2 %242 = OpLoad %205 
                                       f32_2 %243 = OpFAdd %241 %242 
                                                      OpStore %205 %243 
                                Private f32* %244 = OpAccessChain %205 %59 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFDiv %15 %245 
                                                      OpStore %216 %246 
                                         f32 %247 = OpLoad %216 
                                Private f32* %248 = OpAccessChain %205 %51 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFMul %247 %249 
                                Private f32* %251 = OpAccessChain %205 %51 
                                                      OpStore %251 %250 
                                Private f32* %252 = OpAccessChain %205 %51 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 43 %253 %55 %15 
                                Private f32* %255 = OpAccessChain %205 %51 
                                                      OpStore %255 %254 
                                Private f32* %256 = OpAccessChain %205 %51 
                                         f32 %257 = OpLoad %256 
                                         f32 %259 = OpFMul %257 %258 
                                         f32 %261 = OpFAdd %259 %260 
                                                      OpStore %216 %261 
                                Private f32* %262 = OpAccessChain %205 %51 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %205 %51 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFMul %263 %265 
                                Private f32* %267 = OpAccessChain %205 %51 
                                                      OpStore %267 %266 
                                Private f32* %268 = OpAccessChain %205 %51 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpLoad %216 
                                         f32 %271 = OpFMul %269 %270 
                                Private f32* %272 = OpAccessChain %205 %51 
                                                      OpStore %272 %271 
                                       f32_4 %273 = OpLoad vs_TEXCOORD1 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 0 0 
                                       f32_4 %275 = OpLoad %155 
                                       f32_4 %276 = OpVectorShuffle %275 %274 4 5 6 3 
                                                      OpStore %155 %276 
                                Private f32* %277 = OpAccessChain %205 %51 
                                         f32 %278 = OpLoad %277 
                                  Input f32* %279 = OpAccessChain vs_TEXCOORD1 %51 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFMul %278 %280 
                                Private f32* %282 = OpAccessChain %155 %17 
                                                      OpStore %282 %281 
                                       f32_4 %284 = OpLoad %50 
                                       f32_4 %285 = OpLoad %155 
                                       f32_4 %286 = OpFAdd %284 %285 
                                                      OpStore %283 %286 
                         read_only Texture2D %289 = OpLoad %288 
                                     sampler %291 = OpLoad %290 
                  read_only Texture2DSampled %292 = OpSampledImage %289 %291 
                                       f32_4 %293 = OpLoad vs_TEXCOORD0 
                                       f32_2 %294 = OpVectorShuffle %293 %293 0 1 
                                       f32_4 %295 = OpImageSampleImplicitLod %292 %294 
                                                      OpStore %287 %295 
                                       f32_4 %296 = OpLoad %287 
                                       f32_4 %297 = OpLoad vs_TEXCOORD1 
                                       f32_4 %298 = OpVectorShuffle %297 %297 2 2 2 2 
                                       f32_4 %299 = OpFMul %296 %298 
                                       f32_4 %300 = OpLoad %283 
                                       f32_4 %301 = OpFAdd %299 %300 
                                                      OpStore %50 %301 
                                       f32_3 %305 = OpLoad vs_TEXCOORD2 
                                       f32_4 %306 = OpVectorShuffle %305 %305 0 1 0 0 
                                      bool_4 %308 = OpFOrdEqual %306 %307 
                                      bool_2 %309 = OpVectorShuffle %308 %308 0 1 
                                                      OpStore %302 %309 
                               Private bool* %310 = OpAccessChain %302 %59 
                                        bool %311 = OpLoad %310 
                               Private bool* %312 = OpAccessChain %302 %51 
                                        bool %313 = OpLoad %312 
                                        bool %314 = OpLogicalOr %311 %313 
                               Private bool* %315 = OpAccessChain %302 %51 
                                                      OpStore %315 %314 
                               Private bool* %316 = OpAccessChain %302 %51 
                                        bool %317 = OpLoad %316 
                                                      OpSelectionMerge %319 None 
                                                      OpBranchConditional %317 %318 %757 
                                             %318 = OpLabel 
                               Private bool* %320 = OpAccessChain %302 %59 
                                        bool %321 = OpLoad %320 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %321 %324 %329 
                                             %324 = OpLabel 
                              Uniform f32_4* %326 = OpAccessChain %87 %147 
                                       f32_4 %327 = OpLoad %326 
                                       f32_2 %328 = OpVectorShuffle %327 %327 0 1 
                                                      OpStore %323 %328 
                                                      OpBranch %325 
                                             %329 = OpLabel 
                              Uniform f32_4* %330 = OpAccessChain %87 %146 
                                       f32_4 %331 = OpLoad %330 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                                      OpStore %323 %332 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                       f32_2 %333 = OpLoad %323 
                                                      OpStore %205 %333 
                                  Input f32* %335 = OpAccessChain vs_TEXCOORD2 %64 
                                         f32 %336 = OpLoad %335 
                                         f32 %337 = OpFAdd %336 %233 
                                Private f32* %338 = OpAccessChain %334 %59 
                                                      OpStore %338 %337 
                                Private f32* %339 = OpAccessChain %334 %51 
                                                      OpStore %339 %233 
                                Private f32* %341 = OpAccessChain %340 %59 
                                                      OpStore %341 %55 
                                       f32_4 %342 = OpLoad %334 
                                       f32_2 %343 = OpVectorShuffle %342 %342 0 1 
                              Uniform f32_4* %345 = OpAccessChain %87 %344 
                                       f32_4 %346 = OpLoad %345 
                                       f32_2 %347 = OpVectorShuffle %346 %346 0 1 
                                       f32_2 %348 = OpFMul %343 %347 
                                                      OpStore %220 %348 
                         read_only Texture2D %351 = OpLoad %350 
                                     sampler %353 = OpLoad %352 
                  read_only Texture2DSampled %354 = OpSampledImage %351 %353 
                                       f32_2 %355 = OpLoad %220 
                                       f32_4 %356 = OpImageSampleImplicitLod %354 %355 
                                                      OpStore %349 %356 
                                Private f32* %360 = OpAccessChain %349 %51 
                                         f32 %361 = OpLoad %360 
                                        bool %362 = OpFOrdLessThan %55 %361 
                               Private bool* %363 = OpAccessChain %359 %51 
                                                      OpStore %363 %362 
                                       f32_4 %365 = OpLoad %349 
                                       f32_2 %366 = OpVectorShuffle %365 %365 2 3 
                                       f32_2 %369 = OpFAdd %366 %368 
                                                      OpStore %364 %369 
                                       f32_2 %370 = OpLoad %364 
                                       f32_2 %371 = OpLoad %364 
                                       f32_2 %372 = OpFAdd %370 %371 
                                                      OpStore %364 %372 
                                       f32_4 %375 = OpLoad vs_TEXCOORD0 
                                       f32_2 %376 = OpVectorShuffle %375 %375 0 1 
                                       f32_2 %377 = OpFAdd %376 %368 
                                       f32_3 %378 = OpLoad %374 
                                       f32_3 %379 = OpVectorShuffle %378 %377 3 4 2 
                                                      OpStore %374 %379 
                                       f32_3 %380 = OpLoad %374 
                                       f32_2 %381 = OpVectorShuffle %380 %380 0 1 
                                       f32_2 %384 = OpFMul %381 %383 
                                       f32_2 %385 = OpLoad %364 
                                       f32_2 %386 = OpFNegate %385 
                                       f32_2 %387 = OpFAdd %384 %386 
                                       f32_3 %388 = OpLoad %374 
                                       f32_3 %389 = OpVectorShuffle %388 %387 3 4 2 
                                                      OpStore %374 %389 
                                       f32_3 %391 = OpLoad %374 
                                       f32_2 %392 = OpVectorShuffle %391 %391 0 1 
                                       f32_3 %393 = OpLoad %374 
                                       f32_2 %394 = OpVectorShuffle %393 %393 0 1 
                                         f32 %395 = OpDot %392 %394 
                                Private f32* %396 = OpAccessChain %390 %51 
                                                      OpStore %396 %395 
                                Private f32* %397 = OpAccessChain %390 %51 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpExtInst %1 32 %398 
                                Private f32* %400 = OpAccessChain %390 %51 
                                                      OpStore %400 %399 
                                       f32_2 %401 = OpLoad %390 
                                       f32_2 %402 = OpVectorShuffle %401 %401 0 0 
                                       f32_3 %403 = OpLoad %374 
                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
                                       f32_2 %405 = OpFMul %402 %404 
                                                      OpStore %390 %405 
                                       f32_2 %407 = OpLoad %364 
                                       f32_2 %408 = OpFNegate %407 
                                       f32_2 %409 = OpLoad %390 
                                         f32 %410 = OpDot %408 %409 
                                                      OpStore %406 %410 
                                       f32_2 %411 = OpLoad %364 
                                       f32_2 %412 = OpLoad %364 
                                         f32 %413 = OpDot %411 %412 
                                Private f32* %414 = OpAccessChain %364 %51 
                                                      OpStore %414 %413 
                                         f32 %415 = OpLoad %406 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpLoad %406 
                                         f32 %418 = OpFMul %416 %417 
                                Private f32* %419 = OpAccessChain %364 %51 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpFAdd %418 %420 
                                Private f32* %422 = OpAccessChain %364 %51 
                                                      OpStore %422 %421 
                                Private f32* %423 = OpAccessChain %364 %51 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFNegate %424 
                                         f32 %426 = OpFAdd %425 %15 
                                Private f32* %427 = OpAccessChain %364 %51 
                                                      OpStore %427 %426 
                                Private f32* %428 = OpAccessChain %364 %51 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpExtInst %1 31 %429 
                                Private f32* %431 = OpAccessChain %364 %51 
                                                      OpStore %431 %430 
                                Private f32* %433 = OpAccessChain %364 %51 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFNegate %434 
                                         f32 %436 = OpLoad %406 
                                         f32 %437 = OpFAdd %435 %436 
                                                      OpStore %432 %437 
                                Private f32* %438 = OpAccessChain %364 %51 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpLoad %406 
                                         f32 %441 = OpFAdd %439 %440 
                                Private f32* %442 = OpAccessChain %364 %51 
                                                      OpStore %442 %441 
                                Private f32* %443 = OpAccessChain %364 %51 
                                         f32 %444 = OpLoad %443 
                                         f32 %445 = OpLoad %432 
                                         f32 %446 = OpExtInst %1 37 %444 %445 
                                                      OpStore %406 %446 
                                         f32 %448 = OpLoad %406 
                                        bool %449 = OpFOrdLessThan %448 %55 
                                                      OpStore %447 %449 
                                Private f32* %450 = OpAccessChain %364 %51 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpLoad %432 
                                         f32 %453 = OpExtInst %1 40 %451 %452 
                                Private f32* %454 = OpAccessChain %364 %51 
                                                      OpStore %454 %453 
                                        bool %455 = OpLoad %447 
                                                      OpSelectionMerge %459 None 
                                                      OpBranchConditional %455 %458 %462 
                                             %458 = OpLabel 
                                Private f32* %460 = OpAccessChain %364 %51 
                                         f32 %461 = OpLoad %460 
                                                      OpStore %457 %461 
                                                      OpBranch %459 
                                             %462 = OpLabel 
                                         f32 %463 = OpLoad %406 
                                                      OpStore %457 %463 
                                                      OpBranch %459 
                                             %459 = OpLabel 
                                         f32 %464 = OpLoad %457 
                                Private f32* %465 = OpAccessChain %364 %51 
                                                      OpStore %465 %464 
                                       f32_2 %466 = OpLoad %364 
                                       f32_2 %467 = OpVectorShuffle %466 %466 0 0 
                                       f32_2 %468 = OpLoad %390 
                                       f32_2 %469 = OpFMul %467 %468 
                                                      OpStore %364 %469 
                                Private f32* %472 = OpAccessChain %364 %51 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpExtInst %1 4 %473 
                                        bool %475 = OpFOrdGreaterThanEqual %471 %474 
                                                      OpStore %470 %475 
                                Private f32* %477 = OpAccessChain %364 %59 
                                         f32 %478 = OpLoad %477 
                                         f32 %479 = OpExtInst %1 4 %478 
                                        bool %480 = OpFOrdLessThan %471 %479 
                                                      OpStore %476 %480 
                                       f32_3 %481 = OpLoad %374 
                                       f32_2 %482 = OpVectorShuffle %481 %481 0 1 
                                       f32_2 %483 = OpLoad %364 
                                       f32_2 %484 = OpFDiv %482 %483 
                                                      OpStore %364 %484 
                                        bool %485 = OpLoad %476 
                                                      OpSelectionMerge %488 None 
                                                      OpBranchConditional %485 %487 %491 
                                             %487 = OpLabel 
                                Private f32* %489 = OpAccessChain %364 %59 
                                         f32 %490 = OpLoad %489 
                                                      OpStore %486 %490 
                                                      OpBranch %488 
                                             %491 = OpLabel 
                                                      OpStore %486 %55 
                                                      OpBranch %488 
                                             %488 = OpLabel 
                                         f32 %492 = OpLoad %486 
                                                      OpStore %432 %492 
                                        bool %494 = OpLoad %470 
                                                      OpSelectionMerge %497 None 
                                                      OpBranchConditional %494 %496 %499 
                                             %496 = OpLabel 
                                         f32 %498 = OpLoad %432 
                                                      OpStore %495 %498 
                                                      OpBranch %497 
                                             %499 = OpLabel 
                                Private f32* %500 = OpAccessChain %364 %51 
                                         f32 %501 = OpLoad %500 
                                                      OpStore %495 %501 
                                                      OpBranch %497 
                                             %497 = OpLabel 
                                         f32 %502 = OpLoad %495 
                                Private f32* %503 = OpAccessChain %493 %51 
                                                      OpStore %503 %502 
                                Private f32* %504 = OpAccessChain %493 %59 
                                                      OpStore %504 %55 
                               Private bool* %505 = OpAccessChain %359 %51 
                                        bool %506 = OpLoad %505 
                                                      OpSelectionMerge %509 None 
                                                      OpBranchConditional %506 %508 %511 
                                             %508 = OpLabel 
                                       f32_2 %510 = OpLoad %493 
                                                      OpStore %507 %510 
                                                      OpBranch %509 
                                             %511 = OpLabel 
                                       f32_4 %512 = OpLoad vs_TEXCOORD0 
                                       f32_2 %513 = OpVectorShuffle %512 %512 0 1 
                                                      OpStore %507 %513 
                                                      OpBranch %509 
                                             %509 = OpLabel 
                                       f32_2 %514 = OpLoad %507 
                                       f32_3 %515 = OpLoad %374 
                                       f32_3 %516 = OpVectorShuffle %515 %514 0 3 4 
                                                      OpStore %374 %516 
                                Private f32* %518 = OpAccessChain %349 %59 
                                         f32 %519 = OpLoad %518 
                                         f32 %521 = OpFMul %519 %520 
                                Private f32* %522 = OpAccessChain %517 %51 
                                                      OpStore %522 %521 
                                Private f32* %525 = OpAccessChain %517 %51 
                                         f32 %526 = OpLoad %525 
                                         i32 %527 = OpConvertFToS %526 
                                                      OpStore %524 %527 
                                Private f32* %529 = OpAccessChain %374 %59 
                                         f32 %530 = OpLoad %529 
                                Private f32* %531 = OpAccessChain %374 %59 
                                         f32 %532 = OpLoad %531 
                                         f32 %533 = OpFNegate %532 
                                        bool %534 = OpFOrdGreaterThanEqual %530 %533 
                                                      OpStore %528 %534 
                                Private f32* %535 = OpAccessChain %374 %59 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpExtInst %1 4 %536 
                                         f32 %538 = OpExtInst %1 10 %537 
                                Private f32* %539 = OpAccessChain %364 %51 
                                                      OpStore %539 %538 
                                        bool %541 = OpLoad %528 
                                                      OpSelectionMerge %544 None 
                                                      OpBranchConditional %541 %543 %547 
                                             %543 = OpLabel 
                                Private f32* %545 = OpAccessChain %364 %51 
                                         f32 %546 = OpLoad %545 
                                                      OpStore %542 %546 
                                                      OpBranch %544 
                                             %547 = OpLabel 
                                Private f32* %548 = OpAccessChain %364 %51 
                                         f32 %549 = OpLoad %548 
                                         f32 %550 = OpFNegate %549 
                                                      OpStore %542 %550 
                                                      OpBranch %544 
                                             %544 = OpLabel 
                                         f32 %551 = OpLoad %542 
                                Private f32* %552 = OpAccessChain %540 %51 
                                                      OpStore %552 %551 
                                         i32 %553 = OpLoad %524 
                                        bool %554 = OpINotEqual %553 %146 
                                                      OpSelectionMerge %557 None 
                                                      OpBranchConditional %554 %556 %560 
                                             %556 = OpLabel 
                                Private f32* %558 = OpAccessChain %374 %59 
                                         f32 %559 = OpLoad %558 
                                                      OpStore %555 %559 
                                                      OpBranch %557 
                                             %560 = OpLabel 
                                Private f32* %561 = OpAccessChain %540 %51 
                                         f32 %562 = OpLoad %561 
                                                      OpStore %555 %562 
                                                      OpBranch %557 
                                             %557 = OpLabel 
                                         f32 %563 = OpLoad %555 
                                Private f32* %564 = OpAccessChain %540 %51 
                                                      OpStore %564 %563 
                                         i32 %565 = OpLoad %524 
                                       i32_4 %567 = OpCompositeConstruct %565 %565 %565 %565 
                                      bool_4 %569 = OpIEqual %567 %568 
                                      bool_2 %570 = OpVectorShuffle %569 %569 0 2 
                                      bool_3 %571 = OpLoad %359 
                                      bool_3 %572 = OpVectorShuffle %571 %570 3 1 4 
                                                      OpStore %359 %572 
                                Private f32* %573 = OpAccessChain %540 %51 
                                         f32 %574 = OpLoad %573 
                                                      OpStore %432 %574 
                                         f32 %575 = OpLoad %432 
                                         f32 %576 = OpExtInst %1 43 %575 %55 %15 
                                                      OpStore %432 %576 
                               Private bool* %578 = OpAccessChain %359 %51 
                                        bool %579 = OpLoad %578 
                                                      OpSelectionMerge %582 None 
                                                      OpBranchConditional %579 %581 %584 
                                             %581 = OpLabel 
                                         f32 %583 = OpLoad %432 
                                                      OpStore %580 %583 
                                                      OpBranch %582 
                                             %584 = OpLabel 
                                Private f32* %585 = OpAccessChain %540 %51 
                                         f32 %586 = OpLoad %585 
                                                      OpStore %580 %586 
                                                      OpBranch %582 
                                             %582 = OpLabel 
                                         f32 %587 = OpLoad %580 
                                Private f32* %588 = OpAccessChain %577 %51 
                                                      OpStore %588 %587 
                                Private f32* %589 = OpAccessChain %577 %51 
                                         f32 %590 = OpLoad %589 
                                         f32 %591 = OpFMul %590 %233 
                                Private f32* %592 = OpAccessChain %540 %51 
                                                      OpStore %592 %591 
                                Private f32* %594 = OpAccessChain %540 %51 
                                         f32 %595 = OpLoad %594 
                                Private f32* %596 = OpAccessChain %540 %51 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpFNegate %597 
                                        bool %599 = OpFOrdGreaterThanEqual %595 %598 
                                                      OpStore %593 %599 
                                Private f32* %600 = OpAccessChain %540 %51 
                                         f32 %601 = OpLoad %600 
                                         f32 %602 = OpExtInst %1 4 %601 
                                         f32 %603 = OpExtInst %1 10 %602 
                                Private f32* %604 = OpAccessChain %540 %51 
                                                      OpStore %604 %603 
                                        bool %605 = OpLoad %593 
                                                      OpSelectionMerge %608 None 
                                                      OpBranchConditional %605 %607 %611 
                                             %607 = OpLabel 
                                Private f32* %609 = OpAccessChain %540 %51 
                                         f32 %610 = OpLoad %609 
                                                      OpStore %606 %610 
                                                      OpBranch %608 
                                             %611 = OpLabel 
                                Private f32* %612 = OpAccessChain %540 %51 
                                         f32 %613 = OpLoad %612 
                                         f32 %614 = OpFNegate %613 
                                                      OpStore %606 %614 
                                                      OpBranch %608 
                                             %608 = OpLabel 
                                         f32 %615 = OpLoad %606 
                                Private f32* %616 = OpAccessChain %540 %51 
                                                      OpStore %616 %615 
                                Private f32* %617 = OpAccessChain %540 %51 
                                         f32 %618 = OpLoad %617 
                                Private f32* %619 = OpAccessChain %540 %51 
                                         f32 %620 = OpLoad %619 
                                         f32 %621 = OpFAdd %618 %620 
                                                      OpStore %432 %621 
                                Private f32* %622 = OpAccessChain %540 %51 
                                         f32 %623 = OpLoad %622 
                                        bool %624 = OpFOrdLessThan %233 %623 
                                                      OpStore %528 %624 
                                         f32 %626 = OpLoad %432 
                                         f32 %627 = OpLoad %432 
                                         f32 %628 = OpFNegate %627 
                                        bool %629 = OpFOrdGreaterThanEqual %626 %628 
                                                      OpStore %625 %629 
                                         f32 %631 = OpLoad %432 
                                         f32 %632 = OpExtInst %1 4 %631 
                                         f32 %633 = OpExtInst %1 10 %632 
                                                      OpStore %630 %633 
                                        bool %634 = OpLoad %625 
                                                      OpSelectionMerge %637 None 
                                                      OpBranchConditional %634 %636 %639 
                                             %636 = OpLabel 
                                         f32 %638 = OpLoad %630 
                                                      OpStore %635 %638 
                                                      OpBranch %637 
                                             %639 = OpLabel 
                                         f32 %640 = OpLoad %630 
                                         f32 %641 = OpFNegate %640 
                                                      OpStore %635 %641 
                                                      OpBranch %637 
                                             %637 = OpLabel 
                                         f32 %642 = OpLoad %635 
                                Private f32* %643 = OpAccessChain %493 %51 
                                                      OpStore %643 %642 
                                Private f32* %644 = OpAccessChain %493 %51 
                                         f32 %645 = OpLoad %644 
                                         f32 %646 = OpFNegate %645 
                                         f32 %647 = OpFAdd %646 %15 
                                Private f32* %648 = OpAccessChain %493 %51 
                                                      OpStore %648 %647 
                                        bool %649 = OpLoad %528 
                                                      OpSelectionMerge %652 None 
                                                      OpBranchConditional %649 %651 %655 
                                             %651 = OpLabel 
                                Private f32* %653 = OpAccessChain %493 %51 
                                         f32 %654 = OpLoad %653 
                                                      OpStore %650 %654 
                                                      OpBranch %652 
                                             %655 = OpLabel 
                                         f32 %656 = OpLoad %432 
                                                      OpStore %650 %656 
                                                      OpBranch %652 
                                             %652 = OpLabel 
                                         f32 %657 = OpLoad %650 
                                Private f32* %658 = OpAccessChain %540 %51 
                                                      OpStore %658 %657 
                               Private bool* %659 = OpAccessChain %359 %64 
                                        bool %660 = OpLoad %659 
                                                      OpSelectionMerge %663 None 
                                                      OpBranchConditional %660 %662 %666 
                                             %662 = OpLabel 
                                Private f32* %664 = OpAccessChain %540 %51 
                                         f32 %665 = OpLoad %664 
                                                      OpStore %661 %665 
                                                      OpBranch %663 
                                             %666 = OpLabel 
                                Private f32* %667 = OpAccessChain %577 %51 
                                         f32 %668 = OpLoad %667 
                                                      OpStore %661 %668 
                                                      OpBranch %663 
                                             %663 = OpLabel 
                                         f32 %669 = OpLoad %661 
                                Private f32* %670 = OpAccessChain %374 %51 
                                                      OpStore %670 %669 
                                Uniform f32* %672 = OpAccessChain %87 %344 %51 
                                         f32 %673 = OpLoad %672 
                                Private f32* %674 = OpAccessChain %340 %51 
                                                      OpStore %674 %673 
                                       f32_4 %675 = OpLoad %334 
                                       f32_2 %676 = OpVectorShuffle %675 %675 0 1 
                              Uniform f32_4* %677 = OpAccessChain %87 %344 
                                       f32_4 %678 = OpLoad %677 
                                       f32_2 %679 = OpVectorShuffle %678 %678 0 1 
                                       f32_2 %680 = OpFMul %676 %679 
                                       f32_2 %681 = OpLoad %340 
                                       f32_2 %682 = OpFAdd %680 %681 
                                                      OpStore %577 %682 
                         read_only Texture2D %683 = OpLoad %350 
                                     sampler %684 = OpLoad %352 
                  read_only Texture2DSampled %685 = OpSampledImage %683 %684 
                                       f32_2 %686 = OpLoad %577 
                                       f32_4 %687 = OpImageSampleImplicitLod %685 %686 
                                                      OpStore %349 %687 
                                       f32_4 %688 = OpLoad %349 
                                       f32_2 %689 = OpVectorShuffle %688 %688 1 3 
                                       f32_2 %691 = OpFMul %689 %690 
                                       f32_3 %692 = OpLoad %540 
                                       f32_3 %693 = OpVectorShuffle %692 %691 3 1 4 
                                                      OpStore %540 %693 
                                       f32_4 %694 = OpLoad %349 
                                       f32_2 %695 = OpVectorShuffle %694 %694 0 2 
                                       f32_2 %698 = OpFMul %695 %697 
                                       f32_3 %699 = OpLoad %540 
                                       f32_2 %700 = OpVectorShuffle %699 %699 0 2 
                                       f32_2 %701 = OpFAdd %698 %700 
                                                      OpStore %517 %701 
                                       f32_2 %702 = OpLoad %517 
                                       f32_2 %704 = OpFAdd %702 %703 
                                                      OpStore %577 %704 
                                       f32_2 %705 = OpLoad %340 
                                       f32_2 %706 = OpFMul %705 %383 
                                       f32_2 %707 = OpLoad %220 
                                       f32_2 %708 = OpFAdd %706 %707 
                                                      OpStore %220 %708 
                         read_only Texture2D %709 = OpLoad %350 
                                     sampler %710 = OpLoad %352 
                  read_only Texture2DSampled %711 = OpSampledImage %709 %710 
                                       f32_2 %712 = OpLoad %220 
                                       f32_4 %713 = OpImageSampleImplicitLod %711 %712 
                                                      OpStore %287 %713 
                                       f32_4 %714 = OpLoad %287 
                                       f32_2 %715 = OpVectorShuffle %714 %714 1 3 
                                       f32_2 %716 = OpFMul %715 %690 
                                                      OpStore %220 %716 
                                       f32_4 %717 = OpLoad %287 
                                       f32_2 %718 = OpVectorShuffle %717 %717 0 2 
                                       f32_2 %719 = OpFMul %718 %697 
                                       f32_2 %720 = OpLoad %220 
                                       f32_2 %721 = OpFAdd %719 %720 
                                                      OpStore %517 %721 
                                       f32_2 %722 = OpLoad %205 
                                       f32_2 %723 = OpLoad %577 
                                       f32_2 %724 = OpFMul %722 %723 
                                                      OpStore %220 %724 
                                       f32_2 %725 = OpLoad %205 
                                       f32_2 %726 = OpLoad %517 
                                       f32_2 %727 = OpFMul %725 %726 
                                                      OpStore %205 %727 
                                       f32_3 %728 = OpLoad %374 
                                       f32_2 %729 = OpVectorShuffle %728 %728 0 2 
                                       f32_2 %730 = OpLoad %205 
                                       f32_2 %731 = OpFMul %729 %730 
                                       f32_2 %732 = OpLoad %220 
                                       f32_2 %733 = OpFAdd %731 %732 
                                                      OpStore %205 %733 
                         read_only Texture2D %734 = OpLoad %173 
                                     sampler %735 = OpLoad %193 
                  read_only Texture2DSampled %736 = OpSampledImage %734 %735 
                                       f32_2 %737 = OpLoad %205 
                                       f32_4 %738 = OpImageSampleImplicitLod %736 %737 
                                                      OpStore %287 %738 
                                       f32_4 %739 = OpLoad %287 
                                       f32_3 %740 = OpLoad vs_TEXCOORD2 
                                       f32_4 %741 = OpVectorShuffle %740 %740 0 0 0 0 
                                       f32_4 %742 = OpFMul %739 %741 
                                       f32_4 %743 = OpLoad %50 
                                       f32_4 %744 = OpFAdd %742 %743 
                                                      OpStore %334 %744 
                         read_only Texture2D %745 = OpLoad %288 
                                     sampler %746 = OpLoad %290 
                  read_only Texture2DSampled %747 = OpSampledImage %745 %746 
                                       f32_2 %748 = OpLoad %205 
                                       f32_4 %749 = OpImageSampleImplicitLod %747 %748 
                                                      OpStore %191 %749 
                                       f32_4 %750 = OpLoad %191 
                                       f32_3 %751 = OpLoad vs_TEXCOORD2 
                                       f32_4 %752 = OpVectorShuffle %751 %751 1 1 1 1 
                                       f32_4 %753 = OpFMul %750 %752 
                                       f32_4 %754 = OpLoad %334 
                                       f32_4 %755 = OpFAdd %753 %754 
                                                      OpStore %334 %755 
                                       f32_4 %756 = OpLoad %334 
                                                      OpStore %155 %756 
                                                      OpBranch %319 
                                             %757 = OpLabel 
                                       f32_4 %758 = OpLoad %50 
                                                      OpStore %155 %758 
                                                      OpBranch %319 
                                             %319 = OpLabel 
                                       f32_4 %761 = OpLoad %155 
                                       f32_4 %763 = OpLoad %762 
                                       f32_4 %764 = OpFMul %761 %763 
                                                      OpStore %760 %764 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 664
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %89 %100 %186 %211 %391 %430 %449 %458 %563 %572 %648 %656 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %100 Location 100 
                                                      OpDecorate %136 ArrayStride 136 
                                                      OpDecorate %137 ArrayStride 137 
                                                      OpMemberDecorate %138 0 Offset 138 
                                                      OpMemberDecorate %138 1 Offset 138 
                                                      OpMemberDecorate %138 2 Offset 138 
                                                      OpMemberDecorate %138 3 Offset 138 
                                                      OpMemberDecorate %138 4 Offset 138 
                                                      OpMemberDecorate %138 5 Offset 138 
                                                      OpDecorate %138 Block 
                                                      OpDecorate %140 DescriptorSet 140 
                                                      OpDecorate %140 Binding 140 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %173 DescriptorSet 173 
                                                      OpDecorate %173 Binding 173 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %177 DescriptorSet 177 
                                                      OpDecorate %177 Binding 177 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %211 Location 211 
                                                      OpDecorate vs_TEXCOORD0 Location 391 
                                                      OpMemberDecorate %428 0 BuiltIn 428 
                                                      OpMemberDecorate %428 1 BuiltIn 428 
                                                      OpMemberDecorate %428 2 BuiltIn 428 
                                                      OpDecorate %428 Block 
                                                      OpDecorate %439 RelaxedPrecision 
                                                      OpDecorate %440 RelaxedPrecision 
                                                      OpDecorate %449 Location 449 
                                                      OpDecorate %458 RelaxedPrecision 
                                                      OpDecorate %458 Location 458 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 563 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 572 
                                                      OpDecorate vs_TEXCOORD3 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD3 Location 648 
                                                      OpDecorate %650 RelaxedPrecision 
                                                      OpDecorate %651 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD4 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD4 Flat 
                                                      OpDecorate vs_TEXCOORD4 Location 656 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                          f32 %14 = OpConstant 3.674022E-40 
                                          f32 %15 = OpConstant 3.674022E-40 
                                        f32_4 %16 = OpConstantComposite %14 %15 %14 %15 
                                              %18 = OpTypeBool 
                                              %19 = OpTypeVector %18 4 
                                              %20 = OpTypePointer Private %19 
                              Private bool_4* %21 = OpVariable Private 
                               Private f32_4* %28 = OpVariable Private 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %18 
                                          f32 %34 = OpConstant 3.674022E-40 
                                          f32 %35 = OpConstant 3.674022E-40 
                                              %37 = OpTypePointer Private %6 
                                          u32 %39 = OpConstant 1 
                                          f32 %42 = OpConstant 3.674022E-40 
                                          f32 %43 = OpConstant 3.674022E-40 
                                          u32 %46 = OpConstant 2 
                                          u32 %51 = OpConstant 3 
                                              %56 = OpTypeVector %6 2 
                                              %76 = OpTypePointer Private %56 
                               Private f32_2* %77 = OpVariable Private 
                                        f32_2 %80 = OpConstantComposite %14 %14 
                                        f32_2 %87 = OpConstantComposite %42 %42 
                                 Input f32_4* %89 = OpVariable Input 
                                              %90 = OpTypePointer Input %6 
                                          f32 %93 = OpConstant 3.674022E-40 
                               Private f32_2* %99 = OpVariable Private 
                                Input f32_4* %100 = OpVariable Input 
                                         f32 %110 = OpConstant 3.674022E-40 
                                         f32 %128 = OpConstant 3.674022E-40 
                                       f32_2 %129 = OpConstantComposite %128 %128 
                                         u32 %135 = OpConstant 4 
                                             %136 = OpTypeArray %7 %135 
                                             %137 = OpTypeArray %7 %135 
                                             %138 = OpTypeStruct %136 %137 %7 %7 %7 %7 
                                             %139 = OpTypePointer Uniform %138 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %140 = OpVariable Uniform 
                                             %141 = OpTypeInt 32 1 
                                         i32 %142 = OpConstant 4 
                                             %143 = OpTypePointer Uniform %7 
                              Private f32_4* %150 = OpVariable Private 
                                         f32 %153 = OpConstant 3.674022E-40 
                                       f32_4 %154 = OpConstantComposite %128 %128 %128 %153 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_2 %159 = OpConstantComposite %128 %158 
                                             %171 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %172 = OpTypePointer UniformConstant %171 
        UniformConstant read_only Texture2D* %173 = OpVariable UniformConstant 
                                             %175 = OpTypeSampler 
                                             %176 = OpTypePointer UniformConstant %175 
                    UniformConstant sampler* %177 = OpVariable UniformConstant 
                                             %179 = OpTypeSampledImage %171 
                                         f32 %183 = OpConstant 3.674022E-40 
                                Input f32_4* %186 = OpVariable Input 
                              Private f32_4* %195 = OpVariable Private 
                                             %210 = OpTypePointer Input %56 
                                Input f32_2* %211 = OpVariable Input 
                              Private f32_2* %215 = OpVariable Private 
                                         i32 %230 = OpConstant 5 
                              Private f32_2* %237 = OpVariable Private 
                                         f32 %241 = OpConstant 3.674022E-40 
                                       f32_2 %242 = OpConstantComposite %241 %241 
                                         f32 %247 = OpConstant 3.674022E-40 
                                       f32_2 %248 = OpConstantComposite %247 %247 
                             Private bool_4* %264 = OpVariable Private 
                                         f32 %267 = OpConstant 3.674022E-40 
                                         f32 %268 = OpConstant 3.674022E-40 
                                         f32 %269 = OpConstant 3.674022E-40 
                                         f32 %270 = OpConstant 3.674022E-40 
                                       f32_4 %271 = OpConstantComposite %267 %268 %269 %270 
                                             %273 = OpTypePointer Function %7 
                                             %278 = OpTypePointer Function %6 
                                         f32 %310 = OpConstant 3.674022E-40 
                                       f32_2 %311 = OpConstantComposite %310 %310 
                                         f32 %317 = OpConstant 3.674022E-40 
                                       f32_2 %318 = OpConstantComposite %317 %317 
                                         f32 %324 = OpConstant 3.674022E-40 
                                       f32_2 %325 = OpConstantComposite %324 %324 
                              Private f32_2* %329 = OpVariable Private 
                             Private bool_4* %334 = OpVariable Private 
                                         f32 %337 = OpConstant 3.674022E-40 
                                         f32 %338 = OpConstant 3.674022E-40 
                                         f32 %339 = OpConstant 3.674022E-40 
                                         f32 %340 = OpConstant 3.674022E-40 
                                       f32_4 %341 = OpConstantComposite %337 %338 %339 %340 
                               Private bool* %343 = OpVariable Private 
                                             %353 = OpTypeVector %6 3 
                                             %354 = OpTypePointer Private %353 
                              Private f32_3* %355 = OpVariable Private 
                                             %365 = OpTypePointer Function %56 
                                       f32_2 %371 = OpConstantComposite %183 %183 
                                         i32 %378 = OpConstant 0 
                                         i32 %379 = OpConstant 1 
                                             %390 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                         i32 %395 = OpConstant 2 
                                         i32 %404 = OpConstant 3 
                                             %427 = OpTypeArray %6 %39 
                                             %428 = OpTypeStruct %7 %6 %427 
                                             %429 = OpTypePointer Output %428 
        Output struct {f32_4; f32; f32[1];}* %430 = OpVariable Output 
                                Input f32_4* %449 = OpVariable Input 
                               Output f32_4* %458 = OpVariable Output 
                                Private f32* %489 = OpVariable Private 
                                         f32 %492 = OpConstant 3.674022E-40 
                                Private f32* %499 = OpVariable Private 
                               Private bool* %505 = OpVariable Private 
                                         f32 %521 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         f32 %567 = OpConstant 3.674022E-40 
                                       f32_2 %568 = OpConstantComposite %567 %14 
                                             %571 = OpTypePointer Output %353 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                       f32_2 %576 = OpConstantComposite %14 %15 
                               Private bool* %580 = OpVariable Private 
                                       f32_2 %588 = OpConstantComposite %34 %42 
                                       f32_2 %589 = OpConstantComposite %35 %43 
                                             %590 = OpTypeVector %18 2 
                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
                                             %658 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_4* %274 = OpVariable Function 
                               Function f32* %279 = OpVariable Function 
                               Function f32* %291 = OpVariable Function 
                             Function f32_2* %366 = OpVariable Function 
                             Function f32_2* %509 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 0 0 2 2 
                                        f32_4 %17 = OpFMul %13 %16 
                                                      OpStore %9 %17 
                                        f32_4 %22 = OpLoad %9 
                                        f32_4 %23 = OpVectorShuffle %22 %22 1 1 3 3 
                                        f32_4 %24 = OpLoad %9 
                                        f32_4 %25 = OpVectorShuffle %24 %24 1 1 3 3 
                                        f32_4 %26 = OpFNegate %25 
                                       bool_4 %27 = OpFOrdGreaterThanEqual %23 %26 
                                                      OpStore %21 %27 
                                Private bool* %32 = OpAccessChain %21 %30 
                                         bool %33 = OpLoad %32 
                                          f32 %36 = OpSelect %33 %34 %35 
                                 Private f32* %38 = OpAccessChain %28 %30 
                                                      OpStore %38 %36 
                                Private bool* %40 = OpAccessChain %21 %39 
                                         bool %41 = OpLoad %40 
                                          f32 %44 = OpSelect %41 %42 %43 
                                 Private f32* %45 = OpAccessChain %28 %39 
                                                      OpStore %45 %44 
                                Private bool* %47 = OpAccessChain %21 %46 
                                         bool %48 = OpLoad %47 
                                          f32 %49 = OpSelect %48 %34 %35 
                                 Private f32* %50 = OpAccessChain %28 %46 
                                                      OpStore %50 %49 
                                Private bool* %52 = OpAccessChain %21 %51 
                                         bool %53 = OpLoad %52 
                                          f32 %54 = OpSelect %53 %42 %43 
                                 Private f32* %55 = OpAccessChain %28 %51 
                                                      OpStore %55 %54 
                                        f32_4 %57 = OpLoad %9 
                                        f32_2 %58 = OpVectorShuffle %57 %57 0 2 
                                        f32_4 %59 = OpLoad %28 
                                        f32_2 %60 = OpVectorShuffle %59 %59 1 3 
                                        f32_2 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 3 
                                                      OpStore %9 %63 
                                        f32_4 %64 = OpLoad %9 
                                        f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                        f32_2 %66 = OpExtInst %1 10 %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpVectorShuffle %67 %66 4 5 2 3 
                                                      OpStore %9 %68 
                                        f32_4 %69 = OpLoad %9 
                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                        f32_4 %71 = OpLoad %28 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 2 
                                        f32_2 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 2 3 
                                                      OpStore %9 %75 
                                        f32_4 %78 = OpLoad %11 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 2 
                                        f32_2 %81 = OpFMul %79 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_2 %84 = OpFNegate %83 
                                        f32_2 %85 = OpFAdd %81 %84 
                                                      OpStore %77 %85 
                                        f32_2 %86 = OpLoad %77 
                                        f32_2 %88 = OpFMul %86 %87 
                                                      OpStore %77 %88 
                                   Input f32* %91 = OpAccessChain %89 %39 
                                          f32 %92 = OpLoad %91 
                                          f32 %94 = OpFMul %92 %93 
                                 Private f32* %95 = OpAccessChain %77 %30 
                                          f32 %96 = OpLoad %95 
                                          f32 %97 = OpFAdd %94 %96 
                                 Private f32* %98 = OpAccessChain %77 %30 
                                                      OpStore %98 %97 
                                  Input f32* %101 = OpAccessChain %100 %39 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFMul %102 %93 
                                Private f32* %104 = OpAccessChain %77 %39 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFAdd %103 %105 
                                Private f32* %107 = OpAccessChain %99 %39 
                                                      OpStore %107 %106 
                                Private f32* %108 = OpAccessChain %77 %30 
                                         f32 %109 = OpLoad %108 
                                         f32 %111 = OpFMul %109 %110 
                                Private f32* %112 = OpAccessChain %28 %39 
                                                      OpStore %112 %111 
                                  Input f32* %113 = OpAccessChain %89 %30 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %114 %15 
                                Private f32* %116 = OpAccessChain %9 %30 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFAdd %115 %117 
                                Private f32* %119 = OpAccessChain %28 %30 
                                                      OpStore %119 %118 
                                  Input f32* %120 = OpAccessChain %100 %30 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFMul %121 %15 
                                Private f32* %123 = OpAccessChain %9 %39 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFAdd %122 %124 
                                Private f32* %126 = OpAccessChain %99 %30 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %99 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                              Uniform f32_4* %144 = OpAccessChain %140 %142 
                                       f32_4 %145 = OpLoad %144 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %147 = OpFMul %134 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 0 1 4 5 
                                                      OpStore %9 %149 
                                       f32_4 %151 = OpLoad %28 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 1 0 1 
                                       f32_4 %155 = OpFAdd %152 %154 
                                                      OpStore %150 %155 
                                       f32_4 %156 = OpLoad %28 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                                       f32_2 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %28 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 3 
                                                      OpStore %28 %162 
                                       f32_4 %163 = OpLoad %28 
                                       f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                              Uniform f32_4* %165 = OpAccessChain %140 %142 
                                       f32_4 %166 = OpLoad %165 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFMul %164 %167 
                                       f32_4 %169 = OpLoad %28 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 2 3 
                                                      OpStore %28 %170 
                         read_only Texture2D %174 = OpLoad %173 
                                     sampler %178 = OpLoad %177 
                  read_only Texture2DSampled %180 = OpSampledImage %174 %178 
                                       f32_4 %181 = OpLoad %28 
                                       f32_2 %182 = OpVectorShuffle %181 %181 0 1 
                                       f32_4 %184 = OpImageSampleExplicitLod %180 %182 Lod %7 
                                                      OpStore %28 %184 
                                       f32_4 %185 = OpLoad %28 
                                       f32_4 %187 = OpLoad %186 
                                         f32 %188 = OpDot %185 %187 
                                Private f32* %189 = OpAccessChain %28 %30 
                                                      OpStore %189 %188 
                                       f32_4 %190 = OpLoad %150 
                              Uniform f32_4* %191 = OpAccessChain %140 %142 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpVectorShuffle %192 %192 0 1 0 1 
                                       f32_4 %194 = OpFMul %190 %193 
                                                      OpStore %150 %194 
                         read_only Texture2D %196 = OpLoad %173 
                                     sampler %197 = OpLoad %177 
                  read_only Texture2DSampled %198 = OpSampledImage %196 %197 
                                       f32_4 %199 = OpLoad %150 
                                       f32_2 %200 = OpVectorShuffle %199 %199 0 1 
                                       f32_4 %201 = OpImageSampleExplicitLod %198 %200 Lod %7 
                                                      OpStore %195 %201 
                         read_only Texture2D %202 = OpLoad %173 
                                     sampler %203 = OpLoad %177 
                  read_only Texture2DSampled %204 = OpSampledImage %202 %203 
                                       f32_4 %205 = OpLoad %150 
                                       f32_2 %206 = OpVectorShuffle %205 %205 2 3 
                                       f32_4 %207 = OpImageSampleExplicitLod %204 %206 Lod %7 
                                                      OpStore %150 %207 
                                       f32_4 %208 = OpLoad %195 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_2 %212 = OpLoad %211 
                                         f32 %213 = OpDot %209 %212 
                                Private f32* %214 = OpAccessChain %99 %30 
                                                      OpStore %214 %213 
                                       f32_4 %216 = OpLoad %195 
                                       f32_4 %217 = OpLoad %186 
                                         f32 %218 = OpDot %216 %217 
                                Private f32* %219 = OpAccessChain %215 %30 
                                                      OpStore %219 %218 
                                       f32_4 %220 = OpLoad %150 
                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                       f32_2 %222 = OpLoad %211 
                                         f32 %223 = OpDot %221 %222 
                                Private f32* %224 = OpAccessChain %99 %39 
                                                      OpStore %224 %223 
                                       f32_4 %225 = OpLoad %150 
                                       f32_4 %226 = OpLoad %186 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %215 %39 
                                                      OpStore %228 %227 
                                       f32_2 %229 = OpLoad %99 
                              Uniform f32_4* %231 = OpAccessChain %140 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_2 %233 = OpVectorShuffle %232 %232 2 3 
                                       f32_2 %234 = OpFMul %229 %233 
                                       f32_4 %235 = OpLoad %150 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
                                                      OpStore %150 %236 
                                       f32_4 %238 = OpLoad %150 
                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
                                       f32_2 %240 = OpExtInst %1 4 %239 
                                       f32_2 %243 = OpFAdd %240 %242 
                                                      OpStore %237 %243 
                                       f32_4 %244 = OpLoad %150 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_2 %246 = OpExtInst %1 4 %245 
                                       f32_2 %249 = OpExtInst %1 40 %246 %248 
                                       f32_4 %250 = OpLoad %150 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 2 3 
                                                      OpStore %150 %251 
                                       f32_4 %252 = OpLoad %150 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                                       f32_2 %254 = OpExtInst %1 2 %253 
                                       f32_4 %255 = OpLoad %195 
                                       f32_4 %256 = OpVectorShuffle %255 %254 4 5 2 3 
                                                      OpStore %195 %256 
                                       f32_4 %257 = OpLoad %150 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 1 
                                       f32_4 %259 = OpLoad %195 
                                       f32_2 %260 = OpVectorShuffle %259 %259 0 1 
                                       f32_2 %261 = OpExtInst %1 40 %258 %260 
                                       f32_4 %262 = OpLoad %150 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 3 
                                                      OpStore %150 %263 
                                       f32_4 %265 = OpLoad %11 
                                       f32_4 %266 = OpVectorShuffle %265 %265 3 3 3 3 
                                      bool_4 %272 = OpFOrdEqual %266 %271 
                                                      OpStore %264 %272 
                                       f32_4 %275 = OpLoad %150 
                                                      OpStore %274 %275 
                               Private bool* %276 = OpAccessChain %264 %51 
                                        bool %277 = OpLoad %276 
                                                      OpSelectionMerge %281 None 
                                                      OpBranchConditional %277 %280 %284 
                                             %280 = OpLabel 
                                Private f32* %282 = OpAccessChain %150 %30 
                                         f32 %283 = OpLoad %282 
                                                      OpStore %279 %283 
                                                      OpBranch %281 
                                             %284 = OpLabel 
                                Private f32* %285 = OpAccessChain %195 %30 
                                         f32 %286 = OpLoad %285 
                                                      OpStore %279 %286 
                                                      OpBranch %281 
                                             %281 = OpLabel 
                                         f32 %287 = OpLoad %279 
                               Function f32* %288 = OpAccessChain %274 %30 
                                                      OpStore %288 %287 
                               Private bool* %289 = OpAccessChain %264 %46 
                                        bool %290 = OpLoad %289 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %290 %292 %296 
                                             %292 = OpLabel 
                                Private f32* %294 = OpAccessChain %150 %39 
                                         f32 %295 = OpLoad %294 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                Private f32* %297 = OpAccessChain %195 %39 
                                         f32 %298 = OpLoad %297 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                         f32 %299 = OpLoad %291 
                               Function f32* %300 = OpAccessChain %274 %39 
                                                      OpStore %300 %299 
                                       f32_4 %301 = OpLoad %274 
                                                      OpStore %150 %301 
                                       f32_4 %302 = OpLoad %150 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                       f32_2 %304 = OpLoad %237 
                                       f32_2 %305 = OpFDiv %303 %304 
                                       f32_4 %306 = OpLoad %150 
                                       f32_4 %307 = OpVectorShuffle %306 %305 4 5 2 3 
                                                      OpStore %150 %307 
                                       f32_4 %308 = OpLoad %150 
                                       f32_2 %309 = OpVectorShuffle %308 %308 0 1 
                                       f32_2 %312 = OpExtInst %1 40 %309 %311 
                                       f32_4 %313 = OpLoad %150 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 5 2 3 
                                                      OpStore %150 %314 
                                       f32_4 %315 = OpLoad %150 
                                       f32_2 %316 = OpVectorShuffle %315 %315 0 1 
                                       f32_2 %319 = OpExtInst %1 37 %316 %318 
                                       f32_4 %320 = OpLoad %150 
                                       f32_4 %321 = OpVectorShuffle %320 %319 4 5 2 3 
                                                      OpStore %150 %321 
                                       f32_4 %322 = OpLoad %150 
                                       f32_2 %323 = OpVectorShuffle %322 %322 0 1 
                                       f32_2 %326 = OpFAdd %323 %325 
                                       f32_4 %327 = OpLoad %150 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 2 3 
                                                      OpStore %150 %328 
                                       f32_2 %330 = OpLoad %99 
                                       f32_4 %331 = OpLoad %150 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                       f32_2 %333 = OpFMul %330 %332 
                                                      OpStore %329 %333 
                                       f32_4 %335 = OpLoad %11 
                                       f32_4 %336 = OpVectorShuffle %335 %335 3 3 3 3 
                                      bool_4 %342 = OpFOrdEqual %336 %341 
                                                      OpStore %334 %342 
                               Private bool* %344 = OpAccessChain %264 %51 
                                        bool %345 = OpLoad %344 
                               Private bool* %346 = OpAccessChain %334 %30 
                                        bool %347 = OpLoad %346 
                                        bool %348 = OpLogicalOr %345 %347 
                                                      OpStore %343 %348 
                               Private bool* %349 = OpAccessChain %264 %46 
                                        bool %350 = OpLoad %349 
                                        bool %351 = OpLoad %343 
                                        bool %352 = OpLogicalOr %350 %351 
                                                      OpStore %343 %352 
                               Private bool* %356 = OpAccessChain %264 %39 
                                        bool %357 = OpLoad %356 
                                         f32 %358 = OpSelect %357 %247 %183 
                                Private f32* %359 = OpAccessChain %355 %30 
                                                      OpStore %359 %358 
                               Private bool* %360 = OpAccessChain %264 %30 
                                        bool %361 = OpLoad %360 
                                         f32 %362 = OpSelect %361 %247 %183 
                                Private f32* %363 = OpAccessChain %355 %39 
                                                      OpStore %363 %362 
                                        bool %364 = OpLoad %343 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %364 %367 %370 
                                             %367 = OpLabel 
                                       f32_2 %369 = OpLoad %329 
                                                      OpStore %366 %369 
                                                      OpBranch %368 
                                             %370 = OpLabel 
                                                      OpStore %366 %371 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                       f32_2 %372 = OpLoad %366 
                                                      OpStore %329 %372 
                                       f32_2 %373 = OpLoad %329 
                                       f32_2 %374 = OpLoad %215 
                                       f32_2 %375 = OpFAdd %373 %374 
                                                      OpStore %329 %375 
                                       f32_2 %376 = OpLoad %329 
                                       f32_4 %377 = OpVectorShuffle %376 %376 1 1 1 1 
                              Uniform f32_4* %380 = OpAccessChain %140 %378 %379 
                                       f32_4 %381 = OpLoad %380 
                                       f32_4 %382 = OpFMul %377 %381 
                                                      OpStore %195 %382 
                              Uniform f32_4* %383 = OpAccessChain %140 %378 %378 
                                       f32_4 %384 = OpLoad %383 
                                       f32_2 %385 = OpLoad %329 
                                       f32_4 %386 = OpVectorShuffle %385 %385 0 0 0 0 
                                       f32_4 %387 = OpFMul %384 %386 
                                       f32_4 %388 = OpLoad %195 
                                       f32_4 %389 = OpFAdd %387 %388 
                                                      OpStore %195 %389 
                                       f32_2 %392 = OpLoad %329 
                                       f32_4 %393 = OpLoad vs_TEXCOORD0 
                                       f32_4 %394 = OpVectorShuffle %393 %392 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %394 
                              Uniform f32_4* %396 = OpAccessChain %140 %378 %395 
                                       f32_4 %397 = OpLoad %396 
                                       f32_4 %398 = OpLoad %28 
                                       f32_4 %399 = OpVectorShuffle %398 %398 0 0 0 0 
                                       f32_4 %400 = OpFMul %397 %399 
                                       f32_4 %401 = OpLoad %195 
                                       f32_4 %402 = OpFAdd %400 %401 
                                                      OpStore %28 %402 
                                       f32_4 %403 = OpLoad %28 
                              Uniform f32_4* %405 = OpAccessChain %140 %378 %404 
                                       f32_4 %406 = OpLoad %405 
                                       f32_4 %407 = OpFAdd %403 %406 
                                                      OpStore %28 %407 
                                       f32_4 %408 = OpLoad %28 
                                       f32_4 %409 = OpVectorShuffle %408 %408 1 1 1 1 
                              Uniform f32_4* %410 = OpAccessChain %140 %379 %379 
                                       f32_4 %411 = OpLoad %410 
                                       f32_4 %412 = OpFMul %409 %411 
                                                      OpStore %195 %412 
                              Uniform f32_4* %413 = OpAccessChain %140 %379 %378 
                                       f32_4 %414 = OpLoad %413 
                                       f32_4 %415 = OpLoad %28 
                                       f32_4 %416 = OpVectorShuffle %415 %415 0 0 0 0 
                                       f32_4 %417 = OpFMul %414 %416 
                                       f32_4 %418 = OpLoad %195 
                                       f32_4 %419 = OpFAdd %417 %418 
                                                      OpStore %195 %419 
                              Uniform f32_4* %420 = OpAccessChain %140 %379 %395 
                                       f32_4 %421 = OpLoad %420 
                                       f32_4 %422 = OpLoad %28 
                                       f32_4 %423 = OpVectorShuffle %422 %422 2 2 2 2 
                                       f32_4 %424 = OpFMul %421 %423 
                                       f32_4 %425 = OpLoad %195 
                                       f32_4 %426 = OpFAdd %424 %425 
                                                      OpStore %195 %426 
                              Uniform f32_4* %431 = OpAccessChain %140 %379 %404 
                                       f32_4 %432 = OpLoad %431 
                                       f32_4 %433 = OpLoad %28 
                                       f32_4 %434 = OpVectorShuffle %433 %433 3 3 3 3 
                                       f32_4 %435 = OpFMul %432 %434 
                                       f32_4 %436 = OpLoad %195 
                                       f32_4 %437 = OpFAdd %435 %436 
                               Output f32_4* %438 = OpAccessChain %430 %378 
                                                      OpStore %438 %437 
                         read_only Texture2D %439 = OpLoad %173 
                                     sampler %440 = OpLoad %177 
                  read_only Texture2DSampled %441 = OpSampledImage %439 %440 
                                       f32_4 %442 = OpLoad %9 
                                       f32_2 %443 = OpVectorShuffle %442 %442 2 3 
                                       f32_4 %444 = OpImageSampleExplicitLod %441 %443 Lod %7 
                                         f32 %445 = OpCompositeExtract %444 3 
                                Private f32* %446 = OpAccessChain %28 %30 
                                                      OpStore %446 %445 
                                Private f32* %447 = OpAccessChain %28 %30 
                                         f32 %448 = OpLoad %447 
                                  Input f32* %450 = OpAccessChain %449 %51 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpFMul %448 %451 
                                Private f32* %453 = OpAccessChain %28 %51 
                                                      OpStore %453 %452 
                                       f32_4 %454 = OpLoad %449 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_4 %456 = OpLoad %28 
                                       f32_4 %457 = OpVectorShuffle %456 %455 4 5 6 3 
                                                      OpStore %28 %457 
                                       f32_4 %459 = OpLoad %28 
                                                      OpStore %458 %459 
                                       f32_2 %460 = OpLoad %211 
                              Uniform f32_4* %461 = OpAccessChain %140 %395 
                                       f32_4 %462 = OpLoad %461 
                                       f32_2 %463 = OpVectorShuffle %462 %462 0 1 
                                       f32_2 %464 = OpFMul %460 %463 
                              Uniform f32_4* %465 = OpAccessChain %140 %395 
                                       f32_4 %466 = OpLoad %465 
                                       f32_2 %467 = OpVectorShuffle %466 %466 2 3 
                                       f32_2 %468 = OpFAdd %464 %467 
                                       f32_4 %469 = OpLoad %28 
                                       f32_4 %470 = OpVectorShuffle %469 %468 4 5 2 3 
                                                      OpStore %28 %470 
                                       f32_4 %471 = OpLoad %28 
                                       f32_2 %472 = OpVectorShuffle %471 %471 0 1 
                              Uniform f32_4* %473 = OpAccessChain %140 %404 
                                       f32_4 %474 = OpLoad %473 
                                       f32_2 %475 = OpVectorShuffle %474 %474 0 1 
                                       f32_2 %476 = OpFMul %472 %475 
                                                      OpStore %99 %476 
                               Private bool* %477 = OpAccessChain %334 %39 
                                        bool %478 = OpLoad %477 
                                         f32 %479 = OpSelect %478 %247 %183 
                                Private f32* %480 = OpAccessChain %150 %30 
                                                      OpStore %480 %479 
                               Private bool* %481 = OpAccessChain %334 %46 
                                        bool %482 = OpLoad %481 
                                         f32 %483 = OpSelect %482 %247 %183 
                                Private f32* %484 = OpAccessChain %150 %39 
                                                      OpStore %484 %483 
                               Private bool* %485 = OpAccessChain %334 %51 
                                        bool %486 = OpLoad %485 
                                         f32 %487 = OpSelect %486 %247 %183 
                                Private f32* %488 = OpAccessChain %150 %46 
                                                      OpStore %488 %487 
                               Private bool* %490 = OpAccessChain %334 %51 
                                        bool %491 = OpLoad %490 
                                         f32 %493 = OpSelect %491 %324 %492 
                                                      OpStore %489 %493 
                                         f32 %494 = OpLoad %489 
                                Private f32* %495 = OpAccessChain %150 %39 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpFAdd %494 %496 
                                Private f32* %498 = OpAccessChain %195 %39 
                                                      OpStore %498 %497 
                                Private f32* %500 = OpAccessChain %150 %46 
                                         f32 %501 = OpLoad %500 
                                Private f32* %502 = OpAccessChain %150 %39 
                                         f32 %503 = OpLoad %502 
                                         f32 %504 = OpFAdd %501 %503 
                                                      OpStore %499 %504 
                                         f32 %506 = OpLoad %499 
                                        bool %507 = OpFOrdEqual %506 %247 
                                                      OpStore %505 %507 
                                        bool %508 = OpLoad %505 
                                                      OpSelectionMerge %511 None 
                                                      OpBranchConditional %508 %510 %513 
                                             %510 = OpLabel 
                                       f32_2 %512 = OpLoad %99 
                                                      OpStore %509 %512 
                                                      OpBranch %511 
                                             %513 = OpLabel 
                                       f32_4 %514 = OpLoad %28 
                                       f32_2 %515 = OpVectorShuffle %514 %514 0 1 
                                                      OpStore %509 %515 
                                                      OpBranch %511 
                                             %511 = OpLabel 
                                       f32_2 %516 = OpLoad %509 
                                       f32_4 %517 = OpLoad vs_TEXCOORD0 
                                       f32_4 %518 = OpVectorShuffle %517 %516 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %518 
                                  Input f32* %519 = OpAccessChain %11 %51 
                                         f32 %520 = OpLoad %519 
                                        bool %522 = OpFOrdEqual %520 %521 
                               Private bool* %523 = OpAccessChain %21 %30 
                                                      OpStore %523 %522 
                               Private bool* %524 = OpAccessChain %21 %30 
                                        bool %525 = OpLoad %524 
                                         f32 %526 = OpSelect %525 %247 %183 
                                Private f32* %527 = OpAccessChain %195 %30 
                                                      OpStore %527 %526 
                                         f32 %528 = OpLoad %499 
                                Private f32* %529 = OpAccessChain %195 %30 
                                         f32 %530 = OpLoad %529 
                                         f32 %531 = OpFAdd %528 %530 
                                Private f32* %532 = OpAccessChain %28 %30 
                                                      OpStore %532 %531 
                                Private f32* %533 = OpAccessChain %150 %30 
                                         f32 %534 = OpLoad %533 
                                Private f32* %535 = OpAccessChain %28 %30 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpFAdd %534 %536 
                                Private f32* %538 = OpAccessChain %28 %30 
                                                      OpStore %538 %537 
                                Private f32* %539 = OpAccessChain %150 %30 
                                         f32 %540 = OpLoad %539 
                                Private f32* %541 = OpAccessChain %195 %46 
                                                      OpStore %541 %540 
                                Private f32* %542 = OpAccessChain %355 %30 
                                         f32 %543 = OpLoad %542 
                                Private f32* %544 = OpAccessChain %28 %30 
                                         f32 %545 = OpLoad %544 
                                         f32 %546 = OpFAdd %543 %545 
                                Private f32* %547 = OpAccessChain %28 %30 
                                                      OpStore %547 %546 
                                Private f32* %548 = OpAccessChain %355 %39 
                                         f32 %549 = OpLoad %548 
                                Private f32* %550 = OpAccessChain %28 %30 
                                         f32 %551 = OpLoad %550 
                                         f32 %552 = OpFAdd %549 %551 
                                Private f32* %553 = OpAccessChain %28 %30 
                                                      OpStore %553 %552 
                                Private f32* %554 = OpAccessChain %28 %30 
                                         f32 %555 = OpLoad %554 
                                         f32 %556 = OpExtInst %1 37 %555 %247 
                                Private f32* %557 = OpAccessChain %28 %30 
                                                      OpStore %557 %556 
                                Private f32* %558 = OpAccessChain %28 %30 
                                         f32 %559 = OpLoad %558 
                                         f32 %560 = OpFNegate %559 
                                         f32 %561 = OpFAdd %560 %247 
                                Private f32* %562 = OpAccessChain %195 %51 
                                                      OpStore %562 %561 
                                       f32_4 %564 = OpLoad %195 
                                                      OpStore vs_TEXCOORD1 %564 
                                       f32_4 %565 = OpLoad %100 
                                       f32_2 %566 = OpVectorShuffle %565 %565 2 3 
                                         f32 %569 = OpDot %566 %568 
                                Private f32* %570 = OpAccessChain %355 %46 
                                                      OpStore %570 %569 
                                       f32_3 %573 = OpLoad %355 
                                                      OpStore vs_TEXCOORD2 %573 
                                       f32_4 %574 = OpLoad %11 
                                       f32_2 %575 = OpVectorShuffle %574 %574 1 1 
                                       f32_2 %577 = OpFMul %575 %576 
                                       f32_4 %578 = OpLoad %28 
                                       f32_4 %579 = OpVectorShuffle %578 %577 4 5 2 3 
                                                      OpStore %28 %579 
                                Private f32* %581 = OpAccessChain %28 %39 
                                         f32 %582 = OpLoad %581 
                                Private f32* %583 = OpAccessChain %28 %39 
                                         f32 %584 = OpLoad %583 
                                         f32 %585 = OpFNegate %584 
                                        bool %586 = OpFOrdGreaterThanEqual %582 %585 
                                                      OpStore %580 %586 
                                        bool %587 = OpLoad %580 
                                      bool_2 %591 = OpCompositeConstruct %587 %587 
                                       f32_2 %592 = OpSelect %591 %588 %589 
                                                      OpStore %329 %592 
                                Private f32* %593 = OpAccessChain %329 %39 
                                         f32 %594 = OpLoad %593 
                                Private f32* %595 = OpAccessChain %28 %30 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFMul %594 %596 
                                Private f32* %598 = OpAccessChain %28 %30 
                                                      OpStore %598 %597 
                                Private f32* %599 = OpAccessChain %28 %30 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpExtInst %1 10 %600 
                                Private f32* %602 = OpAccessChain %28 %30 
                                                      OpStore %602 %601 
                                Private f32* %603 = OpAccessChain %28 %30 
                                         f32 %604 = OpLoad %603 
                                Private f32* %605 = OpAccessChain %329 %30 
                                         f32 %606 = OpLoad %605 
                                         f32 %607 = OpFMul %604 %606 
                                Private f32* %608 = OpAccessChain %28 %30 
                                                      OpStore %608 %607 
                                  Input f32* %609 = OpAccessChain %11 %39 
                                         f32 %610 = OpLoad %609 
                                         f32 %611 = OpFMul %610 %14 
                                Private f32* %612 = OpAccessChain %28 %30 
                                         f32 %613 = OpLoad %612 
                                         f32 %614 = OpFNegate %613 
                                         f32 %615 = OpFAdd %611 %614 
                                Private f32* %616 = OpAccessChain %329 %30 
                                                      OpStore %616 %615 
                                  Input f32* %617 = OpAccessChain %89 %46 
                                         f32 %618 = OpLoad %617 
                                         f32 %619 = OpFMul %618 %15 
                                Private f32* %620 = OpAccessChain %28 %30 
                                         f32 %621 = OpLoad %620 
                                         f32 %622 = OpFAdd %619 %621 
                                Private f32* %623 = OpAccessChain %150 %30 
                                                      OpStore %623 %622 
                                  Input f32* %624 = OpAccessChain %89 %51 
                                         f32 %625 = OpLoad %624 
                                         f32 %626 = OpFMul %625 %93 
                                Private f32* %627 = OpAccessChain %28 %30 
                                                      OpStore %627 %626 
                                Private f32* %628 = OpAccessChain %329 %30 
                                         f32 %629 = OpLoad %628 
                                         f32 %630 = OpFMul %629 %42 
                                Private f32* %631 = OpAccessChain %28 %30 
                                         f32 %632 = OpLoad %631 
                                         f32 %633 = OpFAdd %630 %632 
                                Private f32* %634 = OpAccessChain %150 %39 
                                                      OpStore %634 %633 
                                       f32_4 %635 = OpLoad %150 
                                       f32_2 %636 = OpVectorShuffle %635 %635 0 1 
                                       f32_2 %637 = OpFAdd %636 %129 
                                       f32_4 %638 = OpLoad %28 
                                       f32_4 %639 = OpVectorShuffle %638 %637 4 5 2 3 
                                                      OpStore %28 %639 
                                       f32_4 %640 = OpLoad %28 
                                       f32_2 %641 = OpVectorShuffle %640 %640 0 1 
                              Uniform f32_4* %642 = OpAccessChain %140 %142 
                                       f32_4 %643 = OpLoad %642 
                                       f32_2 %644 = OpVectorShuffle %643 %643 0 1 
                                       f32_2 %645 = OpFMul %641 %644 
                                       f32_4 %646 = OpLoad %9 
                                       f32_4 %647 = OpVectorShuffle %646 %645 4 5 2 3 
                                                      OpStore %9 %647 
                                       f32_4 %649 = OpLoad %9 
                                                      OpStore vs_TEXCOORD3 %649 
                         read_only Texture2D %650 = OpLoad %173 
                                     sampler %651 = OpLoad %177 
                  read_only Texture2DSampled %652 = OpSampledImage %650 %651 
                                       f32_4 %653 = OpLoad %9 
                                       f32_2 %654 = OpVectorShuffle %653 %653 0 1 
                                       f32_4 %655 = OpImageSampleExplicitLod %652 %654 Lod %7 
                                                      OpStore %9 %655 
                                       f32_4 %657 = OpLoad %9 
                                                      OpStore vs_TEXCOORD4 %657 
                                 Output f32* %659 = OpAccessChain %430 %378 %39 
                                         f32 %660 = OpLoad %659 
                                         f32 %661 = OpFNegate %660 
                                 Output f32* %662 = OpAccessChain %430 %378 %39 
                                                      OpStore %662 %661 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 766
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %30 %33 %156 %304 %760 %762 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 BuiltIn TessLevelOuter 
                                                      OpDecorate vs_TEXCOORD0 Location 30 
                                                      OpDecorate vs_TEXCOORD4 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD4 Flat 
                                                      OpDecorate vs_TEXCOORD4 Location 33 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpMemberDecorate %85 0 Offset 85 
                                                      OpMemberDecorate %85 1 Offset 85 
                                                      OpMemberDecorate %85 2 Offset 85 
                                                      OpMemberDecorate %85 3 Offset 85 
                                                      OpDecorate %85 Block 
                                                      OpDecorate %87 DescriptorSet 87 
                                                      OpDecorate %87 Binding 87 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 156 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %173 DescriptorSet 173 
                                                      OpDecorate %173 Binding 173 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %177 DescriptorSet 177 
                                                      OpDecorate %177 Binding 177 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 DescriptorSet 193 
                                                      OpDecorate %193 Binding 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %206 DescriptorSet 206 
                                                      OpDecorate %206 Binding 206 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %208 DescriptorSet 208 
                                                      OpDecorate %208 Binding 208 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %288 DescriptorSet 288 
                                                      OpDecorate %288 Binding 288 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %290 DescriptorSet 290 
                                                      OpDecorate %290 Binding 290 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 304 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %350 DescriptorSet 350 
                                                      OpDecorate %350 Binding 350 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %352 DescriptorSet 352 
                                                      OpDecorate %352 Binding 352 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %365 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %683 RelaxedPrecision 
                                                      OpDecorate %684 RelaxedPrecision 
                                                      OpDecorate %688 RelaxedPrecision 
                                                      OpDecorate %689 RelaxedPrecision 
                                                      OpDecorate %691 RelaxedPrecision 
                                                      OpDecorate %694 RelaxedPrecision 
                                                      OpDecorate %695 RelaxedPrecision 
                                                      OpDecorate %698 RelaxedPrecision 
                                                      OpDecorate %702 RelaxedPrecision 
                                                      OpDecorate %704 RelaxedPrecision 
                                                      OpDecorate %709 RelaxedPrecision 
                                                      OpDecorate %710 RelaxedPrecision 
                                                      OpDecorate %714 RelaxedPrecision 
                                                      OpDecorate %715 RelaxedPrecision 
                                                      OpDecorate %716 RelaxedPrecision 
                                                      OpDecorate %717 RelaxedPrecision 
                                                      OpDecorate %718 RelaxedPrecision 
                                                      OpDecorate %719 RelaxedPrecision 
                                                      OpDecorate %726 RelaxedPrecision 
                                                      OpDecorate %734 RelaxedPrecision 
                                                      OpDecorate %735 RelaxedPrecision 
                                                      OpDecorate %739 RelaxedPrecision 
                                                      OpDecorate %740 RelaxedPrecision 
                                                      OpDecorate %741 RelaxedPrecision 
                                                      OpDecorate %742 RelaxedPrecision 
                                                      OpDecorate %745 RelaxedPrecision 
                                                      OpDecorate %746 RelaxedPrecision 
                                                      OpDecorate %750 RelaxedPrecision 
                                                      OpDecorate %751 RelaxedPrecision 
                                                      OpDecorate %752 RelaxedPrecision 
                                                      OpDecorate %753 RelaxedPrecision 
                                                      OpDecorate %760 RelaxedPrecision 
                                                      OpDecorate %760 Location 760 
                                                      OpDecorate %761 RelaxedPrecision 
                                                      OpDecorate %762 RelaxedPrecision 
                                                      OpDecorate %762 Location 762 
                                                      OpDecorate %763 RelaxedPrecision 
                                                      OpDecorate %764 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Function %7 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 3 
                                              %18 = OpTypePointer Input %6 
                                              %26 = OpTypeBool 
                                              %27 = OpTypeVector %26 4 
                                              %28 = OpTypePointer Private %27 
                              Private bool_4* %29 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
                                              %37 = OpTypeVector %26 2 
                                              %49 = OpTypePointer Private %7 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %51 = OpConstant 0 
                                              %52 = OpTypePointer Private %26 
                                          f32 %55 = OpConstant 3.674022E-40 
                                              %57 = OpTypePointer Private %6 
                                          u32 %59 = OpConstant 1 
                                          u32 %64 = OpConstant 2 
                                              %73 = OpTypeVector %6 2 
                                              %81 = OpTypePointer Private %37 
                              Private bool_2* %82 = OpVariable Private 
                                              %85 = OpTypeStruct %7 %7 %7 %7 
                                              %86 = OpTypePointer Uniform %85 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %87 = OpVariable Uniform 
                                              %88 = OpTypeInt 32 1 
                                          i32 %89 = OpConstant 3 
                                              %90 = OpTypePointer Uniform %7 
                                              %96 = OpTypePointer Private %73 
                               Private f32_2* %97 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                       f32_3 %137 = OpConstantComposite %15 %15 %136 
                                         i32 %146 = OpConstant 0 
                                         i32 %147 = OpConstant 1 
                                         i32 %149 = OpConstant -1 
                              Private f32_4* %155 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                Private f32* %165 = OpVariable Private 
                              Private f32_4* %170 = OpVariable Private 
                                             %171 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %172 = OpTypePointer UniformConstant %171 
        UniformConstant read_only Texture2D* %173 = OpVariable UniformConstant 
                                             %175 = OpTypeSampler 
                                             %176 = OpTypePointer UniformConstant %175 
                    UniformConstant sampler* %177 = OpVariable UniformConstant 
                                             %179 = OpTypeSampledImage %171 
                              Private f32_4* %191 = OpVariable Private 
                    UniformConstant sampler* %193 = OpVariable UniformConstant 
                              Private f32_2* %205 = OpVariable Private 
        UniformConstant read_only Texture2D* %206 = OpVariable UniformConstant 
                    UniformConstant sampler* %208 = OpVariable UniformConstant 
                                Private f32* %216 = OpVariable Private 
                              Private f32_2* %220 = OpVariable Private 
                                         f32 %233 = OpConstant 3.674022E-40 
                                         f32 %258 = OpConstant 3.674022E-40 
                                         f32 %260 = OpConstant 3.674022E-40 
                              Private f32_4* %283 = OpVariable Private 
                              Private f32_4* %287 = OpVariable Private 
        UniformConstant read_only Texture2D* %288 = OpVariable UniformConstant 
                    UniformConstant sampler* %290 = OpVariable UniformConstant 
                             Private bool_2* %302 = OpVariable Private 
                                             %303 = OpTypePointer Input %12 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                       f32_4 %307 = OpConstantComposite %15 %15 %55 %55 
                                             %322 = OpTypePointer Function %73 
                              Private f32_4* %334 = OpVariable Private 
                              Private f32_2* %340 = OpVariable Private 
                                         i32 %344 = OpConstant 2 
                              Private f32_4* %349 = OpVariable Private 
        UniformConstant read_only Texture2D* %350 = OpVariable UniformConstant 
                    UniformConstant sampler* %352 = OpVariable UniformConstant 
                                             %357 = OpTypeVector %26 3 
                                             %358 = OpTypePointer Private %357 
                             Private bool_3* %359 = OpVariable Private 
                              Private f32_2* %364 = OpVariable Private 
                                         f32 %367 = OpConstant 3.674022E-40 
                                       f32_2 %368 = OpConstantComposite %367 %367 
                                             %373 = OpTypePointer Private %12 
                              Private f32_3* %374 = OpVariable Private 
                                         f32 %382 = OpConstant 3.674022E-40 
                                       f32_2 %383 = OpConstantComposite %382 %382 
                              Private f32_2* %390 = OpVariable Private 
                                Private f32* %406 = OpVariable Private 
                                Private f32* %432 = OpVariable Private 
                               Private bool* %447 = OpVariable Private 
                                             %456 = OpTypePointer Function %6 
                               Private bool* %470 = OpVariable Private 
                                         f32 %471 = OpConstant 3.674022E-40 
                               Private bool* %476 = OpVariable Private 
                              Private f32_2* %493 = OpVariable Private 
                              Private f32_2* %517 = OpVariable Private 
                                         f32 %520 = OpConstant 3.674022E-40 
                                             %523 = OpTypePointer Private %88 
                                Private i32* %524 = OpVariable Private 
                               Private bool* %528 = OpVariable Private 
                              Private f32_3* %540 = OpVariable Private 
                                             %566 = OpTypeVector %88 4 
                                       i32_4 %568 = OpConstantComposite %147 %146 %344 %146 
                              Private f32_2* %577 = OpVariable Private 
                               Private bool* %593 = OpVariable Private 
                               Private bool* %625 = OpVariable Private 
                                Private f32* %630 = OpVariable Private 
                                             %671 = OpTypePointer Uniform %6 
                                       f32_2 %690 = OpConstantComposite %520 %520 
                                         f32 %696 = OpConstant 3.674022E-40 
                                       f32_2 %697 = OpConstantComposite %696 %696 
                                       f32_2 %703 = OpConstantComposite %233 %233 
                                             %759 = OpTypePointer Output %7 
                               Output f32_4* %760 = OpVariable Output 
                                Input f32_4* %762 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32_4* %9 = OpVariable Function 
                             Function f32_2* %323 = OpVariable Function 
                               Function f32* %457 = OpVariable Function 
                               Function f32* %486 = OpVariable Function 
                               Function f32* %495 = OpVariable Function 
                             Function f32_2* %507 = OpVariable Function 
                               Function f32* %542 = OpVariable Function 
                               Function f32* %555 = OpVariable Function 
                               Function f32* %580 = OpVariable Function 
                               Function f32* %606 = OpVariable Function 
                               Function f32* %635 = OpVariable Function 
                               Function f32* %650 = OpVariable Function 
                               Function f32* %661 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                                   Input f32* %19 = OpAccessChain %11 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFDiv %15 %20 
                                          f32 %22 = OpCompositeExtract %14 0 
                                          f32 %23 = OpCompositeExtract %14 1 
                                          f32 %24 = OpCompositeExtract %14 2 
                                        f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                                      OpStore %9 %25 
                                        f32_4 %31 = OpLoad vs_TEXCOORD0 
                                        f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                        f32_4 %34 = OpLoad vs_TEXCOORD4 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                                       bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                                       bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                                       bool_4 %39 = OpLoad %29 
                                       bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                                      OpStore %29 %40 
                                        f32_4 %41 = OpLoad vs_TEXCOORD4 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                        f32_4 %43 = OpLoad vs_TEXCOORD0 
                                        f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                                       bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                                       bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                                       bool_4 %47 = OpLoad %29 
                                       bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                                      OpStore %29 %48 
                                Private bool* %53 = OpAccessChain %29 %51 
                                         bool %54 = OpLoad %53 
                                          f32 %56 = OpSelect %54 %15 %55 
                                 Private f32* %58 = OpAccessChain %50 %51 
                                                      OpStore %58 %56 
                                Private bool* %60 = OpAccessChain %29 %59 
                                         bool %61 = OpLoad %60 
                                          f32 %62 = OpSelect %61 %15 %55 
                                 Private f32* %63 = OpAccessChain %50 %59 
                                                      OpStore %63 %62 
                                Private bool* %65 = OpAccessChain %29 %64 
                                         bool %66 = OpLoad %65 
                                          f32 %67 = OpSelect %66 %15 %55 
                                 Private f32* %68 = OpAccessChain %50 %64 
                                                      OpStore %68 %67 
                                Private bool* %69 = OpAccessChain %29 %17 
                                         bool %70 = OpLoad %69 
                                          f32 %71 = OpSelect %70 %15 %55 
                                 Private f32* %72 = OpAccessChain %50 %17 
                                                      OpStore %72 %71 
                                        f32_4 %74 = OpLoad %50 
                                        f32_2 %75 = OpVectorShuffle %74 %74 2 3 
                                        f32_4 %76 = OpLoad %50 
                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                        f32_2 %78 = OpFAdd %75 %77 
                                        f32_4 %79 = OpLoad %50 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 2 3 
                                                      OpStore %50 %80 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 1 0 1 
                               Uniform f32_4* %91 = OpAccessChain %87 %89 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpVectorShuffle %92 %92 0 1 0 1 
                                       bool_4 %94 = OpFOrdGreaterThanEqual %84 %93 
                                       bool_2 %95 = OpVectorShuffle %94 %94 0 1 
                                                      OpStore %82 %95 
                                Private bool* %98 = OpAccessChain %82 %51 
                                         bool %99 = OpLoad %98 
                                         f32 %100 = OpSelect %99 %15 %55 
                                Private f32* %101 = OpAccessChain %97 %51 
                                                      OpStore %101 %100 
                               Private bool* %102 = OpAccessChain %82 %59 
                                        bool %103 = OpLoad %102 
                                         f32 %104 = OpSelect %103 %15 %55 
                                Private f32* %105 = OpAccessChain %97 %59 
                                                      OpStore %105 %104 
                                       f32_2 %106 = OpLoad %97 
                                       f32_4 %107 = OpLoad %50 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %50 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                      OpStore %50 %111 
                              Uniform f32_4* %112 = OpAccessChain %87 %89 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpVectorShuffle %113 %113 2 3 2 3 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %115 0 1 0 1 
                                      bool_4 %117 = OpFOrdGreaterThanEqual %114 %116 
                                      bool_2 %118 = OpVectorShuffle %117 %117 0 1 
                                                      OpStore %82 %118 
                               Private bool* %119 = OpAccessChain %82 %51 
                                        bool %120 = OpLoad %119 
                                         f32 %121 = OpSelect %120 %15 %55 
                                Private f32* %122 = OpAccessChain %97 %51 
                                                      OpStore %122 %121 
                               Private bool* %123 = OpAccessChain %82 %59 
                                        bool %124 = OpLoad %123 
                                         f32 %125 = OpSelect %124 %15 %55 
                                Private f32* %126 = OpAccessChain %97 %59 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %97 
                                       f32_4 %128 = OpLoad %50 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %50 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %50 %132 
                                Private f32* %133 = OpAccessChain %50 %64 
                                                      OpStore %133 %15 
                                       f32_4 %134 = OpLoad %50 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                         f32 %138 = OpDot %135 %137 
                                Private f32* %139 = OpAccessChain %50 %51 
                                                      OpStore %139 %138 
                                Private f32* %140 = OpAccessChain %50 %51 
                                         f32 %141 = OpLoad %140 
                                        bool %142 = OpFOrdLessThan %141 %55 
                               Private bool* %143 = OpAccessChain %29 %51 
                                                      OpStore %143 %142 
                               Private bool* %144 = OpAccessChain %29 %51 
                                        bool %145 = OpLoad %144 
                                         i32 %148 = OpSelect %145 %147 %146 
                                         i32 %150 = OpIMul %148 %149 
                                        bool %151 = OpINotEqual %150 %146 
                                                      OpSelectionMerge %153 None 
                                                      OpBranchConditional %151 %152 %153 
                                             %152 = OpLabel 
                                                      OpKill
                                             %153 = OpLabel 
                                  Input f32* %157 = OpAccessChain vs_TEXCOORD1 %59 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                Private f32* %160 = OpAccessChain %155 %51 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %155 %51 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpExtInst %1 43 %162 %55 %15 
                                Private f32* %164 = OpAccessChain %155 %51 
                                                      OpStore %164 %163 
                                  Input f32* %166 = OpAccessChain vs_TEXCOORD1 %59 
                                         f32 %167 = OpLoad %166 
                                                      OpStore %165 %167 
                                         f32 %168 = OpLoad %165 
                                         f32 %169 = OpExtInst %1 43 %168 %55 %15 
                                                      OpStore %165 %169 
                         read_only Texture2D %174 = OpLoad %173 
                                     sampler %178 = OpLoad %177 
                  read_only Texture2DSampled %180 = OpSampledImage %174 %178 
                                       f32_4 %181 = OpLoad vs_TEXCOORD0 
                                       f32_2 %182 = OpVectorShuffle %181 %181 0 1 
                                       f32_4 %183 = OpImageSampleImplicitLod %180 %182 
                                                      OpStore %170 %183 
                                       f32_4 %184 = OpLoad %170 
                                       f32_4 %185 = OpLoad %155 
                                       f32_4 %186 = OpVectorShuffle %185 %185 0 0 0 0 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad vs_TEXCOORD1 
                                       f32_4 %189 = OpVectorShuffle %188 %188 3 3 3 3 
                                       f32_4 %190 = OpFAdd %187 %189 
                                                      OpStore %50 %190 
                         read_only Texture2D %192 = OpLoad %173 
                                     sampler %194 = OpLoad %193 
                  read_only Texture2DSampled %195 = OpSampledImage %192 %194 
                                       f32_4 %196 = OpLoad vs_TEXCOORD0 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_4 %198 = OpImageSampleImplicitLod %195 %197 
                                                      OpStore %191 %198 
                                       f32_4 %199 = OpLoad %191 
                                         f32 %200 = OpLoad %165 
                                       f32_4 %201 = OpCompositeConstruct %200 %200 %200 %200 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %50 
                                       f32_4 %204 = OpFAdd %202 %203 
                                                      OpStore %50 %204 
                         read_only Texture2D %207 = OpLoad %206 
                                     sampler %209 = OpLoad %208 
                  read_only Texture2DSampled %210 = OpSampledImage %207 %209 
                                       f32_4 %211 = OpLoad vs_TEXCOORD0 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                       f32_4 %213 = OpImageSampleImplicitLod %210 %212 
                                         f32 %214 = OpCompositeExtract %213 3 
                                Private f32* %215 = OpAccessChain %205 %51 
                                                      OpStore %215 %214 
                                Private f32* %217 = OpAccessChain %205 %51 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpDPdx %218 
                                                      OpStore %216 %219 
                                Private f32* %221 = OpAccessChain %205 %51 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpDPdy %222 
                                Private f32* %224 = OpAccessChain %220 %51 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %220 %51 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpExtInst %1 4 %226 
                                         f32 %228 = OpLoad %216 
                                         f32 %229 = OpExtInst %1 4 %228 
                                         f32 %230 = OpFAdd %227 %229 
                                                      OpStore %216 %230 
                                         f32 %231 = OpLoad %216 
                                         f32 %232 = OpFNegate %231 
                                         f32 %234 = OpFAdd %232 %233 
                                Private f32* %235 = OpAccessChain %220 %51 
                                                      OpStore %235 %234 
                                         f32 %236 = OpLoad %216 
                                         f32 %237 = OpFAdd %236 %233 
                                Private f32* %238 = OpAccessChain %205 %59 
                                                      OpStore %238 %237 
                                       f32_2 %239 = OpLoad %220 
                                       f32_2 %240 = OpVectorShuffle %239 %239 0 0 
                                       f32_2 %241 = OpFNegate %240 
                                       f32_2 %242 = OpLoad %205 
                                       f32_2 %243 = OpFAdd %241 %242 
                                                      OpStore %205 %243 
                                Private f32* %244 = OpAccessChain %205 %59 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFDiv %15 %245 
                                                      OpStore %216 %246 
                                         f32 %247 = OpLoad %216 
                                Private f32* %248 = OpAccessChain %205 %51 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFMul %247 %249 
                                Private f32* %251 = OpAccessChain %205 %51 
                                                      OpStore %251 %250 
                                Private f32* %252 = OpAccessChain %205 %51 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 43 %253 %55 %15 
                                Private f32* %255 = OpAccessChain %205 %51 
                                                      OpStore %255 %254 
                                Private f32* %256 = OpAccessChain %205 %51 
                                         f32 %257 = OpLoad %256 
                                         f32 %259 = OpFMul %257 %258 
                                         f32 %261 = OpFAdd %259 %260 
                                                      OpStore %216 %261 
                                Private f32* %262 = OpAccessChain %205 %51 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %205 %51 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFMul %263 %265 
                                Private f32* %267 = OpAccessChain %205 %51 
                                                      OpStore %267 %266 
                                Private f32* %268 = OpAccessChain %205 %51 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpLoad %216 
                                         f32 %271 = OpFMul %269 %270 
                                Private f32* %272 = OpAccessChain %205 %51 
                                                      OpStore %272 %271 
                                       f32_4 %273 = OpLoad vs_TEXCOORD1 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 0 0 
                                       f32_4 %275 = OpLoad %155 
                                       f32_4 %276 = OpVectorShuffle %275 %274 4 5 6 3 
                                                      OpStore %155 %276 
                                Private f32* %277 = OpAccessChain %205 %51 
                                         f32 %278 = OpLoad %277 
                                  Input f32* %279 = OpAccessChain vs_TEXCOORD1 %51 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFMul %278 %280 
                                Private f32* %282 = OpAccessChain %155 %17 
                                                      OpStore %282 %281 
                                       f32_4 %284 = OpLoad %50 
                                       f32_4 %285 = OpLoad %155 
                                       f32_4 %286 = OpFAdd %284 %285 
                                                      OpStore %283 %286 
                         read_only Texture2D %289 = OpLoad %288 
                                     sampler %291 = OpLoad %290 
                  read_only Texture2DSampled %292 = OpSampledImage %289 %291 
                                       f32_4 %293 = OpLoad vs_TEXCOORD0 
                                       f32_2 %294 = OpVectorShuffle %293 %293 0 1 
                                       f32_4 %295 = OpImageSampleImplicitLod %292 %294 
                                                      OpStore %287 %295 
                                       f32_4 %296 = OpLoad %287 
                                       f32_4 %297 = OpLoad vs_TEXCOORD1 
                                       f32_4 %298 = OpVectorShuffle %297 %297 2 2 2 2 
                                       f32_4 %299 = OpFMul %296 %298 
                                       f32_4 %300 = OpLoad %283 
                                       f32_4 %301 = OpFAdd %299 %300 
                                                      OpStore %50 %301 
                                       f32_3 %305 = OpLoad vs_TEXCOORD2 
                                       f32_4 %306 = OpVectorShuffle %305 %305 0 1 0 0 
                                      bool_4 %308 = OpFOrdEqual %306 %307 
                                      bool_2 %309 = OpVectorShuffle %308 %308 0 1 
                                                      OpStore %302 %309 
                               Private bool* %310 = OpAccessChain %302 %59 
                                        bool %311 = OpLoad %310 
                               Private bool* %312 = OpAccessChain %302 %51 
                                        bool %313 = OpLoad %312 
                                        bool %314 = OpLogicalOr %311 %313 
                               Private bool* %315 = OpAccessChain %302 %51 
                                                      OpStore %315 %314 
                               Private bool* %316 = OpAccessChain %302 %51 
                                        bool %317 = OpLoad %316 
                                                      OpSelectionMerge %319 None 
                                                      OpBranchConditional %317 %318 %757 
                                             %318 = OpLabel 
                               Private bool* %320 = OpAccessChain %302 %59 
                                        bool %321 = OpLoad %320 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %321 %324 %329 
                                             %324 = OpLabel 
                              Uniform f32_4* %326 = OpAccessChain %87 %147 
                                       f32_4 %327 = OpLoad %326 
                                       f32_2 %328 = OpVectorShuffle %327 %327 0 1 
                                                      OpStore %323 %328 
                                                      OpBranch %325 
                                             %329 = OpLabel 
                              Uniform f32_4* %330 = OpAccessChain %87 %146 
                                       f32_4 %331 = OpLoad %330 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                                      OpStore %323 %332 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                       f32_2 %333 = OpLoad %323 
                                                      OpStore %205 %333 
                                  Input f32* %335 = OpAccessChain vs_TEXCOORD2 %64 
                                         f32 %336 = OpLoad %335 
                                         f32 %337 = OpFAdd %336 %233 
                                Private f32* %338 = OpAccessChain %334 %59 
                                                      OpStore %338 %337 
                                Private f32* %339 = OpAccessChain %334 %51 
                                                      OpStore %339 %233 
                                Private f32* %341 = OpAccessChain %340 %59 
                                                      OpStore %341 %55 
                                       f32_4 %342 = OpLoad %334 
                                       f32_2 %343 = OpVectorShuffle %342 %342 0 1 
                              Uniform f32_4* %345 = OpAccessChain %87 %344 
                                       f32_4 %346 = OpLoad %345 
                                       f32_2 %347 = OpVectorShuffle %346 %346 0 1 
                                       f32_2 %348 = OpFMul %343 %347 
                                                      OpStore %220 %348 
                         read_only Texture2D %351 = OpLoad %350 
                                     sampler %353 = OpLoad %352 
                  read_only Texture2DSampled %354 = OpSampledImage %351 %353 
                                       f32_2 %355 = OpLoad %220 
                                       f32_4 %356 = OpImageSampleImplicitLod %354 %355 
                                                      OpStore %349 %356 
                                Private f32* %360 = OpAccessChain %349 %51 
                                         f32 %361 = OpLoad %360 
                                        bool %362 = OpFOrdLessThan %55 %361 
                               Private bool* %363 = OpAccessChain %359 %51 
                                                      OpStore %363 %362 
                                       f32_4 %365 = OpLoad %349 
                                       f32_2 %366 = OpVectorShuffle %365 %365 2 3 
                                       f32_2 %369 = OpFAdd %366 %368 
                                                      OpStore %364 %369 
                                       f32_2 %370 = OpLoad %364 
                                       f32_2 %371 = OpLoad %364 
                                       f32_2 %372 = OpFAdd %370 %371 
                                                      OpStore %364 %372 
                                       f32_4 %375 = OpLoad vs_TEXCOORD0 
                                       f32_2 %376 = OpVectorShuffle %375 %375 0 1 
                                       f32_2 %377 = OpFAdd %376 %368 
                                       f32_3 %378 = OpLoad %374 
                                       f32_3 %379 = OpVectorShuffle %378 %377 3 4 2 
                                                      OpStore %374 %379 
                                       f32_3 %380 = OpLoad %374 
                                       f32_2 %381 = OpVectorShuffle %380 %380 0 1 
                                       f32_2 %384 = OpFMul %381 %383 
                                       f32_2 %385 = OpLoad %364 
                                       f32_2 %386 = OpFNegate %385 
                                       f32_2 %387 = OpFAdd %384 %386 
                                       f32_3 %388 = OpLoad %374 
                                       f32_3 %389 = OpVectorShuffle %388 %387 3 4 2 
                                                      OpStore %374 %389 
                                       f32_3 %391 = OpLoad %374 
                                       f32_2 %392 = OpVectorShuffle %391 %391 0 1 
                                       f32_3 %393 = OpLoad %374 
                                       f32_2 %394 = OpVectorShuffle %393 %393 0 1 
                                         f32 %395 = OpDot %392 %394 
                                Private f32* %396 = OpAccessChain %390 %51 
                                                      OpStore %396 %395 
                                Private f32* %397 = OpAccessChain %390 %51 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpExtInst %1 32 %398 
                                Private f32* %400 = OpAccessChain %390 %51 
                                                      OpStore %400 %399 
                                       f32_2 %401 = OpLoad %390 
                                       f32_2 %402 = OpVectorShuffle %401 %401 0 0 
                                       f32_3 %403 = OpLoad %374 
                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
                                       f32_2 %405 = OpFMul %402 %404 
                                                      OpStore %390 %405 
                                       f32_2 %407 = OpLoad %364 
                                       f32_2 %408 = OpFNegate %407 
                                       f32_2 %409 = OpLoad %390 
                                         f32 %410 = OpDot %408 %409 
                                                      OpStore %406 %410 
                                       f32_2 %411 = OpLoad %364 
                                       f32_2 %412 = OpLoad %364 
                                         f32 %413 = OpDot %411 %412 
                                Private f32* %414 = OpAccessChain %364 %51 
                                                      OpStore %414 %413 
                                         f32 %415 = OpLoad %406 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpLoad %406 
                                         f32 %418 = OpFMul %416 %417 
                                Private f32* %419 = OpAccessChain %364 %51 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpFAdd %418 %420 
                                Private f32* %422 = OpAccessChain %364 %51 
                                                      OpStore %422 %421 
                                Private f32* %423 = OpAccessChain %364 %51 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFNegate %424 
                                         f32 %426 = OpFAdd %425 %15 
                                Private f32* %427 = OpAccessChain %364 %51 
                                                      OpStore %427 %426 
                                Private f32* %428 = OpAccessChain %364 %51 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpExtInst %1 31 %429 
                                Private f32* %431 = OpAccessChain %364 %51 
                                                      OpStore %431 %430 
                                Private f32* %433 = OpAccessChain %364 %51 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFNegate %434 
                                         f32 %436 = OpLoad %406 
                                         f32 %437 = OpFAdd %435 %436 
                                                      OpStore %432 %437 
                                Private f32* %438 = OpAccessChain %364 %51 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpLoad %406 
                                         f32 %441 = OpFAdd %439 %440 
                                Private f32* %442 = OpAccessChain %364 %51 
                                                      OpStore %442 %441 
                                Private f32* %443 = OpAccessChain %364 %51 
                                         f32 %444 = OpLoad %443 
                                         f32 %445 = OpLoad %432 
                                         f32 %446 = OpExtInst %1 37 %444 %445 
                                                      OpStore %406 %446 
                                         f32 %448 = OpLoad %406 
                                        bool %449 = OpFOrdLessThan %448 %55 
                                                      OpStore %447 %449 
                                Private f32* %450 = OpAccessChain %364 %51 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpLoad %432 
                                         f32 %453 = OpExtInst %1 40 %451 %452 
                                Private f32* %454 = OpAccessChain %364 %51 
                                                      OpStore %454 %453 
                                        bool %455 = OpLoad %447 
                                                      OpSelectionMerge %459 None 
                                                      OpBranchConditional %455 %458 %462 
                                             %458 = OpLabel 
                                Private f32* %460 = OpAccessChain %364 %51 
                                         f32 %461 = OpLoad %460 
                                                      OpStore %457 %461 
                                                      OpBranch %459 
                                             %462 = OpLabel 
                                         f32 %463 = OpLoad %406 
                                                      OpStore %457 %463 
                                                      OpBranch %459 
                                             %459 = OpLabel 
                                         f32 %464 = OpLoad %457 
                                Private f32* %465 = OpAccessChain %364 %51 
                                                      OpStore %465 %464 
                                       f32_2 %466 = OpLoad %364 
                                       f32_2 %467 = OpVectorShuffle %466 %466 0 0 
                                       f32_2 %468 = OpLoad %390 
                                       f32_2 %469 = OpFMul %467 %468 
                                                      OpStore %364 %469 
                                Private f32* %472 = OpAccessChain %364 %51 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpExtInst %1 4 %473 
                                        bool %475 = OpFOrdGreaterThanEqual %471 %474 
                                                      OpStore %470 %475 
                                Private f32* %477 = OpAccessChain %364 %59 
                                         f32 %478 = OpLoad %477 
                                         f32 %479 = OpExtInst %1 4 %478 
                                        bool %480 = OpFOrdLessThan %471 %479 
                                                      OpStore %476 %480 
                                       f32_3 %481 = OpLoad %374 
                                       f32_2 %482 = OpVectorShuffle %481 %481 0 1 
                                       f32_2 %483 = OpLoad %364 
                                       f32_2 %484 = OpFDiv %482 %483 
                                                      OpStore %364 %484 
                                        bool %485 = OpLoad %476 
                                                      OpSelectionMerge %488 None 
                                                      OpBranchConditional %485 %487 %491 
                                             %487 = OpLabel 
                                Private f32* %489 = OpAccessChain %364 %59 
                                         f32 %490 = OpLoad %489 
                                                      OpStore %486 %490 
                                                      OpBranch %488 
                                             %491 = OpLabel 
                                                      OpStore %486 %55 
                                                      OpBranch %488 
                                             %488 = OpLabel 
                                         f32 %492 = OpLoad %486 
                                                      OpStore %432 %492 
                                        bool %494 = OpLoad %470 
                                                      OpSelectionMerge %497 None 
                                                      OpBranchConditional %494 %496 %499 
                                             %496 = OpLabel 
                                         f32 %498 = OpLoad %432 
                                                      OpStore %495 %498 
                                                      OpBranch %497 
                                             %499 = OpLabel 
                                Private f32* %500 = OpAccessChain %364 %51 
                                         f32 %501 = OpLoad %500 
                                                      OpStore %495 %501 
                                                      OpBranch %497 
                                             %497 = OpLabel 
                                         f32 %502 = OpLoad %495 
                                Private f32* %503 = OpAccessChain %493 %51 
                                                      OpStore %503 %502 
                                Private f32* %504 = OpAccessChain %493 %59 
                                                      OpStore %504 %55 
                               Private bool* %505 = OpAccessChain %359 %51 
                                        bool %506 = OpLoad %505 
                                                      OpSelectionMerge %509 None 
                                                      OpBranchConditional %506 %508 %511 
                                             %508 = OpLabel 
                                       f32_2 %510 = OpLoad %493 
                                                      OpStore %507 %510 
                                                      OpBranch %509 
                                             %511 = OpLabel 
                                       f32_4 %512 = OpLoad vs_TEXCOORD0 
                                       f32_2 %513 = OpVectorShuffle %512 %512 0 1 
                                                      OpStore %507 %513 
                                                      OpBranch %509 
                                             %509 = OpLabel 
                                       f32_2 %514 = OpLoad %507 
                                       f32_3 %515 = OpLoad %374 
                                       f32_3 %516 = OpVectorShuffle %515 %514 0 3 4 
                                                      OpStore %374 %516 
                                Private f32* %518 = OpAccessChain %349 %59 
                                         f32 %519 = OpLoad %518 
                                         f32 %521 = OpFMul %519 %520 
                                Private f32* %522 = OpAccessChain %517 %51 
                                                      OpStore %522 %521 
                                Private f32* %525 = OpAccessChain %517 %51 
                                         f32 %526 = OpLoad %525 
                                         i32 %527 = OpConvertFToS %526 
                                                      OpStore %524 %527 
                                Private f32* %529 = OpAccessChain %374 %59 
                                         f32 %530 = OpLoad %529 
                                Private f32* %531 = OpAccessChain %374 %59 
                                         f32 %532 = OpLoad %531 
                                         f32 %533 = OpFNegate %532 
                                        bool %534 = OpFOrdGreaterThanEqual %530 %533 
                                                      OpStore %528 %534 
                                Private f32* %535 = OpAccessChain %374 %59 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpExtInst %1 4 %536 
                                         f32 %538 = OpExtInst %1 10 %537 
                                Private f32* %539 = OpAccessChain %364 %51 
                                                      OpStore %539 %538 
                                        bool %541 = OpLoad %528 
                                                      OpSelectionMerge %544 None 
                                                      OpBranchConditional %541 %543 %547 
                                             %543 = OpLabel 
                                Private f32* %545 = OpAccessChain %364 %51 
                                         f32 %546 = OpLoad %545 
                                                      OpStore %542 %546 
                                                      OpBranch %544 
                                             %547 = OpLabel 
                                Private f32* %548 = OpAccessChain %364 %51 
                                         f32 %549 = OpLoad %548 
                                         f32 %550 = OpFNegate %549 
                                                      OpStore %542 %550 
                                                      OpBranch %544 
                                             %544 = OpLabel 
                                         f32 %551 = OpLoad %542 
                                Private f32* %552 = OpAccessChain %540 %51 
                                                      OpStore %552 %551 
                                         i32 %553 = OpLoad %524 
                                        bool %554 = OpINotEqual %553 %146 
                                                      OpSelectionMerge %557 None 
                                                      OpBranchConditional %554 %556 %560 
                                             %556 = OpLabel 
                                Private f32* %558 = OpAccessChain %374 %59 
                                         f32 %559 = OpLoad %558 
                                                      OpStore %555 %559 
                                                      OpBranch %557 
                                             %560 = OpLabel 
                                Private f32* %561 = OpAccessChain %540 %51 
                                         f32 %562 = OpLoad %561 
                                                      OpStore %555 %562 
                                                      OpBranch %557 
                                             %557 = OpLabel 
                                         f32 %563 = OpLoad %555 
                                Private f32* %564 = OpAccessChain %540 %51 
                                                      OpStore %564 %563 
                                         i32 %565 = OpLoad %524 
                                       i32_4 %567 = OpCompositeConstruct %565 %565 %565 %565 
                                      bool_4 %569 = OpIEqual %567 %568 
                                      bool_2 %570 = OpVectorShuffle %569 %569 0 2 
                                      bool_3 %571 = OpLoad %359 
                                      bool_3 %572 = OpVectorShuffle %571 %570 3 1 4 
                                                      OpStore %359 %572 
                                Private f32* %573 = OpAccessChain %540 %51 
                                         f32 %574 = OpLoad %573 
                                                      OpStore %432 %574 
                                         f32 %575 = OpLoad %432 
                                         f32 %576 = OpExtInst %1 43 %575 %55 %15 
                                                      OpStore %432 %576 
                               Private bool* %578 = OpAccessChain %359 %51 
                                        bool %579 = OpLoad %578 
                                                      OpSelectionMerge %582 None 
                                                      OpBranchConditional %579 %581 %584 
                                             %581 = OpLabel 
                                         f32 %583 = OpLoad %432 
                                                      OpStore %580 %583 
                                                      OpBranch %582 
                                             %584 = OpLabel 
                                Private f32* %585 = OpAccessChain %540 %51 
                                         f32 %586 = OpLoad %585 
                                                      OpStore %580 %586 
                                                      OpBranch %582 
                                             %582 = OpLabel 
                                         f32 %587 = OpLoad %580 
                                Private f32* %588 = OpAccessChain %577 %51 
                                                      OpStore %588 %587 
                                Private f32* %589 = OpAccessChain %577 %51 
                                         f32 %590 = OpLoad %589 
                                         f32 %591 = OpFMul %590 %233 
                                Private f32* %592 = OpAccessChain %540 %51 
                                                      OpStore %592 %591 
                                Private f32* %594 = OpAccessChain %540 %51 
                                         f32 %595 = OpLoad %594 
                                Private f32* %596 = OpAccessChain %540 %51 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpFNegate %597 
                                        bool %599 = OpFOrdGreaterThanEqual %595 %598 
                                                      OpStore %593 %599 
                                Private f32* %600 = OpAccessChain %540 %51 
                                         f32 %601 = OpLoad %600 
                                         f32 %602 = OpExtInst %1 4 %601 
                                         f32 %603 = OpExtInst %1 10 %602 
                                Private f32* %604 = OpAccessChain %540 %51 
                                                      OpStore %604 %603 
                                        bool %605 = OpLoad %593 
                                                      OpSelectionMerge %608 None 
                                                      OpBranchConditional %605 %607 %611 
                                             %607 = OpLabel 
                                Private f32* %609 = OpAccessChain %540 %51 
                                         f32 %610 = OpLoad %609 
                                                      OpStore %606 %610 
                                                      OpBranch %608 
                                             %611 = OpLabel 
                                Private f32* %612 = OpAccessChain %540 %51 
                                         f32 %613 = OpLoad %612 
                                         f32 %614 = OpFNegate %613 
                                                      OpStore %606 %614 
                                                      OpBranch %608 
                                             %608 = OpLabel 
                                         f32 %615 = OpLoad %606 
                                Private f32* %616 = OpAccessChain %540 %51 
                                                      OpStore %616 %615 
                                Private f32* %617 = OpAccessChain %540 %51 
                                         f32 %618 = OpLoad %617 
                                Private f32* %619 = OpAccessChain %540 %51 
                                         f32 %620 = OpLoad %619 
                                         f32 %621 = OpFAdd %618 %620 
                                                      OpStore %432 %621 
                                Private f32* %622 = OpAccessChain %540 %51 
                                         f32 %623 = OpLoad %622 
                                        bool %624 = OpFOrdLessThan %233 %623 
                                                      OpStore %528 %624 
                                         f32 %626 = OpLoad %432 
                                         f32 %627 = OpLoad %432 
                                         f32 %628 = OpFNegate %627 
                                        bool %629 = OpFOrdGreaterThanEqual %626 %628 
                                                      OpStore %625 %629 
                                         f32 %631 = OpLoad %432 
                                         f32 %632 = OpExtInst %1 4 %631 
                                         f32 %633 = OpExtInst %1 10 %632 
                                                      OpStore %630 %633 
                                        bool %634 = OpLoad %625 
                                                      OpSelectionMerge %637 None 
                                                      OpBranchConditional %634 %636 %639 
                                             %636 = OpLabel 
                                         f32 %638 = OpLoad %630 
                                                      OpStore %635 %638 
                                                      OpBranch %637 
                                             %639 = OpLabel 
                                         f32 %640 = OpLoad %630 
                                         f32 %641 = OpFNegate %640 
                                                      OpStore %635 %641 
                                                      OpBranch %637 
                                             %637 = OpLabel 
                                         f32 %642 = OpLoad %635 
                                Private f32* %643 = OpAccessChain %493 %51 
                                                      OpStore %643 %642 
                                Private f32* %644 = OpAccessChain %493 %51 
                                         f32 %645 = OpLoad %644 
                                         f32 %646 = OpFNegate %645 
                                         f32 %647 = OpFAdd %646 %15 
                                Private f32* %648 = OpAccessChain %493 %51 
                                                      OpStore %648 %647 
                                        bool %649 = OpLoad %528 
                                                      OpSelectionMerge %652 None 
                                                      OpBranchConditional %649 %651 %655 
                                             %651 = OpLabel 
                                Private f32* %653 = OpAccessChain %493 %51 
                                         f32 %654 = OpLoad %653 
                                                      OpStore %650 %654 
                                                      OpBranch %652 
                                             %655 = OpLabel 
                                         f32 %656 = OpLoad %432 
                                                      OpStore %650 %656 
                                                      OpBranch %652 
                                             %652 = OpLabel 
                                         f32 %657 = OpLoad %650 
                                Private f32* %658 = OpAccessChain %540 %51 
                                                      OpStore %658 %657 
                               Private bool* %659 = OpAccessChain %359 %64 
                                        bool %660 = OpLoad %659 
                                                      OpSelectionMerge %663 None 
                                                      OpBranchConditional %660 %662 %666 
                                             %662 = OpLabel 
                                Private f32* %664 = OpAccessChain %540 %51 
                                         f32 %665 = OpLoad %664 
                                                      OpStore %661 %665 
                                                      OpBranch %663 
                                             %666 = OpLabel 
                                Private f32* %667 = OpAccessChain %577 %51 
                                         f32 %668 = OpLoad %667 
                                                      OpStore %661 %668 
                                                      OpBranch %663 
                                             %663 = OpLabel 
                                         f32 %669 = OpLoad %661 
                                Private f32* %670 = OpAccessChain %374 %51 
                                                      OpStore %670 %669 
                                Uniform f32* %672 = OpAccessChain %87 %344 %51 
                                         f32 %673 = OpLoad %672 
                                Private f32* %674 = OpAccessChain %340 %51 
                                                      OpStore %674 %673 
                                       f32_4 %675 = OpLoad %334 
                                       f32_2 %676 = OpVectorShuffle %675 %675 0 1 
                              Uniform f32_4* %677 = OpAccessChain %87 %344 
                                       f32_4 %678 = OpLoad %677 
                                       f32_2 %679 = OpVectorShuffle %678 %678 0 1 
                                       f32_2 %680 = OpFMul %676 %679 
                                       f32_2 %681 = OpLoad %340 
                                       f32_2 %682 = OpFAdd %680 %681 
                                                      OpStore %577 %682 
                         read_only Texture2D %683 = OpLoad %350 
                                     sampler %684 = OpLoad %352 
                  read_only Texture2DSampled %685 = OpSampledImage %683 %684 
                                       f32_2 %686 = OpLoad %577 
                                       f32_4 %687 = OpImageSampleImplicitLod %685 %686 
                                                      OpStore %349 %687 
                                       f32_4 %688 = OpLoad %349 
                                       f32_2 %689 = OpVectorShuffle %688 %688 1 3 
                                       f32_2 %691 = OpFMul %689 %690 
                                       f32_3 %692 = OpLoad %540 
                                       f32_3 %693 = OpVectorShuffle %692 %691 3 1 4 
                                                      OpStore %540 %693 
                                       f32_4 %694 = OpLoad %349 
                                       f32_2 %695 = OpVectorShuffle %694 %694 0 2 
                                       f32_2 %698 = OpFMul %695 %697 
                                       f32_3 %699 = OpLoad %540 
                                       f32_2 %700 = OpVectorShuffle %699 %699 0 2 
                                       f32_2 %701 = OpFAdd %698 %700 
                                                      OpStore %517 %701 
                                       f32_2 %702 = OpLoad %517 
                                       f32_2 %704 = OpFAdd %702 %703 
                                                      OpStore %577 %704 
                                       f32_2 %705 = OpLoad %340 
                                       f32_2 %706 = OpFMul %705 %383 
                                       f32_2 %707 = OpLoad %220 
                                       f32_2 %708 = OpFAdd %706 %707 
                                                      OpStore %220 %708 
                         read_only Texture2D %709 = OpLoad %350 
                                     sampler %710 = OpLoad %352 
                  read_only Texture2DSampled %711 = OpSampledImage %709 %710 
                                       f32_2 %712 = OpLoad %220 
                                       f32_4 %713 = OpImageSampleImplicitLod %711 %712 
                                                      OpStore %287 %713 
                                       f32_4 %714 = OpLoad %287 
                                       f32_2 %715 = OpVectorShuffle %714 %714 1 3 
                                       f32_2 %716 = OpFMul %715 %690 
                                                      OpStore %220 %716 
                                       f32_4 %717 = OpLoad %287 
                                       f32_2 %718 = OpVectorShuffle %717 %717 0 2 
                                       f32_2 %719 = OpFMul %718 %697 
                                       f32_2 %720 = OpLoad %220 
                                       f32_2 %721 = OpFAdd %719 %720 
                                                      OpStore %517 %721 
                                       f32_2 %722 = OpLoad %205 
                                       f32_2 %723 = OpLoad %577 
                                       f32_2 %724 = OpFMul %722 %723 
                                                      OpStore %220 %724 
                                       f32_2 %725 = OpLoad %205 
                                       f32_2 %726 = OpLoad %517 
                                       f32_2 %727 = OpFMul %725 %726 
                                                      OpStore %205 %727 
                                       f32_3 %728 = OpLoad %374 
                                       f32_2 %729 = OpVectorShuffle %728 %728 0 2 
                                       f32_2 %730 = OpLoad %205 
                                       f32_2 %731 = OpFMul %729 %730 
                                       f32_2 %732 = OpLoad %220 
                                       f32_2 %733 = OpFAdd %731 %732 
                                                      OpStore %205 %733 
                         read_only Texture2D %734 = OpLoad %173 
                                     sampler %735 = OpLoad %193 
                  read_only Texture2DSampled %736 = OpSampledImage %734 %735 
                                       f32_2 %737 = OpLoad %205 
                                       f32_4 %738 = OpImageSampleImplicitLod %736 %737 
                                                      OpStore %287 %738 
                                       f32_4 %739 = OpLoad %287 
                                       f32_3 %740 = OpLoad vs_TEXCOORD2 
                                       f32_4 %741 = OpVectorShuffle %740 %740 0 0 0 0 
                                       f32_4 %742 = OpFMul %739 %741 
                                       f32_4 %743 = OpLoad %50 
                                       f32_4 %744 = OpFAdd %742 %743 
                                                      OpStore %334 %744 
                         read_only Texture2D %745 = OpLoad %288 
                                     sampler %746 = OpLoad %290 
                  read_only Texture2DSampled %747 = OpSampledImage %745 %746 
                                       f32_2 %748 = OpLoad %205 
                                       f32_4 %749 = OpImageSampleImplicitLod %747 %748 
                                                      OpStore %191 %749 
                                       f32_4 %750 = OpLoad %191 
                                       f32_3 %751 = OpLoad vs_TEXCOORD2 
                                       f32_4 %752 = OpVectorShuffle %751 %751 1 1 1 1 
                                       f32_4 %753 = OpFMul %750 %752 
                                       f32_4 %754 = OpLoad %334 
                                       f32_4 %755 = OpFAdd %753 %754 
                                                      OpStore %334 %755 
                                       f32_4 %756 = OpLoad %334 
                                                      OpStore %155 %756 
                                                      OpBranch %319 
                                             %757 = OpLabel 
                                       f32_4 %758 = OpLoad %50 
                                                      OpStore %155 %758 
                                                      OpBranch %319 
                                             %319 = OpLabel 
                                       f32_4 %761 = OpLoad %155 
                                       f32_4 %763 = OpLoad %762 
                                       f32_4 %764 = OpFMul %761 %763 
                                                      OpStore %760 %764 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 664
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %89 %100 %186 %211 %391 %430 %449 %458 %563 %572 %648 %656 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %89 Location 89 
                                                      OpDecorate %100 Location 100 
                                                      OpDecorate %136 ArrayStride 136 
                                                      OpDecorate %137 ArrayStride 137 
                                                      OpMemberDecorate %138 0 Offset 138 
                                                      OpMemberDecorate %138 1 Offset 138 
                                                      OpMemberDecorate %138 2 Offset 138 
                                                      OpMemberDecorate %138 3 Offset 138 
                                                      OpMemberDecorate %138 4 Offset 138 
                                                      OpMemberDecorate %138 5 Offset 138 
                                                      OpDecorate %138 Block 
                                                      OpDecorate %140 DescriptorSet 140 
                                                      OpDecorate %140 Binding 140 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %173 DescriptorSet 173 
                                                      OpDecorate %173 Binding 173 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %177 DescriptorSet 177 
                                                      OpDecorate %177 Binding 177 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %186 Location 186 
                                                      OpDecorate %196 RelaxedPrecision 
                                                      OpDecorate %197 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %211 Location 211 
                                                      OpDecorate vs_TEXCOORD0 Location 391 
                                                      OpMemberDecorate %428 0 BuiltIn 428 
                                                      OpMemberDecorate %428 1 BuiltIn 428 
                                                      OpMemberDecorate %428 2 BuiltIn 428 
                                                      OpDecorate %428 Block 
                                                      OpDecorate %439 RelaxedPrecision 
                                                      OpDecorate %440 RelaxedPrecision 
                                                      OpDecorate %449 Location 449 
                                                      OpDecorate %458 RelaxedPrecision 
                                                      OpDecorate %458 Location 458 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 563 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 572 
                                                      OpDecorate vs_TEXCOORD3 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD3 Location 648 
                                                      OpDecorate %650 RelaxedPrecision 
                                                      OpDecorate %651 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD4 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD4 Flat 
                                                      OpDecorate vs_TEXCOORD4 Location 656 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                          f32 %14 = OpConstant 3.674022E-40 
                                          f32 %15 = OpConstant 3.674022E-40 
                                        f32_4 %16 = OpConstantComposite %14 %15 %14 %15 
                                              %18 = OpTypeBool 
                                              %19 = OpTypeVector %18 4 
                                              %20 = OpTypePointer Private %19 
                              Private bool_4* %21 = OpVariable Private 
                               Private f32_4* %28 = OpVariable Private 
                                              %29 = OpTypeInt 32 0 
                                          u32 %30 = OpConstant 0 
                                              %31 = OpTypePointer Private %18 
                                          f32 %34 = OpConstant 3.674022E-40 
                                          f32 %35 = OpConstant 3.674022E-40 
                                              %37 = OpTypePointer Private %6 
                                          u32 %39 = OpConstant 1 
                                          f32 %42 = OpConstant 3.674022E-40 
                                          f32 %43 = OpConstant 3.674022E-40 
                                          u32 %46 = OpConstant 2 
                                          u32 %51 = OpConstant 3 
                                              %56 = OpTypeVector %6 2 
                                              %76 = OpTypePointer Private %56 
                               Private f32_2* %77 = OpVariable Private 
                                        f32_2 %80 = OpConstantComposite %14 %14 
                                        f32_2 %87 = OpConstantComposite %42 %42 
                                 Input f32_4* %89 = OpVariable Input 
                                              %90 = OpTypePointer Input %6 
                                          f32 %93 = OpConstant 3.674022E-40 
                               Private f32_2* %99 = OpVariable Private 
                                Input f32_4* %100 = OpVariable Input 
                                         f32 %110 = OpConstant 3.674022E-40 
                                         f32 %128 = OpConstant 3.674022E-40 
                                       f32_2 %129 = OpConstantComposite %128 %128 
                                         u32 %135 = OpConstant 4 
                                             %136 = OpTypeArray %7 %135 
                                             %137 = OpTypeArray %7 %135 
                                             %138 = OpTypeStruct %136 %137 %7 %7 %7 %7 
                                             %139 = OpTypePointer Uniform %138 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4;}* %140 = OpVariable Uniform 
                                             %141 = OpTypeInt 32 1 
                                         i32 %142 = OpConstant 4 
                                             %143 = OpTypePointer Uniform %7 
                              Private f32_4* %150 = OpVariable Private 
                                         f32 %153 = OpConstant 3.674022E-40 
                                       f32_4 %154 = OpConstantComposite %128 %128 %128 %153 
                                         f32 %158 = OpConstant 3.674022E-40 
                                       f32_2 %159 = OpConstantComposite %128 %158 
                                             %171 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %172 = OpTypePointer UniformConstant %171 
        UniformConstant read_only Texture2D* %173 = OpVariable UniformConstant 
                                             %175 = OpTypeSampler 
                                             %176 = OpTypePointer UniformConstant %175 
                    UniformConstant sampler* %177 = OpVariable UniformConstant 
                                             %179 = OpTypeSampledImage %171 
                                         f32 %183 = OpConstant 3.674022E-40 
                                Input f32_4* %186 = OpVariable Input 
                              Private f32_4* %195 = OpVariable Private 
                                             %210 = OpTypePointer Input %56 
                                Input f32_2* %211 = OpVariable Input 
                              Private f32_2* %215 = OpVariable Private 
                                         i32 %230 = OpConstant 5 
                              Private f32_2* %237 = OpVariable Private 
                                         f32 %241 = OpConstant 3.674022E-40 
                                       f32_2 %242 = OpConstantComposite %241 %241 
                                         f32 %247 = OpConstant 3.674022E-40 
                                       f32_2 %248 = OpConstantComposite %247 %247 
                             Private bool_4* %264 = OpVariable Private 
                                         f32 %267 = OpConstant 3.674022E-40 
                                         f32 %268 = OpConstant 3.674022E-40 
                                         f32 %269 = OpConstant 3.674022E-40 
                                         f32 %270 = OpConstant 3.674022E-40 
                                       f32_4 %271 = OpConstantComposite %267 %268 %269 %270 
                                             %273 = OpTypePointer Function %7 
                                             %278 = OpTypePointer Function %6 
                                         f32 %310 = OpConstant 3.674022E-40 
                                       f32_2 %311 = OpConstantComposite %310 %310 
                                         f32 %317 = OpConstant 3.674022E-40 
                                       f32_2 %318 = OpConstantComposite %317 %317 
                                         f32 %324 = OpConstant 3.674022E-40 
                                       f32_2 %325 = OpConstantComposite %324 %324 
                              Private f32_2* %329 = OpVariable Private 
                             Private bool_4* %334 = OpVariable Private 
                                         f32 %337 = OpConstant 3.674022E-40 
                                         f32 %338 = OpConstant 3.674022E-40 
                                         f32 %339 = OpConstant 3.674022E-40 
                                         f32 %340 = OpConstant 3.674022E-40 
                                       f32_4 %341 = OpConstantComposite %337 %338 %339 %340 
                               Private bool* %343 = OpVariable Private 
                                             %353 = OpTypeVector %6 3 
                                             %354 = OpTypePointer Private %353 
                              Private f32_3* %355 = OpVariable Private 
                                             %365 = OpTypePointer Function %56 
                                       f32_2 %371 = OpConstantComposite %183 %183 
                                         i32 %378 = OpConstant 0 
                                         i32 %379 = OpConstant 1 
                                             %390 = OpTypePointer Output %7 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                         i32 %395 = OpConstant 2 
                                         i32 %404 = OpConstant 3 
                                             %427 = OpTypeArray %6 %39 
                                             %428 = OpTypeStruct %7 %6 %427 
                                             %429 = OpTypePointer Output %428 
        Output struct {f32_4; f32; f32[1];}* %430 = OpVariable Output 
                                Input f32_4* %449 = OpVariable Input 
                               Output f32_4* %458 = OpVariable Output 
                                Private f32* %489 = OpVariable Private 
                                         f32 %492 = OpConstant 3.674022E-40 
                                Private f32* %499 = OpVariable Private 
                               Private bool* %505 = OpVariable Private 
                                         f32 %521 = OpConstant 3.674022E-40 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                         f32 %567 = OpConstant 3.674022E-40 
                                       f32_2 %568 = OpConstantComposite %567 %14 
                                             %571 = OpTypePointer Output %353 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                       f32_2 %576 = OpConstantComposite %14 %15 
                               Private bool* %580 = OpVariable Private 
                                       f32_2 %588 = OpConstantComposite %34 %42 
                                       f32_2 %589 = OpConstantComposite %35 %43 
                                             %590 = OpTypeVector %18 2 
                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD4 = OpVariable Output 
                                             %658 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                             Function f32_4* %274 = OpVariable Function 
                               Function f32* %279 = OpVariable Function 
                               Function f32* %291 = OpVariable Function 
                             Function f32_2* %366 = OpVariable Function 
                             Function f32_2* %509 = OpVariable Function 
                                        f32_4 %12 = OpLoad %11 
                                        f32_4 %13 = OpVectorShuffle %12 %12 0 0 2 2 
                                        f32_4 %17 = OpFMul %13 %16 
                                                      OpStore %9 %17 
                                        f32_4 %22 = OpLoad %9 
                                        f32_4 %23 = OpVectorShuffle %22 %22 1 1 3 3 
                                        f32_4 %24 = OpLoad %9 
                                        f32_4 %25 = OpVectorShuffle %24 %24 1 1 3 3 
                                        f32_4 %26 = OpFNegate %25 
                                       bool_4 %27 = OpFOrdGreaterThanEqual %23 %26 
                                                      OpStore %21 %27 
                                Private bool* %32 = OpAccessChain %21 %30 
                                         bool %33 = OpLoad %32 
                                          f32 %36 = OpSelect %33 %34 %35 
                                 Private f32* %38 = OpAccessChain %28 %30 
                                                      OpStore %38 %36 
                                Private bool* %40 = OpAccessChain %21 %39 
                                         bool %41 = OpLoad %40 
                                          f32 %44 = OpSelect %41 %42 %43 
                                 Private f32* %45 = OpAccessChain %28 %39 
                                                      OpStore %45 %44 
                                Private bool* %47 = OpAccessChain %21 %46 
                                         bool %48 = OpLoad %47 
                                          f32 %49 = OpSelect %48 %34 %35 
                                 Private f32* %50 = OpAccessChain %28 %46 
                                                      OpStore %50 %49 
                                Private bool* %52 = OpAccessChain %21 %51 
                                         bool %53 = OpLoad %52 
                                          f32 %54 = OpSelect %53 %42 %43 
                                 Private f32* %55 = OpAccessChain %28 %51 
                                                      OpStore %55 %54 
                                        f32_4 %57 = OpLoad %9 
                                        f32_2 %58 = OpVectorShuffle %57 %57 0 2 
                                        f32_4 %59 = OpLoad %28 
                                        f32_2 %60 = OpVectorShuffle %59 %59 1 3 
                                        f32_2 %61 = OpFMul %58 %60 
                                        f32_4 %62 = OpLoad %9 
                                        f32_4 %63 = OpVectorShuffle %62 %61 4 5 2 3 
                                                      OpStore %9 %63 
                                        f32_4 %64 = OpLoad %9 
                                        f32_2 %65 = OpVectorShuffle %64 %64 0 1 
                                        f32_2 %66 = OpExtInst %1 10 %65 
                                        f32_4 %67 = OpLoad %9 
                                        f32_4 %68 = OpVectorShuffle %67 %66 4 5 2 3 
                                                      OpStore %9 %68 
                                        f32_4 %69 = OpLoad %9 
                                        f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                                        f32_4 %71 = OpLoad %28 
                                        f32_2 %72 = OpVectorShuffle %71 %71 0 2 
                                        f32_2 %73 = OpFMul %70 %72 
                                        f32_4 %74 = OpLoad %9 
                                        f32_4 %75 = OpVectorShuffle %74 %73 4 5 2 3 
                                                      OpStore %9 %75 
                                        f32_4 %78 = OpLoad %11 
                                        f32_2 %79 = OpVectorShuffle %78 %78 0 2 
                                        f32_2 %81 = OpFMul %79 %80 
                                        f32_4 %82 = OpLoad %9 
                                        f32_2 %83 = OpVectorShuffle %82 %82 0 1 
                                        f32_2 %84 = OpFNegate %83 
                                        f32_2 %85 = OpFAdd %81 %84 
                                                      OpStore %77 %85 
                                        f32_2 %86 = OpLoad %77 
                                        f32_2 %88 = OpFMul %86 %87 
                                                      OpStore %77 %88 
                                   Input f32* %91 = OpAccessChain %89 %39 
                                          f32 %92 = OpLoad %91 
                                          f32 %94 = OpFMul %92 %93 
                                 Private f32* %95 = OpAccessChain %77 %30 
                                          f32 %96 = OpLoad %95 
                                          f32 %97 = OpFAdd %94 %96 
                                 Private f32* %98 = OpAccessChain %77 %30 
                                                      OpStore %98 %97 
                                  Input f32* %101 = OpAccessChain %100 %39 
                                         f32 %102 = OpLoad %101 
                                         f32 %103 = OpFMul %102 %93 
                                Private f32* %104 = OpAccessChain %77 %39 
                                         f32 %105 = OpLoad %104 
                                         f32 %106 = OpFAdd %103 %105 
                                Private f32* %107 = OpAccessChain %99 %39 
                                                      OpStore %107 %106 
                                Private f32* %108 = OpAccessChain %77 %30 
                                         f32 %109 = OpLoad %108 
                                         f32 %111 = OpFMul %109 %110 
                                Private f32* %112 = OpAccessChain %28 %39 
                                                      OpStore %112 %111 
                                  Input f32* %113 = OpAccessChain %89 %30 
                                         f32 %114 = OpLoad %113 
                                         f32 %115 = OpFMul %114 %15 
                                Private f32* %116 = OpAccessChain %9 %30 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpFAdd %115 %117 
                                Private f32* %119 = OpAccessChain %28 %30 
                                                      OpStore %119 %118 
                                  Input f32* %120 = OpAccessChain %100 %30 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpFMul %121 %15 
                                Private f32* %123 = OpAccessChain %9 %39 
                                         f32 %124 = OpLoad %123 
                                         f32 %125 = OpFAdd %122 %124 
                                Private f32* %126 = OpAccessChain %99 %30 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %99 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %9 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %9 %132 
                                       f32_4 %133 = OpLoad %9 
                                       f32_2 %134 = OpVectorShuffle %133 %133 0 1 
                              Uniform f32_4* %144 = OpAccessChain %140 %142 
                                       f32_4 %145 = OpLoad %144 
                                       f32_2 %146 = OpVectorShuffle %145 %145 0 1 
                                       f32_2 %147 = OpFMul %134 %146 
                                       f32_4 %148 = OpLoad %9 
                                       f32_4 %149 = OpVectorShuffle %148 %147 0 1 4 5 
                                                      OpStore %9 %149 
                                       f32_4 %151 = OpLoad %28 
                                       f32_4 %152 = OpVectorShuffle %151 %151 0 1 0 1 
                                       f32_4 %155 = OpFAdd %152 %154 
                                                      OpStore %150 %155 
                                       f32_4 %156 = OpLoad %28 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                                       f32_2 %160 = OpFAdd %157 %159 
                                       f32_4 %161 = OpLoad %28 
                                       f32_4 %162 = OpVectorShuffle %161 %160 4 5 2 3 
                                                      OpStore %28 %162 
                                       f32_4 %163 = OpLoad %28 
                                       f32_2 %164 = OpVectorShuffle %163 %163 0 1 
                              Uniform f32_4* %165 = OpAccessChain %140 %142 
                                       f32_4 %166 = OpLoad %165 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpFMul %164 %167 
                                       f32_4 %169 = OpLoad %28 
                                       f32_4 %170 = OpVectorShuffle %169 %168 4 5 2 3 
                                                      OpStore %28 %170 
                         read_only Texture2D %174 = OpLoad %173 
                                     sampler %178 = OpLoad %177 
                  read_only Texture2DSampled %180 = OpSampledImage %174 %178 
                                       f32_4 %181 = OpLoad %28 
                                       f32_2 %182 = OpVectorShuffle %181 %181 0 1 
                                       f32_4 %184 = OpImageSampleExplicitLod %180 %182 Lod %7 
                                                      OpStore %28 %184 
                                       f32_4 %185 = OpLoad %28 
                                       f32_4 %187 = OpLoad %186 
                                         f32 %188 = OpDot %185 %187 
                                Private f32* %189 = OpAccessChain %28 %30 
                                                      OpStore %189 %188 
                                       f32_4 %190 = OpLoad %150 
                              Uniform f32_4* %191 = OpAccessChain %140 %142 
                                       f32_4 %192 = OpLoad %191 
                                       f32_4 %193 = OpVectorShuffle %192 %192 0 1 0 1 
                                       f32_4 %194 = OpFMul %190 %193 
                                                      OpStore %150 %194 
                         read_only Texture2D %196 = OpLoad %173 
                                     sampler %197 = OpLoad %177 
                  read_only Texture2DSampled %198 = OpSampledImage %196 %197 
                                       f32_4 %199 = OpLoad %150 
                                       f32_2 %200 = OpVectorShuffle %199 %199 0 1 
                                       f32_4 %201 = OpImageSampleExplicitLod %198 %200 Lod %7 
                                                      OpStore %195 %201 
                         read_only Texture2D %202 = OpLoad %173 
                                     sampler %203 = OpLoad %177 
                  read_only Texture2DSampled %204 = OpSampledImage %202 %203 
                                       f32_4 %205 = OpLoad %150 
                                       f32_2 %206 = OpVectorShuffle %205 %205 2 3 
                                       f32_4 %207 = OpImageSampleExplicitLod %204 %206 Lod %7 
                                                      OpStore %150 %207 
                                       f32_4 %208 = OpLoad %195 
                                       f32_2 %209 = OpVectorShuffle %208 %208 0 1 
                                       f32_2 %212 = OpLoad %211 
                                         f32 %213 = OpDot %209 %212 
                                Private f32* %214 = OpAccessChain %99 %30 
                                                      OpStore %214 %213 
                                       f32_4 %216 = OpLoad %195 
                                       f32_4 %217 = OpLoad %186 
                                         f32 %218 = OpDot %216 %217 
                                Private f32* %219 = OpAccessChain %215 %30 
                                                      OpStore %219 %218 
                                       f32_4 %220 = OpLoad %150 
                                       f32_2 %221 = OpVectorShuffle %220 %220 0 1 
                                       f32_2 %222 = OpLoad %211 
                                         f32 %223 = OpDot %221 %222 
                                Private f32* %224 = OpAccessChain %99 %39 
                                                      OpStore %224 %223 
                                       f32_4 %225 = OpLoad %150 
                                       f32_4 %226 = OpLoad %186 
                                         f32 %227 = OpDot %225 %226 
                                Private f32* %228 = OpAccessChain %215 %39 
                                                      OpStore %228 %227 
                                       f32_2 %229 = OpLoad %99 
                              Uniform f32_4* %231 = OpAccessChain %140 %230 
                                       f32_4 %232 = OpLoad %231 
                                       f32_2 %233 = OpVectorShuffle %232 %232 2 3 
                                       f32_2 %234 = OpFMul %229 %233 
                                       f32_4 %235 = OpLoad %150 
                                       f32_4 %236 = OpVectorShuffle %235 %234 4 5 2 3 
                                                      OpStore %150 %236 
                                       f32_4 %238 = OpLoad %150 
                                       f32_2 %239 = OpVectorShuffle %238 %238 0 1 
                                       f32_2 %240 = OpExtInst %1 4 %239 
                                       f32_2 %243 = OpFAdd %240 %242 
                                                      OpStore %237 %243 
                                       f32_4 %244 = OpLoad %150 
                                       f32_2 %245 = OpVectorShuffle %244 %244 0 1 
                                       f32_2 %246 = OpExtInst %1 4 %245 
                                       f32_2 %249 = OpExtInst %1 40 %246 %248 
                                       f32_4 %250 = OpLoad %150 
                                       f32_4 %251 = OpVectorShuffle %250 %249 4 5 2 3 
                                                      OpStore %150 %251 
                                       f32_4 %252 = OpLoad %150 
                                       f32_2 %253 = OpVectorShuffle %252 %252 0 1 
                                       f32_2 %254 = OpExtInst %1 2 %253 
                                       f32_4 %255 = OpLoad %195 
                                       f32_4 %256 = OpVectorShuffle %255 %254 4 5 2 3 
                                                      OpStore %195 %256 
                                       f32_4 %257 = OpLoad %150 
                                       f32_2 %258 = OpVectorShuffle %257 %257 0 1 
                                       f32_4 %259 = OpLoad %195 
                                       f32_2 %260 = OpVectorShuffle %259 %259 0 1 
                                       f32_2 %261 = OpExtInst %1 40 %258 %260 
                                       f32_4 %262 = OpLoad %150 
                                       f32_4 %263 = OpVectorShuffle %262 %261 4 5 2 3 
                                                      OpStore %150 %263 
                                       f32_4 %265 = OpLoad %11 
                                       f32_4 %266 = OpVectorShuffle %265 %265 3 3 3 3 
                                      bool_4 %272 = OpFOrdEqual %266 %271 
                                                      OpStore %264 %272 
                                       f32_4 %275 = OpLoad %150 
                                                      OpStore %274 %275 
                               Private bool* %276 = OpAccessChain %264 %51 
                                        bool %277 = OpLoad %276 
                                                      OpSelectionMerge %281 None 
                                                      OpBranchConditional %277 %280 %284 
                                             %280 = OpLabel 
                                Private f32* %282 = OpAccessChain %150 %30 
                                         f32 %283 = OpLoad %282 
                                                      OpStore %279 %283 
                                                      OpBranch %281 
                                             %284 = OpLabel 
                                Private f32* %285 = OpAccessChain %195 %30 
                                         f32 %286 = OpLoad %285 
                                                      OpStore %279 %286 
                                                      OpBranch %281 
                                             %281 = OpLabel 
                                         f32 %287 = OpLoad %279 
                               Function f32* %288 = OpAccessChain %274 %30 
                                                      OpStore %288 %287 
                               Private bool* %289 = OpAccessChain %264 %46 
                                        bool %290 = OpLoad %289 
                                                      OpSelectionMerge %293 None 
                                                      OpBranchConditional %290 %292 %296 
                                             %292 = OpLabel 
                                Private f32* %294 = OpAccessChain %150 %39 
                                         f32 %295 = OpLoad %294 
                                                      OpStore %291 %295 
                                                      OpBranch %293 
                                             %296 = OpLabel 
                                Private f32* %297 = OpAccessChain %195 %39 
                                         f32 %298 = OpLoad %297 
                                                      OpStore %291 %298 
                                                      OpBranch %293 
                                             %293 = OpLabel 
                                         f32 %299 = OpLoad %291 
                               Function f32* %300 = OpAccessChain %274 %39 
                                                      OpStore %300 %299 
                                       f32_4 %301 = OpLoad %274 
                                                      OpStore %150 %301 
                                       f32_4 %302 = OpLoad %150 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                       f32_2 %304 = OpLoad %237 
                                       f32_2 %305 = OpFDiv %303 %304 
                                       f32_4 %306 = OpLoad %150 
                                       f32_4 %307 = OpVectorShuffle %306 %305 4 5 2 3 
                                                      OpStore %150 %307 
                                       f32_4 %308 = OpLoad %150 
                                       f32_2 %309 = OpVectorShuffle %308 %308 0 1 
                                       f32_2 %312 = OpExtInst %1 40 %309 %311 
                                       f32_4 %313 = OpLoad %150 
                                       f32_4 %314 = OpVectorShuffle %313 %312 4 5 2 3 
                                                      OpStore %150 %314 
                                       f32_4 %315 = OpLoad %150 
                                       f32_2 %316 = OpVectorShuffle %315 %315 0 1 
                                       f32_2 %319 = OpExtInst %1 37 %316 %318 
                                       f32_4 %320 = OpLoad %150 
                                       f32_4 %321 = OpVectorShuffle %320 %319 4 5 2 3 
                                                      OpStore %150 %321 
                                       f32_4 %322 = OpLoad %150 
                                       f32_2 %323 = OpVectorShuffle %322 %322 0 1 
                                       f32_2 %326 = OpFAdd %323 %325 
                                       f32_4 %327 = OpLoad %150 
                                       f32_4 %328 = OpVectorShuffle %327 %326 4 5 2 3 
                                                      OpStore %150 %328 
                                       f32_2 %330 = OpLoad %99 
                                       f32_4 %331 = OpLoad %150 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                       f32_2 %333 = OpFMul %330 %332 
                                                      OpStore %329 %333 
                                       f32_4 %335 = OpLoad %11 
                                       f32_4 %336 = OpVectorShuffle %335 %335 3 3 3 3 
                                      bool_4 %342 = OpFOrdEqual %336 %341 
                                                      OpStore %334 %342 
                               Private bool* %344 = OpAccessChain %264 %51 
                                        bool %345 = OpLoad %344 
                               Private bool* %346 = OpAccessChain %334 %30 
                                        bool %347 = OpLoad %346 
                                        bool %348 = OpLogicalOr %345 %347 
                                                      OpStore %343 %348 
                               Private bool* %349 = OpAccessChain %264 %46 
                                        bool %350 = OpLoad %349 
                                        bool %351 = OpLoad %343 
                                        bool %352 = OpLogicalOr %350 %351 
                                                      OpStore %343 %352 
                               Private bool* %356 = OpAccessChain %264 %39 
                                        bool %357 = OpLoad %356 
                                         f32 %358 = OpSelect %357 %247 %183 
                                Private f32* %359 = OpAccessChain %355 %30 
                                                      OpStore %359 %358 
                               Private bool* %360 = OpAccessChain %264 %30 
                                        bool %361 = OpLoad %360 
                                         f32 %362 = OpSelect %361 %247 %183 
                                Private f32* %363 = OpAccessChain %355 %39 
                                                      OpStore %363 %362 
                                        bool %364 = OpLoad %343 
                                                      OpSelectionMerge %368 None 
                                                      OpBranchConditional %364 %367 %370 
                                             %367 = OpLabel 
                                       f32_2 %369 = OpLoad %329 
                                                      OpStore %366 %369 
                                                      OpBranch %368 
                                             %370 = OpLabel 
                                                      OpStore %366 %371 
                                                      OpBranch %368 
                                             %368 = OpLabel 
                                       f32_2 %372 = OpLoad %366 
                                                      OpStore %329 %372 
                                       f32_2 %373 = OpLoad %329 
                                       f32_2 %374 = OpLoad %215 
                                       f32_2 %375 = OpFAdd %373 %374 
                                                      OpStore %329 %375 
                                       f32_2 %376 = OpLoad %329 
                                       f32_4 %377 = OpVectorShuffle %376 %376 1 1 1 1 
                              Uniform f32_4* %380 = OpAccessChain %140 %378 %379 
                                       f32_4 %381 = OpLoad %380 
                                       f32_4 %382 = OpFMul %377 %381 
                                                      OpStore %195 %382 
                              Uniform f32_4* %383 = OpAccessChain %140 %378 %378 
                                       f32_4 %384 = OpLoad %383 
                                       f32_2 %385 = OpLoad %329 
                                       f32_4 %386 = OpVectorShuffle %385 %385 0 0 0 0 
                                       f32_4 %387 = OpFMul %384 %386 
                                       f32_4 %388 = OpLoad %195 
                                       f32_4 %389 = OpFAdd %387 %388 
                                                      OpStore %195 %389 
                                       f32_2 %392 = OpLoad %329 
                                       f32_4 %393 = OpLoad vs_TEXCOORD0 
                                       f32_4 %394 = OpVectorShuffle %393 %392 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %394 
                              Uniform f32_4* %396 = OpAccessChain %140 %378 %395 
                                       f32_4 %397 = OpLoad %396 
                                       f32_4 %398 = OpLoad %28 
                                       f32_4 %399 = OpVectorShuffle %398 %398 0 0 0 0 
                                       f32_4 %400 = OpFMul %397 %399 
                                       f32_4 %401 = OpLoad %195 
                                       f32_4 %402 = OpFAdd %400 %401 
                                                      OpStore %28 %402 
                                       f32_4 %403 = OpLoad %28 
                              Uniform f32_4* %405 = OpAccessChain %140 %378 %404 
                                       f32_4 %406 = OpLoad %405 
                                       f32_4 %407 = OpFAdd %403 %406 
                                                      OpStore %28 %407 
                                       f32_4 %408 = OpLoad %28 
                                       f32_4 %409 = OpVectorShuffle %408 %408 1 1 1 1 
                              Uniform f32_4* %410 = OpAccessChain %140 %379 %379 
                                       f32_4 %411 = OpLoad %410 
                                       f32_4 %412 = OpFMul %409 %411 
                                                      OpStore %195 %412 
                              Uniform f32_4* %413 = OpAccessChain %140 %379 %378 
                                       f32_4 %414 = OpLoad %413 
                                       f32_4 %415 = OpLoad %28 
                                       f32_4 %416 = OpVectorShuffle %415 %415 0 0 0 0 
                                       f32_4 %417 = OpFMul %414 %416 
                                       f32_4 %418 = OpLoad %195 
                                       f32_4 %419 = OpFAdd %417 %418 
                                                      OpStore %195 %419 
                              Uniform f32_4* %420 = OpAccessChain %140 %379 %395 
                                       f32_4 %421 = OpLoad %420 
                                       f32_4 %422 = OpLoad %28 
                                       f32_4 %423 = OpVectorShuffle %422 %422 2 2 2 2 
                                       f32_4 %424 = OpFMul %421 %423 
                                       f32_4 %425 = OpLoad %195 
                                       f32_4 %426 = OpFAdd %424 %425 
                                                      OpStore %195 %426 
                              Uniform f32_4* %431 = OpAccessChain %140 %379 %404 
                                       f32_4 %432 = OpLoad %431 
                                       f32_4 %433 = OpLoad %28 
                                       f32_4 %434 = OpVectorShuffle %433 %433 3 3 3 3 
                                       f32_4 %435 = OpFMul %432 %434 
                                       f32_4 %436 = OpLoad %195 
                                       f32_4 %437 = OpFAdd %435 %436 
                               Output f32_4* %438 = OpAccessChain %430 %378 
                                                      OpStore %438 %437 
                         read_only Texture2D %439 = OpLoad %173 
                                     sampler %440 = OpLoad %177 
                  read_only Texture2DSampled %441 = OpSampledImage %439 %440 
                                       f32_4 %442 = OpLoad %9 
                                       f32_2 %443 = OpVectorShuffle %442 %442 2 3 
                                       f32_4 %444 = OpImageSampleExplicitLod %441 %443 Lod %7 
                                         f32 %445 = OpCompositeExtract %444 3 
                                Private f32* %446 = OpAccessChain %28 %30 
                                                      OpStore %446 %445 
                                Private f32* %447 = OpAccessChain %28 %30 
                                         f32 %448 = OpLoad %447 
                                  Input f32* %450 = OpAccessChain %449 %51 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpFMul %448 %451 
                                Private f32* %453 = OpAccessChain %28 %51 
                                                      OpStore %453 %452 
                                       f32_4 %454 = OpLoad %449 
                                       f32_3 %455 = OpVectorShuffle %454 %454 0 1 2 
                                       f32_4 %456 = OpLoad %28 
                                       f32_4 %457 = OpVectorShuffle %456 %455 4 5 6 3 
                                                      OpStore %28 %457 
                                       f32_4 %459 = OpLoad %28 
                                                      OpStore %458 %459 
                                       f32_2 %460 = OpLoad %211 
                              Uniform f32_4* %461 = OpAccessChain %140 %395 
                                       f32_4 %462 = OpLoad %461 
                                       f32_2 %463 = OpVectorShuffle %462 %462 0 1 
                                       f32_2 %464 = OpFMul %460 %463 
                              Uniform f32_4* %465 = OpAccessChain %140 %395 
                                       f32_4 %466 = OpLoad %465 
                                       f32_2 %467 = OpVectorShuffle %466 %466 2 3 
                                       f32_2 %468 = OpFAdd %464 %467 
                                       f32_4 %469 = OpLoad %28 
                                       f32_4 %470 = OpVectorShuffle %469 %468 4 5 2 3 
                                                      OpStore %28 %470 
                                       f32_4 %471 = OpLoad %28 
                                       f32_2 %472 = OpVectorShuffle %471 %471 0 1 
                              Uniform f32_4* %473 = OpAccessChain %140 %404 
                                       f32_4 %474 = OpLoad %473 
                                       f32_2 %475 = OpVectorShuffle %474 %474 0 1 
                                       f32_2 %476 = OpFMul %472 %475 
                                                      OpStore %99 %476 
                               Private bool* %477 = OpAccessChain %334 %39 
                                        bool %478 = OpLoad %477 
                                         f32 %479 = OpSelect %478 %247 %183 
                                Private f32* %480 = OpAccessChain %150 %30 
                                                      OpStore %480 %479 
                               Private bool* %481 = OpAccessChain %334 %46 
                                        bool %482 = OpLoad %481 
                                         f32 %483 = OpSelect %482 %247 %183 
                                Private f32* %484 = OpAccessChain %150 %39 
                                                      OpStore %484 %483 
                               Private bool* %485 = OpAccessChain %334 %51 
                                        bool %486 = OpLoad %485 
                                         f32 %487 = OpSelect %486 %247 %183 
                                Private f32* %488 = OpAccessChain %150 %46 
                                                      OpStore %488 %487 
                               Private bool* %490 = OpAccessChain %334 %51 
                                        bool %491 = OpLoad %490 
                                         f32 %493 = OpSelect %491 %324 %492 
                                                      OpStore %489 %493 
                                         f32 %494 = OpLoad %489 
                                Private f32* %495 = OpAccessChain %150 %39 
                                         f32 %496 = OpLoad %495 
                                         f32 %497 = OpFAdd %494 %496 
                                Private f32* %498 = OpAccessChain %195 %39 
                                                      OpStore %498 %497 
                                Private f32* %500 = OpAccessChain %150 %46 
                                         f32 %501 = OpLoad %500 
                                Private f32* %502 = OpAccessChain %150 %39 
                                         f32 %503 = OpLoad %502 
                                         f32 %504 = OpFAdd %501 %503 
                                                      OpStore %499 %504 
                                         f32 %506 = OpLoad %499 
                                        bool %507 = OpFOrdEqual %506 %247 
                                                      OpStore %505 %507 
                                        bool %508 = OpLoad %505 
                                                      OpSelectionMerge %511 None 
                                                      OpBranchConditional %508 %510 %513 
                                             %510 = OpLabel 
                                       f32_2 %512 = OpLoad %99 
                                                      OpStore %509 %512 
                                                      OpBranch %511 
                                             %513 = OpLabel 
                                       f32_4 %514 = OpLoad %28 
                                       f32_2 %515 = OpVectorShuffle %514 %514 0 1 
                                                      OpStore %509 %515 
                                                      OpBranch %511 
                                             %511 = OpLabel 
                                       f32_2 %516 = OpLoad %509 
                                       f32_4 %517 = OpLoad vs_TEXCOORD0 
                                       f32_4 %518 = OpVectorShuffle %517 %516 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %518 
                                  Input f32* %519 = OpAccessChain %11 %51 
                                         f32 %520 = OpLoad %519 
                                        bool %522 = OpFOrdEqual %520 %521 
                               Private bool* %523 = OpAccessChain %21 %30 
                                                      OpStore %523 %522 
                               Private bool* %524 = OpAccessChain %21 %30 
                                        bool %525 = OpLoad %524 
                                         f32 %526 = OpSelect %525 %247 %183 
                                Private f32* %527 = OpAccessChain %195 %30 
                                                      OpStore %527 %526 
                                         f32 %528 = OpLoad %499 
                                Private f32* %529 = OpAccessChain %195 %30 
                                         f32 %530 = OpLoad %529 
                                         f32 %531 = OpFAdd %528 %530 
                                Private f32* %532 = OpAccessChain %28 %30 
                                                      OpStore %532 %531 
                                Private f32* %533 = OpAccessChain %150 %30 
                                         f32 %534 = OpLoad %533 
                                Private f32* %535 = OpAccessChain %28 %30 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpFAdd %534 %536 
                                Private f32* %538 = OpAccessChain %28 %30 
                                                      OpStore %538 %537 
                                Private f32* %539 = OpAccessChain %150 %30 
                                         f32 %540 = OpLoad %539 
                                Private f32* %541 = OpAccessChain %195 %46 
                                                      OpStore %541 %540 
                                Private f32* %542 = OpAccessChain %355 %30 
                                         f32 %543 = OpLoad %542 
                                Private f32* %544 = OpAccessChain %28 %30 
                                         f32 %545 = OpLoad %544 
                                         f32 %546 = OpFAdd %543 %545 
                                Private f32* %547 = OpAccessChain %28 %30 
                                                      OpStore %547 %546 
                                Private f32* %548 = OpAccessChain %355 %39 
                                         f32 %549 = OpLoad %548 
                                Private f32* %550 = OpAccessChain %28 %30 
                                         f32 %551 = OpLoad %550 
                                         f32 %552 = OpFAdd %549 %551 
                                Private f32* %553 = OpAccessChain %28 %30 
                                                      OpStore %553 %552 
                                Private f32* %554 = OpAccessChain %28 %30 
                                         f32 %555 = OpLoad %554 
                                         f32 %556 = OpExtInst %1 37 %555 %247 
                                Private f32* %557 = OpAccessChain %28 %30 
                                                      OpStore %557 %556 
                                Private f32* %558 = OpAccessChain %28 %30 
                                         f32 %559 = OpLoad %558 
                                         f32 %560 = OpFNegate %559 
                                         f32 %561 = OpFAdd %560 %247 
                                Private f32* %562 = OpAccessChain %195 %51 
                                                      OpStore %562 %561 
                                       f32_4 %564 = OpLoad %195 
                                                      OpStore vs_TEXCOORD1 %564 
                                       f32_4 %565 = OpLoad %100 
                                       f32_2 %566 = OpVectorShuffle %565 %565 2 3 
                                         f32 %569 = OpDot %566 %568 
                                Private f32* %570 = OpAccessChain %355 %46 
                                                      OpStore %570 %569 
                                       f32_3 %573 = OpLoad %355 
                                                      OpStore vs_TEXCOORD2 %573 
                                       f32_4 %574 = OpLoad %11 
                                       f32_2 %575 = OpVectorShuffle %574 %574 1 1 
                                       f32_2 %577 = OpFMul %575 %576 
                                       f32_4 %578 = OpLoad %28 
                                       f32_4 %579 = OpVectorShuffle %578 %577 4 5 2 3 
                                                      OpStore %28 %579 
                                Private f32* %581 = OpAccessChain %28 %39 
                                         f32 %582 = OpLoad %581 
                                Private f32* %583 = OpAccessChain %28 %39 
                                         f32 %584 = OpLoad %583 
                                         f32 %585 = OpFNegate %584 
                                        bool %586 = OpFOrdGreaterThanEqual %582 %585 
                                                      OpStore %580 %586 
                                        bool %587 = OpLoad %580 
                                      bool_2 %591 = OpCompositeConstruct %587 %587 
                                       f32_2 %592 = OpSelect %591 %588 %589 
                                                      OpStore %329 %592 
                                Private f32* %593 = OpAccessChain %329 %39 
                                         f32 %594 = OpLoad %593 
                                Private f32* %595 = OpAccessChain %28 %30 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFMul %594 %596 
                                Private f32* %598 = OpAccessChain %28 %30 
                                                      OpStore %598 %597 
                                Private f32* %599 = OpAccessChain %28 %30 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpExtInst %1 10 %600 
                                Private f32* %602 = OpAccessChain %28 %30 
                                                      OpStore %602 %601 
                                Private f32* %603 = OpAccessChain %28 %30 
                                         f32 %604 = OpLoad %603 
                                Private f32* %605 = OpAccessChain %329 %30 
                                         f32 %606 = OpLoad %605 
                                         f32 %607 = OpFMul %604 %606 
                                Private f32* %608 = OpAccessChain %28 %30 
                                                      OpStore %608 %607 
                                  Input f32* %609 = OpAccessChain %11 %39 
                                         f32 %610 = OpLoad %609 
                                         f32 %611 = OpFMul %610 %14 
                                Private f32* %612 = OpAccessChain %28 %30 
                                         f32 %613 = OpLoad %612 
                                         f32 %614 = OpFNegate %613 
                                         f32 %615 = OpFAdd %611 %614 
                                Private f32* %616 = OpAccessChain %329 %30 
                                                      OpStore %616 %615 
                                  Input f32* %617 = OpAccessChain %89 %46 
                                         f32 %618 = OpLoad %617 
                                         f32 %619 = OpFMul %618 %15 
                                Private f32* %620 = OpAccessChain %28 %30 
                                         f32 %621 = OpLoad %620 
                                         f32 %622 = OpFAdd %619 %621 
                                Private f32* %623 = OpAccessChain %150 %30 
                                                      OpStore %623 %622 
                                  Input f32* %624 = OpAccessChain %89 %51 
                                         f32 %625 = OpLoad %624 
                                         f32 %626 = OpFMul %625 %93 
                                Private f32* %627 = OpAccessChain %28 %30 
                                                      OpStore %627 %626 
                                Private f32* %628 = OpAccessChain %329 %30 
                                         f32 %629 = OpLoad %628 
                                         f32 %630 = OpFMul %629 %42 
                                Private f32* %631 = OpAccessChain %28 %30 
                                         f32 %632 = OpLoad %631 
                                         f32 %633 = OpFAdd %630 %632 
                                Private f32* %634 = OpAccessChain %150 %39 
                                                      OpStore %634 %633 
                                       f32_4 %635 = OpLoad %150 
                                       f32_2 %636 = OpVectorShuffle %635 %635 0 1 
                                       f32_2 %637 = OpFAdd %636 %129 
                                       f32_4 %638 = OpLoad %28 
                                       f32_4 %639 = OpVectorShuffle %638 %637 4 5 2 3 
                                                      OpStore %28 %639 
                                       f32_4 %640 = OpLoad %28 
                                       f32_2 %641 = OpVectorShuffle %640 %640 0 1 
                              Uniform f32_4* %642 = OpAccessChain %140 %142 
                                       f32_4 %643 = OpLoad %642 
                                       f32_2 %644 = OpVectorShuffle %643 %643 0 1 
                                       f32_2 %645 = OpFMul %641 %644 
                                       f32_4 %646 = OpLoad %9 
                                       f32_4 %647 = OpVectorShuffle %646 %645 4 5 2 3 
                                                      OpStore %9 %647 
                                       f32_4 %649 = OpLoad %9 
                                                      OpStore vs_TEXCOORD3 %649 
                         read_only Texture2D %650 = OpLoad %173 
                                     sampler %651 = OpLoad %177 
                  read_only Texture2DSampled %652 = OpSampledImage %650 %651 
                                       f32_4 %653 = OpLoad %9 
                                       f32_2 %654 = OpVectorShuffle %653 %653 0 1 
                                       f32_4 %655 = OpImageSampleExplicitLod %652 %654 Lod %7 
                                                      OpStore %9 %655 
                                       f32_4 %657 = OpLoad %9 
                                                      OpStore vs_TEXCOORD4 %657 
                                 Output f32* %659 = OpAccessChain %430 %378 %39 
                                         f32 %660 = OpLoad %659 
                                         f32 %661 = OpFNegate %660 
                                 Output f32* %662 = OpAccessChain %430 %378 %39 
                                                      OpStore %662 %661 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 766
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %30 %33 %156 %304 %760 %762 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD4 "vs_TEXCOORD4" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 BuiltIn TessLevelOuter 
                                                      OpDecorate vs_TEXCOORD0 Location 30 
                                                      OpDecorate vs_TEXCOORD4 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD4 Flat 
                                                      OpDecorate vs_TEXCOORD4 Location 33 
                                                      OpDecorate %34 RelaxedPrecision 
                                                      OpDecorate %35 RelaxedPrecision 
                                                      OpDecorate %41 RelaxedPrecision 
                                                      OpDecorate %42 RelaxedPrecision 
                                                      OpMemberDecorate %85 0 Offset 85 
                                                      OpMemberDecorate %85 1 Offset 85 
                                                      OpMemberDecorate %85 2 Offset 85 
                                                      OpMemberDecorate %85 3 Offset 85 
                                                      OpDecorate %85 Block 
                                                      OpDecorate %87 DescriptorSet 87 
                                                      OpDecorate %87 Binding 87 
                                                      OpDecorate %155 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 156 
                                                      OpDecorate %158 RelaxedPrecision 
                                                      OpDecorate %159 RelaxedPrecision 
                                                      OpDecorate %162 RelaxedPrecision 
                                                      OpDecorate %163 RelaxedPrecision 
                                                      OpDecorate %165 RelaxedPrecision 
                                                      OpDecorate %167 RelaxedPrecision 
                                                      OpDecorate %168 RelaxedPrecision 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %170 RelaxedPrecision 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %173 DescriptorSet 173 
                                                      OpDecorate %173 Binding 173 
                                                      OpDecorate %174 RelaxedPrecision 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %177 DescriptorSet 177 
                                                      OpDecorate %177 Binding 177 
                                                      OpDecorate %178 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %186 RelaxedPrecision 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %189 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 DescriptorSet 193 
                                                      OpDecorate %193 Binding 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %199 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate %201 RelaxedPrecision 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %206 DescriptorSet 206 
                                                      OpDecorate %206 Binding 206 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %208 RelaxedPrecision 
                                                      OpDecorate %208 DescriptorSet 208 
                                                      OpDecorate %208 Binding 208 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %273 RelaxedPrecision 
                                                      OpDecorate %274 RelaxedPrecision 
                                                      OpDecorate %280 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %285 RelaxedPrecision 
                                                      OpDecorate %287 RelaxedPrecision 
                                                      OpDecorate %288 RelaxedPrecision 
                                                      OpDecorate %288 DescriptorSet 288 
                                                      OpDecorate %288 Binding 288 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %290 RelaxedPrecision 
                                                      OpDecorate %290 DescriptorSet 290 
                                                      OpDecorate %290 Binding 290 
                                                      OpDecorate %291 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %301 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 304 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %336 RelaxedPrecision 
                                                      OpDecorate %337 RelaxedPrecision 
                                                      OpDecorate %349 RelaxedPrecision 
                                                      OpDecorate %350 RelaxedPrecision 
                                                      OpDecorate %350 DescriptorSet 350 
                                                      OpDecorate %350 Binding 350 
                                                      OpDecorate %351 RelaxedPrecision 
                                                      OpDecorate %352 RelaxedPrecision 
                                                      OpDecorate %352 DescriptorSet 352 
                                                      OpDecorate %352 Binding 352 
                                                      OpDecorate %353 RelaxedPrecision 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %365 RelaxedPrecision 
                                                      OpDecorate %366 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %517 RelaxedPrecision 
                                                      OpDecorate %519 RelaxedPrecision 
                                                      OpDecorate %521 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %683 RelaxedPrecision 
                                                      OpDecorate %684 RelaxedPrecision 
                                                      OpDecorate %688 RelaxedPrecision 
                                                      OpDecorate %689 RelaxedPrecision 
                                                      OpDecorate %691 RelaxedPrecision 
                                                      OpDecorate %694 RelaxedPrecision 
                                                      OpDecorate %695 RelaxedPrecision 
                                                      OpDecorate %698 RelaxedPrecision 
                                                      OpDecorate %702 RelaxedPrecision 
                                                      OpDecorate %704 RelaxedPrecision 
                                                      OpDecorate %709 RelaxedPrecision 
                                                      OpDecorate %710 RelaxedPrecision 
                                                      OpDecorate %714 RelaxedPrecision 
                                                      OpDecorate %715 RelaxedPrecision 
                                                      OpDecorate %716 RelaxedPrecision 
                                                      OpDecorate %717 RelaxedPrecision 
                                                      OpDecorate %718 RelaxedPrecision 
                                                      OpDecorate %719 RelaxedPrecision 
                                                      OpDecorate %726 RelaxedPrecision 
                                                      OpDecorate %734 RelaxedPrecision 
                                                      OpDecorate %735 RelaxedPrecision 
                                                      OpDecorate %739 RelaxedPrecision 
                                                      OpDecorate %740 RelaxedPrecision 
                                                      OpDecorate %741 RelaxedPrecision 
                                                      OpDecorate %742 RelaxedPrecision 
                                                      OpDecorate %745 RelaxedPrecision 
                                                      OpDecorate %746 RelaxedPrecision 
                                                      OpDecorate %750 RelaxedPrecision 
                                                      OpDecorate %751 RelaxedPrecision 
                                                      OpDecorate %752 RelaxedPrecision 
                                                      OpDecorate %753 RelaxedPrecision 
                                                      OpDecorate %760 RelaxedPrecision 
                                                      OpDecorate %760 Location 760 
                                                      OpDecorate %761 RelaxedPrecision 
                                                      OpDecorate %762 RelaxedPrecision 
                                                      OpDecorate %762 Location 762 
                                                      OpDecorate %763 RelaxedPrecision 
                                                      OpDecorate %764 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Function %7 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 3 
                                              %18 = OpTypePointer Input %6 
                                              %26 = OpTypeBool 
                                              %27 = OpTypeVector %26 4 
                                              %28 = OpTypePointer Private %27 
                              Private bool_4* %29 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                        Input f32_4* vs_TEXCOORD4 = OpVariable Input 
                                              %37 = OpTypeVector %26 2 
                                              %49 = OpTypePointer Private %7 
                               Private f32_4* %50 = OpVariable Private 
                                          u32 %51 = OpConstant 0 
                                              %52 = OpTypePointer Private %26 
                                          f32 %55 = OpConstant 3.674022E-40 
                                              %57 = OpTypePointer Private %6 
                                          u32 %59 = OpConstant 1 
                                          u32 %64 = OpConstant 2 
                                              %73 = OpTypeVector %6 2 
                                              %81 = OpTypePointer Private %37 
                              Private bool_2* %82 = OpVariable Private 
                                              %85 = OpTypeStruct %7 %7 %7 %7 
                                              %86 = OpTypePointer Uniform %85 
Uniform struct {f32_4; f32_4; f32_4; f32_4;}* %87 = OpVariable Uniform 
                                              %88 = OpTypeInt 32 1 
                                          i32 %89 = OpConstant 3 
                                              %90 = OpTypePointer Uniform %7 
                                              %96 = OpTypePointer Private %73 
                               Private f32_2* %97 = OpVariable Private 
                                         f32 %136 = OpConstant 3.674022E-40 
                                       f32_3 %137 = OpConstantComposite %15 %15 %136 
                                         i32 %146 = OpConstant 0 
                                         i32 %147 = OpConstant 1 
                                         i32 %149 = OpConstant -1 
                              Private f32_4* %155 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                Private f32* %165 = OpVariable Private 
                              Private f32_4* %170 = OpVariable Private 
                                             %171 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %172 = OpTypePointer UniformConstant %171 
        UniformConstant read_only Texture2D* %173 = OpVariable UniformConstant 
                                             %175 = OpTypeSampler 
                                             %176 = OpTypePointer UniformConstant %175 
                    UniformConstant sampler* %177 = OpVariable UniformConstant 
                                             %179 = OpTypeSampledImage %171 
                              Private f32_4* %191 = OpVariable Private 
                    UniformConstant sampler* %193 = OpVariable UniformConstant 
                              Private f32_2* %205 = OpVariable Private 
        UniformConstant read_only Texture2D* %206 = OpVariable UniformConstant 
                    UniformConstant sampler* %208 = OpVariable UniformConstant 
                                Private f32* %216 = OpVariable Private 
                              Private f32_2* %220 = OpVariable Private 
                                         f32 %233 = OpConstant 3.674022E-40 
                                         f32 %258 = OpConstant 3.674022E-40 
                                         f32 %260 = OpConstant 3.674022E-40 
                              Private f32_4* %283 = OpVariable Private 
                              Private f32_4* %287 = OpVariable Private 
        UniformConstant read_only Texture2D* %288 = OpVariable UniformConstant 
                    UniformConstant sampler* %290 = OpVariable UniformConstant 
                             Private bool_2* %302 = OpVariable Private 
                                             %303 = OpTypePointer Input %12 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                       f32_4 %307 = OpConstantComposite %15 %15 %55 %55 
                                             %322 = OpTypePointer Function %73 
                              Private f32_4* %334 = OpVariable Private 
                              Private f32_2* %340 = OpVariable Private 
                                         i32 %344 = OpConstant 2 
                              Private f32_4* %349 = OpVariable Private 
        UniformConstant read_only Texture2D* %350 = OpVariable UniformConstant 
                    UniformConstant sampler* %352 = OpVariable UniformConstant 
                                             %357 = OpTypeVector %26 3 
                                             %358 = OpTypePointer Private %357 
                             Private bool_3* %359 = OpVariable Private 
                              Private f32_2* %364 = OpVariable Private 
                                         f32 %367 = OpConstant 3.674022E-40 
                                       f32_2 %368 = OpConstantComposite %367 %367 
                                             %373 = OpTypePointer Private %12 
                              Private f32_3* %374 = OpVariable Private 
                                         f32 %382 = OpConstant 3.674022E-40 
                                       f32_2 %383 = OpConstantComposite %382 %382 
                              Private f32_2* %390 = OpVariable Private 
                                Private f32* %406 = OpVariable Private 
                                Private f32* %432 = OpVariable Private 
                               Private bool* %447 = OpVariable Private 
                                             %456 = OpTypePointer Function %6 
                               Private bool* %470 = OpVariable Private 
                                         f32 %471 = OpConstant 3.674022E-40 
                               Private bool* %476 = OpVariable Private 
                              Private f32_2* %493 = OpVariable Private 
                              Private f32_2* %517 = OpVariable Private 
                                         f32 %520 = OpConstant 3.674022E-40 
                                             %523 = OpTypePointer Private %88 
                                Private i32* %524 = OpVariable Private 
                               Private bool* %528 = OpVariable Private 
                              Private f32_3* %540 = OpVariable Private 
                                             %566 = OpTypeVector %88 4 
                                       i32_4 %568 = OpConstantComposite %147 %146 %344 %146 
                              Private f32_2* %577 = OpVariable Private 
                               Private bool* %593 = OpVariable Private 
                               Private bool* %625 = OpVariable Private 
                                Private f32* %630 = OpVariable Private 
                                             %671 = OpTypePointer Uniform %6 
                                       f32_2 %690 = OpConstantComposite %520 %520 
                                         f32 %696 = OpConstant 3.674022E-40 
                                       f32_2 %697 = OpConstantComposite %696 %696 
                                       f32_2 %703 = OpConstantComposite %233 %233 
                                             %759 = OpTypePointer Output %7 
                               Output f32_4* %760 = OpVariable Output 
                                Input f32_4* %762 = OpVariable Input 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32_4* %9 = OpVariable Function 
                             Function f32_2* %323 = OpVariable Function 
                               Function f32* %457 = OpVariable Function 
                               Function f32* %486 = OpVariable Function 
                               Function f32* %495 = OpVariable Function 
                             Function f32_2* %507 = OpVariable Function 
                               Function f32* %542 = OpVariable Function 
                               Function f32* %555 = OpVariable Function 
                               Function f32* %580 = OpVariable Function 
                               Function f32* %606 = OpVariable Function 
                               Function f32* %635 = OpVariable Function 
                               Function f32* %650 = OpVariable Function 
                               Function f32* %661 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                                   Input f32* %19 = OpAccessChain %11 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFDiv %15 %20 
                                          f32 %22 = OpCompositeExtract %14 0 
                                          f32 %23 = OpCompositeExtract %14 1 
                                          f32 %24 = OpCompositeExtract %14 2 
                                        f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                                      OpStore %9 %25 
                                        f32_4 %31 = OpLoad vs_TEXCOORD0 
                                        f32_4 %32 = OpVectorShuffle %31 %31 2 3 2 2 
                                        f32_4 %34 = OpLoad vs_TEXCOORD4 
                                        f32_4 %35 = OpVectorShuffle %34 %34 0 1 0 0 
                                       bool_4 %36 = OpFOrdGreaterThanEqual %32 %35 
                                       bool_2 %38 = OpVectorShuffle %36 %36 0 1 
                                       bool_4 %39 = OpLoad %29 
                                       bool_4 %40 = OpVectorShuffle %39 %38 4 5 2 3 
                                                      OpStore %29 %40 
                                        f32_4 %41 = OpLoad vs_TEXCOORD4 
                                        f32_4 %42 = OpVectorShuffle %41 %41 2 2 2 3 
                                        f32_4 %43 = OpLoad vs_TEXCOORD0 
                                        f32_4 %44 = OpVectorShuffle %43 %43 2 2 2 3 
                                       bool_4 %45 = OpFOrdGreaterThanEqual %42 %44 
                                       bool_2 %46 = OpVectorShuffle %45 %45 2 3 
                                       bool_4 %47 = OpLoad %29 
                                       bool_4 %48 = OpVectorShuffle %47 %46 0 1 4 5 
                                                      OpStore %29 %48 
                                Private bool* %53 = OpAccessChain %29 %51 
                                         bool %54 = OpLoad %53 
                                          f32 %56 = OpSelect %54 %15 %55 
                                 Private f32* %58 = OpAccessChain %50 %51 
                                                      OpStore %58 %56 
                                Private bool* %60 = OpAccessChain %29 %59 
                                         bool %61 = OpLoad %60 
                                          f32 %62 = OpSelect %61 %15 %55 
                                 Private f32* %63 = OpAccessChain %50 %59 
                                                      OpStore %63 %62 
                                Private bool* %65 = OpAccessChain %29 %64 
                                         bool %66 = OpLoad %65 
                                          f32 %67 = OpSelect %66 %15 %55 
                                 Private f32* %68 = OpAccessChain %50 %64 
                                                      OpStore %68 %67 
                                Private bool* %69 = OpAccessChain %29 %17 
                                         bool %70 = OpLoad %69 
                                          f32 %71 = OpSelect %70 %15 %55 
                                 Private f32* %72 = OpAccessChain %50 %17 
                                                      OpStore %72 %71 
                                        f32_4 %74 = OpLoad %50 
                                        f32_2 %75 = OpVectorShuffle %74 %74 2 3 
                                        f32_4 %76 = OpLoad %50 
                                        f32_2 %77 = OpVectorShuffle %76 %76 0 1 
                                        f32_2 %78 = OpFAdd %75 %77 
                                        f32_4 %79 = OpLoad %50 
                                        f32_4 %80 = OpVectorShuffle %79 %78 4 5 2 3 
                                                      OpStore %50 %80 
                                        f32_4 %83 = OpLoad %9 
                                        f32_4 %84 = OpVectorShuffle %83 %83 0 1 0 1 
                               Uniform f32_4* %91 = OpAccessChain %87 %89 
                                        f32_4 %92 = OpLoad %91 
                                        f32_4 %93 = OpVectorShuffle %92 %92 0 1 0 1 
                                       bool_4 %94 = OpFOrdGreaterThanEqual %84 %93 
                                       bool_2 %95 = OpVectorShuffle %94 %94 0 1 
                                                      OpStore %82 %95 
                                Private bool* %98 = OpAccessChain %82 %51 
                                         bool %99 = OpLoad %98 
                                         f32 %100 = OpSelect %99 %15 %55 
                                Private f32* %101 = OpAccessChain %97 %51 
                                                      OpStore %101 %100 
                               Private bool* %102 = OpAccessChain %82 %59 
                                        bool %103 = OpLoad %102 
                                         f32 %104 = OpSelect %103 %15 %55 
                                Private f32* %105 = OpAccessChain %97 %59 
                                                      OpStore %105 %104 
                                       f32_2 %106 = OpLoad %97 
                                       f32_4 %107 = OpLoad %50 
                                       f32_2 %108 = OpVectorShuffle %107 %107 0 1 
                                       f32_2 %109 = OpFAdd %106 %108 
                                       f32_4 %110 = OpLoad %50 
                                       f32_4 %111 = OpVectorShuffle %110 %109 4 5 2 3 
                                                      OpStore %50 %111 
                              Uniform f32_4* %112 = OpAccessChain %87 %89 
                                       f32_4 %113 = OpLoad %112 
                                       f32_4 %114 = OpVectorShuffle %113 %113 2 3 2 3 
                                       f32_4 %115 = OpLoad %9 
                                       f32_4 %116 = OpVectorShuffle %115 %115 0 1 0 1 
                                      bool_4 %117 = OpFOrdGreaterThanEqual %114 %116 
                                      bool_2 %118 = OpVectorShuffle %117 %117 0 1 
                                                      OpStore %82 %118 
                               Private bool* %119 = OpAccessChain %82 %51 
                                        bool %120 = OpLoad %119 
                                         f32 %121 = OpSelect %120 %15 %55 
                                Private f32* %122 = OpAccessChain %97 %51 
                                                      OpStore %122 %121 
                               Private bool* %123 = OpAccessChain %82 %59 
                                        bool %124 = OpLoad %123 
                                         f32 %125 = OpSelect %124 %15 %55 
                                Private f32* %126 = OpAccessChain %97 %59 
                                                      OpStore %126 %125 
                                       f32_2 %127 = OpLoad %97 
                                       f32_4 %128 = OpLoad %50 
                                       f32_2 %129 = OpVectorShuffle %128 %128 0 1 
                                       f32_2 %130 = OpFAdd %127 %129 
                                       f32_4 %131 = OpLoad %50 
                                       f32_4 %132 = OpVectorShuffle %131 %130 4 5 2 3 
                                                      OpStore %50 %132 
                                Private f32* %133 = OpAccessChain %50 %64 
                                                      OpStore %133 %15 
                                       f32_4 %134 = OpLoad %50 
                                       f32_3 %135 = OpVectorShuffle %134 %134 0 1 2 
                                         f32 %138 = OpDot %135 %137 
                                Private f32* %139 = OpAccessChain %50 %51 
                                                      OpStore %139 %138 
                                Private f32* %140 = OpAccessChain %50 %51 
                                         f32 %141 = OpLoad %140 
                                        bool %142 = OpFOrdLessThan %141 %55 
                               Private bool* %143 = OpAccessChain %29 %51 
                                                      OpStore %143 %142 
                               Private bool* %144 = OpAccessChain %29 %51 
                                        bool %145 = OpLoad %144 
                                         i32 %148 = OpSelect %145 %147 %146 
                                         i32 %150 = OpIMul %148 %149 
                                        bool %151 = OpINotEqual %150 %146 
                                                      OpSelectionMerge %153 None 
                                                      OpBranchConditional %151 %152 %153 
                                             %152 = OpLabel 
                                                      OpKill
                                             %153 = OpLabel 
                                  Input f32* %157 = OpAccessChain vs_TEXCOORD1 %59 
                                         f32 %158 = OpLoad %157 
                                         f32 %159 = OpFNegate %158 
                                Private f32* %160 = OpAccessChain %155 %51 
                                                      OpStore %160 %159 
                                Private f32* %161 = OpAccessChain %155 %51 
                                         f32 %162 = OpLoad %161 
                                         f32 %163 = OpExtInst %1 43 %162 %55 %15 
                                Private f32* %164 = OpAccessChain %155 %51 
                                                      OpStore %164 %163 
                                  Input f32* %166 = OpAccessChain vs_TEXCOORD1 %59 
                                         f32 %167 = OpLoad %166 
                                                      OpStore %165 %167 
                                         f32 %168 = OpLoad %165 
                                         f32 %169 = OpExtInst %1 43 %168 %55 %15 
                                                      OpStore %165 %169 
                         read_only Texture2D %174 = OpLoad %173 
                                     sampler %178 = OpLoad %177 
                  read_only Texture2DSampled %180 = OpSampledImage %174 %178 
                                       f32_4 %181 = OpLoad vs_TEXCOORD0 
                                       f32_2 %182 = OpVectorShuffle %181 %181 0 1 
                                       f32_4 %183 = OpImageSampleImplicitLod %180 %182 
                                                      OpStore %170 %183 
                                       f32_4 %184 = OpLoad %170 
                                       f32_4 %185 = OpLoad %155 
                                       f32_4 %186 = OpVectorShuffle %185 %185 0 0 0 0 
                                       f32_4 %187 = OpFMul %184 %186 
                                       f32_4 %188 = OpLoad vs_TEXCOORD1 
                                       f32_4 %189 = OpVectorShuffle %188 %188 3 3 3 3 
                                       f32_4 %190 = OpFAdd %187 %189 
                                                      OpStore %50 %190 
                         read_only Texture2D %192 = OpLoad %173 
                                     sampler %194 = OpLoad %193 
                  read_only Texture2DSampled %195 = OpSampledImage %192 %194 
                                       f32_4 %196 = OpLoad vs_TEXCOORD0 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_4 %198 = OpImageSampleImplicitLod %195 %197 
                                                      OpStore %191 %198 
                                       f32_4 %199 = OpLoad %191 
                                         f32 %200 = OpLoad %165 
                                       f32_4 %201 = OpCompositeConstruct %200 %200 %200 %200 
                                       f32_4 %202 = OpFMul %199 %201 
                                       f32_4 %203 = OpLoad %50 
                                       f32_4 %204 = OpFAdd %202 %203 
                                                      OpStore %50 %204 
                         read_only Texture2D %207 = OpLoad %206 
                                     sampler %209 = OpLoad %208 
                  read_only Texture2DSampled %210 = OpSampledImage %207 %209 
                                       f32_4 %211 = OpLoad vs_TEXCOORD0 
                                       f32_2 %212 = OpVectorShuffle %211 %211 0 1 
                                       f32_4 %213 = OpImageSampleImplicitLod %210 %212 
                                         f32 %214 = OpCompositeExtract %213 3 
                                Private f32* %215 = OpAccessChain %205 %51 
                                                      OpStore %215 %214 
                                Private f32* %217 = OpAccessChain %205 %51 
                                         f32 %218 = OpLoad %217 
                                         f32 %219 = OpDPdx %218 
                                                      OpStore %216 %219 
                                Private f32* %221 = OpAccessChain %205 %51 
                                         f32 %222 = OpLoad %221 
                                         f32 %223 = OpDPdy %222 
                                Private f32* %224 = OpAccessChain %220 %51 
                                                      OpStore %224 %223 
                                Private f32* %225 = OpAccessChain %220 %51 
                                         f32 %226 = OpLoad %225 
                                         f32 %227 = OpExtInst %1 4 %226 
                                         f32 %228 = OpLoad %216 
                                         f32 %229 = OpExtInst %1 4 %228 
                                         f32 %230 = OpFAdd %227 %229 
                                                      OpStore %216 %230 
                                         f32 %231 = OpLoad %216 
                                         f32 %232 = OpFNegate %231 
                                         f32 %234 = OpFAdd %232 %233 
                                Private f32* %235 = OpAccessChain %220 %51 
                                                      OpStore %235 %234 
                                         f32 %236 = OpLoad %216 
                                         f32 %237 = OpFAdd %236 %233 
                                Private f32* %238 = OpAccessChain %205 %59 
                                                      OpStore %238 %237 
                                       f32_2 %239 = OpLoad %220 
                                       f32_2 %240 = OpVectorShuffle %239 %239 0 0 
                                       f32_2 %241 = OpFNegate %240 
                                       f32_2 %242 = OpLoad %205 
                                       f32_2 %243 = OpFAdd %241 %242 
                                                      OpStore %205 %243 
                                Private f32* %244 = OpAccessChain %205 %59 
                                         f32 %245 = OpLoad %244 
                                         f32 %246 = OpFDiv %15 %245 
                                                      OpStore %216 %246 
                                         f32 %247 = OpLoad %216 
                                Private f32* %248 = OpAccessChain %205 %51 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFMul %247 %249 
                                Private f32* %251 = OpAccessChain %205 %51 
                                                      OpStore %251 %250 
                                Private f32* %252 = OpAccessChain %205 %51 
                                         f32 %253 = OpLoad %252 
                                         f32 %254 = OpExtInst %1 43 %253 %55 %15 
                                Private f32* %255 = OpAccessChain %205 %51 
                                                      OpStore %255 %254 
                                Private f32* %256 = OpAccessChain %205 %51 
                                         f32 %257 = OpLoad %256 
                                         f32 %259 = OpFMul %257 %258 
                                         f32 %261 = OpFAdd %259 %260 
                                                      OpStore %216 %261 
                                Private f32* %262 = OpAccessChain %205 %51 
                                         f32 %263 = OpLoad %262 
                                Private f32* %264 = OpAccessChain %205 %51 
                                         f32 %265 = OpLoad %264 
                                         f32 %266 = OpFMul %263 %265 
                                Private f32* %267 = OpAccessChain %205 %51 
                                                      OpStore %267 %266 
                                Private f32* %268 = OpAccessChain %205 %51 
                                         f32 %269 = OpLoad %268 
                                         f32 %270 = OpLoad %216 
                                         f32 %271 = OpFMul %269 %270 
                                Private f32* %272 = OpAccessChain %205 %51 
                                                      OpStore %272 %271 
                                       f32_4 %273 = OpLoad vs_TEXCOORD1 
                                       f32_3 %274 = OpVectorShuffle %273 %273 0 0 0 
                                       f32_4 %275 = OpLoad %155 
                                       f32_4 %276 = OpVectorShuffle %275 %274 4 5 6 3 
                                                      OpStore %155 %276 
                                Private f32* %277 = OpAccessChain %205 %51 
                                         f32 %278 = OpLoad %277 
                                  Input f32* %279 = OpAccessChain vs_TEXCOORD1 %51 
                                         f32 %280 = OpLoad %279 
                                         f32 %281 = OpFMul %278 %280 
                                Private f32* %282 = OpAccessChain %155 %17 
                                                      OpStore %282 %281 
                                       f32_4 %284 = OpLoad %50 
                                       f32_4 %285 = OpLoad %155 
                                       f32_4 %286 = OpFAdd %284 %285 
                                                      OpStore %283 %286 
                         read_only Texture2D %289 = OpLoad %288 
                                     sampler %291 = OpLoad %290 
                  read_only Texture2DSampled %292 = OpSampledImage %289 %291 
                                       f32_4 %293 = OpLoad vs_TEXCOORD0 
                                       f32_2 %294 = OpVectorShuffle %293 %293 0 1 
                                       f32_4 %295 = OpImageSampleImplicitLod %292 %294 
                                                      OpStore %287 %295 
                                       f32_4 %296 = OpLoad %287 
                                       f32_4 %297 = OpLoad vs_TEXCOORD1 
                                       f32_4 %298 = OpVectorShuffle %297 %297 2 2 2 2 
                                       f32_4 %299 = OpFMul %296 %298 
                                       f32_4 %300 = OpLoad %283 
                                       f32_4 %301 = OpFAdd %299 %300 
                                                      OpStore %50 %301 
                                       f32_3 %305 = OpLoad vs_TEXCOORD2 
                                       f32_4 %306 = OpVectorShuffle %305 %305 0 1 0 0 
                                      bool_4 %308 = OpFOrdEqual %306 %307 
                                      bool_2 %309 = OpVectorShuffle %308 %308 0 1 
                                                      OpStore %302 %309 
                               Private bool* %310 = OpAccessChain %302 %59 
                                        bool %311 = OpLoad %310 
                               Private bool* %312 = OpAccessChain %302 %51 
                                        bool %313 = OpLoad %312 
                                        bool %314 = OpLogicalOr %311 %313 
                               Private bool* %315 = OpAccessChain %302 %51 
                                                      OpStore %315 %314 
                               Private bool* %316 = OpAccessChain %302 %51 
                                        bool %317 = OpLoad %316 
                                                      OpSelectionMerge %319 None 
                                                      OpBranchConditional %317 %318 %757 
                                             %318 = OpLabel 
                               Private bool* %320 = OpAccessChain %302 %59 
                                        bool %321 = OpLoad %320 
                                                      OpSelectionMerge %325 None 
                                                      OpBranchConditional %321 %324 %329 
                                             %324 = OpLabel 
                              Uniform f32_4* %326 = OpAccessChain %87 %147 
                                       f32_4 %327 = OpLoad %326 
                                       f32_2 %328 = OpVectorShuffle %327 %327 0 1 
                                                      OpStore %323 %328 
                                                      OpBranch %325 
                                             %329 = OpLabel 
                              Uniform f32_4* %330 = OpAccessChain %87 %146 
                                       f32_4 %331 = OpLoad %330 
                                       f32_2 %332 = OpVectorShuffle %331 %331 0 1 
                                                      OpStore %323 %332 
                                                      OpBranch %325 
                                             %325 = OpLabel 
                                       f32_2 %333 = OpLoad %323 
                                                      OpStore %205 %333 
                                  Input f32* %335 = OpAccessChain vs_TEXCOORD2 %64 
                                         f32 %336 = OpLoad %335 
                                         f32 %337 = OpFAdd %336 %233 
                                Private f32* %338 = OpAccessChain %334 %59 
                                                      OpStore %338 %337 
                                Private f32* %339 = OpAccessChain %334 %51 
                                                      OpStore %339 %233 
                                Private f32* %341 = OpAccessChain %340 %59 
                                                      OpStore %341 %55 
                                       f32_4 %342 = OpLoad %334 
                                       f32_2 %343 = OpVectorShuffle %342 %342 0 1 
                              Uniform f32_4* %345 = OpAccessChain %87 %344 
                                       f32_4 %346 = OpLoad %345 
                                       f32_2 %347 = OpVectorShuffle %346 %346 0 1 
                                       f32_2 %348 = OpFMul %343 %347 
                                                      OpStore %220 %348 
                         read_only Texture2D %351 = OpLoad %350 
                                     sampler %353 = OpLoad %352 
                  read_only Texture2DSampled %354 = OpSampledImage %351 %353 
                                       f32_2 %355 = OpLoad %220 
                                       f32_4 %356 = OpImageSampleImplicitLod %354 %355 
                                                      OpStore %349 %356 
                                Private f32* %360 = OpAccessChain %349 %51 
                                         f32 %361 = OpLoad %360 
                                        bool %362 = OpFOrdLessThan %55 %361 
                               Private bool* %363 = OpAccessChain %359 %51 
                                                      OpStore %363 %362 
                                       f32_4 %365 = OpLoad %349 
                                       f32_2 %366 = OpVectorShuffle %365 %365 2 3 
                                       f32_2 %369 = OpFAdd %366 %368 
                                                      OpStore %364 %369 
                                       f32_2 %370 = OpLoad %364 
                                       f32_2 %371 = OpLoad %364 
                                       f32_2 %372 = OpFAdd %370 %371 
                                                      OpStore %364 %372 
                                       f32_4 %375 = OpLoad vs_TEXCOORD0 
                                       f32_2 %376 = OpVectorShuffle %375 %375 0 1 
                                       f32_2 %377 = OpFAdd %376 %368 
                                       f32_3 %378 = OpLoad %374 
                                       f32_3 %379 = OpVectorShuffle %378 %377 3 4 2 
                                                      OpStore %374 %379 
                                       f32_3 %380 = OpLoad %374 
                                       f32_2 %381 = OpVectorShuffle %380 %380 0 1 
                                       f32_2 %384 = OpFMul %381 %383 
                                       f32_2 %385 = OpLoad %364 
                                       f32_2 %386 = OpFNegate %385 
                                       f32_2 %387 = OpFAdd %384 %386 
                                       f32_3 %388 = OpLoad %374 
                                       f32_3 %389 = OpVectorShuffle %388 %387 3 4 2 
                                                      OpStore %374 %389 
                                       f32_3 %391 = OpLoad %374 
                                       f32_2 %392 = OpVectorShuffle %391 %391 0 1 
                                       f32_3 %393 = OpLoad %374 
                                       f32_2 %394 = OpVectorShuffle %393 %393 0 1 
                                         f32 %395 = OpDot %392 %394 
                                Private f32* %396 = OpAccessChain %390 %51 
                                                      OpStore %396 %395 
                                Private f32* %397 = OpAccessChain %390 %51 
                                         f32 %398 = OpLoad %397 
                                         f32 %399 = OpExtInst %1 32 %398 
                                Private f32* %400 = OpAccessChain %390 %51 
                                                      OpStore %400 %399 
                                       f32_2 %401 = OpLoad %390 
                                       f32_2 %402 = OpVectorShuffle %401 %401 0 0 
                                       f32_3 %403 = OpLoad %374 
                                       f32_2 %404 = OpVectorShuffle %403 %403 0 1 
                                       f32_2 %405 = OpFMul %402 %404 
                                                      OpStore %390 %405 
                                       f32_2 %407 = OpLoad %364 
                                       f32_2 %408 = OpFNegate %407 
                                       f32_2 %409 = OpLoad %390 
                                         f32 %410 = OpDot %408 %409 
                                                      OpStore %406 %410 
                                       f32_2 %411 = OpLoad %364 
                                       f32_2 %412 = OpLoad %364 
                                         f32 %413 = OpDot %411 %412 
                                Private f32* %414 = OpAccessChain %364 %51 
                                                      OpStore %414 %413 
                                         f32 %415 = OpLoad %406 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpLoad %406 
                                         f32 %418 = OpFMul %416 %417 
                                Private f32* %419 = OpAccessChain %364 %51 
                                         f32 %420 = OpLoad %419 
                                         f32 %421 = OpFAdd %418 %420 
                                Private f32* %422 = OpAccessChain %364 %51 
                                                      OpStore %422 %421 
                                Private f32* %423 = OpAccessChain %364 %51 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFNegate %424 
                                         f32 %426 = OpFAdd %425 %15 
                                Private f32* %427 = OpAccessChain %364 %51 
                                                      OpStore %427 %426 
                                Private f32* %428 = OpAccessChain %364 %51 
                                         f32 %429 = OpLoad %428 
                                         f32 %430 = OpExtInst %1 31 %429 
                                Private f32* %431 = OpAccessChain %364 %51 
                                                      OpStore %431 %430 
                                Private f32* %433 = OpAccessChain %364 %51 
                                         f32 %434 = OpLoad %433 
                                         f32 %435 = OpFNegate %434 
                                         f32 %436 = OpLoad %406 
                                         f32 %437 = OpFAdd %435 %436 
                                                      OpStore %432 %437 
                                Private f32* %438 = OpAccessChain %364 %51 
                                         f32 %439 = OpLoad %438 
                                         f32 %440 = OpLoad %406 
                                         f32 %441 = OpFAdd %439 %440 
                                Private f32* %442 = OpAccessChain %364 %51 
                                                      OpStore %442 %441 
                                Private f32* %443 = OpAccessChain %364 %51 
                                         f32 %444 = OpLoad %443 
                                         f32 %445 = OpLoad %432 
                                         f32 %446 = OpExtInst %1 37 %444 %445 
                                                      OpStore %406 %446 
                                         f32 %448 = OpLoad %406 
                                        bool %449 = OpFOrdLessThan %448 %55 
                                                      OpStore %447 %449 
                                Private f32* %450 = OpAccessChain %364 %51 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpLoad %432 
                                         f32 %453 = OpExtInst %1 40 %451 %452 
                                Private f32* %454 = OpAccessChain %364 %51 
                                                      OpStore %454 %453 
                                        bool %455 = OpLoad %447 
                                                      OpSelectionMerge %459 None 
                                                      OpBranchConditional %455 %458 %462 
                                             %458 = OpLabel 
                                Private f32* %460 = OpAccessChain %364 %51 
                                         f32 %461 = OpLoad %460 
                                                      OpStore %457 %461 
                                                      OpBranch %459 
                                             %462 = OpLabel 
                                         f32 %463 = OpLoad %406 
                                                      OpStore %457 %463 
                                                      OpBranch %459 
                                             %459 = OpLabel 
                                         f32 %464 = OpLoad %457 
                                Private f32* %465 = OpAccessChain %364 %51 
                                                      OpStore %465 %464 
                                       f32_2 %466 = OpLoad %364 
                                       f32_2 %467 = OpVectorShuffle %466 %466 0 0 
                                       f32_2 %468 = OpLoad %390 
                                       f32_2 %469 = OpFMul %467 %468 
                                                      OpStore %364 %469 
                                Private f32* %472 = OpAccessChain %364 %51 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpExtInst %1 4 %473 
                                        bool %475 = OpFOrdGreaterThanEqual %471 %474 
                                                      OpStore %470 %475 
                                Private f32* %477 = OpAccessChain %364 %59 
                                         f32 %478 = OpLoad %477 
                                         f32 %479 = OpExtInst %1 4 %478 
                                        bool %480 = OpFOrdLessThan %471 %479 
                                                      OpStore %476 %480 
                                       f32_3 %481 = OpLoad %374 
                                       f32_2 %482 = OpVectorShuffle %481 %481 0 1 
                                       f32_2 %483 = OpLoad %364 
                                       f32_2 %484 = OpFDiv %482 %483 
                                                      OpStore %364 %484 
                                        bool %485 = OpLoad %476 
                                                      OpSelectionMerge %488 None 
                                                      OpBranchConditional %485 %487 %491 
                                             %487 = OpLabel 
                                Private f32* %489 = OpAccessChain %364 %59 
                                         f32 %490 = OpLoad %489 
                                                      OpStore %486 %490 
                                                      OpBranch %488 
                                             %491 = OpLabel 
                                                      OpStore %486 %55 
                                                      OpBranch %488 
                                             %488 = OpLabel 
                                         f32 %492 = OpLoad %486 
                                                      OpStore %432 %492 
                                        bool %494 = OpLoad %470 
                                                      OpSelectionMerge %497 None 
                                                      OpBranchConditional %494 %496 %499 
                                             %496 = OpLabel 
                                         f32 %498 = OpLoad %432 
                                                      OpStore %495 %498 
                                                      OpBranch %497 
                                             %499 = OpLabel 
                                Private f32* %500 = OpAccessChain %364 %51 
                                         f32 %501 = OpLoad %500 
                                                      OpStore %495 %501 
                                                      OpBranch %497 
                                             %497 = OpLabel 
                                         f32 %502 = OpLoad %495 
                                Private f32* %503 = OpAccessChain %493 %51 
                                                      OpStore %503 %502 
                                Private f32* %504 = OpAccessChain %493 %59 
                                                      OpStore %504 %55 
                               Private bool* %505 = OpAccessChain %359 %51 
                                        bool %506 = OpLoad %505 
                                                      OpSelectionMerge %509 None 
                                                      OpBranchConditional %506 %508 %511 
                                             %508 = OpLabel 
                                       f32_2 %510 = OpLoad %493 
                                                      OpStore %507 %510 
                                                      OpBranch %509 
                                             %511 = OpLabel 
                                       f32_4 %512 = OpLoad vs_TEXCOORD0 
                                       f32_2 %513 = OpVectorShuffle %512 %512 0 1 
                                                      OpStore %507 %513 
                                                      OpBranch %509 
                                             %509 = OpLabel 
                                       f32_2 %514 = OpLoad %507 
                                       f32_3 %515 = OpLoad %374 
                                       f32_3 %516 = OpVectorShuffle %515 %514 0 3 4 
                                                      OpStore %374 %516 
                                Private f32* %518 = OpAccessChain %349 %59 
                                         f32 %519 = OpLoad %518 
                                         f32 %521 = OpFMul %519 %520 
                                Private f32* %522 = OpAccessChain %517 %51 
                                                      OpStore %522 %521 
                                Private f32* %525 = OpAccessChain %517 %51 
                                         f32 %526 = OpLoad %525 
                                         i32 %527 = OpConvertFToS %526 
                                                      OpStore %524 %527 
                                Private f32* %529 = OpAccessChain %374 %59 
                                         f32 %530 = OpLoad %529 
                                Private f32* %531 = OpAccessChain %374 %59 
                                         f32 %532 = OpLoad %531 
                                         f32 %533 = OpFNegate %532 
                                        bool %534 = OpFOrdGreaterThanEqual %530 %533 
                                                      OpStore %528 %534 
                                Private f32* %535 = OpAccessChain %374 %59 
                                         f32 %536 = OpLoad %535 
                                         f32 %537 = OpExtInst %1 4 %536 
                                         f32 %538 = OpExtInst %1 10 %537 
                                Private f32* %539 = OpAccessChain %364 %51 
                                                      OpStore %539 %538 
                                        bool %541 = OpLoad %528 
                                                      OpSelectionMerge %544 None 
                                                      OpBranchConditional %541 %543 %547 
                                             %543 = OpLabel 
                                Private f32* %545 = OpAccessChain %364 %51 
                                         f32 %546 = OpLoad %545 
                                                      OpStore %542 %546 
                                                      OpBranch %544 
                                             %547 = OpLabel 
                                Private f32* %548 = OpAccessChain %364 %51 
                                         f32 %549 = OpLoad %548 
                                         f32 %550 = OpFNegate %549 
                                                      OpStore %542 %550 
                                                      OpBranch %544 
                                             %544 = OpLabel 
                                         f32 %551 = OpLoad %542 
                                Private f32* %552 = OpAccessChain %540 %51 
                                                      OpStore %552 %551 
                                         i32 %553 = OpLoad %524 
                                        bool %554 = OpINotEqual %553 %146 
                                                      OpSelectionMerge %557 None 
                                                      OpBranchConditional %554 %556 %560 
                                             %556 = OpLabel 
                                Private f32* %558 = OpAccessChain %374 %59 
                                         f32 %559 = OpLoad %558 
                                                      OpStore %555 %559 
                                                      OpBranch %557 
                                             %560 = OpLabel 
                                Private f32* %561 = OpAccessChain %540 %51 
                                         f32 %562 = OpLoad %561 
                                                      OpStore %555 %562 
                                                      OpBranch %557 
                                             %557 = OpLabel 
                                         f32 %563 = OpLoad %555 
                                Private f32* %564 = OpAccessChain %540 %51 
                                                      OpStore %564 %563 
                                         i32 %565 = OpLoad %524 
                                       i32_4 %567 = OpCompositeConstruct %565 %565 %565 %565 
                                      bool_4 %569 = OpIEqual %567 %568 
                                      bool_2 %570 = OpVectorShuffle %569 %569 0 2 
                                      bool_3 %571 = OpLoad %359 
                                      bool_3 %572 = OpVectorShuffle %571 %570 3 1 4 
                                                      OpStore %359 %572 
                                Private f32* %573 = OpAccessChain %540 %51 
                                         f32 %574 = OpLoad %573 
                                                      OpStore %432 %574 
                                         f32 %575 = OpLoad %432 
                                         f32 %576 = OpExtInst %1 43 %575 %55 %15 
                                                      OpStore %432 %576 
                               Private bool* %578 = OpAccessChain %359 %51 
                                        bool %579 = OpLoad %578 
                                                      OpSelectionMerge %582 None 
                                                      OpBranchConditional %579 %581 %584 
                                             %581 = OpLabel 
                                         f32 %583 = OpLoad %432 
                                                      OpStore %580 %583 
                                                      OpBranch %582 
                                             %584 = OpLabel 
                                Private f32* %585 = OpAccessChain %540 %51 
                                         f32 %586 = OpLoad %585 
                                                      OpStore %580 %586 
                                                      OpBranch %582 
                                             %582 = OpLabel 
                                         f32 %587 = OpLoad %580 
                                Private f32* %588 = OpAccessChain %577 %51 
                                                      OpStore %588 %587 
                                Private f32* %589 = OpAccessChain %577 %51 
                                         f32 %590 = OpLoad %589 
                                         f32 %591 = OpFMul %590 %233 
                                Private f32* %592 = OpAccessChain %540 %51 
                                                      OpStore %592 %591 
                                Private f32* %594 = OpAccessChain %540 %51 
                                         f32 %595 = OpLoad %594 
                                Private f32* %596 = OpAccessChain %540 %51 
                                         f32 %597 = OpLoad %596 
                                         f32 %598 = OpFNegate %597 
                                        bool %599 = OpFOrdGreaterThanEqual %595 %598 
                                                      OpStore %593 %599 
                                Private f32* %600 = OpAccessChain %540 %51 
                                         f32 %601 = OpLoad %600 
                                         f32 %602 = OpExtInst %1 4 %601 
                                         f32 %603 = OpExtInst %1 10 %602 
                                Private f32* %604 = OpAccessChain %540 %51 
                                                      OpStore %604 %603 
                                        bool %605 = OpLoad %593 
                                                      OpSelectionMerge %608 None 
                                                      OpBranchConditional %605 %607 %611 
                                             %607 = OpLabel 
                                Private f32* %609 = OpAccessChain %540 %51 
                                         f32 %610 = OpLoad %609 
                                                      OpStore %606 %610 
                                                      OpBranch %608 
                                             %611 = OpLabel 
                                Private f32* %612 = OpAccessChain %540 %51 
                                         f32 %613 = OpLoad %612 
                                         f32 %614 = OpFNegate %613 
                                                      OpStore %606 %614 
                                                      OpBranch %608 
                                             %608 = OpLabel 
                                         f32 %615 = OpLoad %606 
                                Private f32* %616 = OpAccessChain %540 %51 
                                                      OpStore %616 %615 
                                Private f32* %617 = OpAccessChain %540 %51 
                                         f32 %618 = OpLoad %617 
                                Private f32* %619 = OpAccessChain %540 %51 
                                         f32 %620 = OpLoad %619 
                                         f32 %621 = OpFAdd %618 %620 
                                                      OpStore %432 %621 
                                Private f32* %622 = OpAccessChain %540 %51 
                                         f32 %623 = OpLoad %622 
                                        bool %624 = OpFOrdLessThan %233 %623 
                                                      OpStore %528 %624 
                                         f32 %626 = OpLoad %432 
                                         f32 %627 = OpLoad %432 
                                         f32 %628 = OpFNegate %627 
                                        bool %629 = OpFOrdGreaterThanEqual %626 %628 
                                                      OpStore %625 %629 
                                         f32 %631 = OpLoad %432 
                                         f32 %632 = OpExtInst %1 4 %631 
                                         f32 %633 = OpExtInst %1 10 %632 
                                                      OpStore %630 %633 
                                        bool %634 = OpLoad %625 
                                                      OpSelectionMerge %637 None 
                                                      OpBranchConditional %634 %636 %639 
                                             %636 = OpLabel 
                                         f32 %638 = OpLoad %630 
                                                      OpStore %635 %638 
                                                      OpBranch %637 
                                             %639 = OpLabel 
                                         f32 %640 = OpLoad %630 
                                         f32 %641 = OpFNegate %640 
                                                      OpStore %635 %641 
                                                      OpBranch %637 
                                             %637 = OpLabel 
                                         f32 %642 = OpLoad %635 
                                Private f32* %643 = OpAccessChain %493 %51 
                                                      OpStore %643 %642 
                                Private f32* %644 = OpAccessChain %493 %51 
                                         f32 %645 = OpLoad %644 
                                         f32 %646 = OpFNegate %645 
                                         f32 %647 = OpFAdd %646 %15 
                                Private f32* %648 = OpAccessChain %493 %51 
                                                      OpStore %648 %647 
                                        bool %649 = OpLoad %528 
                                                      OpSelectionMerge %652 None 
                                                      OpBranchConditional %649 %651 %655 
                                             %651 = OpLabel 
                                Private f32* %653 = OpAccessChain %493 %51 
                                         f32 %654 = OpLoad %653 
                                                      OpStore %650 %654 
                                                      OpBranch %652 
                                             %655 = OpLabel 
                                         f32 %656 = OpLoad %432 
                                                      OpStore %650 %656 
                                                      OpBranch %652 
                                             %652 = OpLabel 
                                         f32 %657 = OpLoad %650 
                                Private f32* %658 = OpAccessChain %540 %51 
                                                      OpStore %658 %657 
                               Private bool* %659 = OpAccessChain %359 %64 
                                        bool %660 = OpLoad %659 
                                                      OpSelectionMerge %663 None 
                                                      OpBranchConditional %660 %662 %666 
                                             %662 = OpLabel 
                                Private f32* %664 = OpAccessChain %540 %51 
                                         f32 %665 = OpLoad %664 
                                                      OpStore %661 %665 
                                                      OpBranch %663 
                                             %666 = OpLabel 
                                Private f32* %667 = OpAccessChain %577 %51 
                                         f32 %668 = OpLoad %667 
                                                      OpStore %661 %668 
                                                      OpBranch %663 
                                             %663 = OpLabel 
                                         f32 %669 = OpLoad %661 
                                Private f32* %670 = OpAccessChain %374 %51 
                                                      OpStore %670 %669 
                                Uniform f32* %672 = OpAccessChain %87 %344 %51 
                                         f32 %673 = OpLoad %672 
                                Private f32* %674 = OpAccessChain %340 %51 
                                                      OpStore %674 %673 
                                       f32_4 %675 = OpLoad %334 
                                       f32_2 %676 = OpVectorShuffle %675 %675 0 1 
                              Uniform f32_4* %677 = OpAccessChain %87 %344 
                                       f32_4 %678 = OpLoad %677 
                                       f32_2 %679 = OpVectorShuffle %678 %678 0 1 
                                       f32_2 %680 = OpFMul %676 %679 
                                       f32_2 %681 = OpLoad %340 
                                       f32_2 %682 = OpFAdd %680 %681 
                                                      OpStore %577 %682 
                         read_only Texture2D %683 = OpLoad %350 
                                     sampler %684 = OpLoad %352 
                  read_only Texture2DSampled %685 = OpSampledImage %683 %684 
                                       f32_2 %686 = OpLoad %577 
                                       f32_4 %687 = OpImageSampleImplicitLod %685 %686 
                                                      OpStore %349 %687 
                                       f32_4 %688 = OpLoad %349 
                                       f32_2 %689 = OpVectorShuffle %688 %688 1 3 
                                       f32_2 %691 = OpFMul %689 %690 
                                       f32_3 %692 = OpLoad %540 
                                       f32_3 %693 = OpVectorShuffle %692 %691 3 1 4 
                                                      OpStore %540 %693 
                                       f32_4 %694 = OpLoad %349 
                                       f32_2 %695 = OpVectorShuffle %694 %694 0 2 
                                       f32_2 %698 = OpFMul %695 %697 
                                       f32_3 %699 = OpLoad %540 
                                       f32_2 %700 = OpVectorShuffle %699 %699 0 2 
                                       f32_2 %701 = OpFAdd %698 %700 
                                                      OpStore %517 %701 
                                       f32_2 %702 = OpLoad %517 
                                       f32_2 %704 = OpFAdd %702 %703 
                                                      OpStore %577 %704 
                                       f32_2 %705 = OpLoad %340 
                                       f32_2 %706 = OpFMul %705 %383 
                                       f32_2 %707 = OpLoad %220 
                                       f32_2 %708 = OpFAdd %706 %707 
                                                      OpStore %220 %708 
                         read_only Texture2D %709 = OpLoad %350 
                                     sampler %710 = OpLoad %352 
                  read_only Texture2DSampled %711 = OpSampledImage %709 %710 
                                       f32_2 %712 = OpLoad %220 
                                       f32_4 %713 = OpImageSampleImplicitLod %711 %712 
                                                      OpStore %287 %713 
                                       f32_4 %714 = OpLoad %287 
                                       f32_2 %715 = OpVectorShuffle %714 %714 1 3 
                                       f32_2 %716 = OpFMul %715 %690 
                                                      OpStore %220 %716 
                                       f32_4 %717 = OpLoad %287 
                                       f32_2 %718 = OpVectorShuffle %717 %717 0 2 
                                       f32_2 %719 = OpFMul %718 %697 
                                       f32_2 %720 = OpLoad %220 
                                       f32_2 %721 = OpFAdd %719 %720 
                                                      OpStore %517 %721 
                                       f32_2 %722 = OpLoad %205 
                                       f32_2 %723 = OpLoad %577 
                                       f32_2 %724 = OpFMul %722 %723 
                                                      OpStore %220 %724 
                                       f32_2 %725 = OpLoad %205 
                                       f32_2 %726 = OpLoad %517 
                                       f32_2 %727 = OpFMul %725 %726 
                                                      OpStore %205 %727 
                                       f32_3 %728 = OpLoad %374 
                                       f32_2 %729 = OpVectorShuffle %728 %728 0 2 
                                       f32_2 %730 = OpLoad %205 
                                       f32_2 %731 = OpFMul %729 %730 
                                       f32_2 %732 = OpLoad %220 
                                       f32_2 %733 = OpFAdd %731 %732 
                                                      OpStore %205 %733 
                         read_only Texture2D %734 = OpLoad %173 
                                     sampler %735 = OpLoad %193 
                  read_only Texture2DSampled %736 = OpSampledImage %734 %735 
                                       f32_2 %737 = OpLoad %205 
                                       f32_4 %738 = OpImageSampleImplicitLod %736 %737 
                                                      OpStore %287 %738 
                                       f32_4 %739 = OpLoad %287 
                                       f32_3 %740 = OpLoad vs_TEXCOORD2 
                                       f32_4 %741 = OpVectorShuffle %740 %740 0 0 0 0 
                                       f32_4 %742 = OpFMul %739 %741 
                                       f32_4 %743 = OpLoad %50 
                                       f32_4 %744 = OpFAdd %742 %743 
                                                      OpStore %334 %744 
                         read_only Texture2D %745 = OpLoad %288 
                                     sampler %746 = OpLoad %290 
                  read_only Texture2DSampled %747 = OpSampledImage %745 %746 
                                       f32_2 %748 = OpLoad %205 
                                       f32_4 %749 = OpImageSampleImplicitLod %747 %748 
                                                      OpStore %191 %749 
                                       f32_4 %750 = OpLoad %191 
                                       f32_3 %751 = OpLoad vs_TEXCOORD2 
                                       f32_4 %752 = OpVectorShuffle %751 %751 1 1 1 1 
                                       f32_4 %753 = OpFMul %750 %752 
                                       f32_4 %754 = OpLoad %334 
                                       f32_4 %755 = OpFAdd %753 %754 
                                                      OpStore %334 %755 
                                       f32_4 %756 = OpLoad %334 
                                                      OpStore %155 %756 
                                                      OpBranch %319 
                                             %757 = OpLabel 
                                       f32_4 %758 = OpLoad %50 
                                                      OpStore %155 %758 
                                                      OpBranch %319 
                                             %319 = OpLabel 
                                       f32_4 %761 = OpLoad %155 
                                       f32_4 %763 = OpLoad %762 
                                       f32_4 %764 = OpFMul %761 %763 
                                                      OpStore %760 %764 
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
 Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZTest GEqual
  ZWrite Off
  Cull Off
  Stencil {
   Ref 255
   CompFront Disabled
   PassFront Keep
   FailFront Keep
   ZFailFront Keep
   CompBack Disabled
   PassBack Keep
   FailBack Keep
   ZFailBack Keep
  }
  GpuProgramID 98481
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec3 vs_TEXCOORD2;
flat out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec3 u_xlat11;
float u_xlat14;
vec2 u_xlat15;
bool u_xlatb15;
vec2 u_xlat16;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xyz = in_TEXCOORD2.xzz * vec3(765.0, 255.0, 8160.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    u_xlat3.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.x ? float(1.0) : 0.0;
;
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlat11.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat11.y = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat11.z = u_xlatb4.w ? float(1.0) : 0.0;
;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb21 = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat5.x = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat5.y = u_xlat11.z + u_xlat11.y;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat11.x + u_xlat21;
    u_xlat21 = u_xlat3.x + u_xlat21;
    u_xlat21 = u_xlat3.y + u_xlat21;
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat5.w = (-u_xlat21) + 1.0;
    u_xlatb21 = u_xlatb2.w || u_xlatb4.x;
    u_xlatb21 = u_xlatb2.z || u_xlatb21;
    if(u_xlatb21){
        u_xlat2.x = dot(_Transforms[u_xlati0].xy, in_TEXCOORD0.xy);
        u_xlat2.y = dot(_Transforms[u_xlati1.x].xy, in_TEXCOORD0.xy);
        u_xlat15.xy = u_xlat2.xy * _1PixelClipInvView.zw;
        u_xlat4.xz = max(abs(u_xlat15.xy), vec2(1.0, 1.0));
        u_xlat6.xy = roundEven(u_xlat4.xz);
        u_xlat4.xz = max(u_xlat4.xz, u_xlat6.xy);
        u_xlat16.x = (u_xlatb2.w) ? u_xlat4.x : u_xlat6.x;
        u_xlat16.y = (u_xlatb2.z) ? u_xlat4.z : u_xlat6.y;
        u_xlat15.xy = abs(u_xlat15.xy) + vec2(9.99999997e-07, 9.99999997e-07);
        u_xlat15.xy = u_xlat16.xy / u_xlat15.xy;
        u_xlat15.xy = max(u_xlat15.xy, vec2(0.00999999978, 0.00999999978));
        u_xlat15.xy = min(u_xlat15.xy, vec2(100.0, 100.0));
        u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
        u_xlat15.xy = u_xlat2.xy * u_xlat15.xy;
    } else {
        u_xlat15.x = float(0.0);
        u_xlat15.y = float(0.0);
    }
    u_xlat16.x = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat16.y = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat1.xy = u_xlat15.xy + u_xlat16.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat6 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat6;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat6;
    u_xlat0.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat5.y==1.0);
#else
    u_xlatb15 = u_xlat5.y==1.0;
#endif
    u_xlat2.xy = u_xlat0.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (bool(u_xlatb15)) ? u_xlat2.xy : u_xlat0.xw;
    u_xlat3.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.z>=(-u_xlat0.z));
#else
    u_xlatb0 = u_xlat0.z>=(-u_xlat0.z);
#endif
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat7 = u_xlat0.z * u_xlat0.y;
    u_xlat7 = fract(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat7 = in_TEXCOORD2.z * 255.0 + (-u_xlat0.x);
    u_xlat14 = in_TEXCOORD3.y * 2040.0;
    u_xlat15.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.x;
    u_xlat15.y = u_xlat7 * 0.03125 + u_xlat14;
    u_xlat0.xy = u_xlat15.xy + vec2(0.5, 0.5);
    u_xlat0.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    u_xlat5.z = u_xlat11.x;
    vs_TEXCOORD1 = u_xlat5;
    u_xlat0.x = in_TEXCOORD2.y * 255.0;
    u_xlat0.y = 0.0;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD2.xyz = u_xlat3.xyz;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _PixelClipRect;
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(4) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec3 vs_TEXCOORD2;
flat in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
uint u_xlatu0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec2 u_xlat16_6;
vec2 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat16;
vec2 u_xlat17;
bool u_xlatb17;
float u_xlat18;
bool u_xlatb19;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatu0 = uint(vs_TEXCOORD3.x);
    u_xlatb0.yz = greaterThanEqual(vs_TEXCOORD0.zzwz, _ClipRects[int(u_xlatu0)].xxyx).yz;
    u_xlatb0.xw = greaterThanEqual(_ClipRects[int(u_xlatu0)].zzzw, vs_TEXCOORD0.zzzw).xw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xw + u_xlat0.yz;
    u_xlatb14.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_0 = texture(_ShaderInfoTex, vs_TEXCOORD3.zw).w;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat7.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat14.x = dFdx(u_xlat7.x);
    u_xlat21 = dFdy(u_xlat7.x);
    u_xlat14.x = abs(u_xlat21) + abs(u_xlat14.x);
    u_xlat21 = (-u_xlat14.x) + 0.5;
    u_xlat7.y = u_xlat14.x + 0.5;
    u_xlat7.xy = (-vec2(u_xlat21)) + u_xlat7.xy;
    u_xlat14.x = float(1.0) / u_xlat7.y;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat16_2.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_2.w = u_xlat7.x * vs_TEXCOORD1.x;
    u_xlat16_1 = u_xlat1 + u_xlat16_2;
    u_xlat16_2 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vs_TEXCOORD1.zzzz + u_xlat16_1;
    u_xlatb7.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat7.xy = (u_xlatb7.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat2.y = vs_TEXCOORD2.z + 0.5;
        u_xlat2.x = float(0.5);
        u_xlat16.y = float(0.0);
        u_xlat3.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<u_xlat16_4.x);
#else
        u_xlatb21 = 0.0<u_xlat16_4.x;
#endif
        u_xlat17.xy = u_xlat16_4.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xz = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xz = u_xlat4.xz * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat25 = dot(u_xlat4.xz, u_xlat4.xz);
        u_xlat25 = inversesqrt(u_xlat25);
        u_xlat5.xy = vec2(u_xlat25) * u_xlat4.xz;
        u_xlat25 = dot((-u_xlat17.xy), u_xlat5.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat25) * u_xlat25 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat25;
        u_xlat17.x = u_xlat17.x + u_xlat25;
        u_xlat25 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(u_xlat25<0.0);
#else
        u_xlatb19 = u_xlat25<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb19) ? u_xlat17.x : u_xlat25;
        u_xlat17.xy = u_xlat17.xx * u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb25 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb5 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xz / u_xlat17.xy;
        u_xlat24 = u_xlatb5 ? u_xlat17.y : float(0.0);
        u_xlat12.x = (u_xlatb25) ? u_xlat24 : u_xlat17.x;
        u_xlat12.y = 0.0;
        u_xlat5.yz = (bool(u_xlatb21)) ? u_xlat12.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_4.y * 255.0;
        u_xlati21 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(u_xlat5.y>=(-u_xlat5.y));
#else
        u_xlatb17 = u_xlat5.y>=(-u_xlat5.y);
#endif
        u_xlat24 = fract(abs(u_xlat5.y));
        u_xlat17.x = (u_xlatb17) ? u_xlat24 : (-u_xlat24);
        u_xlat17.x = (u_xlati21 != 0) ? u_xlat5.y : u_xlat17.x;
        u_xlatb4.xy = equal(ivec4(u_xlati21), ivec4(1, 2, 0, 0)).xy;
        u_xlat21 = u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
        u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
        u_xlat21 = (u_xlatb4.x) ? u_xlat21 : u_xlat17.x;
        u_xlat17.x = u_xlat21 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat17.x>=(-u_xlat17.x));
#else
        u_xlatb24 = u_xlat17.x>=(-u_xlat17.x);
#endif
        u_xlat17.x = fract(abs(u_xlat17.x));
        u_xlat17.x = (u_xlatb24) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat24 = u_xlat17.x + u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(0.5<u_xlat17.x);
#else
        u_xlatb17 = 0.5<u_xlat17.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb4.x = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb4.x = u_xlat24>=(-u_xlat24);
#endif
        u_xlat18 = fract(abs(u_xlat24));
        u_xlat4.x = (u_xlatb4.x) ? u_xlat18 : (-u_xlat18);
        u_xlat4.x = (-u_xlat4.x) + 1.0;
        u_xlat17.x = (u_xlatb17) ? u_xlat4.x : u_xlat24;
        u_xlat5.x = (u_xlatb4.y) ? u_xlat17.x : u_xlat21;
        u_xlat16.x = _GradientSettingsTex_TexelSize.x;
        u_xlat17.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy + u_xlat16.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat17.xy);
        u_xlat17.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat17.xy;
        u_xlat17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat3.xy = u_xlat16.xy * vec2(2.0, 2.0) + u_xlat3.xy;
        u_xlat16_2 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat3.xy = u_xlat16_2.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_2.xz * vec2(65025.0, 65025.0) + u_xlat3.xy;
        u_xlat3.xy = u_xlat7.xy * u_xlat17.xy;
        u_xlat7.xy = u_xlat7.xy * u_xlat16_6.xy;
        u_xlat7.xy = u_xlat5.xz * u_xlat7.xy + u_xlat3.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_2 * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat16_3 = texture(_CustomTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_3 * vs_TEXCOORD2.yyyy + u_xlat2;
        u_xlat16_2 = u_xlat2;
    } else {
        u_xlat16_2 = u_xlat1;
    }
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.w;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec3 vs_TEXCOORD2;
flat out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec3 u_xlat11;
float u_xlat14;
vec2 u_xlat15;
bool u_xlatb15;
vec2 u_xlat16;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xyz = in_TEXCOORD2.xzz * vec3(765.0, 255.0, 8160.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    u_xlat3.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.x ? float(1.0) : 0.0;
;
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlat11.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat11.y = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat11.z = u_xlatb4.w ? float(1.0) : 0.0;
;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb21 = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat5.x = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat5.y = u_xlat11.z + u_xlat11.y;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat11.x + u_xlat21;
    u_xlat21 = u_xlat3.x + u_xlat21;
    u_xlat21 = u_xlat3.y + u_xlat21;
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat5.w = (-u_xlat21) + 1.0;
    u_xlatb21 = u_xlatb2.w || u_xlatb4.x;
    u_xlatb21 = u_xlatb2.z || u_xlatb21;
    if(u_xlatb21){
        u_xlat2.x = dot(_Transforms[u_xlati0].xy, in_TEXCOORD0.xy);
        u_xlat2.y = dot(_Transforms[u_xlati1.x].xy, in_TEXCOORD0.xy);
        u_xlat15.xy = u_xlat2.xy * _1PixelClipInvView.zw;
        u_xlat4.xz = max(abs(u_xlat15.xy), vec2(1.0, 1.0));
        u_xlat6.xy = roundEven(u_xlat4.xz);
        u_xlat4.xz = max(u_xlat4.xz, u_xlat6.xy);
        u_xlat16.x = (u_xlatb2.w) ? u_xlat4.x : u_xlat6.x;
        u_xlat16.y = (u_xlatb2.z) ? u_xlat4.z : u_xlat6.y;
        u_xlat15.xy = abs(u_xlat15.xy) + vec2(9.99999997e-07, 9.99999997e-07);
        u_xlat15.xy = u_xlat16.xy / u_xlat15.xy;
        u_xlat15.xy = max(u_xlat15.xy, vec2(0.00999999978, 0.00999999978));
        u_xlat15.xy = min(u_xlat15.xy, vec2(100.0, 100.0));
        u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
        u_xlat15.xy = u_xlat2.xy * u_xlat15.xy;
    } else {
        u_xlat15.x = float(0.0);
        u_xlat15.y = float(0.0);
    }
    u_xlat16.x = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat16.y = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat1.xy = u_xlat15.xy + u_xlat16.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat6 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat6;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat6;
    u_xlat0.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat5.y==1.0);
#else
    u_xlatb15 = u_xlat5.y==1.0;
#endif
    u_xlat2.xy = u_xlat0.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (bool(u_xlatb15)) ? u_xlat2.xy : u_xlat0.xw;
    u_xlat3.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.z>=(-u_xlat0.z));
#else
    u_xlatb0 = u_xlat0.z>=(-u_xlat0.z);
#endif
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat7 = u_xlat0.z * u_xlat0.y;
    u_xlat7 = fract(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat7 = in_TEXCOORD2.z * 255.0 + (-u_xlat0.x);
    u_xlat14 = in_TEXCOORD3.y * 2040.0;
    u_xlat15.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.x;
    u_xlat15.y = u_xlat7 * 0.03125 + u_xlat14;
    u_xlat0.xy = u_xlat15.xy + vec2(0.5, 0.5);
    u_xlat0.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    u_xlat5.z = u_xlat11.x;
    vs_TEXCOORD1 = u_xlat5;
    u_xlat0.x = in_TEXCOORD2.y * 255.0;
    u_xlat0.y = 0.0;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD2.xyz = u_xlat3.xyz;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _PixelClipRect;
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(4) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec3 vs_TEXCOORD2;
flat in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
uint u_xlatu0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec2 u_xlat16_6;
vec2 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat16;
vec2 u_xlat17;
bool u_xlatb17;
float u_xlat18;
bool u_xlatb19;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatu0 = uint(vs_TEXCOORD3.x);
    u_xlatb0.yz = greaterThanEqual(vs_TEXCOORD0.zzwz, _ClipRects[int(u_xlatu0)].xxyx).yz;
    u_xlatb0.xw = greaterThanEqual(_ClipRects[int(u_xlatu0)].zzzw, vs_TEXCOORD0.zzzw).xw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xw + u_xlat0.yz;
    u_xlatb14.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_0 = texture(_ShaderInfoTex, vs_TEXCOORD3.zw).w;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat7.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat14.x = dFdx(u_xlat7.x);
    u_xlat21 = dFdy(u_xlat7.x);
    u_xlat14.x = abs(u_xlat21) + abs(u_xlat14.x);
    u_xlat21 = (-u_xlat14.x) + 0.5;
    u_xlat7.y = u_xlat14.x + 0.5;
    u_xlat7.xy = (-vec2(u_xlat21)) + u_xlat7.xy;
    u_xlat14.x = float(1.0) / u_xlat7.y;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat16_2.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_2.w = u_xlat7.x * vs_TEXCOORD1.x;
    u_xlat16_1 = u_xlat1 + u_xlat16_2;
    u_xlat16_2 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vs_TEXCOORD1.zzzz + u_xlat16_1;
    u_xlatb7.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat7.xy = (u_xlatb7.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat2.y = vs_TEXCOORD2.z + 0.5;
        u_xlat2.x = float(0.5);
        u_xlat16.y = float(0.0);
        u_xlat3.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<u_xlat16_4.x);
#else
        u_xlatb21 = 0.0<u_xlat16_4.x;
#endif
        u_xlat17.xy = u_xlat16_4.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xz = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xz = u_xlat4.xz * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat25 = dot(u_xlat4.xz, u_xlat4.xz);
        u_xlat25 = inversesqrt(u_xlat25);
        u_xlat5.xy = vec2(u_xlat25) * u_xlat4.xz;
        u_xlat25 = dot((-u_xlat17.xy), u_xlat5.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat25) * u_xlat25 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat25;
        u_xlat17.x = u_xlat17.x + u_xlat25;
        u_xlat25 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(u_xlat25<0.0);
#else
        u_xlatb19 = u_xlat25<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb19) ? u_xlat17.x : u_xlat25;
        u_xlat17.xy = u_xlat17.xx * u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb25 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb5 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xz / u_xlat17.xy;
        u_xlat24 = u_xlatb5 ? u_xlat17.y : float(0.0);
        u_xlat12.x = (u_xlatb25) ? u_xlat24 : u_xlat17.x;
        u_xlat12.y = 0.0;
        u_xlat5.yz = (bool(u_xlatb21)) ? u_xlat12.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_4.y * 255.0;
        u_xlati21 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(u_xlat5.y>=(-u_xlat5.y));
#else
        u_xlatb17 = u_xlat5.y>=(-u_xlat5.y);
#endif
        u_xlat24 = fract(abs(u_xlat5.y));
        u_xlat17.x = (u_xlatb17) ? u_xlat24 : (-u_xlat24);
        u_xlat17.x = (u_xlati21 != 0) ? u_xlat5.y : u_xlat17.x;
        u_xlatb4.xy = equal(ivec4(u_xlati21), ivec4(1, 2, 0, 0)).xy;
        u_xlat21 = u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
        u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
        u_xlat21 = (u_xlatb4.x) ? u_xlat21 : u_xlat17.x;
        u_xlat17.x = u_xlat21 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat17.x>=(-u_xlat17.x));
#else
        u_xlatb24 = u_xlat17.x>=(-u_xlat17.x);
#endif
        u_xlat17.x = fract(abs(u_xlat17.x));
        u_xlat17.x = (u_xlatb24) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat24 = u_xlat17.x + u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(0.5<u_xlat17.x);
#else
        u_xlatb17 = 0.5<u_xlat17.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb4.x = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb4.x = u_xlat24>=(-u_xlat24);
#endif
        u_xlat18 = fract(abs(u_xlat24));
        u_xlat4.x = (u_xlatb4.x) ? u_xlat18 : (-u_xlat18);
        u_xlat4.x = (-u_xlat4.x) + 1.0;
        u_xlat17.x = (u_xlatb17) ? u_xlat4.x : u_xlat24;
        u_xlat5.x = (u_xlatb4.y) ? u_xlat17.x : u_xlat21;
        u_xlat16.x = _GradientSettingsTex_TexelSize.x;
        u_xlat17.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy + u_xlat16.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat17.xy);
        u_xlat17.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat17.xy;
        u_xlat17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat3.xy = u_xlat16.xy * vec2(2.0, 2.0) + u_xlat3.xy;
        u_xlat16_2 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat3.xy = u_xlat16_2.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_2.xz * vec2(65025.0, 65025.0) + u_xlat3.xy;
        u_xlat3.xy = u_xlat7.xy * u_xlat17.xy;
        u_xlat7.xy = u_xlat7.xy * u_xlat16_6.xy;
        u_xlat7.xy = u_xlat5.xz * u_xlat7.xy + u_xlat3.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_2 * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat16_3 = texture(_CustomTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_3 * vs_TEXCOORD2.yyyy + u_xlat2;
        u_xlat16_2 = u_xlat2;
    } else {
        u_xlat16_2 = u_xlat1;
    }
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.w;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _ShaderInfoTex_TexelSize;
uniform 	vec4 _1PixelClipInvView;
uniform 	vec4 _Transforms[60];
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_TEXCOORD3;
out mediump vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD0;
flat out mediump vec4 vs_TEXCOORD1;
flat out mediump vec3 vs_TEXCOORD2;
flat out mediump vec4 vs_TEXCOORD3;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec2 u_xlat1;
ivec2 u_xlati1;
vec4 u_xlat2;
bvec4 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
bvec4 u_xlatb4;
vec4 u_xlat5;
vec4 u_xlat6;
float u_xlat7;
vec3 u_xlat11;
float u_xlat14;
vec2 u_xlat15;
bool u_xlatb15;
vec2 u_xlat16;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xyz = in_TEXCOORD2.xzz * vec3(765.0, 255.0, 8160.0);
    u_xlati0 = int(u_xlat0.x);
    u_xlati1.xy = ivec2(u_xlati0) + ivec2(1, 2);
    u_xlatb2 = equal(in_TEXCOORD2.wwww, vec4(0.0352941193, 0.0313725509, 0.0274509806, 0.0235294122));
    u_xlat3.x = u_xlatb2.y ? float(1.0) : 0.0;
    u_xlat3.y = u_xlatb2.x ? float(1.0) : 0.0;
;
    u_xlatb4 = equal(in_TEXCOORD2.wwww, vec4(0.0196078438, 0.0156862754, 0.0117647061, 0.00784313772));
    u_xlat11.x = u_xlatb4.y ? float(1.0) : 0.0;
    u_xlat11.y = u_xlatb4.z ? float(1.0) : 0.0;
    u_xlat11.z = u_xlatb4.w ? float(1.0) : 0.0;
;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(in_TEXCOORD2.w==0.00392156886);
#else
    u_xlatb21 = in_TEXCOORD2.w==0.00392156886;
#endif
    u_xlat5.x = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat5.y = u_xlat11.z + u_xlat11.y;
    u_xlat21 = u_xlat5.y + u_xlat5.x;
    u_xlat21 = u_xlat11.x + u_xlat21;
    u_xlat21 = u_xlat3.x + u_xlat21;
    u_xlat21 = u_xlat3.y + u_xlat21;
    u_xlat21 = min(u_xlat21, 1.0);
    u_xlat5.w = (-u_xlat21) + 1.0;
    u_xlatb21 = u_xlatb2.w || u_xlatb4.x;
    u_xlatb21 = u_xlatb2.z || u_xlatb21;
    if(u_xlatb21){
        u_xlat2.x = dot(_Transforms[u_xlati0].xy, in_TEXCOORD0.xy);
        u_xlat2.y = dot(_Transforms[u_xlati1.x].xy, in_TEXCOORD0.xy);
        u_xlat15.xy = u_xlat2.xy * _1PixelClipInvView.zw;
        u_xlat4.xz = max(abs(u_xlat15.xy), vec2(1.0, 1.0));
        u_xlat6.xy = roundEven(u_xlat4.xz);
        u_xlat4.xz = max(u_xlat4.xz, u_xlat6.xy);
        u_xlat16.x = (u_xlatb2.w) ? u_xlat4.x : u_xlat6.x;
        u_xlat16.y = (u_xlatb2.z) ? u_xlat4.z : u_xlat6.y;
        u_xlat15.xy = abs(u_xlat15.xy) + vec2(9.99999997e-07, 9.99999997e-07);
        u_xlat15.xy = u_xlat16.xy / u_xlat15.xy;
        u_xlat15.xy = max(u_xlat15.xy, vec2(0.00999999978, 0.00999999978));
        u_xlat15.xy = min(u_xlat15.xy, vec2(100.0, 100.0));
        u_xlat15.xy = u_xlat15.xy + vec2(-1.0, -1.0);
        u_xlat15.xy = u_xlat2.xy * u_xlat15.xy;
    } else {
        u_xlat15.x = float(0.0);
        u_xlat15.y = float(0.0);
    }
    u_xlat16.x = dot(_Transforms[u_xlati0], in_POSITION0);
    u_xlat16.y = dot(_Transforms[u_xlati1.x], in_POSITION0);
    u_xlat0.x = dot(_Transforms[u_xlati1.y], in_POSITION0);
    u_xlat1.xy = u_xlat15.xy + u_xlat16.xy;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.xxxx + u_xlat2;
    u_xlat2 = u_xlat2 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat6 = u_xlat2.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat2.xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat2.zzzz + u_xlat6;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat2.wwww + u_xlat6;
    u_xlat0.xw = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(u_xlat5.y==1.0);
#else
    u_xlatb15 = u_xlat5.y==1.0;
#endif
    u_xlat2.xy = u_xlat0.xw * _MainTex_TexelSize.xy;
    vs_TEXCOORD0.xy = (bool(u_xlatb15)) ? u_xlat2.xy : u_xlat0.xw;
    u_xlat3.z = dot(in_TEXCOORD3.zw, vec2(65025.0, 255.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.z>=(-u_xlat0.z));
#else
    u_xlatb0 = u_xlat0.z>=(-u_xlat0.z);
#endif
    u_xlat0.xz = (bool(u_xlatb0)) ? vec2(32.0, 0.03125) : vec2(-32.0, -0.03125);
    u_xlat7 = u_xlat0.z * u_xlat0.y;
    u_xlat7 = fract(u_xlat7);
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat7 = in_TEXCOORD2.z * 255.0 + (-u_xlat0.x);
    u_xlat14 = in_TEXCOORD3.y * 2040.0;
    u_xlat15.x = in_TEXCOORD3.x * 8160.0 + u_xlat0.x;
    u_xlat15.y = u_xlat7 * 0.03125 + u_xlat14;
    u_xlat0.xy = u_xlat15.xy + vec2(0.5, 0.5);
    u_xlat0.zw = u_xlat0.xy * _ShaderInfoTex_TexelSize.xy;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    u_xlat5.z = u_xlat11.x;
    vs_TEXCOORD1 = u_xlat5;
    u_xlat0.x = in_TEXCOORD2.y * 255.0;
    u_xlat0.y = 0.0;
    vs_TEXCOORD3 = u_xlat0;
    vs_TEXCOORD2.xyz = u_xlat3.xyz;
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
uniform 	vec4 _MainTex_TexelSize;
uniform 	vec4 _CustomTex_TexelSize;
uniform 	vec4 _GradientSettingsTex_TexelSize;
uniform 	vec4 _PixelClipRect;
uniform 	vec4 _ClipRects[20];
UNITY_LOCATION(0) uniform mediump sampler2D _ShaderInfoTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FontTex;
UNITY_LOCATION(3) uniform mediump sampler2D _CustomTex;
UNITY_LOCATION(4) uniform mediump sampler2D _GradientSettingsTex;
in mediump vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD0;
flat in mediump vec4 vs_TEXCOORD1;
flat in mediump vec3 vs_TEXCOORD2;
flat in mediump vec4 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
uint u_xlatu0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bvec2 u_xlatb4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec2 u_xlat16_6;
vec2 u_xlat7;
bvec2 u_xlatb7;
vec2 u_xlat12;
vec2 u_xlat14;
bvec2 u_xlatb14;
vec2 u_xlat16;
vec2 u_xlat17;
bool u_xlatb17;
float u_xlat18;
bool u_xlatb19;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
bool u_xlatb25;
void main()
{
vec4 hlslcc_FragCoord = vec4(gl_FragCoord.xyz, 1.0/gl_FragCoord.w);
    u_xlatu0 = uint(vs_TEXCOORD3.x);
    u_xlatb0.yz = greaterThanEqual(vs_TEXCOORD0.zzwz, _ClipRects[int(u_xlatu0)].xxyx).yz;
    u_xlatb0.xw = greaterThanEqual(_ClipRects[int(u_xlatu0)].zzzw, vs_TEXCOORD0.zzzw).xw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.xw + u_xlat0.yz;
    u_xlatb14.xy = greaterThanEqual(hlslcc_FragCoord.xyxy, _PixelClipRect.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlatb14.xy = greaterThanEqual(_PixelClipRect.zwzw, hlslcc_FragCoord.xyxy).xy;
    u_xlat14.x = u_xlatb14.x ? float(1.0) : 0.0;
    u_xlat14.y = u_xlatb14.y ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat14.xy + u_xlat0.xy;
    u_xlat0.z = 1.0;
    u_xlat0.x = dot(u_xlat0.xyz, vec3(1.0, 1.0, -7.94999981));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x<0.0);
#else
    u_xlatb0.x = u_xlat0.x<0.0;
#endif
    if(u_xlatb0.x){discard;}
    u_xlat16_0 = texture(_ShaderInfoTex, vs_TEXCOORD3.zw).w;
    u_xlat0.x = u_xlat16_0 * vs_COLOR0.w;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 * vs_TEXCOORD1.yyyy + vs_TEXCOORD1.wwww;
    u_xlat7.x = texture(_FontTex, vs_TEXCOORD0.xy).w;
    u_xlat14.x = dFdx(u_xlat7.x);
    u_xlat21 = dFdy(u_xlat7.x);
    u_xlat14.x = abs(u_xlat21) + abs(u_xlat14.x);
    u_xlat21 = (-u_xlat14.x) + 0.5;
    u_xlat7.y = u_xlat14.x + 0.5;
    u_xlat7.xy = (-vec2(u_xlat21)) + u_xlat7.xy;
    u_xlat14.x = float(1.0) / u_xlat7.y;
    u_xlat7.x = u_xlat14.x * u_xlat7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat14.x = u_xlat7.x * -2.0 + 3.0;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat7.x = u_xlat7.x * u_xlat14.x;
    u_xlat16_2.xyz = vs_TEXCOORD1.xxx;
    u_xlat16_2.w = u_xlat7.x * vs_TEXCOORD1.x;
    u_xlat16_1 = u_xlat1 + u_xlat16_2;
    u_xlat16_2 = texture(_CustomTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_2 * vs_TEXCOORD1.zzzz + u_xlat16_1;
    u_xlatb7.xy = equal(vs_TEXCOORD2.xyxx, vec4(1.0, 1.0, 0.0, 0.0)).xy;
    u_xlatb7.x = u_xlatb7.y || u_xlatb7.x;
    if(u_xlatb7.x){
        u_xlat7.xy = (u_xlatb7.y) ? _CustomTex_TexelSize.xy : _MainTex_TexelSize.xy;
        u_xlat2.y = vs_TEXCOORD2.z + 0.5;
        u_xlat2.x = float(0.5);
        u_xlat16.y = float(0.0);
        u_xlat3.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat3.xy);
#ifdef UNITY_ADRENO_ES3
        u_xlatb21 = !!(0.0<u_xlat16_4.x);
#else
        u_xlatb21 = 0.0<u_xlat16_4.x;
#endif
        u_xlat17.xy = u_xlat16_4.zw + vec2(-0.5, -0.5);
        u_xlat17.xy = u_xlat17.xy + u_xlat17.xy;
        u_xlat4.xz = vs_TEXCOORD0.xy + vec2(-0.5, -0.5);
        u_xlat4.xz = u_xlat4.xz * vec2(2.0, 2.0) + (-u_xlat17.xy);
        u_xlat25 = dot(u_xlat4.xz, u_xlat4.xz);
        u_xlat25 = inversesqrt(u_xlat25);
        u_xlat5.xy = vec2(u_xlat25) * u_xlat4.xz;
        u_xlat25 = dot((-u_xlat17.xy), u_xlat5.xy);
        u_xlat17.x = dot(u_xlat17.xy, u_xlat17.xy);
        u_xlat17.x = (-u_xlat25) * u_xlat25 + u_xlat17.x;
        u_xlat17.x = (-u_xlat17.x) + 1.0;
        u_xlat17.x = sqrt(u_xlat17.x);
        u_xlat24 = (-u_xlat17.x) + u_xlat25;
        u_xlat17.x = u_xlat17.x + u_xlat25;
        u_xlat25 = min(u_xlat17.x, u_xlat24);
#ifdef UNITY_ADRENO_ES3
        u_xlatb19 = !!(u_xlat25<0.0);
#else
        u_xlatb19 = u_xlat25<0.0;
#endif
        u_xlat17.x = max(u_xlat17.x, u_xlat24);
        u_xlat17.x = (u_xlatb19) ? u_xlat17.x : u_xlat25;
        u_xlat17.xy = u_xlat17.xx * u_xlat5.xy;
#ifdef UNITY_ADRENO_ES3
        u_xlatb25 = !!(9.99999975e-05>=abs(u_xlat17.x));
#else
        u_xlatb25 = 9.99999975e-05>=abs(u_xlat17.x);
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb5 = !!(9.99999975e-05<abs(u_xlat17.y));
#else
        u_xlatb5 = 9.99999975e-05<abs(u_xlat17.y);
#endif
        u_xlat17.xy = u_xlat4.xz / u_xlat17.xy;
        u_xlat24 = u_xlatb5 ? u_xlat17.y : float(0.0);
        u_xlat12.x = (u_xlatb25) ? u_xlat24 : u_xlat17.x;
        u_xlat12.y = 0.0;
        u_xlat5.yz = (bool(u_xlatb21)) ? u_xlat12.xy : vs_TEXCOORD0.xy;
        u_xlat16_6.x = u_xlat16_4.y * 255.0;
        u_xlati21 = int(u_xlat16_6.x);
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(u_xlat5.y>=(-u_xlat5.y));
#else
        u_xlatb17 = u_xlat5.y>=(-u_xlat5.y);
#endif
        u_xlat24 = fract(abs(u_xlat5.y));
        u_xlat17.x = (u_xlatb17) ? u_xlat24 : (-u_xlat24);
        u_xlat17.x = (u_xlati21 != 0) ? u_xlat5.y : u_xlat17.x;
        u_xlatb4.xy = equal(ivec4(u_xlati21), ivec4(1, 2, 0, 0)).xy;
        u_xlat21 = u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlat21 = min(max(u_xlat21, 0.0), 1.0);
#else
        u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
#endif
        u_xlat21 = (u_xlatb4.x) ? u_xlat21 : u_xlat17.x;
        u_xlat17.x = u_xlat21 * 0.5;
#ifdef UNITY_ADRENO_ES3
        u_xlatb24 = !!(u_xlat17.x>=(-u_xlat17.x));
#else
        u_xlatb24 = u_xlat17.x>=(-u_xlat17.x);
#endif
        u_xlat17.x = fract(abs(u_xlat17.x));
        u_xlat17.x = (u_xlatb24) ? u_xlat17.x : (-u_xlat17.x);
        u_xlat24 = u_xlat17.x + u_xlat17.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb17 = !!(0.5<u_xlat17.x);
#else
        u_xlatb17 = 0.5<u_xlat17.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb4.x = !!(u_xlat24>=(-u_xlat24));
#else
        u_xlatb4.x = u_xlat24>=(-u_xlat24);
#endif
        u_xlat18 = fract(abs(u_xlat24));
        u_xlat4.x = (u_xlatb4.x) ? u_xlat18 : (-u_xlat18);
        u_xlat4.x = (-u_xlat4.x) + 1.0;
        u_xlat17.x = (u_xlatb17) ? u_xlat4.x : u_xlat24;
        u_xlat5.x = (u_xlatb4.y) ? u_xlat17.x : u_xlat21;
        u_xlat16.x = _GradientSettingsTex_TexelSize.x;
        u_xlat17.xy = u_xlat2.xy * _GradientSettingsTex_TexelSize.xy + u_xlat16.xy;
        u_xlat16_4 = texture(_GradientSettingsTex, u_xlat17.xy);
        u_xlat17.xy = u_xlat16_4.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_4.xz * vec2(65025.0, 65025.0) + u_xlat17.xy;
        u_xlat17.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
        u_xlat3.xy = u_xlat16.xy * vec2(2.0, 2.0) + u_xlat3.xy;
        u_xlat16_2 = texture(_GradientSettingsTex, u_xlat3.xy);
        u_xlat3.xy = u_xlat16_2.yw * vec2(255.0, 255.0);
        u_xlat16_6.xy = u_xlat16_2.xz * vec2(65025.0, 65025.0) + u_xlat3.xy;
        u_xlat3.xy = u_xlat7.xy * u_xlat17.xy;
        u_xlat7.xy = u_xlat7.xy * u_xlat16_6.xy;
        u_xlat7.xy = u_xlat5.xz * u_xlat7.xy + u_xlat3.xy;
        u_xlat16_2 = texture(_MainTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_2 * vs_TEXCOORD2.xxxx + u_xlat1;
        u_xlat16_3 = texture(_CustomTex, u_xlat7.xy);
        u_xlat2 = u_xlat16_3 * vs_TEXCOORD2.yyyy + u_xlat2;
        u_xlat16_2 = u_xlat2;
    } else {
        u_xlat16_2 = u_xlat1;
    }
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    SV_Target0.w = u_xlat0.x * u_xlat16_2.w;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 477
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %159 %256 %325 %358 %372 %450 %451 %459 %466 %469 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %144 ArrayStride 144 
                                                      OpDecorate %145 ArrayStride 145 
                                                      OpDecorate %147 ArrayStride 147 
                                                      OpMemberDecorate %148 0 Offset 148 
                                                      OpMemberDecorate %148 1 Offset 148 
                                                      OpMemberDecorate %148 2 Offset 148 
                                                      OpMemberDecorate %148 3 Offset 148 
                                                      OpMemberDecorate %148 4 Offset 148 
                                                      OpMemberDecorate %148 5 Offset 148 
                                                      OpMemberDecorate %148 6 Offset 148 
                                                      OpDecorate %148 Block 
                                                      OpDecorate %150 DescriptorSet 150 
                                                      OpDecorate %150 Binding 150 
                                                      OpDecorate %159 Location 159 
                                                      OpDecorate %256 Location 256 
                                                      OpMemberDecorate %323 0 BuiltIn 323 
                                                      OpMemberDecorate %323 1 BuiltIn 323 
                                                      OpMemberDecorate %323 2 BuiltIn 323 
                                                      OpDecorate %323 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 358 
                                                      OpDecorate %372 Location 372 
                                                      OpDecorate %450 RelaxedPrecision 
                                                      OpDecorate %450 Location 450 
                                                      OpDecorate %451 Location 451 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 459 
                                                      OpDecorate vs_TEXCOORD3 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD3 Flat 
                                                      OpDecorate vs_TEXCOORD3 Location 466 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 469 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                          f32 %16 = OpConstant 3.674022E-40 
                                          f32 %17 = OpConstant 3.674022E-40 
                                        f32_3 %18 = OpConstantComposite %15 %16 %17 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypePointer Private %22 
                                 Private i32* %24 = OpVariable Private 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %27 = OpTypePointer Private %6 
                                              %31 = OpTypeVector %22 2 
                                              %32 = OpTypePointer Private %31 
                               Private i32_2* %33 = OpVariable Private 
                                          i32 %36 = OpConstant 1 
                                          i32 %37 = OpConstant 2 
                                        i32_2 %38 = OpConstantComposite %36 %37 
                                              %40 = OpTypeBool 
                                              %41 = OpTypeVector %40 4 
                                              %42 = OpTypePointer Private %41 
                              Private bool_4* %43 = OpVariable Private 
                                          f32 %46 = OpConstant 3.674022E-40 
                                          f32 %47 = OpConstant 3.674022E-40 
                                          f32 %48 = OpConstant 3.674022E-40 
                                          f32 %49 = OpConstant 3.674022E-40 
                                        f32_4 %50 = OpConstantComposite %46 %47 %48 %49 
                                              %52 = OpTypePointer Private %12 
                               Private f32_3* %53 = OpVariable Private 
                                          u32 %54 = OpConstant 1 
                                              %55 = OpTypePointer Private %40 
                                          f32 %58 = OpConstant 3.674022E-40 
                                          f32 %59 = OpConstant 3.674022E-40 
                              Private bool_4* %66 = OpVariable Private 
                                          f32 %69 = OpConstant 3.674022E-40 
                                          f32 %70 = OpConstant 3.674022E-40 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          f32 %72 = OpConstant 3.674022E-40 
                                        f32_4 %73 = OpConstantComposite %69 %70 %71 %72 
                               Private f32_3* %75 = OpVariable Private 
                                          u32 %80 = OpConstant 2 
                                          u32 %85 = OpConstant 3 
                                Private bool* %90 = OpVariable Private 
                                              %91 = OpTypePointer Input %6 
                                          f32 %94 = OpConstant 3.674022E-40 
                               Private f32_4* %96 = OpVariable Private 
                                Private f32* %106 = OpVariable Private 
                              Private f32_4* %142 = OpVariable Private 
                                         u32 %143 = OpConstant 4 
                                             %144 = OpTypeArray %7 %143 
                                             %145 = OpTypeArray %7 %143 
                                         u32 %146 = OpConstant 60 
                                             %147 = OpTypeArray %7 %146 
                                             %148 = OpTypeStruct %144 %145 %7 %7 %7 %7 %147 
                                             %149 = OpTypePointer Uniform %148 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4[60];}* %150 = OpVariable Uniform 
                                         i32 %151 = OpConstant 6 
                                             %153 = OpTypeVector %6 2 
                                             %154 = OpTypePointer Uniform %7 
                                             %158 = OpTypePointer Input %153 
                                Input f32_2* %159 = OpVariable Input 
                                             %171 = OpTypePointer Private %153 
                              Private f32_2* %172 = OpVariable Private 
                                         i32 %175 = OpConstant 5 
                              Private f32_3* %180 = OpVariable Private 
                                       f32_2 %183 = OpConstantComposite %58 %58 
                              Private f32_4* %187 = OpVariable Private 
                              Private f32_2* %200 = OpVariable Private 
                                             %203 = OpTypePointer Function %6 
                                         f32 %228 = OpConstant 3.674022E-40 
                                       f32_2 %229 = OpConstantComposite %228 %228 
                                         f32 %235 = OpConstant 3.674022E-40 
                                       f32_2 %236 = OpConstantComposite %235 %235 
                                         f32 %239 = OpConstant 3.674022E-40 
                                       f32_2 %240 = OpConstantComposite %239 %239 
                                         f32 %243 = OpConstant 3.674022E-40 
                                       f32_2 %244 = OpConstantComposite %243 %243 
                                Input f32_4* %256 = OpVariable Input 
                              Private f32_2* %274 = OpVariable Private 
                                         i32 %280 = OpConstant 0 
                                         i32 %299 = OpConstant 3 
                                             %322 = OpTypeArray %6 %54 
                                             %323 = OpTypeStruct %7 %6 %322 
                                             %324 = OpTypePointer Output %323 
        Output struct {f32_4; f32; f32[1];}* %325 = OpVariable Output 
                                             %333 = OpTypePointer Output %7 
                               Private bool* %346 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %360 = OpTypePointer Function %153 
                                Input f32_4* %372 = OpVariable Input 
                                         f32 %375 = OpConstant 3.674022E-40 
                                       f32_2 %376 = OpConstantComposite %375 %16 
                               Private bool* %379 = OpVariable Private 
                                         f32 %387 = OpConstant 3.674022E-40 
                                         f32 %388 = OpConstant 3.674022E-40 
                                       f32_2 %389 = OpConstantComposite %387 %388 
                                         f32 %390 = OpConstant 3.674022E-40 
                                         f32 %391 = OpConstant 3.674022E-40 
                                       f32_2 %392 = OpConstantComposite %390 %391 
                                             %393 = OpTypeVector %40 2 
                                Private f32* %398 = OpVariable Private 
                                Private f32* %418 = OpVariable Private 
                                         f32 %421 = OpConstant 3.674022E-40 
                                         f32 %436 = OpConstant 3.674022E-40 
                                       f32_2 %437 = OpConstantComposite %436 %436 
                                         i32 %443 = OpConstant 4 
                               Output f32_4* %450 = OpVariable Output 
                                Input f32_4* %451 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                                             %468 = OpTypePointer Output %12 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                             %471 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %204 = OpVariable Function 
                               Function f32* %216 = OpVariable Function 
                             Function f32_2* %361 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 2 2 
                                        f32_3 %19 = OpFMul %14 %18 
                                        f32_4 %20 = OpLoad %9 
                                        f32_4 %21 = OpVectorShuffle %20 %19 4 5 6 3 
                                                      OpStore %9 %21 
                                 Private f32* %28 = OpAccessChain %9 %26 
                                          f32 %29 = OpLoad %28 
                                          i32 %30 = OpConvertFToS %29 
                                                      OpStore %24 %30 
                                          i32 %34 = OpLoad %24 
                                        i32_2 %35 = OpCompositeConstruct %34 %34 
                                        i32_2 %39 = OpIAdd %35 %38 
                                                      OpStore %33 %39 
                                        f32_4 %44 = OpLoad %11 
                                        f32_4 %45 = OpVectorShuffle %44 %44 3 3 3 3 
                                       bool_4 %51 = OpFOrdEqual %45 %50 
                                                      OpStore %43 %51 
                                Private bool* %56 = OpAccessChain %43 %54 
                                         bool %57 = OpLoad %56 
                                          f32 %60 = OpSelect %57 %58 %59 
                                 Private f32* %61 = OpAccessChain %53 %26 
                                                      OpStore %61 %60 
                                Private bool* %62 = OpAccessChain %43 %26 
                                         bool %63 = OpLoad %62 
                                          f32 %64 = OpSelect %63 %58 %59 
                                 Private f32* %65 = OpAccessChain %53 %54 
                                                      OpStore %65 %64 
                                        f32_4 %67 = OpLoad %11 
                                        f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       bool_4 %74 = OpFOrdEqual %68 %73 
                                                      OpStore %66 %74 
                                Private bool* %76 = OpAccessChain %66 %54 
                                         bool %77 = OpLoad %76 
                                          f32 %78 = OpSelect %77 %58 %59 
                                 Private f32* %79 = OpAccessChain %75 %26 
                                                      OpStore %79 %78 
                                Private bool* %81 = OpAccessChain %66 %80 
                                         bool %82 = OpLoad %81 
                                          f32 %83 = OpSelect %82 %58 %59 
                                 Private f32* %84 = OpAccessChain %75 %54 
                                                      OpStore %84 %83 
                                Private bool* %86 = OpAccessChain %66 %85 
                                         bool %87 = OpLoad %86 
                                          f32 %88 = OpSelect %87 %58 %59 
                                 Private f32* %89 = OpAccessChain %75 %80 
                                                      OpStore %89 %88 
                                   Input f32* %92 = OpAccessChain %11 %85 
                                          f32 %93 = OpLoad %92 
                                         bool %95 = OpFOrdEqual %93 %94 
                                                      OpStore %90 %95 
                                         bool %97 = OpLoad %90 
                                          f32 %98 = OpSelect %97 %58 %59 
                                 Private f32* %99 = OpAccessChain %96 %26 
                                                      OpStore %99 %98 
                                Private f32* %100 = OpAccessChain %75 %80 
                                         f32 %101 = OpLoad %100 
                                Private f32* %102 = OpAccessChain %75 %54 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                Private f32* %105 = OpAccessChain %96 %54 
                                                      OpStore %105 %104 
                                Private f32* %107 = OpAccessChain %96 %54 
                                         f32 %108 = OpLoad %107 
                                Private f32* %109 = OpAccessChain %96 %26 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFAdd %108 %110 
                                                      OpStore %106 %111 
                                Private f32* %112 = OpAccessChain %75 %26 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpLoad %106 
                                         f32 %115 = OpFAdd %113 %114 
                                                      OpStore %106 %115 
                                Private f32* %116 = OpAccessChain %53 %26 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpLoad %106 
                                         f32 %119 = OpFAdd %117 %118 
                                                      OpStore %106 %119 
                                Private f32* %120 = OpAccessChain %53 %54 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpLoad %106 
                                         f32 %123 = OpFAdd %121 %122 
                                                      OpStore %106 %123 
                                         f32 %124 = OpLoad %106 
                                         f32 %125 = OpExtInst %1 37 %124 %58 
                                                      OpStore %106 %125 
                                         f32 %126 = OpLoad %106 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpFAdd %127 %58 
                                Private f32* %129 = OpAccessChain %96 %85 
                                                      OpStore %129 %128 
                               Private bool* %130 = OpAccessChain %43 %85 
                                        bool %131 = OpLoad %130 
                               Private bool* %132 = OpAccessChain %66 %26 
                                        bool %133 = OpLoad %132 
                                        bool %134 = OpLogicalOr %131 %133 
                                                      OpStore %90 %134 
                               Private bool* %135 = OpAccessChain %43 %80 
                                        bool %136 = OpLoad %135 
                                        bool %137 = OpLoad %90 
                                        bool %138 = OpLogicalOr %136 %137 
                                                      OpStore %90 %138 
                                        bool %139 = OpLoad %90 
                                                      OpSelectionMerge %141 None 
                                                      OpBranchConditional %139 %140 %250 
                                             %140 = OpLabel 
                                         i32 %152 = OpLoad %24 
                              Uniform f32_4* %155 = OpAccessChain %150 %151 %152 
                                       f32_4 %156 = OpLoad %155 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                                       f32_2 %160 = OpLoad %159 
                                         f32 %161 = OpDot %157 %160 
                                Private f32* %162 = OpAccessChain %142 %26 
                                                      OpStore %162 %161 
                                Private i32* %163 = OpAccessChain %33 %26 
                                         i32 %164 = OpLoad %163 
                              Uniform f32_4* %165 = OpAccessChain %150 %151 %164 
                                       f32_4 %166 = OpLoad %165 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpLoad %159 
                                         f32 %169 = OpDot %167 %168 
                                Private f32* %170 = OpAccessChain %142 %54 
                                                      OpStore %170 %169 
                                       f32_4 %173 = OpLoad %142 
                                       f32_2 %174 = OpVectorShuffle %173 %173 0 1 
                              Uniform f32_4* %176 = OpAccessChain %150 %175 
                                       f32_4 %177 = OpLoad %176 
                                       f32_2 %178 = OpVectorShuffle %177 %177 2 3 
                                       f32_2 %179 = OpFMul %174 %178 
                                                      OpStore %172 %179 
                                       f32_2 %181 = OpLoad %172 
                                       f32_2 %182 = OpExtInst %1 4 %181 
                                       f32_2 %184 = OpExtInst %1 40 %182 %183 
                                       f32_3 %185 = OpLoad %180 
                                       f32_3 %186 = OpVectorShuffle %185 %184 3 1 4 
                                                      OpStore %180 %186 
                                       f32_3 %188 = OpLoad %180 
                                       f32_2 %189 = OpVectorShuffle %188 %188 0 2 
                                       f32_2 %190 = OpExtInst %1 2 %189 
                                       f32_4 %191 = OpLoad %187 
                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 2 3 
                                                      OpStore %187 %192 
                                       f32_3 %193 = OpLoad %180 
                                       f32_2 %194 = OpVectorShuffle %193 %193 0 2 
                                       f32_4 %195 = OpLoad %187 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                       f32_2 %197 = OpExtInst %1 40 %194 %196 
                                       f32_3 %198 = OpLoad %180 
                                       f32_3 %199 = OpVectorShuffle %198 %197 3 1 4 
                                                      OpStore %180 %199 
                               Private bool* %201 = OpAccessChain %43 %85 
                                        bool %202 = OpLoad %201 
                                                      OpSelectionMerge %206 None 
                                                      OpBranchConditional %202 %205 %209 
                                             %205 = OpLabel 
                                Private f32* %207 = OpAccessChain %180 %26 
                                         f32 %208 = OpLoad %207 
                                                      OpStore %204 %208 
                                                      OpBranch %206 
                                             %209 = OpLabel 
                                Private f32* %210 = OpAccessChain %187 %26 
                                         f32 %211 = OpLoad %210 
                                                      OpStore %204 %211 
                                                      OpBranch %206 
                                             %206 = OpLabel 
                                         f32 %212 = OpLoad %204 
                                Private f32* %213 = OpAccessChain %200 %26 
                                                      OpStore %213 %212 
                               Private bool* %214 = OpAccessChain %43 %80 
                                        bool %215 = OpLoad %214 
                                                      OpSelectionMerge %218 None 
                                                      OpBranchConditional %215 %217 %221 
                                             %217 = OpLabel 
                                Private f32* %219 = OpAccessChain %180 %80 
                                         f32 %220 = OpLoad %219 
                                                      OpStore %216 %220 
                                                      OpBranch %218 
                                             %221 = OpLabel 
                                Private f32* %222 = OpAccessChain %187 %54 
                                         f32 %223 = OpLoad %222 
                                                      OpStore %216 %223 
                                                      OpBranch %218 
                                             %218 = OpLabel 
                                         f32 %224 = OpLoad %216 
                                Private f32* %225 = OpAccessChain %200 %54 
                                                      OpStore %225 %224 
                                       f32_2 %226 = OpLoad %172 
                                       f32_2 %227 = OpExtInst %1 4 %226 
                                       f32_2 %230 = OpFAdd %227 %229 
                                                      OpStore %172 %230 
                                       f32_2 %231 = OpLoad %200 
                                       f32_2 %232 = OpLoad %172 
                                       f32_2 %233 = OpFDiv %231 %232 
                                                      OpStore %172 %233 
                                       f32_2 %234 = OpLoad %172 
                                       f32_2 %237 = OpExtInst %1 40 %234 %236 
                                                      OpStore %172 %237 
                                       f32_2 %238 = OpLoad %172 
                                       f32_2 %241 = OpExtInst %1 37 %238 %240 
                                                      OpStore %172 %241 
                                       f32_2 %242 = OpLoad %172 
                                       f32_2 %245 = OpFAdd %242 %244 
                                                      OpStore %172 %245 
                                       f32_4 %246 = OpLoad %142 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %248 = OpLoad %172 
                                       f32_2 %249 = OpFMul %247 %248 
                                                      OpStore %172 %249 
                                                      OpBranch %141 
                                             %250 = OpLabel 
                                Private f32* %251 = OpAccessChain %172 %26 
                                                      OpStore %251 %59 
                                Private f32* %252 = OpAccessChain %172 %54 
                                                      OpStore %252 %59 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                         i32 %253 = OpLoad %24 
                              Uniform f32_4* %254 = OpAccessChain %150 %151 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %257 = OpLoad %256 
                                         f32 %258 = OpDot %255 %257 
                                Private f32* %259 = OpAccessChain %200 %26 
                                                      OpStore %259 %258 
                                Private i32* %260 = OpAccessChain %33 %26 
                                         i32 %261 = OpLoad %260 
                              Uniform f32_4* %262 = OpAccessChain %150 %151 %261 
                                       f32_4 %263 = OpLoad %262 
                                       f32_4 %264 = OpLoad %256 
                                         f32 %265 = OpDot %263 %264 
                                Private f32* %266 = OpAccessChain %200 %54 
                                                      OpStore %266 %265 
                                Private i32* %267 = OpAccessChain %33 %54 
                                         i32 %268 = OpLoad %267 
                              Uniform f32_4* %269 = OpAccessChain %150 %151 %268 
                                       f32_4 %270 = OpLoad %269 
                                       f32_4 %271 = OpLoad %256 
                                         f32 %272 = OpDot %270 %271 
                                Private f32* %273 = OpAccessChain %9 %26 
                                                      OpStore %273 %272 
                                       f32_2 %275 = OpLoad %172 
                                       f32_2 %276 = OpLoad %200 
                                       f32_2 %277 = OpFAdd %275 %276 
                                                      OpStore %274 %277 
                                       f32_2 %278 = OpLoad %274 
                                       f32_4 %279 = OpVectorShuffle %278 %278 1 1 1 1 
                              Uniform f32_4* %281 = OpAccessChain %150 %280 %36 
                                       f32_4 %282 = OpLoad %281 
                                       f32_4 %283 = OpFMul %279 %282 
                                                      OpStore %142 %283 
                              Uniform f32_4* %284 = OpAccessChain %150 %280 %280 
                                       f32_4 %285 = OpLoad %284 
                                       f32_2 %286 = OpLoad %274 
                                       f32_4 %287 = OpVectorShuffle %286 %286 0 0 0 0 
                                       f32_4 %288 = OpFMul %285 %287 
                                       f32_4 %289 = OpLoad %142 
                                       f32_4 %290 = OpFAdd %288 %289 
                                                      OpStore %142 %290 
                              Uniform f32_4* %291 = OpAccessChain %150 %280 %37 
                                       f32_4 %292 = OpLoad %291 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpVectorShuffle %293 %293 0 0 0 0 
                                       f32_4 %295 = OpFMul %292 %294 
                                       f32_4 %296 = OpLoad %142 
                                       f32_4 %297 = OpFAdd %295 %296 
                                                      OpStore %142 %297 
                                       f32_4 %298 = OpLoad %142 
                              Uniform f32_4* %300 = OpAccessChain %150 %280 %299 
                                       f32_4 %301 = OpLoad %300 
                                       f32_4 %302 = OpFAdd %298 %301 
                                                      OpStore %142 %302 
                                       f32_4 %303 = OpLoad %142 
                                       f32_4 %304 = OpVectorShuffle %303 %303 1 1 1 1 
                              Uniform f32_4* %305 = OpAccessChain %150 %36 %36 
                                       f32_4 %306 = OpLoad %305 
                                       f32_4 %307 = OpFMul %304 %306 
                                                      OpStore %187 %307 
                              Uniform f32_4* %308 = OpAccessChain %150 %36 %280 
                                       f32_4 %309 = OpLoad %308 
                                       f32_4 %310 = OpLoad %142 
                                       f32_4 %311 = OpVectorShuffle %310 %310 0 0 0 0 
                                       f32_4 %312 = OpFMul %309 %311 
                                       f32_4 %313 = OpLoad %187 
                                       f32_4 %314 = OpFAdd %312 %313 
                                                      OpStore %187 %314 
                              Uniform f32_4* %315 = OpAccessChain %150 %36 %37 
                                       f32_4 %316 = OpLoad %315 
                                       f32_4 %317 = OpLoad %142 
                                       f32_4 %318 = OpVectorShuffle %317 %317 2 2 2 2 
                                       f32_4 %319 = OpFMul %316 %318 
                                       f32_4 %320 = OpLoad %187 
                                       f32_4 %321 = OpFAdd %319 %320 
                                                      OpStore %187 %321 
                              Uniform f32_4* %326 = OpAccessChain %150 %36 %299 
                                       f32_4 %327 = OpLoad %326 
                                       f32_4 %328 = OpLoad %142 
                                       f32_4 %329 = OpVectorShuffle %328 %328 3 3 3 3 
                                       f32_4 %330 = OpFMul %327 %329 
                                       f32_4 %331 = OpLoad %187 
                                       f32_4 %332 = OpFAdd %330 %331 
                               Output f32_4* %334 = OpAccessChain %325 %280 
                                                      OpStore %334 %332 
                                       f32_2 %335 = OpLoad %159 
                              Uniform f32_4* %336 = OpAccessChain %150 %37 
                                       f32_4 %337 = OpLoad %336 
                                       f32_2 %338 = OpVectorShuffle %337 %337 0 1 
                                       f32_2 %339 = OpFMul %335 %338 
                              Uniform f32_4* %340 = OpAccessChain %150 %37 
                                       f32_4 %341 = OpLoad %340 
                                       f32_2 %342 = OpVectorShuffle %341 %341 2 3 
                                       f32_2 %343 = OpFAdd %339 %342 
                                       f32_4 %344 = OpLoad %9 
                                       f32_4 %345 = OpVectorShuffle %344 %343 4 1 2 5 
                                                      OpStore %9 %345 
                                Private f32* %347 = OpAccessChain %96 %54 
                                         f32 %348 = OpLoad %347 
                                        bool %349 = OpFOrdEqual %348 %58 
                                                      OpStore %346 %349 
                                       f32_4 %350 = OpLoad %9 
                                       f32_2 %351 = OpVectorShuffle %350 %350 0 3 
                              Uniform f32_4* %352 = OpAccessChain %150 %299 
                                       f32_4 %353 = OpLoad %352 
                                       f32_2 %354 = OpVectorShuffle %353 %353 0 1 
                                       f32_2 %355 = OpFMul %351 %354 
                                       f32_4 %356 = OpLoad %142 
                                       f32_4 %357 = OpVectorShuffle %356 %355 4 5 2 3 
                                                      OpStore %142 %357 
                                        bool %359 = OpLoad %346 
                                                      OpSelectionMerge %363 None 
                                                      OpBranchConditional %359 %362 %366 
                                             %362 = OpLabel 
                                       f32_4 %364 = OpLoad %142 
                                       f32_2 %365 = OpVectorShuffle %364 %364 0 1 
                                                      OpStore %361 %365 
                                                      OpBranch %363 
                                             %366 = OpLabel 
                                       f32_4 %367 = OpLoad %9 
                                       f32_2 %368 = OpVectorShuffle %367 %367 0 3 
                                                      OpStore %361 %368 
                                                      OpBranch %363 
                                             %363 = OpLabel 
                                       f32_2 %369 = OpLoad %361 
                                       f32_4 %370 = OpLoad vs_TEXCOORD0 
                                       f32_4 %371 = OpVectorShuffle %370 %369 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %371 
                                       f32_4 %373 = OpLoad %372 
                                       f32_2 %374 = OpVectorShuffle %373 %373 2 3 
                                         f32 %377 = OpDot %374 %376 
                                Private f32* %378 = OpAccessChain %53 %80 
                                                      OpStore %378 %377 
                                Private f32* %380 = OpAccessChain %9 %80 
                                         f32 %381 = OpLoad %380 
                                Private f32* %382 = OpAccessChain %9 %80 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFNegate %383 
                                        bool %385 = OpFOrdGreaterThanEqual %381 %384 
                                                      OpStore %379 %385 
                                        bool %386 = OpLoad %379 
                                      bool_2 %394 = OpCompositeConstruct %386 %386 
                                       f32_2 %395 = OpSelect %394 %389 %392 
                                       f32_4 %396 = OpLoad %9 
                                       f32_4 %397 = OpVectorShuffle %396 %395 4 1 5 3 
                                                      OpStore %9 %397 
                                Private f32* %399 = OpAccessChain %9 %80 
                                         f32 %400 = OpLoad %399 
                                Private f32* %401 = OpAccessChain %9 %54 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpFMul %400 %402 
                                                      OpStore %398 %403 
                                         f32 %404 = OpLoad %398 
                                         f32 %405 = OpExtInst %1 10 %404 
                                                      OpStore %398 %405 
                                         f32 %406 = OpLoad %398 
                                Private f32* %407 = OpAccessChain %9 %26 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpFMul %406 %408 
                                Private f32* %410 = OpAccessChain %9 %26 
                                                      OpStore %410 %409 
                                  Input f32* %411 = OpAccessChain %11 %80 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpFMul %412 %16 
                                Private f32* %414 = OpAccessChain %9 %26 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpFAdd %413 %416 
                                                      OpStore %398 %417 
                                  Input f32* %419 = OpAccessChain %372 %54 
                                         f32 %420 = OpLoad %419 
                                         f32 %422 = OpFMul %420 %421 
                                                      OpStore %418 %422 
                                  Input f32* %423 = OpAccessChain %372 %26 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFMul %424 %17 
                                Private f32* %426 = OpAccessChain %9 %26 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFAdd %425 %427 
                                Private f32* %429 = OpAccessChain %172 %26 
                                                      OpStore %429 %428 
                                         f32 %430 = OpLoad %398 
                                         f32 %431 = OpFMul %430 %388 
                                         f32 %432 = OpLoad %418 
                                         f32 %433 = OpFAdd %431 %432 
                                Private f32* %434 = OpAccessChain %172 %54 
                                                      OpStore %434 %433 
                                       f32_2 %435 = OpLoad %172 
                                       f32_2 %438 = OpFAdd %435 %437 
                                       f32_4 %439 = OpLoad %9 
                                       f32_4 %440 = OpVectorShuffle %439 %438 4 5 2 3 
                                                      OpStore %9 %440 
                                       f32_4 %441 = OpLoad %9 
                                       f32_2 %442 = OpVectorShuffle %441 %441 0 1 
                              Uniform f32_4* %444 = OpAccessChain %150 %443 
                                       f32_4 %445 = OpLoad %444 
                                       f32_2 %446 = OpVectorShuffle %445 %445 0 1 
                                       f32_2 %447 = OpFMul %442 %446 
                                       f32_4 %448 = OpLoad %9 
                                       f32_4 %449 = OpVectorShuffle %448 %447 0 1 4 5 
                                                      OpStore %9 %449 
                                       f32_4 %452 = OpLoad %451 
                                                      OpStore %450 %452 
                                       f32_2 %453 = OpLoad %274 
                                       f32_4 %454 = OpLoad vs_TEXCOORD0 
                                       f32_4 %455 = OpVectorShuffle %454 %453 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %455 
                                Private f32* %456 = OpAccessChain %75 %26 
                                         f32 %457 = OpLoad %456 
                                Private f32* %458 = OpAccessChain %96 %80 
                                                      OpStore %458 %457 
                                       f32_4 %460 = OpLoad %96 
                                                      OpStore vs_TEXCOORD1 %460 
                                  Input f32* %461 = OpAccessChain %11 %54 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFMul %462 %16 
                                Private f32* %464 = OpAccessChain %9 %26 
                                                      OpStore %464 %463 
                                Private f32* %465 = OpAccessChain %9 %54 
                                                      OpStore %465 %59 
                                       f32_4 %467 = OpLoad %9 
                                                      OpStore vs_TEXCOORD3 %467 
                                       f32_3 %470 = OpLoad %53 
                                                      OpStore vs_TEXCOORD2 %470 
                                 Output f32* %472 = OpAccessChain %325 %280 %54 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFNegate %473 
                                 Output f32* %475 = OpAccessChain %325 %280 %54 
                                                      OpStore %475 %474 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 773
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %28 %37 %185 %201 %313 %757 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 BuiltIn TessLevelOuter 
                                                      OpDecorate vs_TEXCOORD3 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD3 Flat 
                                                      OpDecorate vs_TEXCOORD3 Location 28 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 37 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpMemberDecorate %42 0 Offset 42 
                                                      OpMemberDecorate %42 1 Offset 42 
                                                      OpMemberDecorate %42 2 Offset 42 
                                                      OpMemberDecorate %42 3 Offset 42 
                                                      OpMemberDecorate %42 4 Offset 42 
                                                      OpDecorate %42 Block 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %172 DescriptorSet 172 
                                                      OpDecorate %172 Binding 172 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %176 DescriptorSet 176 
                                                      OpDecorate %176 Binding 176 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %185 Location 185 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %191 DescriptorSet 191 
                                                      OpDecorate %191 Binding 191 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 DescriptorSet 193 
                                                      OpDecorate %193 Binding 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 201 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %209 DescriptorSet 209 
                                                      OpDecorate %209 Binding 209 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %297 DescriptorSet 297 
                                                      OpDecorate %297 Binding 297 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %299 DescriptorSet 299 
                                                      OpDecorate %299 Binding 299 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 313 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %360 DescriptorSet 360 
                                                      OpDecorate %360 Binding 360 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %362 DescriptorSet 362 
                                                      OpDecorate %362 Binding 362 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %682 RelaxedPrecision 
                                                      OpDecorate %683 RelaxedPrecision 
                                                      OpDecorate %687 RelaxedPrecision 
                                                      OpDecorate %688 RelaxedPrecision 
                                                      OpDecorate %690 RelaxedPrecision 
                                                      OpDecorate %691 RelaxedPrecision 
                                                      OpDecorate %692 RelaxedPrecision 
                                                      OpDecorate %695 RelaxedPrecision 
                                                      OpDecorate %698 RelaxedPrecision 
                                                      OpDecorate %700 RelaxedPrecision 
                                                      OpDecorate %705 RelaxedPrecision 
                                                      OpDecorate %706 RelaxedPrecision 
                                                      OpDecorate %710 RelaxedPrecision 
                                                      OpDecorate %711 RelaxedPrecision 
                                                      OpDecorate %712 RelaxedPrecision 
                                                      OpDecorate %713 RelaxedPrecision 
                                                      OpDecorate %714 RelaxedPrecision 
                                                      OpDecorate %715 RelaxedPrecision 
                                                      OpDecorate %722 RelaxedPrecision 
                                                      OpDecorate %730 RelaxedPrecision 
                                                      OpDecorate %731 RelaxedPrecision 
                                                      OpDecorate %735 RelaxedPrecision 
                                                      OpDecorate %736 RelaxedPrecision 
                                                      OpDecorate %737 RelaxedPrecision 
                                                      OpDecorate %738 RelaxedPrecision 
                                                      OpDecorate %741 RelaxedPrecision 
                                                      OpDecorate %742 RelaxedPrecision 
                                                      OpDecorate %743 RelaxedPrecision 
                                                      OpDecorate %747 RelaxedPrecision 
                                                      OpDecorate %748 RelaxedPrecision 
                                                      OpDecorate %749 RelaxedPrecision 
                                                      OpDecorate %750 RelaxedPrecision 
                                                      OpDecorate %757 RelaxedPrecision 
                                                      OpDecorate %757 Location 757 
                                                      OpDecorate %758 RelaxedPrecision 
                                                      OpDecorate %759 RelaxedPrecision 
                                                      OpDecorate %760 RelaxedPrecision 
                                                      OpDecorate %761 RelaxedPrecision 
                                                      OpDecorate %762 RelaxedPrecision 
                                                      OpDecorate %768 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Function %7 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 3 
                                              %18 = OpTypePointer Input %6 
                                              %26 = OpTypePointer Private %16 
                                 Private u32* %27 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD3 = OpVariable Input 
                                          u32 %29 = OpConstant 0 
                                              %33 = OpTypeBool 
                                              %34 = OpTypeVector %33 4 
                                              %35 = OpTypePointer Private %34 
                              Private bool_4* %36 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          u32 %40 = OpConstant 20 
                                              %41 = OpTypeArray %7 %40 
                                              %42 = OpTypeStruct %7 %7 %7 %7 %41 
                                              %43 = OpTypePointer Uniform %42 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[20];}* %44 = OpVariable Uniform 
                                              %45 = OpTypeInt 32 1 
                                          i32 %46 = OpConstant 4 
                                              %49 = OpTypePointer Uniform %7 
                                              %54 = OpTypeVector %33 2 
                                              %69 = OpTypePointer Private %7 
                               Private f32_4* %70 = OpVariable Private 
                                              %71 = OpTypePointer Private %33 
                                          f32 %74 = OpConstant 3.674022E-40 
                                              %76 = OpTypePointer Private %6 
                                          u32 %78 = OpConstant 1 
                                          u32 %83 = OpConstant 2 
                                              %92 = OpTypeVector %6 2 
                                             %100 = OpTypePointer Private %54 
                             Private bool_2* %101 = OpVariable Private 
                                         i32 %104 = OpConstant 3 
                                             %110 = OpTypePointer Private %92 
                              Private f32_2* %111 = OpVariable Private 
                                         f32 %150 = OpConstant 3.674022E-40 
                                       f32_3 %151 = OpConstantComposite %15 %15 %150 
                                         i32 %160 = OpConstant 0 
                                         i32 %161 = OpConstant 1 
                                         i32 %163 = OpConstant -1 
                                Private f32* %169 = OpVariable Private 
                                             %170 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %171 = OpTypePointer UniformConstant %170 
        UniformConstant read_only Texture2D* %172 = OpVariable UniformConstant 
                                             %174 = OpTypeSampler 
                                             %175 = OpTypePointer UniformConstant %174 
                    UniformConstant sampler* %176 = OpVariable UniformConstant 
                                             %178 = OpTypeSampledImage %170 
                                Input f32_4* %185 = OpVariable Input 
                              Private f32_4* %190 = OpVariable Private 
        UniformConstant read_only Texture2D* %191 = OpVariable UniformConstant 
                    UniformConstant sampler* %193 = OpVariable UniformConstant 
                              Private f32_4* %199 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                              Private f32_2* %208 = OpVariable Private 
        UniformConstant read_only Texture2D* %209 = OpVariable UniformConstant 
                    UniformConstant sampler* %211 = OpVariable UniformConstant 
                                Private f32* %223 = OpVariable Private 
                                         f32 %237 = OpConstant 3.674022E-40 
                                         f32 %264 = OpConstant 3.674022E-40 
                                         f32 %266 = OpConstant 3.674022E-40 
                              Private f32_4* %281 = OpVariable Private 
                              Private f32_4* %292 = OpVariable Private 
                              Private f32_4* %296 = OpVariable Private 
        UniformConstant read_only Texture2D* %297 = OpVariable UniformConstant 
                    UniformConstant sampler* %299 = OpVariable UniformConstant 
                             Private bool_2* %311 = OpVariable Private 
                                             %312 = OpTypePointer Input %12 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                       f32_4 %316 = OpConstantComposite %15 %15 %74 %74 
                                             %331 = OpTypePointer Function %92 
                              Private f32_4* %343 = OpVariable Private 
                              Private f32_2* %349 = OpVariable Private 
                              Private f32_2* %351 = OpVariable Private 
                                         i32 %354 = OpConstant 2 
                              Private f32_4* %359 = OpVariable Private 
        UniformConstant read_only Texture2D* %360 = OpVariable UniformConstant 
                    UniformConstant sampler* %362 = OpVariable UniformConstant 
                               Private bool* %367 = OpVariable Private 
                              Private f32_2* %371 = OpVariable Private 
                                         f32 %374 = OpConstant 3.674022E-40 
                                       f32_2 %375 = OpConstantComposite %374 %374 
                                             %380 = OpTypePointer Private %12 
                              Private f32_3* %381 = OpVariable Private 
                                         f32 %389 = OpConstant 3.674022E-40 
                                       f32_2 %390 = OpConstantComposite %389 %389 
                                Private f32* %397 = OpVariable Private 
                              Private f32_3* %405 = OpVariable Private 
                                Private f32* %439 = OpVariable Private 
                               Private bool* %454 = OpVariable Private 
                                             %463 = OpTypePointer Function %6 
                               Private bool* %478 = OpVariable Private 
                                         f32 %479 = OpConstant 3.674022E-40 
                               Private bool* %484 = OpVariable Private 
                              Private f32_2* %501 = OpVariable Private 
                              Private f32_2* %524 = OpVariable Private 
                                         f32 %527 = OpConstant 3.674022E-40 
                                             %530 = OpTypePointer Private %45 
                                Private i32* %531 = OpVariable Private 
                               Private bool* %535 = OpVariable Private 
                             Private bool_2* %568 = OpVariable Private 
                                             %570 = OpTypeVector %45 4 
                                       i32_4 %572 = OpConstantComposite %161 %354 %160 %160 
                               Private bool* %592 = OpVariable Private 
                                Private f32* %629 = OpVariable Private 
                                             %670 = OpTypePointer Uniform %6 
                                       f32_2 %689 = OpConstantComposite %527 %527 
                                         f32 %693 = OpConstant 3.674022E-40 
                                       f32_2 %694 = OpConstantComposite %693 %693 
                                       f32_2 %699 = OpConstantComposite %237 %237 
                              Private f32_4* %741 = OpVariable Private 
                                             %756 = OpTypePointer Output %7 
                               Output f32_4* %757 = OpVariable Output 
                                             %770 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32_4* %9 = OpVariable Function 
                             Function f32_2* %332 = OpVariable Function 
                               Function f32* %464 = OpVariable Function 
                               Function f32* %494 = OpVariable Function 
                               Function f32* %503 = OpVariable Function 
                             Function f32_2* %514 = OpVariable Function 
                               Function f32* %547 = OpVariable Function 
                               Function f32* %558 = OpVariable Function 
                               Function f32* %581 = OpVariable Function 
                               Function f32* %605 = OpVariable Function 
                               Function f32* %635 = OpVariable Function 
                               Function f32* %650 = OpVariable Function 
                               Function f32* %661 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                                   Input f32* %19 = OpAccessChain %11 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFDiv %15 %20 
                                          f32 %22 = OpCompositeExtract %14 0 
                                          f32 %23 = OpCompositeExtract %14 1 
                                          f32 %24 = OpCompositeExtract %14 2 
                                        f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                                      OpStore %9 %25 
                                   Input f32* %30 = OpAccessChain vs_TEXCOORD3 %29 
                                          f32 %31 = OpLoad %30 
                                          u32 %32 = OpConvertFToU %31 
                                                      OpStore %27 %32 
                                        f32_4 %38 = OpLoad vs_TEXCOORD0 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 3 2 
                                          u32 %47 = OpLoad %27 
                                          i32 %48 = OpBitcast %47 
                               Uniform f32_4* %50 = OpAccessChain %44 %46 %48 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 1 0 
                                       bool_4 %53 = OpFOrdGreaterThanEqual %39 %52 
                                       bool_2 %55 = OpVectorShuffle %53 %53 1 2 
                                       bool_4 %56 = OpLoad %36 
                                       bool_4 %57 = OpVectorShuffle %56 %55 0 4 5 3 
                                                      OpStore %36 %57 
                                          u32 %58 = OpLoad %27 
                                          i32 %59 = OpBitcast %58 
                               Uniform f32_4* %60 = OpAccessChain %44 %46 %59 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpVectorShuffle %61 %61 2 2 2 3 
                                        f32_4 %63 = OpLoad vs_TEXCOORD0 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 3 
                                       bool_4 %65 = OpFOrdGreaterThanEqual %62 %64 
                                       bool_2 %66 = OpVectorShuffle %65 %65 0 3 
                                       bool_4 %67 = OpLoad %36 
                                       bool_4 %68 = OpVectorShuffle %67 %66 4 1 2 5 
                                                      OpStore %36 %68 
                                Private bool* %72 = OpAccessChain %36 %29 
                                         bool %73 = OpLoad %72 
                                          f32 %75 = OpSelect %73 %15 %74 
                                 Private f32* %77 = OpAccessChain %70 %29 
                                                      OpStore %77 %75 
                                Private bool* %79 = OpAccessChain %36 %78 
                                         bool %80 = OpLoad %79 
                                          f32 %81 = OpSelect %80 %15 %74 
                                 Private f32* %82 = OpAccessChain %70 %78 
                                                      OpStore %82 %81 
                                Private bool* %84 = OpAccessChain %36 %83 
                                         bool %85 = OpLoad %84 
                                          f32 %86 = OpSelect %85 %15 %74 
                                 Private f32* %87 = OpAccessChain %70 %83 
                                                      OpStore %87 %86 
                                Private bool* %88 = OpAccessChain %36 %17 
                                         bool %89 = OpLoad %88 
                                          f32 %90 = OpSelect %89 %15 %74 
                                 Private f32* %91 = OpAccessChain %70 %17 
                                                      OpStore %91 %90 
                                        f32_4 %93 = OpLoad %70 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                        f32_4 %95 = OpLoad %70 
                                        f32_2 %96 = OpVectorShuffle %95 %95 1 2 
                                        f32_2 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %70 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %70 %99 
                                       f32_4 %102 = OpLoad %9 
                                       f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
                              Uniform f32_4* %105 = OpAccessChain %44 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 1 0 1 
                                      bool_4 %108 = OpFOrdGreaterThanEqual %103 %107 
                                      bool_2 %109 = OpVectorShuffle %108 %108 0 1 
                                                      OpStore %101 %109 
                               Private bool* %112 = OpAccessChain %101 %29 
                                        bool %113 = OpLoad %112 
                                         f32 %114 = OpSelect %113 %15 %74 
                                Private f32* %115 = OpAccessChain %111 %29 
                                                      OpStore %115 %114 
                               Private bool* %116 = OpAccessChain %101 %78 
                                        bool %117 = OpLoad %116 
                                         f32 %118 = OpSelect %117 %15 %74 
                                Private f32* %119 = OpAccessChain %111 %78 
                                                      OpStore %119 %118 
                                       f32_2 %120 = OpLoad %111 
                                       f32_4 %121 = OpLoad %70 
                                       f32_2 %122 = OpVectorShuffle %121 %121 0 1 
                                       f32_2 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %70 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 2 3 
                                                      OpStore %70 %125 
                              Uniform f32_4* %126 = OpAccessChain %44 %104 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpVectorShuffle %127 %127 2 3 2 3 
                                       f32_4 %129 = OpLoad %9 
                                       f32_4 %130 = OpVectorShuffle %129 %129 0 1 0 1 
                                      bool_4 %131 = OpFOrdGreaterThanEqual %128 %130 
                                      bool_2 %132 = OpVectorShuffle %131 %131 0 1 
                                                      OpStore %101 %132 
                               Private bool* %133 = OpAccessChain %101 %29 
                                        bool %134 = OpLoad %133 
                                         f32 %135 = OpSelect %134 %15 %74 
                                Private f32* %136 = OpAccessChain %111 %29 
                                                      OpStore %136 %135 
                               Private bool* %137 = OpAccessChain %101 %78 
                                        bool %138 = OpLoad %137 
                                         f32 %139 = OpSelect %138 %15 %74 
                                Private f32* %140 = OpAccessChain %111 %78 
                                                      OpStore %140 %139 
                                       f32_2 %141 = OpLoad %111 
                                       f32_4 %142 = OpLoad %70 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFAdd %141 %143 
                                       f32_4 %145 = OpLoad %70 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 5 2 3 
                                                      OpStore %70 %146 
                                Private f32* %147 = OpAccessChain %70 %83 
                                                      OpStore %147 %15 
                                       f32_4 %148 = OpLoad %70 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                         f32 %152 = OpDot %149 %151 
                                Private f32* %153 = OpAccessChain %70 %29 
                                                      OpStore %153 %152 
                                Private f32* %154 = OpAccessChain %70 %29 
                                         f32 %155 = OpLoad %154 
                                        bool %156 = OpFOrdLessThan %155 %74 
                               Private bool* %157 = OpAccessChain %36 %29 
                                                      OpStore %157 %156 
                               Private bool* %158 = OpAccessChain %36 %29 
                                        bool %159 = OpLoad %158 
                                         i32 %162 = OpSelect %159 %161 %160 
                                         i32 %164 = OpIMul %162 %163 
                                        bool %165 = OpINotEqual %164 %160 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %167 
                                             %166 = OpLabel 
                                                      OpKill
                                             %167 = OpLabel 
                         read_only Texture2D %173 = OpLoad %172 
                                     sampler %177 = OpLoad %176 
                  read_only Texture2DSampled %179 = OpSampledImage %173 %177 
                                       f32_4 %180 = OpLoad vs_TEXCOORD3 
                                       f32_2 %181 = OpVectorShuffle %180 %180 2 3 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                         f32 %183 = OpCompositeExtract %182 3 
                                                      OpStore %169 %183 
                                         f32 %184 = OpLoad %169 
                                  Input f32* %186 = OpAccessChain %185 %17 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFMul %184 %187 
                                Private f32* %189 = OpAccessChain %70 %29 
                                                      OpStore %189 %188 
                         read_only Texture2D %192 = OpLoad %191 
                                     sampler %194 = OpLoad %193 
                  read_only Texture2DSampled %195 = OpSampledImage %192 %194 
                                       f32_4 %196 = OpLoad vs_TEXCOORD0 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_4 %198 = OpImageSampleImplicitLod %195 %197 
                                                      OpStore %190 %198 
                                       f32_4 %200 = OpLoad %190 
                                       f32_4 %202 = OpLoad vs_TEXCOORD1 
                                       f32_4 %203 = OpVectorShuffle %202 %202 1 1 1 1 
                                       f32_4 %204 = OpFMul %200 %203 
                                       f32_4 %205 = OpLoad vs_TEXCOORD1 
                                       f32_4 %206 = OpVectorShuffle %205 %205 3 3 3 3 
                                       f32_4 %207 = OpFAdd %204 %206 
                                                      OpStore %199 %207 
                         read_only Texture2D %210 = OpLoad %209 
                                     sampler %212 = OpLoad %211 
                  read_only Texture2DSampled %213 = OpSampledImage %210 %212 
                                       f32_4 %214 = OpLoad vs_TEXCOORD0 
                                       f32_2 %215 = OpVectorShuffle %214 %214 0 1 
                                       f32_4 %216 = OpImageSampleImplicitLod %213 %215 
                                         f32 %217 = OpCompositeExtract %216 3 
                                Private f32* %218 = OpAccessChain %208 %29 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %208 %29 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpDPdx %220 
                                Private f32* %222 = OpAccessChain %111 %29 
                                                      OpStore %222 %221 
                                Private f32* %224 = OpAccessChain %208 %29 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpDPdy %225 
                                                      OpStore %223 %226 
                                         f32 %227 = OpLoad %223 
                                         f32 %228 = OpExtInst %1 4 %227 
                                Private f32* %229 = OpAccessChain %111 %29 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpExtInst %1 4 %230 
                                         f32 %232 = OpFAdd %228 %231 
                                Private f32* %233 = OpAccessChain %111 %29 
                                                      OpStore %233 %232 
                                Private f32* %234 = OpAccessChain %111 %29 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFNegate %235 
                                         f32 %238 = OpFAdd %236 %237 
                                                      OpStore %223 %238 
                                Private f32* %239 = OpAccessChain %111 %29 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpFAdd %240 %237 
                                Private f32* %242 = OpAccessChain %208 %78 
                                                      OpStore %242 %241 
                                         f32 %243 = OpLoad %223 
                                       f32_2 %244 = OpCompositeConstruct %243 %243 
                                       f32_2 %245 = OpFNegate %244 
                                       f32_2 %246 = OpLoad %208 
                                       f32_2 %247 = OpFAdd %245 %246 
                                                      OpStore %208 %247 
                                Private f32* %248 = OpAccessChain %208 %78 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFDiv %15 %249 
                                Private f32* %251 = OpAccessChain %111 %29 
                                                      OpStore %251 %250 
                                Private f32* %252 = OpAccessChain %111 %29 
                                         f32 %253 = OpLoad %252 
                                Private f32* %254 = OpAccessChain %208 %29 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpFMul %253 %255 
                                Private f32* %257 = OpAccessChain %208 %29 
                                                      OpStore %257 %256 
                                Private f32* %258 = OpAccessChain %208 %29 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpExtInst %1 43 %259 %74 %15 
                                Private f32* %261 = OpAccessChain %208 %29 
                                                      OpStore %261 %260 
                                Private f32* %262 = OpAccessChain %208 %29 
                                         f32 %263 = OpLoad %262 
                                         f32 %265 = OpFMul %263 %264 
                                         f32 %267 = OpFAdd %265 %266 
                                Private f32* %268 = OpAccessChain %111 %29 
                                                      OpStore %268 %267 
                                Private f32* %269 = OpAccessChain %208 %29 
                                         f32 %270 = OpLoad %269 
                                Private f32* %271 = OpAccessChain %208 %29 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFMul %270 %272 
                                Private f32* %274 = OpAccessChain %208 %29 
                                                      OpStore %274 %273 
                                Private f32* %275 = OpAccessChain %208 %29 
                                         f32 %276 = OpLoad %275 
                                Private f32* %277 = OpAccessChain %111 %29 
                                         f32 %278 = OpLoad %277 
                                         f32 %279 = OpFMul %276 %278 
                                Private f32* %280 = OpAccessChain %208 %29 
                                                      OpStore %280 %279 
                                       f32_4 %282 = OpLoad vs_TEXCOORD1 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 0 0 
                                       f32_4 %284 = OpLoad %281 
                                       f32_4 %285 = OpVectorShuffle %284 %283 4 5 6 3 
                                                      OpStore %281 %285 
                                Private f32* %286 = OpAccessChain %208 %29 
                                         f32 %287 = OpLoad %286 
                                  Input f32* %288 = OpAccessChain vs_TEXCOORD1 %29 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFMul %287 %289 
                                Private f32* %291 = OpAccessChain %281 %17 
                                                      OpStore %291 %290 
                                       f32_4 %293 = OpLoad %199 
                                       f32_4 %294 = OpLoad %281 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %292 %295 
                         read_only Texture2D %298 = OpLoad %297 
                                     sampler %300 = OpLoad %299 
                  read_only Texture2DSampled %301 = OpSampledImage %298 %300 
                                       f32_4 %302 = OpLoad vs_TEXCOORD0 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                       f32_4 %304 = OpImageSampleImplicitLod %301 %303 
                                                      OpStore %296 %304 
                                       f32_4 %305 = OpLoad %296 
                                       f32_4 %306 = OpLoad vs_TEXCOORD1 
                                       f32_4 %307 = OpVectorShuffle %306 %306 2 2 2 2 
                                       f32_4 %308 = OpFMul %305 %307 
                                       f32_4 %309 = OpLoad %292 
                                       f32_4 %310 = OpFAdd %308 %309 
                                                      OpStore %199 %310 
                                       f32_3 %314 = OpLoad vs_TEXCOORD2 
                                       f32_4 %315 = OpVectorShuffle %314 %314 0 1 0 0 
                                      bool_4 %317 = OpFOrdEqual %315 %316 
                                      bool_2 %318 = OpVectorShuffle %317 %317 0 1 
                                                      OpStore %311 %318 
                               Private bool* %319 = OpAccessChain %311 %78 
                                        bool %320 = OpLoad %319 
                               Private bool* %321 = OpAccessChain %311 %29 
                                        bool %322 = OpLoad %321 
                                        bool %323 = OpLogicalOr %320 %322 
                               Private bool* %324 = OpAccessChain %311 %29 
                                                      OpStore %324 %323 
                               Private bool* %325 = OpAccessChain %311 %29 
                                        bool %326 = OpLoad %325 
                                                      OpSelectionMerge %328 None 
                                                      OpBranchConditional %326 %327 %754 
                                             %327 = OpLabel 
                               Private bool* %329 = OpAccessChain %311 %78 
                                        bool %330 = OpLoad %329 
                                                      OpSelectionMerge %334 None 
                                                      OpBranchConditional %330 %333 %338 
                                             %333 = OpLabel 
                              Uniform f32_4* %335 = OpAccessChain %44 %161 
                                       f32_4 %336 = OpLoad %335 
                                       f32_2 %337 = OpVectorShuffle %336 %336 0 1 
                                                      OpStore %332 %337 
                                                      OpBranch %334 
                                             %338 = OpLabel 
                              Uniform f32_4* %339 = OpAccessChain %44 %160 
                                       f32_4 %340 = OpLoad %339 
                                       f32_2 %341 = OpVectorShuffle %340 %340 0 1 
                                                      OpStore %332 %341 
                                                      OpBranch %334 
                                             %334 = OpLabel 
                                       f32_2 %342 = OpLoad %332 
                                                      OpStore %208 %342 
                                  Input f32* %344 = OpAccessChain vs_TEXCOORD2 %83 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpFAdd %345 %237 
                                Private f32* %347 = OpAccessChain %343 %78 
                                                      OpStore %347 %346 
                                Private f32* %348 = OpAccessChain %343 %29 
                                                      OpStore %348 %237 
                                Private f32* %350 = OpAccessChain %349 %78 
                                                      OpStore %350 %74 
                                       f32_4 %352 = OpLoad %343 
                                       f32_2 %353 = OpVectorShuffle %352 %352 0 1 
                              Uniform f32_4* %355 = OpAccessChain %44 %354 
                                       f32_4 %356 = OpLoad %355 
                                       f32_2 %357 = OpVectorShuffle %356 %356 0 1 
                                       f32_2 %358 = OpFMul %353 %357 
                                                      OpStore %351 %358 
                         read_only Texture2D %361 = OpLoad %360 
                                     sampler %363 = OpLoad %362 
                  read_only Texture2DSampled %364 = OpSampledImage %361 %363 
                                       f32_2 %365 = OpLoad %351 
                                       f32_4 %366 = OpImageSampleImplicitLod %364 %365 
                                                      OpStore %359 %366 
                                Private f32* %368 = OpAccessChain %359 %29 
                                         f32 %369 = OpLoad %368 
                                        bool %370 = OpFOrdLessThan %74 %369 
                                                      OpStore %367 %370 
                                       f32_4 %372 = OpLoad %359 
                                       f32_2 %373 = OpVectorShuffle %372 %372 2 3 
                                       f32_2 %376 = OpFAdd %373 %375 
                                                      OpStore %371 %376 
                                       f32_2 %377 = OpLoad %371 
                                       f32_2 %378 = OpLoad %371 
                                       f32_2 %379 = OpFAdd %377 %378 
                                                      OpStore %371 %379 
                                       f32_4 %382 = OpLoad vs_TEXCOORD0 
                                       f32_2 %383 = OpVectorShuffle %382 %382 0 1 
                                       f32_2 %384 = OpFAdd %383 %375 
                                       f32_3 %385 = OpLoad %381 
                                       f32_3 %386 = OpVectorShuffle %385 %384 3 1 4 
                                                      OpStore %381 %386 
                                       f32_3 %387 = OpLoad %381 
                                       f32_2 %388 = OpVectorShuffle %387 %387 0 2 
                                       f32_2 %391 = OpFMul %388 %390 
                                       f32_2 %392 = OpLoad %371 
                                       f32_2 %393 = OpFNegate %392 
                                       f32_2 %394 = OpFAdd %391 %393 
                                       f32_3 %395 = OpLoad %381 
                                       f32_3 %396 = OpVectorShuffle %395 %394 3 1 4 
                                                      OpStore %381 %396 
                                       f32_3 %398 = OpLoad %381 
                                       f32_2 %399 = OpVectorShuffle %398 %398 0 2 
                                       f32_3 %400 = OpLoad %381 
                                       f32_2 %401 = OpVectorShuffle %400 %400 0 2 
                                         f32 %402 = OpDot %399 %401 
                                                      OpStore %397 %402 
                                         f32 %403 = OpLoad %397 
                                         f32 %404 = OpExtInst %1 32 %403 
                                                      OpStore %397 %404 
                                         f32 %406 = OpLoad %397 
                                       f32_2 %407 = OpCompositeConstruct %406 %406 
                                       f32_3 %408 = OpLoad %381 
                                       f32_2 %409 = OpVectorShuffle %408 %408 0 2 
                                       f32_2 %410 = OpFMul %407 %409 
                                       f32_3 %411 = OpLoad %405 
                                       f32_3 %412 = OpVectorShuffle %411 %410 3 4 2 
                                                      OpStore %405 %412 
                                       f32_2 %413 = OpLoad %371 
                                       f32_2 %414 = OpFNegate %413 
                                       f32_3 %415 = OpLoad %405 
                                       f32_2 %416 = OpVectorShuffle %415 %415 0 1 
                                         f32 %417 = OpDot %414 %416 
                                                      OpStore %397 %417 
                                       f32_2 %418 = OpLoad %371 
                                       f32_2 %419 = OpLoad %371 
                                         f32 %420 = OpDot %418 %419 
                                Private f32* %421 = OpAccessChain %371 %29 
                                                      OpStore %421 %420 
                                         f32 %422 = OpLoad %397 
                                         f32 %423 = OpFNegate %422 
                                         f32 %424 = OpLoad %397 
                                         f32 %425 = OpFMul %423 %424 
                                Private f32* %426 = OpAccessChain %371 %29 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFAdd %425 %427 
                                Private f32* %429 = OpAccessChain %371 %29 
                                                      OpStore %429 %428 
                                Private f32* %430 = OpAccessChain %371 %29 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpFNegate %431 
                                         f32 %433 = OpFAdd %432 %15 
                                Private f32* %434 = OpAccessChain %371 %29 
                                                      OpStore %434 %433 
                                Private f32* %435 = OpAccessChain %371 %29 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpExtInst %1 31 %436 
                                Private f32* %438 = OpAccessChain %371 %29 
                                                      OpStore %438 %437 
                                Private f32* %440 = OpAccessChain %371 %29 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFNegate %441 
                                         f32 %443 = OpLoad %397 
                                         f32 %444 = OpFAdd %442 %443 
                                                      OpStore %439 %444 
                                Private f32* %445 = OpAccessChain %371 %29 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpLoad %397 
                                         f32 %448 = OpFAdd %446 %447 
                                Private f32* %449 = OpAccessChain %371 %29 
                                                      OpStore %449 %448 
                                Private f32* %450 = OpAccessChain %371 %29 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpLoad %439 
                                         f32 %453 = OpExtInst %1 37 %451 %452 
                                                      OpStore %397 %453 
                                         f32 %455 = OpLoad %397 
                                        bool %456 = OpFOrdLessThan %455 %74 
                                                      OpStore %454 %456 
                                Private f32* %457 = OpAccessChain %371 %29 
                                         f32 %458 = OpLoad %457 
                                         f32 %459 = OpLoad %439 
                                         f32 %460 = OpExtInst %1 40 %458 %459 
                                Private f32* %461 = OpAccessChain %371 %29 
                                                      OpStore %461 %460 
                                        bool %462 = OpLoad %454 
                                                      OpSelectionMerge %466 None 
                                                      OpBranchConditional %462 %465 %469 
                                             %465 = OpLabel 
                                Private f32* %467 = OpAccessChain %371 %29 
                                         f32 %468 = OpLoad %467 
                                                      OpStore %464 %468 
                                                      OpBranch %466 
                                             %469 = OpLabel 
                                         f32 %470 = OpLoad %397 
                                                      OpStore %464 %470 
                                                      OpBranch %466 
                                             %466 = OpLabel 
                                         f32 %471 = OpLoad %464 
                                Private f32* %472 = OpAccessChain %371 %29 
                                                      OpStore %472 %471 
                                       f32_2 %473 = OpLoad %371 
                                       f32_2 %474 = OpVectorShuffle %473 %473 0 0 
                                       f32_3 %475 = OpLoad %405 
                                       f32_2 %476 = OpVectorShuffle %475 %475 0 1 
                                       f32_2 %477 = OpFMul %474 %476 
                                                      OpStore %371 %477 
                                Private f32* %480 = OpAccessChain %371 %29 
                                         f32 %481 = OpLoad %480 
                                         f32 %482 = OpExtInst %1 4 %481 
                                        bool %483 = OpFOrdGreaterThanEqual %479 %482 
                                                      OpStore %478 %483 
                                Private f32* %485 = OpAccessChain %371 %78 
                                         f32 %486 = OpLoad %485 
                                         f32 %487 = OpExtInst %1 4 %486 
                                        bool %488 = OpFOrdLessThan %479 %487 
                                                      OpStore %484 %488 
                                       f32_3 %489 = OpLoad %381 
                                       f32_2 %490 = OpVectorShuffle %489 %489 0 2 
                                       f32_2 %491 = OpLoad %371 
                                       f32_2 %492 = OpFDiv %490 %491 
                                                      OpStore %371 %492 
                                        bool %493 = OpLoad %484 
                                                      OpSelectionMerge %496 None 
                                                      OpBranchConditional %493 %495 %499 
                                             %495 = OpLabel 
                                Private f32* %497 = OpAccessChain %371 %78 
                                         f32 %498 = OpLoad %497 
                                                      OpStore %494 %498 
                                                      OpBranch %496 
                                             %499 = OpLabel 
                                                      OpStore %494 %74 
                                                      OpBranch %496 
                                             %496 = OpLabel 
                                         f32 %500 = OpLoad %494 
                                                      OpStore %439 %500 
                                        bool %502 = OpLoad %478 
                                                      OpSelectionMerge %505 None 
                                                      OpBranchConditional %502 %504 %507 
                                             %504 = OpLabel 
                                         f32 %506 = OpLoad %439 
                                                      OpStore %503 %506 
                                                      OpBranch %505 
                                             %507 = OpLabel 
                                Private f32* %508 = OpAccessChain %371 %29 
                                         f32 %509 = OpLoad %508 
                                                      OpStore %503 %509 
                                                      OpBranch %505 
                                             %505 = OpLabel 
                                         f32 %510 = OpLoad %503 
                                Private f32* %511 = OpAccessChain %501 %29 
                                                      OpStore %511 %510 
                                Private f32* %512 = OpAccessChain %501 %78 
                                                      OpStore %512 %74 
                                        bool %513 = OpLoad %367 
                                                      OpSelectionMerge %516 None 
                                                      OpBranchConditional %513 %515 %518 
                                             %515 = OpLabel 
                                       f32_2 %517 = OpLoad %501 
                                                      OpStore %514 %517 
                                                      OpBranch %516 
                                             %518 = OpLabel 
                                       f32_4 %519 = OpLoad vs_TEXCOORD0 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 1 
                                                      OpStore %514 %520 
                                                      OpBranch %516 
                                             %516 = OpLabel 
                                       f32_2 %521 = OpLoad %514 
                                       f32_3 %522 = OpLoad %405 
                                       f32_3 %523 = OpVectorShuffle %522 %521 0 3 4 
                                                      OpStore %405 %523 
                                Private f32* %525 = OpAccessChain %359 %78 
                                         f32 %526 = OpLoad %525 
                                         f32 %528 = OpFMul %526 %527 
                                Private f32* %529 = OpAccessChain %524 %29 
                                                      OpStore %529 %528 
                                Private f32* %532 = OpAccessChain %524 %29 
                                         f32 %533 = OpLoad %532 
                                         i32 %534 = OpConvertFToS %533 
                                                      OpStore %531 %534 
                                Private f32* %536 = OpAccessChain %405 %78 
                                         f32 %537 = OpLoad %536 
                                Private f32* %538 = OpAccessChain %405 %78 
                                         f32 %539 = OpLoad %538 
                                         f32 %540 = OpFNegate %539 
                                        bool %541 = OpFOrdGreaterThanEqual %537 %540 
                                                      OpStore %535 %541 
                                Private f32* %542 = OpAccessChain %405 %78 
                                         f32 %543 = OpLoad %542 
                                         f32 %544 = OpExtInst %1 4 %543 
                                         f32 %545 = OpExtInst %1 10 %544 
                                                      OpStore %439 %545 
                                        bool %546 = OpLoad %535 
                                                      OpSelectionMerge %549 None 
                                                      OpBranchConditional %546 %548 %551 
                                             %548 = OpLabel 
                                         f32 %550 = OpLoad %439 
                                                      OpStore %547 %550 
                                                      OpBranch %549 
                                             %551 = OpLabel 
                                         f32 %552 = OpLoad %439 
                                         f32 %553 = OpFNegate %552 
                                                      OpStore %547 %553 
                                                      OpBranch %549 
                                             %549 = OpLabel 
                                         f32 %554 = OpLoad %547 
                                Private f32* %555 = OpAccessChain %371 %29 
                                                      OpStore %555 %554 
                                         i32 %556 = OpLoad %531 
                                        bool %557 = OpINotEqual %556 %160 
                                                      OpSelectionMerge %560 None 
                                                      OpBranchConditional %557 %559 %563 
                                             %559 = OpLabel 
                                Private f32* %561 = OpAccessChain %405 %78 
                                         f32 %562 = OpLoad %561 
                                                      OpStore %558 %562 
                                                      OpBranch %560 
                                             %563 = OpLabel 
                                Private f32* %564 = OpAccessChain %371 %29 
                                         f32 %565 = OpLoad %564 
                                                      OpStore %558 %565 
                                                      OpBranch %560 
                                             %560 = OpLabel 
                                         f32 %566 = OpLoad %558 
                                Private f32* %567 = OpAccessChain %371 %29 
                                                      OpStore %567 %566 
                                         i32 %569 = OpLoad %531 
                                       i32_4 %571 = OpCompositeConstruct %569 %569 %569 %569 
                                      bool_4 %573 = OpIEqual %571 %572 
                                      bool_2 %574 = OpVectorShuffle %573 %573 0 1 
                                                      OpStore %568 %574 
                                Private f32* %575 = OpAccessChain %371 %29 
                                         f32 %576 = OpLoad %575 
                                                      OpStore %223 %576 
                                         f32 %577 = OpLoad %223 
                                         f32 %578 = OpExtInst %1 43 %577 %74 %15 
                                                      OpStore %223 %578 
                               Private bool* %579 = OpAccessChain %568 %29 
                                        bool %580 = OpLoad %579 
                                                      OpSelectionMerge %583 None 
                                                      OpBranchConditional %580 %582 %585 
                                             %582 = OpLabel 
                                         f32 %584 = OpLoad %223 
                                                      OpStore %581 %584 
                                                      OpBranch %583 
                                             %585 = OpLabel 
                                Private f32* %586 = OpAccessChain %371 %29 
                                         f32 %587 = OpLoad %586 
                                                      OpStore %581 %587 
                                                      OpBranch %583 
                                             %583 = OpLabel 
                                         f32 %588 = OpLoad %581 
                                                      OpStore %223 %588 
                                         f32 %589 = OpLoad %223 
                                         f32 %590 = OpFMul %589 %237 
                                Private f32* %591 = OpAccessChain %371 %29 
                                                      OpStore %591 %590 
                                Private f32* %593 = OpAccessChain %371 %29 
                                         f32 %594 = OpLoad %593 
                                Private f32* %595 = OpAccessChain %371 %29 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFNegate %596 
                                        bool %598 = OpFOrdGreaterThanEqual %594 %597 
                                                      OpStore %592 %598 
                                Private f32* %599 = OpAccessChain %371 %29 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpExtInst %1 4 %600 
                                         f32 %602 = OpExtInst %1 10 %601 
                                Private f32* %603 = OpAccessChain %371 %29 
                                                      OpStore %603 %602 
                                        bool %604 = OpLoad %592 
                                                      OpSelectionMerge %607 None 
                                                      OpBranchConditional %604 %606 %610 
                                             %606 = OpLabel 
                                Private f32* %608 = OpAccessChain %371 %29 
                                         f32 %609 = OpLoad %608 
                                                      OpStore %605 %609 
                                                      OpBranch %607 
                                             %610 = OpLabel 
                                Private f32* %611 = OpAccessChain %371 %29 
                                         f32 %612 = OpLoad %611 
                                         f32 %613 = OpFNegate %612 
                                                      OpStore %605 %613 
                                                      OpBranch %607 
                                             %607 = OpLabel 
                                         f32 %614 = OpLoad %605 
                                Private f32* %615 = OpAccessChain %371 %29 
                                                      OpStore %615 %614 
                                Private f32* %616 = OpAccessChain %371 %29 
                                         f32 %617 = OpLoad %616 
                                Private f32* %618 = OpAccessChain %371 %29 
                                         f32 %619 = OpLoad %618 
                                         f32 %620 = OpFAdd %617 %619 
                                                      OpStore %439 %620 
                                Private f32* %621 = OpAccessChain %371 %29 
                                         f32 %622 = OpLoad %621 
                                        bool %623 = OpFOrdLessThan %237 %622 
                                                      OpStore %535 %623 
                                         f32 %624 = OpLoad %439 
                                         f32 %625 = OpLoad %439 
                                         f32 %626 = OpFNegate %625 
                                        bool %627 = OpFOrdGreaterThanEqual %624 %626 
                               Private bool* %628 = OpAccessChain %568 %29 
                                                      OpStore %628 %627 
                                         f32 %630 = OpLoad %439 
                                         f32 %631 = OpExtInst %1 4 %630 
                                         f32 %632 = OpExtInst %1 10 %631 
                                                      OpStore %629 %632 
                               Private bool* %633 = OpAccessChain %568 %29 
                                        bool %634 = OpLoad %633 
                                                      OpSelectionMerge %637 None 
                                                      OpBranchConditional %634 %636 %639 
                                             %636 = OpLabel 
                                         f32 %638 = OpLoad %629 
                                                      OpStore %635 %638 
                                                      OpBranch %637 
                                             %639 = OpLabel 
                                         f32 %640 = OpLoad %629 
                                         f32 %641 = OpFNegate %640 
                                                      OpStore %635 %641 
                                                      OpBranch %637 
                                             %637 = OpLabel 
                                         f32 %642 = OpLoad %635 
                                Private f32* %643 = OpAccessChain %381 %29 
                                                      OpStore %643 %642 
                                Private f32* %644 = OpAccessChain %381 %29 
                                         f32 %645 = OpLoad %644 
                                         f32 %646 = OpFNegate %645 
                                         f32 %647 = OpFAdd %646 %15 
                                Private f32* %648 = OpAccessChain %381 %29 
                                                      OpStore %648 %647 
                                        bool %649 = OpLoad %535 
                                                      OpSelectionMerge %652 None 
                                                      OpBranchConditional %649 %651 %655 
                                             %651 = OpLabel 
                                Private f32* %653 = OpAccessChain %381 %29 
                                         f32 %654 = OpLoad %653 
                                                      OpStore %650 %654 
                                                      OpBranch %652 
                                             %655 = OpLabel 
                                         f32 %656 = OpLoad %439 
                                                      OpStore %650 %656 
                                                      OpBranch %652 
                                             %652 = OpLabel 
                                         f32 %657 = OpLoad %650 
                                Private f32* %658 = OpAccessChain %371 %29 
                                                      OpStore %658 %657 
                               Private bool* %659 = OpAccessChain %568 %78 
                                        bool %660 = OpLoad %659 
                                                      OpSelectionMerge %663 None 
                                                      OpBranchConditional %660 %662 %666 
                                             %662 = OpLabel 
                                Private f32* %664 = OpAccessChain %371 %29 
                                         f32 %665 = OpLoad %664 
                                                      OpStore %661 %665 
                                                      OpBranch %663 
                                             %666 = OpLabel 
                                         f32 %667 = OpLoad %223 
                                                      OpStore %661 %667 
                                                      OpBranch %663 
                                             %663 = OpLabel 
                                         f32 %668 = OpLoad %661 
                                Private f32* %669 = OpAccessChain %405 %29 
                                                      OpStore %669 %668 
                                Uniform f32* %671 = OpAccessChain %44 %354 %29 
                                         f32 %672 = OpLoad %671 
                                Private f32* %673 = OpAccessChain %349 %29 
                                                      OpStore %673 %672 
                                       f32_4 %674 = OpLoad %343 
                                       f32_2 %675 = OpVectorShuffle %674 %674 0 1 
                              Uniform f32_4* %676 = OpAccessChain %44 %354 
                                       f32_4 %677 = OpLoad %676 
                                       f32_2 %678 = OpVectorShuffle %677 %677 0 1 
                                       f32_2 %679 = OpFMul %675 %678 
                                       f32_2 %680 = OpLoad %349 
                                       f32_2 %681 = OpFAdd %679 %680 
                                                      OpStore %371 %681 
                         read_only Texture2D %682 = OpLoad %360 
                                     sampler %683 = OpLoad %362 
                  read_only Texture2DSampled %684 = OpSampledImage %682 %683 
                                       f32_2 %685 = OpLoad %371 
                                       f32_4 %686 = OpImageSampleImplicitLod %684 %685 
                                                      OpStore %359 %686 
                                       f32_4 %687 = OpLoad %359 
                                       f32_2 %688 = OpVectorShuffle %687 %687 1 3 
                                       f32_2 %690 = OpFMul %688 %689 
                                                      OpStore %371 %690 
                                       f32_4 %691 = OpLoad %359 
                                       f32_2 %692 = OpVectorShuffle %691 %691 0 2 
                                       f32_2 %695 = OpFMul %692 %694 
                                       f32_2 %696 = OpLoad %371 
                                       f32_2 %697 = OpFAdd %695 %696 
                                                      OpStore %524 %697 
                                       f32_2 %698 = OpLoad %524 
                                       f32_2 %700 = OpFAdd %698 %699 
                                                      OpStore %371 %700 
                                       f32_2 %701 = OpLoad %349 
                                       f32_2 %702 = OpFMul %701 %390 
                                       f32_2 %703 = OpLoad %351 
                                       f32_2 %704 = OpFAdd %702 %703 
                                                      OpStore %351 %704 
                         read_only Texture2D %705 = OpLoad %360 
                                     sampler %706 = OpLoad %362 
                  read_only Texture2DSampled %707 = OpSampledImage %705 %706 
                                       f32_2 %708 = OpLoad %351 
                                       f32_4 %709 = OpImageSampleImplicitLod %707 %708 
                                                      OpStore %296 %709 
                                       f32_4 %710 = OpLoad %296 
                                       f32_2 %711 = OpVectorShuffle %710 %710 1 3 
                                       f32_2 %712 = OpFMul %711 %689 
                                                      OpStore %351 %712 
                                       f32_4 %713 = OpLoad %296 
                                       f32_2 %714 = OpVectorShuffle %713 %713 0 2 
                                       f32_2 %715 = OpFMul %714 %694 
                                       f32_2 %716 = OpLoad %351 
                                       f32_2 %717 = OpFAdd %715 %716 
                                                      OpStore %524 %717 
                                       f32_2 %718 = OpLoad %208 
                                       f32_2 %719 = OpLoad %371 
                                       f32_2 %720 = OpFMul %718 %719 
                                                      OpStore %351 %720 
                                       f32_2 %721 = OpLoad %208 
                                       f32_2 %722 = OpLoad %524 
                                       f32_2 %723 = OpFMul %721 %722 
                                                      OpStore %208 %723 
                                       f32_3 %724 = OpLoad %405 
                                       f32_2 %725 = OpVectorShuffle %724 %724 0 2 
                                       f32_2 %726 = OpLoad %208 
                                       f32_2 %727 = OpFMul %725 %726 
                                       f32_2 %728 = OpLoad %351 
                                       f32_2 %729 = OpFAdd %727 %728 
                                                      OpStore %208 %729 
                         read_only Texture2D %730 = OpLoad %191 
                                     sampler %731 = OpLoad %193 
                  read_only Texture2DSampled %732 = OpSampledImage %730 %731 
                                       f32_2 %733 = OpLoad %208 
                                       f32_4 %734 = OpImageSampleImplicitLod %732 %733 
                                                      OpStore %296 %734 
                                       f32_4 %735 = OpLoad %296 
                                       f32_3 %736 = OpLoad vs_TEXCOORD2 
                                       f32_4 %737 = OpVectorShuffle %736 %736 0 0 0 0 
                                       f32_4 %738 = OpFMul %735 %737 
                                       f32_4 %739 = OpLoad %199 
                                       f32_4 %740 = OpFAdd %738 %739 
                                                      OpStore %343 %740 
                         read_only Texture2D %742 = OpLoad %297 
                                     sampler %743 = OpLoad %299 
                  read_only Texture2DSampled %744 = OpSampledImage %742 %743 
                                       f32_2 %745 = OpLoad %208 
                                       f32_4 %746 = OpImageSampleImplicitLod %744 %745 
                                                      OpStore %741 %746 
                                       f32_4 %747 = OpLoad %741 
                                       f32_3 %748 = OpLoad vs_TEXCOORD2 
                                       f32_4 %749 = OpVectorShuffle %748 %748 1 1 1 1 
                                       f32_4 %750 = OpFMul %747 %749 
                                       f32_4 %751 = OpLoad %343 
                                       f32_4 %752 = OpFAdd %750 %751 
                                                      OpStore %343 %752 
                                       f32_4 %753 = OpLoad %343 
                                                      OpStore %281 %753 
                                                      OpBranch %328 
                                             %754 = OpLabel 
                                       f32_4 %755 = OpLoad %199 
                                                      OpStore %281 %755 
                                                      OpBranch %328 
                                             %328 = OpLabel 
                                       f32_4 %758 = OpLoad %281 
                                       f32_3 %759 = OpVectorShuffle %758 %758 0 1 2 
                                       f32_4 %760 = OpLoad %185 
                                       f32_3 %761 = OpVectorShuffle %760 %760 0 1 2 
                                       f32_3 %762 = OpFMul %759 %761 
                                       f32_4 %763 = OpLoad %757 
                                       f32_4 %764 = OpVectorShuffle %763 %762 4 5 6 3 
                                                      OpStore %757 %764 
                                Private f32* %765 = OpAccessChain %70 %29 
                                         f32 %766 = OpLoad %765 
                                Private f32* %767 = OpAccessChain %281 %17 
                                         f32 %768 = OpLoad %767 
                                         f32 %769 = OpFMul %766 %768 
                                 Output f32* %771 = OpAccessChain %757 %17 
                                                      OpStore %771 %769 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 477
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %159 %256 %325 %358 %372 %450 %451 %459 %466 %469 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %144 ArrayStride 144 
                                                      OpDecorate %145 ArrayStride 145 
                                                      OpDecorate %147 ArrayStride 147 
                                                      OpMemberDecorate %148 0 Offset 148 
                                                      OpMemberDecorate %148 1 Offset 148 
                                                      OpMemberDecorate %148 2 Offset 148 
                                                      OpMemberDecorate %148 3 Offset 148 
                                                      OpMemberDecorate %148 4 Offset 148 
                                                      OpMemberDecorate %148 5 Offset 148 
                                                      OpMemberDecorate %148 6 Offset 148 
                                                      OpDecorate %148 Block 
                                                      OpDecorate %150 DescriptorSet 150 
                                                      OpDecorate %150 Binding 150 
                                                      OpDecorate %159 Location 159 
                                                      OpDecorate %256 Location 256 
                                                      OpMemberDecorate %323 0 BuiltIn 323 
                                                      OpMemberDecorate %323 1 BuiltIn 323 
                                                      OpMemberDecorate %323 2 BuiltIn 323 
                                                      OpDecorate %323 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 358 
                                                      OpDecorate %372 Location 372 
                                                      OpDecorate %450 RelaxedPrecision 
                                                      OpDecorate %450 Location 450 
                                                      OpDecorate %451 Location 451 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 459 
                                                      OpDecorate vs_TEXCOORD3 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD3 Flat 
                                                      OpDecorate vs_TEXCOORD3 Location 466 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 469 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                          f32 %16 = OpConstant 3.674022E-40 
                                          f32 %17 = OpConstant 3.674022E-40 
                                        f32_3 %18 = OpConstantComposite %15 %16 %17 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypePointer Private %22 
                                 Private i32* %24 = OpVariable Private 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %27 = OpTypePointer Private %6 
                                              %31 = OpTypeVector %22 2 
                                              %32 = OpTypePointer Private %31 
                               Private i32_2* %33 = OpVariable Private 
                                          i32 %36 = OpConstant 1 
                                          i32 %37 = OpConstant 2 
                                        i32_2 %38 = OpConstantComposite %36 %37 
                                              %40 = OpTypeBool 
                                              %41 = OpTypeVector %40 4 
                                              %42 = OpTypePointer Private %41 
                              Private bool_4* %43 = OpVariable Private 
                                          f32 %46 = OpConstant 3.674022E-40 
                                          f32 %47 = OpConstant 3.674022E-40 
                                          f32 %48 = OpConstant 3.674022E-40 
                                          f32 %49 = OpConstant 3.674022E-40 
                                        f32_4 %50 = OpConstantComposite %46 %47 %48 %49 
                                              %52 = OpTypePointer Private %12 
                               Private f32_3* %53 = OpVariable Private 
                                          u32 %54 = OpConstant 1 
                                              %55 = OpTypePointer Private %40 
                                          f32 %58 = OpConstant 3.674022E-40 
                                          f32 %59 = OpConstant 3.674022E-40 
                              Private bool_4* %66 = OpVariable Private 
                                          f32 %69 = OpConstant 3.674022E-40 
                                          f32 %70 = OpConstant 3.674022E-40 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          f32 %72 = OpConstant 3.674022E-40 
                                        f32_4 %73 = OpConstantComposite %69 %70 %71 %72 
                               Private f32_3* %75 = OpVariable Private 
                                          u32 %80 = OpConstant 2 
                                          u32 %85 = OpConstant 3 
                                Private bool* %90 = OpVariable Private 
                                              %91 = OpTypePointer Input %6 
                                          f32 %94 = OpConstant 3.674022E-40 
                               Private f32_4* %96 = OpVariable Private 
                                Private f32* %106 = OpVariable Private 
                              Private f32_4* %142 = OpVariable Private 
                                         u32 %143 = OpConstant 4 
                                             %144 = OpTypeArray %7 %143 
                                             %145 = OpTypeArray %7 %143 
                                         u32 %146 = OpConstant 60 
                                             %147 = OpTypeArray %7 %146 
                                             %148 = OpTypeStruct %144 %145 %7 %7 %7 %7 %147 
                                             %149 = OpTypePointer Uniform %148 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4[60];}* %150 = OpVariable Uniform 
                                         i32 %151 = OpConstant 6 
                                             %153 = OpTypeVector %6 2 
                                             %154 = OpTypePointer Uniform %7 
                                             %158 = OpTypePointer Input %153 
                                Input f32_2* %159 = OpVariable Input 
                                             %171 = OpTypePointer Private %153 
                              Private f32_2* %172 = OpVariable Private 
                                         i32 %175 = OpConstant 5 
                              Private f32_3* %180 = OpVariable Private 
                                       f32_2 %183 = OpConstantComposite %58 %58 
                              Private f32_4* %187 = OpVariable Private 
                              Private f32_2* %200 = OpVariable Private 
                                             %203 = OpTypePointer Function %6 
                                         f32 %228 = OpConstant 3.674022E-40 
                                       f32_2 %229 = OpConstantComposite %228 %228 
                                         f32 %235 = OpConstant 3.674022E-40 
                                       f32_2 %236 = OpConstantComposite %235 %235 
                                         f32 %239 = OpConstant 3.674022E-40 
                                       f32_2 %240 = OpConstantComposite %239 %239 
                                         f32 %243 = OpConstant 3.674022E-40 
                                       f32_2 %244 = OpConstantComposite %243 %243 
                                Input f32_4* %256 = OpVariable Input 
                              Private f32_2* %274 = OpVariable Private 
                                         i32 %280 = OpConstant 0 
                                         i32 %299 = OpConstant 3 
                                             %322 = OpTypeArray %6 %54 
                                             %323 = OpTypeStruct %7 %6 %322 
                                             %324 = OpTypePointer Output %323 
        Output struct {f32_4; f32; f32[1];}* %325 = OpVariable Output 
                                             %333 = OpTypePointer Output %7 
                               Private bool* %346 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %360 = OpTypePointer Function %153 
                                Input f32_4* %372 = OpVariable Input 
                                         f32 %375 = OpConstant 3.674022E-40 
                                       f32_2 %376 = OpConstantComposite %375 %16 
                               Private bool* %379 = OpVariable Private 
                                         f32 %387 = OpConstant 3.674022E-40 
                                         f32 %388 = OpConstant 3.674022E-40 
                                       f32_2 %389 = OpConstantComposite %387 %388 
                                         f32 %390 = OpConstant 3.674022E-40 
                                         f32 %391 = OpConstant 3.674022E-40 
                                       f32_2 %392 = OpConstantComposite %390 %391 
                                             %393 = OpTypeVector %40 2 
                                Private f32* %398 = OpVariable Private 
                                Private f32* %418 = OpVariable Private 
                                         f32 %421 = OpConstant 3.674022E-40 
                                         f32 %436 = OpConstant 3.674022E-40 
                                       f32_2 %437 = OpConstantComposite %436 %436 
                                         i32 %443 = OpConstant 4 
                               Output f32_4* %450 = OpVariable Output 
                                Input f32_4* %451 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                                             %468 = OpTypePointer Output %12 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                             %471 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %204 = OpVariable Function 
                               Function f32* %216 = OpVariable Function 
                             Function f32_2* %361 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 2 2 
                                        f32_3 %19 = OpFMul %14 %18 
                                        f32_4 %20 = OpLoad %9 
                                        f32_4 %21 = OpVectorShuffle %20 %19 4 5 6 3 
                                                      OpStore %9 %21 
                                 Private f32* %28 = OpAccessChain %9 %26 
                                          f32 %29 = OpLoad %28 
                                          i32 %30 = OpConvertFToS %29 
                                                      OpStore %24 %30 
                                          i32 %34 = OpLoad %24 
                                        i32_2 %35 = OpCompositeConstruct %34 %34 
                                        i32_2 %39 = OpIAdd %35 %38 
                                                      OpStore %33 %39 
                                        f32_4 %44 = OpLoad %11 
                                        f32_4 %45 = OpVectorShuffle %44 %44 3 3 3 3 
                                       bool_4 %51 = OpFOrdEqual %45 %50 
                                                      OpStore %43 %51 
                                Private bool* %56 = OpAccessChain %43 %54 
                                         bool %57 = OpLoad %56 
                                          f32 %60 = OpSelect %57 %58 %59 
                                 Private f32* %61 = OpAccessChain %53 %26 
                                                      OpStore %61 %60 
                                Private bool* %62 = OpAccessChain %43 %26 
                                         bool %63 = OpLoad %62 
                                          f32 %64 = OpSelect %63 %58 %59 
                                 Private f32* %65 = OpAccessChain %53 %54 
                                                      OpStore %65 %64 
                                        f32_4 %67 = OpLoad %11 
                                        f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       bool_4 %74 = OpFOrdEqual %68 %73 
                                                      OpStore %66 %74 
                                Private bool* %76 = OpAccessChain %66 %54 
                                         bool %77 = OpLoad %76 
                                          f32 %78 = OpSelect %77 %58 %59 
                                 Private f32* %79 = OpAccessChain %75 %26 
                                                      OpStore %79 %78 
                                Private bool* %81 = OpAccessChain %66 %80 
                                         bool %82 = OpLoad %81 
                                          f32 %83 = OpSelect %82 %58 %59 
                                 Private f32* %84 = OpAccessChain %75 %54 
                                                      OpStore %84 %83 
                                Private bool* %86 = OpAccessChain %66 %85 
                                         bool %87 = OpLoad %86 
                                          f32 %88 = OpSelect %87 %58 %59 
                                 Private f32* %89 = OpAccessChain %75 %80 
                                                      OpStore %89 %88 
                                   Input f32* %92 = OpAccessChain %11 %85 
                                          f32 %93 = OpLoad %92 
                                         bool %95 = OpFOrdEqual %93 %94 
                                                      OpStore %90 %95 
                                         bool %97 = OpLoad %90 
                                          f32 %98 = OpSelect %97 %58 %59 
                                 Private f32* %99 = OpAccessChain %96 %26 
                                                      OpStore %99 %98 
                                Private f32* %100 = OpAccessChain %75 %80 
                                         f32 %101 = OpLoad %100 
                                Private f32* %102 = OpAccessChain %75 %54 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                Private f32* %105 = OpAccessChain %96 %54 
                                                      OpStore %105 %104 
                                Private f32* %107 = OpAccessChain %96 %54 
                                         f32 %108 = OpLoad %107 
                                Private f32* %109 = OpAccessChain %96 %26 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFAdd %108 %110 
                                                      OpStore %106 %111 
                                Private f32* %112 = OpAccessChain %75 %26 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpLoad %106 
                                         f32 %115 = OpFAdd %113 %114 
                                                      OpStore %106 %115 
                                Private f32* %116 = OpAccessChain %53 %26 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpLoad %106 
                                         f32 %119 = OpFAdd %117 %118 
                                                      OpStore %106 %119 
                                Private f32* %120 = OpAccessChain %53 %54 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpLoad %106 
                                         f32 %123 = OpFAdd %121 %122 
                                                      OpStore %106 %123 
                                         f32 %124 = OpLoad %106 
                                         f32 %125 = OpExtInst %1 37 %124 %58 
                                                      OpStore %106 %125 
                                         f32 %126 = OpLoad %106 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpFAdd %127 %58 
                                Private f32* %129 = OpAccessChain %96 %85 
                                                      OpStore %129 %128 
                               Private bool* %130 = OpAccessChain %43 %85 
                                        bool %131 = OpLoad %130 
                               Private bool* %132 = OpAccessChain %66 %26 
                                        bool %133 = OpLoad %132 
                                        bool %134 = OpLogicalOr %131 %133 
                                                      OpStore %90 %134 
                               Private bool* %135 = OpAccessChain %43 %80 
                                        bool %136 = OpLoad %135 
                                        bool %137 = OpLoad %90 
                                        bool %138 = OpLogicalOr %136 %137 
                                                      OpStore %90 %138 
                                        bool %139 = OpLoad %90 
                                                      OpSelectionMerge %141 None 
                                                      OpBranchConditional %139 %140 %250 
                                             %140 = OpLabel 
                                         i32 %152 = OpLoad %24 
                              Uniform f32_4* %155 = OpAccessChain %150 %151 %152 
                                       f32_4 %156 = OpLoad %155 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                                       f32_2 %160 = OpLoad %159 
                                         f32 %161 = OpDot %157 %160 
                                Private f32* %162 = OpAccessChain %142 %26 
                                                      OpStore %162 %161 
                                Private i32* %163 = OpAccessChain %33 %26 
                                         i32 %164 = OpLoad %163 
                              Uniform f32_4* %165 = OpAccessChain %150 %151 %164 
                                       f32_4 %166 = OpLoad %165 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpLoad %159 
                                         f32 %169 = OpDot %167 %168 
                                Private f32* %170 = OpAccessChain %142 %54 
                                                      OpStore %170 %169 
                                       f32_4 %173 = OpLoad %142 
                                       f32_2 %174 = OpVectorShuffle %173 %173 0 1 
                              Uniform f32_4* %176 = OpAccessChain %150 %175 
                                       f32_4 %177 = OpLoad %176 
                                       f32_2 %178 = OpVectorShuffle %177 %177 2 3 
                                       f32_2 %179 = OpFMul %174 %178 
                                                      OpStore %172 %179 
                                       f32_2 %181 = OpLoad %172 
                                       f32_2 %182 = OpExtInst %1 4 %181 
                                       f32_2 %184 = OpExtInst %1 40 %182 %183 
                                       f32_3 %185 = OpLoad %180 
                                       f32_3 %186 = OpVectorShuffle %185 %184 3 1 4 
                                                      OpStore %180 %186 
                                       f32_3 %188 = OpLoad %180 
                                       f32_2 %189 = OpVectorShuffle %188 %188 0 2 
                                       f32_2 %190 = OpExtInst %1 2 %189 
                                       f32_4 %191 = OpLoad %187 
                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 2 3 
                                                      OpStore %187 %192 
                                       f32_3 %193 = OpLoad %180 
                                       f32_2 %194 = OpVectorShuffle %193 %193 0 2 
                                       f32_4 %195 = OpLoad %187 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                       f32_2 %197 = OpExtInst %1 40 %194 %196 
                                       f32_3 %198 = OpLoad %180 
                                       f32_3 %199 = OpVectorShuffle %198 %197 3 1 4 
                                                      OpStore %180 %199 
                               Private bool* %201 = OpAccessChain %43 %85 
                                        bool %202 = OpLoad %201 
                                                      OpSelectionMerge %206 None 
                                                      OpBranchConditional %202 %205 %209 
                                             %205 = OpLabel 
                                Private f32* %207 = OpAccessChain %180 %26 
                                         f32 %208 = OpLoad %207 
                                                      OpStore %204 %208 
                                                      OpBranch %206 
                                             %209 = OpLabel 
                                Private f32* %210 = OpAccessChain %187 %26 
                                         f32 %211 = OpLoad %210 
                                                      OpStore %204 %211 
                                                      OpBranch %206 
                                             %206 = OpLabel 
                                         f32 %212 = OpLoad %204 
                                Private f32* %213 = OpAccessChain %200 %26 
                                                      OpStore %213 %212 
                               Private bool* %214 = OpAccessChain %43 %80 
                                        bool %215 = OpLoad %214 
                                                      OpSelectionMerge %218 None 
                                                      OpBranchConditional %215 %217 %221 
                                             %217 = OpLabel 
                                Private f32* %219 = OpAccessChain %180 %80 
                                         f32 %220 = OpLoad %219 
                                                      OpStore %216 %220 
                                                      OpBranch %218 
                                             %221 = OpLabel 
                                Private f32* %222 = OpAccessChain %187 %54 
                                         f32 %223 = OpLoad %222 
                                                      OpStore %216 %223 
                                                      OpBranch %218 
                                             %218 = OpLabel 
                                         f32 %224 = OpLoad %216 
                                Private f32* %225 = OpAccessChain %200 %54 
                                                      OpStore %225 %224 
                                       f32_2 %226 = OpLoad %172 
                                       f32_2 %227 = OpExtInst %1 4 %226 
                                       f32_2 %230 = OpFAdd %227 %229 
                                                      OpStore %172 %230 
                                       f32_2 %231 = OpLoad %200 
                                       f32_2 %232 = OpLoad %172 
                                       f32_2 %233 = OpFDiv %231 %232 
                                                      OpStore %172 %233 
                                       f32_2 %234 = OpLoad %172 
                                       f32_2 %237 = OpExtInst %1 40 %234 %236 
                                                      OpStore %172 %237 
                                       f32_2 %238 = OpLoad %172 
                                       f32_2 %241 = OpExtInst %1 37 %238 %240 
                                                      OpStore %172 %241 
                                       f32_2 %242 = OpLoad %172 
                                       f32_2 %245 = OpFAdd %242 %244 
                                                      OpStore %172 %245 
                                       f32_4 %246 = OpLoad %142 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %248 = OpLoad %172 
                                       f32_2 %249 = OpFMul %247 %248 
                                                      OpStore %172 %249 
                                                      OpBranch %141 
                                             %250 = OpLabel 
                                Private f32* %251 = OpAccessChain %172 %26 
                                                      OpStore %251 %59 
                                Private f32* %252 = OpAccessChain %172 %54 
                                                      OpStore %252 %59 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                         i32 %253 = OpLoad %24 
                              Uniform f32_4* %254 = OpAccessChain %150 %151 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %257 = OpLoad %256 
                                         f32 %258 = OpDot %255 %257 
                                Private f32* %259 = OpAccessChain %200 %26 
                                                      OpStore %259 %258 
                                Private i32* %260 = OpAccessChain %33 %26 
                                         i32 %261 = OpLoad %260 
                              Uniform f32_4* %262 = OpAccessChain %150 %151 %261 
                                       f32_4 %263 = OpLoad %262 
                                       f32_4 %264 = OpLoad %256 
                                         f32 %265 = OpDot %263 %264 
                                Private f32* %266 = OpAccessChain %200 %54 
                                                      OpStore %266 %265 
                                Private i32* %267 = OpAccessChain %33 %54 
                                         i32 %268 = OpLoad %267 
                              Uniform f32_4* %269 = OpAccessChain %150 %151 %268 
                                       f32_4 %270 = OpLoad %269 
                                       f32_4 %271 = OpLoad %256 
                                         f32 %272 = OpDot %270 %271 
                                Private f32* %273 = OpAccessChain %9 %26 
                                                      OpStore %273 %272 
                                       f32_2 %275 = OpLoad %172 
                                       f32_2 %276 = OpLoad %200 
                                       f32_2 %277 = OpFAdd %275 %276 
                                                      OpStore %274 %277 
                                       f32_2 %278 = OpLoad %274 
                                       f32_4 %279 = OpVectorShuffle %278 %278 1 1 1 1 
                              Uniform f32_4* %281 = OpAccessChain %150 %280 %36 
                                       f32_4 %282 = OpLoad %281 
                                       f32_4 %283 = OpFMul %279 %282 
                                                      OpStore %142 %283 
                              Uniform f32_4* %284 = OpAccessChain %150 %280 %280 
                                       f32_4 %285 = OpLoad %284 
                                       f32_2 %286 = OpLoad %274 
                                       f32_4 %287 = OpVectorShuffle %286 %286 0 0 0 0 
                                       f32_4 %288 = OpFMul %285 %287 
                                       f32_4 %289 = OpLoad %142 
                                       f32_4 %290 = OpFAdd %288 %289 
                                                      OpStore %142 %290 
                              Uniform f32_4* %291 = OpAccessChain %150 %280 %37 
                                       f32_4 %292 = OpLoad %291 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpVectorShuffle %293 %293 0 0 0 0 
                                       f32_4 %295 = OpFMul %292 %294 
                                       f32_4 %296 = OpLoad %142 
                                       f32_4 %297 = OpFAdd %295 %296 
                                                      OpStore %142 %297 
                                       f32_4 %298 = OpLoad %142 
                              Uniform f32_4* %300 = OpAccessChain %150 %280 %299 
                                       f32_4 %301 = OpLoad %300 
                                       f32_4 %302 = OpFAdd %298 %301 
                                                      OpStore %142 %302 
                                       f32_4 %303 = OpLoad %142 
                                       f32_4 %304 = OpVectorShuffle %303 %303 1 1 1 1 
                              Uniform f32_4* %305 = OpAccessChain %150 %36 %36 
                                       f32_4 %306 = OpLoad %305 
                                       f32_4 %307 = OpFMul %304 %306 
                                                      OpStore %187 %307 
                              Uniform f32_4* %308 = OpAccessChain %150 %36 %280 
                                       f32_4 %309 = OpLoad %308 
                                       f32_4 %310 = OpLoad %142 
                                       f32_4 %311 = OpVectorShuffle %310 %310 0 0 0 0 
                                       f32_4 %312 = OpFMul %309 %311 
                                       f32_4 %313 = OpLoad %187 
                                       f32_4 %314 = OpFAdd %312 %313 
                                                      OpStore %187 %314 
                              Uniform f32_4* %315 = OpAccessChain %150 %36 %37 
                                       f32_4 %316 = OpLoad %315 
                                       f32_4 %317 = OpLoad %142 
                                       f32_4 %318 = OpVectorShuffle %317 %317 2 2 2 2 
                                       f32_4 %319 = OpFMul %316 %318 
                                       f32_4 %320 = OpLoad %187 
                                       f32_4 %321 = OpFAdd %319 %320 
                                                      OpStore %187 %321 
                              Uniform f32_4* %326 = OpAccessChain %150 %36 %299 
                                       f32_4 %327 = OpLoad %326 
                                       f32_4 %328 = OpLoad %142 
                                       f32_4 %329 = OpVectorShuffle %328 %328 3 3 3 3 
                                       f32_4 %330 = OpFMul %327 %329 
                                       f32_4 %331 = OpLoad %187 
                                       f32_4 %332 = OpFAdd %330 %331 
                               Output f32_4* %334 = OpAccessChain %325 %280 
                                                      OpStore %334 %332 
                                       f32_2 %335 = OpLoad %159 
                              Uniform f32_4* %336 = OpAccessChain %150 %37 
                                       f32_4 %337 = OpLoad %336 
                                       f32_2 %338 = OpVectorShuffle %337 %337 0 1 
                                       f32_2 %339 = OpFMul %335 %338 
                              Uniform f32_4* %340 = OpAccessChain %150 %37 
                                       f32_4 %341 = OpLoad %340 
                                       f32_2 %342 = OpVectorShuffle %341 %341 2 3 
                                       f32_2 %343 = OpFAdd %339 %342 
                                       f32_4 %344 = OpLoad %9 
                                       f32_4 %345 = OpVectorShuffle %344 %343 4 1 2 5 
                                                      OpStore %9 %345 
                                Private f32* %347 = OpAccessChain %96 %54 
                                         f32 %348 = OpLoad %347 
                                        bool %349 = OpFOrdEqual %348 %58 
                                                      OpStore %346 %349 
                                       f32_4 %350 = OpLoad %9 
                                       f32_2 %351 = OpVectorShuffle %350 %350 0 3 
                              Uniform f32_4* %352 = OpAccessChain %150 %299 
                                       f32_4 %353 = OpLoad %352 
                                       f32_2 %354 = OpVectorShuffle %353 %353 0 1 
                                       f32_2 %355 = OpFMul %351 %354 
                                       f32_4 %356 = OpLoad %142 
                                       f32_4 %357 = OpVectorShuffle %356 %355 4 5 2 3 
                                                      OpStore %142 %357 
                                        bool %359 = OpLoad %346 
                                                      OpSelectionMerge %363 None 
                                                      OpBranchConditional %359 %362 %366 
                                             %362 = OpLabel 
                                       f32_4 %364 = OpLoad %142 
                                       f32_2 %365 = OpVectorShuffle %364 %364 0 1 
                                                      OpStore %361 %365 
                                                      OpBranch %363 
                                             %366 = OpLabel 
                                       f32_4 %367 = OpLoad %9 
                                       f32_2 %368 = OpVectorShuffle %367 %367 0 3 
                                                      OpStore %361 %368 
                                                      OpBranch %363 
                                             %363 = OpLabel 
                                       f32_2 %369 = OpLoad %361 
                                       f32_4 %370 = OpLoad vs_TEXCOORD0 
                                       f32_4 %371 = OpVectorShuffle %370 %369 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %371 
                                       f32_4 %373 = OpLoad %372 
                                       f32_2 %374 = OpVectorShuffle %373 %373 2 3 
                                         f32 %377 = OpDot %374 %376 
                                Private f32* %378 = OpAccessChain %53 %80 
                                                      OpStore %378 %377 
                                Private f32* %380 = OpAccessChain %9 %80 
                                         f32 %381 = OpLoad %380 
                                Private f32* %382 = OpAccessChain %9 %80 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFNegate %383 
                                        bool %385 = OpFOrdGreaterThanEqual %381 %384 
                                                      OpStore %379 %385 
                                        bool %386 = OpLoad %379 
                                      bool_2 %394 = OpCompositeConstruct %386 %386 
                                       f32_2 %395 = OpSelect %394 %389 %392 
                                       f32_4 %396 = OpLoad %9 
                                       f32_4 %397 = OpVectorShuffle %396 %395 4 1 5 3 
                                                      OpStore %9 %397 
                                Private f32* %399 = OpAccessChain %9 %80 
                                         f32 %400 = OpLoad %399 
                                Private f32* %401 = OpAccessChain %9 %54 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpFMul %400 %402 
                                                      OpStore %398 %403 
                                         f32 %404 = OpLoad %398 
                                         f32 %405 = OpExtInst %1 10 %404 
                                                      OpStore %398 %405 
                                         f32 %406 = OpLoad %398 
                                Private f32* %407 = OpAccessChain %9 %26 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpFMul %406 %408 
                                Private f32* %410 = OpAccessChain %9 %26 
                                                      OpStore %410 %409 
                                  Input f32* %411 = OpAccessChain %11 %80 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpFMul %412 %16 
                                Private f32* %414 = OpAccessChain %9 %26 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpFAdd %413 %416 
                                                      OpStore %398 %417 
                                  Input f32* %419 = OpAccessChain %372 %54 
                                         f32 %420 = OpLoad %419 
                                         f32 %422 = OpFMul %420 %421 
                                                      OpStore %418 %422 
                                  Input f32* %423 = OpAccessChain %372 %26 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFMul %424 %17 
                                Private f32* %426 = OpAccessChain %9 %26 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFAdd %425 %427 
                                Private f32* %429 = OpAccessChain %172 %26 
                                                      OpStore %429 %428 
                                         f32 %430 = OpLoad %398 
                                         f32 %431 = OpFMul %430 %388 
                                         f32 %432 = OpLoad %418 
                                         f32 %433 = OpFAdd %431 %432 
                                Private f32* %434 = OpAccessChain %172 %54 
                                                      OpStore %434 %433 
                                       f32_2 %435 = OpLoad %172 
                                       f32_2 %438 = OpFAdd %435 %437 
                                       f32_4 %439 = OpLoad %9 
                                       f32_4 %440 = OpVectorShuffle %439 %438 4 5 2 3 
                                                      OpStore %9 %440 
                                       f32_4 %441 = OpLoad %9 
                                       f32_2 %442 = OpVectorShuffle %441 %441 0 1 
                              Uniform f32_4* %444 = OpAccessChain %150 %443 
                                       f32_4 %445 = OpLoad %444 
                                       f32_2 %446 = OpVectorShuffle %445 %445 0 1 
                                       f32_2 %447 = OpFMul %442 %446 
                                       f32_4 %448 = OpLoad %9 
                                       f32_4 %449 = OpVectorShuffle %448 %447 0 1 4 5 
                                                      OpStore %9 %449 
                                       f32_4 %452 = OpLoad %451 
                                                      OpStore %450 %452 
                                       f32_2 %453 = OpLoad %274 
                                       f32_4 %454 = OpLoad vs_TEXCOORD0 
                                       f32_4 %455 = OpVectorShuffle %454 %453 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %455 
                                Private f32* %456 = OpAccessChain %75 %26 
                                         f32 %457 = OpLoad %456 
                                Private f32* %458 = OpAccessChain %96 %80 
                                                      OpStore %458 %457 
                                       f32_4 %460 = OpLoad %96 
                                                      OpStore vs_TEXCOORD1 %460 
                                  Input f32* %461 = OpAccessChain %11 %54 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFMul %462 %16 
                                Private f32* %464 = OpAccessChain %9 %26 
                                                      OpStore %464 %463 
                                Private f32* %465 = OpAccessChain %9 %54 
                                                      OpStore %465 %59 
                                       f32_4 %467 = OpLoad %9 
                                                      OpStore vs_TEXCOORD3 %467 
                                       f32_3 %470 = OpLoad %53 
                                                      OpStore vs_TEXCOORD2 %470 
                                 Output f32* %472 = OpAccessChain %325 %280 %54 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFNegate %473 
                                 Output f32* %475 = OpAccessChain %325 %280 %54 
                                                      OpStore %475 %474 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 773
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %28 %37 %185 %201 %313 %757 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 BuiltIn TessLevelOuter 
                                                      OpDecorate vs_TEXCOORD3 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD3 Flat 
                                                      OpDecorate vs_TEXCOORD3 Location 28 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 37 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpMemberDecorate %42 0 Offset 42 
                                                      OpMemberDecorate %42 1 Offset 42 
                                                      OpMemberDecorate %42 2 Offset 42 
                                                      OpMemberDecorate %42 3 Offset 42 
                                                      OpMemberDecorate %42 4 Offset 42 
                                                      OpDecorate %42 Block 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %172 DescriptorSet 172 
                                                      OpDecorate %172 Binding 172 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %176 DescriptorSet 176 
                                                      OpDecorate %176 Binding 176 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %185 Location 185 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %191 DescriptorSet 191 
                                                      OpDecorate %191 Binding 191 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 DescriptorSet 193 
                                                      OpDecorate %193 Binding 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 201 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %209 DescriptorSet 209 
                                                      OpDecorate %209 Binding 209 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %297 DescriptorSet 297 
                                                      OpDecorate %297 Binding 297 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %299 DescriptorSet 299 
                                                      OpDecorate %299 Binding 299 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 313 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %360 DescriptorSet 360 
                                                      OpDecorate %360 Binding 360 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %362 DescriptorSet 362 
                                                      OpDecorate %362 Binding 362 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %682 RelaxedPrecision 
                                                      OpDecorate %683 RelaxedPrecision 
                                                      OpDecorate %687 RelaxedPrecision 
                                                      OpDecorate %688 RelaxedPrecision 
                                                      OpDecorate %690 RelaxedPrecision 
                                                      OpDecorate %691 RelaxedPrecision 
                                                      OpDecorate %692 RelaxedPrecision 
                                                      OpDecorate %695 RelaxedPrecision 
                                                      OpDecorate %698 RelaxedPrecision 
                                                      OpDecorate %700 RelaxedPrecision 
                                                      OpDecorate %705 RelaxedPrecision 
                                                      OpDecorate %706 RelaxedPrecision 
                                                      OpDecorate %710 RelaxedPrecision 
                                                      OpDecorate %711 RelaxedPrecision 
                                                      OpDecorate %712 RelaxedPrecision 
                                                      OpDecorate %713 RelaxedPrecision 
                                                      OpDecorate %714 RelaxedPrecision 
                                                      OpDecorate %715 RelaxedPrecision 
                                                      OpDecorate %722 RelaxedPrecision 
                                                      OpDecorate %730 RelaxedPrecision 
                                                      OpDecorate %731 RelaxedPrecision 
                                                      OpDecorate %735 RelaxedPrecision 
                                                      OpDecorate %736 RelaxedPrecision 
                                                      OpDecorate %737 RelaxedPrecision 
                                                      OpDecorate %738 RelaxedPrecision 
                                                      OpDecorate %741 RelaxedPrecision 
                                                      OpDecorate %742 RelaxedPrecision 
                                                      OpDecorate %743 RelaxedPrecision 
                                                      OpDecorate %747 RelaxedPrecision 
                                                      OpDecorate %748 RelaxedPrecision 
                                                      OpDecorate %749 RelaxedPrecision 
                                                      OpDecorate %750 RelaxedPrecision 
                                                      OpDecorate %757 RelaxedPrecision 
                                                      OpDecorate %757 Location 757 
                                                      OpDecorate %758 RelaxedPrecision 
                                                      OpDecorate %759 RelaxedPrecision 
                                                      OpDecorate %760 RelaxedPrecision 
                                                      OpDecorate %761 RelaxedPrecision 
                                                      OpDecorate %762 RelaxedPrecision 
                                                      OpDecorate %768 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Function %7 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 3 
                                              %18 = OpTypePointer Input %6 
                                              %26 = OpTypePointer Private %16 
                                 Private u32* %27 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD3 = OpVariable Input 
                                          u32 %29 = OpConstant 0 
                                              %33 = OpTypeBool 
                                              %34 = OpTypeVector %33 4 
                                              %35 = OpTypePointer Private %34 
                              Private bool_4* %36 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          u32 %40 = OpConstant 20 
                                              %41 = OpTypeArray %7 %40 
                                              %42 = OpTypeStruct %7 %7 %7 %7 %41 
                                              %43 = OpTypePointer Uniform %42 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[20];}* %44 = OpVariable Uniform 
                                              %45 = OpTypeInt 32 1 
                                          i32 %46 = OpConstant 4 
                                              %49 = OpTypePointer Uniform %7 
                                              %54 = OpTypeVector %33 2 
                                              %69 = OpTypePointer Private %7 
                               Private f32_4* %70 = OpVariable Private 
                                              %71 = OpTypePointer Private %33 
                                          f32 %74 = OpConstant 3.674022E-40 
                                              %76 = OpTypePointer Private %6 
                                          u32 %78 = OpConstant 1 
                                          u32 %83 = OpConstant 2 
                                              %92 = OpTypeVector %6 2 
                                             %100 = OpTypePointer Private %54 
                             Private bool_2* %101 = OpVariable Private 
                                         i32 %104 = OpConstant 3 
                                             %110 = OpTypePointer Private %92 
                              Private f32_2* %111 = OpVariable Private 
                                         f32 %150 = OpConstant 3.674022E-40 
                                       f32_3 %151 = OpConstantComposite %15 %15 %150 
                                         i32 %160 = OpConstant 0 
                                         i32 %161 = OpConstant 1 
                                         i32 %163 = OpConstant -1 
                                Private f32* %169 = OpVariable Private 
                                             %170 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %171 = OpTypePointer UniformConstant %170 
        UniformConstant read_only Texture2D* %172 = OpVariable UniformConstant 
                                             %174 = OpTypeSampler 
                                             %175 = OpTypePointer UniformConstant %174 
                    UniformConstant sampler* %176 = OpVariable UniformConstant 
                                             %178 = OpTypeSampledImage %170 
                                Input f32_4* %185 = OpVariable Input 
                              Private f32_4* %190 = OpVariable Private 
        UniformConstant read_only Texture2D* %191 = OpVariable UniformConstant 
                    UniformConstant sampler* %193 = OpVariable UniformConstant 
                              Private f32_4* %199 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                              Private f32_2* %208 = OpVariable Private 
        UniformConstant read_only Texture2D* %209 = OpVariable UniformConstant 
                    UniformConstant sampler* %211 = OpVariable UniformConstant 
                                Private f32* %223 = OpVariable Private 
                                         f32 %237 = OpConstant 3.674022E-40 
                                         f32 %264 = OpConstant 3.674022E-40 
                                         f32 %266 = OpConstant 3.674022E-40 
                              Private f32_4* %281 = OpVariable Private 
                              Private f32_4* %292 = OpVariable Private 
                              Private f32_4* %296 = OpVariable Private 
        UniformConstant read_only Texture2D* %297 = OpVariable UniformConstant 
                    UniformConstant sampler* %299 = OpVariable UniformConstant 
                             Private bool_2* %311 = OpVariable Private 
                                             %312 = OpTypePointer Input %12 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                       f32_4 %316 = OpConstantComposite %15 %15 %74 %74 
                                             %331 = OpTypePointer Function %92 
                              Private f32_4* %343 = OpVariable Private 
                              Private f32_2* %349 = OpVariable Private 
                              Private f32_2* %351 = OpVariable Private 
                                         i32 %354 = OpConstant 2 
                              Private f32_4* %359 = OpVariable Private 
        UniformConstant read_only Texture2D* %360 = OpVariable UniformConstant 
                    UniformConstant sampler* %362 = OpVariable UniformConstant 
                               Private bool* %367 = OpVariable Private 
                              Private f32_2* %371 = OpVariable Private 
                                         f32 %374 = OpConstant 3.674022E-40 
                                       f32_2 %375 = OpConstantComposite %374 %374 
                                             %380 = OpTypePointer Private %12 
                              Private f32_3* %381 = OpVariable Private 
                                         f32 %389 = OpConstant 3.674022E-40 
                                       f32_2 %390 = OpConstantComposite %389 %389 
                                Private f32* %397 = OpVariable Private 
                              Private f32_3* %405 = OpVariable Private 
                                Private f32* %439 = OpVariable Private 
                               Private bool* %454 = OpVariable Private 
                                             %463 = OpTypePointer Function %6 
                               Private bool* %478 = OpVariable Private 
                                         f32 %479 = OpConstant 3.674022E-40 
                               Private bool* %484 = OpVariable Private 
                              Private f32_2* %501 = OpVariable Private 
                              Private f32_2* %524 = OpVariable Private 
                                         f32 %527 = OpConstant 3.674022E-40 
                                             %530 = OpTypePointer Private %45 
                                Private i32* %531 = OpVariable Private 
                               Private bool* %535 = OpVariable Private 
                             Private bool_2* %568 = OpVariable Private 
                                             %570 = OpTypeVector %45 4 
                                       i32_4 %572 = OpConstantComposite %161 %354 %160 %160 
                               Private bool* %592 = OpVariable Private 
                                Private f32* %629 = OpVariable Private 
                                             %670 = OpTypePointer Uniform %6 
                                       f32_2 %689 = OpConstantComposite %527 %527 
                                         f32 %693 = OpConstant 3.674022E-40 
                                       f32_2 %694 = OpConstantComposite %693 %693 
                                       f32_2 %699 = OpConstantComposite %237 %237 
                              Private f32_4* %741 = OpVariable Private 
                                             %756 = OpTypePointer Output %7 
                               Output f32_4* %757 = OpVariable Output 
                                             %770 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32_4* %9 = OpVariable Function 
                             Function f32_2* %332 = OpVariable Function 
                               Function f32* %464 = OpVariable Function 
                               Function f32* %494 = OpVariable Function 
                               Function f32* %503 = OpVariable Function 
                             Function f32_2* %514 = OpVariable Function 
                               Function f32* %547 = OpVariable Function 
                               Function f32* %558 = OpVariable Function 
                               Function f32* %581 = OpVariable Function 
                               Function f32* %605 = OpVariable Function 
                               Function f32* %635 = OpVariable Function 
                               Function f32* %650 = OpVariable Function 
                               Function f32* %661 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                                   Input f32* %19 = OpAccessChain %11 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFDiv %15 %20 
                                          f32 %22 = OpCompositeExtract %14 0 
                                          f32 %23 = OpCompositeExtract %14 1 
                                          f32 %24 = OpCompositeExtract %14 2 
                                        f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                                      OpStore %9 %25 
                                   Input f32* %30 = OpAccessChain vs_TEXCOORD3 %29 
                                          f32 %31 = OpLoad %30 
                                          u32 %32 = OpConvertFToU %31 
                                                      OpStore %27 %32 
                                        f32_4 %38 = OpLoad vs_TEXCOORD0 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 3 2 
                                          u32 %47 = OpLoad %27 
                                          i32 %48 = OpBitcast %47 
                               Uniform f32_4* %50 = OpAccessChain %44 %46 %48 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 1 0 
                                       bool_4 %53 = OpFOrdGreaterThanEqual %39 %52 
                                       bool_2 %55 = OpVectorShuffle %53 %53 1 2 
                                       bool_4 %56 = OpLoad %36 
                                       bool_4 %57 = OpVectorShuffle %56 %55 0 4 5 3 
                                                      OpStore %36 %57 
                                          u32 %58 = OpLoad %27 
                                          i32 %59 = OpBitcast %58 
                               Uniform f32_4* %60 = OpAccessChain %44 %46 %59 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpVectorShuffle %61 %61 2 2 2 3 
                                        f32_4 %63 = OpLoad vs_TEXCOORD0 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 3 
                                       bool_4 %65 = OpFOrdGreaterThanEqual %62 %64 
                                       bool_2 %66 = OpVectorShuffle %65 %65 0 3 
                                       bool_4 %67 = OpLoad %36 
                                       bool_4 %68 = OpVectorShuffle %67 %66 4 1 2 5 
                                                      OpStore %36 %68 
                                Private bool* %72 = OpAccessChain %36 %29 
                                         bool %73 = OpLoad %72 
                                          f32 %75 = OpSelect %73 %15 %74 
                                 Private f32* %77 = OpAccessChain %70 %29 
                                                      OpStore %77 %75 
                                Private bool* %79 = OpAccessChain %36 %78 
                                         bool %80 = OpLoad %79 
                                          f32 %81 = OpSelect %80 %15 %74 
                                 Private f32* %82 = OpAccessChain %70 %78 
                                                      OpStore %82 %81 
                                Private bool* %84 = OpAccessChain %36 %83 
                                         bool %85 = OpLoad %84 
                                          f32 %86 = OpSelect %85 %15 %74 
                                 Private f32* %87 = OpAccessChain %70 %83 
                                                      OpStore %87 %86 
                                Private bool* %88 = OpAccessChain %36 %17 
                                         bool %89 = OpLoad %88 
                                          f32 %90 = OpSelect %89 %15 %74 
                                 Private f32* %91 = OpAccessChain %70 %17 
                                                      OpStore %91 %90 
                                        f32_4 %93 = OpLoad %70 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                        f32_4 %95 = OpLoad %70 
                                        f32_2 %96 = OpVectorShuffle %95 %95 1 2 
                                        f32_2 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %70 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %70 %99 
                                       f32_4 %102 = OpLoad %9 
                                       f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
                              Uniform f32_4* %105 = OpAccessChain %44 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 1 0 1 
                                      bool_4 %108 = OpFOrdGreaterThanEqual %103 %107 
                                      bool_2 %109 = OpVectorShuffle %108 %108 0 1 
                                                      OpStore %101 %109 
                               Private bool* %112 = OpAccessChain %101 %29 
                                        bool %113 = OpLoad %112 
                                         f32 %114 = OpSelect %113 %15 %74 
                                Private f32* %115 = OpAccessChain %111 %29 
                                                      OpStore %115 %114 
                               Private bool* %116 = OpAccessChain %101 %78 
                                        bool %117 = OpLoad %116 
                                         f32 %118 = OpSelect %117 %15 %74 
                                Private f32* %119 = OpAccessChain %111 %78 
                                                      OpStore %119 %118 
                                       f32_2 %120 = OpLoad %111 
                                       f32_4 %121 = OpLoad %70 
                                       f32_2 %122 = OpVectorShuffle %121 %121 0 1 
                                       f32_2 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %70 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 2 3 
                                                      OpStore %70 %125 
                              Uniform f32_4* %126 = OpAccessChain %44 %104 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpVectorShuffle %127 %127 2 3 2 3 
                                       f32_4 %129 = OpLoad %9 
                                       f32_4 %130 = OpVectorShuffle %129 %129 0 1 0 1 
                                      bool_4 %131 = OpFOrdGreaterThanEqual %128 %130 
                                      bool_2 %132 = OpVectorShuffle %131 %131 0 1 
                                                      OpStore %101 %132 
                               Private bool* %133 = OpAccessChain %101 %29 
                                        bool %134 = OpLoad %133 
                                         f32 %135 = OpSelect %134 %15 %74 
                                Private f32* %136 = OpAccessChain %111 %29 
                                                      OpStore %136 %135 
                               Private bool* %137 = OpAccessChain %101 %78 
                                        bool %138 = OpLoad %137 
                                         f32 %139 = OpSelect %138 %15 %74 
                                Private f32* %140 = OpAccessChain %111 %78 
                                                      OpStore %140 %139 
                                       f32_2 %141 = OpLoad %111 
                                       f32_4 %142 = OpLoad %70 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFAdd %141 %143 
                                       f32_4 %145 = OpLoad %70 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 5 2 3 
                                                      OpStore %70 %146 
                                Private f32* %147 = OpAccessChain %70 %83 
                                                      OpStore %147 %15 
                                       f32_4 %148 = OpLoad %70 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                         f32 %152 = OpDot %149 %151 
                                Private f32* %153 = OpAccessChain %70 %29 
                                                      OpStore %153 %152 
                                Private f32* %154 = OpAccessChain %70 %29 
                                         f32 %155 = OpLoad %154 
                                        bool %156 = OpFOrdLessThan %155 %74 
                               Private bool* %157 = OpAccessChain %36 %29 
                                                      OpStore %157 %156 
                               Private bool* %158 = OpAccessChain %36 %29 
                                        bool %159 = OpLoad %158 
                                         i32 %162 = OpSelect %159 %161 %160 
                                         i32 %164 = OpIMul %162 %163 
                                        bool %165 = OpINotEqual %164 %160 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %167 
                                             %166 = OpLabel 
                                                      OpKill
                                             %167 = OpLabel 
                         read_only Texture2D %173 = OpLoad %172 
                                     sampler %177 = OpLoad %176 
                  read_only Texture2DSampled %179 = OpSampledImage %173 %177 
                                       f32_4 %180 = OpLoad vs_TEXCOORD3 
                                       f32_2 %181 = OpVectorShuffle %180 %180 2 3 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                         f32 %183 = OpCompositeExtract %182 3 
                                                      OpStore %169 %183 
                                         f32 %184 = OpLoad %169 
                                  Input f32* %186 = OpAccessChain %185 %17 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFMul %184 %187 
                                Private f32* %189 = OpAccessChain %70 %29 
                                                      OpStore %189 %188 
                         read_only Texture2D %192 = OpLoad %191 
                                     sampler %194 = OpLoad %193 
                  read_only Texture2DSampled %195 = OpSampledImage %192 %194 
                                       f32_4 %196 = OpLoad vs_TEXCOORD0 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_4 %198 = OpImageSampleImplicitLod %195 %197 
                                                      OpStore %190 %198 
                                       f32_4 %200 = OpLoad %190 
                                       f32_4 %202 = OpLoad vs_TEXCOORD1 
                                       f32_4 %203 = OpVectorShuffle %202 %202 1 1 1 1 
                                       f32_4 %204 = OpFMul %200 %203 
                                       f32_4 %205 = OpLoad vs_TEXCOORD1 
                                       f32_4 %206 = OpVectorShuffle %205 %205 3 3 3 3 
                                       f32_4 %207 = OpFAdd %204 %206 
                                                      OpStore %199 %207 
                         read_only Texture2D %210 = OpLoad %209 
                                     sampler %212 = OpLoad %211 
                  read_only Texture2DSampled %213 = OpSampledImage %210 %212 
                                       f32_4 %214 = OpLoad vs_TEXCOORD0 
                                       f32_2 %215 = OpVectorShuffle %214 %214 0 1 
                                       f32_4 %216 = OpImageSampleImplicitLod %213 %215 
                                         f32 %217 = OpCompositeExtract %216 3 
                                Private f32* %218 = OpAccessChain %208 %29 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %208 %29 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpDPdx %220 
                                Private f32* %222 = OpAccessChain %111 %29 
                                                      OpStore %222 %221 
                                Private f32* %224 = OpAccessChain %208 %29 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpDPdy %225 
                                                      OpStore %223 %226 
                                         f32 %227 = OpLoad %223 
                                         f32 %228 = OpExtInst %1 4 %227 
                                Private f32* %229 = OpAccessChain %111 %29 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpExtInst %1 4 %230 
                                         f32 %232 = OpFAdd %228 %231 
                                Private f32* %233 = OpAccessChain %111 %29 
                                                      OpStore %233 %232 
                                Private f32* %234 = OpAccessChain %111 %29 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFNegate %235 
                                         f32 %238 = OpFAdd %236 %237 
                                                      OpStore %223 %238 
                                Private f32* %239 = OpAccessChain %111 %29 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpFAdd %240 %237 
                                Private f32* %242 = OpAccessChain %208 %78 
                                                      OpStore %242 %241 
                                         f32 %243 = OpLoad %223 
                                       f32_2 %244 = OpCompositeConstruct %243 %243 
                                       f32_2 %245 = OpFNegate %244 
                                       f32_2 %246 = OpLoad %208 
                                       f32_2 %247 = OpFAdd %245 %246 
                                                      OpStore %208 %247 
                                Private f32* %248 = OpAccessChain %208 %78 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFDiv %15 %249 
                                Private f32* %251 = OpAccessChain %111 %29 
                                                      OpStore %251 %250 
                                Private f32* %252 = OpAccessChain %111 %29 
                                         f32 %253 = OpLoad %252 
                                Private f32* %254 = OpAccessChain %208 %29 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpFMul %253 %255 
                                Private f32* %257 = OpAccessChain %208 %29 
                                                      OpStore %257 %256 
                                Private f32* %258 = OpAccessChain %208 %29 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpExtInst %1 43 %259 %74 %15 
                                Private f32* %261 = OpAccessChain %208 %29 
                                                      OpStore %261 %260 
                                Private f32* %262 = OpAccessChain %208 %29 
                                         f32 %263 = OpLoad %262 
                                         f32 %265 = OpFMul %263 %264 
                                         f32 %267 = OpFAdd %265 %266 
                                Private f32* %268 = OpAccessChain %111 %29 
                                                      OpStore %268 %267 
                                Private f32* %269 = OpAccessChain %208 %29 
                                         f32 %270 = OpLoad %269 
                                Private f32* %271 = OpAccessChain %208 %29 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFMul %270 %272 
                                Private f32* %274 = OpAccessChain %208 %29 
                                                      OpStore %274 %273 
                                Private f32* %275 = OpAccessChain %208 %29 
                                         f32 %276 = OpLoad %275 
                                Private f32* %277 = OpAccessChain %111 %29 
                                         f32 %278 = OpLoad %277 
                                         f32 %279 = OpFMul %276 %278 
                                Private f32* %280 = OpAccessChain %208 %29 
                                                      OpStore %280 %279 
                                       f32_4 %282 = OpLoad vs_TEXCOORD1 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 0 0 
                                       f32_4 %284 = OpLoad %281 
                                       f32_4 %285 = OpVectorShuffle %284 %283 4 5 6 3 
                                                      OpStore %281 %285 
                                Private f32* %286 = OpAccessChain %208 %29 
                                         f32 %287 = OpLoad %286 
                                  Input f32* %288 = OpAccessChain vs_TEXCOORD1 %29 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFMul %287 %289 
                                Private f32* %291 = OpAccessChain %281 %17 
                                                      OpStore %291 %290 
                                       f32_4 %293 = OpLoad %199 
                                       f32_4 %294 = OpLoad %281 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %292 %295 
                         read_only Texture2D %298 = OpLoad %297 
                                     sampler %300 = OpLoad %299 
                  read_only Texture2DSampled %301 = OpSampledImage %298 %300 
                                       f32_4 %302 = OpLoad vs_TEXCOORD0 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                       f32_4 %304 = OpImageSampleImplicitLod %301 %303 
                                                      OpStore %296 %304 
                                       f32_4 %305 = OpLoad %296 
                                       f32_4 %306 = OpLoad vs_TEXCOORD1 
                                       f32_4 %307 = OpVectorShuffle %306 %306 2 2 2 2 
                                       f32_4 %308 = OpFMul %305 %307 
                                       f32_4 %309 = OpLoad %292 
                                       f32_4 %310 = OpFAdd %308 %309 
                                                      OpStore %199 %310 
                                       f32_3 %314 = OpLoad vs_TEXCOORD2 
                                       f32_4 %315 = OpVectorShuffle %314 %314 0 1 0 0 
                                      bool_4 %317 = OpFOrdEqual %315 %316 
                                      bool_2 %318 = OpVectorShuffle %317 %317 0 1 
                                                      OpStore %311 %318 
                               Private bool* %319 = OpAccessChain %311 %78 
                                        bool %320 = OpLoad %319 
                               Private bool* %321 = OpAccessChain %311 %29 
                                        bool %322 = OpLoad %321 
                                        bool %323 = OpLogicalOr %320 %322 
                               Private bool* %324 = OpAccessChain %311 %29 
                                                      OpStore %324 %323 
                               Private bool* %325 = OpAccessChain %311 %29 
                                        bool %326 = OpLoad %325 
                                                      OpSelectionMerge %328 None 
                                                      OpBranchConditional %326 %327 %754 
                                             %327 = OpLabel 
                               Private bool* %329 = OpAccessChain %311 %78 
                                        bool %330 = OpLoad %329 
                                                      OpSelectionMerge %334 None 
                                                      OpBranchConditional %330 %333 %338 
                                             %333 = OpLabel 
                              Uniform f32_4* %335 = OpAccessChain %44 %161 
                                       f32_4 %336 = OpLoad %335 
                                       f32_2 %337 = OpVectorShuffle %336 %336 0 1 
                                                      OpStore %332 %337 
                                                      OpBranch %334 
                                             %338 = OpLabel 
                              Uniform f32_4* %339 = OpAccessChain %44 %160 
                                       f32_4 %340 = OpLoad %339 
                                       f32_2 %341 = OpVectorShuffle %340 %340 0 1 
                                                      OpStore %332 %341 
                                                      OpBranch %334 
                                             %334 = OpLabel 
                                       f32_2 %342 = OpLoad %332 
                                                      OpStore %208 %342 
                                  Input f32* %344 = OpAccessChain vs_TEXCOORD2 %83 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpFAdd %345 %237 
                                Private f32* %347 = OpAccessChain %343 %78 
                                                      OpStore %347 %346 
                                Private f32* %348 = OpAccessChain %343 %29 
                                                      OpStore %348 %237 
                                Private f32* %350 = OpAccessChain %349 %78 
                                                      OpStore %350 %74 
                                       f32_4 %352 = OpLoad %343 
                                       f32_2 %353 = OpVectorShuffle %352 %352 0 1 
                              Uniform f32_4* %355 = OpAccessChain %44 %354 
                                       f32_4 %356 = OpLoad %355 
                                       f32_2 %357 = OpVectorShuffle %356 %356 0 1 
                                       f32_2 %358 = OpFMul %353 %357 
                                                      OpStore %351 %358 
                         read_only Texture2D %361 = OpLoad %360 
                                     sampler %363 = OpLoad %362 
                  read_only Texture2DSampled %364 = OpSampledImage %361 %363 
                                       f32_2 %365 = OpLoad %351 
                                       f32_4 %366 = OpImageSampleImplicitLod %364 %365 
                                                      OpStore %359 %366 
                                Private f32* %368 = OpAccessChain %359 %29 
                                         f32 %369 = OpLoad %368 
                                        bool %370 = OpFOrdLessThan %74 %369 
                                                      OpStore %367 %370 
                                       f32_4 %372 = OpLoad %359 
                                       f32_2 %373 = OpVectorShuffle %372 %372 2 3 
                                       f32_2 %376 = OpFAdd %373 %375 
                                                      OpStore %371 %376 
                                       f32_2 %377 = OpLoad %371 
                                       f32_2 %378 = OpLoad %371 
                                       f32_2 %379 = OpFAdd %377 %378 
                                                      OpStore %371 %379 
                                       f32_4 %382 = OpLoad vs_TEXCOORD0 
                                       f32_2 %383 = OpVectorShuffle %382 %382 0 1 
                                       f32_2 %384 = OpFAdd %383 %375 
                                       f32_3 %385 = OpLoad %381 
                                       f32_3 %386 = OpVectorShuffle %385 %384 3 1 4 
                                                      OpStore %381 %386 
                                       f32_3 %387 = OpLoad %381 
                                       f32_2 %388 = OpVectorShuffle %387 %387 0 2 
                                       f32_2 %391 = OpFMul %388 %390 
                                       f32_2 %392 = OpLoad %371 
                                       f32_2 %393 = OpFNegate %392 
                                       f32_2 %394 = OpFAdd %391 %393 
                                       f32_3 %395 = OpLoad %381 
                                       f32_3 %396 = OpVectorShuffle %395 %394 3 1 4 
                                                      OpStore %381 %396 
                                       f32_3 %398 = OpLoad %381 
                                       f32_2 %399 = OpVectorShuffle %398 %398 0 2 
                                       f32_3 %400 = OpLoad %381 
                                       f32_2 %401 = OpVectorShuffle %400 %400 0 2 
                                         f32 %402 = OpDot %399 %401 
                                                      OpStore %397 %402 
                                         f32 %403 = OpLoad %397 
                                         f32 %404 = OpExtInst %1 32 %403 
                                                      OpStore %397 %404 
                                         f32 %406 = OpLoad %397 
                                       f32_2 %407 = OpCompositeConstruct %406 %406 
                                       f32_3 %408 = OpLoad %381 
                                       f32_2 %409 = OpVectorShuffle %408 %408 0 2 
                                       f32_2 %410 = OpFMul %407 %409 
                                       f32_3 %411 = OpLoad %405 
                                       f32_3 %412 = OpVectorShuffle %411 %410 3 4 2 
                                                      OpStore %405 %412 
                                       f32_2 %413 = OpLoad %371 
                                       f32_2 %414 = OpFNegate %413 
                                       f32_3 %415 = OpLoad %405 
                                       f32_2 %416 = OpVectorShuffle %415 %415 0 1 
                                         f32 %417 = OpDot %414 %416 
                                                      OpStore %397 %417 
                                       f32_2 %418 = OpLoad %371 
                                       f32_2 %419 = OpLoad %371 
                                         f32 %420 = OpDot %418 %419 
                                Private f32* %421 = OpAccessChain %371 %29 
                                                      OpStore %421 %420 
                                         f32 %422 = OpLoad %397 
                                         f32 %423 = OpFNegate %422 
                                         f32 %424 = OpLoad %397 
                                         f32 %425 = OpFMul %423 %424 
                                Private f32* %426 = OpAccessChain %371 %29 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFAdd %425 %427 
                                Private f32* %429 = OpAccessChain %371 %29 
                                                      OpStore %429 %428 
                                Private f32* %430 = OpAccessChain %371 %29 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpFNegate %431 
                                         f32 %433 = OpFAdd %432 %15 
                                Private f32* %434 = OpAccessChain %371 %29 
                                                      OpStore %434 %433 
                                Private f32* %435 = OpAccessChain %371 %29 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpExtInst %1 31 %436 
                                Private f32* %438 = OpAccessChain %371 %29 
                                                      OpStore %438 %437 
                                Private f32* %440 = OpAccessChain %371 %29 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFNegate %441 
                                         f32 %443 = OpLoad %397 
                                         f32 %444 = OpFAdd %442 %443 
                                                      OpStore %439 %444 
                                Private f32* %445 = OpAccessChain %371 %29 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpLoad %397 
                                         f32 %448 = OpFAdd %446 %447 
                                Private f32* %449 = OpAccessChain %371 %29 
                                                      OpStore %449 %448 
                                Private f32* %450 = OpAccessChain %371 %29 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpLoad %439 
                                         f32 %453 = OpExtInst %1 37 %451 %452 
                                                      OpStore %397 %453 
                                         f32 %455 = OpLoad %397 
                                        bool %456 = OpFOrdLessThan %455 %74 
                                                      OpStore %454 %456 
                                Private f32* %457 = OpAccessChain %371 %29 
                                         f32 %458 = OpLoad %457 
                                         f32 %459 = OpLoad %439 
                                         f32 %460 = OpExtInst %1 40 %458 %459 
                                Private f32* %461 = OpAccessChain %371 %29 
                                                      OpStore %461 %460 
                                        bool %462 = OpLoad %454 
                                                      OpSelectionMerge %466 None 
                                                      OpBranchConditional %462 %465 %469 
                                             %465 = OpLabel 
                                Private f32* %467 = OpAccessChain %371 %29 
                                         f32 %468 = OpLoad %467 
                                                      OpStore %464 %468 
                                                      OpBranch %466 
                                             %469 = OpLabel 
                                         f32 %470 = OpLoad %397 
                                                      OpStore %464 %470 
                                                      OpBranch %466 
                                             %466 = OpLabel 
                                         f32 %471 = OpLoad %464 
                                Private f32* %472 = OpAccessChain %371 %29 
                                                      OpStore %472 %471 
                                       f32_2 %473 = OpLoad %371 
                                       f32_2 %474 = OpVectorShuffle %473 %473 0 0 
                                       f32_3 %475 = OpLoad %405 
                                       f32_2 %476 = OpVectorShuffle %475 %475 0 1 
                                       f32_2 %477 = OpFMul %474 %476 
                                                      OpStore %371 %477 
                                Private f32* %480 = OpAccessChain %371 %29 
                                         f32 %481 = OpLoad %480 
                                         f32 %482 = OpExtInst %1 4 %481 
                                        bool %483 = OpFOrdGreaterThanEqual %479 %482 
                                                      OpStore %478 %483 
                                Private f32* %485 = OpAccessChain %371 %78 
                                         f32 %486 = OpLoad %485 
                                         f32 %487 = OpExtInst %1 4 %486 
                                        bool %488 = OpFOrdLessThan %479 %487 
                                                      OpStore %484 %488 
                                       f32_3 %489 = OpLoad %381 
                                       f32_2 %490 = OpVectorShuffle %489 %489 0 2 
                                       f32_2 %491 = OpLoad %371 
                                       f32_2 %492 = OpFDiv %490 %491 
                                                      OpStore %371 %492 
                                        bool %493 = OpLoad %484 
                                                      OpSelectionMerge %496 None 
                                                      OpBranchConditional %493 %495 %499 
                                             %495 = OpLabel 
                                Private f32* %497 = OpAccessChain %371 %78 
                                         f32 %498 = OpLoad %497 
                                                      OpStore %494 %498 
                                                      OpBranch %496 
                                             %499 = OpLabel 
                                                      OpStore %494 %74 
                                                      OpBranch %496 
                                             %496 = OpLabel 
                                         f32 %500 = OpLoad %494 
                                                      OpStore %439 %500 
                                        bool %502 = OpLoad %478 
                                                      OpSelectionMerge %505 None 
                                                      OpBranchConditional %502 %504 %507 
                                             %504 = OpLabel 
                                         f32 %506 = OpLoad %439 
                                                      OpStore %503 %506 
                                                      OpBranch %505 
                                             %507 = OpLabel 
                                Private f32* %508 = OpAccessChain %371 %29 
                                         f32 %509 = OpLoad %508 
                                                      OpStore %503 %509 
                                                      OpBranch %505 
                                             %505 = OpLabel 
                                         f32 %510 = OpLoad %503 
                                Private f32* %511 = OpAccessChain %501 %29 
                                                      OpStore %511 %510 
                                Private f32* %512 = OpAccessChain %501 %78 
                                                      OpStore %512 %74 
                                        bool %513 = OpLoad %367 
                                                      OpSelectionMerge %516 None 
                                                      OpBranchConditional %513 %515 %518 
                                             %515 = OpLabel 
                                       f32_2 %517 = OpLoad %501 
                                                      OpStore %514 %517 
                                                      OpBranch %516 
                                             %518 = OpLabel 
                                       f32_4 %519 = OpLoad vs_TEXCOORD0 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 1 
                                                      OpStore %514 %520 
                                                      OpBranch %516 
                                             %516 = OpLabel 
                                       f32_2 %521 = OpLoad %514 
                                       f32_3 %522 = OpLoad %405 
                                       f32_3 %523 = OpVectorShuffle %522 %521 0 3 4 
                                                      OpStore %405 %523 
                                Private f32* %525 = OpAccessChain %359 %78 
                                         f32 %526 = OpLoad %525 
                                         f32 %528 = OpFMul %526 %527 
                                Private f32* %529 = OpAccessChain %524 %29 
                                                      OpStore %529 %528 
                                Private f32* %532 = OpAccessChain %524 %29 
                                         f32 %533 = OpLoad %532 
                                         i32 %534 = OpConvertFToS %533 
                                                      OpStore %531 %534 
                                Private f32* %536 = OpAccessChain %405 %78 
                                         f32 %537 = OpLoad %536 
                                Private f32* %538 = OpAccessChain %405 %78 
                                         f32 %539 = OpLoad %538 
                                         f32 %540 = OpFNegate %539 
                                        bool %541 = OpFOrdGreaterThanEqual %537 %540 
                                                      OpStore %535 %541 
                                Private f32* %542 = OpAccessChain %405 %78 
                                         f32 %543 = OpLoad %542 
                                         f32 %544 = OpExtInst %1 4 %543 
                                         f32 %545 = OpExtInst %1 10 %544 
                                                      OpStore %439 %545 
                                        bool %546 = OpLoad %535 
                                                      OpSelectionMerge %549 None 
                                                      OpBranchConditional %546 %548 %551 
                                             %548 = OpLabel 
                                         f32 %550 = OpLoad %439 
                                                      OpStore %547 %550 
                                                      OpBranch %549 
                                             %551 = OpLabel 
                                         f32 %552 = OpLoad %439 
                                         f32 %553 = OpFNegate %552 
                                                      OpStore %547 %553 
                                                      OpBranch %549 
                                             %549 = OpLabel 
                                         f32 %554 = OpLoad %547 
                                Private f32* %555 = OpAccessChain %371 %29 
                                                      OpStore %555 %554 
                                         i32 %556 = OpLoad %531 
                                        bool %557 = OpINotEqual %556 %160 
                                                      OpSelectionMerge %560 None 
                                                      OpBranchConditional %557 %559 %563 
                                             %559 = OpLabel 
                                Private f32* %561 = OpAccessChain %405 %78 
                                         f32 %562 = OpLoad %561 
                                                      OpStore %558 %562 
                                                      OpBranch %560 
                                             %563 = OpLabel 
                                Private f32* %564 = OpAccessChain %371 %29 
                                         f32 %565 = OpLoad %564 
                                                      OpStore %558 %565 
                                                      OpBranch %560 
                                             %560 = OpLabel 
                                         f32 %566 = OpLoad %558 
                                Private f32* %567 = OpAccessChain %371 %29 
                                                      OpStore %567 %566 
                                         i32 %569 = OpLoad %531 
                                       i32_4 %571 = OpCompositeConstruct %569 %569 %569 %569 
                                      bool_4 %573 = OpIEqual %571 %572 
                                      bool_2 %574 = OpVectorShuffle %573 %573 0 1 
                                                      OpStore %568 %574 
                                Private f32* %575 = OpAccessChain %371 %29 
                                         f32 %576 = OpLoad %575 
                                                      OpStore %223 %576 
                                         f32 %577 = OpLoad %223 
                                         f32 %578 = OpExtInst %1 43 %577 %74 %15 
                                                      OpStore %223 %578 
                               Private bool* %579 = OpAccessChain %568 %29 
                                        bool %580 = OpLoad %579 
                                                      OpSelectionMerge %583 None 
                                                      OpBranchConditional %580 %582 %585 
                                             %582 = OpLabel 
                                         f32 %584 = OpLoad %223 
                                                      OpStore %581 %584 
                                                      OpBranch %583 
                                             %585 = OpLabel 
                                Private f32* %586 = OpAccessChain %371 %29 
                                         f32 %587 = OpLoad %586 
                                                      OpStore %581 %587 
                                                      OpBranch %583 
                                             %583 = OpLabel 
                                         f32 %588 = OpLoad %581 
                                                      OpStore %223 %588 
                                         f32 %589 = OpLoad %223 
                                         f32 %590 = OpFMul %589 %237 
                                Private f32* %591 = OpAccessChain %371 %29 
                                                      OpStore %591 %590 
                                Private f32* %593 = OpAccessChain %371 %29 
                                         f32 %594 = OpLoad %593 
                                Private f32* %595 = OpAccessChain %371 %29 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFNegate %596 
                                        bool %598 = OpFOrdGreaterThanEqual %594 %597 
                                                      OpStore %592 %598 
                                Private f32* %599 = OpAccessChain %371 %29 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpExtInst %1 4 %600 
                                         f32 %602 = OpExtInst %1 10 %601 
                                Private f32* %603 = OpAccessChain %371 %29 
                                                      OpStore %603 %602 
                                        bool %604 = OpLoad %592 
                                                      OpSelectionMerge %607 None 
                                                      OpBranchConditional %604 %606 %610 
                                             %606 = OpLabel 
                                Private f32* %608 = OpAccessChain %371 %29 
                                         f32 %609 = OpLoad %608 
                                                      OpStore %605 %609 
                                                      OpBranch %607 
                                             %610 = OpLabel 
                                Private f32* %611 = OpAccessChain %371 %29 
                                         f32 %612 = OpLoad %611 
                                         f32 %613 = OpFNegate %612 
                                                      OpStore %605 %613 
                                                      OpBranch %607 
                                             %607 = OpLabel 
                                         f32 %614 = OpLoad %605 
                                Private f32* %615 = OpAccessChain %371 %29 
                                                      OpStore %615 %614 
                                Private f32* %616 = OpAccessChain %371 %29 
                                         f32 %617 = OpLoad %616 
                                Private f32* %618 = OpAccessChain %371 %29 
                                         f32 %619 = OpLoad %618 
                                         f32 %620 = OpFAdd %617 %619 
                                                      OpStore %439 %620 
                                Private f32* %621 = OpAccessChain %371 %29 
                                         f32 %622 = OpLoad %621 
                                        bool %623 = OpFOrdLessThan %237 %622 
                                                      OpStore %535 %623 
                                         f32 %624 = OpLoad %439 
                                         f32 %625 = OpLoad %439 
                                         f32 %626 = OpFNegate %625 
                                        bool %627 = OpFOrdGreaterThanEqual %624 %626 
                               Private bool* %628 = OpAccessChain %568 %29 
                                                      OpStore %628 %627 
                                         f32 %630 = OpLoad %439 
                                         f32 %631 = OpExtInst %1 4 %630 
                                         f32 %632 = OpExtInst %1 10 %631 
                                                      OpStore %629 %632 
                               Private bool* %633 = OpAccessChain %568 %29 
                                        bool %634 = OpLoad %633 
                                                      OpSelectionMerge %637 None 
                                                      OpBranchConditional %634 %636 %639 
                                             %636 = OpLabel 
                                         f32 %638 = OpLoad %629 
                                                      OpStore %635 %638 
                                                      OpBranch %637 
                                             %639 = OpLabel 
                                         f32 %640 = OpLoad %629 
                                         f32 %641 = OpFNegate %640 
                                                      OpStore %635 %641 
                                                      OpBranch %637 
                                             %637 = OpLabel 
                                         f32 %642 = OpLoad %635 
                                Private f32* %643 = OpAccessChain %381 %29 
                                                      OpStore %643 %642 
                                Private f32* %644 = OpAccessChain %381 %29 
                                         f32 %645 = OpLoad %644 
                                         f32 %646 = OpFNegate %645 
                                         f32 %647 = OpFAdd %646 %15 
                                Private f32* %648 = OpAccessChain %381 %29 
                                                      OpStore %648 %647 
                                        bool %649 = OpLoad %535 
                                                      OpSelectionMerge %652 None 
                                                      OpBranchConditional %649 %651 %655 
                                             %651 = OpLabel 
                                Private f32* %653 = OpAccessChain %381 %29 
                                         f32 %654 = OpLoad %653 
                                                      OpStore %650 %654 
                                                      OpBranch %652 
                                             %655 = OpLabel 
                                         f32 %656 = OpLoad %439 
                                                      OpStore %650 %656 
                                                      OpBranch %652 
                                             %652 = OpLabel 
                                         f32 %657 = OpLoad %650 
                                Private f32* %658 = OpAccessChain %371 %29 
                                                      OpStore %658 %657 
                               Private bool* %659 = OpAccessChain %568 %78 
                                        bool %660 = OpLoad %659 
                                                      OpSelectionMerge %663 None 
                                                      OpBranchConditional %660 %662 %666 
                                             %662 = OpLabel 
                                Private f32* %664 = OpAccessChain %371 %29 
                                         f32 %665 = OpLoad %664 
                                                      OpStore %661 %665 
                                                      OpBranch %663 
                                             %666 = OpLabel 
                                         f32 %667 = OpLoad %223 
                                                      OpStore %661 %667 
                                                      OpBranch %663 
                                             %663 = OpLabel 
                                         f32 %668 = OpLoad %661 
                                Private f32* %669 = OpAccessChain %405 %29 
                                                      OpStore %669 %668 
                                Uniform f32* %671 = OpAccessChain %44 %354 %29 
                                         f32 %672 = OpLoad %671 
                                Private f32* %673 = OpAccessChain %349 %29 
                                                      OpStore %673 %672 
                                       f32_4 %674 = OpLoad %343 
                                       f32_2 %675 = OpVectorShuffle %674 %674 0 1 
                              Uniform f32_4* %676 = OpAccessChain %44 %354 
                                       f32_4 %677 = OpLoad %676 
                                       f32_2 %678 = OpVectorShuffle %677 %677 0 1 
                                       f32_2 %679 = OpFMul %675 %678 
                                       f32_2 %680 = OpLoad %349 
                                       f32_2 %681 = OpFAdd %679 %680 
                                                      OpStore %371 %681 
                         read_only Texture2D %682 = OpLoad %360 
                                     sampler %683 = OpLoad %362 
                  read_only Texture2DSampled %684 = OpSampledImage %682 %683 
                                       f32_2 %685 = OpLoad %371 
                                       f32_4 %686 = OpImageSampleImplicitLod %684 %685 
                                                      OpStore %359 %686 
                                       f32_4 %687 = OpLoad %359 
                                       f32_2 %688 = OpVectorShuffle %687 %687 1 3 
                                       f32_2 %690 = OpFMul %688 %689 
                                                      OpStore %371 %690 
                                       f32_4 %691 = OpLoad %359 
                                       f32_2 %692 = OpVectorShuffle %691 %691 0 2 
                                       f32_2 %695 = OpFMul %692 %694 
                                       f32_2 %696 = OpLoad %371 
                                       f32_2 %697 = OpFAdd %695 %696 
                                                      OpStore %524 %697 
                                       f32_2 %698 = OpLoad %524 
                                       f32_2 %700 = OpFAdd %698 %699 
                                                      OpStore %371 %700 
                                       f32_2 %701 = OpLoad %349 
                                       f32_2 %702 = OpFMul %701 %390 
                                       f32_2 %703 = OpLoad %351 
                                       f32_2 %704 = OpFAdd %702 %703 
                                                      OpStore %351 %704 
                         read_only Texture2D %705 = OpLoad %360 
                                     sampler %706 = OpLoad %362 
                  read_only Texture2DSampled %707 = OpSampledImage %705 %706 
                                       f32_2 %708 = OpLoad %351 
                                       f32_4 %709 = OpImageSampleImplicitLod %707 %708 
                                                      OpStore %296 %709 
                                       f32_4 %710 = OpLoad %296 
                                       f32_2 %711 = OpVectorShuffle %710 %710 1 3 
                                       f32_2 %712 = OpFMul %711 %689 
                                                      OpStore %351 %712 
                                       f32_4 %713 = OpLoad %296 
                                       f32_2 %714 = OpVectorShuffle %713 %713 0 2 
                                       f32_2 %715 = OpFMul %714 %694 
                                       f32_2 %716 = OpLoad %351 
                                       f32_2 %717 = OpFAdd %715 %716 
                                                      OpStore %524 %717 
                                       f32_2 %718 = OpLoad %208 
                                       f32_2 %719 = OpLoad %371 
                                       f32_2 %720 = OpFMul %718 %719 
                                                      OpStore %351 %720 
                                       f32_2 %721 = OpLoad %208 
                                       f32_2 %722 = OpLoad %524 
                                       f32_2 %723 = OpFMul %721 %722 
                                                      OpStore %208 %723 
                                       f32_3 %724 = OpLoad %405 
                                       f32_2 %725 = OpVectorShuffle %724 %724 0 2 
                                       f32_2 %726 = OpLoad %208 
                                       f32_2 %727 = OpFMul %725 %726 
                                       f32_2 %728 = OpLoad %351 
                                       f32_2 %729 = OpFAdd %727 %728 
                                                      OpStore %208 %729 
                         read_only Texture2D %730 = OpLoad %191 
                                     sampler %731 = OpLoad %193 
                  read_only Texture2DSampled %732 = OpSampledImage %730 %731 
                                       f32_2 %733 = OpLoad %208 
                                       f32_4 %734 = OpImageSampleImplicitLod %732 %733 
                                                      OpStore %296 %734 
                                       f32_4 %735 = OpLoad %296 
                                       f32_3 %736 = OpLoad vs_TEXCOORD2 
                                       f32_4 %737 = OpVectorShuffle %736 %736 0 0 0 0 
                                       f32_4 %738 = OpFMul %735 %737 
                                       f32_4 %739 = OpLoad %199 
                                       f32_4 %740 = OpFAdd %738 %739 
                                                      OpStore %343 %740 
                         read_only Texture2D %742 = OpLoad %297 
                                     sampler %743 = OpLoad %299 
                  read_only Texture2DSampled %744 = OpSampledImage %742 %743 
                                       f32_2 %745 = OpLoad %208 
                                       f32_4 %746 = OpImageSampleImplicitLod %744 %745 
                                                      OpStore %741 %746 
                                       f32_4 %747 = OpLoad %741 
                                       f32_3 %748 = OpLoad vs_TEXCOORD2 
                                       f32_4 %749 = OpVectorShuffle %748 %748 1 1 1 1 
                                       f32_4 %750 = OpFMul %747 %749 
                                       f32_4 %751 = OpLoad %343 
                                       f32_4 %752 = OpFAdd %750 %751 
                                                      OpStore %343 %752 
                                       f32_4 %753 = OpLoad %343 
                                                      OpStore %281 %753 
                                                      OpBranch %328 
                                             %754 = OpLabel 
                                       f32_4 %755 = OpLoad %199 
                                                      OpStore %281 %755 
                                                      OpBranch %328 
                                             %328 = OpLabel 
                                       f32_4 %758 = OpLoad %281 
                                       f32_3 %759 = OpVectorShuffle %758 %758 0 1 2 
                                       f32_4 %760 = OpLoad %185 
                                       f32_3 %761 = OpVectorShuffle %760 %760 0 1 2 
                                       f32_3 %762 = OpFMul %759 %761 
                                       f32_4 %763 = OpLoad %757 
                                       f32_4 %764 = OpVectorShuffle %763 %762 4 5 6 3 
                                                      OpStore %757 %764 
                                Private f32* %765 = OpAccessChain %70 %29 
                                         f32 %766 = OpLoad %765 
                                Private f32* %767 = OpAccessChain %281 %17 
                                         f32 %768 = OpLoad %767 
                                         f32 %769 = OpFMul %766 %768 
                                 Output f32* %771 = OpAccessChain %757 %17 
                                                      OpStore %771 %769 
                                                      OpReturn
                                                      OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 477
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Vertex %4 "main" %11 %159 %256 %325 %358 %372 %450 %451 %459 %466 %469 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 Location 11 
                                                      OpDecorate %144 ArrayStride 144 
                                                      OpDecorate %145 ArrayStride 145 
                                                      OpDecorate %147 ArrayStride 147 
                                                      OpMemberDecorate %148 0 Offset 148 
                                                      OpMemberDecorate %148 1 Offset 148 
                                                      OpMemberDecorate %148 2 Offset 148 
                                                      OpMemberDecorate %148 3 Offset 148 
                                                      OpMemberDecorate %148 4 Offset 148 
                                                      OpMemberDecorate %148 5 Offset 148 
                                                      OpMemberDecorate %148 6 Offset 148 
                                                      OpDecorate %148 Block 
                                                      OpDecorate %150 DescriptorSet 150 
                                                      OpDecorate %150 Binding 150 
                                                      OpDecorate %159 Location 159 
                                                      OpDecorate %256 Location 256 
                                                      OpMemberDecorate %323 0 BuiltIn 323 
                                                      OpMemberDecorate %323 1 BuiltIn 323 
                                                      OpMemberDecorate %323 2 BuiltIn 323 
                                                      OpDecorate %323 Block 
                                                      OpDecorate vs_TEXCOORD0 Location 358 
                                                      OpDecorate %372 Location 372 
                                                      OpDecorate %450 RelaxedPrecision 
                                                      OpDecorate %450 Location 450 
                                                      OpDecorate %451 Location 451 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 459 
                                                      OpDecorate vs_TEXCOORD3 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD3 Flat 
                                                      OpDecorate vs_TEXCOORD3 Location 466 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 469 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Private %7 
                                Private f32_4* %9 = OpVariable Private 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                          f32 %16 = OpConstant 3.674022E-40 
                                          f32 %17 = OpConstant 3.674022E-40 
                                        f32_3 %18 = OpConstantComposite %15 %16 %17 
                                              %22 = OpTypeInt 32 1 
                                              %23 = OpTypePointer Private %22 
                                 Private i32* %24 = OpVariable Private 
                                              %25 = OpTypeInt 32 0 
                                          u32 %26 = OpConstant 0 
                                              %27 = OpTypePointer Private %6 
                                              %31 = OpTypeVector %22 2 
                                              %32 = OpTypePointer Private %31 
                               Private i32_2* %33 = OpVariable Private 
                                          i32 %36 = OpConstant 1 
                                          i32 %37 = OpConstant 2 
                                        i32_2 %38 = OpConstantComposite %36 %37 
                                              %40 = OpTypeBool 
                                              %41 = OpTypeVector %40 4 
                                              %42 = OpTypePointer Private %41 
                              Private bool_4* %43 = OpVariable Private 
                                          f32 %46 = OpConstant 3.674022E-40 
                                          f32 %47 = OpConstant 3.674022E-40 
                                          f32 %48 = OpConstant 3.674022E-40 
                                          f32 %49 = OpConstant 3.674022E-40 
                                        f32_4 %50 = OpConstantComposite %46 %47 %48 %49 
                                              %52 = OpTypePointer Private %12 
                               Private f32_3* %53 = OpVariable Private 
                                          u32 %54 = OpConstant 1 
                                              %55 = OpTypePointer Private %40 
                                          f32 %58 = OpConstant 3.674022E-40 
                                          f32 %59 = OpConstant 3.674022E-40 
                              Private bool_4* %66 = OpVariable Private 
                                          f32 %69 = OpConstant 3.674022E-40 
                                          f32 %70 = OpConstant 3.674022E-40 
                                          f32 %71 = OpConstant 3.674022E-40 
                                          f32 %72 = OpConstant 3.674022E-40 
                                        f32_4 %73 = OpConstantComposite %69 %70 %71 %72 
                               Private f32_3* %75 = OpVariable Private 
                                          u32 %80 = OpConstant 2 
                                          u32 %85 = OpConstant 3 
                                Private bool* %90 = OpVariable Private 
                                              %91 = OpTypePointer Input %6 
                                          f32 %94 = OpConstant 3.674022E-40 
                               Private f32_4* %96 = OpVariable Private 
                                Private f32* %106 = OpVariable Private 
                              Private f32_4* %142 = OpVariable Private 
                                         u32 %143 = OpConstant 4 
                                             %144 = OpTypeArray %7 %143 
                                             %145 = OpTypeArray %7 %143 
                                         u32 %146 = OpConstant 60 
                                             %147 = OpTypeArray %7 %146 
                                             %148 = OpTypeStruct %144 %145 %7 %7 %7 %7 %147 
                                             %149 = OpTypePointer Uniform %148 
Uniform struct {f32_4[4]; f32_4[4]; f32_4; f32_4; f32_4; f32_4; f32_4[60];}* %150 = OpVariable Uniform 
                                         i32 %151 = OpConstant 6 
                                             %153 = OpTypeVector %6 2 
                                             %154 = OpTypePointer Uniform %7 
                                             %158 = OpTypePointer Input %153 
                                Input f32_2* %159 = OpVariable Input 
                                             %171 = OpTypePointer Private %153 
                              Private f32_2* %172 = OpVariable Private 
                                         i32 %175 = OpConstant 5 
                              Private f32_3* %180 = OpVariable Private 
                                       f32_2 %183 = OpConstantComposite %58 %58 
                              Private f32_4* %187 = OpVariable Private 
                              Private f32_2* %200 = OpVariable Private 
                                             %203 = OpTypePointer Function %6 
                                         f32 %228 = OpConstant 3.674022E-40 
                                       f32_2 %229 = OpConstantComposite %228 %228 
                                         f32 %235 = OpConstant 3.674022E-40 
                                       f32_2 %236 = OpConstantComposite %235 %235 
                                         f32 %239 = OpConstant 3.674022E-40 
                                       f32_2 %240 = OpConstantComposite %239 %239 
                                         f32 %243 = OpConstant 3.674022E-40 
                                       f32_2 %244 = OpConstantComposite %243 %243 
                                Input f32_4* %256 = OpVariable Input 
                              Private f32_2* %274 = OpVariable Private 
                                         i32 %280 = OpConstant 0 
                                         i32 %299 = OpConstant 3 
                                             %322 = OpTypeArray %6 %54 
                                             %323 = OpTypeStruct %7 %6 %322 
                                             %324 = OpTypePointer Output %323 
        Output struct {f32_4; f32; f32[1];}* %325 = OpVariable Output 
                                             %333 = OpTypePointer Output %7 
                               Private bool* %346 = OpVariable Private 
                       Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                             %360 = OpTypePointer Function %153 
                                Input f32_4* %372 = OpVariable Input 
                                         f32 %375 = OpConstant 3.674022E-40 
                                       f32_2 %376 = OpConstantComposite %375 %16 
                               Private bool* %379 = OpVariable Private 
                                         f32 %387 = OpConstant 3.674022E-40 
                                         f32 %388 = OpConstant 3.674022E-40 
                                       f32_2 %389 = OpConstantComposite %387 %388 
                                         f32 %390 = OpConstant 3.674022E-40 
                                         f32 %391 = OpConstant 3.674022E-40 
                                       f32_2 %392 = OpConstantComposite %390 %391 
                                             %393 = OpTypeVector %40 2 
                                Private f32* %398 = OpVariable Private 
                                Private f32* %418 = OpVariable Private 
                                         f32 %421 = OpConstant 3.674022E-40 
                                         f32 %436 = OpConstant 3.674022E-40 
                                       f32_2 %437 = OpConstantComposite %436 %436 
                                         i32 %443 = OpConstant 4 
                               Output f32_4* %450 = OpVariable Output 
                                Input f32_4* %451 = OpVariable Input 
                       Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                       Output f32_4* vs_TEXCOORD3 = OpVariable Output 
                                             %468 = OpTypePointer Output %12 
                       Output f32_3* vs_TEXCOORD2 = OpVariable Output 
                                             %471 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32* %204 = OpVariable Function 
                               Function f32* %216 = OpVariable Function 
                             Function f32_2* %361 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 2 2 
                                        f32_3 %19 = OpFMul %14 %18 
                                        f32_4 %20 = OpLoad %9 
                                        f32_4 %21 = OpVectorShuffle %20 %19 4 5 6 3 
                                                      OpStore %9 %21 
                                 Private f32* %28 = OpAccessChain %9 %26 
                                          f32 %29 = OpLoad %28 
                                          i32 %30 = OpConvertFToS %29 
                                                      OpStore %24 %30 
                                          i32 %34 = OpLoad %24 
                                        i32_2 %35 = OpCompositeConstruct %34 %34 
                                        i32_2 %39 = OpIAdd %35 %38 
                                                      OpStore %33 %39 
                                        f32_4 %44 = OpLoad %11 
                                        f32_4 %45 = OpVectorShuffle %44 %44 3 3 3 3 
                                       bool_4 %51 = OpFOrdEqual %45 %50 
                                                      OpStore %43 %51 
                                Private bool* %56 = OpAccessChain %43 %54 
                                         bool %57 = OpLoad %56 
                                          f32 %60 = OpSelect %57 %58 %59 
                                 Private f32* %61 = OpAccessChain %53 %26 
                                                      OpStore %61 %60 
                                Private bool* %62 = OpAccessChain %43 %26 
                                         bool %63 = OpLoad %62 
                                          f32 %64 = OpSelect %63 %58 %59 
                                 Private f32* %65 = OpAccessChain %53 %54 
                                                      OpStore %65 %64 
                                        f32_4 %67 = OpLoad %11 
                                        f32_4 %68 = OpVectorShuffle %67 %67 3 3 3 3 
                                       bool_4 %74 = OpFOrdEqual %68 %73 
                                                      OpStore %66 %74 
                                Private bool* %76 = OpAccessChain %66 %54 
                                         bool %77 = OpLoad %76 
                                          f32 %78 = OpSelect %77 %58 %59 
                                 Private f32* %79 = OpAccessChain %75 %26 
                                                      OpStore %79 %78 
                                Private bool* %81 = OpAccessChain %66 %80 
                                         bool %82 = OpLoad %81 
                                          f32 %83 = OpSelect %82 %58 %59 
                                 Private f32* %84 = OpAccessChain %75 %54 
                                                      OpStore %84 %83 
                                Private bool* %86 = OpAccessChain %66 %85 
                                         bool %87 = OpLoad %86 
                                          f32 %88 = OpSelect %87 %58 %59 
                                 Private f32* %89 = OpAccessChain %75 %80 
                                                      OpStore %89 %88 
                                   Input f32* %92 = OpAccessChain %11 %85 
                                          f32 %93 = OpLoad %92 
                                         bool %95 = OpFOrdEqual %93 %94 
                                                      OpStore %90 %95 
                                         bool %97 = OpLoad %90 
                                          f32 %98 = OpSelect %97 %58 %59 
                                 Private f32* %99 = OpAccessChain %96 %26 
                                                      OpStore %99 %98 
                                Private f32* %100 = OpAccessChain %75 %80 
                                         f32 %101 = OpLoad %100 
                                Private f32* %102 = OpAccessChain %75 %54 
                                         f32 %103 = OpLoad %102 
                                         f32 %104 = OpFAdd %101 %103 
                                Private f32* %105 = OpAccessChain %96 %54 
                                                      OpStore %105 %104 
                                Private f32* %107 = OpAccessChain %96 %54 
                                         f32 %108 = OpLoad %107 
                                Private f32* %109 = OpAccessChain %96 %26 
                                         f32 %110 = OpLoad %109 
                                         f32 %111 = OpFAdd %108 %110 
                                                      OpStore %106 %111 
                                Private f32* %112 = OpAccessChain %75 %26 
                                         f32 %113 = OpLoad %112 
                                         f32 %114 = OpLoad %106 
                                         f32 %115 = OpFAdd %113 %114 
                                                      OpStore %106 %115 
                                Private f32* %116 = OpAccessChain %53 %26 
                                         f32 %117 = OpLoad %116 
                                         f32 %118 = OpLoad %106 
                                         f32 %119 = OpFAdd %117 %118 
                                                      OpStore %106 %119 
                                Private f32* %120 = OpAccessChain %53 %54 
                                         f32 %121 = OpLoad %120 
                                         f32 %122 = OpLoad %106 
                                         f32 %123 = OpFAdd %121 %122 
                                                      OpStore %106 %123 
                                         f32 %124 = OpLoad %106 
                                         f32 %125 = OpExtInst %1 37 %124 %58 
                                                      OpStore %106 %125 
                                         f32 %126 = OpLoad %106 
                                         f32 %127 = OpFNegate %126 
                                         f32 %128 = OpFAdd %127 %58 
                                Private f32* %129 = OpAccessChain %96 %85 
                                                      OpStore %129 %128 
                               Private bool* %130 = OpAccessChain %43 %85 
                                        bool %131 = OpLoad %130 
                               Private bool* %132 = OpAccessChain %66 %26 
                                        bool %133 = OpLoad %132 
                                        bool %134 = OpLogicalOr %131 %133 
                                                      OpStore %90 %134 
                               Private bool* %135 = OpAccessChain %43 %80 
                                        bool %136 = OpLoad %135 
                                        bool %137 = OpLoad %90 
                                        bool %138 = OpLogicalOr %136 %137 
                                                      OpStore %90 %138 
                                        bool %139 = OpLoad %90 
                                                      OpSelectionMerge %141 None 
                                                      OpBranchConditional %139 %140 %250 
                                             %140 = OpLabel 
                                         i32 %152 = OpLoad %24 
                              Uniform f32_4* %155 = OpAccessChain %150 %151 %152 
                                       f32_4 %156 = OpLoad %155 
                                       f32_2 %157 = OpVectorShuffle %156 %156 0 1 
                                       f32_2 %160 = OpLoad %159 
                                         f32 %161 = OpDot %157 %160 
                                Private f32* %162 = OpAccessChain %142 %26 
                                                      OpStore %162 %161 
                                Private i32* %163 = OpAccessChain %33 %26 
                                         i32 %164 = OpLoad %163 
                              Uniform f32_4* %165 = OpAccessChain %150 %151 %164 
                                       f32_4 %166 = OpLoad %165 
                                       f32_2 %167 = OpVectorShuffle %166 %166 0 1 
                                       f32_2 %168 = OpLoad %159 
                                         f32 %169 = OpDot %167 %168 
                                Private f32* %170 = OpAccessChain %142 %54 
                                                      OpStore %170 %169 
                                       f32_4 %173 = OpLoad %142 
                                       f32_2 %174 = OpVectorShuffle %173 %173 0 1 
                              Uniform f32_4* %176 = OpAccessChain %150 %175 
                                       f32_4 %177 = OpLoad %176 
                                       f32_2 %178 = OpVectorShuffle %177 %177 2 3 
                                       f32_2 %179 = OpFMul %174 %178 
                                                      OpStore %172 %179 
                                       f32_2 %181 = OpLoad %172 
                                       f32_2 %182 = OpExtInst %1 4 %181 
                                       f32_2 %184 = OpExtInst %1 40 %182 %183 
                                       f32_3 %185 = OpLoad %180 
                                       f32_3 %186 = OpVectorShuffle %185 %184 3 1 4 
                                                      OpStore %180 %186 
                                       f32_3 %188 = OpLoad %180 
                                       f32_2 %189 = OpVectorShuffle %188 %188 0 2 
                                       f32_2 %190 = OpExtInst %1 2 %189 
                                       f32_4 %191 = OpLoad %187 
                                       f32_4 %192 = OpVectorShuffle %191 %190 4 5 2 3 
                                                      OpStore %187 %192 
                                       f32_3 %193 = OpLoad %180 
                                       f32_2 %194 = OpVectorShuffle %193 %193 0 2 
                                       f32_4 %195 = OpLoad %187 
                                       f32_2 %196 = OpVectorShuffle %195 %195 0 1 
                                       f32_2 %197 = OpExtInst %1 40 %194 %196 
                                       f32_3 %198 = OpLoad %180 
                                       f32_3 %199 = OpVectorShuffle %198 %197 3 1 4 
                                                      OpStore %180 %199 
                               Private bool* %201 = OpAccessChain %43 %85 
                                        bool %202 = OpLoad %201 
                                                      OpSelectionMerge %206 None 
                                                      OpBranchConditional %202 %205 %209 
                                             %205 = OpLabel 
                                Private f32* %207 = OpAccessChain %180 %26 
                                         f32 %208 = OpLoad %207 
                                                      OpStore %204 %208 
                                                      OpBranch %206 
                                             %209 = OpLabel 
                                Private f32* %210 = OpAccessChain %187 %26 
                                         f32 %211 = OpLoad %210 
                                                      OpStore %204 %211 
                                                      OpBranch %206 
                                             %206 = OpLabel 
                                         f32 %212 = OpLoad %204 
                                Private f32* %213 = OpAccessChain %200 %26 
                                                      OpStore %213 %212 
                               Private bool* %214 = OpAccessChain %43 %80 
                                        bool %215 = OpLoad %214 
                                                      OpSelectionMerge %218 None 
                                                      OpBranchConditional %215 %217 %221 
                                             %217 = OpLabel 
                                Private f32* %219 = OpAccessChain %180 %80 
                                         f32 %220 = OpLoad %219 
                                                      OpStore %216 %220 
                                                      OpBranch %218 
                                             %221 = OpLabel 
                                Private f32* %222 = OpAccessChain %187 %54 
                                         f32 %223 = OpLoad %222 
                                                      OpStore %216 %223 
                                                      OpBranch %218 
                                             %218 = OpLabel 
                                         f32 %224 = OpLoad %216 
                                Private f32* %225 = OpAccessChain %200 %54 
                                                      OpStore %225 %224 
                                       f32_2 %226 = OpLoad %172 
                                       f32_2 %227 = OpExtInst %1 4 %226 
                                       f32_2 %230 = OpFAdd %227 %229 
                                                      OpStore %172 %230 
                                       f32_2 %231 = OpLoad %200 
                                       f32_2 %232 = OpLoad %172 
                                       f32_2 %233 = OpFDiv %231 %232 
                                                      OpStore %172 %233 
                                       f32_2 %234 = OpLoad %172 
                                       f32_2 %237 = OpExtInst %1 40 %234 %236 
                                                      OpStore %172 %237 
                                       f32_2 %238 = OpLoad %172 
                                       f32_2 %241 = OpExtInst %1 37 %238 %240 
                                                      OpStore %172 %241 
                                       f32_2 %242 = OpLoad %172 
                                       f32_2 %245 = OpFAdd %242 %244 
                                                      OpStore %172 %245 
                                       f32_4 %246 = OpLoad %142 
                                       f32_2 %247 = OpVectorShuffle %246 %246 0 1 
                                       f32_2 %248 = OpLoad %172 
                                       f32_2 %249 = OpFMul %247 %248 
                                                      OpStore %172 %249 
                                                      OpBranch %141 
                                             %250 = OpLabel 
                                Private f32* %251 = OpAccessChain %172 %26 
                                                      OpStore %251 %59 
                                Private f32* %252 = OpAccessChain %172 %54 
                                                      OpStore %252 %59 
                                                      OpBranch %141 
                                             %141 = OpLabel 
                                         i32 %253 = OpLoad %24 
                              Uniform f32_4* %254 = OpAccessChain %150 %151 %253 
                                       f32_4 %255 = OpLoad %254 
                                       f32_4 %257 = OpLoad %256 
                                         f32 %258 = OpDot %255 %257 
                                Private f32* %259 = OpAccessChain %200 %26 
                                                      OpStore %259 %258 
                                Private i32* %260 = OpAccessChain %33 %26 
                                         i32 %261 = OpLoad %260 
                              Uniform f32_4* %262 = OpAccessChain %150 %151 %261 
                                       f32_4 %263 = OpLoad %262 
                                       f32_4 %264 = OpLoad %256 
                                         f32 %265 = OpDot %263 %264 
                                Private f32* %266 = OpAccessChain %200 %54 
                                                      OpStore %266 %265 
                                Private i32* %267 = OpAccessChain %33 %54 
                                         i32 %268 = OpLoad %267 
                              Uniform f32_4* %269 = OpAccessChain %150 %151 %268 
                                       f32_4 %270 = OpLoad %269 
                                       f32_4 %271 = OpLoad %256 
                                         f32 %272 = OpDot %270 %271 
                                Private f32* %273 = OpAccessChain %9 %26 
                                                      OpStore %273 %272 
                                       f32_2 %275 = OpLoad %172 
                                       f32_2 %276 = OpLoad %200 
                                       f32_2 %277 = OpFAdd %275 %276 
                                                      OpStore %274 %277 
                                       f32_2 %278 = OpLoad %274 
                                       f32_4 %279 = OpVectorShuffle %278 %278 1 1 1 1 
                              Uniform f32_4* %281 = OpAccessChain %150 %280 %36 
                                       f32_4 %282 = OpLoad %281 
                                       f32_4 %283 = OpFMul %279 %282 
                                                      OpStore %142 %283 
                              Uniform f32_4* %284 = OpAccessChain %150 %280 %280 
                                       f32_4 %285 = OpLoad %284 
                                       f32_2 %286 = OpLoad %274 
                                       f32_4 %287 = OpVectorShuffle %286 %286 0 0 0 0 
                                       f32_4 %288 = OpFMul %285 %287 
                                       f32_4 %289 = OpLoad %142 
                                       f32_4 %290 = OpFAdd %288 %289 
                                                      OpStore %142 %290 
                              Uniform f32_4* %291 = OpAccessChain %150 %280 %37 
                                       f32_4 %292 = OpLoad %291 
                                       f32_4 %293 = OpLoad %9 
                                       f32_4 %294 = OpVectorShuffle %293 %293 0 0 0 0 
                                       f32_4 %295 = OpFMul %292 %294 
                                       f32_4 %296 = OpLoad %142 
                                       f32_4 %297 = OpFAdd %295 %296 
                                                      OpStore %142 %297 
                                       f32_4 %298 = OpLoad %142 
                              Uniform f32_4* %300 = OpAccessChain %150 %280 %299 
                                       f32_4 %301 = OpLoad %300 
                                       f32_4 %302 = OpFAdd %298 %301 
                                                      OpStore %142 %302 
                                       f32_4 %303 = OpLoad %142 
                                       f32_4 %304 = OpVectorShuffle %303 %303 1 1 1 1 
                              Uniform f32_4* %305 = OpAccessChain %150 %36 %36 
                                       f32_4 %306 = OpLoad %305 
                                       f32_4 %307 = OpFMul %304 %306 
                                                      OpStore %187 %307 
                              Uniform f32_4* %308 = OpAccessChain %150 %36 %280 
                                       f32_4 %309 = OpLoad %308 
                                       f32_4 %310 = OpLoad %142 
                                       f32_4 %311 = OpVectorShuffle %310 %310 0 0 0 0 
                                       f32_4 %312 = OpFMul %309 %311 
                                       f32_4 %313 = OpLoad %187 
                                       f32_4 %314 = OpFAdd %312 %313 
                                                      OpStore %187 %314 
                              Uniform f32_4* %315 = OpAccessChain %150 %36 %37 
                                       f32_4 %316 = OpLoad %315 
                                       f32_4 %317 = OpLoad %142 
                                       f32_4 %318 = OpVectorShuffle %317 %317 2 2 2 2 
                                       f32_4 %319 = OpFMul %316 %318 
                                       f32_4 %320 = OpLoad %187 
                                       f32_4 %321 = OpFAdd %319 %320 
                                                      OpStore %187 %321 
                              Uniform f32_4* %326 = OpAccessChain %150 %36 %299 
                                       f32_4 %327 = OpLoad %326 
                                       f32_4 %328 = OpLoad %142 
                                       f32_4 %329 = OpVectorShuffle %328 %328 3 3 3 3 
                                       f32_4 %330 = OpFMul %327 %329 
                                       f32_4 %331 = OpLoad %187 
                                       f32_4 %332 = OpFAdd %330 %331 
                               Output f32_4* %334 = OpAccessChain %325 %280 
                                                      OpStore %334 %332 
                                       f32_2 %335 = OpLoad %159 
                              Uniform f32_4* %336 = OpAccessChain %150 %37 
                                       f32_4 %337 = OpLoad %336 
                                       f32_2 %338 = OpVectorShuffle %337 %337 0 1 
                                       f32_2 %339 = OpFMul %335 %338 
                              Uniform f32_4* %340 = OpAccessChain %150 %37 
                                       f32_4 %341 = OpLoad %340 
                                       f32_2 %342 = OpVectorShuffle %341 %341 2 3 
                                       f32_2 %343 = OpFAdd %339 %342 
                                       f32_4 %344 = OpLoad %9 
                                       f32_4 %345 = OpVectorShuffle %344 %343 4 1 2 5 
                                                      OpStore %9 %345 
                                Private f32* %347 = OpAccessChain %96 %54 
                                         f32 %348 = OpLoad %347 
                                        bool %349 = OpFOrdEqual %348 %58 
                                                      OpStore %346 %349 
                                       f32_4 %350 = OpLoad %9 
                                       f32_2 %351 = OpVectorShuffle %350 %350 0 3 
                              Uniform f32_4* %352 = OpAccessChain %150 %299 
                                       f32_4 %353 = OpLoad %352 
                                       f32_2 %354 = OpVectorShuffle %353 %353 0 1 
                                       f32_2 %355 = OpFMul %351 %354 
                                       f32_4 %356 = OpLoad %142 
                                       f32_4 %357 = OpVectorShuffle %356 %355 4 5 2 3 
                                                      OpStore %142 %357 
                                        bool %359 = OpLoad %346 
                                                      OpSelectionMerge %363 None 
                                                      OpBranchConditional %359 %362 %366 
                                             %362 = OpLabel 
                                       f32_4 %364 = OpLoad %142 
                                       f32_2 %365 = OpVectorShuffle %364 %364 0 1 
                                                      OpStore %361 %365 
                                                      OpBranch %363 
                                             %366 = OpLabel 
                                       f32_4 %367 = OpLoad %9 
                                       f32_2 %368 = OpVectorShuffle %367 %367 0 3 
                                                      OpStore %361 %368 
                                                      OpBranch %363 
                                             %363 = OpLabel 
                                       f32_2 %369 = OpLoad %361 
                                       f32_4 %370 = OpLoad vs_TEXCOORD0 
                                       f32_4 %371 = OpVectorShuffle %370 %369 4 5 2 3 
                                                      OpStore vs_TEXCOORD0 %371 
                                       f32_4 %373 = OpLoad %372 
                                       f32_2 %374 = OpVectorShuffle %373 %373 2 3 
                                         f32 %377 = OpDot %374 %376 
                                Private f32* %378 = OpAccessChain %53 %80 
                                                      OpStore %378 %377 
                                Private f32* %380 = OpAccessChain %9 %80 
                                         f32 %381 = OpLoad %380 
                                Private f32* %382 = OpAccessChain %9 %80 
                                         f32 %383 = OpLoad %382 
                                         f32 %384 = OpFNegate %383 
                                        bool %385 = OpFOrdGreaterThanEqual %381 %384 
                                                      OpStore %379 %385 
                                        bool %386 = OpLoad %379 
                                      bool_2 %394 = OpCompositeConstruct %386 %386 
                                       f32_2 %395 = OpSelect %394 %389 %392 
                                       f32_4 %396 = OpLoad %9 
                                       f32_4 %397 = OpVectorShuffle %396 %395 4 1 5 3 
                                                      OpStore %9 %397 
                                Private f32* %399 = OpAccessChain %9 %80 
                                         f32 %400 = OpLoad %399 
                                Private f32* %401 = OpAccessChain %9 %54 
                                         f32 %402 = OpLoad %401 
                                         f32 %403 = OpFMul %400 %402 
                                                      OpStore %398 %403 
                                         f32 %404 = OpLoad %398 
                                         f32 %405 = OpExtInst %1 10 %404 
                                                      OpStore %398 %405 
                                         f32 %406 = OpLoad %398 
                                Private f32* %407 = OpAccessChain %9 %26 
                                         f32 %408 = OpLoad %407 
                                         f32 %409 = OpFMul %406 %408 
                                Private f32* %410 = OpAccessChain %9 %26 
                                                      OpStore %410 %409 
                                  Input f32* %411 = OpAccessChain %11 %80 
                                         f32 %412 = OpLoad %411 
                                         f32 %413 = OpFMul %412 %16 
                                Private f32* %414 = OpAccessChain %9 %26 
                                         f32 %415 = OpLoad %414 
                                         f32 %416 = OpFNegate %415 
                                         f32 %417 = OpFAdd %413 %416 
                                                      OpStore %398 %417 
                                  Input f32* %419 = OpAccessChain %372 %54 
                                         f32 %420 = OpLoad %419 
                                         f32 %422 = OpFMul %420 %421 
                                                      OpStore %418 %422 
                                  Input f32* %423 = OpAccessChain %372 %26 
                                         f32 %424 = OpLoad %423 
                                         f32 %425 = OpFMul %424 %17 
                                Private f32* %426 = OpAccessChain %9 %26 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFAdd %425 %427 
                                Private f32* %429 = OpAccessChain %172 %26 
                                                      OpStore %429 %428 
                                         f32 %430 = OpLoad %398 
                                         f32 %431 = OpFMul %430 %388 
                                         f32 %432 = OpLoad %418 
                                         f32 %433 = OpFAdd %431 %432 
                                Private f32* %434 = OpAccessChain %172 %54 
                                                      OpStore %434 %433 
                                       f32_2 %435 = OpLoad %172 
                                       f32_2 %438 = OpFAdd %435 %437 
                                       f32_4 %439 = OpLoad %9 
                                       f32_4 %440 = OpVectorShuffle %439 %438 4 5 2 3 
                                                      OpStore %9 %440 
                                       f32_4 %441 = OpLoad %9 
                                       f32_2 %442 = OpVectorShuffle %441 %441 0 1 
                              Uniform f32_4* %444 = OpAccessChain %150 %443 
                                       f32_4 %445 = OpLoad %444 
                                       f32_2 %446 = OpVectorShuffle %445 %445 0 1 
                                       f32_2 %447 = OpFMul %442 %446 
                                       f32_4 %448 = OpLoad %9 
                                       f32_4 %449 = OpVectorShuffle %448 %447 0 1 4 5 
                                                      OpStore %9 %449 
                                       f32_4 %452 = OpLoad %451 
                                                      OpStore %450 %452 
                                       f32_2 %453 = OpLoad %274 
                                       f32_4 %454 = OpLoad vs_TEXCOORD0 
                                       f32_4 %455 = OpVectorShuffle %454 %453 0 1 4 5 
                                                      OpStore vs_TEXCOORD0 %455 
                                Private f32* %456 = OpAccessChain %75 %26 
                                         f32 %457 = OpLoad %456 
                                Private f32* %458 = OpAccessChain %96 %80 
                                                      OpStore %458 %457 
                                       f32_4 %460 = OpLoad %96 
                                                      OpStore vs_TEXCOORD1 %460 
                                  Input f32* %461 = OpAccessChain %11 %54 
                                         f32 %462 = OpLoad %461 
                                         f32 %463 = OpFMul %462 %16 
                                Private f32* %464 = OpAccessChain %9 %26 
                                                      OpStore %464 %463 
                                Private f32* %465 = OpAccessChain %9 %54 
                                                      OpStore %465 %59 
                                       f32_4 %467 = OpLoad %9 
                                                      OpStore vs_TEXCOORD3 %467 
                                       f32_3 %470 = OpLoad %53 
                                                      OpStore vs_TEXCOORD2 %470 
                                 Output f32* %472 = OpAccessChain %325 %280 %54 
                                         f32 %473 = OpLoad %472 
                                         f32 %474 = OpFNegate %473 
                                 Output f32* %475 = OpAccessChain %325 %280 %54 
                                                      OpStore %475 %474 
                                                      OpReturn
                                                      OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 773
; Schema: 0
                                                      OpCapability Shader 
                                               %1 = OpExtInstImport "GLSL.std.450" 
                                                      OpMemoryModel Logical GLSL450 
                                                      OpEntryPoint Fragment %4 "main" %11 %28 %37 %185 %201 %313 %757 
                                                      OpExecutionMode %4 OriginUpperLeft 
                                                      OpName vs_TEXCOORD3 "vs_TEXCOORD3" 
                                                      OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                      OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                      OpName vs_TEXCOORD2 "vs_TEXCOORD2" 
                                                      OpDecorate %11 BuiltIn TessLevelOuter 
                                                      OpDecorate vs_TEXCOORD3 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD3 Flat 
                                                      OpDecorate vs_TEXCOORD3 Location 28 
                                                      OpDecorate %31 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD0 Location 37 
                                                      OpDecorate %41 ArrayStride 41 
                                                      OpMemberDecorate %42 0 Offset 42 
                                                      OpMemberDecorate %42 1 Offset 42 
                                                      OpMemberDecorate %42 2 Offset 42 
                                                      OpMemberDecorate %42 3 Offset 42 
                                                      OpMemberDecorate %42 4 Offset 42 
                                                      OpDecorate %42 Block 
                                                      OpDecorate %44 DescriptorSet 44 
                                                      OpDecorate %44 Binding 44 
                                                      OpDecorate %169 RelaxedPrecision 
                                                      OpDecorate %172 RelaxedPrecision 
                                                      OpDecorate %172 DescriptorSet 172 
                                                      OpDecorate %172 Binding 172 
                                                      OpDecorate %173 RelaxedPrecision 
                                                      OpDecorate %176 RelaxedPrecision 
                                                      OpDecorate %176 DescriptorSet 176 
                                                      OpDecorate %176 Binding 176 
                                                      OpDecorate %177 RelaxedPrecision 
                                                      OpDecorate %180 RelaxedPrecision 
                                                      OpDecorate %181 RelaxedPrecision 
                                                      OpDecorate %182 RelaxedPrecision 
                                                      OpDecorate %183 RelaxedPrecision 
                                                      OpDecorate %184 RelaxedPrecision 
                                                      OpDecorate %185 RelaxedPrecision 
                                                      OpDecorate %185 Location 185 
                                                      OpDecorate %187 RelaxedPrecision 
                                                      OpDecorate %188 RelaxedPrecision 
                                                      OpDecorate %190 RelaxedPrecision 
                                                      OpDecorate %191 RelaxedPrecision 
                                                      OpDecorate %191 DescriptorSet 191 
                                                      OpDecorate %191 Binding 191 
                                                      OpDecorate %192 RelaxedPrecision 
                                                      OpDecorate %193 RelaxedPrecision 
                                                      OpDecorate %193 DescriptorSet 193 
                                                      OpDecorate %193 Binding 193 
                                                      OpDecorate %194 RelaxedPrecision 
                                                      OpDecorate %200 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD1 Flat 
                                                      OpDecorate vs_TEXCOORD1 Location 201 
                                                      OpDecorate %202 RelaxedPrecision 
                                                      OpDecorate %203 RelaxedPrecision 
                                                      OpDecorate %204 RelaxedPrecision 
                                                      OpDecorate %205 RelaxedPrecision 
                                                      OpDecorate %206 RelaxedPrecision 
                                                      OpDecorate %207 RelaxedPrecision 
                                                      OpDecorate %209 RelaxedPrecision 
                                                      OpDecorate %209 DescriptorSet 209 
                                                      OpDecorate %209 Binding 209 
                                                      OpDecorate %210 RelaxedPrecision 
                                                      OpDecorate %211 RelaxedPrecision 
                                                      OpDecorate %211 DescriptorSet 211 
                                                      OpDecorate %211 Binding 211 
                                                      OpDecorate %212 RelaxedPrecision 
                                                      OpDecorate %281 RelaxedPrecision 
                                                      OpDecorate %282 RelaxedPrecision 
                                                      OpDecorate %283 RelaxedPrecision 
                                                      OpDecorate %289 RelaxedPrecision 
                                                      OpDecorate %292 RelaxedPrecision 
                                                      OpDecorate %294 RelaxedPrecision 
                                                      OpDecorate %296 RelaxedPrecision 
                                                      OpDecorate %297 RelaxedPrecision 
                                                      OpDecorate %297 DescriptorSet 297 
                                                      OpDecorate %297 Binding 297 
                                                      OpDecorate %298 RelaxedPrecision 
                                                      OpDecorate %299 RelaxedPrecision 
                                                      OpDecorate %299 DescriptorSet 299 
                                                      OpDecorate %299 Binding 299 
                                                      OpDecorate %300 RelaxedPrecision 
                                                      OpDecorate %305 RelaxedPrecision 
                                                      OpDecorate %306 RelaxedPrecision 
                                                      OpDecorate %307 RelaxedPrecision 
                                                      OpDecorate %308 RelaxedPrecision 
                                                      OpDecorate %309 RelaxedPrecision 
                                                      OpDecorate %310 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 RelaxedPrecision 
                                                      OpDecorate vs_TEXCOORD2 Flat 
                                                      OpDecorate vs_TEXCOORD2 Location 313 
                                                      OpDecorate %314 RelaxedPrecision 
                                                      OpDecorate %315 RelaxedPrecision 
                                                      OpDecorate %317 RelaxedPrecision 
                                                      OpDecorate %345 RelaxedPrecision 
                                                      OpDecorate %346 RelaxedPrecision 
                                                      OpDecorate %359 RelaxedPrecision 
                                                      OpDecorate %360 RelaxedPrecision 
                                                      OpDecorate %360 DescriptorSet 360 
                                                      OpDecorate %360 Binding 360 
                                                      OpDecorate %361 RelaxedPrecision 
                                                      OpDecorate %362 RelaxedPrecision 
                                                      OpDecorate %362 DescriptorSet 362 
                                                      OpDecorate %362 Binding 362 
                                                      OpDecorate %363 RelaxedPrecision 
                                                      OpDecorate %369 RelaxedPrecision 
                                                      OpDecorate %372 RelaxedPrecision 
                                                      OpDecorate %373 RelaxedPrecision 
                                                      OpDecorate %376 RelaxedPrecision 
                                                      OpDecorate %524 RelaxedPrecision 
                                                      OpDecorate %526 RelaxedPrecision 
                                                      OpDecorate %528 RelaxedPrecision 
                                                      OpDecorate %533 RelaxedPrecision 
                                                      OpDecorate %682 RelaxedPrecision 
                                                      OpDecorate %683 RelaxedPrecision 
                                                      OpDecorate %687 RelaxedPrecision 
                                                      OpDecorate %688 RelaxedPrecision 
                                                      OpDecorate %690 RelaxedPrecision 
                                                      OpDecorate %691 RelaxedPrecision 
                                                      OpDecorate %692 RelaxedPrecision 
                                                      OpDecorate %695 RelaxedPrecision 
                                                      OpDecorate %698 RelaxedPrecision 
                                                      OpDecorate %700 RelaxedPrecision 
                                                      OpDecorate %705 RelaxedPrecision 
                                                      OpDecorate %706 RelaxedPrecision 
                                                      OpDecorate %710 RelaxedPrecision 
                                                      OpDecorate %711 RelaxedPrecision 
                                                      OpDecorate %712 RelaxedPrecision 
                                                      OpDecorate %713 RelaxedPrecision 
                                                      OpDecorate %714 RelaxedPrecision 
                                                      OpDecorate %715 RelaxedPrecision 
                                                      OpDecorate %722 RelaxedPrecision 
                                                      OpDecorate %730 RelaxedPrecision 
                                                      OpDecorate %731 RelaxedPrecision 
                                                      OpDecorate %735 RelaxedPrecision 
                                                      OpDecorate %736 RelaxedPrecision 
                                                      OpDecorate %737 RelaxedPrecision 
                                                      OpDecorate %738 RelaxedPrecision 
                                                      OpDecorate %741 RelaxedPrecision 
                                                      OpDecorate %742 RelaxedPrecision 
                                                      OpDecorate %743 RelaxedPrecision 
                                                      OpDecorate %747 RelaxedPrecision 
                                                      OpDecorate %748 RelaxedPrecision 
                                                      OpDecorate %749 RelaxedPrecision 
                                                      OpDecorate %750 RelaxedPrecision 
                                                      OpDecorate %757 RelaxedPrecision 
                                                      OpDecorate %757 Location 757 
                                                      OpDecorate %758 RelaxedPrecision 
                                                      OpDecorate %759 RelaxedPrecision 
                                                      OpDecorate %760 RelaxedPrecision 
                                                      OpDecorate %761 RelaxedPrecision 
                                                      OpDecorate %762 RelaxedPrecision 
                                                      OpDecorate %768 RelaxedPrecision 
                                               %2 = OpTypeVoid 
                                               %3 = OpTypeFunction %2 
                                               %6 = OpTypeFloat 32 
                                               %7 = OpTypeVector %6 4 
                                               %8 = OpTypePointer Function %7 
                                              %10 = OpTypePointer Input %7 
                                 Input f32_4* %11 = OpVariable Input 
                                              %12 = OpTypeVector %6 3 
                                          f32 %15 = OpConstant 3.674022E-40 
                                              %16 = OpTypeInt 32 0 
                                          u32 %17 = OpConstant 3 
                                              %18 = OpTypePointer Input %6 
                                              %26 = OpTypePointer Private %16 
                                 Private u32* %27 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD3 = OpVariable Input 
                                          u32 %29 = OpConstant 0 
                                              %33 = OpTypeBool 
                                              %34 = OpTypeVector %33 4 
                                              %35 = OpTypePointer Private %34 
                              Private bool_4* %36 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          u32 %40 = OpConstant 20 
                                              %41 = OpTypeArray %7 %40 
                                              %42 = OpTypeStruct %7 %7 %7 %7 %41 
                                              %43 = OpTypePointer Uniform %42 
Uniform struct {f32_4; f32_4; f32_4; f32_4; f32_4[20];}* %44 = OpVariable Uniform 
                                              %45 = OpTypeInt 32 1 
                                          i32 %46 = OpConstant 4 
                                              %49 = OpTypePointer Uniform %7 
                                              %54 = OpTypeVector %33 2 
                                              %69 = OpTypePointer Private %7 
                               Private f32_4* %70 = OpVariable Private 
                                              %71 = OpTypePointer Private %33 
                                          f32 %74 = OpConstant 3.674022E-40 
                                              %76 = OpTypePointer Private %6 
                                          u32 %78 = OpConstant 1 
                                          u32 %83 = OpConstant 2 
                                              %92 = OpTypeVector %6 2 
                                             %100 = OpTypePointer Private %54 
                             Private bool_2* %101 = OpVariable Private 
                                         i32 %104 = OpConstant 3 
                                             %110 = OpTypePointer Private %92 
                              Private f32_2* %111 = OpVariable Private 
                                         f32 %150 = OpConstant 3.674022E-40 
                                       f32_3 %151 = OpConstantComposite %15 %15 %150 
                                         i32 %160 = OpConstant 0 
                                         i32 %161 = OpConstant 1 
                                         i32 %163 = OpConstant -1 
                                Private f32* %169 = OpVariable Private 
                                             %170 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                             %171 = OpTypePointer UniformConstant %170 
        UniformConstant read_only Texture2D* %172 = OpVariable UniformConstant 
                                             %174 = OpTypeSampler 
                                             %175 = OpTypePointer UniformConstant %174 
                    UniformConstant sampler* %176 = OpVariable UniformConstant 
                                             %178 = OpTypeSampledImage %170 
                                Input f32_4* %185 = OpVariable Input 
                              Private f32_4* %190 = OpVariable Private 
        UniformConstant read_only Texture2D* %191 = OpVariable UniformConstant 
                    UniformConstant sampler* %193 = OpVariable UniformConstant 
                              Private f32_4* %199 = OpVariable Private 
                        Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                              Private f32_2* %208 = OpVariable Private 
        UniformConstant read_only Texture2D* %209 = OpVariable UniformConstant 
                    UniformConstant sampler* %211 = OpVariable UniformConstant 
                                Private f32* %223 = OpVariable Private 
                                         f32 %237 = OpConstant 3.674022E-40 
                                         f32 %264 = OpConstant 3.674022E-40 
                                         f32 %266 = OpConstant 3.674022E-40 
                              Private f32_4* %281 = OpVariable Private 
                              Private f32_4* %292 = OpVariable Private 
                              Private f32_4* %296 = OpVariable Private 
        UniformConstant read_only Texture2D* %297 = OpVariable UniformConstant 
                    UniformConstant sampler* %299 = OpVariable UniformConstant 
                             Private bool_2* %311 = OpVariable Private 
                                             %312 = OpTypePointer Input %12 
                        Input f32_3* vs_TEXCOORD2 = OpVariable Input 
                                       f32_4 %316 = OpConstantComposite %15 %15 %74 %74 
                                             %331 = OpTypePointer Function %92 
                              Private f32_4* %343 = OpVariable Private 
                              Private f32_2* %349 = OpVariable Private 
                              Private f32_2* %351 = OpVariable Private 
                                         i32 %354 = OpConstant 2 
                              Private f32_4* %359 = OpVariable Private 
        UniformConstant read_only Texture2D* %360 = OpVariable UniformConstant 
                    UniformConstant sampler* %362 = OpVariable UniformConstant 
                               Private bool* %367 = OpVariable Private 
                              Private f32_2* %371 = OpVariable Private 
                                         f32 %374 = OpConstant 3.674022E-40 
                                       f32_2 %375 = OpConstantComposite %374 %374 
                                             %380 = OpTypePointer Private %12 
                              Private f32_3* %381 = OpVariable Private 
                                         f32 %389 = OpConstant 3.674022E-40 
                                       f32_2 %390 = OpConstantComposite %389 %389 
                                Private f32* %397 = OpVariable Private 
                              Private f32_3* %405 = OpVariable Private 
                                Private f32* %439 = OpVariable Private 
                               Private bool* %454 = OpVariable Private 
                                             %463 = OpTypePointer Function %6 
                               Private bool* %478 = OpVariable Private 
                                         f32 %479 = OpConstant 3.674022E-40 
                               Private bool* %484 = OpVariable Private 
                              Private f32_2* %501 = OpVariable Private 
                              Private f32_2* %524 = OpVariable Private 
                                         f32 %527 = OpConstant 3.674022E-40 
                                             %530 = OpTypePointer Private %45 
                                Private i32* %531 = OpVariable Private 
                               Private bool* %535 = OpVariable Private 
                             Private bool_2* %568 = OpVariable Private 
                                             %570 = OpTypeVector %45 4 
                                       i32_4 %572 = OpConstantComposite %161 %354 %160 %160 
                               Private bool* %592 = OpVariable Private 
                                Private f32* %629 = OpVariable Private 
                                             %670 = OpTypePointer Uniform %6 
                                       f32_2 %689 = OpConstantComposite %527 %527 
                                         f32 %693 = OpConstant 3.674022E-40 
                                       f32_2 %694 = OpConstantComposite %693 %693 
                                       f32_2 %699 = OpConstantComposite %237 %237 
                              Private f32_4* %741 = OpVariable Private 
                                             %756 = OpTypePointer Output %7 
                               Output f32_4* %757 = OpVariable Output 
                                             %770 = OpTypePointer Output %6 
                                          void %4 = OpFunction None %3 
                                               %5 = OpLabel 
                               Function f32_4* %9 = OpVariable Function 
                             Function f32_2* %332 = OpVariable Function 
                               Function f32* %464 = OpVariable Function 
                               Function f32* %494 = OpVariable Function 
                               Function f32* %503 = OpVariable Function 
                             Function f32_2* %514 = OpVariable Function 
                               Function f32* %547 = OpVariable Function 
                               Function f32* %558 = OpVariable Function 
                               Function f32* %581 = OpVariable Function 
                               Function f32* %605 = OpVariable Function 
                               Function f32* %635 = OpVariable Function 
                               Function f32* %650 = OpVariable Function 
                               Function f32* %661 = OpVariable Function 
                                        f32_4 %13 = OpLoad %11 
                                        f32_3 %14 = OpVectorShuffle %13 %13 0 1 2 
                                   Input f32* %19 = OpAccessChain %11 %17 
                                          f32 %20 = OpLoad %19 
                                          f32 %21 = OpFDiv %15 %20 
                                          f32 %22 = OpCompositeExtract %14 0 
                                          f32 %23 = OpCompositeExtract %14 1 
                                          f32 %24 = OpCompositeExtract %14 2 
                                        f32_4 %25 = OpCompositeConstruct %22 %23 %24 %21 
                                                      OpStore %9 %25 
                                   Input f32* %30 = OpAccessChain vs_TEXCOORD3 %29 
                                          f32 %31 = OpLoad %30 
                                          u32 %32 = OpConvertFToU %31 
                                                      OpStore %27 %32 
                                        f32_4 %38 = OpLoad vs_TEXCOORD0 
                                        f32_4 %39 = OpVectorShuffle %38 %38 2 2 3 2 
                                          u32 %47 = OpLoad %27 
                                          i32 %48 = OpBitcast %47 
                               Uniform f32_4* %50 = OpAccessChain %44 %46 %48 
                                        f32_4 %51 = OpLoad %50 
                                        f32_4 %52 = OpVectorShuffle %51 %51 0 0 1 0 
                                       bool_4 %53 = OpFOrdGreaterThanEqual %39 %52 
                                       bool_2 %55 = OpVectorShuffle %53 %53 1 2 
                                       bool_4 %56 = OpLoad %36 
                                       bool_4 %57 = OpVectorShuffle %56 %55 0 4 5 3 
                                                      OpStore %36 %57 
                                          u32 %58 = OpLoad %27 
                                          i32 %59 = OpBitcast %58 
                               Uniform f32_4* %60 = OpAccessChain %44 %46 %59 
                                        f32_4 %61 = OpLoad %60 
                                        f32_4 %62 = OpVectorShuffle %61 %61 2 2 2 3 
                                        f32_4 %63 = OpLoad vs_TEXCOORD0 
                                        f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 3 
                                       bool_4 %65 = OpFOrdGreaterThanEqual %62 %64 
                                       bool_2 %66 = OpVectorShuffle %65 %65 0 3 
                                       bool_4 %67 = OpLoad %36 
                                       bool_4 %68 = OpVectorShuffle %67 %66 4 1 2 5 
                                                      OpStore %36 %68 
                                Private bool* %72 = OpAccessChain %36 %29 
                                         bool %73 = OpLoad %72 
                                          f32 %75 = OpSelect %73 %15 %74 
                                 Private f32* %77 = OpAccessChain %70 %29 
                                                      OpStore %77 %75 
                                Private bool* %79 = OpAccessChain %36 %78 
                                         bool %80 = OpLoad %79 
                                          f32 %81 = OpSelect %80 %15 %74 
                                 Private f32* %82 = OpAccessChain %70 %78 
                                                      OpStore %82 %81 
                                Private bool* %84 = OpAccessChain %36 %83 
                                         bool %85 = OpLoad %84 
                                          f32 %86 = OpSelect %85 %15 %74 
                                 Private f32* %87 = OpAccessChain %70 %83 
                                                      OpStore %87 %86 
                                Private bool* %88 = OpAccessChain %36 %17 
                                         bool %89 = OpLoad %88 
                                          f32 %90 = OpSelect %89 %15 %74 
                                 Private f32* %91 = OpAccessChain %70 %17 
                                                      OpStore %91 %90 
                                        f32_4 %93 = OpLoad %70 
                                        f32_2 %94 = OpVectorShuffle %93 %93 0 3 
                                        f32_4 %95 = OpLoad %70 
                                        f32_2 %96 = OpVectorShuffle %95 %95 1 2 
                                        f32_2 %97 = OpFAdd %94 %96 
                                        f32_4 %98 = OpLoad %70 
                                        f32_4 %99 = OpVectorShuffle %98 %97 4 5 2 3 
                                                      OpStore %70 %99 
                                       f32_4 %102 = OpLoad %9 
                                       f32_4 %103 = OpVectorShuffle %102 %102 0 1 0 1 
                              Uniform f32_4* %105 = OpAccessChain %44 %104 
                                       f32_4 %106 = OpLoad %105 
                                       f32_4 %107 = OpVectorShuffle %106 %106 0 1 0 1 
                                      bool_4 %108 = OpFOrdGreaterThanEqual %103 %107 
                                      bool_2 %109 = OpVectorShuffle %108 %108 0 1 
                                                      OpStore %101 %109 
                               Private bool* %112 = OpAccessChain %101 %29 
                                        bool %113 = OpLoad %112 
                                         f32 %114 = OpSelect %113 %15 %74 
                                Private f32* %115 = OpAccessChain %111 %29 
                                                      OpStore %115 %114 
                               Private bool* %116 = OpAccessChain %101 %78 
                                        bool %117 = OpLoad %116 
                                         f32 %118 = OpSelect %117 %15 %74 
                                Private f32* %119 = OpAccessChain %111 %78 
                                                      OpStore %119 %118 
                                       f32_2 %120 = OpLoad %111 
                                       f32_4 %121 = OpLoad %70 
                                       f32_2 %122 = OpVectorShuffle %121 %121 0 1 
                                       f32_2 %123 = OpFAdd %120 %122 
                                       f32_4 %124 = OpLoad %70 
                                       f32_4 %125 = OpVectorShuffle %124 %123 4 5 2 3 
                                                      OpStore %70 %125 
                              Uniform f32_4* %126 = OpAccessChain %44 %104 
                                       f32_4 %127 = OpLoad %126 
                                       f32_4 %128 = OpVectorShuffle %127 %127 2 3 2 3 
                                       f32_4 %129 = OpLoad %9 
                                       f32_4 %130 = OpVectorShuffle %129 %129 0 1 0 1 
                                      bool_4 %131 = OpFOrdGreaterThanEqual %128 %130 
                                      bool_2 %132 = OpVectorShuffle %131 %131 0 1 
                                                      OpStore %101 %132 
                               Private bool* %133 = OpAccessChain %101 %29 
                                        bool %134 = OpLoad %133 
                                         f32 %135 = OpSelect %134 %15 %74 
                                Private f32* %136 = OpAccessChain %111 %29 
                                                      OpStore %136 %135 
                               Private bool* %137 = OpAccessChain %101 %78 
                                        bool %138 = OpLoad %137 
                                         f32 %139 = OpSelect %138 %15 %74 
                                Private f32* %140 = OpAccessChain %111 %78 
                                                      OpStore %140 %139 
                                       f32_2 %141 = OpLoad %111 
                                       f32_4 %142 = OpLoad %70 
                                       f32_2 %143 = OpVectorShuffle %142 %142 0 1 
                                       f32_2 %144 = OpFAdd %141 %143 
                                       f32_4 %145 = OpLoad %70 
                                       f32_4 %146 = OpVectorShuffle %145 %144 4 5 2 3 
                                                      OpStore %70 %146 
                                Private f32* %147 = OpAccessChain %70 %83 
                                                      OpStore %147 %15 
                                       f32_4 %148 = OpLoad %70 
                                       f32_3 %149 = OpVectorShuffle %148 %148 0 1 2 
                                         f32 %152 = OpDot %149 %151 
                                Private f32* %153 = OpAccessChain %70 %29 
                                                      OpStore %153 %152 
                                Private f32* %154 = OpAccessChain %70 %29 
                                         f32 %155 = OpLoad %154 
                                        bool %156 = OpFOrdLessThan %155 %74 
                               Private bool* %157 = OpAccessChain %36 %29 
                                                      OpStore %157 %156 
                               Private bool* %158 = OpAccessChain %36 %29 
                                        bool %159 = OpLoad %158 
                                         i32 %162 = OpSelect %159 %161 %160 
                                         i32 %164 = OpIMul %162 %163 
                                        bool %165 = OpINotEqual %164 %160 
                                                      OpSelectionMerge %167 None 
                                                      OpBranchConditional %165 %166 %167 
                                             %166 = OpLabel 
                                                      OpKill
                                             %167 = OpLabel 
                         read_only Texture2D %173 = OpLoad %172 
                                     sampler %177 = OpLoad %176 
                  read_only Texture2DSampled %179 = OpSampledImage %173 %177 
                                       f32_4 %180 = OpLoad vs_TEXCOORD3 
                                       f32_2 %181 = OpVectorShuffle %180 %180 2 3 
                                       f32_4 %182 = OpImageSampleImplicitLod %179 %181 
                                         f32 %183 = OpCompositeExtract %182 3 
                                                      OpStore %169 %183 
                                         f32 %184 = OpLoad %169 
                                  Input f32* %186 = OpAccessChain %185 %17 
                                         f32 %187 = OpLoad %186 
                                         f32 %188 = OpFMul %184 %187 
                                Private f32* %189 = OpAccessChain %70 %29 
                                                      OpStore %189 %188 
                         read_only Texture2D %192 = OpLoad %191 
                                     sampler %194 = OpLoad %193 
                  read_only Texture2DSampled %195 = OpSampledImage %192 %194 
                                       f32_4 %196 = OpLoad vs_TEXCOORD0 
                                       f32_2 %197 = OpVectorShuffle %196 %196 0 1 
                                       f32_4 %198 = OpImageSampleImplicitLod %195 %197 
                                                      OpStore %190 %198 
                                       f32_4 %200 = OpLoad %190 
                                       f32_4 %202 = OpLoad vs_TEXCOORD1 
                                       f32_4 %203 = OpVectorShuffle %202 %202 1 1 1 1 
                                       f32_4 %204 = OpFMul %200 %203 
                                       f32_4 %205 = OpLoad vs_TEXCOORD1 
                                       f32_4 %206 = OpVectorShuffle %205 %205 3 3 3 3 
                                       f32_4 %207 = OpFAdd %204 %206 
                                                      OpStore %199 %207 
                         read_only Texture2D %210 = OpLoad %209 
                                     sampler %212 = OpLoad %211 
                  read_only Texture2DSampled %213 = OpSampledImage %210 %212 
                                       f32_4 %214 = OpLoad vs_TEXCOORD0 
                                       f32_2 %215 = OpVectorShuffle %214 %214 0 1 
                                       f32_4 %216 = OpImageSampleImplicitLod %213 %215 
                                         f32 %217 = OpCompositeExtract %216 3 
                                Private f32* %218 = OpAccessChain %208 %29 
                                                      OpStore %218 %217 
                                Private f32* %219 = OpAccessChain %208 %29 
                                         f32 %220 = OpLoad %219 
                                         f32 %221 = OpDPdx %220 
                                Private f32* %222 = OpAccessChain %111 %29 
                                                      OpStore %222 %221 
                                Private f32* %224 = OpAccessChain %208 %29 
                                         f32 %225 = OpLoad %224 
                                         f32 %226 = OpDPdy %225 
                                                      OpStore %223 %226 
                                         f32 %227 = OpLoad %223 
                                         f32 %228 = OpExtInst %1 4 %227 
                                Private f32* %229 = OpAccessChain %111 %29 
                                         f32 %230 = OpLoad %229 
                                         f32 %231 = OpExtInst %1 4 %230 
                                         f32 %232 = OpFAdd %228 %231 
                                Private f32* %233 = OpAccessChain %111 %29 
                                                      OpStore %233 %232 
                                Private f32* %234 = OpAccessChain %111 %29 
                                         f32 %235 = OpLoad %234 
                                         f32 %236 = OpFNegate %235 
                                         f32 %238 = OpFAdd %236 %237 
                                                      OpStore %223 %238 
                                Private f32* %239 = OpAccessChain %111 %29 
                                         f32 %240 = OpLoad %239 
                                         f32 %241 = OpFAdd %240 %237 
                                Private f32* %242 = OpAccessChain %208 %78 
                                                      OpStore %242 %241 
                                         f32 %243 = OpLoad %223 
                                       f32_2 %244 = OpCompositeConstruct %243 %243 
                                       f32_2 %245 = OpFNegate %244 
                                       f32_2 %246 = OpLoad %208 
                                       f32_2 %247 = OpFAdd %245 %246 
                                                      OpStore %208 %247 
                                Private f32* %248 = OpAccessChain %208 %78 
                                         f32 %249 = OpLoad %248 
                                         f32 %250 = OpFDiv %15 %249 
                                Private f32* %251 = OpAccessChain %111 %29 
                                                      OpStore %251 %250 
                                Private f32* %252 = OpAccessChain %111 %29 
                                         f32 %253 = OpLoad %252 
                                Private f32* %254 = OpAccessChain %208 %29 
                                         f32 %255 = OpLoad %254 
                                         f32 %256 = OpFMul %253 %255 
                                Private f32* %257 = OpAccessChain %208 %29 
                                                      OpStore %257 %256 
                                Private f32* %258 = OpAccessChain %208 %29 
                                         f32 %259 = OpLoad %258 
                                         f32 %260 = OpExtInst %1 43 %259 %74 %15 
                                Private f32* %261 = OpAccessChain %208 %29 
                                                      OpStore %261 %260 
                                Private f32* %262 = OpAccessChain %208 %29 
                                         f32 %263 = OpLoad %262 
                                         f32 %265 = OpFMul %263 %264 
                                         f32 %267 = OpFAdd %265 %266 
                                Private f32* %268 = OpAccessChain %111 %29 
                                                      OpStore %268 %267 
                                Private f32* %269 = OpAccessChain %208 %29 
                                         f32 %270 = OpLoad %269 
                                Private f32* %271 = OpAccessChain %208 %29 
                                         f32 %272 = OpLoad %271 
                                         f32 %273 = OpFMul %270 %272 
                                Private f32* %274 = OpAccessChain %208 %29 
                                                      OpStore %274 %273 
                                Private f32* %275 = OpAccessChain %208 %29 
                                         f32 %276 = OpLoad %275 
                                Private f32* %277 = OpAccessChain %111 %29 
                                         f32 %278 = OpLoad %277 
                                         f32 %279 = OpFMul %276 %278 
                                Private f32* %280 = OpAccessChain %208 %29 
                                                      OpStore %280 %279 
                                       f32_4 %282 = OpLoad vs_TEXCOORD1 
                                       f32_3 %283 = OpVectorShuffle %282 %282 0 0 0 
                                       f32_4 %284 = OpLoad %281 
                                       f32_4 %285 = OpVectorShuffle %284 %283 4 5 6 3 
                                                      OpStore %281 %285 
                                Private f32* %286 = OpAccessChain %208 %29 
                                         f32 %287 = OpLoad %286 
                                  Input f32* %288 = OpAccessChain vs_TEXCOORD1 %29 
                                         f32 %289 = OpLoad %288 
                                         f32 %290 = OpFMul %287 %289 
                                Private f32* %291 = OpAccessChain %281 %17 
                                                      OpStore %291 %290 
                                       f32_4 %293 = OpLoad %199 
                                       f32_4 %294 = OpLoad %281 
                                       f32_4 %295 = OpFAdd %293 %294 
                                                      OpStore %292 %295 
                         read_only Texture2D %298 = OpLoad %297 
                                     sampler %300 = OpLoad %299 
                  read_only Texture2DSampled %301 = OpSampledImage %298 %300 
                                       f32_4 %302 = OpLoad vs_TEXCOORD0 
                                       f32_2 %303 = OpVectorShuffle %302 %302 0 1 
                                       f32_4 %304 = OpImageSampleImplicitLod %301 %303 
                                                      OpStore %296 %304 
                                       f32_4 %305 = OpLoad %296 
                                       f32_4 %306 = OpLoad vs_TEXCOORD1 
                                       f32_4 %307 = OpVectorShuffle %306 %306 2 2 2 2 
                                       f32_4 %308 = OpFMul %305 %307 
                                       f32_4 %309 = OpLoad %292 
                                       f32_4 %310 = OpFAdd %308 %309 
                                                      OpStore %199 %310 
                                       f32_3 %314 = OpLoad vs_TEXCOORD2 
                                       f32_4 %315 = OpVectorShuffle %314 %314 0 1 0 0 
                                      bool_4 %317 = OpFOrdEqual %315 %316 
                                      bool_2 %318 = OpVectorShuffle %317 %317 0 1 
                                                      OpStore %311 %318 
                               Private bool* %319 = OpAccessChain %311 %78 
                                        bool %320 = OpLoad %319 
                               Private bool* %321 = OpAccessChain %311 %29 
                                        bool %322 = OpLoad %321 
                                        bool %323 = OpLogicalOr %320 %322 
                               Private bool* %324 = OpAccessChain %311 %29 
                                                      OpStore %324 %323 
                               Private bool* %325 = OpAccessChain %311 %29 
                                        bool %326 = OpLoad %325 
                                                      OpSelectionMerge %328 None 
                                                      OpBranchConditional %326 %327 %754 
                                             %327 = OpLabel 
                               Private bool* %329 = OpAccessChain %311 %78 
                                        bool %330 = OpLoad %329 
                                                      OpSelectionMerge %334 None 
                                                      OpBranchConditional %330 %333 %338 
                                             %333 = OpLabel 
                              Uniform f32_4* %335 = OpAccessChain %44 %161 
                                       f32_4 %336 = OpLoad %335 
                                       f32_2 %337 = OpVectorShuffle %336 %336 0 1 
                                                      OpStore %332 %337 
                                                      OpBranch %334 
                                             %338 = OpLabel 
                              Uniform f32_4* %339 = OpAccessChain %44 %160 
                                       f32_4 %340 = OpLoad %339 
                                       f32_2 %341 = OpVectorShuffle %340 %340 0 1 
                                                      OpStore %332 %341 
                                                      OpBranch %334 
                                             %334 = OpLabel 
                                       f32_2 %342 = OpLoad %332 
                                                      OpStore %208 %342 
                                  Input f32* %344 = OpAccessChain vs_TEXCOORD2 %83 
                                         f32 %345 = OpLoad %344 
                                         f32 %346 = OpFAdd %345 %237 
                                Private f32* %347 = OpAccessChain %343 %78 
                                                      OpStore %347 %346 
                                Private f32* %348 = OpAccessChain %343 %29 
                                                      OpStore %348 %237 
                                Private f32* %350 = OpAccessChain %349 %78 
                                                      OpStore %350 %74 
                                       f32_4 %352 = OpLoad %343 
                                       f32_2 %353 = OpVectorShuffle %352 %352 0 1 
                              Uniform f32_4* %355 = OpAccessChain %44 %354 
                                       f32_4 %356 = OpLoad %355 
                                       f32_2 %357 = OpVectorShuffle %356 %356 0 1 
                                       f32_2 %358 = OpFMul %353 %357 
                                                      OpStore %351 %358 
                         read_only Texture2D %361 = OpLoad %360 
                                     sampler %363 = OpLoad %362 
                  read_only Texture2DSampled %364 = OpSampledImage %361 %363 
                                       f32_2 %365 = OpLoad %351 
                                       f32_4 %366 = OpImageSampleImplicitLod %364 %365 
                                                      OpStore %359 %366 
                                Private f32* %368 = OpAccessChain %359 %29 
                                         f32 %369 = OpLoad %368 
                                        bool %370 = OpFOrdLessThan %74 %369 
                                                      OpStore %367 %370 
                                       f32_4 %372 = OpLoad %359 
                                       f32_2 %373 = OpVectorShuffle %372 %372 2 3 
                                       f32_2 %376 = OpFAdd %373 %375 
                                                      OpStore %371 %376 
                                       f32_2 %377 = OpLoad %371 
                                       f32_2 %378 = OpLoad %371 
                                       f32_2 %379 = OpFAdd %377 %378 
                                                      OpStore %371 %379 
                                       f32_4 %382 = OpLoad vs_TEXCOORD0 
                                       f32_2 %383 = OpVectorShuffle %382 %382 0 1 
                                       f32_2 %384 = OpFAdd %383 %375 
                                       f32_3 %385 = OpLoad %381 
                                       f32_3 %386 = OpVectorShuffle %385 %384 3 1 4 
                                                      OpStore %381 %386 
                                       f32_3 %387 = OpLoad %381 
                                       f32_2 %388 = OpVectorShuffle %387 %387 0 2 
                                       f32_2 %391 = OpFMul %388 %390 
                                       f32_2 %392 = OpLoad %371 
                                       f32_2 %393 = OpFNegate %392 
                                       f32_2 %394 = OpFAdd %391 %393 
                                       f32_3 %395 = OpLoad %381 
                                       f32_3 %396 = OpVectorShuffle %395 %394 3 1 4 
                                                      OpStore %381 %396 
                                       f32_3 %398 = OpLoad %381 
                                       f32_2 %399 = OpVectorShuffle %398 %398 0 2 
                                       f32_3 %400 = OpLoad %381 
                                       f32_2 %401 = OpVectorShuffle %400 %400 0 2 
                                         f32 %402 = OpDot %399 %401 
                                                      OpStore %397 %402 
                                         f32 %403 = OpLoad %397 
                                         f32 %404 = OpExtInst %1 32 %403 
                                                      OpStore %397 %404 
                                         f32 %406 = OpLoad %397 
                                       f32_2 %407 = OpCompositeConstruct %406 %406 
                                       f32_3 %408 = OpLoad %381 
                                       f32_2 %409 = OpVectorShuffle %408 %408 0 2 
                                       f32_2 %410 = OpFMul %407 %409 
                                       f32_3 %411 = OpLoad %405 
                                       f32_3 %412 = OpVectorShuffle %411 %410 3 4 2 
                                                      OpStore %405 %412 
                                       f32_2 %413 = OpLoad %371 
                                       f32_2 %414 = OpFNegate %413 
                                       f32_3 %415 = OpLoad %405 
                                       f32_2 %416 = OpVectorShuffle %415 %415 0 1 
                                         f32 %417 = OpDot %414 %416 
                                                      OpStore %397 %417 
                                       f32_2 %418 = OpLoad %371 
                                       f32_2 %419 = OpLoad %371 
                                         f32 %420 = OpDot %418 %419 
                                Private f32* %421 = OpAccessChain %371 %29 
                                                      OpStore %421 %420 
                                         f32 %422 = OpLoad %397 
                                         f32 %423 = OpFNegate %422 
                                         f32 %424 = OpLoad %397 
                                         f32 %425 = OpFMul %423 %424 
                                Private f32* %426 = OpAccessChain %371 %29 
                                         f32 %427 = OpLoad %426 
                                         f32 %428 = OpFAdd %425 %427 
                                Private f32* %429 = OpAccessChain %371 %29 
                                                      OpStore %429 %428 
                                Private f32* %430 = OpAccessChain %371 %29 
                                         f32 %431 = OpLoad %430 
                                         f32 %432 = OpFNegate %431 
                                         f32 %433 = OpFAdd %432 %15 
                                Private f32* %434 = OpAccessChain %371 %29 
                                                      OpStore %434 %433 
                                Private f32* %435 = OpAccessChain %371 %29 
                                         f32 %436 = OpLoad %435 
                                         f32 %437 = OpExtInst %1 31 %436 
                                Private f32* %438 = OpAccessChain %371 %29 
                                                      OpStore %438 %437 
                                Private f32* %440 = OpAccessChain %371 %29 
                                         f32 %441 = OpLoad %440 
                                         f32 %442 = OpFNegate %441 
                                         f32 %443 = OpLoad %397 
                                         f32 %444 = OpFAdd %442 %443 
                                                      OpStore %439 %444 
                                Private f32* %445 = OpAccessChain %371 %29 
                                         f32 %446 = OpLoad %445 
                                         f32 %447 = OpLoad %397 
                                         f32 %448 = OpFAdd %446 %447 
                                Private f32* %449 = OpAccessChain %371 %29 
                                                      OpStore %449 %448 
                                Private f32* %450 = OpAccessChain %371 %29 
                                         f32 %451 = OpLoad %450 
                                         f32 %452 = OpLoad %439 
                                         f32 %453 = OpExtInst %1 37 %451 %452 
                                                      OpStore %397 %453 
                                         f32 %455 = OpLoad %397 
                                        bool %456 = OpFOrdLessThan %455 %74 
                                                      OpStore %454 %456 
                                Private f32* %457 = OpAccessChain %371 %29 
                                         f32 %458 = OpLoad %457 
                                         f32 %459 = OpLoad %439 
                                         f32 %460 = OpExtInst %1 40 %458 %459 
                                Private f32* %461 = OpAccessChain %371 %29 
                                                      OpStore %461 %460 
                                        bool %462 = OpLoad %454 
                                                      OpSelectionMerge %466 None 
                                                      OpBranchConditional %462 %465 %469 
                                             %465 = OpLabel 
                                Private f32* %467 = OpAccessChain %371 %29 
                                         f32 %468 = OpLoad %467 
                                                      OpStore %464 %468 
                                                      OpBranch %466 
                                             %469 = OpLabel 
                                         f32 %470 = OpLoad %397 
                                                      OpStore %464 %470 
                                                      OpBranch %466 
                                             %466 = OpLabel 
                                         f32 %471 = OpLoad %464 
                                Private f32* %472 = OpAccessChain %371 %29 
                                                      OpStore %472 %471 
                                       f32_2 %473 = OpLoad %371 
                                       f32_2 %474 = OpVectorShuffle %473 %473 0 0 
                                       f32_3 %475 = OpLoad %405 
                                       f32_2 %476 = OpVectorShuffle %475 %475 0 1 
                                       f32_2 %477 = OpFMul %474 %476 
                                                      OpStore %371 %477 
                                Private f32* %480 = OpAccessChain %371 %29 
                                         f32 %481 = OpLoad %480 
                                         f32 %482 = OpExtInst %1 4 %481 
                                        bool %483 = OpFOrdGreaterThanEqual %479 %482 
                                                      OpStore %478 %483 
                                Private f32* %485 = OpAccessChain %371 %78 
                                         f32 %486 = OpLoad %485 
                                         f32 %487 = OpExtInst %1 4 %486 
                                        bool %488 = OpFOrdLessThan %479 %487 
                                                      OpStore %484 %488 
                                       f32_3 %489 = OpLoad %381 
                                       f32_2 %490 = OpVectorShuffle %489 %489 0 2 
                                       f32_2 %491 = OpLoad %371 
                                       f32_2 %492 = OpFDiv %490 %491 
                                                      OpStore %371 %492 
                                        bool %493 = OpLoad %484 
                                                      OpSelectionMerge %496 None 
                                                      OpBranchConditional %493 %495 %499 
                                             %495 = OpLabel 
                                Private f32* %497 = OpAccessChain %371 %78 
                                         f32 %498 = OpLoad %497 
                                                      OpStore %494 %498 
                                                      OpBranch %496 
                                             %499 = OpLabel 
                                                      OpStore %494 %74 
                                                      OpBranch %496 
                                             %496 = OpLabel 
                                         f32 %500 = OpLoad %494 
                                                      OpStore %439 %500 
                                        bool %502 = OpLoad %478 
                                                      OpSelectionMerge %505 None 
                                                      OpBranchConditional %502 %504 %507 
                                             %504 = OpLabel 
                                         f32 %506 = OpLoad %439 
                                                      OpStore %503 %506 
                                                      OpBranch %505 
                                             %507 = OpLabel 
                                Private f32* %508 = OpAccessChain %371 %29 
                                         f32 %509 = OpLoad %508 
                                                      OpStore %503 %509 
                                                      OpBranch %505 
                                             %505 = OpLabel 
                                         f32 %510 = OpLoad %503 
                                Private f32* %511 = OpAccessChain %501 %29 
                                                      OpStore %511 %510 
                                Private f32* %512 = OpAccessChain %501 %78 
                                                      OpStore %512 %74 
                                        bool %513 = OpLoad %367 
                                                      OpSelectionMerge %516 None 
                                                      OpBranchConditional %513 %515 %518 
                                             %515 = OpLabel 
                                       f32_2 %517 = OpLoad %501 
                                                      OpStore %514 %517 
                                                      OpBranch %516 
                                             %518 = OpLabel 
                                       f32_4 %519 = OpLoad vs_TEXCOORD0 
                                       f32_2 %520 = OpVectorShuffle %519 %519 0 1 
                                                      OpStore %514 %520 
                                                      OpBranch %516 
                                             %516 = OpLabel 
                                       f32_2 %521 = OpLoad %514 
                                       f32_3 %522 = OpLoad %405 
                                       f32_3 %523 = OpVectorShuffle %522 %521 0 3 4 
                                                      OpStore %405 %523 
                                Private f32* %525 = OpAccessChain %359 %78 
                                         f32 %526 = OpLoad %525 
                                         f32 %528 = OpFMul %526 %527 
                                Private f32* %529 = OpAccessChain %524 %29 
                                                      OpStore %529 %528 
                                Private f32* %532 = OpAccessChain %524 %29 
                                         f32 %533 = OpLoad %532 
                                         i32 %534 = OpConvertFToS %533 
                                                      OpStore %531 %534 
                                Private f32* %536 = OpAccessChain %405 %78 
                                         f32 %537 = OpLoad %536 
                                Private f32* %538 = OpAccessChain %405 %78 
                                         f32 %539 = OpLoad %538 
                                         f32 %540 = OpFNegate %539 
                                        bool %541 = OpFOrdGreaterThanEqual %537 %540 
                                                      OpStore %535 %541 
                                Private f32* %542 = OpAccessChain %405 %78 
                                         f32 %543 = OpLoad %542 
                                         f32 %544 = OpExtInst %1 4 %543 
                                         f32 %545 = OpExtInst %1 10 %544 
                                                      OpStore %439 %545 
                                        bool %546 = OpLoad %535 
                                                      OpSelectionMerge %549 None 
                                                      OpBranchConditional %546 %548 %551 
                                             %548 = OpLabel 
                                         f32 %550 = OpLoad %439 
                                                      OpStore %547 %550 
                                                      OpBranch %549 
                                             %551 = OpLabel 
                                         f32 %552 = OpLoad %439 
                                         f32 %553 = OpFNegate %552 
                                                      OpStore %547 %553 
                                                      OpBranch %549 
                                             %549 = OpLabel 
                                         f32 %554 = OpLoad %547 
                                Private f32* %555 = OpAccessChain %371 %29 
                                                      OpStore %555 %554 
                                         i32 %556 = OpLoad %531 
                                        bool %557 = OpINotEqual %556 %160 
                                                      OpSelectionMerge %560 None 
                                                      OpBranchConditional %557 %559 %563 
                                             %559 = OpLabel 
                                Private f32* %561 = OpAccessChain %405 %78 
                                         f32 %562 = OpLoad %561 
                                                      OpStore %558 %562 
                                                      OpBranch %560 
                                             %563 = OpLabel 
                                Private f32* %564 = OpAccessChain %371 %29 
                                         f32 %565 = OpLoad %564 
                                                      OpStore %558 %565 
                                                      OpBranch %560 
                                             %560 = OpLabel 
                                         f32 %566 = OpLoad %558 
                                Private f32* %567 = OpAccessChain %371 %29 
                                                      OpStore %567 %566 
                                         i32 %569 = OpLoad %531 
                                       i32_4 %571 = OpCompositeConstruct %569 %569 %569 %569 
                                      bool_4 %573 = OpIEqual %571 %572 
                                      bool_2 %574 = OpVectorShuffle %573 %573 0 1 
                                                      OpStore %568 %574 
                                Private f32* %575 = OpAccessChain %371 %29 
                                         f32 %576 = OpLoad %575 
                                                      OpStore %223 %576 
                                         f32 %577 = OpLoad %223 
                                         f32 %578 = OpExtInst %1 43 %577 %74 %15 
                                                      OpStore %223 %578 
                               Private bool* %579 = OpAccessChain %568 %29 
                                        bool %580 = OpLoad %579 
                                                      OpSelectionMerge %583 None 
                                                      OpBranchConditional %580 %582 %585 
                                             %582 = OpLabel 
                                         f32 %584 = OpLoad %223 
                                                      OpStore %581 %584 
                                                      OpBranch %583 
                                             %585 = OpLabel 
                                Private f32* %586 = OpAccessChain %371 %29 
                                         f32 %587 = OpLoad %586 
                                                      OpStore %581 %587 
                                                      OpBranch %583 
                                             %583 = OpLabel 
                                         f32 %588 = OpLoad %581 
                                                      OpStore %223 %588 
                                         f32 %589 = OpLoad %223 
                                         f32 %590 = OpFMul %589 %237 
                                Private f32* %591 = OpAccessChain %371 %29 
                                                      OpStore %591 %590 
                                Private f32* %593 = OpAccessChain %371 %29 
                                         f32 %594 = OpLoad %593 
                                Private f32* %595 = OpAccessChain %371 %29 
                                         f32 %596 = OpLoad %595 
                                         f32 %597 = OpFNegate %596 
                                        bool %598 = OpFOrdGreaterThanEqual %594 %597 
                                                      OpStore %592 %598 
                                Private f32* %599 = OpAccessChain %371 %29 
                                         f32 %600 = OpLoad %599 
                                         f32 %601 = OpExtInst %1 4 %600 
                                         f32 %602 = OpExtInst %1 10 %601 
                                Private f32* %603 = OpAccessChain %371 %29 
                                                      OpStore %603 %602 
                                        bool %604 = OpLoad %592 
                                                      OpSelectionMerge %607 None 
                                                      OpBranchConditional %604 %606 %610 
                                             %606 = OpLabel 
                                Private f32* %608 = OpAccessChain %371 %29 
                                         f32 %609 = OpLoad %608 
                                                      OpStore %605 %609 
                                                      OpBranch %607 
                                             %610 = OpLabel 
                                Private f32* %611 = OpAccessChain %371 %29 
                                         f32 %612 = OpLoad %611 
                                         f32 %613 = OpFNegate %612 
                                                      OpStore %605 %613 
                                                      OpBranch %607 
                                             %607 = OpLabel 
                                         f32 %614 = OpLoad %605 
                                Private f32* %615 = OpAccessChain %371 %29 
                                                      OpStore %615 %614 
                                Private f32* %616 = OpAccessChain %371 %29 
                                         f32 %617 = OpLoad %616 
                                Private f32* %618 = OpAccessChain %371 %29 
                                         f32 %619 = OpLoad %618 
                                         f32 %620 = OpFAdd %617 %619 
                                                      OpStore %439 %620 
                                Private f32* %621 = OpAccessChain %371 %29 
                                         f32 %622 = OpLoad %621 
                                        bool %623 = OpFOrdLessThan %237 %622 
                                                      OpStore %535 %623 
                                         f32 %624 = OpLoad %439 
                                         f32 %625 = OpLoad %439 
                                         f32 %626 = OpFNegate %625 
                                        bool %627 = OpFOrdGreaterThanEqual %624 %626 
                               Private bool* %628 = OpAccessChain %568 %29 
                                                      OpStore %628 %627 
                                         f32 %630 = OpLoad %439 
                                         f32 %631 = OpExtInst %1 4 %630 
                                         f32 %632 = OpExtInst %1 10 %631 
                                                      OpStore %629 %632 
                               Private bool* %633 = OpAccessChain %568 %29 
                                        bool %634 = OpLoad %633 
                                                      OpSelectionMerge %637 None 
                                                      OpBranchConditional %634 %636 %639 
                                             %636 = OpLabel 
                                         f32 %638 = OpLoad %629 
                                                      OpStore %635 %638 
                                                      OpBranch %637 
                                             %639 = OpLabel 
                                         f32 %640 = OpLoad %629 
                                         f32 %641 = OpFNegate %640 
                                                      OpStore %635 %641 
                                                      OpBranch %637 
                                             %637 = OpLabel 
                                         f32 %642 = OpLoad %635 
                                Private f32* %643 = OpAccessChain %381 %29 
                                                      OpStore %643 %642 
                                Private f32* %644 = OpAccessChain %381 %29 
                                         f32 %645 = OpLoad %644 
                                         f32 %646 = OpFNegate %645 
                                         f32 %647 = OpFAdd %646 %15 
                                Private f32* %648 = OpAccessChain %381 %29 
                                                      OpStore %648 %647 
                                        bool %649 = OpLoad %535 
                                                      OpSelectionMerge %652 None 
                                                      OpBranchConditional %649 %651 %655 
                                             %651 = OpLabel 
                                Private f32* %653 = OpAccessChain %381 %29 
                                         f32 %654 = OpLoad %653 
                                                      OpStore %650 %654 
                                                      OpBranch %652 
                                             %655 = OpLabel 
                                         f32 %656 = OpLoad %439 
                                                      OpStore %650 %656 
                                                      OpBranch %652 
                                             %652 = OpLabel 
                                         f32 %657 = OpLoad %650 
                                Private f32* %658 = OpAccessChain %371 %29 
                                                      OpStore %658 %657 
                               Private bool* %659 = OpAccessChain %568 %78 
                                        bool %660 = OpLoad %659 
                                                      OpSelectionMerge %663 None 
                                                      OpBranchConditional %660 %662 %666 
                                             %662 = OpLabel 
                                Private f32* %664 = OpAccessChain %371 %29 
                                         f32 %665 = OpLoad %664 
                                                      OpStore %661 %665 
                                                      OpBranch %663 
                                             %666 = OpLabel 
                                         f32 %667 = OpLoad %223 
                                                      OpStore %661 %667 
                                                      OpBranch %663 
                                             %663 = OpLabel 
                                         f32 %668 = OpLoad %661 
                                Private f32* %669 = OpAccessChain %405 %29 
                                                      OpStore %669 %668 
                                Uniform f32* %671 = OpAccessChain %44 %354 %29 
                                         f32 %672 = OpLoad %671 
                                Private f32* %673 = OpAccessChain %349 %29 
                                                      OpStore %673 %672 
                                       f32_4 %674 = OpLoad %343 
                                       f32_2 %675 = OpVectorShuffle %674 %674 0 1 
                              Uniform f32_4* %676 = OpAccessChain %44 %354 
                                       f32_4 %677 = OpLoad %676 
                                       f32_2 %678 = OpVectorShuffle %677 %677 0 1 
                                       f32_2 %679 = OpFMul %675 %678 
                                       f32_2 %680 = OpLoad %349 
                                       f32_2 %681 = OpFAdd %679 %680 
                                                      OpStore %371 %681 
                         read_only Texture2D %682 = OpLoad %360 
                                     sampler %683 = OpLoad %362 
                  read_only Texture2DSampled %684 = OpSampledImage %682 %683 
                                       f32_2 %685 = OpLoad %371 
                                       f32_4 %686 = OpImageSampleImplicitLod %684 %685 
                                                      OpStore %359 %686 
                                       f32_4 %687 = OpLoad %359 
                                       f32_2 %688 = OpVectorShuffle %687 %687 1 3 
                                       f32_2 %690 = OpFMul %688 %689 
                                                      OpStore %371 %690 
                                       f32_4 %691 = OpLoad %359 
                                       f32_2 %692 = OpVectorShuffle %691 %691 0 2 
                                       f32_2 %695 = OpFMul %692 %694 
                                       f32_2 %696 = OpLoad %371 
                                       f32_2 %697 = OpFAdd %695 %696 
                                                      OpStore %524 %697 
                                       f32_2 %698 = OpLoad %524 
                                       f32_2 %700 = OpFAdd %698 %699 
                                                      OpStore %371 %700 
                                       f32_2 %701 = OpLoad %349 
                                       f32_2 %702 = OpFMul %701 %390 
                                       f32_2 %703 = OpLoad %351 
                                       f32_2 %704 = OpFAdd %702 %703 
                                                      OpStore %351 %704 
                         read_only Texture2D %705 = OpLoad %360 
                                     sampler %706 = OpLoad %362 
                  read_only Texture2DSampled %707 = OpSampledImage %705 %706 
                                       f32_2 %708 = OpLoad %351 
                                       f32_4 %709 = OpImageSampleImplicitLod %707 %708 
                                                      OpStore %296 %709 
                                       f32_4 %710 = OpLoad %296 
                                       f32_2 %711 = OpVectorShuffle %710 %710 1 3 
                                       f32_2 %712 = OpFMul %711 %689 
                                                      OpStore %351 %712 
                                       f32_4 %713 = OpLoad %296 
                                       f32_2 %714 = OpVectorShuffle %713 %713 0 2 
                                       f32_2 %715 = OpFMul %714 %694 
                                       f32_2 %716 = OpLoad %351 
                                       f32_2 %717 = OpFAdd %715 %716 
                                                      OpStore %524 %717 
                                       f32_2 %718 = OpLoad %208 
                                       f32_2 %719 = OpLoad %371 
                                       f32_2 %720 = OpFMul %718 %719 
                                                      OpStore %351 %720 
                                       f32_2 %721 = OpLoad %208 
                                       f32_2 %722 = OpLoad %524 
                                       f32_2 %723 = OpFMul %721 %722 
                                                      OpStore %208 %723 
                                       f32_3 %724 = OpLoad %405 
                                       f32_2 %725 = OpVectorShuffle %724 %724 0 2 
                                       f32_2 %726 = OpLoad %208 
                                       f32_2 %727 = OpFMul %725 %726 
                                       f32_2 %728 = OpLoad %351 
                                       f32_2 %729 = OpFAdd %727 %728 
                                                      OpStore %208 %729 
                         read_only Texture2D %730 = OpLoad %191 
                                     sampler %731 = OpLoad %193 
                  read_only Texture2DSampled %732 = OpSampledImage %730 %731 
                                       f32_2 %733 = OpLoad %208 
                                       f32_4 %734 = OpImageSampleImplicitLod %732 %733 
                                                      OpStore %296 %734 
                                       f32_4 %735 = OpLoad %296 
                                       f32_3 %736 = OpLoad vs_TEXCOORD2 
                                       f32_4 %737 = OpVectorShuffle %736 %736 0 0 0 0 
                                       f32_4 %738 = OpFMul %735 %737 
                                       f32_4 %739 = OpLoad %199 
                                       f32_4 %740 = OpFAdd %738 %739 
                                                      OpStore %343 %740 
                         read_only Texture2D %742 = OpLoad %297 
                                     sampler %743 = OpLoad %299 
                  read_only Texture2DSampled %744 = OpSampledImage %742 %743 
                                       f32_2 %745 = OpLoad %208 
                                       f32_4 %746 = OpImageSampleImplicitLod %744 %745 
                                                      OpStore %741 %746 
                                       f32_4 %747 = OpLoad %741 
                                       f32_3 %748 = OpLoad vs_TEXCOORD2 
                                       f32_4 %749 = OpVectorShuffle %748 %748 1 1 1 1 
                                       f32_4 %750 = OpFMul %747 %749 
                                       f32_4 %751 = OpLoad %343 
                                       f32_4 %752 = OpFAdd %750 %751 
                                                      OpStore %343 %752 
                                       f32_4 %753 = OpLoad %343 
                                                      OpStore %281 %753 
                                                      OpBranch %328 
                                             %754 = OpLabel 
                                       f32_4 %755 = OpLoad %199 
                                                      OpStore %281 %755 
                                                      OpBranch %328 
                                             %328 = OpLabel 
                                       f32_4 %758 = OpLoad %281 
                                       f32_3 %759 = OpVectorShuffle %758 %758 0 1 2 
                                       f32_4 %760 = OpLoad %185 
                                       f32_3 %761 = OpVectorShuffle %760 %760 0 1 2 
                                       f32_3 %762 = OpFMul %759 %761 
                                       f32_4 %763 = OpLoad %757 
                                       f32_4 %764 = OpVectorShuffle %763 %762 4 5 6 3 
                                                      OpStore %757 %764 
                                Private f32* %765 = OpAccessChain %70 %29 
                                         f32 %766 = OpLoad %765 
                                Private f32* %767 = OpAccessChain %281 %17 
                                         f32 %768 = OpLoad %767 
                                         f32 %769 = OpFMul %766 %768 
                                 Output f32* %771 = OpAccessChain %757 %17 
                                                      OpStore %771 %769 
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