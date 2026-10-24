class_name Coin2D extends Area2D

signal is_collected

@onready var Sprites := $AnimatedSprite2D

var collected: bool = false

func _on_body_entered(body: Node2D) -> void:
	if collected: return
	collected = true
	
	Sprites.play()
	await Sprites.animation_finished
	is_collected.emit()
	queue_free()
