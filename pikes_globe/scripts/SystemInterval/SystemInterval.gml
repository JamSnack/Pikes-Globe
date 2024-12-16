// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function GameInterval()
{
	static _clock = 0;
	_clock += 1;
	
	switch (_clock)
	{
		case 1: { system_process_tiles(); } break;
		default: { _clock = 0 } break;
	}
	
	
}

function system_process_tiles()
{
	
}