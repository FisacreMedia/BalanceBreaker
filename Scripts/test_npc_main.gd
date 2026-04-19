class_name Npc_Main

extends Node3D

signal interact_ready
signal interact_not_ready
signal textbox_edit_checked

@export var npc_name : String
@export var npc_health : int
@export var npc_level : int

@onready var textbox_control = $"../InteractionHandler/TextBoxControl"
@onready var interact_prompt = $"../InteractionHandler/InteractPrompt"
@onready var interaction_handler = $"../InteractionHandler"
var prompt_visibility = false
var player_near : bool



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interact_prompt.visible == true:
		prompt_visibility = true
	elif interact_prompt.visible == false:
		prompt_visibility = false
	else:
		pass

func _on_test_npc_npc_not_ready() -> void:
	interact_not_ready.emit()
	player_near = false


func _on_test_npc_npc_ready() -> void:
	interact_ready.emit()
	player_near = true


func _on_interaction_handler_textbox_edit_check() -> void:
	interaction_handler.talking_npc = self
	textbox_edit_checked.emit()
