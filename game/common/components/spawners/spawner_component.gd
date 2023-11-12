class_name SpawnerComponent extends Marker2D

@export
var scene: PackedScene
@export
var parent: Node
@export
var always_spawn: bool
var active_instance = false
var instance

func spawn():
	if !active_instance || always_spawn:
		active_instance = true
		instance = scene.instantiate()
		instance.get_property_list()
		instance.tree_exiting.connect(_on_instance_death)
		instance.position = self.global_position
		_set_instance_properties()
		parent.add_child(instance)

func _set_instance_properties():
	pass
	
func _on_instance_death():
	active_instance = false
