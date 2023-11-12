extends Node2D

@export
var animations: AnimationPlayer
@export
var state_machine: StateMachine
@export
var player_spawn: SpawnerComponent
@export
var checkpoint_enemies: SpawnerGroup

func  _ready():
	state_machine.init(self)

func _process(delta):
	state_machine.processFrame(delta)
