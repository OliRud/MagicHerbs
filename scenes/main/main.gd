extends Node2D

@onready var herb_store: Node2D = $HerbStore
@onready var herbs_to_harvest = $HerbDrops.get_child_count()

var herb_scene = preload("res://scenes/herb/herb.tscn")

func _ready() -> void:
	var seperation = 0.1
	
	for i in range(0,herbs_to_harvest):
		
		var herb = herb_scene.instantiate()
		
		herb.position = $HerbDrops.get_child(i).global_position
		
		herb_store.add_child(herb)
		
		await get_tree().create_timer(seperation).timeout
