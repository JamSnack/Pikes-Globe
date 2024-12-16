/// @description Insert description here
// You can write your code in this editor

if (purchased == false)
{
	draw_sprite_ext(sprite_index, 0, x, y, 1, 1, 0, c_teal, 0.2);
	if (player_hovering)
		draw_sprite_outlined_ext(sprite_index, 0, x, y, c_white, 1, 1, 0, 0.2);
}
else draw_self();