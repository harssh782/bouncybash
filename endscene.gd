extends Control

@onready var click = $AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_button_pressed() -> void:
	click.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://start.tscn")
