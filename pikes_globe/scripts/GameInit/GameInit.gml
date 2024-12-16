// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro WORLD_WIDTH 15
#macro WORLD_HEIGHT 256
#macro TILE_SIZE 16
#macro MAX_INVENTORY 15

global.tiles = noone;
global.tiles_light = noone;
global.tiles_active = noone;
global.inventory = noone;
global.stats = noone;

// INIT GAME STATE
function init_game_state()
{
	// inventory
	global.inventory = array_create(MAX_INVENTORY)
	
	// game world
	global.tiles        = array_create(WORLD_WIDTH, 0);
	global.tiles_light  = array_create(WORLD_WIDTH, 0);
	global.tiles_active = array_create(WORLD_WIDTH, 0);

	for (var i = 0; i < WORLD_HEIGHT; i++)
	{
		global.tiles[i]        = array_create(WORLD_HEIGHT, 0);
		global.tiles_light[i]  = array_create(WORLD_HEIGHT, 0);
		global.tiles_active[i] = array_create(WORLD_HEIGHT, 0);
	}
	
	// player stats
	global.stats = {
		max_hp : 3,
		hp : 3,
	
		pickaxe_level : 1,
		weapon_level : 1,
		equipment_level : 1,
		
		pickaxe_mods : array_create(5, 0),
		weapon_mods : array_create(5, 0),
		equipment_mods: array_create(5, 0),
		
		pickaxe_mods_available: 1,
		weapon_mods_available: 3,
		equipment_mods_available: 5,
		inventory_slots_available: 10,
		
		selected_weapon: get_new_item(ITEMID.w_pistol),
		selected_pickaxe: get_new_item(ITEMID.p_pickaxe),
		selected_equipment: get_new_item(ITEMID.none),
		selected_backpack: get_new_item(ITEMID.bp_brownbag)
	}
}

init_game_state();

//INIT FONT STUFFS
scribble_font_bake_outline_4dir("fnt_main", "fnt_main_outline", c_black, false);

#macro FH "[fnt_main_outline]"