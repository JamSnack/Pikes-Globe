
enum ITEMTYPE
{
	resource,
	weapon_mod,
	pickaxe_mod,
	equipment_mod,
	weapon,
	pickaxe,
	equipment,
	backpack,
	last
}

enum ITEMID
{
	none,
	copprin_ore,
	silven_ore,
	gollan_ore,
	drip,
	phynite,
	w_pistol,
	p_pickaxe,
	bp_brownbag,
	bp_backpack,
	last,
}

function item(_name, _desc, _type, _index) constructor
{
	name = _name;
	desc = _desc;
	type = _type;
	index = _index;
	
	pickaxe_damage = 0;
	weapon_damage = 0;
}