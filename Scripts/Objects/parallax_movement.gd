extends TextureRect

@onready var baseOffset: float = self.position.x
@export var tempo: float

func _process(delta: float) -> void:
	var currentCamPosition: Vector2 = get_viewport().get_camera_2d().get_screen_center_position()
	#position.x = lerpf(position.x, baseOffset - currentCamPosition.x * tempo, delta * 200)
