/// @description Insert description here
// You can write your code in this editor

equipped_item = noone;

switch (item_type)
{
	case ITEMTYPE.weapon: { equipped_item = global.stats.selected_weapon } break; 
	case ITEMTYPE.equipment: { equipped_item = global.stats.selected_equipment; } break; 
	case ITEMTYPE.backpack: { equipped_item = global.stats.selected_backpack; } break; 
	case ITEMTYPE.pickaxe: {equipped_item = global.stats.selected_pickaxe; } break; 
}

mod_slots = 0;
level = 0;
