extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false
var life = 3

signal hit

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_select')

	if jump and is_on_floor():
		jumping = true
		velocity.y = jump_speed
		$AudioStreamPlayer.play()
	if right:
		velocity.x += run_speed
		$Sprite.flip_h = false
	if left:
		velocity.x -= run_speed
		$Sprite.flip_h = true 

func die():
	position.x = 10
	position.y = 400
	get_tree().change_scene("res://Control.tscn")
	#emit_signal("hit")
	#queue_free()

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	# var collision_info = move_and_collide(velocity * delta)
	#if collision_info:
	#	print(collision_info)
	if position.y > 1000:
		die()
		
