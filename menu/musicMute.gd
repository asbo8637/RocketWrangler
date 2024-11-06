extends TouchScreenButton

@onready var muteSprite = $musicSprite
@onready var music_bus = AudioServer.get_bus_index("Music")

func _on_released() -> void:
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))
	if(AudioServer.is_bus_mute(music_bus)):
		muteSprite.frame=1
	else:
		muteSprite.frame=0

func _ready() -> void:
	if(AudioServer.is_bus_mute(music_bus)):
		muteSprite.frame=1
	else:
		muteSprite.frame=0


func _on_play_released() -> void:
	self.queue_free()
