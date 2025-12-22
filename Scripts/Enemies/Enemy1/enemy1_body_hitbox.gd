extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D && body.is_on_floor():
		var playerStateMachine = body.get_node_or_null("PlayerStateMachine") as StateMachine
		playerStateMachine.change_state(PlayerStates.HIT)
