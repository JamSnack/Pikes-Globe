/// @description Insert description here
// You can write your code in this editor

entity_physics();

with (instance_place(x, y, obj_player))
{
	if (global.player == id)
		global.stats.gems += 1;
		
	instance_destroy(other);
}