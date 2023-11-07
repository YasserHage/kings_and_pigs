class_name HealthBarComponent extends Control

@onready
var shadow = $Shadow
@onready
var health_bar = $HealthBar

func update_health(value):
	var tween = create_tween()
	health_bar.value = value
	tween.tween_property(shadow, "value", value, 1).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.play()
	
func update_max_health(maxValue):
	shadow.max_value = maxValue
	health_bar.max_value = maxValue
