/// @description Insert description here
// You can write your code in this editor

obj_player.dead = false
stamina = staminaMax
playerInvisible = false

with(obj_effectTimer)
{
	alarm[0] = -1
	alarm[1] = 1
	alarm[2] = 1
	alarm[3] = 1
}

ini_open("Saving")
ini_write_real("Status", "numDeaths", numDeaths + 1)
show_debug_message("numDeaths = " + string(numDeaths))
ini_close()

room_goto(room)
event_user(1)