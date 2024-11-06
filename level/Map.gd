extends Node2D

@export var score: int = 0
@onready var scoreText = $scoreText

const character = preload("res://Rocket/rocket.tscn")
var rng = RandomNumberGenerator.new()
var randomEdge = rng.randi_range(0,2)
var screen: Vector2 = DisplayServer.window_get_size()
var width = screen.x/5
var randomX = rng.randf_range(-width+30, width-30)
var randomY = rng.randf_range(-100, 200)

func _ready() -> void:
	if(screen.x/screen.y<=2.17):
		width=390
	else:
		width=390*screen.x/screen.y/2.17

func _physics_process(_delta):
	scoreText.text="Score: " + str(score) +" \nHigh Score: " + str(HighScoreTracker.highscore)
	if(score>HighScoreTracker.highscore):
		HighScoreTracker.highscore=score
		HighScoreTracker.save_score()
	



func _on_timer_timeout() -> void:
	var child = character.instantiate()
	add_child(child)
	var randomSpeed = rng.randf_range(50, 150)
	
	if(randomEdge==0):
		randomEdge=rng.randi_range(1,2)
		randomY-=100
		child.initialSpeed = randomSpeed*Vector2(40000, -randomY*(abs(randomX)+20)).normalized()
		child.global_position = Vector2(-width-45, randomY)
		randomX = rng.randf_range(-150, width-30)
		randomY = rng.randf_range(-100, 200)
	elif(randomEdge==1):
		randomEdge=2*rng.randi_range(0,1)
		if(randomX>width-100):
			randomEdge=0
		elif(randomX<-width+100):
			randomEdge=2
		child.initialSpeed = randomSpeed* Vector2(-(abs(randomY)+20)*randomX, 40000).normalized()
		child.global_position = Vector2(randomX, -225)
		randomX=rng.randf_range(-width+30, width-30)
		randomY = rng.randf_range(0, 180)
	else:
		randomEdge=rng.randi_range(0,1)
		randomY-=100
		child.initialSpeed = randomSpeed*Vector2(-40000, -(randomY*abs(randomX)+20)).normalized()
		child.global_position = Vector2(width+45, randomY)
		randomX=rng.randf_range(-width+30, 150)
		randomY = rng.randf_range(-100, 200)



func _on_home_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu/menu.tscn")
