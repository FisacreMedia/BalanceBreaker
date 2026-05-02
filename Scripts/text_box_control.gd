extends Control

@export var interacted_npc : NPC
@onready var interaction_handler = $".."
@onready var dialogue = $RichTextLabel
var who_talking : String
var dialogue_active = false
var line_number = 1
@onready var talking_npc = interaction_handler.talking_npc



signal textbox_edit
signal dialogue_done

func _on_interaction_handler_jeff_npc() -> void:
	interaction_handler.player.is_in_dialogue = true
	visible = true
	who_talking = "Jeff"
	interaction_handler.npc_checked = true
	jeff_dialogue()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Next") and dialogue_active == true:
		line_number += 1
		if who_talking == "Jeff":
			if line_number <= 3:
				jeff_dialogue()
			elif line_number == 4:
				deactivate_dialogue()
				dialogue_done.emit()
	if event.is_action_pressed("Leave Dialogue"):
		deactivate_dialogue()
		dialogue_done.emit()
		print("signal sent")

func jeff_dialogue(): ## function to cycle through dialogue when called (for reference all this is mainly placeholder dialogue lol)
	if line_number == 1:
		dialogue.text = "Jorking it"
	elif line_number == 2:
		dialogue.text = "Jorking it real good"
	elif line_number == 3:
		dialogue.text = "Penis Music is my favourite genre"

func deactivate_dialogue():
	visible = false
	interaction_handler.player.is_in_dialogue = false
	interaction_handler.npc_checked = false
	line_number = 1
