extends Node2D
class_name CombatManager

signal combat_started
signal turn_ended
signal combat_ended(victory: bool)
signal end_turn_requested   # émis par le bouton, attendu par _player_phase

var queue := ActionQueue.new()
var turn_count := 0
var player_input_enabled := false

@onready var field: Node2D = $BattleField   # slots, vues
@onready var hand_ui: Control = $HandUI
@onready var label_turn_count: Label = $"Combat HUD/LabelTurnCount"


# --- Initialisation ---

func setup(players: Array[EntityData]) -> void:
	for data in players:
		#var p := PlayerInstance.new(data, queue)   # sous-classe concrète de EntityInstance
		#context.players.append(p)
		pass


func _exit_tree() -> void:
	queue.clear()


# --- Bouton de fin de tour (connecté directement sur cette node) ---

func _on_button_turn_end_pressed() -> void:
	if player_input_enabled:
		end_turn_requested.emit()


# --- Déroulement du combat ---

func start_combat():
	combat_started.emit()

func end_combat():
	queue.clear()
	combat_ended.emit(false)
