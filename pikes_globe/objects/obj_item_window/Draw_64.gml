/// @description Insert description here
// You can write your code in this editor

draw_self();

if (is_struct(equipped_item))
{
	draw_sprite(spr_items_big, equipped_item.index, x + 8, y + 6);
	draw_text_scribble(x + 84, y + 10, FH+equipped_item.name);
}