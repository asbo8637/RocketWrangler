extends Node2D

@onready var outside=false
@onready var rocketPos=Vector2.ZERO
var screen: Vector2 = DisplayServer.window_get_size()
var width = screen.x/5

func _ready() -> void:
	if(screen.x/screen.y<=2.17):
		width=390
	else:
		width=390*screen.x/screen.y/2.17
		

func _physics_process(_delta):
	if(outside):
		position=rocketPos
		if(abs(position.x)>width-35):
			position.x=(width-35)*sign(position.x)
		if(position.y<-145):
			position.y=-145
		look_at(rocketPos)
		
	
func setPos(x: Vector2):
	rocketPos=x
	outside=true
	visible=true
	
func turnOff():
	outside=false
	visible=false
