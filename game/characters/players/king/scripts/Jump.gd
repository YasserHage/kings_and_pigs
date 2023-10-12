extends State

@export
var idle_state: State
@export
var walk_state: State
@export
var fall_sprite: Sprite2D
@export
var attack_sprite: Sprite2D
@export
var attack_animation_name: String
@export
var speed: int
@export
var jump_power: int

var jump_sprite
var jump_animation_name
var isAttacking: bool = false

func enter() -> void:
	setupJump()
	super()
	parent.velocity.y = -jump_power

func processInput(event: InputEvent) -> State:
	if Input.is_action_pressed("attack"):
		_attack()
	return null

func processFrame(delta: float) -> State:
	_verifyAttackFinished()
	handleMovement()
	return null
	
func processPhysics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	if animation_name != "fall" && verifyFall():
		animation_name = "fall"
		sprite = fall_sprite
		reset()
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if parent.velocity.x != 0:
			return walk_state
		return idle_state
	return null
	
func handleMovement() -> void:
	var currentDirection = direction;
	if Input.is_action_pressed("ui_left"):
		direction = "left"
		_verifyAnimation(currentDirection)
		parent.velocity.x = -speed;
		return
	if Input.is_action_pressed("ui_right"):
		direction = "right"
		_verifyAnimation(currentDirection)
		parent.velocity.x = speed;
		return
		
	parent.velocity.x = 0;

func _attack() -> void:
	isAttacking = true
	sprite.get_parent().enableSprite(attack_sprite)
	parent.animations.play(attack_animation_name + "_" + direction)
		
func _verifyAttackFinished() -> void:
	if isAttacking && !parent.animations.is_playing():
		isAttacking = false
		reset()
		
func _verifyAnimation(currentDirection) -> void:
	if direction != currentDirection:
		playAnimation()

func setupJump() -> void:
	if !jump_sprite:
		jump_animation_name = animation_name
		jump_sprite = sprite
	animation_name = jump_animation_name
	sprite = jump_sprite
	
func verifyFall() -> bool:
	return parent.velocity.y > 0
