class_name Player extends CharacterBody2D

@export_group("Refs")
@export var rayCastL: RayCast2D
@export var rayCastR: RayCast2D
@export var audioPlayer: AudioStreamPlayer

@export_group("PlayerStats")
@export var walkSpeed = 5000
@export var jumpSpeed = 330
@export var friction = 300
@export var acceleration_step = 600
@export var acceleration_run = 400
@export var max_acceleration = 5000
@export var max_acceleration_run = 10000

var CURRENT_ACCELERATION = 0
var LAST_DIRECTION = 1.0

func _physics_process(delta: float) -> void:
	
	var direction = Input.get_axis(Controls.LEFT, Controls.RIGHT)
	if(direction != 0):
		LAST_DIRECTION = direction
	
	var gravity = get_gravity().y
	
	if not is_on_floor():			
		velocity.y += gravity * delta		
		
	CURRENT_ACCELERATION = move_toward(CURRENT_ACCELERATION, 0, friction)
							
	velocity.x = CURRENT_ACCELERATION * delta 
	
	move_and_slide()
	
	if is_on_wall(): 
		velocity.x = 5 * direction
		CURRENT_ACCELERATION = 0
		
func is_pressing_against_wall() -> bool:
	return (Input.is_action_pressed(Controls.RIGHT) and rayCastR.is_colliding()) or (Input.is_action_pressed(Controls.LEFT) and rayCastL.is_colliding())

func is_falling() -> bool:
	return velocity.y > 0
