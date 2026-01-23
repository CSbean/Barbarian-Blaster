extends Node3D

@onready var timer: Timer = $Timer
@export var turret_range := 10.0

var enemy_path :Path3D
var projectile = preload("res://turret/projectile.tscn")
var target : Node3D

func _physics_process(_delta: float) -> void:
	target = enemy_path.get_children().back()
	if target != null:
		look_at(target.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	if target!=null:
		var new_proj = projectile.instantiate()
		add_child(new_proj)
		new_proj.global_position = global_position
		new_proj.direction = global_transform.basis.z

func find_best_target()-> Enemy:
	var best = null
	var far = 0.0
	for e in enemy_path.get_children():
		if e is Enemy:
			if e.progress > far:
				var distance = global_position.distance_to(e.global_position)
				if distance <= turret_range:
					best = e
					far = e.progress
	return best
