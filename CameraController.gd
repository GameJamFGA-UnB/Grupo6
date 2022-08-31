extends Camera2D
onready var player = get_node("/root/Node2D/Player")
#This function gets called every frame
func _process (delta):
  position.x = player.position.x
