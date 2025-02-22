extends Node

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Called to acquire wind acceleration offset
func get_wind_accel() -> float:
	# range stub until precise physics determined for player
	# sign determines direction
	return rng.randf_range(-1, 1)
