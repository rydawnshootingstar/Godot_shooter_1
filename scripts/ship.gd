extends KinematicBody2D

export (int) var speed = 200
export (bool) var canFireBomb = true
export (float) var bombTimeout = 0.5

var velocity = Vector2()

const scn_weapon1 = preload("res://scenes/weapon1_ship.tscn")

func _ready():
	pass

	


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
	if(Input.is_action_just_pressed("weapon1")):
		Global.playerIsFiringWeapon1 = true
	if(Input.is_action_just_released("weapon1")):
		Global.playerIsFiringWeapon1 = false
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

func fireWeapon1():
	var pos_left = get_node("cannons/left").global_position
	var pos_right = get_node("cannons/right").global_position
	create_weapon1(pos_left)
	create_weapon1(pos_right)
	yield(get_tree().create_timer(0.50), "timeout")

func fireBomb():
	if(canFireBomb):
		print("bomb fired")
		canFireBomb = false
		yield(get_tree().create_timer(bombTimeout), "timeout")
		canFireBomb = true
	
func create_weapon1(pos):
	var weapon1 = scn_weapon1.instance()
	weapon1.position = pos
	get_tree().get_root().add_child(weapon1)
	pass

func _physics_process(delta):
	if (Global.playerIsFiringWeapon1):
		fireWeapon1()
	get_input()
	velocity = move_and_slide(velocity)
	position.x = clamp(position.x, -Global.screen_size.x/2 +12, Global.screen_size.x/2 -12)
	position.y = clamp(position.y, -Global.screen_size.y + 38, 15 )
	

