@abstract extends RefCounted
class_name CombatEffect

var id: StringName
var priority := 0
var amount : int

@abstract func _init(stacks : int) -> void

## Fonction pour modifier une action que l'owner de cet effet effectue. [br]
## source accessible par [code] action.source [/code], et cible accessible par [code] action.target [/code]. [br]
## Cette fonction est appeler depuis le [class CombatManager] avec [code] source.effects [/code]. [br]
func modify_outgoing_action(action : CombatAction) -> void:
	pass

## Fonction pour faire quelque chose lorsqu'une action est jouer. 
## L'action en elle même ne devrai pas être modifier à ce stade. [br]
## source accessible par [code] action.source [/code], et cible accessible par [code] action.target [/code]. [br]
func on_action_played(action : CombatAction) -> void:
	pass

## Fonction pour modifier une action qui provien d'une source externe et target l'owner de cet effect. [br]
## source accessible par [code] action.source [/code], et cible accessible par [code] action.target [/code]. [br]
## Cette fonction est appeler depuis le [class CombatManager] avec [code] source.effects [/code]. [br]
func modify_incoming_action(action : CombatAction) -> void:
	pass

## Triggered au début du tour, la source loop dans chaqu'une de ses effets
## [code] for effect in effects: effect.turn_start(self) [/code]
func turn_start(source : EntityInstance):
	pass

## Triggered a la fin du tour, la source loop dans chaqu'une de ses effets
## [code] for effect in effects: effect.turn_end(self) [/code]
func turn_end(source : EntityInstance):
	pass
