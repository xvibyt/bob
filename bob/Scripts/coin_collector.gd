class_name Coin2D extends Area2D

signal is_collected


@onready var Sprites := $AnimatedSprite2D

var collected: bool = false

func _on_body_entered(body: Node2D) -> void:
	if collected or not body.is_in_group("Player"): return
	collected = true
	
	is_collected.emit()
	Sprites.play()
	
	await Sprites.animation_finished
	queue_free()
