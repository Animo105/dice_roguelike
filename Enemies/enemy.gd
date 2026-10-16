@abstract extends Entity
class_name Enemy

@export var attack_dices : Array[DiceResource]
@export var defence_dices : Array[DiceResource]
@export var special_dices : Array[DiceResource]

var cycle : int = 0

@abstract func take_turn()
