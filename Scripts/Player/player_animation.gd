class_name AnimationController extends Node

@export var ANIMATION: AnimationController
@export var PLAYER: Player
@export var STATEMACHINE: StateMachine

func _process(delta: float) -> void:
	self.scale.x = PLAYER.lastDirection
	
	if STATEMACHINE.stateName == PlayerStates.HIT:
		ANIMATION.play("hit")
		return
	
	if PLAYER.is_on_floor():
		if STATEMACHINE.stateName == PlayerStates.RUN:
			ANIMATION.play("walk")
			
			if Input.is_action_pressed(Controls.RUN) :
				ANIMATION.speed_scale = 1.5
			else:
				ANIMATION.speed_scale = 1.0
		else :
			ANIMATION.speed_scale = 1.0
			ANIMATION.play("idle")

	if not PLAYER.is_on_floor():
		if PLAYER.acceleration != 0:
			ANIMATION.scale.x = 1.0 if PLAYER.acceleration > 0 else -1.0
		if PLAYER.is_on_wall() && PLAYER.is_falling() && PLAYER.is_pressing_against_wall():
			ANIMATION.play("wall")
			return
		if not PLAYER.is_falling():
			ANIMATION.play("jump")
		else:
			ANIMATION.play("fall")
			
