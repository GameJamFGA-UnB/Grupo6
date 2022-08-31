extends Camera2D

var player
var bobo

func _ready():
	player= get_node("/root/Node2D/Player")
	
func _process(delta):
	bobo=player.position.x
