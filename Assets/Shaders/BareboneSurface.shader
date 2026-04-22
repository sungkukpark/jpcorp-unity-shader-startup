Shader "Custom/BareboneSurface"
{
    Properties
    {
        _Red ("Red", Range(0,1)) = 1
        _Green ("Green", Range(0,1)) = 1
        _Blue ("Blue", Range(0,1)) = 1
        _Brightness ("Brightness", Range(-1,1)) = 0
    }
    SubShader
    {
        Tags
        {
            "RenderType"="Opaque"
        }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        struct Input
        {
            // Vertex color input. You can also have UVs, normals, screen position, etc... Check the documentation for more details.
            // https://docs.unity3d.com/Manual/SL-SurfaceShaderExamples.html
            float3 color : COLOR;
        };

        float _Red;
        float _Green;
        float _Blue;
        float _Brightness;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            o.Albedo = float3(_Red, _Green, _Blue) * (1.0 + _Brightness);
            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
