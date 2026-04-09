class_name NPC

extends CharacterBody3D

enum Alignment {ALLY, NEUTRAL, HOSTILE }
@export var unit_alignment : Alignment
@onready var player = $"../Player"
@onready var interact_raycast = $InteractRayCast
signal interact_ready

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if interact_raycast.is_colliding():
		print("Player Detected")
		interact_ready.emit()
		
	pass
