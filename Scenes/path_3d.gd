extends Path3D

@export var enemy_scene : PackedScene
@onready var timer: Timer = $Timer
@export var dificulty_manager : Node
@export var victory_layer:CanvasLayer

func spawn_enemy()->void:
	var new_enemy = enemy_scene.instantiate()
	new_enemy.max_health = dificulty_manager.get_enemy_health()
	add_child(new_enemy)
	new_enemy.tree_exited.connect(enemy_defeated)
	timer.wait_time = dificulty_manager.get_spawn_time()

func enemy_defeated()->void:
	if timer.is_stopped():
		for child in get_children():
			if child is Enemy:
				return
		victory_layer.visible = true

func _on_timer_timeout() -> void:
	spawn_enemy()


func _on_dificulty_manager_stop_spawning_enemies() -> void:
	timer.stop()
