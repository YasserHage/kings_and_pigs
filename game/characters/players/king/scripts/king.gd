class_name King extends CharacterBody2D

@onready
var animations = $AnimationPlayer
@onready
var state_machine = $StateMachine

func  _ready():
	state_machine.init(self)
	animations.stop()
	
func _unhandled_input(event):
	state_machine.processInput(event)
	
func _physics_process(delta):
	state_machine.processPhysics(delta)
	
func _process(delta):
	state_machine.processFrame(delta)
	
