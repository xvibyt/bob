extends CharacterBody2D


func _ready() -> void:
	pass#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _process(delta: float) -> void:
	velocity = velocity.move_toward(position.direction_to(get_global_mouse_position()) * 500, 1000 * delta)
	velocity = velocity.move_toward(Vector2.ZERO, 10000 * (1/position.distance_to(get_global_mouse_position())) * delta)
	var Sprite = get_node("AnimatedSprite2D")
	var speed = velocity.length()
	Sprite.play()
	Sprite.speed_scale = speed / 300
	if speed < 50:
		Sprite.animation = "default"
	else:
		Sprite.animation = "run"
	move_and_slide()
	


func _coins_updated(coins: int) -> void:
	velocity  = velocity.move_toward(position.direction_to(get_global_mouse_position()) * 1000, 500)


func _spike_touched() -> void:
	velocity = Vector2.ZERO
