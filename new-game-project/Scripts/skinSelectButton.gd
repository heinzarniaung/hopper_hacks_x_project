extends Button

@export var skinType: int
@export var cost: int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()


func update():
	if (Global.unlockedPlayers[skinType]):
		self.text = "Select"
	else:
		self.text = "Buy - " + str(cost)
