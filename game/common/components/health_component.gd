class_name HealthComponent extends Node

signal health_updated(current_health)
signal max_health_updated(max_health)

@export
var max_health: int
var current_health: int

func _ready():
	max_health_updated.emit(max_health)
	current_health = max_health

func heal(value):
	var newHealth = current_health + value
	current_health = newHealth if newHealth < max_health else max_health
	health_updated.emit(current_health)
	
func damage(value):
	var newHealth = current_health - value
	current_health = newHealth if newHealth > 0 else 0
	health_updated.emit(current_health)
	
func isDead():
	return current_health == 0
	print("Dead")
