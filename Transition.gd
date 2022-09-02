extends Control

func _process(_delta):
	if Input.is_action_pressed('ui_select'):
		get_tree().change_scene("res://Boss.tscn")
