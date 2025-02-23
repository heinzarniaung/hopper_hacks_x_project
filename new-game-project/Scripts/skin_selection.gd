extends Node2D

@export var button1: Button
@export var button2: Button
@export var button3: Button
@export var label: RichTextLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_skele_pressed() -> void:
	if (Global.unlockedPlayers[1]):
		Global.chosenPlayer = "skele"
	elif (Global.doubloons >= button1.cost):
		Global.unlockedPlayers[1] = true
		Global.doubloons -= button1.cost
		label.update()
		button1.update()

func _on_fancy_pressed() -> void:
	if (Global.unlockedPlayers[2]):
		Global.chosenPlayer = "fancy"
	elif (Global.doubloons >= button2.cost):
		Global.unlockedPlayers[2] = true
		Global.doubloons -= button2.cost
		label.update()
		button2.update()

func _on_regular_pressed() -> void:
	Global.chosenPlayer = "regular"


func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/MainMenu.tscn")
	pass # Replace with function body.
