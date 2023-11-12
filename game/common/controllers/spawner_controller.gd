class_name SpawnerGroup extends Node

var spawners: Array[SpawnerComponent]

func _ready():
	_add_children(self)

func spawn_all():
	for spawner in spawners:
		spawner.spawn()
	
func _add_children(parent):
	for child in parent.get_children():
		if child is SpawnerComponent:
			spawners.append(child)
		elif child is SpawnerGroup:
			_add_children(child)
