extends Area3D
@onready var bouncejump = $AudioStreamPlayer3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D:
		bouncejump.play()
		body.bounce_back()
