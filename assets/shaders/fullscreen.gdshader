shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear;
uniform vec2 amount = vec2(128, 72);

void fragment() {
	vec2 grid_uv = round(SCREEN_UV * amount) / amount;
	vec4 text = texture(SCREEN_TEXTURE, grid_uv);
	
	COLOR = text;
}
