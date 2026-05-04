extends Control
signal test


@onready var fake_mouse = $FakeMouse

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var mouse_pos = get_viewport().get_mouse_position()
	fake_mouse.position = mouse_pos
	print(fake_mouse.position)
