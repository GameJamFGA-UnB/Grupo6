extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false

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
	get_tree().change_scene("res://Control.tscn")

func _physics_process(delta):
	get_input()
	velocity.y += gravity * delta
	if jumping and is_on_floor():
		jumping = false
	velocity = move_and_slide(velocity, Vector2(0, -1))
	for i in get_slide_count():
		var collision_info = get_slide_collision(i)
		if collision_info.collider.name == "Door":
			get_tree().change_scene("res://Transition.tscn")
		elif collision_info.collider.name == "End":
			get_tree().change_scene("res://Victory.tscn")	
		elif collision_info.collider is KinematicBody2D or collision_info.collider is StaticBody2D:
			$Death.play()
			die()
			
	if position.y > 1500:
		die()
