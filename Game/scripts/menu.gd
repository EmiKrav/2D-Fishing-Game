extends Control


func _on_naujas_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


func _on_testi_pressed():
	pass # Replace with function body.


func _on_iseiti_pressed():
	get_tree().quit()