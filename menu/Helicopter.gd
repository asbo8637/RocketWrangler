extends Sprite2D

const character = preload("res://Player/character.tscn")
const explosion = preload("res://Rocket/explosion.tscn")

@onready var spriteP = $Player
@onready var timer = $JiggleTimer
@onready var jumpTimer = $jumpTimer
var rng = RandomNumberGenerator.new()
var randomX
var randomY
var randomTime

func _physics_process(_delta):
	if(timer.is_stopped()):
		randomY = rng.randf_range(-2,2)
		randomX = rng.randf_range(-89,-87)
		randomTime=rng.randf_range(.05,.15)
		timer.wait_time=randomTime
		timer.start()
		self.position=Vector2(randomX, randomY)



func _on_jump_timer_timeout() -> void:
	spriteP.visible=false
	var player = character.instantiate()
	get_parent().add_child(player)
	player.rotation=45
	player.position=Vector2(2,2)



func _on_play_released() -> void:
	spriteP.frame=1
	spriteP.global_position=Vector2(14, 12)
	spriteP.global_rotation_degrees=-45
	jumpTimer.start()
