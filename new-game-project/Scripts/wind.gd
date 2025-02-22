extends Node

@export var windArrays: Array[AnimatedSprite2D]

func turnOn():
	for wind in windArrays:
		wind.play("wind")
		
func turnOff():
	for wind in windArrays:
		wind.stop();
