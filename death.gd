extends Area3D
@onready var death = $AudioStreamPlayer3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _on_body_entered(body: Node3D) -> void:
	if body.name == "player":
		death.play()
		await get_tree().create_timer(0.3).timeout
		get_tree().reload_current_scene()
