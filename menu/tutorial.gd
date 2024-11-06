extends Node2D


func _on_touch_screen_button_released() -> void:
	self.visible=false
	for _i in get_parent().get_parent().get_children():
		_i.visible=true
	
