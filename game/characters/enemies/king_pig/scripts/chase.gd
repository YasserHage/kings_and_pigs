extends CharacterState

@export
var speed: int
@export
var idle_state: CharacterState

var target: Area2D
var stopChase = false

func processFrame(delta: float) -> State:
	if stopChase:
		stopChase = false
		return idle_state
	return null
	
func processPhysics(delta: float) -> State:
	var moveDirection = (target.global_position - parent.position)
	handleDirection(moveDirection)
	
	if abs(moveDirection.x) < 16:
		moveDirection.x = 0
		attack()
	parent.velocity.x = moveDirection.normalized().x * speed
	parent.move_and_slide()
	return null

func attack(): 
	print("attack")

func handleDirection(moveDirection):
	var currentDirection = direction
	direction = "right" if moveDirection.x > 0 else "left"
	_verifyAnimation(currentDirection)

func _verifyAnimation(currentDirection):
	if direction != currentDirection:
		playAnimation()

func _on_sight_range_area_exited(area):
	stopChase = true
