class_name Player extends CharacterBody2D

@export var walkSpeed: float = 5000
@export var jumpSpeed: float = 330
@export var audioPlayer: AudioStreamPlayer
@export var rayCastR: RayCast2D
@export var rayCastL: RayCast2D

var acceleration = 0
var acceleration_step = 600
var max_acceleration = 5000
var friction = 300

var lastDirection = 1.0

var acceleration_run = 400
var max_acceleration_run = 10000
	
func _physics_process(delta: float) -> void:
	
	var direction = Input.get_axis("Left", "Right")
	if(direction != 0):
		lastDirection = direction
	
	var gravity = get_gravity().y
	
	if not is_on_floor():			
		velocity.y += gravity * delta		
	
	if acceleration > 0:
		if acceleration <= friction:
			acceleration = 0
		else:
			acceleration -= friction
	elif acceleration < 0:
		if acceleration >= friction:
			acceleration = 0
		else:
			acceleration += friction	
							
	velocity.x = acceleration * delta 
	
	move_and_slide()
	
	if is_on_wall(): 
		velocity.x = 5 * direction
		acceleration = 0
		
func is_pressing_against_wall() -> bool:
	return Input.is_action_just_pressed("Right") and rayCastR.is_colliding() or Input.is_action_just_pressed("Left") and rayCastR.is_colliding()

func is_falling() -> bool:
	return velocity.y > 0
