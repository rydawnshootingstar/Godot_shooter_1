extends "res://scripts/enemy.gd"

const scn_laser = preload("res://scenes/enemy_basic_homing_shot.tscn")

var playerCoordinates
var laserXVelocity

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (int) var health = 1000

# Called when the node enters the scene tree for the first time.
func _ready():
	lifespanAI()
	pass # Replace with function body.
	
func fire():
	var laser = scn_laser.instance()
	laser.position = get_node("cannon").global_position
	if(laserXVelocity != null):
		laser.velocity.x = playerCoordinates.x - position.x
		get_tree().get_root().add_child(laser)

	

func fireVolley(number:int=3):
	pass
	
func lifespanAI():
	while(true):
		fire()
		yield(Global.wait(1), "timeout")
	pass
	

func targetPlayer():
	playerCoordinates = get_node("/root/world/ship").global_position
	laserXVelocity = position.distance_to(playerCoordinates)
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	targetPlayer()
	print(playerCoordinates.x)
	pass
