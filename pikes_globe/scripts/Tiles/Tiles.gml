// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum TILEID
{
	air,
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