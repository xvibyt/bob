extends CharacterBody2D


@onready var lastMousePos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = velocity.move_toward(position.direction_to(get_global_mouse_position()) * 1000, 1000 * delta)
	velocity = velocity.move_toward(Vector2.ZERO, 10000 * (1/position.distance_to(get_global_mouse_position())) * delta)
	get_node("AnimatedSprite2D").play()
	
	move_and_slide()
	
