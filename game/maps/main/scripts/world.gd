extends Node2D

@export
var player_spawner: SpawnerComponent
@export
var all_enemies: SpawnerGroup

func _ready():
	GameplayController.set_active_enemies(all_enemies)
	GameplayController.set_player_spawn(player_spawner)
	GameplayController.spawn_enemies()
	GameplayController.spawn_player()

