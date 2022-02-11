extends Node


func _ready():
	get_node("Animation").play("fade_out")
	yield(get_node("Animation"), "animation_finished")
	queue_free()
	pass
