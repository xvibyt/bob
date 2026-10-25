class_name World extends Node2D

signal coins_updated(int)
signal spike_touched

@onready var Coins = $CurrentLevel/Level_1/Coins
@onready var Spikes = $CurrentLevel/Level_1/Spikes
@onready var NextLevel = $CurrentLevel/Level_1/NextLevel

@onready var Player = $Player
@onready var LeftWall = $Map/SideBoundary/LeftWall
@onready var RightWall = $Map/SideBoundary/RightWall


var coins: int = 0


func _ready() -> void:
	for Coin in Coins.get_children():
		if Coin is Coin2D:
			Coin.is_collected.connect(coin_collected)
	for Spike in Spikes.get_children():
		if Spike is Spike2D:
			Spike.is_spike_touched.connect(on_spike_touch)
	NextLevel.change_level.connect(update_objects)
	NextLevel.reset_position.connect(on_reset_position)


func on_reset_position():
	Player.position = Vector2(0,0)


func _process(delta: float) -> void:
	LeftWall.position.y = Player.position.y
	RightWall.position.y = Player.position.y


func coin_collected() -> void:
	coins += 1
	coins_updated.emit(coins)

func on_spike_touch() -> void:
	print("last")
	Player.position = Vector2(0,0)
	coins = 0
	coins_updated.emit(coins)
	spike_touched.emit()
	
	#var CurrentLevel
	#for Level in $CurrentLevel.get_children():
		#CurrentLevel = Level
		#
	#var CurrentLevelScene = load("res://Levels/Level_%d.tscn" % str(CurrentLevel.name).to_int()) as PackedScene
	#CurrentLevel.queue_free()
	#CurrentLevel = CurrentLevelScene.instantiate()
	#get_tree().current_scene.get_node("CurrentLevel").call_deferred("add_child", CurrentLevel)

func update_objects(nextLevelNumber):
	var nextLevel = "Level_" + str(nextLevelNumber)
	
	await get_tree().create_timer(1).timeout
	
	
	
	NextLevel = get_node("CurrentLevel/" + nextLevel + "/NextLevel")
	Coins = get_node("CurrentLevel/" + nextLevel + "/Coins")
	Spikes = get_node("CurrentLevel/" + nextLevel + "/Spikes")
	for Coin in Coins.get_children():
		if Coin is Coin2D:
			Coin.is_collected.connect(coin_collected)
	for Spike in Spikes.get_children():
		if Spike is Spike2D:
			Spike.is_spike_touched.connect(on_spike_touch)
	NextLevel.change_level.connect(update_objects)
	
