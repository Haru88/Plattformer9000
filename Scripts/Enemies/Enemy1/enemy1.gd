extends CharacterBody2D

var CURRENT_DIRECTION = 1.0 #Right
@export var RIGHT_FLOOR: RayCast2D
@export var LEFT_FLOOR: RayCast2D
@export var MOVEMENT_SPEED = 1500
@export var ANIMATION: AnimatedSprite2D

func _ready(): pass

func _physics_process(delta: float) -> void:
	velocity.x = MOVEMENT_SPEED * delta * CURRENT_DIRECTION
	move_and_slide()
		
