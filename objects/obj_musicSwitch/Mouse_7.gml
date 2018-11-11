/// @description Toggle Sound
// You can write your code in this editor

// Open the "Options" file and under the "Volume" section,
// set musicOn value based on button's state.
// Then close the file.

audio_stop_all()

ini_open("Options")

if(image_index == 0)
{
	ini_write_real("Volume", "musicOn", true)
	obj_gameController.musicOn = true
}
else
{
	ini_write_real("Volume", "musicOn", false)
	with obj_gameController{
		musicOn = false
		currentBGM = noone
	}
}

ini_close()
if(obj_gameController.soundOn) then audio_play_sound(snd_buttonClick, 1, false);