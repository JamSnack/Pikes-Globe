/// @description Insert description here
// You can write your code in this editor
entity_physics();

with (instance_place(x, y, obj_player))
{
	// give loot
	if (global.player == id)
	{
		if (inventory_add_item(other.image_index))
			instance_destroy(other);
	}
}