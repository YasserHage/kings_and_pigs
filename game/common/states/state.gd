class_name State extends Node

@export
var animation_name: String

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var parent: set = setParent

func enter() -> void:
	parent.animations.play(animation_name)

func exit() -> void:
	pass

func processInput(event: InputEvent) -> State:
	return null
	
func processFrame(delta: float) -> State:
	return null
	
func processPhysics(delta: float) -> State:
	return null

func setParent(_parent):
	parent = _parent
