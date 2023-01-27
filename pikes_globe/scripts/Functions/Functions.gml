#macro GRAVITY 0.24

function apply_gravity()
{
	vspd += GRAVITY*weight;
}

function move_and_collide()
{
	//Horizontal collision
	if (hspd != 0 && collision_rectangle(bbox_left + hspd, bbox_top, bbox_right + hspd, bbox_bottom, OBSTA, false, true) != noone)
	{
		var hdir = sign(hspd);
		
		while (collision_rectangle(bbox_left + hdir, bbox_top, bbox_right + hdir, bbox_bottom, OBSTA, false, true) == noone)
		{
			x += hdir;
		}
		
		hspd = 0;
	}
	
	x += hspd;
	
	//Vertical collision
	if (vspd != 0 && collision_rectangle(bbox_left, bbox_top + vspd, bbox_right, bbox_bottom + vspd, OBSTA, false, true) != noone)
	{
		var vdir = sign(vspd);
		
		while (collision_rectangle(bbox_left, bbox_top + vdir, bbox_right, bbox_bottom + vdir, OBSTA, false, true) == noone)
		{
			y += vdir;
		}
		
		vspd = 0;
	}
	
	y += vspd;
}

function init_object(_weight = 1)
{
	weight = _weight;
	
	vspd = 0;
	hspd = 0;
}