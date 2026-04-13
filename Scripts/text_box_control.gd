extends Control

@export var interacted_npc : NPC

signal textbox_edit


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Test"):
		print(interacted_npc)


func _on_interact_prompt_interact_key_pressed() -> void:
	print("Signal sent")
	textbox_edit.emit()
