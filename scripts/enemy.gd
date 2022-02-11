extends Node2D

export var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.y = Global.standardSpeed
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity * delta)
	if position.y >= Global.screen_size.y:
		print("enemy go poof")
		queue_free()
	pass
