extends Area2D

@export var enemy_state_machine: StateMachine

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		var playerStateMachine = body.get_node_or_null("PlayerStateMachine") as StateMachine
		
		if body.is_falling():
			playerStateMachine.change_state(PlayerStates.JUMP)
			enemy_state_machine.change_state(PlayerStates.DEATH)
			
			
