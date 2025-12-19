extends Area2D

@export var jumpThroughBody: CollisionShape2D

func _ready():
	jumpThroughBody.set_deferred("disabled", true)
	
func _process(delta):
	if jumpThroughBody.disabled == false and Input.is_key_pressed(KEY_S):
		jumpThroughBody.set_deferred("disabled", true)

func _on_body_entered(body: Node2D) -> void:
	jumpThroughBody.set_deferred("disabled", false)

func _on_body_exited(body: Node2D) -> void:
	jumpThroughBody.set_deferred("disabled", true)
