class_name CharacterState extends State

@export
var animation_name: String
@export
var direction: String: set = setDirection, get = getDirection
var parent: Character: set = setParent

func enter() -> void:
	reset()

func exit() -> void:
	pass

func processInput(event: InputEvent) -> State:
	return null
	
func processFrame(delta: float) -> State:
	return null
	
func processPhysics(delta: float) -> State:
	return null

func setParent(_parent) -> void:
	parent = _parent

func setDirection(_direction) -> void:
	direction = _direction
	
func getDirection() -> String:
	return direction
	
func playAnimation() -> void:
	parent.animations.play(animation_name + "_" + direction)

func reset() -> void:
	super()
	playAnimation()
