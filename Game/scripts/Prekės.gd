extends TabBar



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$RichTextLabel/control.position.x = -$HScrollBar.value
