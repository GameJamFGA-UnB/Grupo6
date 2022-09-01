extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var time = 0
var flag = true

export (int) var run_speed = 100
export (int) var gravity = 20000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	velocity.y += gravity * delta
	time += 0.1
	if flag:
		velocity.x -= run_speed
		# position.x -= 1
	else:
		# position.x += 1
		velocity.x += run_speed
	if time > 20:
		time = 0
		flag = false if flag else true
		$Sprite.flip_h = false if flag else true
		
	velocity = move_and_slide(velocity, Vector2(0, -1))
