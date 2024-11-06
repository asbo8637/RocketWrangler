extends TouchScreenButton

@onready var sprite = $PlaySprite
var screen: Vector2 = DisplayServer.window_get_size()
var width = screen.x/5

func _ready():
	if(screen.x/screen.y<=2.17):
		width=390
	else:
		width=390*screen.x/screen.y/2.17
	position.x=width-135

func _on_released() -> void:
	self.queue_free()


func _on_pressed() -> void:
	sprite.frame=1
