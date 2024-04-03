extends Control

var isOpen: bool = false

@export var Inventory: Inventory = preload("res://inventory/player_inventory.tres")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()


func _ready():
	Inventory.updated.connect(update)
	update()
	

func update():
	for i in range(min(Inventory.slots.size(), slots.size())):
		slots[i].update(Inventory.slots[i])
		
		
func open():
	visible = true
	isOpen = true
	
func close ():
	visible = false
	isOpen = false
	

