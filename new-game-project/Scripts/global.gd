extends Node

var saveFile = "user://highscore.save"
var score = 0
var highScore = 0
#Use this for unlocks if time permits
var doubloons = 0

func _ready() -> void:
	#Add save load if there is time
	if FileAccess.file_exists(saveFile):
		var save = FileAccess.open(saveFile, FileAccess.READ)
		var json_string = save.get_line()
		var json = JSON.new()
		json = json.parse(json_string)
		var data = json.data
		highScore = data[0]
		doubloons = data[1]
			
	pass # Replace with function body.
	
func save():
	var save_dict = {
		"highScore":highScore,
		"doubloons":doubloons
	}
	return save_dict

func save_score():
	var save = FileAccess.open(saveFile, FileAccess.WRITE)
	var data = save()
	var json_data = JSON.stringify(data)
	save.store_line(json_data)
	
func defeat():
	if(score > highScore):
		highScore = score
	score = 0
	
