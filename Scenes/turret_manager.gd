extends Node3D
class_name TurretManager

@export var turret :PackedScene
@export var enemy_path :Path3D

func build_turret(pos : Vector3)-> void:
	var new_turret = turret.instantiate()
	add_child(new_turret)
	new_turret.global_position = pos
	new_turret.enemy_path = enemy_path
