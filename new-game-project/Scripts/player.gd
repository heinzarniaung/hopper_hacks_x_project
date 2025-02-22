extends CharacterBody2D

@export var animatedSprite: AnimatedSprite2D
var accel = Vector2(0, 0)
var speed = 400
var gravity = 400


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#velocity.x = 50
	#velocity.y = 50
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
	pass
