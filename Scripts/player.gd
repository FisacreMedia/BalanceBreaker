extends CharacterBody3D

@export var SPEED = 5.0
@export var ROTATION_SPEED = 0.5
@export var input_left : String = "ui_left"
@export var input_right : String = "ui_right"
@export var input_forward : String = "ui_up"
@export var input_backward : String = "ui_down"
@export var sensitivity = 100
@onready var camera = $"../Camera3D"


func _physics_process(delta: float) -> void:
	var ground_plane = Plane(Vector3.UP, global_position.y)
	var mouse_pos = get_viewport().get_mouse_position()
	
	var ray_origin = camera.project_ray_origin(mouse_pos)
	var ray_direction = camera.project_ray_normal(mouse_pos)
	
	var intersection = ground_plane.intersects_ray(ray_origin, ray_direction)
	
	if intersection:
		look_at(Vector3(intersection.x, global_position.y, intersection.z), Vector3.UP)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector(input_left, input_right, input_forward, input_backward)
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	
	
	move_and_slide()
