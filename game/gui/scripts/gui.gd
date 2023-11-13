extends CanvasLayer

@export
var pause_menu: Control

func _ready():
	GameplayController.game_paused.connect(toogle_pause_menu)
	
func toogle_pause_menu(is_paused: bool):
	pause_menu.visible = is_paused
