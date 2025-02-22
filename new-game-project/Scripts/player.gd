extends CharacterBody2D

@export var animatedSprite: AnimatedSprite2D
var accel = Vector2(0, 0)
var velX = 0
var velY = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#velocity.x = 50
	#velocity.y = 50
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("x velocity " + str(velX))
	#print("x accel " + str(accel.x))
	# apply physics vectors
	velX += accel.x
	velY += accel.y
	velocity.x = velX
	velocity.y = velY
	move_and_slide()
	pass
