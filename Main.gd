extends Node2D


var my_dir = {} # Creates an empty dictionary.
var PlayersColor = [Color.red, Color.blue, Color.green, Color.yellow]

var player = preload("Player.tscn")
var players = []

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	load_game()
	

func load_game():
	for i in GameManager.player_count:
		var new_player = player.instance()
		new_player.color = PlayersColor[i]

		#positions
		new_player.position = Vector2(rng.randf_range(0, 100), rng.randf_range(0, 100))

		add_child(new_player)
		pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
