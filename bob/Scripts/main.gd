class_name World extends Node2D

signal coins_updated(int)

@onready var Coins = $CurrentLevel/Level_1/Coins
@onready var NextLevel = $CurrentLevel/Level_1/NextLevel

@onready var Player = $Player
@onready var LeftWall = $Map/Wall2/LeftWall
@onready var RightWall = $Map/Wall2/RightWall


var coins: int = 0


func _ready() -> void:
	for Coin in Coins.get_children():
		print(Coin)
		if Coin is Coin2D:
			Coin.is_collected.connect(coin_collected)
	NextLevel.change_level.connect(update_objects)
	


func _process(delta: float) -> void:
	LeftWall.position.y = Player.position.y
	RightWall.position.y = Player.position.y


func coin_collected() -> void:
	print("COLLECT")
	coins += 1
	coins_updated.emit(coins)

func update_objects(nextLevelNumber):
	print("update")
	var nextLevel = "Level_" + str(nextLevelNumber)
	await get_tree().create_timer(0.2).timeout
	print(get_node("CurrentLevel").get_children())
	NextLevel = get_node("CurrentLevel/" + nextLevel + "/NextLevel")
	Coins = get_node("CurrentLevel/" + nextLevel + "/Coins")
	for Coin in Coins.get_children():
		print(Coin)
		if Coin is Coin2D:
			Coin.is_collected.connect(coin_collected)
	NextLevel.change_level.connect(update_objects)
	print(Coins.get_children())
