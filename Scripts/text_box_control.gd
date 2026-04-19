extends Control

@export var interacted_npc : NPC
@onready var interaction_handler = $".."
@onready var dialogue = $RichTextLabel
var who_talking : String
var dialogue_active = false
var line_number = 1
@onready var talking_npc = interaction_handler.talking_npc



signal textbox_edit

func _on_interaction_handler_jeff_npc() -> void:
	interaction_handler.player.is_in_dialogue = true
	visible = true
	who_talking = "Jeff"
	jeff_dialogue()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Next"):
		line_number += 1
		if who_talking == "Jeff" && dialogue_active == true && line_number <= 4:
			jeff_dialogue()

func jeff_dialogue(): ## function to cycle through dialogue when called (for reference all this is mainly placeholder dialogue lol)
	if line_number == 1:
		dialogue.text = "Jorking it"
	elif line_number == 2:
		dialogue.text = "Jorking it real good"
	elif line_number == 3:
		dialogue.text = "Penis Music is my favourite genre"
	else:
		return
