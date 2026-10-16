extends Node2D
@onready var gauche: Button = $Gauche
@onready var droite: Button = $Droite
@onready var milieu: Button = $Milieu

var current_pos : Vector2 = Vector2(2, 3)
var map : Level = Level.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(map)
	print(map.map)


func _on_gauche_pressed() -> void:
	current_pos.x = current_pos.x+1
	check_doors()
	print(current_pos)


func _on_droite_pressed() -> void:
	current_pos.x = current_pos.x-1
	check_doors()
	print(current_pos)


func _on_milieu_pressed() -> void:
	current_pos.y = current_pos.y-1
	check_doors()
	print(current_pos)

func check_doors() -> void:
	milieu.show()
	droite.show()
	gauche.show()
	if map.map[current_pos.x][current_pos.y-1] == 1:
		milieu.hide()
	if map.map[current_pos.x-1][current_pos.y] == 1:
		droite.hide()
	if map.map[current_pos.x+1][current_pos.y] == 1:
		gauche.hide()
	print(current_pos)
