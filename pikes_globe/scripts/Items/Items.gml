
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
	copprin_ore,
	silven_ore,
	gollan_ore,
	drip,
	phynite,
	last,
}

function item() constructor
{
	name = "Copprin Ore";
	desc = "LOL";
	type = ITEMTYPE.resource;
	index = ITEMID.copprin_ore;
}