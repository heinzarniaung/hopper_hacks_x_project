extends Node

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
	
	pass

func set_accel(new_accel : float) -> void:
	ang_accel = new_accel
