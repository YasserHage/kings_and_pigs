extends Node2D

@export
var animations: AnimationPlayer
@export
var state_machine: StateMachine

func  _ready():
	state_machine.init(self)

func _process(delta):
	state_machine.processFrame(delta)
