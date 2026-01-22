extends Node3D

@onready var timer: Timer = $Timer


var projectile = preload("res://turret/projectile.tscn")




func _on_timer_timeout() -> void:
	var new_proj = projectile.instantiate()
	add_child(new_proj)
	new_proj.global_position = global_position
