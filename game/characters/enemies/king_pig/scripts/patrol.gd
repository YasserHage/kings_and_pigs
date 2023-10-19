extends CharacterState

@export
var speed: int
@export
var idle_state: CharacterState

func processPhysics(delta: float) -> State:
	# Move, manage direction, stop before end position and return to idle. On idle start timer, and on timer end revert direction and patrol
	var moveDirection = (parent.end_position - parent.position)
	if abs(moveDirection.x) < 1.5:
		changeDirection()
		return idle_state
	parent.velocity.x = moveDirection.normalized().x * speed
	parent.move_and_slide()
	return null

func changeDirection(): 
	direction = "left" if direction == "right" else "right"
	var temp = parent.end_position
	parent.end_position = parent.start_position
	parent.start_position = temp
