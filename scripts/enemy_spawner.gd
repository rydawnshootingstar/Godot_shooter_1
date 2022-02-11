extends Node2D

const enemy_basic = preload("res://scenes/enemy_basic.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	spawnWave1()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawnWave1():
	var enemy = enemy_basic.instance()
	yield(Global.wait(2.0), "timeout")
	spawnEnemy(75)
	#Global.wait(5.0)
	yield(Global.wait(5.0), "timeout")
	#spawnEnemy(Global.randomX())
	spawnEnemy(130)
	yield(Global.wait(4.0), "timeout")
	spawnEnemy(10)
#func wait(waitTime:float=1.0):
#	yield(get_tree().create_timer(waitTime), "timeout")

	
func spawnEnemy(horizontalPosition:int):
	var enemy = enemy_basic.instance()
	enemy.position.x = horizontalPosition
	get_node("container").add_child(enemy)
	pass
