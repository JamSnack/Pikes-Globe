/// @description Insert description here
// You can write your code in this editor
randomize();
camera_view = view_camera[0];

// disable application surface drawing to do it ourselves
//application_surface_draw_enable(true);
//surface_resize(application_surface, camera_get_view_width(camera_view), camera_get_view_height(camera_view));

// GENERATE WORLD
for (var _y = 10; _y < WORLD_HEIGHT; _y++)
{
	for (var _x = 0; _x < WORLD_WIDTH; _x++)
	{
		// global.tiles[_x][_y] = ( tile_id ) * ( which frame? 1 - 3);
		global.tiles[_x][_y] = ( (_y >= 12) + (_y >= 14)*3 + ( _y >= 18)*3   ) + ( choose(0,1,2) );
		
		// global.tiles[_x][_y] = (a buncha tiles are pre-lit);
		global.tiles_light[_x][_y] = (_y >= 14);
	}
}