shader_type canvas_item;

// High Pass Sharpening Filter
// Adjust the strength to control the sharpness effect
uniform sampler2D SCREEN_TEXTURE: hint_screen_texture, filter_linear;
uniform float strength : hint_range(0.0, 10.0) = 1.0;

void fragment() {
	vec2 uv = SCREEN_UV;
	
	vec2 step = SCREEN_PIXEL_SIZE;
	
	vec3 texA = texture( SCREEN_TEXTURE, uv + vec2(-step.x, -step.y) * 1.5 ).rgb;
	vec3 texB = texture( SCREEN_TEXTURE, uv + vec2( step.x, -step.y) * 1.5 ).rgb;
	vec3 texC = texture( SCREEN_TEXTURE, uv + vec2(-step.x,  step.y) * 1.5 ).rgb;
	vec3 texD = texture( SCREEN_TEXTURE, uv + vec2( step.x,  step.y) * 1.5 ).rgb;
   
    vec3 around = 0.25 * (texA + texB + texC + texD);
	vec3 center  = texture( SCREEN_TEXTURE, uv ).rgb;
	
	float sharpness = strength;
	
	vec3 col = center + (center - around) * sharpness;
	
    COLOR = vec4(col,1.0);
}
