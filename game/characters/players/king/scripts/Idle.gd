extends State

func enter() -> void:
	super()
	parent.velocity.x = 0
	
func processPhysics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return null
	return null
