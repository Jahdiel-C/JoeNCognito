// Keep track of what items the player has available
hasGun = false
hasCoat = false
hasProjector = false
// Keeps track of what items the player has picked up
// This is necessary for the player to revert back to the proper
// state when cheat codes are turned off.
actualUnlocks = [hasGun, hasProjector, hasCoat]

// Keep track of the abilities the player can use
// If cooldown is complete, these variables are true)
canCoat = true
canShoot = true
canProjector = true
canSprint = true

playerInvisible = false

numDeaths = 0
numKeys = 0
staminaMax = 50
stamina = staminaMax

// Keeps track of choices in options menu
soundOn = true
musicOn = true
infiniteKeys = false
infiniteSprint = false
allUnlocks = false
noDeaths = false

currentRoom = rm_mainMenu
currentBGM = noone

surface_resize(application_surface, cam_width, cam_height)
window_set_size(cam_width, cam_height)
window_center()