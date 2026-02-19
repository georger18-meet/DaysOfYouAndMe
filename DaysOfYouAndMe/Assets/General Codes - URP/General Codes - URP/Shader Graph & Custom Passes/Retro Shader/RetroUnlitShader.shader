Shader "Custom/RetroUnlitShader"
{
    Properties
    {
        _MainTex ("Texture", 2D) = "white" {}
        _Color ("Color", Color) = (1,1,1,1)
        _DitherThreshold ("Dither Threshold", Range(0, 1)) = 0.5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

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
                float4 vertex : SV_POSITION;
            };

            sampler2D _MainTex;
            float4 _Color;
            float _DitherThreshold;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            float dither2x2(float2 position)
            {
                int2 p = int2(position) % 2;
                float threshold = 0.0;
                if (p.x == 0 && p.y == 0) threshold = 0.75;
                else if (p.x == 1 && p.y == 0) threshold = 0.25;
                else if (p.x == 0 && p.y == 1) threshold = 1.00;
                else if (p.x == 1 && p.y == 1) threshold = 0.50;
                return threshold;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                fixed4 texColor = tex2D(_MainTex, i.uv) * _Color;
                
                // Apply dithering effect
                float threshold = dither2x2(i.uv * 512);
                if (texColor.r < _DitherThreshold * threshold) texColor.r = 0;
                if (texColor.g < _DitherThreshold * threshold) texColor.g = 0;
                if (texColor.b < _DitherThreshold * threshold) texColor.b = 0;

                return texColor;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
}
