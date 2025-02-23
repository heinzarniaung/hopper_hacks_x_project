extends Area2D
@export var pickup: AudioStreamPlayer2D
@export var animation: AnimatedSprite2D
func remove():
	queue_free()

func _ready() -> void:
	animation.play("idle")

func _on_body_entered(body: Node2D) -> void:
	Global.doubloons += 1
	position.y -= 10
	pickup.play()
	await get_tree().create_timer(0.5).timeout
	call_deferred("remove")
	pass # Replace with function body.
