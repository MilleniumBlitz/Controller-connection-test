extends Node2D

var texture_red = preload("assets/player/red.png")
var texture_blue = preload("assets/player/blue.png")

onready var sprite = $Sprite
var controller_id
var color 

# Called when the node enters the scene tree for the first time.
func _ready():
	if color == Color.red:
		sprite.set_texture(texture_red)
	else:
		sprite.set_texture(texture_blue)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
