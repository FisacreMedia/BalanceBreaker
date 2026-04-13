class_name NPC

extends CharacterBody3D

@onready var textbox_control = $"../TextBoxControl"

enum Alignment {ALLY, NEUTRAL, HOSTILE }
@export var unit_alignment : Alignment
@onready var player = $"../../Player"
@onready var interact_shapecast = $InteractShapeCast

@export var npc_name : String
@export var npc_health : int
@export var npc_level : int


signal interact_ready
signal interact_not_ready

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if interact_shapecast.is_colliding():
		var collider = interact_shapecast.get_collider(1)
		if collider == player:
			print("player found")
	else:
		pass
		##interact_ready.emit()
		##textbox_control.interacted_npc = self
	##else:
		##interact_not_ready.emit()
