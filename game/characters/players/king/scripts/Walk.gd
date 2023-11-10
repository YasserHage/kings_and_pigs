extends CharacterState

@export
var idle_state: State
@export
var jump_state: State
@export
var attack_sprite: Sprite2D
@export
var attack_animation_name: String
var isAttacking: bool = false

func enter() -> void:
	handleMovement()
	super()
	
func exit() -> void:
	if (isAttacking):
		_stop_attack()
	
func processInput(event: InputEvent) -> State:
	if Input.is_action_pressed("attack"):
		_attack()
	return null
	
func processFrame(delta: float) -> State:
	_verifyAttackFinished()
	handleMovement()
	if Input.is_action_just_pressed("jump") &&  parent.is_on_floor():
		return jump_state
	if parent.velocity.x == 0 && _verifyIdle():
		return idle_state
	return null
	
func processPhysics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	return null
	
func handleMovement() -> void:
	var currentDirection = direction;
	if Input.is_action_pressed("ui_left"):
		direction = "left"
		_verifyAnimation(currentDirection)
		parent.velocity.x = -parent.speed;
		return
	if Input.is_action_pressed("ui_right"):
		direction = "right"
		_verifyAnimation(currentDirection)
		parent.velocity.x = parent.speed;
		return
		
	parent.velocity.x = 0;

func _attack() -> void:
	isAttacking = true
	PlayerEvents.is_player_attacking.emit(isAttacking)
	sprite.get_parent().enableSprite(attack_sprite)
	parent.animations.play(attack_animation_name + "_" + direction)
	
func _verifyAttackFinished() -> void:
	if isAttacking && !parent.animations.current_animation.contains(attack_animation_name):
		_stop_attack()
		reset()
		
func _stop_attack():
	isAttacking = false
	PlayerEvents.is_player_attacking.emit(isAttacking)
	
func _verifyIdle() -> bool:
	return !(Input.is_action_just_pressed("ui_left") || Input.is_action_just_pressed("ui_right"))

func _verifyAnimation(currentDirection):
	if direction != currentDirection:
		playAnimation()
