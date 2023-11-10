extends Node2D

@export
var player_spawner: SpawnerComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerEvents.player_death.connect(respawn)
	player_spawner.spawn()
	
func respawn():
	player_spawner.spawn()

