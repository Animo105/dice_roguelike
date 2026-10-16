extends Resource
class_name FaceResource

enum FaceTags {
	UNPLACEABLE,
	
}

@export var value : int
@export var effects : Array[FaceActionResource]

var tags : Dictionary[FaceTags, bool] = {}
