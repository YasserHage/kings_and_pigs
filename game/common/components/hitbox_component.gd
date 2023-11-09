class_name HitBoxComponent extends Area2D

@export
var hitbox_layer: int
@export
var damage: int: get = getDamage
@export
var knockback_power: int: get = getKnockbackPower
	
func getDamage():
	return damage
	
func getKnockbackPower():
	return knockback_power
	
func handle_attack(isAttacking):
	self.set_collision_layer_value(hitbox_layer, isAttacking)
