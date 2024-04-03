extends CharacterBody2D


const SPEED = 100
var current_dir = "none"
@export var maxenergy = 10
@export var currentEnergy: float = maxenergy

@export var inventory: Inventory

var meskereyra = true
var cooldown = true
@onready var plude  = preload("res://scenes/plude.tscn")

func _physics_process(delta):
	player_movement(delta)
	
	var mousepos = get_global_mouse_position()
	$Marker2D.global_position = mousepos
	
	
	
	if Input.is_action_just_pressed("leftmouse") and meskereyra and cooldown:
		mesti()
	elif Input.is_action_just_pressed("rightmouse") and meskereyra:
		if $"..".get_node("plude") != null:
			$"..".get_node("plude").visible = false
			$"..".get_node("plude/Area2D").visible = false
			$"..".get_node("plude/Area2D/CollisionShape2D").set_deferred("disabled", true)
			$"..".get_node("plude/Area2D/CollisionShape2D").visible = false
			$"..".get_node("plude/CollisionShape2D").set_deferred("disabled", true)
			$"..".get_node("plude/CollisionShape2D").visible = false
			cooldown = true
		
		
func mesti():
	
	$"..".get_node("plude").global_position = $Marker2D.global_position
	$"..".get_node("plude").global_rotation = $Marker2D.global_rotation
	$"..".get_node("plude").visible = true
	$"..".get_node("plude/Area2D").visible = true
	$"..".get_node("plude/Area2D/CollisionShape2D").set_deferred("disabled", false)
	$"..".get_node("plude/Area2D/CollisionShape2D").visible = true
	$"..".get_node("plude/CollisionShape2D").set_deferred("disabled", false)
	$"..".get_node("plude/CollisionShape2D").visible = true
	cooldown = false
	

	
func  player_movement(_delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = SPEED
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -SPEED
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
	if current_dir == "none":
			anim.play("side_idle")	


