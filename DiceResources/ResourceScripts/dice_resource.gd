extends Resource
class_name DiceResource

enum Modifiers {
	SHATTER
}

@export var faces : Array[FaceResource]
@export var modifiers : Array[Modifiers]

func on_apply():
	for modifier in modifiers:
		if modifier == Modifiers.SHATTER:
			pass # delete dice
