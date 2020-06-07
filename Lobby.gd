extends Control

var scn_avatar = preload("Avatar.tscn")


onready var container = $CenterContainer/HBoxContainer

var avatars = []
var ready = false

func _ready():
	Input.connect("joy_connection_changed", self, "joy_connection_changed")

	#Avatars list
	avatars = container.get_children()

	for controllers in GameManager.get_connected_controllers():
		avatars[controllers].connected = true

func _on_ValidateButton_pressed():
	GameManager.player_count = _ready_player_count()
	get_tree().change_scene("Main.tscn")

func _input(event):
	avatars[event.device].input(event)
	
func joy_connection_changed(device, connected):
	avatars[device].connected = connected

func _ready_player_count():
	var count = 0
	for avatar in avatars:
		if avatar.connected:
			count += 1
	return count
