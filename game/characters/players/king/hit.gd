extends CharacterState

@export
var hurt_box: HurtBoxComponent
@export
var idle_state: State

func enter() -> void:
	hurt_box.monitoring = false
	super()

func processFrame(delta: float) -> State:
	if !parent.animations.is_playing():
		return idle_state
	return null
	
func exit() -> void:
	hurt_box.monitoring = true
