/// @description Insert description here
// You can write your code in this editor

entity_physics();

with (instance_place(x, y, ENEMY))
{
	other.instance_to_hurt = id;
}

if (xspd == 0 && yspd == 0)
{
	lifetime -= 1;
	
	if (lifetime <= 0)
		instance_destroy();
}