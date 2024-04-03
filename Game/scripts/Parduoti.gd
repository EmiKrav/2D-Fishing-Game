extends Button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

@export var slots: Array[Inventoryslot]
@export var itemRes: InventoryItem
@export var inventory: Inventory

func _on_pressed():
	inventory.remove(itemRes)
