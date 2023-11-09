extends HitBoxComponent

func _ready():
	PlayerEvents.is_player_attacking.connect(handle_attack)

