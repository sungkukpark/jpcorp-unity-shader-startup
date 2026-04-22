Shader "Custom/TextureSurface"
{
    Properties
    {
        _MainTex1 ("Albedo (RGB)", 2D) = "white" {}
        _MainTex2 ("Albedo (RGB)", 2D) = "white" {}
        _BlendFactor ("Blend Factor", Range(0, 1)) = 0
    }
    SubShader
    {
        Tags
        {
            "RenderType"="Opaque"
        }

        CGPROGRAM
        #pragma surface surf Standard

        sampler2D   _MainTex1;
        sampler2D   _MainTex2;
        fixed       _BlendFactor;

        struct Input
        {
            float2 uv_MainTex1;
            float2 uv_MainTex2;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 c1 = tex2D(_MainTex1, IN.uv_MainTex1);
            fixed4 c2 = tex2D(_MainTex2, IN.uv_MainTex2);
            fixed4 c = lerp(c1, c2, _BlendFactor);
            o.Albedo = c.rgb;
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
