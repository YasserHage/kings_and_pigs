extends StateMachine

@export
var chase_state: State

func _on_sight_range_area_entered(area):
	chase_state.target = area
	changeState(chase_state)
