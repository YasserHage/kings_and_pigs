extends CharacterState

@export
var patrol: CharacterState
@export
var timer: Timer
var should_patrol: bool

func _ready():
	timer.timeout.connect(on_timeout)

func enter() -> void:
	super()
	parent.velocity.x = 0
	should_patrol = false
	timer.start()

func processFrame(delta: float) -> State:
	if should_patrol:
		return patrol
	return null
	
func on_timeout():
	should_patrol = true
