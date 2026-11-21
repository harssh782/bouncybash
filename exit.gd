extends CSGBox3D

@export var packed_scene = PackedScene

func _ready() -> void:
	pass # Replace with function body.


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.name == "player":
		get_tree().change_scene_to_packed.call_deferred(packed_scene)
