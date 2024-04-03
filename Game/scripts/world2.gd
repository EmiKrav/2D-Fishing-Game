extends Node2D

signal energychanged 
var maxenergy = 10
var currentEnergy: float = maxenergy
# Called when the node enters the scene tree for the first time.
func _ready():
	currentEnergy = maxenergy
	energychanged.emit(currentEnergy)
