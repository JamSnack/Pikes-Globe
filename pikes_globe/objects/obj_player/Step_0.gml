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

// Speed control
yspd = clamp(yspd, -6, 3);
xspd = clamp(xspd, -6, 6);


	
// Move and Collide
if (check_horizontal_collision())
	xspd = 0;

if (check_vertical_collision())
{
	if (yspd >= 0)
		on_ground = true;
		
	yspd = 0;
}
	
x += xspd;
y += yspd;

// Break tiles
can_mine_tile = point_distance(x div TILE_SIZE, y div TILE_SIZE, mouse_x div TILE_SIZE, mouse_y div TILE_SIZE) <= 3;
if (can_mine_tile && pickaxe_delay <= 0 && mouse_left && collision_tile(mouse_x, mouse_y))
{
	tile_hurt(mouse_x, mouse_y, 1);
	pickaxe_delay = 60/global.stats.equipped_pickaxe.pickaxe_speed;
}
else if (pickaxe_delay > 0)
	pickaxe_delay -= 1;
	
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
	
//print(mouse_x);