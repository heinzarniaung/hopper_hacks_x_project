extends Node

@export var animatedSprite: AnimatedSprite2D
var ang = 0
var ang_velocity = 0.0 # measured in degrees per second
var ang_accel = 0.0 # measured in degrees per second per second
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# apply physics vectors
	ang += ang_velocity * delta
	ang_velocity += ang_accel * delta
	if(ang_velocity < 0):
		animatedSprite.play("tilt_left")
	elif(ang_velocity > 0):
		animatedSprite.play("tilt_right")
	else:
		animatedSprite.play("idle")
	pass

func set_accel(change_accel : float) -> void:
	ang_accel += change_accel
