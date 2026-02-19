Shader "Ciconia Studio/CS_Polybrush/URP/Pro/Rainy Puddles"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Space(35)][Header(Base Layer (R)________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Space(15)]_GlobalXYTilingXYZWOffsetXY("Global --> XY(TilingXY) - ZW(OffsetXY)", Vector) = (1,1,0,0)
		_BaseColor("Color -->BaseColor Intensity(A)", Color) = (1,1,1,1)
		_BaseMap("Base Color", 2D) = "white" {}
		_Saturation("Saturation", Float) = 0
		_Brightness("Brightness", Range( 1 , 8)) = 1
		[Space(35)]_BumpMap("Normal Map", 2D) = "bump" {}
		_BumpScale("Normal Intensity", Float) = 0.3
		[Space(35)]_MetallicGlossMapMAHS("Mask Map  -->M(R) - Ao(G) - H(B) - S(A)", 2D) = "white" {}
		_Metallic("Metallic", Range( 0 , 2)) = 0
		_Glossiness("Smoothness", Range( 0 , 2)) = 0.5
		[Space(15)]_Parallax("Height Scale", Range( -0.1 , 0.1)) = 0
		_AoIntensity("Ao Intensity", Range( 0 , 2)) = 0
		[Space(35)][Header(Displacement Properties)][Space(15)][Toggle]_L0VisualizeHeightmap("Visualize Heightmap", Float) = 0
		_L0HeightmapSpread("Heightmap Spread", Float) = 0.5
		_L0Heightmapcontrast("Heightmap contrast", Float) = 1
		[Space(15)]_L0Displacement("Displacement", Float) = 0
		[Space(35)][Header(Layer1 (G)________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Space(15)]_GlobalXYTilingXYZWOffsetXYL1("Global --> XY(TilingXY) - ZW(OffsetXY)", Vector) = (1,1,0,0)
		_ColorL1("Color", Color) = (1,1,1,1)
		_BaseColorL1("Base Color", 2D) = "white" {}
		_SaturationL1("Saturation", Float) = 0
		_BrightnessL1("Brightness", Range( 1 , 8)) = 1
		[Space(35)]_BumpMapL1("Normal Map", 2D) = "bump" {}
		_BumpScaleL1("Normal Intensity", Float) = 0.3
		[Space(35)]_MetallicGlossMapMAHSL1("Mask Map  -->M(R) - Ao(G) - H(B) - S(A)", 2D) = "white" {}
		_MetallicL1("Metallic", Range( 0 , 2)) = 0
		_GlossinessL1("Smoothness", Range( 0 , 2)) = 0.5
		[Space(15)]_ParallaxL1("Height Scale", Range( -0.1 , 0.1)) = 0
		_AoIntensityL1("Ao Intensity", Range( 0 , 2)) = 0
		[Space(35)][Header(Displacement Properties)][Space(15)][Toggle]_L1VisualizeHeightmap("Visualize Heightmap", Float) = 0
		_L1HeightmapSpread("Heightmap Spread", Float) = 0.5
		_L1Heightmapcontrast("Heightmap contrast", Float) = 1
		[Space(15)]_L1Displacement("Displacement", Float) = 0
		[Space(35)][Header(Blend Properties)][Space(15)][Toggle]_L1UseHeightmapDepth1("Use Heightmap Depth", Float) = 1
		[Toggle]_L1ConstrainbyPaintedMask("Constrain By Painted Mask", Float) = 1
		[Space(10)]_L1BlendOpacity("Mask Opacity", Range( 0 , 1)) = 1
		[Space(10)]_L1BlendAmount("Amount", Float) = 1
		_L1BlendContrast("Contrast", Float) = 3.5
		[Space(35)][Header(Rain Dots Properties________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Space(15)]_GradientTex("Gradient Tex", 2D) = "white" {}
		_Intensity("Intensity", Range( 0 , 1)) = 0
		_Tiling("Tiling", Float) = 100
		_SplashSpeed("Splash Speed", Range( 0 , 1)) = 0.1
		_Size("Size", Range( 0 , 1)) = 0.5
		[Space(35)][Header(Wet Properties (A)________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Space(15)][KeywordEnum(Color,Wetmap,BaseLayer,Layer1)] _WetBaseColor("Base Color", Float) = 2
		[Space(10)]_ColorWet("Color", Color) = (0.5,0.5,0.5,1)
		_WetTex("Wet map  -->Ao(A)", 2D) = "gray" {}
		_DetailSaturation("Saturation", Float) = 0
		_DetailBrightness("Brightness", Range( 1 , 8)) = 1
		[Space(10)]_Metalness("Metalness", Range( 0 , 1)) = 0.2
		_SmoothnessWet("Smoothness", Range( 0 , 2)) = 1
		[Space(10)]_AoWet("Ao Intensity", Range( 0 , 1)) = 0
		[Space(15)][Header(Additional Reflection)][Space(10)]_ColorCubemap1("Color ", Color) = (1,1,1,1)
		[HDR]_Cubemap("Cubemap", CUBE) = "black" {}
		[Space(10)]_ReflectionIntensity("Intensity", Range( 0 , 10)) = 0.2
		_BlurReflection("Blur", Range( 0 , 7)) = 0.5
		[Space(35)][Header(Puddles Animations)][Space(15)]_PuddleMap("Wave Normal Map", 2D) = "bump" {}
		[Space(15)][Toggle(_MAINWAVE_ON)] _MainWave("Main Wave", Float) = 1
		_NormalWaveIntensity1("Intensity", Float) = 0.5
		_TranslationSpeed1("Speed", Float) = 0.2
		_RotationAngle1("Rotation", Float) = 0
		_TilingWave1("Tiling", Float) = 0.05
		[Space(25)][Toggle(_DETAILWAVE_ON)] _DetailWave("Detail Wave", Float) = 1
		_NormalWaveIntensity2("Intensity", Float) = 0.3
		_TranslationSpeed2("Speed", Float) = 0.2
		_RotationAngle2("Rotation", Float) = 90
		_TilingWave2("Tiling", Float) = 0.05
		[Space(35)][Header(Rain Ripples Properties________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)][Space(15)]_XColumnsYRowsZSpeedWStrartFrameNormal("X(Columns) - Y(Rows) - Z(Speed) - W(Strart Frame)Normal", Vector) = (8,8,0.25,0)
		_TextureAtlasNormal("Texture Atlas Normal", 2D) = "bump" {}
		_FlipBTilingNormal("FlipBook Tiling", Float) = 1
		_IntensityScaleNormal1("Instensity", Range( 0 , 1)) = 0.4
		[Space(35)][Toggle]_DuplicateTextureAtlasNormal("Duplicate Texture Atlas", Float) = 1
		_IntensityScaleNormal2("Instensity", Range( 0 , 1)) = 0.3
		_ScaleFBDetailsNormal("Scale", Float) = 1
		_FBDetailsNormal("Rotate Details", Float) = 45
		_OffsetFBDetailsNormal("Offset XY", Vector) = (1.5,1.5,0,0)
		[Space(10)]_Distortion("Distortion --> Wetmap Only", Range( 0 , 1)) = 0.3
		[Space(35)][Header(Displacement Properties)][Space(15)][Toggle]_L3VisualizeHeightmap1("Visualize Heightmap", Float) = 0
		[Space(10)]_L1Displacement1("Displacement", Float) = 0
		[Space(35)][Header(Blend Properties)][Space(15)][Toggle]_L3UseHeightmapDepth1("Use Heightmap Depth", Float) = 1
		[Toggle]_L3ConstrainbyPaintedMask("Constrain By Painted Mask", Float) = 1
		[HideInInspector][Space(10)]_L3BlendOpacity("Mask Opacity", Range( 0 , 1)) = 1
		[Space(10)]_L3BlendAmount("Amount", Float) = 1
		_L3BlendContrast("Contrast", Float) = 3.5
		[Space(35)][Header(Tessellation Properties________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)]
		[Space(15)]_TessValue("Tessellation", Range(1, 32)) = 8
		[Space(15)]_TessMin("Distance Min", Float) = 1
		_TessMax("Distance Max", Float) = 20


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull Back
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			
			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
		
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local _WETBASECOLOR_COLOR _WETBASECOLOR_WETMAP _WETBASECOLOR_BASELAYER _WETBASECOLOR_LAYER1
			#pragma shader_feature_local _DETAILWAVE_ON
			#pragma shader_feature_local _MAINWAVE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColorL1;
			float4 _BaseColor;
			float4 _ColorWet;
			float4 _PuddleMap_ST;
			float4 _WetTex_ST;
			float4 _XColumnsYRowsZSpeedWStrartFrameNormal;
			float4 _BaseMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXYL1;
			float4 _BumpMapL1_ST;
			float4 _BumpMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _BaseColorL1_ST;
			float4 _MetallicGlossMapMAHSL1_ST;
			float4 _ColorCubemap1;
			float2 _OffsetFBDetailsNormal;
			float _NormalWaveIntensity1;
			float _RotationAngle1;
			float _TilingWave1;
			float _TranslationSpeed1;
			float _BumpScaleL1;
			float _BumpScale;
			float _L3BlendContrast;
			float _TranslationSpeed2;
			float _TilingWave2;
			float _L0Displacement;
			float _NormalWaveIntensity2;
			float _AoIntensity;
			float _SmoothnessWet;
			float _GlossinessL1;
			float _Intensity;
			float _Size;
			float _Tiling;
			float _RotationAngle2;
			float _SplashSpeed;
			float _Metalness;
			float _MetallicL1;
			float _Metallic;
			float _ReflectionIntensity;
			float _BlurReflection;
			float _L3BlendAmount;
			float _Glossiness;
			float _L3ConstrainbyPaintedMask;
			float _ScaleFBDetailsNormal;
			float _DetailSaturation;
			float _L0Heightmapcontrast;
			float _L0HeightmapSpread;
			float _L1Displacement;
			float _L1Heightmapcontrast;
			float _L1HeightmapSpread;
			float _L1Displacement1;
			float _L3BlendOpacity;
			float _L3VisualizeHeightmap1;
			float _L1VisualizeHeightmap;
			float _L0VisualizeHeightmap;
			float _Brightness;
			float _Parallax;
			float _Saturation;
			float _BrightnessL1;
			float _ParallaxL1;
			float _SaturationL1;
			float _L1UseHeightmapDepth1;
			float _L1ConstrainbyPaintedMask;
			float _L1BlendAmount;
			float _L1BlendContrast;
			float _L1BlendOpacity;
			float _DetailBrightness;
			float _DuplicateTextureAtlasNormal;
			float _FlipBTilingNormal;
			float _IntensityScaleNormal1;
			float _AoIntensityL1;
			float _FBDetailsNormal;
			float _IntensityScaleNormal2;
			float _Distortion;
			float _L3UseHeightmapDepth1;
			float _AoWet;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MetallicGlossMapMAHS;
			sampler2D _MetallicGlossMapMAHSL1;
			sampler2D _BaseMap;
			sampler2D _BaseColorL1;
			sampler2D _WetTex;
			sampler2D _TextureAtlasNormal;
			sampler2D _BumpMap;
			sampler2D _BumpMapL1;
			sampler2D _PuddleMap;
			samplerCUBE _Cubemap;
			sampler2D _GradientTex;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
					float2 voronoihash58_g1434( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi58_g1434( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash58_g1434( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_MetallicGlossMapMAHS = v.texcoord.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2Dlod( _MetallicGlossMapMAHS, float4( ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float4 temp_cast_1 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_1 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VertexOffset605 = ( float4( ( v.normalOS * ( _L0Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1414 );
				float2 uv_MetallicGlossMapMAHSL1 = v.texcoord.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2Dlod( _MetallicGlossMapMAHSL1, float4( ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float4 temp_cast_4 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_4 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VertexOffset613 = ( float4( ( v.normalOS * ( _L1Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1413 );
				float4 break106 = v.ase_color;
				float VertexG115 = break106.g;
				float L1Opacity950 = 0.0;
				float4 lerpResult619 = lerp( Layer0VertexOffset605 , Layer1VertexOffset613 , ( VertexG115 * L1Opacity950 ));
				float4 temp_cast_8 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_8 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VertexOffset869 = ( float4( ( v.normalOS * ( _L1Displacement1 / 10.0 ) ) , 0.0 ) * temp_output_10_0_g1415 );
				float VertexA117 = break106.a;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult905 = lerp( lerpResult619 , Layer3VertexOffset869 , ( VertexA117 * WetOpacity768 ));
				float4 VertexOffset621 = lerpResult905;
				
				o.ase_texcoord8.xyz = v.texcoord.xyz;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset621.xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif
				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x );
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y );
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z );

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( vertexInput.positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 uv_BaseMap = IN.ase_texcoord8.xyz.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float2 break26_g1461 = uv_BaseMap;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1461 = (float2(( break26_g1461.x * L0GlobalTilingX150 ) , ( break26_g1461.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1461 = (float2(( break26_g1461.x + L0GlobalOffsetX151 ) , ( break26_g1461.y + L0GlobalOffsetY148 )));
				float2 uv_MetallicGlossMapMAHS = IN.ase_texcoord8.xyz.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2D( _MetallicGlossMapMAHS, ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ) );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset38_g1055 = ParallaxOffset( tex2DNode3_g1055.b , _Parallax , ase_tanViewDir );
				float2 switchResult37_g1055 = (((ase_vface>0)?(paralaxOffset38_g1055):(0.0)));
				float2 Layer0Parallax215 = switchResult37_g1055;
				float4 tex2DNode7_g1460 = tex2D( _BaseMap, ( ( appendResult14_g1461 + appendResult13_g1461 ) + Layer0Parallax215 ) );
				float4 lerpResult53_g1460 = lerp( _BaseColor , ( ( _BaseColor * tex2DNode7_g1460 ) * _BaseColor.a ) , _BaseColor.a);
				float clampResult27_g1460 = clamp( _Saturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1460 = lerpResult53_g1460.rgb;
				float desaturateDot29_g1460 = dot( desaturateInitialColor29_g1460, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1460 = lerp( desaturateInitialColor29_g1460, desaturateDot29_g1460.xxx, -clampResult27_g1460 );
				float4 Layer0BaseColor179 = CalculateContrast(_Brightness,float4( desaturateVar29_g1460 , 0.0 ));
				float2 uv_BaseColorL1 = IN.ase_texcoord8.xyz.xy * _BaseColorL1_ST.xy + _BaseColorL1_ST.zw;
				float2 break26_g1396 = uv_BaseColorL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1396 = (float2(( break26_g1396.x * L1GlobalTilingX234 ) , ( break26_g1396.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1396 = (float2(( break26_g1396.x + L1GlobalOffsetX236 ) , ( break26_g1396.y + L1GlobalOffsetY237 )));
				float2 uv_MetallicGlossMapMAHSL1 = IN.ase_texcoord8.xyz.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2D( _MetallicGlossMapMAHSL1, ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ) );
				float2 paralaxOffset38_g1057 = ParallaxOffset( tex2DNode3_g1057.b , _ParallaxL1 , ase_tanViewDir );
				float2 switchResult37_g1057 = (((ase_vface>0)?(paralaxOffset38_g1057):(0.0)));
				float2 Layer1Parallax247 = switchResult37_g1057;
				float4 tex2DNode7_g1395 = tex2D( _BaseColorL1, ( ( appendResult14_g1396 + appendResult13_g1396 ) + Layer1Parallax247 ) );
				float clampResult27_g1395 = clamp( _SaturationL1 , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1395 = ( _ColorL1 * tex2DNode7_g1395 ).rgb;
				float desaturateDot29_g1395 = dot( desaturateInitialColor29_g1395, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1395 = lerp( desaturateInitialColor29_g1395, desaturateDot29_g1395.xxx, -clampResult27_g1395 );
				float4 Layer1BaseColor261 = CalculateContrast(_BrightnessL1,float4( desaturateVar29_g1395 , 0.0 ));
				float4 break106 = IN.ase_color;
				float VertexG115 = break106.g;
				float temp_output_21_0_g1411 = VertexG115;
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float temp_output_49_0_g1411 = ( _L1BlendContrast - 1.5 );
				float clampResult11_g1411 = clamp( ( ( _L1BlendAmount - 2.37 ) + (( 1.0 + temp_output_49_0_g1411 ) + (Layer0Heightmap336 - 0.0) * (-temp_output_49_0_g1411 - ( 1.0 + temp_output_49_0_g1411 )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
				float blendOpSrc18_g1411 = clampResult11_g1411;
				float blendOpDest18_g1411 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g1411 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
				float blendOpSrc31_g1411 = (( _L1ConstrainbyPaintedMask )?( ( saturate( ( blendOpSrc18_g1411 * blendOpDest18_g1411 ) )) ):( clampResult11_g1411 ));
				float blendOpDest31_g1411 = temp_output_21_0_g1411;
				float VertexGHeightmap352 = ( (( _L1UseHeightmapDepth1 )?( ( saturate( ( blendOpSrc31_g1411 + blendOpDest31_g1411 ) )) ):( temp_output_21_0_g1411 )) * _L1BlendOpacity );
				float4 lerpResult99 = lerp( Layer0BaseColor179 , Layer1BaseColor261 , VertexGHeightmap352);
				float4 temp_cast_4 = (1.0).xxxx;
				float2 uv_WetTex = IN.ase_texcoord8.xyz.xy * _WetTex_ST.xy + _WetTex_ST.zw;
				float FlipBookTiling100_g1350 = _FlipBTilingNormal;
				float2 temp_cast_5 = (FlipBookTiling100_g1350).xx;
				float2 texCoord114_g1350 = IN.ase_texcoord8.xyz.xy * temp_cast_5 + float2( 0,0 );
				float2 appendResult124_g1350 = (float2(frac( texCoord114_g1350.x ) , frac( texCoord114_g1350.y )));
				float XColumns119_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.x;
				float YRows118_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.y;
				float ZSpeed121_g1350 = ( ( _XColumnsYRowsZSpeedWStrartFrameNormal.x * _XColumnsYRowsZSpeedWStrartFrameNormal.y ) * _XColumnsYRowsZSpeedWStrartFrameNormal.z );
				float WStrartFrame122_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.w;
				// *** BEGIN Flipbook UV Animation vars ***
				// Total tiles of Flipbook Texture
				float fbtotaltiles130_g1350 = XColumns119_g1350 * YRows118_g1350;
				// Offsets for cols and rows of Flipbook Texture
				float fbcolsoffset130_g1350 = 1.0f / XColumns119_g1350;
				float fbrowsoffset130_g1350 = 1.0f / YRows118_g1350;
				// Speed of animation
				float fbspeed130_g1350 = _Time[ 1 ] * ZSpeed121_g1350;
				// UV Tiling (col and row offset)
				float2 fbtiling130_g1350 = float2(fbcolsoffset130_g1350, fbrowsoffset130_g1350);
				// UV Offset - calculate current tile linear index, and convert it to (X * coloffset, Y * rowoffset)
				// Calculate current tile linear index
				float fbcurrenttileindex130_g1350 = round( fmod( fbspeed130_g1350 + WStrartFrame122_g1350, fbtotaltiles130_g1350) );
				fbcurrenttileindex130_g1350 += ( fbcurrenttileindex130_g1350 < 0) ? fbtotaltiles130_g1350 : 0;
				// Obtain Offset X coordinate from current tile linear index
				float fblinearindextox130_g1350 = round ( fmod ( fbcurrenttileindex130_g1350, XColumns119_g1350 ) );
				// Multiply Offset X by coloffset
				float fboffsetx130_g1350 = fblinearindextox130_g1350 * fbcolsoffset130_g1350;
				// Obtain Offset Y coordinate from current tile linear index
				float fblinearindextoy130_g1350 = round( fmod( ( fbcurrenttileindex130_g1350 - fblinearindextox130_g1350 ) / XColumns119_g1350, YRows118_g1350 ) );
				// Reverse Y to get tiles from Top to Bottom
				fblinearindextoy130_g1350 = (int)(YRows118_g1350-1) - fblinearindextoy130_g1350;
				// Multiply Offset Y by rowoffset
				float fboffsety130_g1350 = fblinearindextoy130_g1350 * fbrowsoffset130_g1350;
				// UV Offset
				float2 fboffset130_g1350 = float2(fboffsetx130_g1350, fboffsety130_g1350);
				// Flipbook UV
				half2 fbuv130_g1350 = appendResult124_g1350 * fbtiling130_g1350 + fboffset130_g1350;
				// *** END Flipbook UV Animation vars ***
				float3 unpack132_g1350 = UnpackNormalScale( tex2D( _TextureAtlasNormal, fbuv130_g1350 ), _IntensityScaleNormal1 );
				unpack132_g1350.z = lerp( 1, unpack132_g1350.z, saturate(_IntensityScaleNormal1) );
				float3 tex2DNode132_g1350 = unpack132_g1350;
				float2 temp_cast_6 = (( FlipBookTiling100_g1350 / _ScaleFBDetailsNormal )).xx;
				float2 texCoord105_g1350 = IN.ase_texcoord8.xyz.xy * temp_cast_6 + _OffsetFBDetailsNormal;
				float cos111_g1350 = cos( _FBDetailsNormal );
				float sin111_g1350 = sin( _FBDetailsNormal );
				float2 rotator111_g1350 = mul( texCoord105_g1350 - float2( 0.5,0.5 ) , float2x2( cos111_g1350 , -sin111_g1350 , sin111_g1350 , cos111_g1350 )) + float2( 0.5,0.5 );
				float2 break112_g1350 = rotator111_g1350;
				float2 appendResult123_g1350 = (float2(frac( break112_g1350.x ) , frac( break112_g1350.y )));
				float fbtotaltiles129_g1350 = XColumns119_g1350 * YRows118_g1350;
				float fbcolsoffset129_g1350 = 1.0f / XColumns119_g1350;
				float fbrowsoffset129_g1350 = 1.0f / YRows118_g1350;
				float fbspeed129_g1350 = _Time[ 1 ] * ZSpeed121_g1350;
				float2 fbtiling129_g1350 = float2(fbcolsoffset129_g1350, fbrowsoffset129_g1350);
				float fbcurrenttileindex129_g1350 = round( fmod( fbspeed129_g1350 + WStrartFrame122_g1350, fbtotaltiles129_g1350) );
				fbcurrenttileindex129_g1350 += ( fbcurrenttileindex129_g1350 < 0) ? fbtotaltiles129_g1350 : 0;
				float fblinearindextox129_g1350 = round ( fmod ( fbcurrenttileindex129_g1350, XColumns119_g1350 ) );
				float fboffsetx129_g1350 = fblinearindextox129_g1350 * fbcolsoffset129_g1350;
				float fblinearindextoy129_g1350 = round( fmod( ( fbcurrenttileindex129_g1350 - fblinearindextox129_g1350 ) / XColumns119_g1350, YRows118_g1350 ) );
				fblinearindextoy129_g1350 = (int)(YRows118_g1350-1) - fblinearindextoy129_g1350;
				float fboffsety129_g1350 = fblinearindextoy129_g1350 * fbrowsoffset129_g1350;
				float2 fboffset129_g1350 = float2(fboffsetx129_g1350, fboffsety129_g1350);
				half2 fbuv129_g1350 = appendResult123_g1350 * fbtiling129_g1350 + fboffset129_g1350;
				float3 unpack134_g1350 = UnpackNormalScale( tex2D( _TextureAtlasNormal, fbuv129_g1350 ), _IntensityScaleNormal2 );
				unpack134_g1350.z = lerp( 1, unpack134_g1350.z, saturate(_IntensityScaleNormal2) );
				float3 RainDotsNormal976 = (( _DuplicateTextureAtlasNormal )?( BlendNormal( tex2DNode132_g1350 , unpack134_g1350 ) ):( tex2DNode132_g1350 ));
				float2 temp_cast_8 = (_Distortion).xx;
				float4 tex2DNode44_g1409 = tex2D( _WetTex, ( uv_WetTex + ( RainDotsNormal976.xy * temp_cast_8 ) ) );
				float clampResult27_g1409 = clamp( _DetailSaturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1409 = tex2DNode44_g1409.rgb;
				float desaturateDot29_g1409 = dot( desaturateInitialColor29_g1409, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1409 = lerp( desaturateInitialColor29_g1409, desaturateDot29_g1409.xxx, -clampResult27_g1409 );
				#if defined(_WETBASECOLOR_COLOR)
				float4 staticSwitch767 = temp_cast_4;
				#elif defined(_WETBASECOLOR_WETMAP)
				float4 staticSwitch767 = CalculateContrast(_DetailBrightness,float4( desaturateVar29_g1409 , 0.0 ));
				#elif defined(_WETBASECOLOR_BASELAYER)
				float4 staticSwitch767 = Layer0BaseColor179;
				#elif defined(_WETBASECOLOR_LAYER1)
				float4 staticSwitch767 = Layer1BaseColor261;
				#else
				float4 staticSwitch767 = Layer0BaseColor179;
				#endif
				float4 Layer3BaseColor786 = ( _ColorWet * staticSwitch767 );
				float VertexA117 = break106.a;
				float temp_output_21_0_g1410 = VertexA117;
				float temp_output_61_0_g1410 = ( _L3BlendAmount - 2.37 );
				float lerpResult50_g1410 = lerp( temp_output_61_0_g1410 , ( temp_output_61_0_g1410 - 2.0 ) , VertexG115);
				float VertexB116 = break106.b;
				float lerpResult55_g1410 = lerp( lerpResult50_g1410 , -1.0 , VertexB116);
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float lerpResult876 = lerp( ( Layer0Heightmap336 * ( 1.0 - VertexG115 ) ) , Layer1Heightmap510 , VertexG115);
				float temp_output_817_0 = ( lerpResult876 * ( 1.0 - VertexB116 ) );
				float temp_output_63_0_g1410 = ( _L3BlendContrast - 1.5 );
				float clampResult11_g1410 = clamp( ( lerpResult55_g1410 + (( 1.0 + temp_output_63_0_g1410 ) + (temp_output_817_0 - 0.0) * (-temp_output_63_0_g1410 - ( 1.0 + temp_output_63_0_g1410 )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
				float blendOpSrc18_g1410 = clampResult11_g1410;
				float blendOpDest18_g1410 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g1410 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
				float blendOpSrc31_g1410 = (( _L3ConstrainbyPaintedMask )?( ( saturate( ( blendOpSrc18_g1410 * blendOpDest18_g1410 ) )) ):( clampResult11_g1410 ));
				float blendOpDest31_g1410 = temp_output_21_0_g1410;
				float temp_output_929_0 = (( _L3UseHeightmapDepth1 )?( ( saturate( ( blendOpSrc31_g1410 + blendOpDest31_g1410 ) )) ):( temp_output_21_0_g1410 ));
				float VertexAHeightmap799 = temp_output_929_0;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult101 = lerp( lerpResult99 , Layer3BaseColor786 , ( VertexAHeightmap799 * WetOpacity768 ));
				float4 BaseColor121 = lerpResult101;
				float4 temp_cast_11 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_11 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VisHeightmap579 = temp_output_8_0_g1414;
				float VertexR114 = break106.r;
				float4 temp_cast_13 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_13 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VisHeightmap612 = temp_output_8_0_g1413;
				float4 temp_cast_16 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_16 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VisHeightmap868 = temp_output_10_0_g1415;
				
				float2 uv_BumpMap = IN.ase_texcoord8.xyz.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				float2 break26_g1463 = uv_BumpMap;
				float2 appendResult14_g1463 = (float2(( break26_g1463.x * L0GlobalTilingX150 ) , ( break26_g1463.y * L0GlobalTilingY149 )));
				float2 appendResult13_g1463 = (float2(( break26_g1463.x + L0GlobalOffsetX151 ) , ( break26_g1463.y + L0GlobalOffsetY148 )));
				float3 unpack4_g1462 = UnpackNormalScale( tex2D( _BumpMap, ( ( appendResult14_g1463 + appendResult13_g1463 ) + Layer0Parallax215 ) ), _BumpScale );
				unpack4_g1462.z = lerp( 1, unpack4_g1462.z, saturate(_BumpScale) );
				float3 tex2DNode4_g1462 = unpack4_g1462;
				float3 Layer0Normal193 = tex2DNode4_g1462;
				float2 uv_BumpMapL1 = IN.ase_texcoord8.xyz.xy * _BumpMapL1_ST.xy + _BumpMapL1_ST.zw;
				float2 break26_g1429 = uv_BumpMapL1;
				float2 appendResult14_g1429 = (float2(( break26_g1429.x * L1GlobalTilingX234 ) , ( break26_g1429.y * L1GlobalTilingY235 )));
				float2 appendResult13_g1429 = (float2(( break26_g1429.x + L1GlobalOffsetX236 ) , ( break26_g1429.y + L1GlobalOffsetY237 )));
				float3 unpack4_g1428 = UnpackNormalScale( tex2D( _BumpMapL1, ( ( appendResult14_g1429 + appendResult13_g1429 ) + Layer1Parallax247 ) ), _BumpScaleL1 );
				unpack4_g1428.z = lerp( 1, unpack4_g1428.z, saturate(_BumpScaleL1) );
				float3 tex2DNode4_g1428 = unpack4_g1428;
				float3 Layer1Normal260 = tex2DNode4_g1428;
				float3 lerpResult133 = lerp( Layer0Normal193 , Layer1Normal260 , VertexGHeightmap352);
				float2 temp_cast_18 = (_TranslationSpeed1).xx;
				float2 uv_PuddleMap = IN.ase_texcoord8.xyz.xy * _PuddleMap_ST.xy + _PuddleMap_ST.zw;
				float cos54_g1427 = cos( radians( _RotationAngle1 ) );
				float sin54_g1427 = sin( radians( _RotationAngle1 ) );
				float2 rotator54_g1427 = mul( ( uv_PuddleMap * _TilingWave1 ) - float2( 0.5,0.5 ) , float2x2( cos54_g1427 , -sin54_g1427 , sin54_g1427 , cos54_g1427 )) + float2( 0.5,0.5 );
				float2 panner86_g1427 = ( ( _TimeParameters.x * 0.05 ) * temp_cast_18 + rotator54_g1427);
				float3 unpack107_g1427 = UnpackNormalScale( tex2D( _PuddleMap, panner86_g1427 ), _NormalWaveIntensity1 );
				unpack107_g1427.z = lerp( 1, unpack107_g1427.z, saturate(_NormalWaveIntensity1) );
				#ifdef _MAINWAVE_ON
				float3 staticSwitch109_g1427 = unpack107_g1427;
				#else
				float3 staticSwitch109_g1427 = float3(0,0,1);
				#endif
				float2 temp_cast_19 = (_TranslationSpeed2).xx;
				float cos83_g1427 = cos( radians( _RotationAngle2 ) );
				float sin83_g1427 = sin( radians( _RotationAngle2 ) );
				float2 rotator83_g1427 = mul( ( uv_PuddleMap * _TilingWave2 ) - float2( 0.5,0.5 ) , float2x2( cos83_g1427 , -sin83_g1427 , sin83_g1427 , cos83_g1427 )) + float2( 0.5,0.5 );
				float2 panner88_g1427 = ( ( _TimeParameters.x * 0.05 ) * temp_cast_19 + rotator83_g1427);
				float3 unpack108_g1427 = UnpackNormalScale( tex2D( _PuddleMap, panner88_g1427 ), _NormalWaveIntensity2 );
				unpack108_g1427.z = lerp( 1, unpack108_g1427.z, saturate(_NormalWaveIntensity2) );
				#ifdef _DETAILWAVE_ON
				float3 staticSwitch56_g1427 = BlendNormal( staticSwitch109_g1427 , unpack108_g1427 );
				#else
				float3 staticSwitch56_g1427 = staticSwitch109_g1427;
				#endif
				float3 lerpResult128 = lerp( lerpResult133 , BlendNormal( staticSwitch56_g1427 , RainDotsNormal976 ) , ( VertexAHeightmap799 * WetOpacity768 ));
				float3 Normal129 = lerpResult128;
				
				float3 worldRefl28_g1430 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, Normal129 ), dot( tanToWorld1, Normal129 ), dot( tanToWorld2, Normal129 ) ) ) );
				float4 texCUBENode27_g1430 = texCUBElod( _Cubemap, float4( worldRefl28_g1430, _BlurReflection) );
				float clampResult39_g1430 = clamp( _ReflectionIntensity , 0.0 , 100.0 );
				float4 temp_cast_20 = (1.0).xxxx;
				float4 lerpResult704 = lerp( ( BaseColor121 * 0.0 ) , ( ( texCUBENode27_g1430 * ( texCUBENode27_g1430.a * clampResult39_g1430 ) * _ColorCubemap1 ) * temp_cast_20 ) , VertexA117);
				float4 Cubemap742 = ( lerpResult704 * WetOpacity768 );
				
				float Layer0Metallic211 = ( tex2DNode3_g1055.r * _Metallic );
				float Layer1Metallic263 = ( tex2DNode3_g1057.r * _MetallicL1 );
				float lerpResult289 = lerp( Layer0Metallic211 , Layer1Metallic263 , VertexGHeightmap352);
				float CubemapMetalness750 = _Metalness;
				float lerpResult293 = lerp( lerpResult289 , CubemapMetalness750 , ( VertexAHeightmap799 * WetOpacity768 ));
				float Metallic296 = lerpResult293;
				
				float temp_output_1_0_g1055 = ( tex2DNode3_g1055.a * _Glossiness );
				float2 temp_cast_23 = (_SplashSpeed).xx;
				float time58_g1434 = ( 1.0 * 0.001 );
				float2 voronoiSmoothId58_g1434 = 0;
				float2 texCoord55_g1434 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords58_g1434 = texCoord55_g1434 * _Tiling;
				float2 id58_g1434 = 0;
				float2 uv58_g1434 = 0;
				float fade58_g1434 = 0.5;
				float voroi58_g1434 = 0;
				float rest58_g1434 = 0;
				for( int it58_g1434 = 0; it58_g1434 <2; it58_g1434++ ){
				voroi58_g1434 += fade58_g1434 * voronoi58_g1434( coords58_g1434, time58_g1434, id58_g1434, uv58_g1434, 0,voronoiSmoothId58_g1434 );
				rest58_g1434 += fade58_g1434;
				coords58_g1434 *= 2;
				fade58_g1434 *= 0.5;
				}//Voronoi58_g1434
				voroi58_g1434 /= rest58_g1434;
				float2 myVarName60_g1434 = id58_g1434;
				float2 panner63_g1434 = ( 1.0 * _Time.y * temp_cast_23 + ( step( voroi58_g1434 , 0.1 ) * myVarName60_g1434 ));
				float RainDotsRoughness970 = ( saturate( ( tex2D( _GradientTex, panner63_g1434 ).g * step( voroi58_g1434 , (0.0 + (_Size - 0.0) * (0.05 - 0.0) / (1.0 - 0.0)) ) ) ) * _Intensity );
				float Layer0Smoothness210 = ( ( temp_output_1_0_g1055 * ( 1.0 - RainDotsRoughness970 ) ) + RainDotsRoughness970 );
				float temp_output_1_0_g1057 = ( tex2DNode3_g1057.a * _GlossinessL1 );
				float Layer1Smoothness264 = ( ( temp_output_1_0_g1057 * ( 1.0 - RainDotsRoughness970 ) ) + RainDotsRoughness970 );
				float lerpResult301 = lerp( Layer0Smoothness210 , Layer1Smoothness264 , VertexGHeightmap352);
				float CubemapSkyIntensity741 = _SmoothnessWet;
				float lerpResult305 = lerp( lerpResult301 , CubemapSkyIntensity741 , ( VertexAHeightmap799 * WetOpacity768 ));
				float Smoothness309 = lerpResult305;
				
				float blendOpSrc34_g1055 = tex2DNode3_g1055.g;
				float blendOpDest34_g1055 = ( 1.0 - _AoIntensity );
				float Layer0Ao214 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc34_g1055 ) * ( 1.0 - blendOpDest34_g1055 ) ) ));
				float blendOpSrc34_g1057 = tex2DNode3_g1057.g;
				float blendOpDest34_g1057 = ( 1.0 - _AoIntensityL1 );
				float Layer1Ao262 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc34_g1057 ) * ( 1.0 - blendOpDest34_g1057 ) ) ));
				float lerpResult312 = lerp( Layer0Ao214 , Layer1Ao262 , VertexGHeightmap352);
				float WetAo935 = tex2DNode44_g1409.a;
				#if defined(_WETBASECOLOR_COLOR)
				float staticSwitch931 = 1.0;
				#elif defined(_WETBASECOLOR_WETMAP)
				float staticSwitch931 = WetAo935;
				#elif defined(_WETBASECOLOR_BASELAYER)
				float staticSwitch931 = Layer0Ao214;
				#elif defined(_WETBASECOLOR_LAYER1)
				float staticSwitch931 = Layer1Ao262;
				#else
				float staticSwitch931 = Layer0Ao214;
				#endif
				float AoWet940 = _AoWet;
				float blendOpSrc944 = staticSwitch931;
				float blendOpDest944 = ( 1.0 - AoWet940 );
				float lerpResult316 = lerp( lerpResult312 , ( saturate( ( 1.0 - ( 1.0 - blendOpSrc944 ) * ( 1.0 - blendOpDest944 ) ) )) , ( VertexAHeightmap799 * WetOpacity768 ));
				float Ao321 = lerpResult316;
				

				float3 BaseColor = (( _L3VisualizeHeightmap1 )?( Layer3VisHeightmap868 ):( (( _L1VisualizeHeightmap )?( ( Layer1VisHeightmap612 * VertexG115 ) ):( (( _L0VisualizeHeightmap )?( ( Layer0VisHeightmap579 * VertexR114 ) ):( BaseColor121 )) )) )).xyz;
				float3 Normal = Normal129;
				float3 Emission = Cubemap742.rgb;
				float3 Specular = 0.5;
				float Metallic = Metallic296;
				float Smoothness = Smoothness309;
				float Occlusion = Ao321;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.positionCS, surfaceData, inputData);
				#endif

				half4 color = UniversalFragmentPBR( inputData, surfaceData);

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif				
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColorL1;
			float4 _BaseColor;
			float4 _ColorWet;
			float4 _PuddleMap_ST;
			float4 _WetTex_ST;
			float4 _XColumnsYRowsZSpeedWStrartFrameNormal;
			float4 _BaseMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXYL1;
			float4 _BumpMapL1_ST;
			float4 _BumpMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _BaseColorL1_ST;
			float4 _MetallicGlossMapMAHSL1_ST;
			float4 _ColorCubemap1;
			float2 _OffsetFBDetailsNormal;
			float _NormalWaveIntensity1;
			float _RotationAngle1;
			float _TilingWave1;
			float _TranslationSpeed1;
			float _BumpScaleL1;
			float _BumpScale;
			float _L3BlendContrast;
			float _TranslationSpeed2;
			float _TilingWave2;
			float _L0Displacement;
			float _NormalWaveIntensity2;
			float _AoIntensity;
			float _SmoothnessWet;
			float _GlossinessL1;
			float _Intensity;
			float _Size;
			float _Tiling;
			float _RotationAngle2;
			float _SplashSpeed;
			float _Metalness;
			float _MetallicL1;
			float _Metallic;
			float _ReflectionIntensity;
			float _BlurReflection;
			float _L3BlendAmount;
			float _Glossiness;
			float _L3ConstrainbyPaintedMask;
			float _ScaleFBDetailsNormal;
			float _DetailSaturation;
			float _L0Heightmapcontrast;
			float _L0HeightmapSpread;
			float _L1Displacement;
			float _L1Heightmapcontrast;
			float _L1HeightmapSpread;
			float _L1Displacement1;
			float _L3BlendOpacity;
			float _L3VisualizeHeightmap1;
			float _L1VisualizeHeightmap;
			float _L0VisualizeHeightmap;
			float _Brightness;
			float _Parallax;
			float _Saturation;
			float _BrightnessL1;
			float _ParallaxL1;
			float _SaturationL1;
			float _L1UseHeightmapDepth1;
			float _L1ConstrainbyPaintedMask;
			float _L1BlendAmount;
			float _L1BlendContrast;
			float _L1BlendOpacity;
			float _DetailBrightness;
			float _DuplicateTextureAtlasNormal;
			float _FlipBTilingNormal;
			float _IntensityScaleNormal1;
			float _AoIntensityL1;
			float _FBDetailsNormal;
			float _IntensityScaleNormal2;
			float _Distortion;
			float _L3UseHeightmapDepth1;
			float _AoWet;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MetallicGlossMapMAHS;
			sampler2D _MetallicGlossMapMAHSL1;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 uv_MetallicGlossMapMAHS = v.ase_texcoord.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2Dlod( _MetallicGlossMapMAHS, float4( ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float4 temp_cast_1 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_1 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VertexOffset605 = ( float4( ( v.normalOS * ( _L0Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1414 );
				float2 uv_MetallicGlossMapMAHSL1 = v.ase_texcoord.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2Dlod( _MetallicGlossMapMAHSL1, float4( ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float4 temp_cast_4 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_4 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VertexOffset613 = ( float4( ( v.normalOS * ( _L1Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1413 );
				float4 break106 = v.ase_color;
				float VertexG115 = break106.g;
				float L1Opacity950 = 0.0;
				float4 lerpResult619 = lerp( Layer0VertexOffset605 , Layer1VertexOffset613 , ( VertexG115 * L1Opacity950 ));
				float4 temp_cast_8 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_8 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VertexOffset869 = ( float4( ( v.normalOS * ( _L1Displacement1 / 10.0 ) ) , 0.0 ) * temp_output_10_0_g1415 );
				float VertexA117 = break106.a;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult905 = lerp( lerpResult619 , Layer3VertexOffset869 , ( VertexA117 * WetOpacity768 ));
				float4 VertexOffset621 = lerpResult905;
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset621.xyz;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.normalOS);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 positionCS = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					positionCS.z = min(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#else
					positionCS.z = max(positionCS.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 positionWS : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColorL1;
			float4 _BaseColor;
			float4 _ColorWet;
			float4 _PuddleMap_ST;
			float4 _WetTex_ST;
			float4 _XColumnsYRowsZSpeedWStrartFrameNormal;
			float4 _BaseMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXYL1;
			float4 _BumpMapL1_ST;
			float4 _BumpMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _BaseColorL1_ST;
			float4 _MetallicGlossMapMAHSL1_ST;
			float4 _ColorCubemap1;
			float2 _OffsetFBDetailsNormal;
			float _NormalWaveIntensity1;
			float _RotationAngle1;
			float _TilingWave1;
			float _TranslationSpeed1;
			float _BumpScaleL1;
			float _BumpScale;
			float _L3BlendContrast;
			float _TranslationSpeed2;
			float _TilingWave2;
			float _L0Displacement;
			float _NormalWaveIntensity2;
			float _AoIntensity;
			float _SmoothnessWet;
			float _GlossinessL1;
			float _Intensity;
			float _Size;
			float _Tiling;
			float _RotationAngle2;
			float _SplashSpeed;
			float _Metalness;
			float _MetallicL1;
			float _Metallic;
			float _ReflectionIntensity;
			float _BlurReflection;
			float _L3BlendAmount;
			float _Glossiness;
			float _L3ConstrainbyPaintedMask;
			float _ScaleFBDetailsNormal;
			float _DetailSaturation;
			float _L0Heightmapcontrast;
			float _L0HeightmapSpread;
			float _L1Displacement;
			float _L1Heightmapcontrast;
			float _L1HeightmapSpread;
			float _L1Displacement1;
			float _L3BlendOpacity;
			float _L3VisualizeHeightmap1;
			float _L1VisualizeHeightmap;
			float _L0VisualizeHeightmap;
			float _Brightness;
			float _Parallax;
			float _Saturation;
			float _BrightnessL1;
			float _ParallaxL1;
			float _SaturationL1;
			float _L1UseHeightmapDepth1;
			float _L1ConstrainbyPaintedMask;
			float _L1BlendAmount;
			float _L1BlendContrast;
			float _L1BlendOpacity;
			float _DetailBrightness;
			float _DuplicateTextureAtlasNormal;
			float _FlipBTilingNormal;
			float _IntensityScaleNormal1;
			float _AoIntensityL1;
			float _FBDetailsNormal;
			float _IntensityScaleNormal2;
			float _Distortion;
			float _L3UseHeightmapDepth1;
			float _AoWet;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MetallicGlossMapMAHS;
			sampler2D _MetallicGlossMapMAHSL1;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_MetallicGlossMapMAHS = v.ase_texcoord.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2Dlod( _MetallicGlossMapMAHS, float4( ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float4 temp_cast_1 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_1 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VertexOffset605 = ( float4( ( v.normalOS * ( _L0Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1414 );
				float2 uv_MetallicGlossMapMAHSL1 = v.ase_texcoord.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2Dlod( _MetallicGlossMapMAHSL1, float4( ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float4 temp_cast_4 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_4 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VertexOffset613 = ( float4( ( v.normalOS * ( _L1Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1413 );
				float4 break106 = v.ase_color;
				float VertexG115 = break106.g;
				float L1Opacity950 = 0.0;
				float4 lerpResult619 = lerp( Layer0VertexOffset605 , Layer1VertexOffset613 , ( VertexG115 * L1Opacity950 ));
				float4 temp_cast_8 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_8 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VertexOffset869 = ( float4( ( v.normalOS * ( _L1Displacement1 / 10.0 ) ) , 0.0 ) * temp_output_10_0_g1415 );
				float VertexA117 = break106.a;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult905 = lerp( lerpResult619 , Layer3VertexOffset869 , ( VertexA117 * WetOpacity768 ));
				float4 VertexOffset621 = lerpResult905;
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset621.xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _WETBASECOLOR_COLOR _WETBASECOLOR_WETMAP _WETBASECOLOR_BASELAYER _WETBASECOLOR_LAYER1
			#pragma shader_feature_local _DETAILWAVE_ON
			#pragma shader_feature_local _MAINWAVE_ON


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColorL1;
			float4 _BaseColor;
			float4 _ColorWet;
			float4 _PuddleMap_ST;
			float4 _WetTex_ST;
			float4 _XColumnsYRowsZSpeedWStrartFrameNormal;
			float4 _BaseMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXYL1;
			float4 _BumpMapL1_ST;
			float4 _BumpMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _BaseColorL1_ST;
			float4 _MetallicGlossMapMAHSL1_ST;
			float4 _ColorCubemap1;
			float2 _OffsetFBDetailsNormal;
			float _NormalWaveIntensity1;
			float _RotationAngle1;
			float _TilingWave1;
			float _TranslationSpeed1;
			float _BumpScaleL1;
			float _BumpScale;
			float _L3BlendContrast;
			float _TranslationSpeed2;
			float _TilingWave2;
			float _L0Displacement;
			float _NormalWaveIntensity2;
			float _AoIntensity;
			float _SmoothnessWet;
			float _GlossinessL1;
			float _Intensity;
			float _Size;
			float _Tiling;
			float _RotationAngle2;
			float _SplashSpeed;
			float _Metalness;
			float _MetallicL1;
			float _Metallic;
			float _ReflectionIntensity;
			float _BlurReflection;
			float _L3BlendAmount;
			float _Glossiness;
			float _L3ConstrainbyPaintedMask;
			float _ScaleFBDetailsNormal;
			float _DetailSaturation;
			float _L0Heightmapcontrast;
			float _L0HeightmapSpread;
			float _L1Displacement;
			float _L1Heightmapcontrast;
			float _L1HeightmapSpread;
			float _L1Displacement1;
			float _L3BlendOpacity;
			float _L3VisualizeHeightmap1;
			float _L1VisualizeHeightmap;
			float _L0VisualizeHeightmap;
			float _Brightness;
			float _Parallax;
			float _Saturation;
			float _BrightnessL1;
			float _ParallaxL1;
			float _SaturationL1;
			float _L1UseHeightmapDepth1;
			float _L1ConstrainbyPaintedMask;
			float _L1BlendAmount;
			float _L1BlendContrast;
			float _L1BlendOpacity;
			float _DetailBrightness;
			float _DuplicateTextureAtlasNormal;
			float _FlipBTilingNormal;
			float _IntensityScaleNormal1;
			float _AoIntensityL1;
			float _FBDetailsNormal;
			float _IntensityScaleNormal2;
			float _Distortion;
			float _L3UseHeightmapDepth1;
			float _AoWet;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MetallicGlossMapMAHS;
			sampler2D _MetallicGlossMapMAHSL1;
			sampler2D _BaseMap;
			sampler2D _BaseColorL1;
			sampler2D _WetTex;
			sampler2D _TextureAtlasNormal;
			samplerCUBE _Cubemap;
			sampler2D _BumpMap;
			sampler2D _BumpMapL1;
			sampler2D _PuddleMap;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_MetallicGlossMapMAHS = v.texcoord0.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2Dlod( _MetallicGlossMapMAHS, float4( ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float4 temp_cast_1 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_1 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VertexOffset605 = ( float4( ( v.normalOS * ( _L0Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1414 );
				float2 uv_MetallicGlossMapMAHSL1 = v.texcoord0.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2Dlod( _MetallicGlossMapMAHSL1, float4( ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float4 temp_cast_4 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_4 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VertexOffset613 = ( float4( ( v.normalOS * ( _L1Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1413 );
				float4 break106 = v.ase_color;
				float VertexG115 = break106.g;
				float L1Opacity950 = 0.0;
				float4 lerpResult619 = lerp( Layer0VertexOffset605 , Layer1VertexOffset613 , ( VertexG115 * L1Opacity950 ));
				float4 temp_cast_8 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_8 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VertexOffset869 = ( float4( ( v.normalOS * ( _L1Displacement1 / 10.0 ) ) , 0.0 ) * temp_output_10_0_g1415 );
				float VertexA117 = break106.a;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult905 = lerp( lerpResult619 , Layer3VertexOffset869 , ( VertexA117 * WetOpacity768 ));
				float4 VertexOffset621 = lerpResult905;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord5.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord6.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord7.xyz = ase_worldBitangent;
				
				o.ase_texcoord4.xyz = v.texcoord0.xyz;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset621.xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = positionWS;
				#endif

				o.positionCS = MetaVertexPosition( v.positionOS, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.positionOS.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , bool ase_vface : SV_IsFrontFace ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_BaseMap = IN.ase_texcoord4.xyz.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float2 break26_g1461 = uv_BaseMap;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1461 = (float2(( break26_g1461.x * L0GlobalTilingX150 ) , ( break26_g1461.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1461 = (float2(( break26_g1461.x + L0GlobalOffsetX151 ) , ( break26_g1461.y + L0GlobalOffsetY148 )));
				float2 uv_MetallicGlossMapMAHS = IN.ase_texcoord4.xyz.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2D( _MetallicGlossMapMAHS, ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ) );
				float3 ase_worldTangent = IN.ase_texcoord5.xyz;
				float3 ase_worldNormal = IN.ase_texcoord6.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord7.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset38_g1055 = ParallaxOffset( tex2DNode3_g1055.b , _Parallax , ase_tanViewDir );
				float2 switchResult37_g1055 = (((ase_vface>0)?(paralaxOffset38_g1055):(0.0)));
				float2 Layer0Parallax215 = switchResult37_g1055;
				float4 tex2DNode7_g1460 = tex2D( _BaseMap, ( ( appendResult14_g1461 + appendResult13_g1461 ) + Layer0Parallax215 ) );
				float4 lerpResult53_g1460 = lerp( _BaseColor , ( ( _BaseColor * tex2DNode7_g1460 ) * _BaseColor.a ) , _BaseColor.a);
				float clampResult27_g1460 = clamp( _Saturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1460 = lerpResult53_g1460.rgb;
				float desaturateDot29_g1460 = dot( desaturateInitialColor29_g1460, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1460 = lerp( desaturateInitialColor29_g1460, desaturateDot29_g1460.xxx, -clampResult27_g1460 );
				float4 Layer0BaseColor179 = CalculateContrast(_Brightness,float4( desaturateVar29_g1460 , 0.0 ));
				float2 uv_BaseColorL1 = IN.ase_texcoord4.xyz.xy * _BaseColorL1_ST.xy + _BaseColorL1_ST.zw;
				float2 break26_g1396 = uv_BaseColorL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1396 = (float2(( break26_g1396.x * L1GlobalTilingX234 ) , ( break26_g1396.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1396 = (float2(( break26_g1396.x + L1GlobalOffsetX236 ) , ( break26_g1396.y + L1GlobalOffsetY237 )));
				float2 uv_MetallicGlossMapMAHSL1 = IN.ase_texcoord4.xyz.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2D( _MetallicGlossMapMAHSL1, ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ) );
				float2 paralaxOffset38_g1057 = ParallaxOffset( tex2DNode3_g1057.b , _ParallaxL1 , ase_tanViewDir );
				float2 switchResult37_g1057 = (((ase_vface>0)?(paralaxOffset38_g1057):(0.0)));
				float2 Layer1Parallax247 = switchResult37_g1057;
				float4 tex2DNode7_g1395 = tex2D( _BaseColorL1, ( ( appendResult14_g1396 + appendResult13_g1396 ) + Layer1Parallax247 ) );
				float clampResult27_g1395 = clamp( _SaturationL1 , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1395 = ( _ColorL1 * tex2DNode7_g1395 ).rgb;
				float desaturateDot29_g1395 = dot( desaturateInitialColor29_g1395, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1395 = lerp( desaturateInitialColor29_g1395, desaturateDot29_g1395.xxx, -clampResult27_g1395 );
				float4 Layer1BaseColor261 = CalculateContrast(_BrightnessL1,float4( desaturateVar29_g1395 , 0.0 ));
				float4 break106 = IN.ase_color;
				float VertexG115 = break106.g;
				float temp_output_21_0_g1411 = VertexG115;
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float temp_output_49_0_g1411 = ( _L1BlendContrast - 1.5 );
				float clampResult11_g1411 = clamp( ( ( _L1BlendAmount - 2.37 ) + (( 1.0 + temp_output_49_0_g1411 ) + (Layer0Heightmap336 - 0.0) * (-temp_output_49_0_g1411 - ( 1.0 + temp_output_49_0_g1411 )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
				float blendOpSrc18_g1411 = clampResult11_g1411;
				float blendOpDest18_g1411 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g1411 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
				float blendOpSrc31_g1411 = (( _L1ConstrainbyPaintedMask )?( ( saturate( ( blendOpSrc18_g1411 * blendOpDest18_g1411 ) )) ):( clampResult11_g1411 ));
				float blendOpDest31_g1411 = temp_output_21_0_g1411;
				float VertexGHeightmap352 = ( (( _L1UseHeightmapDepth1 )?( ( saturate( ( blendOpSrc31_g1411 + blendOpDest31_g1411 ) )) ):( temp_output_21_0_g1411 )) * _L1BlendOpacity );
				float4 lerpResult99 = lerp( Layer0BaseColor179 , Layer1BaseColor261 , VertexGHeightmap352);
				float4 temp_cast_4 = (1.0).xxxx;
				float2 uv_WetTex = IN.ase_texcoord4.xyz.xy * _WetTex_ST.xy + _WetTex_ST.zw;
				float FlipBookTiling100_g1350 = _FlipBTilingNormal;
				float2 temp_cast_5 = (FlipBookTiling100_g1350).xx;
				float2 texCoord114_g1350 = IN.ase_texcoord4.xyz.xy * temp_cast_5 + float2( 0,0 );
				float2 appendResult124_g1350 = (float2(frac( texCoord114_g1350.x ) , frac( texCoord114_g1350.y )));
				float XColumns119_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.x;
				float YRows118_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.y;
				float ZSpeed121_g1350 = ( ( _XColumnsYRowsZSpeedWStrartFrameNormal.x * _XColumnsYRowsZSpeedWStrartFrameNormal.y ) * _XColumnsYRowsZSpeedWStrartFrameNormal.z );
				float WStrartFrame122_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.w;
				// *** BEGIN Flipbook UV Animation vars ***
				// Total tiles of Flipbook Texture
				float fbtotaltiles130_g1350 = XColumns119_g1350 * YRows118_g1350;
				// Offsets for cols and rows of Flipbook Texture
				float fbcolsoffset130_g1350 = 1.0f / XColumns119_g1350;
				float fbrowsoffset130_g1350 = 1.0f / YRows118_g1350;
				// Speed of animation
				float fbspeed130_g1350 = _Time[ 1 ] * ZSpeed121_g1350;
				// UV Tiling (col and row offset)
				float2 fbtiling130_g1350 = float2(fbcolsoffset130_g1350, fbrowsoffset130_g1350);
				// UV Offset - calculate current tile linear index, and convert it to (X * coloffset, Y * rowoffset)
				// Calculate current tile linear index
				float fbcurrenttileindex130_g1350 = round( fmod( fbspeed130_g1350 + WStrartFrame122_g1350, fbtotaltiles130_g1350) );
				fbcurrenttileindex130_g1350 += ( fbcurrenttileindex130_g1350 < 0) ? fbtotaltiles130_g1350 : 0;
				// Obtain Offset X coordinate from current tile linear index
				float fblinearindextox130_g1350 = round ( fmod ( fbcurrenttileindex130_g1350, XColumns119_g1350 ) );
				// Multiply Offset X by coloffset
				float fboffsetx130_g1350 = fblinearindextox130_g1350 * fbcolsoffset130_g1350;
				// Obtain Offset Y coordinate from current tile linear index
				float fblinearindextoy130_g1350 = round( fmod( ( fbcurrenttileindex130_g1350 - fblinearindextox130_g1350 ) / XColumns119_g1350, YRows118_g1350 ) );
				// Reverse Y to get tiles from Top to Bottom
				fblinearindextoy130_g1350 = (int)(YRows118_g1350-1) - fblinearindextoy130_g1350;
				// Multiply Offset Y by rowoffset
				float fboffsety130_g1350 = fblinearindextoy130_g1350 * fbrowsoffset130_g1350;
				// UV Offset
				float2 fboffset130_g1350 = float2(fboffsetx130_g1350, fboffsety130_g1350);
				// Flipbook UV
				half2 fbuv130_g1350 = appendResult124_g1350 * fbtiling130_g1350 + fboffset130_g1350;
				// *** END Flipbook UV Animation vars ***
				float3 unpack132_g1350 = UnpackNormalScale( tex2D( _TextureAtlasNormal, fbuv130_g1350 ), _IntensityScaleNormal1 );
				unpack132_g1350.z = lerp( 1, unpack132_g1350.z, saturate(_IntensityScaleNormal1) );
				float3 tex2DNode132_g1350 = unpack132_g1350;
				float2 temp_cast_6 = (( FlipBookTiling100_g1350 / _ScaleFBDetailsNormal )).xx;
				float2 texCoord105_g1350 = IN.ase_texcoord4.xyz.xy * temp_cast_6 + _OffsetFBDetailsNormal;
				float cos111_g1350 = cos( _FBDetailsNormal );
				float sin111_g1350 = sin( _FBDetailsNormal );
				float2 rotator111_g1350 = mul( texCoord105_g1350 - float2( 0.5,0.5 ) , float2x2( cos111_g1350 , -sin111_g1350 , sin111_g1350 , cos111_g1350 )) + float2( 0.5,0.5 );
				float2 break112_g1350 = rotator111_g1350;
				float2 appendResult123_g1350 = (float2(frac( break112_g1350.x ) , frac( break112_g1350.y )));
				float fbtotaltiles129_g1350 = XColumns119_g1350 * YRows118_g1350;
				float fbcolsoffset129_g1350 = 1.0f / XColumns119_g1350;
				float fbrowsoffset129_g1350 = 1.0f / YRows118_g1350;
				float fbspeed129_g1350 = _Time[ 1 ] * ZSpeed121_g1350;
				float2 fbtiling129_g1350 = float2(fbcolsoffset129_g1350, fbrowsoffset129_g1350);
				float fbcurrenttileindex129_g1350 = round( fmod( fbspeed129_g1350 + WStrartFrame122_g1350, fbtotaltiles129_g1350) );
				fbcurrenttileindex129_g1350 += ( fbcurrenttileindex129_g1350 < 0) ? fbtotaltiles129_g1350 : 0;
				float fblinearindextox129_g1350 = round ( fmod ( fbcurrenttileindex129_g1350, XColumns119_g1350 ) );
				float fboffsetx129_g1350 = fblinearindextox129_g1350 * fbcolsoffset129_g1350;
				float fblinearindextoy129_g1350 = round( fmod( ( fbcurrenttileindex129_g1350 - fblinearindextox129_g1350 ) / XColumns119_g1350, YRows118_g1350 ) );
				fblinearindextoy129_g1350 = (int)(YRows118_g1350-1) - fblinearindextoy129_g1350;
				float fboffsety129_g1350 = fblinearindextoy129_g1350 * fbrowsoffset129_g1350;
				float2 fboffset129_g1350 = float2(fboffsetx129_g1350, fboffsety129_g1350);
				half2 fbuv129_g1350 = appendResult123_g1350 * fbtiling129_g1350 + fboffset129_g1350;
				float3 unpack134_g1350 = UnpackNormalScale( tex2D( _TextureAtlasNormal, fbuv129_g1350 ), _IntensityScaleNormal2 );
				unpack134_g1350.z = lerp( 1, unpack134_g1350.z, saturate(_IntensityScaleNormal2) );
				float3 RainDotsNormal976 = (( _DuplicateTextureAtlasNormal )?( BlendNormal( tex2DNode132_g1350 , unpack134_g1350 ) ):( tex2DNode132_g1350 ));
				float2 temp_cast_8 = (_Distortion).xx;
				float4 tex2DNode44_g1409 = tex2D( _WetTex, ( uv_WetTex + ( RainDotsNormal976.xy * temp_cast_8 ) ) );
				float clampResult27_g1409 = clamp( _DetailSaturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1409 = tex2DNode44_g1409.rgb;
				float desaturateDot29_g1409 = dot( desaturateInitialColor29_g1409, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1409 = lerp( desaturateInitialColor29_g1409, desaturateDot29_g1409.xxx, -clampResult27_g1409 );
				#if defined(_WETBASECOLOR_COLOR)
				float4 staticSwitch767 = temp_cast_4;
				#elif defined(_WETBASECOLOR_WETMAP)
				float4 staticSwitch767 = CalculateContrast(_DetailBrightness,float4( desaturateVar29_g1409 , 0.0 ));
				#elif defined(_WETBASECOLOR_BASELAYER)
				float4 staticSwitch767 = Layer0BaseColor179;
				#elif defined(_WETBASECOLOR_LAYER1)
				float4 staticSwitch767 = Layer1BaseColor261;
				#else
				float4 staticSwitch767 = Layer0BaseColor179;
				#endif
				float4 Layer3BaseColor786 = ( _ColorWet * staticSwitch767 );
				float VertexA117 = break106.a;
				float temp_output_21_0_g1410 = VertexA117;
				float temp_output_61_0_g1410 = ( _L3BlendAmount - 2.37 );
				float lerpResult50_g1410 = lerp( temp_output_61_0_g1410 , ( temp_output_61_0_g1410 - 2.0 ) , VertexG115);
				float VertexB116 = break106.b;
				float lerpResult55_g1410 = lerp( lerpResult50_g1410 , -1.0 , VertexB116);
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float lerpResult876 = lerp( ( Layer0Heightmap336 * ( 1.0 - VertexG115 ) ) , Layer1Heightmap510 , VertexG115);
				float temp_output_817_0 = ( lerpResult876 * ( 1.0 - VertexB116 ) );
				float temp_output_63_0_g1410 = ( _L3BlendContrast - 1.5 );
				float clampResult11_g1410 = clamp( ( lerpResult55_g1410 + (( 1.0 + temp_output_63_0_g1410 ) + (temp_output_817_0 - 0.0) * (-temp_output_63_0_g1410 - ( 1.0 + temp_output_63_0_g1410 )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
				float blendOpSrc18_g1410 = clampResult11_g1410;
				float blendOpDest18_g1410 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g1410 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
				float blendOpSrc31_g1410 = (( _L3ConstrainbyPaintedMask )?( ( saturate( ( blendOpSrc18_g1410 * blendOpDest18_g1410 ) )) ):( clampResult11_g1410 ));
				float blendOpDest31_g1410 = temp_output_21_0_g1410;
				float temp_output_929_0 = (( _L3UseHeightmapDepth1 )?( ( saturate( ( blendOpSrc31_g1410 + blendOpDest31_g1410 ) )) ):( temp_output_21_0_g1410 ));
				float VertexAHeightmap799 = temp_output_929_0;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult101 = lerp( lerpResult99 , Layer3BaseColor786 , ( VertexAHeightmap799 * WetOpacity768 ));
				float4 BaseColor121 = lerpResult101;
				float4 temp_cast_11 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_11 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VisHeightmap579 = temp_output_8_0_g1414;
				float VertexR114 = break106.r;
				float4 temp_cast_13 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_13 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VisHeightmap612 = temp_output_8_0_g1413;
				float4 temp_cast_16 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_16 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VisHeightmap868 = temp_output_10_0_g1415;
				
				float2 uv_BumpMap = IN.ase_texcoord4.xyz.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				float2 break26_g1463 = uv_BumpMap;
				float2 appendResult14_g1463 = (float2(( break26_g1463.x * L0GlobalTilingX150 ) , ( break26_g1463.y * L0GlobalTilingY149 )));
				float2 appendResult13_g1463 = (float2(( break26_g1463.x + L0GlobalOffsetX151 ) , ( break26_g1463.y + L0GlobalOffsetY148 )));
				float3 unpack4_g1462 = UnpackNormalScale( tex2D( _BumpMap, ( ( appendResult14_g1463 + appendResult13_g1463 ) + Layer0Parallax215 ) ), _BumpScale );
				unpack4_g1462.z = lerp( 1, unpack4_g1462.z, saturate(_BumpScale) );
				float3 tex2DNode4_g1462 = unpack4_g1462;
				float3 Layer0Normal193 = tex2DNode4_g1462;
				float2 uv_BumpMapL1 = IN.ase_texcoord4.xyz.xy * _BumpMapL1_ST.xy + _BumpMapL1_ST.zw;
				float2 break26_g1429 = uv_BumpMapL1;
				float2 appendResult14_g1429 = (float2(( break26_g1429.x * L1GlobalTilingX234 ) , ( break26_g1429.y * L1GlobalTilingY235 )));
				float2 appendResult13_g1429 = (float2(( break26_g1429.x + L1GlobalOffsetX236 ) , ( break26_g1429.y + L1GlobalOffsetY237 )));
				float3 unpack4_g1428 = UnpackNormalScale( tex2D( _BumpMapL1, ( ( appendResult14_g1429 + appendResult13_g1429 ) + Layer1Parallax247 ) ), _BumpScaleL1 );
				unpack4_g1428.z = lerp( 1, unpack4_g1428.z, saturate(_BumpScaleL1) );
				float3 tex2DNode4_g1428 = unpack4_g1428;
				float3 Layer1Normal260 = tex2DNode4_g1428;
				float3 lerpResult133 = lerp( Layer0Normal193 , Layer1Normal260 , VertexGHeightmap352);
				float2 temp_cast_18 = (_TranslationSpeed1).xx;
				float2 uv_PuddleMap = IN.ase_texcoord4.xyz.xy * _PuddleMap_ST.xy + _PuddleMap_ST.zw;
				float cos54_g1427 = cos( radians( _RotationAngle1 ) );
				float sin54_g1427 = sin( radians( _RotationAngle1 ) );
				float2 rotator54_g1427 = mul( ( uv_PuddleMap * _TilingWave1 ) - float2( 0.5,0.5 ) , float2x2( cos54_g1427 , -sin54_g1427 , sin54_g1427 , cos54_g1427 )) + float2( 0.5,0.5 );
				float2 panner86_g1427 = ( ( _TimeParameters.x * 0.05 ) * temp_cast_18 + rotator54_g1427);
				float3 unpack107_g1427 = UnpackNormalScale( tex2D( _PuddleMap, panner86_g1427 ), _NormalWaveIntensity1 );
				unpack107_g1427.z = lerp( 1, unpack107_g1427.z, saturate(_NormalWaveIntensity1) );
				#ifdef _MAINWAVE_ON
				float3 staticSwitch109_g1427 = unpack107_g1427;
				#else
				float3 staticSwitch109_g1427 = float3(0,0,1);
				#endif
				float2 temp_cast_19 = (_TranslationSpeed2).xx;
				float cos83_g1427 = cos( radians( _RotationAngle2 ) );
				float sin83_g1427 = sin( radians( _RotationAngle2 ) );
				float2 rotator83_g1427 = mul( ( uv_PuddleMap * _TilingWave2 ) - float2( 0.5,0.5 ) , float2x2( cos83_g1427 , -sin83_g1427 , sin83_g1427 , cos83_g1427 )) + float2( 0.5,0.5 );
				float2 panner88_g1427 = ( ( _TimeParameters.x * 0.05 ) * temp_cast_19 + rotator83_g1427);
				float3 unpack108_g1427 = UnpackNormalScale( tex2D( _PuddleMap, panner88_g1427 ), _NormalWaveIntensity2 );
				unpack108_g1427.z = lerp( 1, unpack108_g1427.z, saturate(_NormalWaveIntensity2) );
				#ifdef _DETAILWAVE_ON
				float3 staticSwitch56_g1427 = BlendNormal( staticSwitch109_g1427 , unpack108_g1427 );
				#else
				float3 staticSwitch56_g1427 = staticSwitch109_g1427;
				#endif
				float3 lerpResult128 = lerp( lerpResult133 , BlendNormal( staticSwitch56_g1427 , RainDotsNormal976 ) , ( VertexAHeightmap799 * WetOpacity768 ));
				float3 Normal129 = lerpResult128;
				float3 worldRefl28_g1430 = normalize( reflect( -ase_worldViewDir, float3( dot( tanToWorld0, Normal129 ), dot( tanToWorld1, Normal129 ), dot( tanToWorld2, Normal129 ) ) ) );
				float4 texCUBENode27_g1430 = texCUBElod( _Cubemap, float4( worldRefl28_g1430, _BlurReflection) );
				float clampResult39_g1430 = clamp( _ReflectionIntensity , 0.0 , 100.0 );
				float4 temp_cast_20 = (1.0).xxxx;
				float4 lerpResult704 = lerp( ( BaseColor121 * 0.0 ) , ( ( texCUBENode27_g1430 * ( texCUBENode27_g1430.a * clampResult39_g1430 ) * _ColorCubemap1 ) * temp_cast_20 ) , VertexA117);
				float4 Cubemap742 = ( lerpResult704 * WetOpacity768 );
				

				float3 BaseColor = (( _L3VisualizeHeightmap1 )?( Layer3VisHeightmap868 ):( (( _L1VisualizeHeightmap )?( ( Layer1VisHeightmap612 * VertexG115 ) ):( (( _L0VisualizeHeightmap )?( ( Layer0VisHeightmap579 * VertexR114 ) ):( BaseColor121 )) )) )).xyz;
				float3 Emission = Cubemap742.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _WETBASECOLOR_COLOR _WETBASECOLOR_WETMAP _WETBASECOLOR_BASELAYER _WETBASECOLOR_LAYER1


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColorL1;
			float4 _BaseColor;
			float4 _ColorWet;
			float4 _PuddleMap_ST;
			float4 _WetTex_ST;
			float4 _XColumnsYRowsZSpeedWStrartFrameNormal;
			float4 _BaseMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXYL1;
			float4 _BumpMapL1_ST;
			float4 _BumpMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _BaseColorL1_ST;
			float4 _MetallicGlossMapMAHSL1_ST;
			float4 _ColorCubemap1;
			float2 _OffsetFBDetailsNormal;
			float _NormalWaveIntensity1;
			float _RotationAngle1;
			float _TilingWave1;
			float _TranslationSpeed1;
			float _BumpScaleL1;
			float _BumpScale;
			float _L3BlendContrast;
			float _TranslationSpeed2;
			float _TilingWave2;
			float _L0Displacement;
			float _NormalWaveIntensity2;
			float _AoIntensity;
			float _SmoothnessWet;
			float _GlossinessL1;
			float _Intensity;
			float _Size;
			float _Tiling;
			float _RotationAngle2;
			float _SplashSpeed;
			float _Metalness;
			float _MetallicL1;
			float _Metallic;
			float _ReflectionIntensity;
			float _BlurReflection;
			float _L3BlendAmount;
			float _Glossiness;
			float _L3ConstrainbyPaintedMask;
			float _ScaleFBDetailsNormal;
			float _DetailSaturation;
			float _L0Heightmapcontrast;
			float _L0HeightmapSpread;
			float _L1Displacement;
			float _L1Heightmapcontrast;
			float _L1HeightmapSpread;
			float _L1Displacement1;
			float _L3BlendOpacity;
			float _L3VisualizeHeightmap1;
			float _L1VisualizeHeightmap;
			float _L0VisualizeHeightmap;
			float _Brightness;
			float _Parallax;
			float _Saturation;
			float _BrightnessL1;
			float _ParallaxL1;
			float _SaturationL1;
			float _L1UseHeightmapDepth1;
			float _L1ConstrainbyPaintedMask;
			float _L1BlendAmount;
			float _L1BlendContrast;
			float _L1BlendOpacity;
			float _DetailBrightness;
			float _DuplicateTextureAtlasNormal;
			float _FlipBTilingNormal;
			float _IntensityScaleNormal1;
			float _AoIntensityL1;
			float _FBDetailsNormal;
			float _IntensityScaleNormal2;
			float _Distortion;
			float _L3UseHeightmapDepth1;
			float _AoWet;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MetallicGlossMapMAHS;
			sampler2D _MetallicGlossMapMAHSL1;
			sampler2D _BaseMap;
			sampler2D _BaseColorL1;
			sampler2D _WetTex;
			sampler2D _TextureAtlasNormal;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 uv_MetallicGlossMapMAHS = v.ase_texcoord.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2Dlod( _MetallicGlossMapMAHS, float4( ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float4 temp_cast_1 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_1 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VertexOffset605 = ( float4( ( v.normalOS * ( _L0Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1414 );
				float2 uv_MetallicGlossMapMAHSL1 = v.ase_texcoord.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2Dlod( _MetallicGlossMapMAHSL1, float4( ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float4 temp_cast_4 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_4 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VertexOffset613 = ( float4( ( v.normalOS * ( _L1Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1413 );
				float4 break106 = v.ase_color;
				float VertexG115 = break106.g;
				float L1Opacity950 = 0.0;
				float4 lerpResult619 = lerp( Layer0VertexOffset605 , Layer1VertexOffset613 , ( VertexG115 * L1Opacity950 ));
				float4 temp_cast_8 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_8 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VertexOffset869 = ( float4( ( v.normalOS * ( _L1Displacement1 / 10.0 ) ) , 0.0 ) * temp_output_10_0_g1415 );
				float VertexA117 = break106.a;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult905 = lerp( lerpResult619 , Layer3VertexOffset869 , ( VertexA117 * WetOpacity768 ));
				float4 VertexOffset621 = lerpResult905;
				
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord3.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				o.ase_texcoord4.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset621.xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , bool ase_vface : SV_IsFrontFace ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_BaseMap = IN.ase_texcoord2.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float2 break26_g1461 = uv_BaseMap;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1461 = (float2(( break26_g1461.x * L0GlobalTilingX150 ) , ( break26_g1461.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1461 = (float2(( break26_g1461.x + L0GlobalOffsetX151 ) , ( break26_g1461.y + L0GlobalOffsetY148 )));
				float2 uv_MetallicGlossMapMAHS = IN.ase_texcoord2.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2D( _MetallicGlossMapMAHS, ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ) );
				float3 ase_worldTangent = IN.ase_texcoord3.xyz;
				float3 ase_worldNormal = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset38_g1055 = ParallaxOffset( tex2DNode3_g1055.b , _Parallax , ase_tanViewDir );
				float2 switchResult37_g1055 = (((ase_vface>0)?(paralaxOffset38_g1055):(0.0)));
				float2 Layer0Parallax215 = switchResult37_g1055;
				float4 tex2DNode7_g1460 = tex2D( _BaseMap, ( ( appendResult14_g1461 + appendResult13_g1461 ) + Layer0Parallax215 ) );
				float4 lerpResult53_g1460 = lerp( _BaseColor , ( ( _BaseColor * tex2DNode7_g1460 ) * _BaseColor.a ) , _BaseColor.a);
				float clampResult27_g1460 = clamp( _Saturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1460 = lerpResult53_g1460.rgb;
				float desaturateDot29_g1460 = dot( desaturateInitialColor29_g1460, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1460 = lerp( desaturateInitialColor29_g1460, desaturateDot29_g1460.xxx, -clampResult27_g1460 );
				float4 Layer0BaseColor179 = CalculateContrast(_Brightness,float4( desaturateVar29_g1460 , 0.0 ));
				float2 uv_BaseColorL1 = IN.ase_texcoord2.xy * _BaseColorL1_ST.xy + _BaseColorL1_ST.zw;
				float2 break26_g1396 = uv_BaseColorL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1396 = (float2(( break26_g1396.x * L1GlobalTilingX234 ) , ( break26_g1396.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1396 = (float2(( break26_g1396.x + L1GlobalOffsetX236 ) , ( break26_g1396.y + L1GlobalOffsetY237 )));
				float2 uv_MetallicGlossMapMAHSL1 = IN.ase_texcoord2.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2D( _MetallicGlossMapMAHSL1, ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ) );
				float2 paralaxOffset38_g1057 = ParallaxOffset( tex2DNode3_g1057.b , _ParallaxL1 , ase_tanViewDir );
				float2 switchResult37_g1057 = (((ase_vface>0)?(paralaxOffset38_g1057):(0.0)));
				float2 Layer1Parallax247 = switchResult37_g1057;
				float4 tex2DNode7_g1395 = tex2D( _BaseColorL1, ( ( appendResult14_g1396 + appendResult13_g1396 ) + Layer1Parallax247 ) );
				float clampResult27_g1395 = clamp( _SaturationL1 , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1395 = ( _ColorL1 * tex2DNode7_g1395 ).rgb;
				float desaturateDot29_g1395 = dot( desaturateInitialColor29_g1395, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1395 = lerp( desaturateInitialColor29_g1395, desaturateDot29_g1395.xxx, -clampResult27_g1395 );
				float4 Layer1BaseColor261 = CalculateContrast(_BrightnessL1,float4( desaturateVar29_g1395 , 0.0 ));
				float4 break106 = IN.ase_color;
				float VertexG115 = break106.g;
				float temp_output_21_0_g1411 = VertexG115;
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float temp_output_49_0_g1411 = ( _L1BlendContrast - 1.5 );
				float clampResult11_g1411 = clamp( ( ( _L1BlendAmount - 2.37 ) + (( 1.0 + temp_output_49_0_g1411 ) + (Layer0Heightmap336 - 0.0) * (-temp_output_49_0_g1411 - ( 1.0 + temp_output_49_0_g1411 )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
				float blendOpSrc18_g1411 = clampResult11_g1411;
				float blendOpDest18_g1411 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g1411 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
				float blendOpSrc31_g1411 = (( _L1ConstrainbyPaintedMask )?( ( saturate( ( blendOpSrc18_g1411 * blendOpDest18_g1411 ) )) ):( clampResult11_g1411 ));
				float blendOpDest31_g1411 = temp_output_21_0_g1411;
				float VertexGHeightmap352 = ( (( _L1UseHeightmapDepth1 )?( ( saturate( ( blendOpSrc31_g1411 + blendOpDest31_g1411 ) )) ):( temp_output_21_0_g1411 )) * _L1BlendOpacity );
				float4 lerpResult99 = lerp( Layer0BaseColor179 , Layer1BaseColor261 , VertexGHeightmap352);
				float4 temp_cast_4 = (1.0).xxxx;
				float2 uv_WetTex = IN.ase_texcoord2.xy * _WetTex_ST.xy + _WetTex_ST.zw;
				float FlipBookTiling100_g1350 = _FlipBTilingNormal;
				float2 temp_cast_5 = (FlipBookTiling100_g1350).xx;
				float2 texCoord114_g1350 = IN.ase_texcoord2.xy * temp_cast_5 + float2( 0,0 );
				float2 appendResult124_g1350 = (float2(frac( texCoord114_g1350.x ) , frac( texCoord114_g1350.y )));
				float XColumns119_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.x;
				float YRows118_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.y;
				float ZSpeed121_g1350 = ( ( _XColumnsYRowsZSpeedWStrartFrameNormal.x * _XColumnsYRowsZSpeedWStrartFrameNormal.y ) * _XColumnsYRowsZSpeedWStrartFrameNormal.z );
				float WStrartFrame122_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.w;
				// *** BEGIN Flipbook UV Animation vars ***
				// Total tiles of Flipbook Texture
				float fbtotaltiles130_g1350 = XColumns119_g1350 * YRows118_g1350;
				// Offsets for cols and rows of Flipbook Texture
				float fbcolsoffset130_g1350 = 1.0f / XColumns119_g1350;
				float fbrowsoffset130_g1350 = 1.0f / YRows118_g1350;
				// Speed of animation
				float fbspeed130_g1350 = _Time[ 1 ] * ZSpeed121_g1350;
				// UV Tiling (col and row offset)
				float2 fbtiling130_g1350 = float2(fbcolsoffset130_g1350, fbrowsoffset130_g1350);
				// UV Offset - calculate current tile linear index, and convert it to (X * coloffset, Y * rowoffset)
				// Calculate current tile linear index
				float fbcurrenttileindex130_g1350 = round( fmod( fbspeed130_g1350 + WStrartFrame122_g1350, fbtotaltiles130_g1350) );
				fbcurrenttileindex130_g1350 += ( fbcurrenttileindex130_g1350 < 0) ? fbtotaltiles130_g1350 : 0;
				// Obtain Offset X coordinate from current tile linear index
				float fblinearindextox130_g1350 = round ( fmod ( fbcurrenttileindex130_g1350, XColumns119_g1350 ) );
				// Multiply Offset X by coloffset
				float fboffsetx130_g1350 = fblinearindextox130_g1350 * fbcolsoffset130_g1350;
				// Obtain Offset Y coordinate from current tile linear index
				float fblinearindextoy130_g1350 = round( fmod( ( fbcurrenttileindex130_g1350 - fblinearindextox130_g1350 ) / XColumns119_g1350, YRows118_g1350 ) );
				// Reverse Y to get tiles from Top to Bottom
				fblinearindextoy130_g1350 = (int)(YRows118_g1350-1) - fblinearindextoy130_g1350;
				// Multiply Offset Y by rowoffset
				float fboffsety130_g1350 = fblinearindextoy130_g1350 * fbrowsoffset130_g1350;
				// UV Offset
				float2 fboffset130_g1350 = float2(fboffsetx130_g1350, fboffsety130_g1350);
				// Flipbook UV
				half2 fbuv130_g1350 = appendResult124_g1350 * fbtiling130_g1350 + fboffset130_g1350;
				// *** END Flipbook UV Animation vars ***
				float3 unpack132_g1350 = UnpackNormalScale( tex2D( _TextureAtlasNormal, fbuv130_g1350 ), _IntensityScaleNormal1 );
				unpack132_g1350.z = lerp( 1, unpack132_g1350.z, saturate(_IntensityScaleNormal1) );
				float3 tex2DNode132_g1350 = unpack132_g1350;
				float2 temp_cast_6 = (( FlipBookTiling100_g1350 / _ScaleFBDetailsNormal )).xx;
				float2 texCoord105_g1350 = IN.ase_texcoord2.xy * temp_cast_6 + _OffsetFBDetailsNormal;
				float cos111_g1350 = cos( _FBDetailsNormal );
				float sin111_g1350 = sin( _FBDetailsNormal );
				float2 rotator111_g1350 = mul( texCoord105_g1350 - float2( 0.5,0.5 ) , float2x2( cos111_g1350 , -sin111_g1350 , sin111_g1350 , cos111_g1350 )) + float2( 0.5,0.5 );
				float2 break112_g1350 = rotator111_g1350;
				float2 appendResult123_g1350 = (float2(frac( break112_g1350.x ) , frac( break112_g1350.y )));
				float fbtotaltiles129_g1350 = XColumns119_g1350 * YRows118_g1350;
				float fbcolsoffset129_g1350 = 1.0f / XColumns119_g1350;
				float fbrowsoffset129_g1350 = 1.0f / YRows118_g1350;
				float fbspeed129_g1350 = _Time[ 1 ] * ZSpeed121_g1350;
				float2 fbtiling129_g1350 = float2(fbcolsoffset129_g1350, fbrowsoffset129_g1350);
				float fbcurrenttileindex129_g1350 = round( fmod( fbspeed129_g1350 + WStrartFrame122_g1350, fbtotaltiles129_g1350) );
				fbcurrenttileindex129_g1350 += ( fbcurrenttileindex129_g1350 < 0) ? fbtotaltiles129_g1350 : 0;
				float fblinearindextox129_g1350 = round ( fmod ( fbcurrenttileindex129_g1350, XColumns119_g1350 ) );
				float fboffsetx129_g1350 = fblinearindextox129_g1350 * fbcolsoffset129_g1350;
				float fblinearindextoy129_g1350 = round( fmod( ( fbcurrenttileindex129_g1350 - fblinearindextox129_g1350 ) / XColumns119_g1350, YRows118_g1350 ) );
				fblinearindextoy129_g1350 = (int)(YRows118_g1350-1) - fblinearindextoy129_g1350;
				float fboffsety129_g1350 = fblinearindextoy129_g1350 * fbrowsoffset129_g1350;
				float2 fboffset129_g1350 = float2(fboffsetx129_g1350, fboffsety129_g1350);
				half2 fbuv129_g1350 = appendResult123_g1350 * fbtiling129_g1350 + fboffset129_g1350;
				float3 unpack134_g1350 = UnpackNormalScale( tex2D( _TextureAtlasNormal, fbuv129_g1350 ), _IntensityScaleNormal2 );
				unpack134_g1350.z = lerp( 1, unpack134_g1350.z, saturate(_IntensityScaleNormal2) );
				float3 RainDotsNormal976 = (( _DuplicateTextureAtlasNormal )?( BlendNormal( tex2DNode132_g1350 , unpack134_g1350 ) ):( tex2DNode132_g1350 ));
				float2 temp_cast_8 = (_Distortion).xx;
				float4 tex2DNode44_g1409 = tex2D( _WetTex, ( uv_WetTex + ( RainDotsNormal976.xy * temp_cast_8 ) ) );
				float clampResult27_g1409 = clamp( _DetailSaturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1409 = tex2DNode44_g1409.rgb;
				float desaturateDot29_g1409 = dot( desaturateInitialColor29_g1409, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1409 = lerp( desaturateInitialColor29_g1409, desaturateDot29_g1409.xxx, -clampResult27_g1409 );
				#if defined(_WETBASECOLOR_COLOR)
				float4 staticSwitch767 = temp_cast_4;
				#elif defined(_WETBASECOLOR_WETMAP)
				float4 staticSwitch767 = CalculateContrast(_DetailBrightness,float4( desaturateVar29_g1409 , 0.0 ));
				#elif defined(_WETBASECOLOR_BASELAYER)
				float4 staticSwitch767 = Layer0BaseColor179;
				#elif defined(_WETBASECOLOR_LAYER1)
				float4 staticSwitch767 = Layer1BaseColor261;
				#else
				float4 staticSwitch767 = Layer0BaseColor179;
				#endif
				float4 Layer3BaseColor786 = ( _ColorWet * staticSwitch767 );
				float VertexA117 = break106.a;
				float temp_output_21_0_g1410 = VertexA117;
				float temp_output_61_0_g1410 = ( _L3BlendAmount - 2.37 );
				float lerpResult50_g1410 = lerp( temp_output_61_0_g1410 , ( temp_output_61_0_g1410 - 2.0 ) , VertexG115);
				float VertexB116 = break106.b;
				float lerpResult55_g1410 = lerp( lerpResult50_g1410 , -1.0 , VertexB116);
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float lerpResult876 = lerp( ( Layer0Heightmap336 * ( 1.0 - VertexG115 ) ) , Layer1Heightmap510 , VertexG115);
				float temp_output_817_0 = ( lerpResult876 * ( 1.0 - VertexB116 ) );
				float temp_output_63_0_g1410 = ( _L3BlendContrast - 1.5 );
				float clampResult11_g1410 = clamp( ( lerpResult55_g1410 + (( 1.0 + temp_output_63_0_g1410 ) + (temp_output_817_0 - 0.0) * (-temp_output_63_0_g1410 - ( 1.0 + temp_output_63_0_g1410 )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
				float blendOpSrc18_g1410 = clampResult11_g1410;
				float blendOpDest18_g1410 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g1410 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
				float blendOpSrc31_g1410 = (( _L3ConstrainbyPaintedMask )?( ( saturate( ( blendOpSrc18_g1410 * blendOpDest18_g1410 ) )) ):( clampResult11_g1410 ));
				float blendOpDest31_g1410 = temp_output_21_0_g1410;
				float temp_output_929_0 = (( _L3UseHeightmapDepth1 )?( ( saturate( ( blendOpSrc31_g1410 + blendOpDest31_g1410 ) )) ):( temp_output_21_0_g1410 ));
				float VertexAHeightmap799 = temp_output_929_0;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult101 = lerp( lerpResult99 , Layer3BaseColor786 , ( VertexAHeightmap799 * WetOpacity768 ));
				float4 BaseColor121 = lerpResult101;
				float4 temp_cast_11 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_11 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VisHeightmap579 = temp_output_8_0_g1414;
				float VertexR114 = break106.r;
				float4 temp_cast_13 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_13 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VisHeightmap612 = temp_output_8_0_g1413;
				float4 temp_cast_16 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_16 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VisHeightmap868 = temp_output_10_0_g1415;
				

				float3 BaseColor = (( _L3VisualizeHeightmap1 )?( Layer3VisHeightmap868 ):( (( _L1VisualizeHeightmap )?( ( Layer1VisHeightmap612 * VertexG115 ) ):( (( _L0VisualizeHeightmap )?( ( Layer0VisHeightmap579 * VertexR114 ) ):( BaseColor121 )) )) )).xyz;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_VERT_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#pragma shader_feature_local _DETAILWAVE_ON
			#pragma shader_feature_local _MAINWAVE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 positionWS : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColorL1;
			float4 _BaseColor;
			float4 _ColorWet;
			float4 _PuddleMap_ST;
			float4 _WetTex_ST;
			float4 _XColumnsYRowsZSpeedWStrartFrameNormal;
			float4 _BaseMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXYL1;
			float4 _BumpMapL1_ST;
			float4 _BumpMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _BaseColorL1_ST;
			float4 _MetallicGlossMapMAHSL1_ST;
			float4 _ColorCubemap1;
			float2 _OffsetFBDetailsNormal;
			float _NormalWaveIntensity1;
			float _RotationAngle1;
			float _TilingWave1;
			float _TranslationSpeed1;
			float _BumpScaleL1;
			float _BumpScale;
			float _L3BlendContrast;
			float _TranslationSpeed2;
			float _TilingWave2;
			float _L0Displacement;
			float _NormalWaveIntensity2;
			float _AoIntensity;
			float _SmoothnessWet;
			float _GlossinessL1;
			float _Intensity;
			float _Size;
			float _Tiling;
			float _RotationAngle2;
			float _SplashSpeed;
			float _Metalness;
			float _MetallicL1;
			float _Metallic;
			float _ReflectionIntensity;
			float _BlurReflection;
			float _L3BlendAmount;
			float _Glossiness;
			float _L3ConstrainbyPaintedMask;
			float _ScaleFBDetailsNormal;
			float _DetailSaturation;
			float _L0Heightmapcontrast;
			float _L0HeightmapSpread;
			float _L1Displacement;
			float _L1Heightmapcontrast;
			float _L1HeightmapSpread;
			float _L1Displacement1;
			float _L3BlendOpacity;
			float _L3VisualizeHeightmap1;
			float _L1VisualizeHeightmap;
			float _L0VisualizeHeightmap;
			float _Brightness;
			float _Parallax;
			float _Saturation;
			float _BrightnessL1;
			float _ParallaxL1;
			float _SaturationL1;
			float _L1UseHeightmapDepth1;
			float _L1ConstrainbyPaintedMask;
			float _L1BlendAmount;
			float _L1BlendContrast;
			float _L1BlendOpacity;
			float _DetailBrightness;
			float _DuplicateTextureAtlasNormal;
			float _FlipBTilingNormal;
			float _IntensityScaleNormal1;
			float _AoIntensityL1;
			float _FBDetailsNormal;
			float _IntensityScaleNormal2;
			float _Distortion;
			float _L3UseHeightmapDepth1;
			float _AoWet;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MetallicGlossMapMAHS;
			sampler2D _MetallicGlossMapMAHSL1;
			sampler2D _BumpMap;
			sampler2D _BumpMapL1;
			sampler2D _PuddleMap;
			sampler2D _TextureAtlasNormal;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_MetallicGlossMapMAHS = v.ase_texcoord.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2Dlod( _MetallicGlossMapMAHS, float4( ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float4 temp_cast_1 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_1 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VertexOffset605 = ( float4( ( v.normalOS * ( _L0Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1414 );
				float2 uv_MetallicGlossMapMAHSL1 = v.ase_texcoord.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2Dlod( _MetallicGlossMapMAHSL1, float4( ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float4 temp_cast_4 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_4 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VertexOffset613 = ( float4( ( v.normalOS * ( _L1Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1413 );
				float4 break106 = v.ase_color;
				float VertexG115 = break106.g;
				float L1Opacity950 = 0.0;
				float4 lerpResult619 = lerp( Layer0VertexOffset605 , Layer1VertexOffset613 , ( VertexG115 * L1Opacity950 ));
				float4 temp_cast_8 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_8 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VertexOffset869 = ( float4( ( v.normalOS * ( _L1Displacement1 / 10.0 ) ) , 0.0 ) * temp_output_10_0_g1415 );
				float VertexA117 = break106.a;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult905 = lerp( lerpResult619 , Layer3VertexOffset869 , ( VertexA117 * WetOpacity768 ));
				float4 VertexOffset621 = lerpResult905;
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.normalOS);
				float3 ase_worldTangent = TransformObjectToWorldDir(v.tangentOS.xyz);
				float ase_vertexTangentSign = v.tangentOS.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				o.ase_texcoord6.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset621.xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );

				float3 normalWS = TransformObjectToWorldNormal( v.normalOS );
				float4 tangentWS = float4( TransformObjectToWorldDir( v.tangentOS.xyz ), v.tangentOS.w );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.positionWS = vertexInput.positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						, bool ase_vface : SV_IsFrontFace )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.positionWS;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_BumpMap = IN.ase_texcoord5.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				float2 break26_g1463 = uv_BumpMap;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1463 = (float2(( break26_g1463.x * L0GlobalTilingX150 ) , ( break26_g1463.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1463 = (float2(( break26_g1463.x + L0GlobalOffsetX151 ) , ( break26_g1463.y + L0GlobalOffsetY148 )));
				float2 uv_MetallicGlossMapMAHS = IN.ase_texcoord5.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2D( _MetallicGlossMapMAHS, ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ) );
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3 tanToWorld0 = float3( WorldTangent.xyz.x, ase_worldBitangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.xyz.y, ase_worldBitangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.xyz.z, ase_worldBitangent.z, WorldNormal.z );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float3 ase_tanViewDir =  tanToWorld0 * ase_worldViewDir.x + tanToWorld1 * ase_worldViewDir.y  + tanToWorld2 * ase_worldViewDir.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset38_g1055 = ParallaxOffset( tex2DNode3_g1055.b , _Parallax , ase_tanViewDir );
				float2 switchResult37_g1055 = (((ase_vface>0)?(paralaxOffset38_g1055):(0.0)));
				float2 Layer0Parallax215 = switchResult37_g1055;
				float3 unpack4_g1462 = UnpackNormalScale( tex2D( _BumpMap, ( ( appendResult14_g1463 + appendResult13_g1463 ) + Layer0Parallax215 ) ), _BumpScale );
				unpack4_g1462.z = lerp( 1, unpack4_g1462.z, saturate(_BumpScale) );
				float3 tex2DNode4_g1462 = unpack4_g1462;
				float3 Layer0Normal193 = tex2DNode4_g1462;
				float2 uv_BumpMapL1 = IN.ase_texcoord5.xy * _BumpMapL1_ST.xy + _BumpMapL1_ST.zw;
				float2 break26_g1429 = uv_BumpMapL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1429 = (float2(( break26_g1429.x * L1GlobalTilingX234 ) , ( break26_g1429.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1429 = (float2(( break26_g1429.x + L1GlobalOffsetX236 ) , ( break26_g1429.y + L1GlobalOffsetY237 )));
				float2 uv_MetallicGlossMapMAHSL1 = IN.ase_texcoord5.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2D( _MetallicGlossMapMAHSL1, ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ) );
				float2 paralaxOffset38_g1057 = ParallaxOffset( tex2DNode3_g1057.b , _ParallaxL1 , ase_tanViewDir );
				float2 switchResult37_g1057 = (((ase_vface>0)?(paralaxOffset38_g1057):(0.0)));
				float2 Layer1Parallax247 = switchResult37_g1057;
				float3 unpack4_g1428 = UnpackNormalScale( tex2D( _BumpMapL1, ( ( appendResult14_g1429 + appendResult13_g1429 ) + Layer1Parallax247 ) ), _BumpScaleL1 );
				unpack4_g1428.z = lerp( 1, unpack4_g1428.z, saturate(_BumpScaleL1) );
				float3 tex2DNode4_g1428 = unpack4_g1428;
				float3 Layer1Normal260 = tex2DNode4_g1428;
				float4 break106 = IN.ase_color;
				float VertexG115 = break106.g;
				float temp_output_21_0_g1411 = VertexG115;
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float temp_output_49_0_g1411 = ( _L1BlendContrast - 1.5 );
				float clampResult11_g1411 = clamp( ( ( _L1BlendAmount - 2.37 ) + (( 1.0 + temp_output_49_0_g1411 ) + (Layer0Heightmap336 - 0.0) * (-temp_output_49_0_g1411 - ( 1.0 + temp_output_49_0_g1411 )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
				float blendOpSrc18_g1411 = clampResult11_g1411;
				float blendOpDest18_g1411 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g1411 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
				float blendOpSrc31_g1411 = (( _L1ConstrainbyPaintedMask )?( ( saturate( ( blendOpSrc18_g1411 * blendOpDest18_g1411 ) )) ):( clampResult11_g1411 ));
				float blendOpDest31_g1411 = temp_output_21_0_g1411;
				float VertexGHeightmap352 = ( (( _L1UseHeightmapDepth1 )?( ( saturate( ( blendOpSrc31_g1411 + blendOpDest31_g1411 ) )) ):( temp_output_21_0_g1411 )) * _L1BlendOpacity );
				float3 lerpResult133 = lerp( Layer0Normal193 , Layer1Normal260 , VertexGHeightmap352);
				float2 temp_cast_0 = (_TranslationSpeed1).xx;
				float2 uv_PuddleMap = IN.ase_texcoord5.xy * _PuddleMap_ST.xy + _PuddleMap_ST.zw;
				float cos54_g1427 = cos( radians( _RotationAngle1 ) );
				float sin54_g1427 = sin( radians( _RotationAngle1 ) );
				float2 rotator54_g1427 = mul( ( uv_PuddleMap * _TilingWave1 ) - float2( 0.5,0.5 ) , float2x2( cos54_g1427 , -sin54_g1427 , sin54_g1427 , cos54_g1427 )) + float2( 0.5,0.5 );
				float2 panner86_g1427 = ( ( _TimeParameters.x * 0.05 ) * temp_cast_0 + rotator54_g1427);
				float3 unpack107_g1427 = UnpackNormalScale( tex2D( _PuddleMap, panner86_g1427 ), _NormalWaveIntensity1 );
				unpack107_g1427.z = lerp( 1, unpack107_g1427.z, saturate(_NormalWaveIntensity1) );
				#ifdef _MAINWAVE_ON
				float3 staticSwitch109_g1427 = unpack107_g1427;
				#else
				float3 staticSwitch109_g1427 = float3(0,0,1);
				#endif
				float2 temp_cast_1 = (_TranslationSpeed2).xx;
				float cos83_g1427 = cos( radians( _RotationAngle2 ) );
				float sin83_g1427 = sin( radians( _RotationAngle2 ) );
				float2 rotator83_g1427 = mul( ( uv_PuddleMap * _TilingWave2 ) - float2( 0.5,0.5 ) , float2x2( cos83_g1427 , -sin83_g1427 , sin83_g1427 , cos83_g1427 )) + float2( 0.5,0.5 );
				float2 panner88_g1427 = ( ( _TimeParameters.x * 0.05 ) * temp_cast_1 + rotator83_g1427);
				float3 unpack108_g1427 = UnpackNormalScale( tex2D( _PuddleMap, panner88_g1427 ), _NormalWaveIntensity2 );
				unpack108_g1427.z = lerp( 1, unpack108_g1427.z, saturate(_NormalWaveIntensity2) );
				#ifdef _DETAILWAVE_ON
				float3 staticSwitch56_g1427 = BlendNormal( staticSwitch109_g1427 , unpack108_g1427 );
				#else
				float3 staticSwitch56_g1427 = staticSwitch109_g1427;
				#endif
				float FlipBookTiling100_g1350 = _FlipBTilingNormal;
				float2 temp_cast_2 = (FlipBookTiling100_g1350).xx;
				float2 texCoord114_g1350 = IN.ase_texcoord5.xy * temp_cast_2 + float2( 0,0 );
				float2 appendResult124_g1350 = (float2(frac( texCoord114_g1350.x ) , frac( texCoord114_g1350.y )));
				float XColumns119_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.x;
				float YRows118_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.y;
				float ZSpeed121_g1350 = ( ( _XColumnsYRowsZSpeedWStrartFrameNormal.x * _XColumnsYRowsZSpeedWStrartFrameNormal.y ) * _XColumnsYRowsZSpeedWStrartFrameNormal.z );
				float WStrartFrame122_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.w;
				// *** BEGIN Flipbook UV Animation vars ***
				// Total tiles of Flipbook Texture
				float fbtotaltiles130_g1350 = XColumns119_g1350 * YRows118_g1350;
				// Offsets for cols and rows of Flipbook Texture
				float fbcolsoffset130_g1350 = 1.0f / XColumns119_g1350;
				float fbrowsoffset130_g1350 = 1.0f / YRows118_g1350;
				// Speed of animation
				float fbspeed130_g1350 = _Time[ 1 ] * ZSpeed121_g1350;
				// UV Tiling (col and row offset)
				float2 fbtiling130_g1350 = float2(fbcolsoffset130_g1350, fbrowsoffset130_g1350);
				// UV Offset - calculate current tile linear index, and convert it to (X * coloffset, Y * rowoffset)
				// Calculate current tile linear index
				float fbcurrenttileindex130_g1350 = round( fmod( fbspeed130_g1350 + WStrartFrame122_g1350, fbtotaltiles130_g1350) );
				fbcurrenttileindex130_g1350 += ( fbcurrenttileindex130_g1350 < 0) ? fbtotaltiles130_g1350 : 0;
				// Obtain Offset X coordinate from current tile linear index
				float fblinearindextox130_g1350 = round ( fmod ( fbcurrenttileindex130_g1350, XColumns119_g1350 ) );
				// Multiply Offset X by coloffset
				float fboffsetx130_g1350 = fblinearindextox130_g1350 * fbcolsoffset130_g1350;
				// Obtain Offset Y coordinate from current tile linear index
				float fblinearindextoy130_g1350 = round( fmod( ( fbcurrenttileindex130_g1350 - fblinearindextox130_g1350 ) / XColumns119_g1350, YRows118_g1350 ) );
				// Reverse Y to get tiles from Top to Bottom
				fblinearindextoy130_g1350 = (int)(YRows118_g1350-1) - fblinearindextoy130_g1350;
				// Multiply Offset Y by rowoffset
				float fboffsety130_g1350 = fblinearindextoy130_g1350 * fbrowsoffset130_g1350;
				// UV Offset
				float2 fboffset130_g1350 = float2(fboffsetx130_g1350, fboffsety130_g1350);
				// Flipbook UV
				half2 fbuv130_g1350 = appendResult124_g1350 * fbtiling130_g1350 + fboffset130_g1350;
				// *** END Flipbook UV Animation vars ***
				float3 unpack132_g1350 = UnpackNormalScale( tex2D( _TextureAtlasNormal, fbuv130_g1350 ), _IntensityScaleNormal1 );
				unpack132_g1350.z = lerp( 1, unpack132_g1350.z, saturate(_IntensityScaleNormal1) );
				float3 tex2DNode132_g1350 = unpack132_g1350;
				float2 temp_cast_3 = (( FlipBookTiling100_g1350 / _ScaleFBDetailsNormal )).xx;
				float2 texCoord105_g1350 = IN.ase_texcoord5.xy * temp_cast_3 + _OffsetFBDetailsNormal;
				float cos111_g1350 = cos( _FBDetailsNormal );
				float sin111_g1350 = sin( _FBDetailsNormal );
				float2 rotator111_g1350 = mul( texCoord105_g1350 - float2( 0.5,0.5 ) , float2x2( cos111_g1350 , -sin111_g1350 , sin111_g1350 , cos111_g1350 )) + float2( 0.5,0.5 );
				float2 break112_g1350 = rotator111_g1350;
				float2 appendResult123_g1350 = (float2(frac( break112_g1350.x ) , frac( break112_g1350.y )));
				float fbtotaltiles129_g1350 = XColumns119_g1350 * YRows118_g1350;
				float fbcolsoffset129_g1350 = 1.0f / XColumns119_g1350;
				float fbrowsoffset129_g1350 = 1.0f / YRows118_g1350;
				float fbspeed129_g1350 = _Time[ 1 ] * ZSpeed121_g1350;
				float2 fbtiling129_g1350 = float2(fbcolsoffset129_g1350, fbrowsoffset129_g1350);
				float fbcurrenttileindex129_g1350 = round( fmod( fbspeed129_g1350 + WStrartFrame122_g1350, fbtotaltiles129_g1350) );
				fbcurrenttileindex129_g1350 += ( fbcurrenttileindex129_g1350 < 0) ? fbtotaltiles129_g1350 : 0;
				float fblinearindextox129_g1350 = round ( fmod ( fbcurrenttileindex129_g1350, XColumns119_g1350 ) );
				float fboffsetx129_g1350 = fblinearindextox129_g1350 * fbcolsoffset129_g1350;
				float fblinearindextoy129_g1350 = round( fmod( ( fbcurrenttileindex129_g1350 - fblinearindextox129_g1350 ) / XColumns119_g1350, YRows118_g1350 ) );
				fblinearindextoy129_g1350 = (int)(YRows118_g1350-1) - fblinearindextoy129_g1350;
				float fboffsety129_g1350 = fblinearindextoy129_g1350 * fbrowsoffset129_g1350;
				float2 fboffset129_g1350 = float2(fboffsetx129_g1350, fboffsety129_g1350);
				half2 fbuv129_g1350 = appendResult123_g1350 * fbtiling129_g1350 + fboffset129_g1350;
				float3 unpack134_g1350 = UnpackNormalScale( tex2D( _TextureAtlasNormal, fbuv129_g1350 ), _IntensityScaleNormal2 );
				unpack134_g1350.z = lerp( 1, unpack134_g1350.z, saturate(_IntensityScaleNormal2) );
				float3 RainDotsNormal976 = (( _DuplicateTextureAtlasNormal )?( BlendNormal( tex2DNode132_g1350 , unpack134_g1350 ) ):( tex2DNode132_g1350 ));
				float VertexA117 = break106.a;
				float temp_output_21_0_g1410 = VertexA117;
				float temp_output_61_0_g1410 = ( _L3BlendAmount - 2.37 );
				float lerpResult50_g1410 = lerp( temp_output_61_0_g1410 , ( temp_output_61_0_g1410 - 2.0 ) , VertexG115);
				float VertexB116 = break106.b;
				float lerpResult55_g1410 = lerp( lerpResult50_g1410 , -1.0 , VertexB116);
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float lerpResult876 = lerp( ( Layer0Heightmap336 * ( 1.0 - VertexG115 ) ) , Layer1Heightmap510 , VertexG115);
				float temp_output_817_0 = ( lerpResult876 * ( 1.0 - VertexB116 ) );
				float temp_output_63_0_g1410 = ( _L3BlendContrast - 1.5 );
				float clampResult11_g1410 = clamp( ( lerpResult55_g1410 + (( 1.0 + temp_output_63_0_g1410 ) + (temp_output_817_0 - 0.0) * (-temp_output_63_0_g1410 - ( 1.0 + temp_output_63_0_g1410 )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
				float blendOpSrc18_g1410 = clampResult11_g1410;
				float blendOpDest18_g1410 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g1410 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
				float blendOpSrc31_g1410 = (( _L3ConstrainbyPaintedMask )?( ( saturate( ( blendOpSrc18_g1410 * blendOpDest18_g1410 ) )) ):( clampResult11_g1410 ));
				float blendOpDest31_g1410 = temp_output_21_0_g1410;
				float temp_output_929_0 = (( _L3UseHeightmapDepth1 )?( ( saturate( ( blendOpSrc31_g1410 + blendOpDest31_g1410 ) )) ):( temp_output_21_0_g1410 ));
				float VertexAHeightmap799 = temp_output_929_0;
				float WetOpacity768 = _L3BlendOpacity;
				float3 lerpResult128 = lerp( lerpResult133 , BlendNormal( staticSwitch56_g1427 , RainDotsNormal976 ) , ( VertexAHeightmap799 * WetOpacity768 ));
				float3 Normal129 = lerpResult128;
				

				float3 Normal = Normal129;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			
			
			#pragma multi_compile_fragment _ _SHADOWS_SOFT _SHADOWS_SOFT_LOW _SHADOWS_SOFT_MEDIUM _SHADOWS_SOFT_HIGH
		
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif
			
			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#pragma shader_feature_local _WETBASECOLOR_COLOR _WETBASECOLOR_WETMAP _WETBASECOLOR_BASELAYER _WETBASECOLOR_LAYER1
			#pragma shader_feature_local _DETAILWAVE_ON
			#pragma shader_feature_local _MAINWAVE_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColorL1;
			float4 _BaseColor;
			float4 _ColorWet;
			float4 _PuddleMap_ST;
			float4 _WetTex_ST;
			float4 _XColumnsYRowsZSpeedWStrartFrameNormal;
			float4 _BaseMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXYL1;
			float4 _BumpMapL1_ST;
			float4 _BumpMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _BaseColorL1_ST;
			float4 _MetallicGlossMapMAHSL1_ST;
			float4 _ColorCubemap1;
			float2 _OffsetFBDetailsNormal;
			float _NormalWaveIntensity1;
			float _RotationAngle1;
			float _TilingWave1;
			float _TranslationSpeed1;
			float _BumpScaleL1;
			float _BumpScale;
			float _L3BlendContrast;
			float _TranslationSpeed2;
			float _TilingWave2;
			float _L0Displacement;
			float _NormalWaveIntensity2;
			float _AoIntensity;
			float _SmoothnessWet;
			float _GlossinessL1;
			float _Intensity;
			float _Size;
			float _Tiling;
			float _RotationAngle2;
			float _SplashSpeed;
			float _Metalness;
			float _MetallicL1;
			float _Metallic;
			float _ReflectionIntensity;
			float _BlurReflection;
			float _L3BlendAmount;
			float _Glossiness;
			float _L3ConstrainbyPaintedMask;
			float _ScaleFBDetailsNormal;
			float _DetailSaturation;
			float _L0Heightmapcontrast;
			float _L0HeightmapSpread;
			float _L1Displacement;
			float _L1Heightmapcontrast;
			float _L1HeightmapSpread;
			float _L1Displacement1;
			float _L3BlendOpacity;
			float _L3VisualizeHeightmap1;
			float _L1VisualizeHeightmap;
			float _L0VisualizeHeightmap;
			float _Brightness;
			float _Parallax;
			float _Saturation;
			float _BrightnessL1;
			float _ParallaxL1;
			float _SaturationL1;
			float _L1UseHeightmapDepth1;
			float _L1ConstrainbyPaintedMask;
			float _L1BlendAmount;
			float _L1BlendContrast;
			float _L1BlendOpacity;
			float _DetailBrightness;
			float _DuplicateTextureAtlasNormal;
			float _FlipBTilingNormal;
			float _IntensityScaleNormal1;
			float _AoIntensityL1;
			float _FBDetailsNormal;
			float _IntensityScaleNormal2;
			float _Distortion;
			float _L3UseHeightmapDepth1;
			float _AoWet;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MetallicGlossMapMAHS;
			sampler2D _MetallicGlossMapMAHSL1;
			sampler2D _BaseMap;
			sampler2D _BaseColorL1;
			sampler2D _WetTex;
			sampler2D _TextureAtlasNormal;
			sampler2D _BumpMap;
			sampler2D _BumpMapL1;
			sampler2D _PuddleMap;
			samplerCUBE _Cubemap;
			sampler2D _GradientTex;


			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			inline float2 ParallaxOffset( half h, half height, half3 viewDir )
			{
				h = h * height - height/2.0;
				float3 v = normalize( viewDir );
				v.z += 0.42;
				return h* (v.xy / v.z);
			}
			
					float2 voronoihash58_g1434( float2 p )
					{
						
						p = float2( dot( p, float2( 127.1, 311.7 ) ), dot( p, float2( 269.5, 183.3 ) ) );
						return frac( sin( p ) *43758.5453);
					}
			
					float voronoi58_g1434( float2 v, float time, inout float2 id, inout float2 mr, float smoothness, inout float2 smoothId )
					{
						float2 n = floor( v );
						float2 f = frac( v );
						float F1 = 8.0;
						float F2 = 8.0; float2 mg = 0;
						for ( int j = -1; j <= 1; j++ )
						{
							for ( int i = -1; i <= 1; i++ )
						 	{
						 		float2 g = float2( i, j );
						 		float2 o = voronoihash58_g1434( n + g );
								o = ( sin( time + o * 6.2831 ) * 0.5 + 0.5 ); float2 r = f - g - o;
								float d = 0.5 * dot( r, r );
						 		if( d<F1 ) {
						 			F2 = F1;
						 			F1 = d; mg = g; mr = r; id = o;
						 		} else if( d<F2 ) {
						 			F2 = d;
						
						 		}
						 	}
						}
						return F1;
					}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_MetallicGlossMapMAHS = v.texcoord.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2Dlod( _MetallicGlossMapMAHS, float4( ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float4 temp_cast_1 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_1 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VertexOffset605 = ( float4( ( v.normalOS * ( _L0Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1414 );
				float2 uv_MetallicGlossMapMAHSL1 = v.texcoord.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2Dlod( _MetallicGlossMapMAHSL1, float4( ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float4 temp_cast_4 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_4 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VertexOffset613 = ( float4( ( v.normalOS * ( _L1Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1413 );
				float4 break106 = v.ase_color;
				float VertexG115 = break106.g;
				float L1Opacity950 = 0.0;
				float4 lerpResult619 = lerp( Layer0VertexOffset605 , Layer1VertexOffset613 , ( VertexG115 * L1Opacity950 ));
				float4 temp_cast_8 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_8 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VertexOffset869 = ( float4( ( v.normalOS * ( _L1Displacement1 / 10.0 ) ) , 0.0 ) * temp_output_10_0_g1415 );
				float VertexA117 = break106.a;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult905 = lerp( lerpResult619 , Layer3VertexOffset869 , ( VertexA117 * WetOpacity768 ));
				float4 VertexOffset621 = lerpResult905;
				
				o.ase_texcoord8.xyz = v.texcoord.xyz;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset621.xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;
				v.tangentOS = v.tangentOS;

				VertexPositionInputs vertexInput = GetVertexPositionInputs( v.positionOS.xyz );
				VertexNormalInputs normalInput = GetVertexNormalInputs( v.normalOS, v.tangentOS );

				o.tSpace0 = float4( normalInput.normalWS, vertexInput.positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, vertexInput.positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, vertexInput.positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( vertexInput.positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.positionCS = vertexInput.positionCS;
				o.clipPosV = vertexInput.positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 tangentOS : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.tangentOS = v.tangentOS;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.tangentOS = patch[0].tangentOS * bary.x + patch[1].tangentOS * bary.y + patch[2].tangentOS * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								, bool ase_vface : SV_IsFrontFace )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.positionCS );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.positionCS);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float2 uv_BaseMap = IN.ase_texcoord8.xyz.xy * _BaseMap_ST.xy + _BaseMap_ST.zw;
				float2 break26_g1461 = uv_BaseMap;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1461 = (float2(( break26_g1461.x * L0GlobalTilingX150 ) , ( break26_g1461.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1461 = (float2(( break26_g1461.x + L0GlobalOffsetX151 ) , ( break26_g1461.y + L0GlobalOffsetY148 )));
				float2 uv_MetallicGlossMapMAHS = IN.ase_texcoord8.xyz.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2D( _MetallicGlossMapMAHS, ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ) );
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 ase_tanViewDir =  tanToWorld0 * WorldViewDirection.x + tanToWorld1 * WorldViewDirection.y  + tanToWorld2 * WorldViewDirection.z;
				ase_tanViewDir = normalize(ase_tanViewDir);
				float2 paralaxOffset38_g1055 = ParallaxOffset( tex2DNode3_g1055.b , _Parallax , ase_tanViewDir );
				float2 switchResult37_g1055 = (((ase_vface>0)?(paralaxOffset38_g1055):(0.0)));
				float2 Layer0Parallax215 = switchResult37_g1055;
				float4 tex2DNode7_g1460 = tex2D( _BaseMap, ( ( appendResult14_g1461 + appendResult13_g1461 ) + Layer0Parallax215 ) );
				float4 lerpResult53_g1460 = lerp( _BaseColor , ( ( _BaseColor * tex2DNode7_g1460 ) * _BaseColor.a ) , _BaseColor.a);
				float clampResult27_g1460 = clamp( _Saturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1460 = lerpResult53_g1460.rgb;
				float desaturateDot29_g1460 = dot( desaturateInitialColor29_g1460, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1460 = lerp( desaturateInitialColor29_g1460, desaturateDot29_g1460.xxx, -clampResult27_g1460 );
				float4 Layer0BaseColor179 = CalculateContrast(_Brightness,float4( desaturateVar29_g1460 , 0.0 ));
				float2 uv_BaseColorL1 = IN.ase_texcoord8.xyz.xy * _BaseColorL1_ST.xy + _BaseColorL1_ST.zw;
				float2 break26_g1396 = uv_BaseColorL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1396 = (float2(( break26_g1396.x * L1GlobalTilingX234 ) , ( break26_g1396.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1396 = (float2(( break26_g1396.x + L1GlobalOffsetX236 ) , ( break26_g1396.y + L1GlobalOffsetY237 )));
				float2 uv_MetallicGlossMapMAHSL1 = IN.ase_texcoord8.xyz.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2D( _MetallicGlossMapMAHSL1, ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ) );
				float2 paralaxOffset38_g1057 = ParallaxOffset( tex2DNode3_g1057.b , _ParallaxL1 , ase_tanViewDir );
				float2 switchResult37_g1057 = (((ase_vface>0)?(paralaxOffset38_g1057):(0.0)));
				float2 Layer1Parallax247 = switchResult37_g1057;
				float4 tex2DNode7_g1395 = tex2D( _BaseColorL1, ( ( appendResult14_g1396 + appendResult13_g1396 ) + Layer1Parallax247 ) );
				float clampResult27_g1395 = clamp( _SaturationL1 , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1395 = ( _ColorL1 * tex2DNode7_g1395 ).rgb;
				float desaturateDot29_g1395 = dot( desaturateInitialColor29_g1395, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1395 = lerp( desaturateInitialColor29_g1395, desaturateDot29_g1395.xxx, -clampResult27_g1395 );
				float4 Layer1BaseColor261 = CalculateContrast(_BrightnessL1,float4( desaturateVar29_g1395 , 0.0 ));
				float4 break106 = IN.ase_color;
				float VertexG115 = break106.g;
				float temp_output_21_0_g1411 = VertexG115;
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float temp_output_49_0_g1411 = ( _L1BlendContrast - 1.5 );
				float clampResult11_g1411 = clamp( ( ( _L1BlendAmount - 2.37 ) + (( 1.0 + temp_output_49_0_g1411 ) + (Layer0Heightmap336 - 0.0) * (-temp_output_49_0_g1411 - ( 1.0 + temp_output_49_0_g1411 )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
				float blendOpSrc18_g1411 = clampResult11_g1411;
				float blendOpDest18_g1411 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g1411 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
				float blendOpSrc31_g1411 = (( _L1ConstrainbyPaintedMask )?( ( saturate( ( blendOpSrc18_g1411 * blendOpDest18_g1411 ) )) ):( clampResult11_g1411 ));
				float blendOpDest31_g1411 = temp_output_21_0_g1411;
				float VertexGHeightmap352 = ( (( _L1UseHeightmapDepth1 )?( ( saturate( ( blendOpSrc31_g1411 + blendOpDest31_g1411 ) )) ):( temp_output_21_0_g1411 )) * _L1BlendOpacity );
				float4 lerpResult99 = lerp( Layer0BaseColor179 , Layer1BaseColor261 , VertexGHeightmap352);
				float4 temp_cast_4 = (1.0).xxxx;
				float2 uv_WetTex = IN.ase_texcoord8.xyz.xy * _WetTex_ST.xy + _WetTex_ST.zw;
				float FlipBookTiling100_g1350 = _FlipBTilingNormal;
				float2 temp_cast_5 = (FlipBookTiling100_g1350).xx;
				float2 texCoord114_g1350 = IN.ase_texcoord8.xyz.xy * temp_cast_5 + float2( 0,0 );
				float2 appendResult124_g1350 = (float2(frac( texCoord114_g1350.x ) , frac( texCoord114_g1350.y )));
				float XColumns119_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.x;
				float YRows118_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.y;
				float ZSpeed121_g1350 = ( ( _XColumnsYRowsZSpeedWStrartFrameNormal.x * _XColumnsYRowsZSpeedWStrartFrameNormal.y ) * _XColumnsYRowsZSpeedWStrartFrameNormal.z );
				float WStrartFrame122_g1350 = _XColumnsYRowsZSpeedWStrartFrameNormal.w;
				// *** BEGIN Flipbook UV Animation vars ***
				// Total tiles of Flipbook Texture
				float fbtotaltiles130_g1350 = XColumns119_g1350 * YRows118_g1350;
				// Offsets for cols and rows of Flipbook Texture
				float fbcolsoffset130_g1350 = 1.0f / XColumns119_g1350;
				float fbrowsoffset130_g1350 = 1.0f / YRows118_g1350;
				// Speed of animation
				float fbspeed130_g1350 = _Time[ 1 ] * ZSpeed121_g1350;
				// UV Tiling (col and row offset)
				float2 fbtiling130_g1350 = float2(fbcolsoffset130_g1350, fbrowsoffset130_g1350);
				// UV Offset - calculate current tile linear index, and convert it to (X * coloffset, Y * rowoffset)
				// Calculate current tile linear index
				float fbcurrenttileindex130_g1350 = round( fmod( fbspeed130_g1350 + WStrartFrame122_g1350, fbtotaltiles130_g1350) );
				fbcurrenttileindex130_g1350 += ( fbcurrenttileindex130_g1350 < 0) ? fbtotaltiles130_g1350 : 0;
				// Obtain Offset X coordinate from current tile linear index
				float fblinearindextox130_g1350 = round ( fmod ( fbcurrenttileindex130_g1350, XColumns119_g1350 ) );
				// Multiply Offset X by coloffset
				float fboffsetx130_g1350 = fblinearindextox130_g1350 * fbcolsoffset130_g1350;
				// Obtain Offset Y coordinate from current tile linear index
				float fblinearindextoy130_g1350 = round( fmod( ( fbcurrenttileindex130_g1350 - fblinearindextox130_g1350 ) / XColumns119_g1350, YRows118_g1350 ) );
				// Reverse Y to get tiles from Top to Bottom
				fblinearindextoy130_g1350 = (int)(YRows118_g1350-1) - fblinearindextoy130_g1350;
				// Multiply Offset Y by rowoffset
				float fboffsety130_g1350 = fblinearindextoy130_g1350 * fbrowsoffset130_g1350;
				// UV Offset
				float2 fboffset130_g1350 = float2(fboffsetx130_g1350, fboffsety130_g1350);
				// Flipbook UV
				half2 fbuv130_g1350 = appendResult124_g1350 * fbtiling130_g1350 + fboffset130_g1350;
				// *** END Flipbook UV Animation vars ***
				float3 unpack132_g1350 = UnpackNormalScale( tex2D( _TextureAtlasNormal, fbuv130_g1350 ), _IntensityScaleNormal1 );
				unpack132_g1350.z = lerp( 1, unpack132_g1350.z, saturate(_IntensityScaleNormal1) );
				float3 tex2DNode132_g1350 = unpack132_g1350;
				float2 temp_cast_6 = (( FlipBookTiling100_g1350 / _ScaleFBDetailsNormal )).xx;
				float2 texCoord105_g1350 = IN.ase_texcoord8.xyz.xy * temp_cast_6 + _OffsetFBDetailsNormal;
				float cos111_g1350 = cos( _FBDetailsNormal );
				float sin111_g1350 = sin( _FBDetailsNormal );
				float2 rotator111_g1350 = mul( texCoord105_g1350 - float2( 0.5,0.5 ) , float2x2( cos111_g1350 , -sin111_g1350 , sin111_g1350 , cos111_g1350 )) + float2( 0.5,0.5 );
				float2 break112_g1350 = rotator111_g1350;
				float2 appendResult123_g1350 = (float2(frac( break112_g1350.x ) , frac( break112_g1350.y )));
				float fbtotaltiles129_g1350 = XColumns119_g1350 * YRows118_g1350;
				float fbcolsoffset129_g1350 = 1.0f / XColumns119_g1350;
				float fbrowsoffset129_g1350 = 1.0f / YRows118_g1350;
				float fbspeed129_g1350 = _Time[ 1 ] * ZSpeed121_g1350;
				float2 fbtiling129_g1350 = float2(fbcolsoffset129_g1350, fbrowsoffset129_g1350);
				float fbcurrenttileindex129_g1350 = round( fmod( fbspeed129_g1350 + WStrartFrame122_g1350, fbtotaltiles129_g1350) );
				fbcurrenttileindex129_g1350 += ( fbcurrenttileindex129_g1350 < 0) ? fbtotaltiles129_g1350 : 0;
				float fblinearindextox129_g1350 = round ( fmod ( fbcurrenttileindex129_g1350, XColumns119_g1350 ) );
				float fboffsetx129_g1350 = fblinearindextox129_g1350 * fbcolsoffset129_g1350;
				float fblinearindextoy129_g1350 = round( fmod( ( fbcurrenttileindex129_g1350 - fblinearindextox129_g1350 ) / XColumns119_g1350, YRows118_g1350 ) );
				fblinearindextoy129_g1350 = (int)(YRows118_g1350-1) - fblinearindextoy129_g1350;
				float fboffsety129_g1350 = fblinearindextoy129_g1350 * fbrowsoffset129_g1350;
				float2 fboffset129_g1350 = float2(fboffsetx129_g1350, fboffsety129_g1350);
				half2 fbuv129_g1350 = appendResult123_g1350 * fbtiling129_g1350 + fboffset129_g1350;
				float3 unpack134_g1350 = UnpackNormalScale( tex2D( _TextureAtlasNormal, fbuv129_g1350 ), _IntensityScaleNormal2 );
				unpack134_g1350.z = lerp( 1, unpack134_g1350.z, saturate(_IntensityScaleNormal2) );
				float3 RainDotsNormal976 = (( _DuplicateTextureAtlasNormal )?( BlendNormal( tex2DNode132_g1350 , unpack134_g1350 ) ):( tex2DNode132_g1350 ));
				float2 temp_cast_8 = (_Distortion).xx;
				float4 tex2DNode44_g1409 = tex2D( _WetTex, ( uv_WetTex + ( RainDotsNormal976.xy * temp_cast_8 ) ) );
				float clampResult27_g1409 = clamp( _DetailSaturation , -1.0 , 100.0 );
				float3 desaturateInitialColor29_g1409 = tex2DNode44_g1409.rgb;
				float desaturateDot29_g1409 = dot( desaturateInitialColor29_g1409, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar29_g1409 = lerp( desaturateInitialColor29_g1409, desaturateDot29_g1409.xxx, -clampResult27_g1409 );
				#if defined(_WETBASECOLOR_COLOR)
				float4 staticSwitch767 = temp_cast_4;
				#elif defined(_WETBASECOLOR_WETMAP)
				float4 staticSwitch767 = CalculateContrast(_DetailBrightness,float4( desaturateVar29_g1409 , 0.0 ));
				#elif defined(_WETBASECOLOR_BASELAYER)
				float4 staticSwitch767 = Layer0BaseColor179;
				#elif defined(_WETBASECOLOR_LAYER1)
				float4 staticSwitch767 = Layer1BaseColor261;
				#else
				float4 staticSwitch767 = Layer0BaseColor179;
				#endif
				float4 Layer3BaseColor786 = ( _ColorWet * staticSwitch767 );
				float VertexA117 = break106.a;
				float temp_output_21_0_g1410 = VertexA117;
				float temp_output_61_0_g1410 = ( _L3BlendAmount - 2.37 );
				float lerpResult50_g1410 = lerp( temp_output_61_0_g1410 , ( temp_output_61_0_g1410 - 2.0 ) , VertexG115);
				float VertexB116 = break106.b;
				float lerpResult55_g1410 = lerp( lerpResult50_g1410 , -1.0 , VertexB116);
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float lerpResult876 = lerp( ( Layer0Heightmap336 * ( 1.0 - VertexG115 ) ) , Layer1Heightmap510 , VertexG115);
				float temp_output_817_0 = ( lerpResult876 * ( 1.0 - VertexB116 ) );
				float temp_output_63_0_g1410 = ( _L3BlendContrast - 1.5 );
				float clampResult11_g1410 = clamp( ( lerpResult55_g1410 + (( 1.0 + temp_output_63_0_g1410 ) + (temp_output_817_0 - 0.0) * (-temp_output_63_0_g1410 - ( 1.0 + temp_output_63_0_g1410 )) / (1.0 - 0.0)) ) , 0.0 , 1.0 );
				float blendOpSrc18_g1410 = clampResult11_g1410;
				float blendOpDest18_g1410 = saturate( ( (-1.0 + (3.0 - 0.0) * (1.0 - -1.0) / (1.0 - 0.0)) + (( 1.0 + -6.0 ) + (temp_output_21_0_g1410 - 0.0) * (6.0 - ( 1.0 + -6.0 )) / (1.0 - 0.0)) ) );
				float blendOpSrc31_g1410 = (( _L3ConstrainbyPaintedMask )?( ( saturate( ( blendOpSrc18_g1410 * blendOpDest18_g1410 ) )) ):( clampResult11_g1410 ));
				float blendOpDest31_g1410 = temp_output_21_0_g1410;
				float temp_output_929_0 = (( _L3UseHeightmapDepth1 )?( ( saturate( ( blendOpSrc31_g1410 + blendOpDest31_g1410 ) )) ):( temp_output_21_0_g1410 ));
				float VertexAHeightmap799 = temp_output_929_0;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult101 = lerp( lerpResult99 , Layer3BaseColor786 , ( VertexAHeightmap799 * WetOpacity768 ));
				float4 BaseColor121 = lerpResult101;
				float4 temp_cast_11 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_11 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VisHeightmap579 = temp_output_8_0_g1414;
				float VertexR114 = break106.r;
				float4 temp_cast_13 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_13 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VisHeightmap612 = temp_output_8_0_g1413;
				float4 temp_cast_16 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_16 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VisHeightmap868 = temp_output_10_0_g1415;
				
				float2 uv_BumpMap = IN.ase_texcoord8.xyz.xy * _BumpMap_ST.xy + _BumpMap_ST.zw;
				float2 break26_g1463 = uv_BumpMap;
				float2 appendResult14_g1463 = (float2(( break26_g1463.x * L0GlobalTilingX150 ) , ( break26_g1463.y * L0GlobalTilingY149 )));
				float2 appendResult13_g1463 = (float2(( break26_g1463.x + L0GlobalOffsetX151 ) , ( break26_g1463.y + L0GlobalOffsetY148 )));
				float3 unpack4_g1462 = UnpackNormalScale( tex2D( _BumpMap, ( ( appendResult14_g1463 + appendResult13_g1463 ) + Layer0Parallax215 ) ), _BumpScale );
				unpack4_g1462.z = lerp( 1, unpack4_g1462.z, saturate(_BumpScale) );
				float3 tex2DNode4_g1462 = unpack4_g1462;
				float3 Layer0Normal193 = tex2DNode4_g1462;
				float2 uv_BumpMapL1 = IN.ase_texcoord8.xyz.xy * _BumpMapL1_ST.xy + _BumpMapL1_ST.zw;
				float2 break26_g1429 = uv_BumpMapL1;
				float2 appendResult14_g1429 = (float2(( break26_g1429.x * L1GlobalTilingX234 ) , ( break26_g1429.y * L1GlobalTilingY235 )));
				float2 appendResult13_g1429 = (float2(( break26_g1429.x + L1GlobalOffsetX236 ) , ( break26_g1429.y + L1GlobalOffsetY237 )));
				float3 unpack4_g1428 = UnpackNormalScale( tex2D( _BumpMapL1, ( ( appendResult14_g1429 + appendResult13_g1429 ) + Layer1Parallax247 ) ), _BumpScaleL1 );
				unpack4_g1428.z = lerp( 1, unpack4_g1428.z, saturate(_BumpScaleL1) );
				float3 tex2DNode4_g1428 = unpack4_g1428;
				float3 Layer1Normal260 = tex2DNode4_g1428;
				float3 lerpResult133 = lerp( Layer0Normal193 , Layer1Normal260 , VertexGHeightmap352);
				float2 temp_cast_18 = (_TranslationSpeed1).xx;
				float2 uv_PuddleMap = IN.ase_texcoord8.xyz.xy * _PuddleMap_ST.xy + _PuddleMap_ST.zw;
				float cos54_g1427 = cos( radians( _RotationAngle1 ) );
				float sin54_g1427 = sin( radians( _RotationAngle1 ) );
				float2 rotator54_g1427 = mul( ( uv_PuddleMap * _TilingWave1 ) - float2( 0.5,0.5 ) , float2x2( cos54_g1427 , -sin54_g1427 , sin54_g1427 , cos54_g1427 )) + float2( 0.5,0.5 );
				float2 panner86_g1427 = ( ( _TimeParameters.x * 0.05 ) * temp_cast_18 + rotator54_g1427);
				float3 unpack107_g1427 = UnpackNormalScale( tex2D( _PuddleMap, panner86_g1427 ), _NormalWaveIntensity1 );
				unpack107_g1427.z = lerp( 1, unpack107_g1427.z, saturate(_NormalWaveIntensity1) );
				#ifdef _MAINWAVE_ON
				float3 staticSwitch109_g1427 = unpack107_g1427;
				#else
				float3 staticSwitch109_g1427 = float3(0,0,1);
				#endif
				float2 temp_cast_19 = (_TranslationSpeed2).xx;
				float cos83_g1427 = cos( radians( _RotationAngle2 ) );
				float sin83_g1427 = sin( radians( _RotationAngle2 ) );
				float2 rotator83_g1427 = mul( ( uv_PuddleMap * _TilingWave2 ) - float2( 0.5,0.5 ) , float2x2( cos83_g1427 , -sin83_g1427 , sin83_g1427 , cos83_g1427 )) + float2( 0.5,0.5 );
				float2 panner88_g1427 = ( ( _TimeParameters.x * 0.05 ) * temp_cast_19 + rotator83_g1427);
				float3 unpack108_g1427 = UnpackNormalScale( tex2D( _PuddleMap, panner88_g1427 ), _NormalWaveIntensity2 );
				unpack108_g1427.z = lerp( 1, unpack108_g1427.z, saturate(_NormalWaveIntensity2) );
				#ifdef _DETAILWAVE_ON
				float3 staticSwitch56_g1427 = BlendNormal( staticSwitch109_g1427 , unpack108_g1427 );
				#else
				float3 staticSwitch56_g1427 = staticSwitch109_g1427;
				#endif
				float3 lerpResult128 = lerp( lerpResult133 , BlendNormal( staticSwitch56_g1427 , RainDotsNormal976 ) , ( VertexAHeightmap799 * WetOpacity768 ));
				float3 Normal129 = lerpResult128;
				
				float3 worldRefl28_g1430 = normalize( reflect( -WorldViewDirection, float3( dot( tanToWorld0, Normal129 ), dot( tanToWorld1, Normal129 ), dot( tanToWorld2, Normal129 ) ) ) );
				float4 texCUBENode27_g1430 = texCUBElod( _Cubemap, float4( worldRefl28_g1430, _BlurReflection) );
				float clampResult39_g1430 = clamp( _ReflectionIntensity , 0.0 , 100.0 );
				float4 temp_cast_20 = (1.0).xxxx;
				float4 lerpResult704 = lerp( ( BaseColor121 * 0.0 ) , ( ( texCUBENode27_g1430 * ( texCUBENode27_g1430.a * clampResult39_g1430 ) * _ColorCubemap1 ) * temp_cast_20 ) , VertexA117);
				float4 Cubemap742 = ( lerpResult704 * WetOpacity768 );
				
				float Layer0Metallic211 = ( tex2DNode3_g1055.r * _Metallic );
				float Layer1Metallic263 = ( tex2DNode3_g1057.r * _MetallicL1 );
				float lerpResult289 = lerp( Layer0Metallic211 , Layer1Metallic263 , VertexGHeightmap352);
				float CubemapMetalness750 = _Metalness;
				float lerpResult293 = lerp( lerpResult289 , CubemapMetalness750 , ( VertexAHeightmap799 * WetOpacity768 ));
				float Metallic296 = lerpResult293;
				
				float temp_output_1_0_g1055 = ( tex2DNode3_g1055.a * _Glossiness );
				float2 temp_cast_23 = (_SplashSpeed).xx;
				float time58_g1434 = ( 1.0 * 0.001 );
				float2 voronoiSmoothId58_g1434 = 0;
				float2 texCoord55_g1434 = IN.ase_texcoord8.xyz.xy * float2( 1,1 ) + float2( 0,0 );
				float2 coords58_g1434 = texCoord55_g1434 * _Tiling;
				float2 id58_g1434 = 0;
				float2 uv58_g1434 = 0;
				float fade58_g1434 = 0.5;
				float voroi58_g1434 = 0;
				float rest58_g1434 = 0;
				for( int it58_g1434 = 0; it58_g1434 <2; it58_g1434++ ){
				voroi58_g1434 += fade58_g1434 * voronoi58_g1434( coords58_g1434, time58_g1434, id58_g1434, uv58_g1434, 0,voronoiSmoothId58_g1434 );
				rest58_g1434 += fade58_g1434;
				coords58_g1434 *= 2;
				fade58_g1434 *= 0.5;
				}//Voronoi58_g1434
				voroi58_g1434 /= rest58_g1434;
				float2 myVarName60_g1434 = id58_g1434;
				float2 panner63_g1434 = ( 1.0 * _Time.y * temp_cast_23 + ( step( voroi58_g1434 , 0.1 ) * myVarName60_g1434 ));
				float RainDotsRoughness970 = ( saturate( ( tex2D( _GradientTex, panner63_g1434 ).g * step( voroi58_g1434 , (0.0 + (_Size - 0.0) * (0.05 - 0.0) / (1.0 - 0.0)) ) ) ) * _Intensity );
				float Layer0Smoothness210 = ( ( temp_output_1_0_g1055 * ( 1.0 - RainDotsRoughness970 ) ) + RainDotsRoughness970 );
				float temp_output_1_0_g1057 = ( tex2DNode3_g1057.a * _GlossinessL1 );
				float Layer1Smoothness264 = ( ( temp_output_1_0_g1057 * ( 1.0 - RainDotsRoughness970 ) ) + RainDotsRoughness970 );
				float lerpResult301 = lerp( Layer0Smoothness210 , Layer1Smoothness264 , VertexGHeightmap352);
				float CubemapSkyIntensity741 = _SmoothnessWet;
				float lerpResult305 = lerp( lerpResult301 , CubemapSkyIntensity741 , ( VertexAHeightmap799 * WetOpacity768 ));
				float Smoothness309 = lerpResult305;
				
				float blendOpSrc34_g1055 = tex2DNode3_g1055.g;
				float blendOpDest34_g1055 = ( 1.0 - _AoIntensity );
				float Layer0Ao214 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc34_g1055 ) * ( 1.0 - blendOpDest34_g1055 ) ) ));
				float blendOpSrc34_g1057 = tex2DNode3_g1057.g;
				float blendOpDest34_g1057 = ( 1.0 - _AoIntensityL1 );
				float Layer1Ao262 = ( saturate( ( 1.0 - ( 1.0 - blendOpSrc34_g1057 ) * ( 1.0 - blendOpDest34_g1057 ) ) ));
				float lerpResult312 = lerp( Layer0Ao214 , Layer1Ao262 , VertexGHeightmap352);
				float WetAo935 = tex2DNode44_g1409.a;
				#if defined(_WETBASECOLOR_COLOR)
				float staticSwitch931 = 1.0;
				#elif defined(_WETBASECOLOR_WETMAP)
				float staticSwitch931 = WetAo935;
				#elif defined(_WETBASECOLOR_BASELAYER)
				float staticSwitch931 = Layer0Ao214;
				#elif defined(_WETBASECOLOR_LAYER1)
				float staticSwitch931 = Layer1Ao262;
				#else
				float staticSwitch931 = Layer0Ao214;
				#endif
				float AoWet940 = _AoWet;
				float blendOpSrc944 = staticSwitch931;
				float blendOpDest944 = ( 1.0 - AoWet940 );
				float lerpResult316 = lerp( lerpResult312 , ( saturate( ( 1.0 - ( 1.0 - blendOpSrc944 ) * ( 1.0 - blendOpDest944 ) ) )) , ( VertexAHeightmap799 * WetOpacity768 ));
				float Ao321 = lerpResult316;
				

				float3 BaseColor = (( _L3VisualizeHeightmap1 )?( Layer3VisHeightmap868 ):( (( _L1VisualizeHeightmap )?( ( Layer1VisHeightmap612 * VertexG115 ) ):( (( _L0VisualizeHeightmap )?( ( Layer0VisHeightmap579 * VertexR114 ) ):( BaseColor121 )) )) )).xyz;
				float3 Normal = Normal129;
				float3 Emission = Cubemap742.rgb;
				float3 Specular = 0.5;
				float Metallic = Metallic296;
				float Smoothness = Smoothness309;
				float Occlusion = Ao321;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.positionCS.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.positionCS;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.positionCS,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColorL1;
			float4 _BaseColor;
			float4 _ColorWet;
			float4 _PuddleMap_ST;
			float4 _WetTex_ST;
			float4 _XColumnsYRowsZSpeedWStrartFrameNormal;
			float4 _BaseMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXYL1;
			float4 _BumpMapL1_ST;
			float4 _BumpMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _BaseColorL1_ST;
			float4 _MetallicGlossMapMAHSL1_ST;
			float4 _ColorCubemap1;
			float2 _OffsetFBDetailsNormal;
			float _NormalWaveIntensity1;
			float _RotationAngle1;
			float _TilingWave1;
			float _TranslationSpeed1;
			float _BumpScaleL1;
			float _BumpScale;
			float _L3BlendContrast;
			float _TranslationSpeed2;
			float _TilingWave2;
			float _L0Displacement;
			float _NormalWaveIntensity2;
			float _AoIntensity;
			float _SmoothnessWet;
			float _GlossinessL1;
			float _Intensity;
			float _Size;
			float _Tiling;
			float _RotationAngle2;
			float _SplashSpeed;
			float _Metalness;
			float _MetallicL1;
			float _Metallic;
			float _ReflectionIntensity;
			float _BlurReflection;
			float _L3BlendAmount;
			float _Glossiness;
			float _L3ConstrainbyPaintedMask;
			float _ScaleFBDetailsNormal;
			float _DetailSaturation;
			float _L0Heightmapcontrast;
			float _L0HeightmapSpread;
			float _L1Displacement;
			float _L1Heightmapcontrast;
			float _L1HeightmapSpread;
			float _L1Displacement1;
			float _L3BlendOpacity;
			float _L3VisualizeHeightmap1;
			float _L1VisualizeHeightmap;
			float _L0VisualizeHeightmap;
			float _Brightness;
			float _Parallax;
			float _Saturation;
			float _BrightnessL1;
			float _ParallaxL1;
			float _SaturationL1;
			float _L1UseHeightmapDepth1;
			float _L1ConstrainbyPaintedMask;
			float _L1BlendAmount;
			float _L1BlendContrast;
			float _L1BlendOpacity;
			float _DetailBrightness;
			float _DuplicateTextureAtlasNormal;
			float _FlipBTilingNormal;
			float _IntensityScaleNormal1;
			float _AoIntensityL1;
			float _FBDetailsNormal;
			float _IntensityScaleNormal2;
			float _Distortion;
			float _L3UseHeightmapDepth1;
			float _AoWet;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MetallicGlossMapMAHS;
			sampler2D _MetallicGlossMapMAHSL1;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_MetallicGlossMapMAHS = v.ase_texcoord.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2Dlod( _MetallicGlossMapMAHS, float4( ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float4 temp_cast_1 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_1 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VertexOffset605 = ( float4( ( v.normalOS * ( _L0Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1414 );
				float2 uv_MetallicGlossMapMAHSL1 = v.ase_texcoord.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2Dlod( _MetallicGlossMapMAHSL1, float4( ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float4 temp_cast_4 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_4 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VertexOffset613 = ( float4( ( v.normalOS * ( _L1Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1413 );
				float4 break106 = v.ase_color;
				float VertexG115 = break106.g;
				float L1Opacity950 = 0.0;
				float4 lerpResult619 = lerp( Layer0VertexOffset605 , Layer1VertexOffset613 , ( VertexG115 * L1Opacity950 ));
				float4 temp_cast_8 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_8 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VertexOffset869 = ( float4( ( v.normalOS * ( _L1Displacement1 / 10.0 ) ) , 0.0 ) * temp_output_10_0_g1415 );
				float VertexA117 = break106.a;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult905 = lerp( lerpResult619 , Layer3VertexOffset869 , ( VertexA117 * WetOpacity768 ));
				float4 VertexOffset621 = lerpResult905;
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset621.xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );

				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define ASE_TESSELLATION 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_DISTANCE_TESSELLATION
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140010


			#pragma vertex vert
			#pragma fragment frag

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL


			struct VertexInput
			{
				float4 positionOS : POSITION;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 positionCS : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _ColorL1;
			float4 _BaseColor;
			float4 _ColorWet;
			float4 _PuddleMap_ST;
			float4 _WetTex_ST;
			float4 _XColumnsYRowsZSpeedWStrartFrameNormal;
			float4 _BaseMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXYL1;
			float4 _BumpMapL1_ST;
			float4 _BumpMap_ST;
			float4 _GlobalXYTilingXYZWOffsetXY;
			float4 _MetallicGlossMapMAHS_ST;
			float4 _BaseColorL1_ST;
			float4 _MetallicGlossMapMAHSL1_ST;
			float4 _ColorCubemap1;
			float2 _OffsetFBDetailsNormal;
			float _NormalWaveIntensity1;
			float _RotationAngle1;
			float _TilingWave1;
			float _TranslationSpeed1;
			float _BumpScaleL1;
			float _BumpScale;
			float _L3BlendContrast;
			float _TranslationSpeed2;
			float _TilingWave2;
			float _L0Displacement;
			float _NormalWaveIntensity2;
			float _AoIntensity;
			float _SmoothnessWet;
			float _GlossinessL1;
			float _Intensity;
			float _Size;
			float _Tiling;
			float _RotationAngle2;
			float _SplashSpeed;
			float _Metalness;
			float _MetallicL1;
			float _Metallic;
			float _ReflectionIntensity;
			float _BlurReflection;
			float _L3BlendAmount;
			float _Glossiness;
			float _L3ConstrainbyPaintedMask;
			float _ScaleFBDetailsNormal;
			float _DetailSaturation;
			float _L0Heightmapcontrast;
			float _L0HeightmapSpread;
			float _L1Displacement;
			float _L1Heightmapcontrast;
			float _L1HeightmapSpread;
			float _L1Displacement1;
			float _L3BlendOpacity;
			float _L3VisualizeHeightmap1;
			float _L1VisualizeHeightmap;
			float _L0VisualizeHeightmap;
			float _Brightness;
			float _Parallax;
			float _Saturation;
			float _BrightnessL1;
			float _ParallaxL1;
			float _SaturationL1;
			float _L1UseHeightmapDepth1;
			float _L1ConstrainbyPaintedMask;
			float _L1BlendAmount;
			float _L1BlendContrast;
			float _L1BlendOpacity;
			float _DetailBrightness;
			float _DuplicateTextureAtlasNormal;
			float _FlipBTilingNormal;
			float _IntensityScaleNormal1;
			float _AoIntensityL1;
			float _FBDetailsNormal;
			float _IntensityScaleNormal2;
			float _Distortion;
			float _L3UseHeightmapDepth1;
			float _AoWet;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _MetallicGlossMapMAHS;
			sampler2D _MetallicGlossMapMAHSL1;


			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 uv_MetallicGlossMapMAHS = v.ase_texcoord.xy * _MetallicGlossMapMAHS_ST.xy + _MetallicGlossMapMAHS_ST.zw;
				float2 break26_g1056 = uv_MetallicGlossMapMAHS;
				float L0GlobalTilingX150 = ( _GlobalXYTilingXYZWOffsetXY.x - 1.0 );
				float L0GlobalTilingY149 = ( _GlobalXYTilingXYZWOffsetXY.y - 1.0 );
				float2 appendResult14_g1056 = (float2(( break26_g1056.x * L0GlobalTilingX150 ) , ( break26_g1056.y * L0GlobalTilingY149 )));
				float L0GlobalOffsetX151 = _GlobalXYTilingXYZWOffsetXY.z;
				float L0GlobalOffsetY148 = _GlobalXYTilingXYZWOffsetXY.w;
				float2 appendResult13_g1056 = (float2(( break26_g1056.x + L0GlobalOffsetX151 ) , ( break26_g1056.y + L0GlobalOffsetY148 )));
				float4 tex2DNode3_g1055 = tex2Dlod( _MetallicGlossMapMAHS, float4( ( ( appendResult14_g1056 + appendResult13_g1056 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer0Heightmap336 = tex2DNode3_g1055.b;
				float4 temp_cast_1 = (Layer0Heightmap336).xxxx;
				float4 temp_output_8_0_g1414 = CalculateContrast(_L0Heightmapcontrast,( temp_cast_1 + (-0.5 + (_L0HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer0VertexOffset605 = ( float4( ( v.normalOS * ( _L0Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1414 );
				float2 uv_MetallicGlossMapMAHSL1 = v.ase_texcoord.xy * _MetallicGlossMapMAHSL1_ST.xy + _MetallicGlossMapMAHSL1_ST.zw;
				float2 break26_g1058 = uv_MetallicGlossMapMAHSL1;
				float L1GlobalTilingX234 = ( _GlobalXYTilingXYZWOffsetXYL1.x - 1.0 );
				float L1GlobalTilingY235 = ( _GlobalXYTilingXYZWOffsetXYL1.y - 1.0 );
				float2 appendResult14_g1058 = (float2(( break26_g1058.x * L1GlobalTilingX234 ) , ( break26_g1058.y * L1GlobalTilingY235 )));
				float L1GlobalOffsetX236 = _GlobalXYTilingXYZWOffsetXYL1.z;
				float L1GlobalOffsetY237 = _GlobalXYTilingXYZWOffsetXYL1.w;
				float2 appendResult13_g1058 = (float2(( break26_g1058.x + L1GlobalOffsetX236 ) , ( break26_g1058.y + L1GlobalOffsetY237 )));
				float4 tex2DNode3_g1057 = tex2Dlod( _MetallicGlossMapMAHSL1, float4( ( ( appendResult14_g1058 + appendResult13_g1058 ) + float2( 0,0 ) ), 0, 0.0) );
				float Layer1Heightmap510 = tex2DNode3_g1057.b;
				float4 temp_cast_4 = (Layer1Heightmap510).xxxx;
				float4 temp_output_8_0_g1413 = CalculateContrast(_L1Heightmapcontrast,( temp_cast_4 + (-0.5 + (_L1HeightmapSpread - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) ));
				float4 Layer1VertexOffset613 = ( float4( ( v.normalOS * ( _L1Displacement / 10.0 ) ) , 0.0 ) * temp_output_8_0_g1413 );
				float4 break106 = v.ase_color;
				float VertexG115 = break106.g;
				float L1Opacity950 = 0.0;
				float4 lerpResult619 = lerp( Layer0VertexOffset605 , Layer1VertexOffset613 , ( VertexG115 * L1Opacity950 ));
				float4 temp_cast_8 = (1.0).xxxx;
				float4 temp_output_10_0_g1415 = ( temp_cast_8 + (-0.5 + (1.0 - 0.0) * (0.5 - -0.5) / (1.0 - 0.0)) );
				float4 Layer3VertexOffset869 = ( float4( ( v.normalOS * ( _L1Displacement1 / 10.0 ) ) , 0.0 ) * temp_output_10_0_g1415 );
				float VertexA117 = break106.a;
				float WetOpacity768 = _L3BlendOpacity;
				float4 lerpResult905 = lerp( lerpResult619 , Layer3VertexOffset869 , ( VertexA117 * WetOpacity768 ));
				float4 VertexOffset621 = lerpResult905;
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.positionOS.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset621.xyz;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.positionOS.xyz = vertexValue;
				#else
					v.positionOS.xyz += vertexValue;
				#endif

				v.normalOS = v.normalOS;

				float3 positionWS = TransformObjectToWorld( v.positionOS.xyz );
				o.positionCS = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 normalOS : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.positionOS;
				o.normalOS = v.normalOS;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.positionOS = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.normalOS = patch[0].normalOS * bary.x + patch[1].normalOS * bary.y + patch[2].normalOS * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.positionOS.xyz - patch[i].normalOS * (dot(o.positionOS.xyz, patch[i].normalOS) - dot(patch[i].vertex.xyz, patch[i].normalOS));
				float phongStrength = _TessPhongStrength;
				o.positionOS.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.positionOS.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/InternalErrorShader"
}