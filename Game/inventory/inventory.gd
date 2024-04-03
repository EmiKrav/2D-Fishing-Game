extends Resource

class_name Inventory

signal updated
signal energychanged 

@export var maxenergy = 10
@export var currentEnergy: float = maxenergy

@export var slots: Array[Inventoryslot]

func insert(item: InventoryItem):
	var itemSlots = slots.filter(func (slots): return slots.item != null and item != null and slots.item.resource_name == item.resource_name)
	if !itemSlots.is_empty():
		itemSlots[0].amount += 1
	else:
		var emptySlots = slots.filter(func (slots): return slots.item == null)
		if !emptySlots.is_empty():
			emptySlots[0].item = item
			emptySlots[0].amount = 1
	var svor = Global.laikinas.substr(7, Global.laikinas.length()-10)
	svor = svor.replace(",", ".")
	Global.svoris += float(str(svor))
	energychanged.emit(currentEnergy)
	updated.emit()	
	
func remove(item: InventoryItem):
	var itemSlots = slots.filter(func (slots): return slots.item != null and item != null and slots.item.resource_name == item.resource_name)
	if !itemSlots.is_empty():
		itemSlots[0].item = null
		itemSlots[0].amount = 0
		Global.pinigai += Global.svoris * 0.1
		Global.svoris = 0
	updated.emit()	

func paleisti(item: InventoryItem):
	var itemSlots = slots.filter(func (slots): return slots.item != null and item != null and slots.item.resource_name == item.resource_name)
	if !itemSlots.is_empty():
		itemSlots[0].item = null
		itemSlots[0].amount = 0
		Global.svoris = 0
	updated.emit()	
	
func insertpirkinius(item: InventoryItem):
	var itemSlots = slots.filter(func (slots): return slots.item != null and item != null and slots.item.resource_name == item.resource_name)
	if !itemSlots.is_empty():
		itemSlots[0].amount += 1
	else:
		var emptySlots = slots.filter(func (slots): return slots.item == null)
		if !emptySlots.is_empty():
			emptySlots[0].item = item
			emptySlots[0].amount = 1
	updated.emit()	
