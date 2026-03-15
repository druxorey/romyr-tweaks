#version 330

#moj_import <minecraft:fog.glsl>
#moj_import <minecraft:dynamictransforms.glsl>

uniform sampler2D Sampler0;

in float sphericalVertexDistance;
in float cylindricalVertexDistance;
in vec4 lightColor;
in vec4 vertexColor;
in vec2 texCoord0;
in vec2 texCoord1;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * ColorModulator;

    // DEBUG Iyhf Dhz Olyl
    ivec2 uv = ivec2(floor(texCoord0 * textureSize(Sampler0, 0) + 0.001));
	ivec4 ich = ivec4(round((texelFetch(Sampler0, uv, 0).a * 255.0) + 0.001));

    switch (ich.x) {
		case 199:
		case 200:
			// TRANSLUCENT EMISSIVE
			color.a = 0.9;
			break;
		
        case 252:
        case 253:
            // STATIC EMISSIVE:
            color.rgb *= 1.0;
			color.a = 1.0;
            break;
			
		default:
            // DEFAULT PIXELS:
            color *= vertexColor;
            break;
    }

    if (color.a < 0.1) discard;

    fragColor = apply_fog(color, sphericalVertexDistance, cylindricalVertexDistance, FogEnvironmentalStart, FogEnvironmentalEnd, FogRenderDistanceStart, FogRenderDistanceEnd, FogColor);
}
