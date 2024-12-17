// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum TILEID
{
	grass,
	dirt,
	stone,
	copprin,
	silven,
	gollan,
	drip,
	phynite,
	last
}

function tile_get_health(tile_id)
{
	switch (tile_id)
	{
		case TILEID.grass:   { return 1;  }
		case TILEID.dirt:    { return 2;  }
		case TILEID.stone:   { return 4;  }
		case TILEID.copprin: { return 6;  }
		case TILEID.silven:  { return 9;  }
		case TILEID.gollan:  { return 14; }
		case TILEID.drip:    { return 8;  }
		case TILEID.phynite: { return 21; }
	}
}

function tile_get_id(tile_index)
{
	return tile_index == 0 ? 0 :  ((tile_index-1) div 3)+1;
}

function tile_hurt(_x, _y, _damage)
{
	print("trying...");
	if (collision_tile(_x, _y))
	{
		_x = _x div TILE_SIZE;
		_y = _y div TILE_SIZE;
		var _tile = tile_get_id(global.tiles[_x][_y]);
		var _hp = global.tiles_active[_x][_y] < tile_get_health(_tile) ? global.tiles_active[_x][_y] - _damage : tile_get_health(_tile) - _damage;
		
		// workaround system interval resetting to zero hp and requiring that as defualt state
		if (_hp == 0)
			_hp = -1;
			
		// Put the tile into the active tiles list.
		global.tiles_active[_x][_y] = _hp;
		print("added a tile to the list with hp: "+string(_hp));
	}
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