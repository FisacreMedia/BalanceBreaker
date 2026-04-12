class_name NPC

extends CharacterBody3D

enum Alignment {ALLY, NEUTRAL, HOSTILE }
@export var unit_alignment : Alignment
@onready var player = $"../Player"
@onready var interact_raycast = $InteractRayCast

@export var npc_name : String
@export var npc_health : int
@export var npc_level : int


signal interact_ready
signal interact_not_ready

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interact_raycast.is_colliding():
		print("Player Detected")
		interact_ready.emit()
	else:
		print("Player gone :(")
		interact_not_ready.emit()
	pass
