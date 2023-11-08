extends Panel

@onready
var health_bar:HealthBarComponent = $HealthBarComponent

func _ready():
	PlayerEvents.health_updated.connect(_on_player_health_updated)
	PlayerEvents.max_health_updated.connect(_on_player_max_health_updated)

func _on_player_health_updated(current_health):
	health_bar.update_health(current_health)


func _on_player_max_health_updated(max_health):
	health_bar.update_max_health(max_health)
