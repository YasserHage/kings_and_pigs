extends State

@export
var walk_state: State
@export
var jump_state: State
@export
var attack_sprite: Sprite2D
@export
var attack_animation_name: String

var isAttacking: bool = false

func enter() -> void:
	super()
	parent.velocity.x = 0

func processInput(event: InputEvent) -> State:
	if event.is_action_pressed("ui_left") or event.is_action_pressed("ui_right"):
		return walk_state
	if Input.is_action_just_pressed("jump"):
		return jump_state
	if Input.is_action_pressed("attack"):
		_attack()
	return null
	
func processFrame(delta: float) -> State:
	_verifyAttackFinished()
	return null
	
func processPhysics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return null
	return null
	
func _attack() -> void:
	isAttacking = true
	sprite.get_parent().enableSprite(attack_sprite)
	parent.animations.play(attack_animation_name + "_" + direction)

func _verifyAttackFinished() -> void:
	if isAttacking && !parent.animations.is_playing():
		isAttacking = false
		reset()
