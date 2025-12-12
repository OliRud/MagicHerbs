extends Node2D

var variety = 40 #shade variety
var spawn_anim_complete = false

@onready var sprite: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var explosion_particles: CPUParticles2D = $Particles/ExplosionParticles
@onready var brush: AudioStreamPlayer2D = $Audio/Brush

func _ready() -> void:
	var shade = randi_range(0,variety)
	sprite.self_modulate.r8 -= shade
	sprite.self_modulate.g8 -= shade
	sprite.self_modulate.b8 -= shade
	
	animation_player.play("spawn")
	whackParticles()
	play_whack()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "spawn":
		spawn_anim_complete = true


#visual effects
func hit() -> void:
	animation_player.play("hit")
func whackParticles() -> void:
	explosion_particles.restart()
	explosion_particles.emitting = true
func play_whack() -> void:
	var pitch = (randi_range(20,50) * 0.01)
	brush.pitch_scale = 1 + pitch
	brush.play()


#triggers
func _on_hitarea_mouse_entered() -> void:
	if spawn_anim_complete == true:
		hit()
		play_whack()
		whackParticles()
