extends State

@export
var idle_state: State
@export
var fall_sprite: Sprite2D
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
		return idle_state
	return null

func setupJump() -> void:
	if !jump_sprite:
		jump_animation_name = animation_name
		jump_sprite = sprite
	animation_name = jump_animation_name
	sprite = jump_sprite
	
func verifyFall() -> bool:
	return parent.velocity.y > 0
