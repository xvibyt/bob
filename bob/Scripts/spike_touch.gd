class_name Spike2D extends Area2D

signal is_spike_touched


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var touched: bool = false

func _on_body_entered(body: Node2D) -> void:
	if touched or not body.is_in_group("Player"): return
	touched = true
	
	print(1)
	is_spike_touched.emit()
	
	await get_tree().create_timer(0.1).timeout
	touched = false
