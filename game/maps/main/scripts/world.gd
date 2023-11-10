extends Node2D

@export
var player_spawner: SpawnerComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	player_spawner.spawn()

