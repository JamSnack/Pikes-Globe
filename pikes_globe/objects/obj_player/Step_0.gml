/// @description

//Player movement
key_left =  keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_up =	keyboard_check(ord("W"));
key_down =  keyboard_check(ord("S"));

hmove = (key_right - key_left);
vmove = (key_up    - key_down);

is_moving = (hmove || vmove);


//- Allow player flight
if (is_moving)
{
	if (key_up)
		vspd -= flight_speed;	
		
	if (key_down)
		vspd += flight_speed;
	
	if (key_left)
		hspd -= flight_speed;
		
	if (key_right)
		hspd += flight_speed;
}

//Modular behaviors
apply_gravity();
move_and_collide();
