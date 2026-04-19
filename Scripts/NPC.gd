class_name NPC

extends CharacterBody3D

enum Alignment {ALLY, NEUTRAL, HOSTILE }
@export var unit_alignment : Alignment
@onready var player = $"../../Player"
@onready var interact_shapecast = $InteractShapeCast
@onready var camera = Camera3D
@onready var main = $".."
var player_near : bool





signal npc_ready
signal npc_not_ready

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if interact_shapecast.is_colliding():
		for i in range(interact_shapecast.get_collision_count()):
			var collider = interact_shapecast.get_collider(i)
			if collider == player:
				print("Player found")
				npc_ready.emit()
		##textbox_control.interacted_npc = self
	else:
		print("Player gone :(")
		npc_not_ready.emit()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Interact") && main.prompt_visibility == true:
		var player_position = Vector3(player.position.x, global_position.y, player.position.z)
		look_at(player_position)
