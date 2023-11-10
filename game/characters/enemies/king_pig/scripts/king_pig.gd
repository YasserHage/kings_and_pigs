class_name KingPig extends Character

@export
var path: Line2D
var start_position
var end_position

func _ready():
	var points = path.get_points()
	start_position = points[1]
	end_position= points[0]
	super()
	


func _on_death():
	queue_free()
