/// @description Insert description here
// You can write your code in this editor

if (!is_array(cost))
	exit;

// Find all the components
var _succ = true;
for (var c = 0; c < array_length(cost); c++)
{
	if !(is_struct(inventory_find_item(cost[c])))
	{
		_succ = false;
	}
}

// Remove all the components
if (_succ)
{
	for (var c = 0; c < array_length(cost); c++)
		inventory_remove_item(cost[c]);
		
	with (structure_watching)
	{
		purchased = true;
		depth = 12;
	}
		
	visible = false;
	cost = noone;
	text = "";
}