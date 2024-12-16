/// @description Insert description here
// You can write your code in this editor
GameInterval();

// loop through active tiles
var _y = max(0, (camera_get_view_y(view_camera[0]) div TILE_SIZE));
var _y2 = WORLD_HEIGHT//min(1 + (camera_get_view_y(view_camera[0])+camera_get_view_height(view_camera[0])) div TILE_SIZE, WORLD_HEIGHT);
	
for (; _y < _y2; _y++)
{
	for (var _x = 0; _x < WORLD_WIDTH; _x++)
	{
		if (global.tiles_active[_x][_y] < 0)
		{
			set_tile(_x*TILE_SIZE, _y*TILE_SIZE);
			global.tiles_active[_x][_y] = 0;
			print("reset a tile");
		}
	}
}