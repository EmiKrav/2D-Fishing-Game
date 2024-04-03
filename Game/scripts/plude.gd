extends CharacterBody2D

const SPEED = 100
var current_dir = "none"
signal energychanged 

@export var maxenergy = 10
@onready var currentEnergy: float = maxenergy

func _physics_process(delta):
	player_movement(delta)
	
func  player_movement(_delta):
	if Input.is_key_pressed(KEY_D):
		current_dir = "right"
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_key_pressed(KEY_A):
		current_dir = "left"
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_key_pressed(KEY_S):
		current_dir = "down"
		velocity.x = 0
		velocity.y = SPEED
	elif Input.is_key_pressed(KEY_W):
		current_dir = "up"
		velocity.x = 0
		velocity.y = -SPEED
	else:
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()

@export var inventory: Inventory


func _on_area_2d_area_entered(area):
	
	if area.has_method("collect"):
		$"..".get_node("./fish").queue_free()
		
		area.collect(inventory)
		Global.patirtis += 10

		currentEnergy -= 1
		energychanged.emit(currentEnergy)
		if currentEnergy < 0:
			get_tree().change_scene_to_file("res://scenes/world2.tscn")
			

