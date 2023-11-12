class_name State extends Node

@export
var sprite: Sprite2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var parent: set = setParent

func enter() -> void:
	pass

func exit() -> void:
	pass

func processInput(event: InputEvent) -> State:
	return null
	
func processFrame(delta: float) -> State:
	return null
	
func processPhysics(delta: float) -> State:
	return null

func refreshSprite() -> void:
	sprite.get_parent().enableSprite(sprite)

func reset() -> void:
	refreshSprite()
	
func setParent(_parent) -> void:
	parent = _parent
	
func setDirection(value) -> void:
	pass
	
func getDirection() -> String:
	return ""
