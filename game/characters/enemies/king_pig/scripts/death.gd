extends CharacterState

func enter() -> void:
	super()

func processFrame(delta: float) -> State:
	if !parent.animations.is_playing():
		parent.queue_free()
	return null
