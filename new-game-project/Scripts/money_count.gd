extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update()

func update():
	self.text = "Doubloons- " + str(Global.doubloons)