extends Node

@export var animatedSprite: AnimatedSprite2D
var x = 0.0
var y = 0.0
var velocity = Vector2(0, 0)
var accel = Vector2(0, 0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# apply physics vectors
	x += velocity.x
	y += velocity.y
	velocity.x += accel.x
	velocity.y += accel.y
	pass
