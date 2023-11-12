extends CharacterState

@export
var detection_layer: int
@export
var detection_area: Area2D

func enter() -> void:
	detection_area.set_collision_layer_value(2, false)
	PlayerEvents.is_player_attacking.emit(false)
	super()

func processFrame(delta: float) -> State:
	if !parent.animations.is_playing():
		parent.queue_free()
		PlayerEvents.player_death.emit()
	return null
