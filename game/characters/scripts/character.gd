class_name Character extends CharacterBody2D

@export
var animations: AnimationPlayer
@export
var state_machine: StateMachine

func  _ready():
	state_machine.init(self)
	
func _unhandled_input(event):
	state_machine.processInput(event)
	
func _physics_process(delta):
	state_machine.processPhysics(delta)
	
func _process(delta):
	state_machine.processFrame(delta)
	
