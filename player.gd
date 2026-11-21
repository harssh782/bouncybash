extends CharacterBody3D
@onready var camera =  $Camera3D
#@onready var bouncejump = $AudioStreamPlayer3D
const SPEED = 10
var JUMP_VELOCITY = 5

var MOUSE_SENSITIVITY = 0.003

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func bounce_back():
	velocity.y = 30.0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * MOUSE_SENSITIVITY)
		camera.rotate_x(-event.relative.y * MOUSE_SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x , deg_to_rad(-80), deg_to_rad(80))


func _input(event: InputEvent) -> void:
	if Input.is_key_pressed(KEY_F):
		get_tree().reload_current_scene()
	elif Input.is_key_pressed(KEY_R):
		get_tree().change_scene_to_file("res://level1.tscn")
	#elif Input.is_key_pressed(KEY_T):
		#velocity.y = 30


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
