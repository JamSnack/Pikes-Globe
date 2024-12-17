/// @description Insert description here
// You can write your code in this editor

draw_sprite_ext(spr_heart, global.stats.hp >= 1, 440, display_get_gui_height()-60, 3, 3, 0, c_white, 1);
draw_sprite_ext(spr_heart, global.stats.hp >= 2, 490, display_get_gui_height()-60, 3, 3, 0, c_white, 1);
draw_sprite_ext(spr_heart, global.stats.hp >= 3, 540, display_get_gui_height()-60, 3, 3, 0, c_white, 1);

if (global.stats.gems > 0)
{
	draw_text_scribble(840, display_get_gui_height()-60, FH+string(global.stats.gems)+" x [c_red][spr_gems, 0]");
}