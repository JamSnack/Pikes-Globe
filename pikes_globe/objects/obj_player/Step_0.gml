/// @description Insert description here
// You can write your code in this editor

// Input
key_left = keyboard_check(ord("A")) || keyboard_check(vk_left);
key_right = keyboard_check(ord("D")) || keyboard_check(vk_right);
key_up = keyboard_check(ord("W")) || keyboard_check(vk_space) || keyboard_check(vk_up);
key_down = keyboard_check(ord("S")) || keyboard_check(vk_down);
mouse_left = mouse_check_button(mb_left);
mouse_right = mouse_check_button(mb_right);

xmove = (key_right - key_left);
ymove = (key_down - key_up);

// Accelerate
if (xmove != 0)
	xspd = approach(xspd, xmove, 0.1 + 0.3*(xmove != sign(xspd)));
else
	xspd = approach(xspd, 0, 0.01 + 0.2*on_ground);
	
// Gravity
yspd += 0.1;
	
// Jump or fall
if (on_ground && key_up)
{
	on_ground = false;
	yspd = -2.05;
}

entity_physics();


// Break tiles
can_mine_tile = point_distance(x div TILE_SIZE, y div TILE_SIZE, mouse_x div TILE_SIZE, mouse_y div TILE_SIZE) <= 3;
if (can_mine_tile && pickaxe_delay <= 0 && mouse_left && collision_tile(mouse_x, mouse_y))
{
	tile_hurt(mouse_x, mouse_y, 1);
	pickaxe_delay = 60/global.stats.equipped_pickaxe.pickaxe_speed;
}
else if (pickaxe_delay > 0)
	pickaxe_delay -= 1;
	
// Use weapon
if (mouse_right && can_attack_delay <= 0)
{
	with (instance_create_layer(x, y, "Instances", obj_projectile, { damage: global.stats.equipped_weapon.weapon_damage }))
		{ motion_add_custom(3, point_direction(x, y, mouse_x, mouse_y)); }
	can_attack_delay = 60/global.stats.equipped_weapon.weapon_speed;
} else if (can_attack_delay > 0) can_attack_delay -= 1;
	
// Sprite
if (xspd != 0 && on_ground)
{
	sprite_index = spr_player_run;
	if (xspd != 0)
		image_xscale = sign(xspd);
}
else sprite_index = spr_player;


// Structure hovering
structure_hovering = instance_place(x, y, STRUCTURE);
	
// Receive contact damage
if (immunity_frames <= 0)
{
	var _e = instance_place(x, y, ENEMY)
	if (instance_exists(_e))
	{
		if (_e.contact_damage > 0)
		{
			global.stats.hp -= _e.contact_damage;
			immunity_frames = 60;
		}
	}
} else if (immunity_frames > 0)
	immunity_frames -= 1;
	
if (immunity_frames > 0)
{
	image_alpha = sin(current_time);
} else image_alpha = 1;