extends Timer

var fishs=preload("res://scenes/fish.tscn")

var count = 0
func _on_timeout():
	while(count<1):
		var fish = fishs.instantiate()
		fish.position = Vector2(427, 129)
		fish.name = "fish"
		if(fish.name == "fish"):
			$"..".add_child(fish)
			count+=1
	if $"..".get_node("./fish") == null:
		count=0
		
