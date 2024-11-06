extends Area2D


var width: float = ProjectSettings.get_setting("display/window/size/viewport_width")/5
@onready var sprite= $Sprite2D
@export var speed: float = 4

func _ready() -> void:
	swap()
	
func swap():
	var rng = RandomNumberGenerator.new()
	var randNumber=rng.randi_range(0,6)
	sprite.frame=randNumber

func _physics_process(_delta):
	self.position.x-=speed
	if(position.x<=-544):
		global_position = Vector2(544,148)
		swap()
