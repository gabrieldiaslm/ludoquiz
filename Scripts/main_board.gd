extends Node2D

var turn = 1
var dicePose = [308.0, 722.0, 756.0, 26.0, 872.0, 722.0]
var diceFace

func _ready() -> void:
	$DiceRoll.hide()


func _dice_pressed() -> void:
	if turn != 0:
		$DiceRoll.show()
		$Dice.hide()
		$DiceRoll.play("DiceRoll")


func _dice_roll_finished():
	randomize()
	diceFace = randi() % 6+1
	$DiceRoll.stop()
	$DiceRoll.hide()
	$Dice.show()
	$Dice.set_frame(diceFace - 1)
	print(diceFace)
