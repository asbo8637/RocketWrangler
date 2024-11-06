extends TouchScreenButton

@onready var muteSprite = $muteSprite
@onready var music_bus = AudioServer.get_bus_index("Master")
var screen: Vector2 = DisplayServer.window_get_size()
var width = screen.x/5

func _on_released() -> void:
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	if(AudioServer.is_bus_mute(music_bus)):
		muteSprite.frame=1
	else:
		muteSprite.frame=0

func _ready() -> void:
	if(screen.x/screen.y<=2.17):
		width=390
	else:
		width=390*screen.x/screen.y/2.17
	position.x=-width+30
	
	if(AudioServer.is_bus_mute(music_bus)):
		muteSprite.frame=1
	else:
		muteSprite.frame=0


func _on_play_released() -> void:
	self.queue_free()
