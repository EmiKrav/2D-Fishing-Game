extends Node2D

@onready var  energyContainer = $CanvasLayer/HBoxContainer
@onready var player = $player
@onready var plude = $plude
#var fishs=preload("res://scenes/fish.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	energyContainer.setMaxEnergy(player.maxenergy)
	energyContainer.updateEnergy(player.currentEnergy)
	plude.energychanged.connect(energyContainer.updateEnergy)
	


