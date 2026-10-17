extends EntityInstance
class_name PlayerInstance

var money : int

func _init(entity_data : PlayerData, action_queue : ActionQueue) -> void:
	super(entity_data, action_queue)
	money = entity_data.starting_money
