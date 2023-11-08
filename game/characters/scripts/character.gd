class_name Character extends CharacterBody2D

@export
var speed: int
@export
var animations: AnimationPlayer
@export
var state_machine: StateMachine

func  _ready():
	state_machine.init(self)
	
func _unhandled_input(event):
	state_machine.processInput(event)
	
func _physics_process(delta):
	state_machine.processPhysics(delta)
	
func _process(delta):
	state_machine.processFrame(delta)
	
func _on_hurt_box_hit(hit_box:HitBoxComponent):
# knockback and animation
	var hitDirection:Vector2 = position - hit_box.global_position
	knockback(hitDirection.normalized() * speed, hit_box.getKnockbackPower())
	
func knockback(hitVelocity: Vector2, knockbackPower: int):
	velocity.x = (hitVelocity.x - velocity.x) * knockbackPower
	move_and_slide()
