extends Area2D

@export var JUMP_THROUGH_BODY: CollisionShape2D

func _ready():
	JUMP_THROUGH_BODY.set_deferred("disabled", true)
	
func _process(_delta):
	if !JUMP_THROUGH_BODY.disabled and Input.is_action_pressed(Controls.DOWN):
		JUMP_THROUGH_BODY.set_deferred("disabled", true)

func _on_body_entered(_body: Node2D) -> void:
	JUMP_THROUGH_BODY.set_deferred("disabled", false)

func _on_body_exited(_body: Node2D) -> void:
	JUMP_THROUGH_BODY.set_deferred("disabled", true)
