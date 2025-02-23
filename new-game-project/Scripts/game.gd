extends Node

@export var windLeft: Node2D
@export var windRight: Node2D
@export var scoreText: RichTextLabel
@export var seagulls: AudioStreamPlayer2D
@export var defeat: AudioStreamPlayer2D
@export var spawnCoins: Array[Node2D]
@onready var coin = preload("res://Scenes/coin.tscn")
var player

var time_elapsed = 0 # in seconds
var time_till_next = 5
var wind_rng = RandomNumberGenerator.new()

var wind_chance = 0.1
var wind_strength = 0
var wind_duration = 10
var wind_variation = 5
#allows for different inputs
var inputAccel = 0

var max_accel = 20
var gravity = 400

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_node("Player")
	pass # Replace with function body.

func death():
	Global.defeat()
	Global.save_score()
	get_tree().change_scene_to_file("res://Scenes/EndScreen.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elapsed += delta
	if (!defeat.playing):
		Global.score += delta
	scoreText.text = "Score: " + str(int(Global.score))
	# stub - will be retrieved from gyroscope input
	var gyro_x_accel = 0
	var new_x_accel = gyro_x_accel
	if time_elapsed > time_till_next:
		#print("wind!")
		# enable wind
		time_elapsed = 0
		seagulls.play()
		var coinSpawn = spawnCoins[wind_rng.randi_range(0, 3)]
		var newCoin = coin.instantiate()
		add_child(newCoin)
		newCoin.position = coinSpawn.position
		wind_strength = wind_rng.randf_range(- wind_variation, wind_variation)
		time_till_next = (wind_rng.randf_range(0, 1) * 5) + 10
		if (wind_strength > 0):
			activateWindLeft()
		elif (wind_strength < 0):
			activateWindRight()
	if time_elapsed > wind_duration:
		turnOffWind()
	returnAcceleration()
	player.accel.x = wind_strength + inputAccel
	player.accel.y = gravity

func returnAcceleration():
	inputAccel = Input.get_accelerometer().normalized().x * max_accel
	if Input.is_action_pressed("ui_left"):
		inputAccel = -10
	elif Input.is_action_pressed("ui_right"):
		inputAccel = 10

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
	defeat.play()
	await get_tree().create_timer(2).timeout
	call_deferred("death")
	body.queue_free()
	pass # Replace with function body.
