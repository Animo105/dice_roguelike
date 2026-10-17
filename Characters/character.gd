extends Entity
class_name Character

# faut revoir si on fait ca avec des signaux ou si on 
# fait une pile comme dans slay the spire

var money : int
var dices : Array

# faudrai que quand un dée est jouer tout les effets / powers 
# puisse le checker et add s'ils ont de quoi a add.

signal dice_rolled(dice : DiceResource)
