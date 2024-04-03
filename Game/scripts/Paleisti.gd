extends Button



@export var slots: Array[Inventoryslot]
@export var itemRes: InventoryItem
@export var inventory: Inventory

func _on_pressed():
	inventory.paleisti(itemRes)
