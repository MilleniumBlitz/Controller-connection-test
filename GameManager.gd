extends Node

var player_count
var connected_controllers setget , get_connected_controllers

# Called when the node enters the scene tree for the first time.
func get_connected_controllers():
	return Input.get_connected_joypads()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
