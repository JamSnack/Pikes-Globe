/// @description Insert description here
// You can write your code in this editor
var success = true;
for (var c = 0; c < array_length(cost); c++)
{
	for (var i = 0; i < global.stats.inventory_slots_available; i++)
	{
		if (global.inventory[i] != cost[c] && i+1 >= inventory_slots_available)
		{
			success = false;
			break;
		}
	}
	
	if !success break;
}
	
	
if (success == true)
{
	for (var c = 0; c < array_length(cost); c++)
	{
		for (var i = 0; i < global.stats.inventory_slots_available; i++)
		{
			if (global.inventory[i] == cost[c])
			{
				global.inventory[i] = 0;
				break;
			}
		}
	}
}