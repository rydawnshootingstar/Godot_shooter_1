extends KinematicBody2D

export (int) var speed = 200
export (bool) var canFireBomb = true
export (float) var bombTimeout = 0.5
var screen_size 
var velocity = Vector2()

func _ready():
	screen_size = get_viewport_rect().size

	


func get_input():
	velocity = Vector2()
	if(Input.is_action_pressed("right")):
		velocity.x +=1
	if(Input.is_action_pressed("left")):
		velocity.x -=1
	if(Input.is_action_pressed("up")):
		velocity.y -=1
	if(Input.is_action_pressed("down")):
		velocity.y +=1
	if(Input.is_action_pressed("weapon1")):
		print("fire weapon 1")
	if(Input.is_action_just_pressed("weapon2")):
		Global.playerIsFiringWeapon2 = true
		print(Global.playerIsFiringWeapon2)
	if(Input.is_action_pressed("weapon2")):
		speed = 100
	if(Input.is_action_just_released("weapon2")):
		speed = 200
		Global.playerIsFiringWeapon2 = false
		print(Global.playerIsFiringWeapon2)
	if(Input.is_action_just_pressed("bomb")):
		fireBomb()
	velocity = velocity.normalized()*speed

func fireBomb():
	if(canFireBomb):
		print("bomb fired")
		canFireBomb = false
		yield(get_tree().create_timer(bombTimeout), "timeout")
		canFireBomb = true
	
	

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	position.x = clamp(position.x, -screen_size.x/2 +12, screen_size.x/2 -12)
	position.y = clamp(position.y, -screen_size.y + 38, 15 )
	

