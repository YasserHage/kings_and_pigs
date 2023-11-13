extends Node

signal game_paused(is_paused: bool)

var player_spawn: SpawnerComponent: set = set_player_spawn
var active_enemies: SpawnerGroup: set = set_active_enemies

func _ready():
	PlayerEvents.player_death.connect(_on_player_death)
	
func _on_player_death():
	spawn_player()
	spawn_enemies()

func spawn_enemies():
	active_enemies.spawn_all()
	
func spawn_player():
	player_spawn.spawn()

func set_player_spawn(_player_spawn):
	player_spawn = _player_spawn

func set_active_enemies(_active_enemies):
	active_enemies = _active_enemies
