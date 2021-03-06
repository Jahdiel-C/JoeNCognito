/// @description Keep track of items, options, and location

show_debug_message("Room Load Handling...")


// Checks the "Options" file for the options the user has chosen.
// Updates the variables in gameController based on the file.
// If the variable doesn't exist in the file, use 1 or 0 as the default
ini_open("Options")
soundOn = ini_read_real("Volume", "soundOn", true)
musicOn = ini_read_real("Volume", "musicOn", true)
infiniteKeys = ini_read_real("Cheats", "infiniteKeys", false)
infiniteSprint = ini_read_real("Cheats", "infiniteSprint", false)
allUnlocks = ini_read_real("Cheats", "allUnlocks", false)
noDeaths = ini_read_real("Cheats", "noDeaths", false)
ini_close()

ini_open("Saving")
currentRoom = ini_read_real("Level", "currentRoom", rm_mainMenu)
numKeys = ini_read_real("Items", "numKeys", 0)
numDeaths = ini_read_real("Status", "numDeaths", 0)
actualUnlocks[0] = ini_read_real("Items", "hasGun", false)
actualUnlocks[1] = ini_read_real("Items", "hasProjector", false)
actualUnlocks[2] = ini_read_real("Items", "hasCoat", false)

ini_close()

// If the "All Unlocks" cheat is turned off, set player to the proper object based on 
// items that have been picked up. Else if the cheat is on, change player to playerCoat 
// and give player all items.
if(!allUnlocks)
{
	hasGun = actualUnlocks[0]
	hasProjector = actualUnlocks[1]
	hasCoat = actualUnlocks[2]
	
}
else
{
	hasGun = true
	hasCoat = true
	hasProjector = true
}


//audio processing

//stop common sound effects
audio_stop_sound(snd_laser)
audio_stop_sound(snd_helicoptGrabber)
audio_stop_sound(snd_laserCharging)

if(musicOn)
{
	var oldSound = currentBGM;
	switch(room){
		case rm_level1:
			currentBGM = snd_lv1
			break;
		case rm_level2:
			currentBGM = snd_lv2
			break;
		case rm_level3:
			currentBGM = snd_lv3
			break;
		case rm_mainMenu:
		case rm_options:
			currentBGM = snd_menu
			break;
		case rm_epilogue:
			currentBGM = snd_menu
			break;
		default:
			currentBGM = noone
	}
	
	
	
	if oldSound != currentBGM {
		audio_stop_sound(oldSound)
		audio_play_sound(currentBGM,2,true)
	}
}

if (room != rm_mainMenu && room != rm_options) {
	//set view of room to The Good Camera
	cam = camera_create()
	camera_set_view_size(cam, cam_width, cam_height)
	camera_set_view_target(cam, obj_player)
	camera_set_view_speed(cam, 5, 5)
	camera_set_view_border(cam, cam_width/2, cam_height/2)
	view_enabled = true
	view_camera[0] = cam
	view_visible[0] = true
	
	//center camera on player as best as you can
	var xx=0,yy=0,cx,cy;
	
	with obj_player {
		xx = x
		yy = y
	}
	
	cx = clamp(xx-cam_width/2,0,room_width-cam_width)
	cy = clamp(yy-cam_height/2,0,room_height-cam_height)
	
	camera_set_view_pos(cam,cx,cy)
}