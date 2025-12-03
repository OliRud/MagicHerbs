extends Node2D

var variety = 40 #shade variety

@onready var sprite: Sprite2D = $Sprite2D

func _ready() -> void:
	var shade = randi_range(0,variety)
	sprite.self_modulate.r8 -= shade
	sprite.self_modulate.g8 -= shade
	sprite.self_modulate.b8 -= shade
