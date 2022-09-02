extends KinematicBody2D

# Declare member variables here. Examples:
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
	else:
		velocity.x += run_speed
	if time > turnTime:
		time = 0
		isLeft = false if isLeft else true
		$Sprite.flip_h = false if isLeft else true
		
	velocity = move_and_slide(velocity, Vector2(0, -1))
	for i in get_slide_count():
		var collision_info = get_slide_collision(i)
		if "Enemy" in self.name and collision_info.collider.name == "Player":
			collision_info.collider.die()
