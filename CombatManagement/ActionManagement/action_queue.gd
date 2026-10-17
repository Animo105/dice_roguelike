extends RefCounted
class_name ActionQueue

signal finished

var _action_queue: Array[CombatAction] = []
var _is_resolving := false

func create_action(action: CombatAction) -> void:
	action.queue = self
	_action_queue.append(action)
	if not _is_resolving:
		await _process_queue()

func finish():
	if not _is_resolving and _action_queue.is_empty():
		return
	await finished

func clear() -> void:
	_action_queue.clear()

func _process_queue() -> void:
	_is_resolving = true
	while not _action_queue.is_empty():
		var action: CombatAction = _action_queue.pop_front()
		await _resolve_action(action)
	_is_resolving = false


func _resolve_action(action : CombatAction) -> void:
	# apply source effects if able
	if action.source:
		for effect in action.source.combat_effects:
			effect.modify_outgoing_action(action)
	
	# si pu de target annule l'attaque
	if not action.target:
		return
	
	# apply target effects
	for effect in action.target.combat_effects:
		effect.modify_incoming_action(action)
	
	# resolve les damages et effects on_play
