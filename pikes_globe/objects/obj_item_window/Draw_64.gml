/// @description Insert description here
// You can write your code in this editor

draw_self();

if (is_struct(equipped_item))
{
	draw_sprite(spr_items_big, equipped_item.index, x + 8, y + 6);
	draw_text_scribble(x + 84, y + 10, FH+equipped_item.name);
	
	var _t = " ";
	switch (item_type)
	{
		case ITEMTYPE.weapon: { _t += "Weapon"; } break; 
		case ITEMTYPE.equipment: { _t += "Equipment"; } break; 
		case ITEMTYPE.backpack: { _t += "Inventory"; } break; 
		case ITEMTYPE.pickaxe: { _t += "Mining Tool"; } break; 
	}
	
	if (level > 0)
		draw_text_scribble(bbox_right - 8, y + 45, "[fa_right][fnt_small]Level "+string(level) + _t);
		
	// mod slots
	for (var i = 0; i < mod_slots; i++)
	{
		var _x = x + 74*i - (74 * (i div 5) * 5);
		var _y = y + 74 + 74*(i div 5);
		
		draw_sprite_ext(spr_ui_item_slot, 0, _x, _y, 1, 1, 0, c_white, 1);
		
		// draw items in the slots
		var _slot_ref = noone
		switch (item_type)
		{
			case ITEMTYPE.weapon: { _slot_ref = global.stats.weapon_mods; } break; 
			case ITEMTYPE.equipment: {_slot_ref = global.stats.equipment_mods; } break; 
			case ITEMTYPE.backpack: { _slot_ref = global.inventory; } break; 
			case ITEMTYPE.pickaxe: { _slot_ref = global.stats.pickaxe_mods; } break; 
		}
		
		if (is_array(_slot_ref) && is_struct(_slot_ref[i]))
			draw_sprite_ext(spr_items_big, _slot_ref[i].index, _x + 4, _y + 4, 1, 1, 0, c_white, 1);
	}
		
	
}