extends CharacterBody2D

var CURRENT_DIRECTION = 1.0 #Right
@export var RIGHT_FLOOR: RayCast2D
@export var LEFT_FLOOR: RayCast2D
@export var MOVEMENT_SPEED = 1500
@export var ANIMATION: AnimatedSprite2D

func _ready():
	ANIMATION.play("Run")

func _physics_process(delta: float) -> void:
	ANIMATION.scale.x = -CURRENT_DIRECTION
	if not is_on_floor():
		velocity.y += get_gravity().y * delta
		move_and_slide()
		return
		
	if not RIGHT_FLOOR.is_colliding() or not LEFT_FLOOR.is_colliding():
		CURRENT_DIRECTION *= -1
		
	velocity.x = MOVEMENT_SPEED * delta * CURRENT_DIRECTION
	move_and_slide()
		
