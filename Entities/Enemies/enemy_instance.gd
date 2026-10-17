extends EntityInstance
class_name EnemyInstance

var brain

func _init(entity_data : EnemyData, action_queue : ActionQueue) -> void:
	super(entity_data, action_queue)
