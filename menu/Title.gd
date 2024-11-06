extends Sprite2D

var screen: Vector2 = DisplayServer.window_get_size()
var width = screen.x/5

func _ready() -> void:
	if(screen.x/screen.y<=2.17):
		width=390
	else:
		width=390*screen.x/screen.y/2.17
	position.x=-width+185

func _on_play_released() -> void:
	self.queue_free()
