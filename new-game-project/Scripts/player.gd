extends CharacterBody2D

var accel = Vector2(0, 0)
var speedCapX = 200
var speedCapY = 40
var gravity = 100
var animatedSprite: AnimatedSprite2D
var sprite = load("res://Scenes/Skins/" + Global.chosenPlayer + "Skin.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#velocity.x = 50
	#velocity.y = 50
	var playerSprite = sprite.instantiate()
	add_child(playerSprite)
	animatedSprite = playerSprite
	pass # Replace with function body.

func _process(delta: float) -> void:
	#print("x velocity " + str(velX))
	#print("x accel " + str(accel.x))
	# apply physics vectors
	velocity.x += accel.x
	velocity.y += accel.y + gravity * delta
	move_and_slide()
	

	# Get accelerometer input for movement
	velocity.x += accel.x
	if (abs(velocity.x) > speedCapX):
		velocity.x = speedCapX * (velocity.x / abs(velocity.x))
	velocity.y += accel.y
	velocity.y = minf(abs(velocity.y), speedCapY)
	# apply physics
	move_and_slide()
	# Play animation based on angular velocity
	if velocity.x < 0:
		animatedSprite.play("tilt_left")
	elif velocity.x > 0:
		animatedSprite.play("tilt_right")
	else:
		animatedSprite.play("idle")
	pass
