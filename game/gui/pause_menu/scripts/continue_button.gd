extends TextureButton


func _pressed():
	GameplayController.game_paused.emit(false)
	get_tree().paused = false
