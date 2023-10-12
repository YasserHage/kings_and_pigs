extends Node

@export
var starting_state: State
var current_state: State

func init(parent: King) -> void:
	for child in get_children():
		child.setParent(parent)
	changeState(starting_state)

func processInput(event: InputEvent) -> void:
	var newState = current_state.processInput(event)
	if newState:
		changeState(newState)
	
func processFrame(delta: float) -> void:
	var newState = current_state.processFrame(delta)
	if newState:
		changeState(newState)
	
func processPhysics(delta: float) -> void:
	var newState = current_state.processPhysics(delta)
	if newState:
		changeState(newState)

func changeState(newState: State) -> void:
	if current_state:
		current_state.exit()
		newState.direction = current_state.direction
	
	current_state = newState
	current_state.enter()
