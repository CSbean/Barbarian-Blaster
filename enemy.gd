extends PathFollow3D
class_name Enemy

## The speed in m/s the enemy will move
@export var speed := 10
@export var max_health := 50
var health :int:
	set(nh):
		if health > nh:
			animation_player.play("takeDamage")
		health = nh
		if health < 1:
			queue_free()
@onready var  base :Base = get_tree().get_first_node_in_group("Base")

@onready var animation_player: AnimationPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health = max_health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress+= delta * speed
	if progress_ratio == 1.00:
		base.take_damage()
		queue_free()
