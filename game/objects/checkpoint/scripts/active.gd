extends State

@export
var animation_name: String

func enter() -> void:
	parent.animations.play(animation_name)
	parent.player_spawn.position = parent.global_position
	GameplayController.set_player_spawn(parent.player_spawn)
	GameplayController.set_active_enemies(parent.checkpoint_enemies)
