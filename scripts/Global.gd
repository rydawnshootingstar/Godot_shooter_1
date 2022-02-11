extends Node2D

#Viewport 
var screen_size

#World Physics
var standardSpeed = 40

# Player Contributions
var playerIsFiringWeapon2
var playerIsFiringWeapon1

# <---UTILS--->
func randomX():
	# makes the result actually random
	
	return rand_range(-3,151)	
	
func wait(waitTime:float=1.0):
	var timer = Timer.new()
	timer.set_wait_time(waitTime)
	timer.set_one_shot(true)
	timer.connect("timeout", timer, "queue_free")
	add_child(timer)
	timer.start()
	return timer
	pass
	
func get_main_node():
	var root = get_tree().get_root()
	return root.get_child( root.get_child_count()-1 )
	pass

# Enemy Contributions
# TODO: when there are a certain number of enemy bullets on screen AND player is firing their weapon2, we need to 
# instantiate 2 levels of slowdown - light and heavy. 

func _ready():
	playerIsFiringWeapon2 = false
	playerIsFiringWeapon1 = false
	screen_size = get_viewport_rect().size
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
