extends State

@export
var idle_state: State
@export
var walk_state: State
@export
var fall_sprite: Sprite2D
@export
var speed: int
@export
var jump_power: int
var jump_sprite
var jump_animation_name

func enter() -> void:
	setupJump()
	super()
	parent.velocity.y = -jump_power

func processPhysics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	if animation_name != "fall" && verifyFall():
		animation_name = "fall"
		sprite = fall_sprite
		refreshSprite()
		playAnimation()
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if parent.velocity.x != 0:
			return walk_state
		return idle_state
	return null
	
func processFrame(delta: float) -> State:
	handleMovement()
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

func _verifyAnimation(currentDirection):
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
