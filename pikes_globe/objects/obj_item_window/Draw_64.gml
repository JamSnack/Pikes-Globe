/// @description Insert description here
// You can write your code in this editor

draw_self();

if (is_struct(equipped_item))
{
	draw_sprite(spr_items_big, equipped_item.index, x + 8, y + 6);
	draw_text_scribble(x + 84, y + 10, FH+equipped_item.name);
	
	if (level > 0)
		draw_text_scribble(bbox_right - 8, y + 45, "[fa_right][fnt_small]Level "+string(level));
		
	// mod slots
	for (var i = 0; i < mod_slots; i++)
		draw_sprite_ext(spr_ui_item_slot, 0, x + 74*i - (74 * (i div 5) * 5), y + 74 + 74*(i div 5), 1, 1, 0, c_white, 1);
}