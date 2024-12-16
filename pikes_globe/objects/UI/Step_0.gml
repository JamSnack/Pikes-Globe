/// @description Insert description here
// You can write your code in this editor

mouse_hover = false;
mouse_left = false;
mouse_left_released = false;

// INTERACTION
if (visible)
{
	image_index = 0;
	if (point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), bbox_left, bbox_top, bbox_right, bbox_bottom))
	{
		mouse_hover = true;
		
		if (is_button)
		{
			image_index = 1;
			mouse_left = mouse_check_button(mb_left);
			mouse_left_released = mouse_check_button_released(mb_left);
		
			if (mouse_left_released)
				event_user(0);
		}
	}
}