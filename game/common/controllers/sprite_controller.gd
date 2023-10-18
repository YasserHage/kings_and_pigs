class_name SpriteController extends Node2D


func enableSprite(sprite: Sprite2D):
	for child in get_children():
		child.visible = true if child == sprite else false
