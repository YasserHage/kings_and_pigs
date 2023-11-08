extends Character

func _on_health_component_health_updated(current_health):
	PlayerEvents.health_updated.emit(current_health)


func _on_health_component_max_health_updated(max_health):
	PlayerEvents.max_health_updated.emit(max_health)
