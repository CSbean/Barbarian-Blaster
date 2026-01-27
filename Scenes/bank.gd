extends MarginContainer

@onready var label: Label = $Label

@export var starting_gold := 300
var gold : int : 
	set(ng):
		gold = max(0,ng)
		label.text= "Gold: " + str(gold)

func _ready() -> void:
	gold = starting_gold
