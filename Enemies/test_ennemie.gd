extends Enemy

var show_intent : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func take_turn():
	turn_one()
	match(cycle):
		1:
			turn_one()
		2:
			turn_two()
		3:
			turn_three()
	
	cycle = cycle+1 % 3

func turn_one():
	for each in attack_dices:
		pass
		#each.roll()

func turn_two():
	attack_dices[0]
	for each in defence_dices:
		pass
		#each.roll()

func turn_three():
	pass
