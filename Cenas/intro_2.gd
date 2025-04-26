extends Node2D

func _ready():
	
	$AnimationPlayer.play("fadein")
	await get_tree().create_timer(3).timeout
	$AnimationPlayer.play("fadeout")
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://Cenas/main_menu.tscn")
