extends Node

var player

var time_elapsed = 0 # in seconds

var wind_rng = RandomNumberGenerator.new()
var wind_chance = 0.1
var wind_duration = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("Player")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elapsed += delta
	# every 5 seconds, wind_chance chance of applying random wind acceleration
	if (time_elapsed % 5) == 0 && wind_rng.randf_range(0, 1) < wind_chance:
		# apply wind, stub 
		wind_rng.randf_range(-1, 1)
	pass
