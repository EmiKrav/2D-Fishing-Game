extends CharacterBody2D

@export var chasespeed = 20
@export var limit = 0.5
var player_chase = false
var player = null
var startPosition
var endPosition

var my_csharp_script = load("res://scripts/decorator.cs")
var my_csharp_node = my_csharp_script.new()

var my_csharp_script2 = load("res://scripts/strategy.cs")
var my_csharp_node2 = my_csharp_script2.new()

@export var svorismaz: String



func _ready():
	
	#my_csharp_node.Print()
	
	#var svorisdid = my_csharp_node.PrintSudideliusvoriu()
	svorismaz = my_csharp_node.PrintSumazusvoriu()
	Global.laikinas = svorismaz
	#print_debug(svorismaz)
	
	#print_debug(svorismaz)
	#print_debug(svorisdid)
	
	
	#var greitis1 = my_csharp_node2.PrintGreitis1()
	
	#print_debug(greitis1)
	
	#var greitis2 = my_csharp_node2.PrintGreitis2()
	
	#print_debug(greitis2)
	
	var greitis3 = my_csharp_node2.PrintGreitis3()
	
	chasespeed = greitis3
	#print_debug(greitis3)
	
	startPosition = position
	endPosition = startPosition + Vector2(0, 3*16)

func changeDirection():
	var temEnd = endPosition
	endPosition = startPosition + Vector2(randi_range(-16,16), randi_range(-16,16))
	startPosition = temEnd	
func updateVelocity():
	
		var moveDirection = (endPosition - position)
		var tep=position
		if moveDirection.length() < limit:	
			changeDirection()
		velocity = moveDirection.normalized()*chasespeed
		

func _on_detection_area_body_entered(body):
	if body.name == "plude":
		player_chase = true
		#print_debug(body.name)
		endPosition = body.position
		var moveDirection = (endPosition - position)
		velocity = moveDirection.normalized()*chasespeed
		startPosition = endPosition
		


func _on_detection_area_body_exited(body):
	if body.name == "plude":
		player = null
		player_chase = false
		

@export var itemRes: InventoryItem


func collect(inventory: Inventory):
	get_node("CollisionShape2D").disabled = true 
	get_node("detection_area").disabled = true 
	inventory.insert(itemRes)
	
	
	
func _physics_process(delta):
	updateVelocity()	
	move_and_slide()		
	
	

