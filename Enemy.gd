extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (float) var turnTime = 20.0
var time = 0

export (bool) var isLeft = true
export (int) var run_speed = 100
export (int) var gravity = 20000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	velocity.y += gravity * delta
	time += 0.1
	if isLeft:
		velocity.x -= run_speed
		# position.x -= 1
	else:
		# position.x += 1
		velocity.x += run_speed
	if time > turnTime:
		time = 0
		isLeft = false if isLeft else true
		$Sprite.flip_h = false if isLeft else true
		
	velocity = move_and_slide(velocity, Vector2(0, -1))
