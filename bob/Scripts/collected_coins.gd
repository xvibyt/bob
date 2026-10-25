class_name CollectedCoinsUI extends CanvasLayer

@onready var AmountDisplay = $Panel/Label


func update(coins: int) -> void:
	AmountDisplay.text = str(coins)
