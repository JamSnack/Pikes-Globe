/// @description Hurt an instance

with (instance_to_hurt)
{
	hp -= other.damage;
	print(other.damage);
}

instance_destroy();