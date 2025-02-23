extends Node

var saveFile = "highscore.save"
var score = 0
var highScore = 0
var chosenPlayer = "regular"
var unlockedPlayers = [true, false, false]
#Use this for unlocks if time permits
var doubloons = 50

func _ready() -> void:
	#Add save load if there is time
	if FileAccess.file_exists(saveFile):
		var saved = FileAccess.open(saveFile, FileAccess.READ)
		var json_string = saved.get_line()
		var json = JSON.new()
		var jsonLine = json.parse(json_string)
		print(json_string)
		var data = json.data
		highScore = data.get("doubloons")
		doubloons = data.get("highScore")
		chosenPlayer = data.get("chosenPlayer")
		unlockedPlayers = data.get("unlockedPlayers")
			
	pass # Replace with function body.
	
func save():
	var save_dict = {
		"highScore": highScore,
		"doubloons": doubloons,
		"chosenPlayer": chosenPlayer,
		"unlockedPlayers": unlockedPlayers
	}
	return save_dict

func save_score():
	var saved = FileAccess.open(saveFile, FileAccess.WRITE)
	var data = save()
	var json_data = JSON.stringify(data)
	saved.store_line(json_data)
	
func defeat():
	print(score)
	if (score > highScore):
		highScore = score
	score = 0
