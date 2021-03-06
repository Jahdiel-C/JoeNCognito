/// @description Use voice projector
// You can write your code in this editor

// If the player picked up the projector and it isn't on cooldown,
// allow the player to go project a noise and disable the player's ability
// to use the projector again until the cooldown is complete
if dead then exit;
if(obj_gameController.hasProjector && obj_gameController.canProjector)
{
	// Gives the object a layer to be created on
	instance_create_layer(x,y,layer, obj_noise)
	obj_gameController.canProjector = false
	
	if (obj_gameController.playerInvisible)
	{
		event_user(1);
	}
	
	// Set the cooldown
	with(obj_effectTimer)
	{
		alarm_set(3, other.cooldown_sound*30)
	}
}


