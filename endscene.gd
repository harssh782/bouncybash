extends Control

#@onready var click = $AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_SPACE):
		get_tree().change_scene_to_file("res://start.tscn")

func _on_button_pressed() -> void:
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://start.tscn")
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
