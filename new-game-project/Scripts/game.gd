extends Node

@export var windLeft = Node2D
@export var windRight = Node2D
var player

var time_elapsed = 0 # in seconds
var time_till_next = 5
var wind_rng = RandomNumberGenerator.new()

var wind_chance = 0.1
var wind_strength = 0
var wind_duration = 10
var wind_variation = 10

var max_speed = 100
var gravity = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("Player")
	pass # Replace with function body.

func death():
	Global.save_score()
	get_tree().change_scene_to_file("res://Scenes/EndScreen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elapsed += delta
	# stub - will be retrieved from gyroscope input
	var gyro_x_accel = 0
	var new_x_accel = gyro_x_accel
	
	#print(time_elapsed)

	if time_elapsed > time_till_next:
		#print("wind!")
		# enable wind
		time_elapsed = 0
		wind_strength = wind_rng.randf_range(- wind_variation, wind_variation)
		time_till_next = (wind_rng.randf_range(0, 1) * 5) + 10
		if (wind_strength > 0):
			activateWindLeft()
		elif (wind_strength < 0):
			activateWindRight()
	if time_elapsed > wind_duration:
		turnOffWind()
	player.accel.x = wind_strength + Input.get_accelerometer().normalized().x * max_speed
	player.accel.y = gravity
	if Input.is_action_pressed("ui_left"):
		player.accel.x = -5
	elif Input.is_action_pressed("ui_right"):
		player.accel.x = 5

func activateWindLeft():
	windLeft.visible = true
	windLeft.turnOn()
	pass

func activateWindRight():
	windRight.visible = true
	windRight.turnOn()
	pass
	
func turnOffWind():
	wind_strength = 0
	wind_strength = 0
	windLeft.visible = false
	windRight.visible = false
	windLeft.turnOff()
	windRight.turnOff()


func _on_area_2d_body_entered(body: Node2D) -> void:
	call_deferred("death")
	body.queue_free()
	pass # Replace with function body.
