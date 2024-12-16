// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function get_new_item(item_id)
{
	switch(item_id)
	{
		case ITEMID.copprin_ore: return new item( "Copprin Ore", "Smelt into Copprin Bar.", ITEMTYPE.resource, item_id);
		case ITEMID.drip: return new item( "Drip", "Supplies magic.", ITEMTYPE.resource, item_id);
		case ITEMID.gollan_ore: return new item( "Gollan Ore", "Smelt into Gollan Bar.", ITEMTYPE.resource, item_id);
		case ITEMID.silven_ore: return new item( "Silven Ore", "Smelt into Silven Bar.", ITEMTYPE.resource, item_id);
		case ITEMID.phynite: return new item( "Phynite", "Used to make legendary enhancements.", ITEMTYPE.resource, item_id);
		case ITEMID.w_pistol: return new item( "Pistol-19", "A totally average gun.\nUse Right Click to shoot.", ITEMTYPE.weapon, item_id);
		case ITEMID.p_pickaxe: return new item( "Pickaxe", "Shatters the earth.\nUse Left Click to break tiles.", ITEMTYPE.pickaxe, item_id);
		case ITEMID.bp_brownbag: return new item( "Brown Bag", "Holds your garbage.\n3 slots.", ITEMTYPE.backpack, item_id);
		case ITEMID.bp_backpack: return new item( "Backpack", "5 slots.", ITEMTYPE.backpack, item_id);
	}
}