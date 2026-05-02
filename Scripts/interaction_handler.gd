extends Control

signal textbox_edit_check
@onready var talking_npc : Npc_Main
var npc_name : String
@onready var dialogue_controller = $TextBoxControl
@onready var player = $"../Player"
var npc_checked = false

## Signals for each npc to handle what dialogue gets shown
signal jeff_npc

func _on_interact_prompt_interact_key_pressed() -> void:
	print("Signal Received")
	textbox_edit_check.emit()
	print("Signal Sent")


func _on_test_npc_main_textbox_edit_checked() -> void:
	print(talking_npc)
	npc_name = talking_npc.npc_name
	print(npc_name)

func _physics_process(delta: float) -> void:
	if npc_checked == false and dialogue_controller.dialogue_active == true:
		if npc_name == "Jeff":
			print("Checked")
			jeff_npc.emit()


func _on_text_box_control_dialogue_done() -> void:
	npc_checked = false
	dialogue_controller.dialogue_active = false
