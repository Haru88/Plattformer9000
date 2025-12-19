extends Node

@export var start_state: NodePath
var current_state: State

func _ready():
	current_state = get_node(start_state)
	current_state.state_machine = self
	current_state.player = get_parent() as CharacterBody2D
	current_state.enter()

func change_state(state_name: String):
	var new_state = get_node(state_name) as State
	if new_state == current_state:
		return

	current_state.exit()
	current_state = new_state
	current_state.state_machine = self
	current_state.player = get_parent() as CharacterBody2D
	current_state.enter()

func _process(delta):
	current_state.process(delta)

func _physics_process(delta):
	current_state.physics_process(delta)
