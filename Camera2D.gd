extends Camera2D

var player
var landscape
var portrait

var Player = Vector2()

func find_player():
	Player = get_node("Root/Scene/PlayerSprite").position
	print(Player.x)

func _ready():
	player = get_node("Root/Scene/PlayerSprite")
	

func _physics_process(delta):
	_ready()
