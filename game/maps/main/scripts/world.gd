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

func _input(event):
	if event.is_action_pressed("pause"):
		var isPaused = get_tree().paused
		GameplayController.game_paused.emit(!isPaused)
		get_tree().paused = !isPaused

