extends CharacterState

@export
var idle_state: CharacterState

func processPhysics(delta: float) -> State:
	# Move, manage direction, stop before end position and return to idle. On idle start timer, and on timer end revert direction and patrol
	var moveDirection = (parent.end_position - parent.position)
	handleDirection(moveDirection)
	if abs(moveDirection.x) < 1.5:
		changeTargets()
		return idle_state
	parent.velocity.x = moveDirection.normalized().x * parent.speed
	parent.move_and_slide()
	return null

func handleDirection(moveDirection):
	var currentDirection = direction
	direction = "right" if moveDirection.x > 0 else "left"
	_verifyAnimation(currentDirection)

func _verifyAnimation(currentDirection):
	if direction != currentDirection:
		playAnimation()

func changeTargets(): 
	var temp = parent.end_position
	parent.end_position = parent.start_position
	parent.start_position = temp
