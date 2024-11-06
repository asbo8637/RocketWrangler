extends CharacterBody2D


var screen: Vector2 = DisplayServer.window_get_size()
var width = screen.x/5
@onready var sound = $AudioStreamPlayer2D
@export var movement: Vector2 = Vector2.ZERO
@export var gravity: float = 20
var rotateSpeed = -.2
var bounceFlag: bool = true

func _ready() -> void:
	if(screen.x/screen.y<=2.17):
		width=390
	else:
		width=390*screen.x/screen.y/2.17

func _physics_process(_delta):
	if(movement.x>0):
		rotateSpeed=0.3
	else:
		rotateSpeed=-0.3
	velocity=movement
	movement.y+=gravity 
	rotate(rotateSpeed)
	move_and_slide()
	if(global_position.y>420):
		get_tree().change_scene_to_file("res://level/Map.tscn")



func _on_area_2d_area_entered(area: Area2D) -> void:
	if (area.is_in_group("ground") and bounceFlag):
		movement.y*=-.85
		bounceFlag=false
		sound.play()
		
