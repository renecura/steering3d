extends Behavior
class_name CohesionBehavior

@export var radius = 10.0

@onready var query := NeighborsQuery.new(radius)

func steer(agent: CharacterBody3D) -> Vector3:
	var otros = query.get_neighbors(agent)
	if otros.is_empty(): return Vector3.ZERO
	
	var center = Vector3.ZERO
	for n in otros:
		center += n.global_position
	center /= otros.size()
	
	var desired_velocity = center - agent.global_position
	desired_velocity = desired_velocity.normalized() * group.max_speed / radius
	
	return desired_velocity - agent.velocity
