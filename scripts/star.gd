extends Sprite

export var velocity = Vector2()

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	translate(velocity * delta)
	if(position.y >= get_viewport_rect().size.x+180):
		position.y=-180
