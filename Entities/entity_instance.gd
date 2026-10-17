## Classe parente de tout personnage ou ennemi.
@abstract extends RefCounted
class_name EntityInstance


signal hp_changed(old: int, new: int)
signal block_changed(new: int)
signal effect_added(effect: CombatEffect)
signal effect_removed(effect: CombatEffect)
signal died

var max_hp : int
var hp : int
var block : int


var queue : ActionQueue

var combat_effects : Array[CombatEffect]

func _init(entity_data : EntityData, action_queue : ActionQueue) -> void:
	queue = action_queue
	max_hp = entity_data.max_hp
	hp = max_hp

func take_damage(amount: int) -> void:
	var absorbed := mini(block, amount)
	block -= absorbed
	var old := hp
	hp = maxi(hp - (amount - absorbed), 0)
	block_changed.emit(block)
	hp_changed.emit(old, hp)
	if hp == 0:
		died.emit()

func is_dead() -> bool:
	return hp <= 0

func add_effect(effect: CombatEffect) -> void:
	for e in combat_effects:
		if e.id == effect.id:
			e.amount += effect.amount
			return
	effect.owner = weakref(self)
	combat_effects.append(effect)
	effect_added.emit(effect)


func remove_effect(effect: CombatEffect) -> void:
	if effect in combat_effects:
		combat_effects.erase(effect)
		effect_removed.emit(effect)
