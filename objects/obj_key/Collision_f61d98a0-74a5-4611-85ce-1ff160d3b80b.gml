/// @description Pick up key

if(obj_gameController.soundOn) then audio_play_sound(snd_pickUp, 0, false)
obj_gameController.numKeys += 1
instance_destroy()
