class_name HealthComponent extends Node

@export
var max_health: int
var current_health: int

func _ready():
	current_health = max_health

func heal(value):
	var newHealth = current_health + value
	current_health = newHealth if newHealth < max_health else max_health
		
func damage(value):
	var newHealth = current_health - value
	current_health = newHealth if newHealth > 0 else 0
	print("Current Health ", current_health)
	
func isDead():
	return current_health == 0
	print("Dead")
