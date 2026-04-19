extends Control

@export var interacted_npc : NPC
@onready var interaction_handler = $".."
@onready var dialogue = $RichTextLabel
var who_talking : String
var line_number = 1

signal textbox_edit

func _on_interaction_handler_jeff_npc() -> void:
	interaction_handler.player.is_in_dialogue = true
	visible = true
	who_talking = "Jeff"
	jeff_dialogue()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Test"):
		line_number += 1
		if who_talking == "Jeff":
			jeff_dialogue()

func jeff_dialogue(): ## function to cycle through dialogue when called
	if line_number == 1:
		dialogue.text = "Jorking it"
	elif line_number == 2:
		dialogue.text = "Jorking it real good"
