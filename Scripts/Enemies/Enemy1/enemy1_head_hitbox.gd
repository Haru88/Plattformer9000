extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var playerStateMachine = body.get_node_or_null("PlayerStateMachine") as StateMachine
		
		if body.is_falling():
			playerStateMachine.change_state(PlayerStates.JUMP)
