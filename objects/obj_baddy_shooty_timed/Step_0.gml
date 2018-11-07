if disabled then exit;

lineOfSight = enemy_lineOfSight()
//show_debug_message(lineOfSight)

switch(state){
	case turret.idle:
		if lineOfSight {
			if (obj_gameController.soundOn && !audio_is_playing(laserCharge)){
				audio_play_sound(laserCharge, 1, false)
			}
			timeline_index = tml_baddy_shooty;
			timeline_position = 0;
			timeline_running = true;
			timeline_loop = true;
			state = turret.shooting
		}
		break;
	case turret.shooting:
		if !lineOfSight {
			state = turret.checking
			timeline_index = tml_baddy_shooty;
			image_index = 0;
			timeline_running = false;
			timeline_loop = false;
			if audio_is_playing(laserCharge) then audio_stop_sound(laserCharge)
			break;
		}
		
		angle_target = point_direction(x,y,obj_player.x,obj_player.y)
		break;
}
