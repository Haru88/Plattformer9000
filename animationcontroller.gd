class_name AnimationController extends AnimatedSprite2D

@export var player: Player

func _process(delta: float) -> void:
	self.scale.x = player.lastDirection
	if player.is_on_floor():
		if player.velocity.x < 0 || player.velocity.x > 0:
			self.play("walk")
			
			if Input.is_action_just_pressed("Jump") :
				self.speed_scale = 2.0
			else:
				self.speed_scale = 1.0
		else :
			self.speed_scale = 1.0
			self.play("idle")

	if not player.is_on_floor():
		if player.velocity.y < 0:
			self.play("jump")
		else:
			self.play("Fall")
