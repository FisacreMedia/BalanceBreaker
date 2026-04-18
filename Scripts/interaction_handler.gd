extends Control

signal textbox_edit_check
@onready var talking_npc : Npc_Main
var npc_name : String

func _on_interact_prompt_interact_key_pressed() -> void:
	print("Signal Received")
	textbox_edit_check.emit()
	print("Signal Sent")


func _on_test_npc_main_textbox_edit_checked() -> void:
	print(talking_npc)
	npc_name = talking_npc.npc_name
	print(npc_name)

func _physics_process(delta: float) -> void:
	pass
