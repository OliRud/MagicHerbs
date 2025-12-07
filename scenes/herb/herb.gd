extends Node2D

var variety = 40 #shade variety
var spawn_anim_complete = false

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	var shade = randi_range(0,variety)
	sprite.self_modulate.r8 -= shade
	sprite.self_modulate.g8 -= shade
	sprite.self_modulate.b8 -= shade
	
	animation_player.play("spawn")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "spawn":
		spawn_anim_complete = true

func hit() -> void:
	animation_player.play("hit")

func _on_hitarea_mouse_entered() -> void:
	if spawn_anim_complete == true:
		hit()
