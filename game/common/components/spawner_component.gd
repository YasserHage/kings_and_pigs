class_name SpawnerComponent extends Marker2D

@export
var scene: PackedScene
@export
var parent: Node

func spawn():
	var instance = scene.instantiate()
	instance.position = self.position
	parent.add_child(instance)
