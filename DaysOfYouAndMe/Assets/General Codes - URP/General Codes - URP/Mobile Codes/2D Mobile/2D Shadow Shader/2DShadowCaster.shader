Shader "Custom/2DShadowCaster"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _ShadowFade ("Shadow Fade", Range(0, 1)) = 1
        _ShadowAngle ("Shadow Angle", Range(0, 360)) = 90
        _ShadowColor ("Shadow Color", Color) = (0, 0, 0, 1)
        _AlphaThreshold ("Alpha Threshold", Range(0, 1)) = 0.125
    }
    
    SubShader
    {
        Tags { "Queue" = "Transparent" }
        Blend SrcAlpha OneMinusSrcAlpha

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                UNITY_FOG_COORDS(1)
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;
            float _ShadowFade;
            float _ShadowAngle;
            float4 _ShadowColor;
            float _AlphaThreshold;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = TRANSFORM_TEX(v.uv, _MainTex);
                UNITY_TRANSFER_FOG(o,o.vertex);
                return o;
            }

            half4 frag (v2f i) : SV_Target
            {
                // Sample the texture and calculate opacity
                half4 texColor = tex2D(_MainTex, i.uv);
                float alpha = texColor.a;
                float2 center = float2(0.5, 0.5);
                float distance = length(i.uv - center);
                float angle = atan2(i.uv.y - center.y, i.uv.x - center.x) * 180 / 3.14159265358979323846264 + 180;
                
                float opacity = 1.0 - distance * _ShadowFade;
                float angleDiff = abs(angle - _ShadowAngle);
                float angleOpacity = clamp(1.0 - angleDiff / 180.0, 0.0, 1.0);
                float finalOpacity = opacity * angleOpacity;

                // Clip pixels with alpha below threshold
                clip(texColor.a - _AlphaThreshold);

                // Return shadow color with adjusted opacity
                return _ShadowColor * finalOpacity;
            }
            ENDCG
        }
    }
}
