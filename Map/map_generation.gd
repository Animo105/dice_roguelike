extends Node
class_name Level

var map : Array[Array]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	map = [
		[1,1,1,1,1],
		[1,0,0,0,1],
		[1,0,0,0,1],
		[1,0,0,0,1],
		[1,1,1,1,1]
		]


func generate() -> void:
	pass
