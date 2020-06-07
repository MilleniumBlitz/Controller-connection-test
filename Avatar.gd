extends Control

var controller_id
var connected setget set_connected
var ready = false setget set_ready

var texture_red = preload("assets/player/red.png")
var texture_blue = preload("assets/player/blue.png")

var texture_btn_a = preload("assets/ui/btn_a.png")
var texture_btn_b = preload("assets/ui/btn_b.png")

var selected_character = 0
var characters = [texture_red, texture_blue]

onready var canvas = $Canvas
onready var sprite = $Canvas/TextureRect
onready var ready_btn = $Canvas/ReadyBtn
onready var anim = $AnimationPlayer
onready var left_arrow = $Canvas/LeftArrow
onready var right_arrow = $Canvas/RightArrow

func _ready():
	set_connected(false)

func input(event):
	if event is InputEventJoypadMotion:

		#CHARACTER SELECTION
		if event.axis == JOY_AXIS_0:
			print(abs(event.axis_value))
			if (abs(event.axis_value) > 0.15):
				if event.axis_value > 0.9:
					left_character()
				elif event.axis_value < -0.9:
					right_character()

	if event is InputEventJoypadButton:

		#READY
		if event.button_index == JOY_BUTTON_0:
			set_ready(true)
		elif event.button_index == JOY_BUTTON_1:
			set_ready(false)

func set_ready(new_value):
	ready = new_value
	left_arrow.visible = !ready
	right_arrow.visible = !ready
	if new_value:
		
		ready_btn.set_texture(texture_btn_b)
	else:
		anim.play("ArrowsAnim")
		ready_btn.set_texture(texture_btn_a)
		

func set_connected(new_value):
	connected = new_value
	if connected:
		anim.play("ArrowsAnim")
		canvas.modulate = "#ffffff"
	else:
		anim.stop()
		canvas.modulate = "#554b4b"

func left_character():
	if not ready and connected:
		selected_character -= 1
		_set_sprite()
	

func right_character():
	if not ready and connected:
		selected_character += 1
		_set_sprite()

func _set_sprite():
	if not ready and connected:
		if selected_character == 2:
			selected_character = 0
		elif selected_character == -1:
			selected_character = 1
		sprite.set_texture(characters[selected_character])


