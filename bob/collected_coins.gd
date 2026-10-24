class_name CollectedCoinsUI extends Panel

@onready var AmountDisplay = $Label


func update(coins: int) -> void:
	AmountDisplay.text = str(coins)
