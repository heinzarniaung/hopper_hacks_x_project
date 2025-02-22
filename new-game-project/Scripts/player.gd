extends CharacterBody2D  # Changed from Node to CharacterBody2D

@export var animatedSprite: AnimatedSprite2D
var accel = Vector2()

func _process(delta: float) -> void:

	# Get accelerometer input for movement
	velocity.x += accel.x
	velocity.y += accel.y
	# apply physics
	move_and_slide()
	# Play animation based on angular velocity
	if velocity.x < 0:
		animatedSprite.play("tilt_left")
	elif velocity.x > 0:
		animatedSprite.play("tilt_right")
	else:
		animatedSprite.play("idle")
