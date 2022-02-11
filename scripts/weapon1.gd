extends Area2D


export var velocity = Vector2()
const scn_flare = preload("res://scenes/flare.tscn")


func create_flare():
	var flare = scn_flare.instance()
	flare.set_position(position)
	#Global.get_main_node().add_child(flare)
	get_tree().get_root().call_deferred("add_child", flare)
	
func _ready():
	create_flare()
	# Dev Note: this vis_notifier event had trouble working when it was a KinematicBody2D. I'm not sure why 
	yield(get_node("vis_notifier"), "screen_exited")
	queue_free()
#	print("laser go bybye")
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity * delta)


