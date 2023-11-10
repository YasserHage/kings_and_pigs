class_name HurtBoxComponent extends Area2D

signal entered_death_zone()
signal hurt_box_hit(hit_box:HitBoxComponent)

@export
var death_zone_layer: int

func _ready():
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area):
	if area.get_collision_layer_value(8):
		entered_death_zone.emit()
	if area is HitBoxComponent:
		hurt_box_hit.emit(area)
