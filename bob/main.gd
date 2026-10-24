class_name World extends Node2D

signal coins_updated(int)

@onready var Coins = $Coins


var coins: int = 0


func _ready() -> void:
	for Coin in Coins.get_children():
		if Coin is Coin2D:
			Coin.is_collected.connect(coin_collected)

func coin_collected() -> void:
	coins += 1
	coins_updated.emit(coins)
