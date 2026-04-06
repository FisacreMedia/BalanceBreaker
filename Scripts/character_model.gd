extends MeshInstance3D
var default_rot = $".".rotation_degrees

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Forward"):
		rotation_degrees.y = default_rot.y
	elif event.is_action_pressed("Backward"):
		rotation_degrees.y = default_rot.y + 180
	elif event.is_action_pressed("Left"):
		rotation_degrees.y = default_rot.y + 90
	elif event.is_action_pressed("Right"):
		rotation_degrees.y = default_rot.y - 90
	
