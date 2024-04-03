extends HBoxContainer

@onready var EnergyGuiClass = preload("res://scenes/panel.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setMaxEnergy(maximum: float):
	for i in range(maximum):
		var energy = EnergyGuiClass.instantiate()
		add_child(energy)

func updateEnergy(currentenergy: float):
	var energy = get_children()
	
	for i in range(currentenergy):
		energy[i].update(true)
	
	for i in range(currentenergy, energy.size()):
		energy[i].update(false)
		
		
		
