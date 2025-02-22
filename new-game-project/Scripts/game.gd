extends Node

@export var windLeft = Node2D
@export var windRight = Node2D
var player

var time_elapsed = 0 # in seconds
var time_till_next = 5
var wind_rng = RandomNumberGenerator.new()

var wind_variation : float = 10 # in velocity units

var wind_chance = 0.1
var wind_strength = 0
var wind_duration = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("Player")
	
	# setup game
	#var plank = get_node("temp_plank")
	
	
	
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
		wind_strength = wind_rng.randf_range(-wind_variation, wind_variation)
		time_till_next = (wind_rng.randf_range(0,1) * 5) + 10
		if(wind_strength > 0):
			activateWindLeft()
		elif(wind_strength < 0):
			activateWindRight()
	if time_elapsed > wind_duration:
		turnOffWind()
	# update new accel
	new_x_accel += wind_strength
	# assign updated acceleration
	#print("new accel " + str(new_x_accel))
	player.accel.x = new_x_accel

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
	windLeft.visible = false
	windRight.visible = false
	windLeft.turnOff()
	windRight.turnOff()


func _on_static_body_2d_body_entered(body: Node2D) -> void:
	death()
	pass # Replace with function body.
