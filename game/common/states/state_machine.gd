class_name StateMachine extends Node

@export
var starting_state: State
var current_state: State
var forcing_state: bool = false

func init(parent) -> void:
	for child in get_children():
		child.setParent(parent)
	changeState(starting_state)

func force(state: State):
	forcing_state = true
	changeState(state)
	
func processInput(event: InputEvent) -> void:
	var newState = current_state.processInput(event)
	if newState && !forcing_state:
		changeState(newState)
	
func processFrame(delta: float) -> void:
	var newState = current_state.processFrame(delta)
	if newState && !forcing_state:
		changeState(newState)
	
func processPhysics(delta: float) -> void:
	var newState = current_state.processPhysics(delta)
	if newState && !forcing_state:
		changeState(newState)

func changeState(newState: State) -> void:
	if current_state:
		current_state.exit()
		newState.setDirection(current_state.getDirection())
	
	current_state = newState
	current_state.enter()
	forcing_state = false
