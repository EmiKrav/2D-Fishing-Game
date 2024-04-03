extends Label


# Called when the node enters the scene tree for the first time.
func _process(delta):
	self.text = "Bendras svoris: " + str(Global.svoris) + " kg"
