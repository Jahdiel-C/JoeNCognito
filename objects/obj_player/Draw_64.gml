if obj_gameController.infiniteSprint then sbar_width = 0
else sbar_width = 200

gunPos = [sbar_width, obj_gameController.cam_height - sprite_get_height(spr_gun)]
projPos = [sbar_width + sprite_get_width(spr_gun), 
	obj_gameController.cam_height - sprite_get_height(spr_projector)]
coatPos = [sbar_width + sprite_get_width(spr_gun) + sprite_get_width(spr_projector), 
	obj_gameController.cam_height - sprite_get_height(spr_coat)]
keyPos = [0, obj_gameController.cam_height - (2 + sbar_height + sprite_get_height(spr_key))]
deadPos = [sprite_get_width(spr_key) + 5, obj_gameController.cam_height - (sbar_height + sprite_get_height(spr_playerDeadIcon)/2)]

if(obj_gameController.hasCoat) then itemBarX2 = coatPos[0] + sprite_get_width(spr_coat) +1
else if(obj_gameController.hasProjector) then itemBarX2 = projPos[0] + sprite_get_width(spr_coat) +1
else if(obj_gameController.hasGun) then itemBarX2 = gunPos[0] + sprite_get_width(spr_coat) +1
else itemBarX2 = sbar_width

// Draw Key/Death bar
if(obj_gameController.numKeys > 0 || obj_gameController.numDeaths > 0){
	draw_rectangle_color(0, obj_gameController.cam_height,
		sprite_get_width(spr_key) + sprite_get_width(spr_playerDeadIcon)/2 + 20,
		obj_gameController.cam_height - (1 + sbar_height + max(sprite_get_height(spr_key), sprite_get_height(spr_playerDeadIcon)/2)),
		c_gray, c_gray, c_gray, c_gray, false)
}

// Keys GUI
if(obj_gameController.numKeys > 0) {
	draw_sprite_ext(spr_key, 0, keyPos[0], keyPos[1], 1.25, 1.25, 0, c_white, 1)
}
if(obj_gameController.numKeys > 1){
	draw_text(sprite_get_width(spr_key), 
		obj_gameController.cam_height - (sbar_height + sprite_get_height(spr_key)/2 + 1), 
		obj_gameController.numKeys)
}

// Deaths GUI
if(obj_gameController.numDeaths > 0) {
	draw_sprite_ext(spr_playerDeadIcon, 0, deadPos[0], deadPos[1], 0.5, 0.5, 0, c_white, 1)
}
if(obj_gameController.numDeaths > 1){
	draw_text(sprite_get_width(spr_key) + sprite_get_width(spr_playerDeadIcon)/2, 
		obj_gameController.cam_height - (sbar_height + sprite_get_height(spr_playerDeadIcon)/4 + 1), 
		obj_gameController.numDeaths)
}

// Draw Item Bar
draw_rectangle_color(sbar_width, obj_gameController.cam_height, itemBarX2,
	obj_gameController.cam_height - (sbar_height + 1), c_gray, c_gray, c_gray, c_gray, false)
	
// Gun GUI
if(obj_gameController.hasGun)
{
	draw_sprite_ext(spr_gun, 0, gunPos[0], gunPos[1], 1, 1, 0, c_white, 0.15)
	if obj_effectTimer.alarm[2] > 0 {
		draw_set_alpha(0.4)
		draw_sprite_part(spr_gun, 0, 0, 0, 
			sprite_get_width(spr_gun) - sprite_get_width(spr_gun) * obj_effectTimer.alarm[2] / (cooldown_gun*30), 
			sprite_get_width(spr_gun), gunPos[0], gunPos[1])
		draw_set_alpha(1)
	}
	if obj_gameController.canShoot {
		draw_sprite(spr_gun, 0, gunPos[0], gunPos[1])
	}
}

// Projector GUI
if(obj_gameController.hasProjector)
{
	draw_sprite_ext(spr_projector, 0, projPos[0], projPos[1], 1, 1, 0, c_white, 0.15)
	if obj_effectTimer.alarm[3] > 0 {
		draw_set_alpha(0.4)
		draw_sprite_part(spr_projector, 0, 0, 0, 
			sprite_get_width(spr_projector) - sprite_get_width(spr_projector) * obj_effectTimer.alarm[3] / (cooldown_sound*30), 
			sprite_get_height(spr_projector), projPos[0], projPos[1])
		draw_set_alpha(1)
	}
	if obj_gameController.canProjector {
		draw_sprite(spr_projector, 0, projPos[0], projPos[1])
	}
}

// Coat GUI
if(obj_gameController.hasCoat)
{
	draw_sprite_ext(spr_coat, 0, coatPos[0], coatPos[1], 1, 1, 0, c_white, 0.15)
	if obj_effectTimer.alarm[1] > 0 {
		draw_set_alpha(0.4)
		draw_sprite_part(spr_coat, 0, 0, 0, 
			sprite_get_width(spr_coat) - sprite_get_width(spr_coat) * obj_effectTimer.alarm[1] / (cooldown_invisible*30), 
			sprite_get_height(spr_coat),  coatPos[0], coatPos[1])
		draw_set_alpha(1)
	}
	if obj_gameController.canCoat {
		draw_sprite(spr_coat, 0, coatPos[0], coatPos[1])
	}
}

// Draw stamina bar
// Background
if(!obj_gameController.infiniteSprint){
draw_set_color(make_color_rgb(142, 102, 0))
draw_rectangle(sbar_position[0], sbar_position[1], 
	sbar_position[0] + sbar_width, 
	sbar_position[1] + sbar_height, false)
// Overlay
if obj_gameController.canSprint {
	draw_set_color(make_color_rgb(255, 255, 0))
}
else {
	draw_set_color(make_color_rgb(255,69,0))
}
draw_rectangle(sbar_position[0], sbar_position[1], 
	sbar_position[0] + (sbar_width * obj_gameController.stamina/obj_gameController.staminaMax), 
	sbar_position[1] + sbar_height, false)
}
draw_set_color(c_white)
