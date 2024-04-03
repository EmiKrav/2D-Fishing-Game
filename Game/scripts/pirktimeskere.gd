extends Button


@export var slots: Array[Inventoryslot]
@export var itemRes: InventoryItem
@export var inventory: Inventory


func _on_pressed():
	if $"../Label".text.substr(0, $"../Label".text.length()-1) as float <= Global.pinigai:
		inventory.insertpirkinius(itemRes)
		Global.pinigai -= $"../Label".text.substr(0, $"../Label".text.length()-1) as float

