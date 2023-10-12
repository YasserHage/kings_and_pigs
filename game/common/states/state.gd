class_name State extends Node

@export
var direction: String
@export
var animation_name: String
@export
var sprite: Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var parent: set = setParent

func enter() -> void:
	sprite.get_parent().enableSprite(sprite)
	playAnimation()

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

func playAnimation():
	parent.animations.play(animation_name + "_" + direction)
