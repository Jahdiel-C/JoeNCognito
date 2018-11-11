/// @description Detect Button Selection
// You can write your code in this editor

// If the mouse hasn't left the button after pressing down on it,
// raise the button then activate it
if(image_index == 1)
{
	image_index = 0
	alarm_set(0, 5)
}

if(obj_gameController.soundOn) then audio_play_sound(snd_buttonClick, 1, false);