extends Node3D

@onready var timer: Timer = $Timer

var enemy_path :Path3D
var projectile = preload("res://turret/projectile.tscn")


func _physics_process(delta: float) -> void:
	var enemy = enemy_path.get_children().back()
	look_at(enemy.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	var new_proj = projectile.instantiate()
	add_child(new_proj)
	new_proj.global_position = global_position
