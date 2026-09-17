shader_type spatial;
render_mode diffuse_lambert;

void fragment() {
	vec2 tile = floor(UV * 600.0);
	float grain = fract(sin(dot(tile, vec2(127.1, 311.7))) * 43758.5453);
	float patch = sin(UV.x * 110.0) * sin(UV.y * 97.0) * 0.04;
	ALBEDO = mix(vec3(0.22, 0.43, 0.12), vec3(0.36, 0.57, 0.19), grain) + patch;
	ROUGHNESS = 1.0;
}
