Shader "Custom/TexSurface"
{
    Properties
    {
        // 2D, Cube, 3D types require "default" {} syntax.
        // {} was for texture options but is now unused.
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _Desaturation ("Desaturation", Range(0, 1)) = 0
    }
    SubShader
    {
        Tags
        {
            "RenderType"="Opaque"
        }

        CGPROGRAM
        #pragma surface surf Standard

        sampler2D   _MainTex;
        fixed       _Desaturation;

        struct Input
        {
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = lerp(c.rgb, (c.r + c.g + c.b) / 3, _Desaturation);
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
