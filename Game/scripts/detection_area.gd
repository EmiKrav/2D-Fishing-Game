extends Area2D


@export var itemRes: InventoryItem = preload("res://inventory/items/fish.tres")


func collect(inventory: Inventory):
	inventory.insert(itemRes)
	self.queue_free()
	
