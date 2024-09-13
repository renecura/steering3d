extends Behavior
class_name AligmentBehavior

@export var radius = 10.0

@onready var query := NeighborsQuery.new(radius)

func steer(agent: CharacterBody3D) -> Vector3:
	var otros = query.get_neighbors(agent)
	
	if otros.is_empty(): return Vector3.ZERO
	
	var average_velocity = Vector3.ZERO
	for n in otros:
		average_velocity += n.velocity
	average_velocity /= otros.size()
	
	return average_velocity - agent.velocity
