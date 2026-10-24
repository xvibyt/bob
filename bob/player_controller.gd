extends CharacterBody2D


@onready var lastMousePos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = velocity.move_toward(position.direction_to(get_global_mouse_position()) * 1000, 1000 * delta)
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
	
	
