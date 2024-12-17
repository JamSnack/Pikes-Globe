// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro print show_debug_message

function approach(a, b, amt)
{
	if (a < b)
	    return min(a + amt, b); 
	else
	    return max(a - amt, b);	
}

function noop() {}

function jlerp(val1, val2, amount, thresh=0.5)
{
	if ( abs(val2 - val1) <= thresh )
		return val2;
	else return lerp(val1, val2, amount);
}

function get_mouse_pos_in_world()
{
	return [ mouse_x + application_get_position()[0], device_mouse_y_to_gui(0) + camera_get_view_y(view_camera[0])]
}

function camera_add_screenshake(_screenshake=1)
{
	with(obj_camera) { screenshake+=_screenshake; }
}

function draw_sprite_outlined_ext(sprite_index, image_index, x, y, outline_color, xscale, yscale, angle, image_alpha)
{
	//set shader
	gpu_set_fog(true, outline_color, 0, 1);

	//Outline color
	draw_sprite_ext(sprite_index, image_index, x+xscale, y+yscale, xscale, yscale, angle, c_white, image_alpha);  
	draw_sprite_ext(sprite_index, image_index, x-xscale, y-yscale, xscale, yscale, angle, c_white, image_alpha);    
	draw_sprite_ext(sprite_index, image_index, x       , y+yscale, xscale, yscale, angle, c_white, image_alpha);    
	draw_sprite_ext(sprite_index, image_index, x+xscale, y       , xscale, yscale, angle, c_white, image_alpha);   
	draw_sprite_ext(sprite_index, image_index, x       , y-yscale, xscale, yscale, angle, c_white, image_alpha);    
	draw_sprite_ext(sprite_index, image_index, x-xscale, y       , xscale, yscale, angle, c_white, image_alpha);   
	draw_sprite_ext(sprite_index, image_index, x-xscale, y+yscale, xscale, yscale, angle, c_white, image_alpha);    
	draw_sprite_ext(sprite_index, image_index, x+xscale, y-yscale, xscale, yscale, angle, c_white, image_alpha);    
	
	//reset
	gpu_set_fog(false, c_white, 0, 0);
  
	//Draw sprite on-top of outline color
	draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, angle, image_blend, image_alpha);
}

/*
function draw_custom_healthbar(sprite_background, sprite_main, sprite_lerp, x, y, health_total, lerp_total, width, height, border = 2)
{
	//- background
	draw_sprite_stretched(sprite_background, 0, x, y, width, height);
	
	//- bleed
	draw_sprite_stretched(sprite_lerp, 0, x+border, y+border, (width-border*2)*lerp_total, height-border*2);
	//draw_rectangle_color(x+2, y+2, 455*(blood/max_hp), 14, COLOR_HEALTH_RED, COLOR_HEALTH_RED, COLOR_HEALTH_RED, COLOR_HEALTH_RED, false);

	//- health
	draw_sprite_stretched(sprite_main, 0, x+border, y+border, (width-border*2)*health_total, height-border*2);
	//draw_rectangle_color(x+2, y, 455*(hp_animation/max_hp), 14, COLOR_HEALTH_GREEN, COLOR_HEALTH_GREEN, COLOR_HEALTH_GREEN, COLOR_HEALTH_GREEN, false);
}