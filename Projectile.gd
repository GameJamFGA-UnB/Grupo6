extends KinematicBody2D

# Declare member variables here. Examples:
signal kill

var gravity = 10000
export (float) var speed = 1
var y = position.y
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	velocity.y += (gravity * speed) * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	for i in get_slide_count():
		var collision_info = get_slide_collision(i)
		if collision_info.collider is TileMap:
			position.y = y
			position.x = rng.randf_range(18, 800)
			$Sound.play()
		elif collision_info.collider.name == "Player":
			collision_info.collider.die()
		elif "Projectile" in collision_info.collider.name:
			self.add_collision_exception_with(collision_info.collider)
			collision_info = get_slide_collision(i)
