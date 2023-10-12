extends Camera2D

@export var tilemap: TileMap

# Called when the node enters the scene tree for the first time.
func _ready():
	var worldSize = tilemap.cell_quadrant_size * tilemap.get_used_rect().size
	limit_right = worldSize.x
	limit_bottom = worldSize.y

