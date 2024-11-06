extends Button

@onready var tutorial = $Tutorial


func _on_button_up() -> void:
	tutorial.visible=true


func _on_play_button_up() -> void:
	self.queue_free()
