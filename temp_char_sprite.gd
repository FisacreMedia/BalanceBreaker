extends Sprite2D
@onready var image = Image.load_from_file("res://Assets/character_icons/test/Godot_icon.svg-146909070.png")
@onready var image2 = Image.load_from_file("res://Assets/character_icons/test/OIP-1534372348.jpg")
@onready var texture = ImageTexture.create_from_image(image)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
