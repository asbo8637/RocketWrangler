extends TouchScreenButton


@onready var tutorial = $Credits
@onready var sprite = $creditsSprite
var screen: Vector2 = DisplayServer.window_get_size()
var width = screen.x/5

func _ready() -> void:
	if(screen.x/screen.y<=2.17):
		width=390
	else:
		width=390*screen.x/screen.y/2.17
	position.x=width-135

func _on_pressed() -> void:
	sprite.frame=1


func _on_released() -> void:
	for _i in get_parent().get_children():
		_i.visible=false
	visible=true
	tutorial.position.x=-position.x/10
	sprite.frame=0
	tutorial.visible=true


func _on_play_released() -> void:
	self.queue_free()
