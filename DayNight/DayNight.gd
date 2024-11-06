extends Node2D

@onready var background = $background
@onready var stars = $stars

func _physics_process(_delta):
	rotate(.002)
	if(self.rotation_degrees>80 and self.rotation_degrees<100):
		background.modulate-=Color(.0031,.0046,.0046,0)
	elif(self.rotation_degrees>260 and self.rotation_degrees<280):
		background.modulate+=Color(.0031,.0046,.0046,0)
	elif(self.rotation_degrees>280 and self.rotation_degrees<281):
		background.modulate=Color(1,1,1,1)
	
	if(self.rotation_degrees>=90 and self.rotation_degrees<=100):
		stars.modulate=Color(0.11,0.49,0.75,1)*2*(self.rotation_degrees-89)
	elif(self.rotation_degrees>=260 and self.rotation_degrees<=270):
		stars.modulate=Color(0.11,0.49,0.75,1)*(271-self.rotation_degrees)
	elif(self.rotation_degrees>270 and self.rotation_degrees<271):
		stars.modulate=Color(0.11,0.49,0.75,1)
	
	
	stars.rotate(0.0003)
	
	if(self.rotation_degrees>=360):
		self.rotation_degrees-=360
