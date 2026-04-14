extends Camera3D

@export var follow_distance = -3
@onready var player = $"../Player"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.x = player.position.x    ## follows the players x axis
	position.z = player.position.z - follow_distance  ## follow the players z axis - the follow_distance variable
	
