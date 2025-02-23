extends Control

@export var startGame: AudioStreamPlayer2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("SettingsMenuCanvasLayer").hide();
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print("test")
	pass

func _on_new_game_pressed() -> void:
	print("NewGame button pressed.")
	startGame.play()
	await get_tree().create_timer(3.5).timeout
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")


func _on_settings_pressed() -> void:
	get_node("SettingsMenuCanvasLayer").show();
	print("Settings button pressed.");

func _on_leaderboard_pressed() -> void:
	print("Leaderboard button pressed.")


func _on_credits_pressed() -> void:
	pass # Replace with function body.
