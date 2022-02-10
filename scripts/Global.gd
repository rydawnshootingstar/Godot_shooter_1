extends Node2D

# Player Contributions
var playerIsFiringWeapon2

# Enemy Contributions
# TODO: when there are a certain number of enemy bullets on screen AND player is firing their weapon2, we need to 
# instantiate 2 levels of slowdown - light and heavy. 

func _ready():
	playerIsFiringWeapon2 = false
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
