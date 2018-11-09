/// @description Travel to the next room, save important variables.


with(obj_gameController)
{
	ini_open("Saving")
	ini_write_real("Level", "currentRoom", other.roomTo)
	ini_write_real("Items", "numKeys", numKeys)
	ini_write_real("Items", "hasGun", actualUnlocks[0])
	ini_write_real("Items", "hasProjector", actualUnlocks[1])
	ini_write_real("Items", "hasCoat", actualUnlocks[2])
	ini_close()
}


room_goto(roomTo)
