
enum ITEMTYPE
{
	resource,
	weapon_mod,
	pickaxe_mod,
	equipment_mod,
	weapon,
	pickaxe,
	equipment,
	backpack,
	last
}

enum ITEMID
{
	none,
	copprin_ore,
	silven_ore,
	gollan_ore,
	drip,
	phynite,
	w_pistol,
	p_pickaxe,
	bp_brownbag,
	bp_backpack,
	last,
}

function item(_name, _desc, _type, _index) constructor
{
	name = _name;
	desc = _desc;
	type = _type;
	index = _index;
	
	pickaxe_damage = 0;
	pickaxe_speed = 2;
	weapon_damage = 0;
}

function inventory_find_item(item_index)
{
	for (var i = 0; i < global.stats.inventory_slots_available; i++)
	{
		if (is_struct(global.inventory[i]) && global.inventory[i].index == item_index)
			return global.inventory[i];
	}
	
	return false;
}

function inventory_add_item(item_index)
{
	for (var i = 0; i < global.stats.inventory_slots_available; i++)
	{
		if (global.inventory[i] == 0)
		{
			global.inventory[i] = get_new_item(item_index);
			return true;
		}
	}
	
	return false;
}

function inventory_remove_item(item_index)
{
	for (var i = 0; i < global.stats.inventory_slots_available; i++)
	{
		if (is_struct(global.inventory[i]) && global.inventory[i].index == item_index)
		{
			global.inventory[i] = 0;
			return true;
		}
	}
	
	return false;
}