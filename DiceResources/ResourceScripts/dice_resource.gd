extends Resource
class_name DiceResource

@export var faces : Array[FaceResource]

var number_of_faces : int : set = _set_number_of_face

var rolled_face : FaceResource

func _set_number_of_face(value : int):
	number_of_faces = clamp(value, 4, faces.size())

func roll(caster : Character):
	rolled_face = faces[Globals.rng.randi_range(0, number_of_faces - 1)]
	for effect : FaceActionResource in rolled_face.effects:
		if effect.trigger == FaceActionResource.Triggers.ON_ROLL:
			effect.effect.do_effect(caster, null)
