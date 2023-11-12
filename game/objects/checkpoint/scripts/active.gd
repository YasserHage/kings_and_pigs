extends State

@export
var animation_name: String

func enter() -> void:
	parent.animations.play(animation_name)
