class_name HitBoxComponent extends Area2D

@export
var damage: int: get = getDamage
@export
var knockback_power: int: get = getKnockbackPower
	
func getDamage():
	return damage

func getKnockbackPower():
	return knockback_power
