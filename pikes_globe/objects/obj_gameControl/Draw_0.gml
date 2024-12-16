/// @description Insert description here
// You can write your code in this editor

var _y = max(0, (camera_get_view_y(view_camera[0]) div TILE_SIZE));
var _y2 = min(1 + (camera_get_view_y(camera_view)+camera_get_view_height(camera_view)) div TILE_SIZE, WORLD_HEIGHT);
// Render the tiles and light
for (; _y < _y2; _y++)
{
	for (var _x = 0; _x < WORLD_WIDTH; _x++)
	{
		draw_sprite(spr_tiles, global.tiles[_x][_y], _x*16, _y*16);
		draw_sprite(spr_tile_light, global.tiles_light[_x][_y], _x*16, _y*16);
	}
}