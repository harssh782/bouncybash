extends Control

@onready var click_sound = $AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_button_pressed() -> void:
	click_sound.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://level1.tscn")
