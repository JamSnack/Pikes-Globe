// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function check_horizontal_collision()
{
	//init bbox_side
	var bbox_side;
	if (xspd > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	
	return (collision_tile(bbox_side+xspd, y) || collision_tile(bbox_side+xspd, bbox_top) || collision_tile(bbox_side+xspd, bbox_bottom));
}

function check_vertical_collision()
{
	//init bbox_side
	var bbox_side;
	if (yspd > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	
	//Vertcial Collision
	return (collision_tile(bbox_left, bbox_side+yspd) || collision_tile(bbox_right, bbox_side+yspd) || collision_tile(x, bbox_side+yspd));
}

function collision_tile(_x, _y)
{
	_x = _x div TILE_SIZE;
	_y = _y div TILE_SIZE;
	
	if (_x >= WORLD_WIDTH || _x < 0 || _y >= WORLD_HEIGHT || _y < 0)
		return true;
	else if (global.tiles[_x][_y] > 0)
		return true;
	else
		return false;
}


function entity_physics()
{
	// Gravity
	yspd += weight;

	// Speed control
	yspd = clamp(yspd, -6, 3);
	xspd = clamp(xspd, -6, 6);
	
	// Move and Collide
	if (check_horizontal_collision())
	{
		xspd *= -bounciness;
		image_rotation_force -= xspd;
	}

	if (check_vertical_collision())
	{
		if (yspd >= 0)
			on_ground = true;
		
		yspd *= -bounciness;
		
		image_rotation_force -= yspd;
	}
	
	// smalls
	if (xspd > -0.4 && xspd < 0.4)
		xspd = 0;
	
	if (yspd > -0.5 && yspd < 0.1)
		yspd = 0;
	
	x += xspd;
	y += yspd;
	
	// Neutralize rotation force
	if (image_rotates_with_speed)
		image_angle += image_rotation_force;
	else 
		image_rotation_force = 0;
}