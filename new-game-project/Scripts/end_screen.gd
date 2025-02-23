extends Control

@export var label: RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "HighScore: " + str(int(Global.highScore))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	#Change scene to main screen
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn")
	pass # Replace with function body.
