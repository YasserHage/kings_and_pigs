extends CharacterState

@export
var speed_modifier: float
@export
var attack_cooldown: Timer
@export
var idle_state: CharacterState
@export
var attack_sprite: Sprite2D
@export
var attack_animation_name: String

var isAttacking: bool = false
var onAttackCooldown = false

var target: Area2D
var stopChase = false

func enter() -> void:
	isAttacking = false
	super()
	
func processFrame(delta: float) -> State:
	_verifyAttackFinished()
	if stopChase:
		stopChase = false
		return idle_state
	return null
	
func processPhysics(delta: float) -> State:
	if !isAttacking:
		var moveDirection = (target.global_position - parent.position)
		_handleDirection(moveDirection)
		
		if abs(moveDirection.x) < 16:
			moveDirection.x = 0
			if !onAttackCooldown:
				_attack()
		parent.velocity.x = moveDirection.normalized().x * parent.speed * speed_modifier
		parent.move_and_slide()
	return null

func _attack() -> void:
	attack_cooldown.start()
	isAttacking = true
	onAttackCooldown = true
	sprite.get_parent().enableSprite(attack_sprite)
	parent.animations.play(attack_animation_name + "_" + direction)

func _verifyAttackFinished() -> void:
	if isAttacking && !parent.animations.is_playing():
		isAttacking = false
		reset()

func _handleDirection(moveDirection):
	var currentDirection = direction
	direction = "right" if moveDirection.x > 0 else "left"
	_verifyAnimation(currentDirection)

func _verifyAnimation(currentDirection):
	if direction != currentDirection:
		playAnimation()

func _on_sight_range_area_exited(area):
	stopChase = true

func _on_attack_cooldown_timeout():
	onAttackCooldown = false
