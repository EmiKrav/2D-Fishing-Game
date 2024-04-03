extends Panel

@onready var backroundSprite: Sprite2D = $backround
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/item
@onready var textreact = $CenterContainer/Panel/item/TextureRect
@onready var amountlabel: Label = $CenterContainer/Panel/item/TextureRect/Label

func update(slot: Inventoryslot):
	if !slot.item:
		backroundSprite.frame = 0
		itemSprite.visible = false
		amountlabel.visible = false
	else:
		backroundSprite.frame = 1
		itemSprite.visible = true
		
		amountlabel.visible = true
		amountlabel.text = str(slot.amount)
		textreact.texture = slot.item.texture
