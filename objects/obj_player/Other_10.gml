/// @description Change Sprite, End Game
// You can write your code in this editor

if(!obj_gameController.noDeaths) && !dead {
	sprite_index = spr_playerDead
	if(obj_gameController.soundOn) then audio_play_sound(snd_playerDeath, 0, false)
	// Go back to main menu
	with(obj_gameController){
		alarm_set(0, 40)
	}
	
	dead = true
	xSpd = 0
	ySpd = 0
}