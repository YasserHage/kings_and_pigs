extends State

@export
var idle_state: State
@export
var jump_state: State
@export
var speed: int
var animation_root_name: String = ""

func enter() -> void:
	if animation_root_name == "":
		animation_root_name = animation_name
	handleMovement()
	super()
	
func processFrame(delta: float) -> State:
	handleMovement()
	if Input.is_action_just_pressed("jump") &&  parent.is_on_floor():
		return jump_state
	if parent.velocity.x == 0 && _verifyIdle():
		return idle_state
	return null
	
func processPhysics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	return null
	
func handleMovement() -> void:
	var currentDirection = direction;
	if Input.is_action_pressed("ui_left"):
		direction = "left"
		_verifyAnimation(currentDirection)
		parent.velocity.x = -speed;
		return
	if Input.is_action_pressed("ui_right"):
		direction = "right"
		_verifyAnimation(currentDirection)
		parent.velocity.x = speed;
		return
		
	parent.velocity.x = 0;

func _verifyIdle() -> bool:
	return !(Input.is_action_just_pressed("ui_right") || Input.is_action_just_pressed("ui_right"))

func _verifyAnimation(currentDirection):
	if direction != currentDirection:
		playAnimation()
