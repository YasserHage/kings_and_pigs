extends State

@export
var walk_state: State
@export
var jump_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0

func processInput(event: InputEvent) -> State:
	if event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right"):
		return walk_state
	if Input.is_action_just_pressed("jump"):
		return jump_state
	return null
	
func processPhysics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return null
	return null
