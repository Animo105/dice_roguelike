extends RefCounted
class_name CombatAction

## Peux etre null si l'action vien d'un effet (ex thorns)
var source : EntityInstance
## Ce que l'action target (peux etre la meme que la source)
var target : EntityInstance
## La queue pour créer une sub_action au besoin
var queue : ActionQueue

var cancelled : bool
var damage : int
var bloc : int

## Effect -> quantity
## TODO : rethink comment les effets work
var effects : Dictionary[CombatEffect, int]


func _init(action_source : EntityInstance, action_target : EntityInstance) -> void:
	source = action_source
	target = action_target
	cancelled = false
