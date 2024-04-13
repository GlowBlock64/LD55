shader_type canvas_item;

uniform sampler2D noise: hint_default_black, repeat_enable;
uniform float amplitude;
uniform float frequency;

void vertex() {
	VERTEX.x = VERTEX.x + amplitude * sin(frequency * TIME + UV.y);
	VERTEX.y = VERTEX.y + amplitude * sin(frequency * TIME + UV.x);
}

void fragment() {
	vec2 uv = vec2(UV.x + TIME / 10.0, UV.y);
	
	vec4 noise_color = texture(noise, uv);
	COLOR = COLOR * noise_color;

}
