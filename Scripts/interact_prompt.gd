extends Sprite3D

signal interact_key_pressed

@onready var player = $"../../Player"
@onready var dialogue_box = $"../TextBoxControl"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_test_npc_interact_ready() -> void:
	visible = true


func _on_test_npc_interact_not_ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") && visible == true:
		print("Interact Key Pressed")
		interact_key_pressed.emit()
		dialogue_box.dialogue_active = true


func _on_test_npc_main_interact_ready() -> void:
	var player_pos = player.position
	visible = true
	position = Vector3(player_pos.x, global_position.y, player_pos.z)


func _on_test_npc_main_interact_not_ready() -> void:
	visible = false
