// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function check_horizontal_collision()
{
	//init bbox_side
	var bbox_side;
	if (xspd > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	
	return (collision_tile(bbox_side+xspd, y) || collision_tile(bbox_side+xspd, bbox_top) || collision_tile(bbox_side+xspd, bbox_bottom));
}

function check_vertical_collision()
{
	//init bbox_side
	var bbox_side;
	if (yspd > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	
	//Vertcial Collision
	return (collision_tile(bbox_left, bbox_side+yspd) || collision_tile(bbox_right, bbox_side+yspd) || collision_tile(x, bbox_side+yspd));
}

function collision_tile(_x, _y)
{
	_x = _x div TILE_SIZE;
	_y = _y div TILE_SIZE;
	
	if (_x >= WORLD_WIDTH || _x < 0 || _y >= WORLD_HEIGHT || _y < 0)
		return true;
	else if (global.tiles[_x][_y] > 0)
		return true;
	else
		return false;
}

function set_tile(_x, _y, _set = 0)
{
	
	
	_x = _x div TILE_SIZE;
	_y = _y div TILE_SIZE;
	
	var _ox = _x*TILE_SIZE;
	var _oy = _y*TILE_SIZE;

	if (_x > WORLD_WIDTH || _x < 0 || _y > WORLD_HEIGHT || _y < 0)
		return false
	else 
	{ 
		// set the tile
		global.tiles[_x][_y] = _set;
		
		// set the lighting
		var _s = (_set > 0);
		var _t = TILE_SIZE;
		set_tile_light(_ox, _oy, _s);
		set_tile_light(_ox+_t, _oy, _s);
		set_tile_light(_ox-_t, _oy, _s);
		set_tile_light(_ox+_t, _oy+_t, _s);
		set_tile_light(_ox-_t, _oy-_t, _s);
		set_tile_light(_ox+_t, _oy-_t, _s);
		set_tile_light(_ox-_t, _oy+_t, _s);
		set_tile_light(_ox, _oy-_t, _s);
		set_tile_light(_ox, _oy+_t, _s);
		
		return true; 
	}
}

function set_tile_light(_x, _y, _set = 0)
{
	_x = _x div TILE_SIZE;
	_y = _y div TILE_SIZE;

	if (_x > WORLD_WIDTH || _x < 0 || _y > WORLD_HEIGHT || _y < 0)
		return false
	else { global.tiles_light[_x][_y] = _set; return true; }
}