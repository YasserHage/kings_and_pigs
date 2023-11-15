extends CanvasLayer

@onready
var pause_menu = $PauseMenu
@onready
var player_stats = $PlayerStats

func _ready():
	pause_menu.visible = false
	GameplayController.game_paused.connect(toogle_pause_menu)
	
func toogle_pause_menu(is_paused: bool):
	pause_menu.visible = is_paused
