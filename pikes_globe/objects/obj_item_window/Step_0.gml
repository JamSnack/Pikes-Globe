/// @description Insert description here
// You can write your code in this editor

switch (item_type)
{
	case ITEMTYPE.weapon:    { mod_slots = global.stats.weapon_mods_available; level = global.stats.weapon_level; equipped_item = global.stats.equipped_weapon; } break;
	case ITEMTYPE.pickaxe:   { mod_slots = global.stats.pickaxe_mods_available; level = global.stats.pickaxe_level; equipped_item = global.stats.equipped_pickaxe; } break;
	case ITEMTYPE.equipment: { mod_slots = global.stats.equipment_mods_available; level = global.stats.equipment_level; equipped_item = global.stats.equipped_equipment;} break;
	case ITEMTYPE.backpack:  { mod_slots = global.stats.inventory_slots_available; equipped_item = global.stats.equipped_backpack; } break;
}