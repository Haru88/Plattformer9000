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
		self.scale.x = 1.0 if player.acceleration > 0 else -1.0
		if player.is_on_wall() && player.is_falling() && player.is_pressing_against_wall():
			self.play("wall")
			return
		if not player.is_falling():
			self.play("jump")
		else:
			self.play("Fall")
			
