/// @description Insert description here
// You can write your code in this editor
draw_self();
//var _m = get_mouse_pos_in_world();
if (can_mine_tile)
	draw_sprite(spr_tile_selection, 0, (mouse_x div TILE_SIZE)*TILE_SIZE,  (mouse_y div TILE_SIZE)*TILE_SIZE);