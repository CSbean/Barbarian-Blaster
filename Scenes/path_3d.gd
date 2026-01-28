extends Path3D

@export var enemy_scene : PackedScene
@onready var timer: Timer = $Timer
@export var dificulty_manager : Node

func spawn_enemy()->void:
	var new_enemy = enemy_scene.instantiate()
	new_enemy.max_health = dificulty_manager.get_enemy_health()
	add_child(new_enemy)
	timer.wait_time = dificulty_manager.get_spawn_time()



func _on_timer_timeout() -> void:
	spawn_enemy()
