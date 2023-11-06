class_name HurtBoxComponent extends Area2D

@export
var health_component: HealthComponent

func _ready():
	self.area_entered.connect(_on_area_entered)
	
func takeDamage(damage):
	health_component.damage(damage)
	
func onHitBoxContact(hitbox: HitBoxComponent):
	takeDamage(hitbox.getDamage())
	# handle status and animation

func _on_area_entered(area):
	if area is HitBoxComponent:
		onHitBoxContact(area)
