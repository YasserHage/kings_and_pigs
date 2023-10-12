extends State

@onready
var idle_timer: Timer = $"../../IdleTimer"

@export
var idle_state: State
@export
var speed: int

var is_idle: bool = false

func enter() -> void:
	super()
	handleMovement()
	print("walk")
	
func processInput(event: InputEvent) -> State:
	handleMovement()
	return null
	
func processFrame(delta: float) -> State:
	if is_idle && parent.velocity.x == 0:
		is_idle = false
		return idle_state
	return null
	
func processPhysics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return null
	return null
	
func handleMovement() -> void:
	if Input.is_action_pressed("ui_left"):
		parent.velocity.x = -speed;
		return
	if Input.is_action_pressed("ui_right"):
		parent.velocity.x = speed;
		return
	parent.velocity.x = 0;
	idle_timer.start()


func _on_idle_timer_timeout():
	is_idle = true
	
