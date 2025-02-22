extends Node

var player

var time_elapsed = 0 # in seconds

var wind_rng = RandomNumberGenerator.new()
var wind_chance : float = 0.1
var wind_interval : float = 5 # in seconds
var wind_start : float = 0
var wind_variation : float = 1 # in velocity units
var wind_default_duration : float = 10 # in seconds
var is_windy : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("Player")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elapsed += delta
	
	# will be retrieved from gyroscope input
	var gyro_x_accel = 0 # stub
	# every 5 seconds, wind_chance chance of applying random wind acceleration
	var new_x_accel = gyro_x_accel
	
	if !is_windy && (time_elapsed % wind_interval) == 0 && wind_rng.randf_range(0, 1) < wind_chance:
		is_windy = true
		wind_start = time_elapsed
	else:
		is_windy = time_elapsed - wind_start < wind_default_duration
		new_x_accel += wind_rng.randf_range(-wind_variation, wind_variation)
	
	player.accel.x = new_x_accel
	pass
