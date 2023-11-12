extends State

@export
var active_state: State
@export
var activation_area: Area2D
var active: bool = false

func enter() -> void:
	activation_area.area_entered.connect(activate)

func processFrame(delta: float) -> State:
	if active:
		return active_state
	return null
	
func activate(area:Area2D):
	active = true
