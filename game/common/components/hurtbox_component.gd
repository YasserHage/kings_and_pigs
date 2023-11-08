class_name HurtBoxComponent extends Area2D

signal hurt_box_hit(hit_box:HitBoxComponent)

func _ready():
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area is HitBoxComponent:
		hurt_box_hit.emit(area)
