/// @description Insert description here
// You can write your code in this editor

if ((can_fall_after_purchase && purchased) || (can_fall_before_purchase && !purchased))
{
	if !(collision_tile(bbox_left + TILE_SIZE/2, bbox_bottom + 1) || collision_tile(bbox_right - TILE_SIZE/2, bbox_bottom + 1))
	{
		fall_speed = approach(fall_speed, 3, 0.1);
		y += fall_speed;
	}
	else fall_speed = 0;
}

player_hovering = place_meeting(x, y, obj_player);
cost_animation = lerp(cost_animation, player_hovering, 0.13);