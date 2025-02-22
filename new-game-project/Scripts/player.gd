extends CharacterBody2D  # Changed from Node to CharacterBody2D

@export var animatedSprite: AnimatedSprite2D
var speed = 400
var gravity = 400
var ang = 0
var ang_velocity = 0.0  # Measured in degrees per second
var ang_accel = 0.0  # Measured in degrees per second per second

func _process(delta: float) -> void:
	# Apply rotation physics
	ang += ang_velocity * delta
	ang_velocity += ang_accel * delta

	# Get accelerometer input for movement
	velocity.x = Input.get_accelerometer().normalized().x * speed

	# Play animation based on angular velocity
	if ang_velocity < 0:
		animatedSprite.play("tilt_left")
	elif ang_velocity > 0:
		animatedSprite.play("tilt_right")
	else:
		animatedSprite.play("idle")

func set_accel(change_accel: float) -> void:
	ang_accel += change_accel

func _physics_process(delta):
	velocity.y += gravity * delta 
	move_and_slide()  
