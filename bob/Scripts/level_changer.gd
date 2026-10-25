class_name NextLevel2D extends Area2D

signal change_level


var touched: bool = false

func _on_body_entered(body: Node2D) -> void:
	if touched or not body.is_in_group("Player"): return
	touched = true
	
	var CurrentLevel: Node
	
	for Level in get_tree().current_scene.get_node("CurrentLevel").get_children():
		CurrentLevel = Level
	
	if CurrentLevel:
		var currentLevelNumber = str(CurrentLevel.name).to_int()
		var nextLevelNumber = currentLevelNumber + 1
		CurrentLevel.queue_free()
		
		if nextLevelNumber == 2 or nextLevelNumber == 99:
			var NextLevelScene := load("res://Levels/Level_%d.tscn" % nextLevelNumber) as PackedScene
			CurrentLevel = NextLevelScene.instantiate()
			get_tree().current_scene.get_node("CurrentLevel").call_deferred("add_child", CurrentLevel)
		elif nextLevelNumber == 3:
			#var current_scene_file = get_tree().current_scene.scene_file_path
			#var incremented_level = current_scene_file.to_int() + 1
			get_tree().call_deferred("change_scene_to_file","res://Levels/Level_" + str(nextLevelNumber) + ".tscn")
		
		#print(nextLevelNumber)
		change_level.emit(nextLevelNumber)
	
	queue_free()
