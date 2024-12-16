/// @description Insert description here
// You can write your code in this editor

if (instance_exists(follow_this))
{
	//x = lerp(x, follow_this.y, 0.1);
	y = jlerp(y, follow_this.y, 0.1, 4);
}

if (screenshake > 0)
	screenshake -= 0.1;

camera_set_view_pos(view_camera[0], x+random(screenshake)*choose(-1,1), y - camera_get_view_height(view_camera[0])/2 + random(screenshake)*choose(-1,1));

//TODO: VScode camera draggable that lets you view any part of the map