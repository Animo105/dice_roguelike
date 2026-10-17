extends Node

signal action_requested(action : CombatAction)

func request_action(action : CombatAction):
	action_requested.emit(action)
