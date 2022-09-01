extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var speed = 100
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	velocity.y += gravity * delta
	if Input.is_action_pressed("Move_right"):
		velocity.x += 100
	if Input.is_action_pressed("Move_left"):
		velocity.x -= 100
	
	if Input.is_action_pressed("Jump"):
		velocity.y -= 100
	if Input.is_action_pressed("Down"):
		velocity.y += 100
	
	position += velocity * delta
	print("X: ", position.x, " Y: ", position.y)
	print($Sprite.position)
	
