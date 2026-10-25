class_name CollectedCoinsUI extends CanvasLayer

@onready var AmountDisplay = $Panel/Label


func update(coins: int) -> void:
	print("ADD COIN")
	AmountDisplay.text = str(coins)
