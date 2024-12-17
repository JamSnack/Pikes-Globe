/// @description Insert description here
// You can write your code in this editor

visible = false;

if (global.setting_layout == layout)
{
	with (global.player)
	{
		// Draw cost of the structure if not purchased, otherwise draw minigame window
		if (instance_exists(structure_hovering))
		{
			other.structure_watching = structure_hovering;
			if (structure_hovering.purchased == false)
			{
				other.cost = structure_hovering.cost;
				var _text = "Cost\n\n";
				if (is_array(other.cost) && other.cost != noone)
				{
					for (var i = 0; i < array_length(other.cost); i++)
					{
						_text += "[spr_items_big, " + string(other.cost[i]) + "] ";
					}	
				}
			
				other.text = _text;
				other.visible = true;
			}
		}
	}
}

event_inherited();