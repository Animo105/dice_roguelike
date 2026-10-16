extends Resource
class_name FaceActionResource

enum Triggers {
	ON_ROLL,
	ON_APPLY
}

@export var trigger : Triggers
@export var effect : FaceEffectResource
