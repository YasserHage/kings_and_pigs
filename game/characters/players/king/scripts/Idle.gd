extends CharacterState

@export
var walk_state: State
@export
var jump_state: State
@export
var attack_sprite: Sprite2D
@export
var attack_animation_name: String
@export
var one_way_layer: int

var isAttacking: bool = false
var resetOneWayLayer: bool = false

func enter() -> void:
	super()
	parent.velocity.x = 0
	
func exit() -> void:
	if (isAttacking):
		_stop_attack()

func processInput(event: InputEvent) -> State:
	return _handle_input()
	
func processFrame(delta: float) -> State:
	_verifyAttackFinished()
	if resetOneWayLayer:
		parent.set_collision_mask_value(one_way_layer, true)
	return _handle_input()
	
func processPhysics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return null
	return null
	
func _handle_input() -> State:
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		return walk_state
	if Input.is_action_pressed("ui_down"):
		resetOneWayLayer = true
		parent.set_collision_mask_value(one_way_layer, false)
		return null
	if Input.is_action_just_pressed("jump"):
		return jump_state
	if Input.is_action_pressed("attack"):
		_attack()
	return null
	
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
