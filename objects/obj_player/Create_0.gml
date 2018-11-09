/// @description Initialize movement and angle
// You can write your code in this editor
angle = 0;

xSpd = 0
ySpd = 0
sprinting = false

dead = false //dead disables controls 'cause you're dead

tilemap_collision = layer_tilemap_get_id(layer_get_id("layer_collision_tiles"))

tileLayerFurniture = layer_get_id("layer_collision_tiles_furniture")
tilemap_furniture = layer_tilemap_get_id(tileLayerFurniture)



invisIterator = 0 //iterator for invis shader
invisUniform = shader_get_uniform(shade_invis,"iter")


if !instance_exists(obj_gameController) then instance_create_layer(0,0,layer,obj_gameController)
if !instance_exists(obj_effectTimer) then instance_create_layer(0,0,layer,obj_effectTimer)


// Stamina bar item dimentions
sbar_width = 0
sbar_height = 5 + max(sprite_get_height(spr_gun),sprite_get_height(spr_projector), 
	sprite_get_height(spr_coat))
sbar_position = [0, obj_gameController.cam_height - sbar_height] // x,y position