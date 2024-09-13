extends Behavior
class_name SeparationBehavior

@export var radius = 10.0

@onready var query := NeighborsQuery.new(radius)

func steer(agent: CharacterBody3D) -> Vector3:
	var otros = query.get_neighbors(agent)
	if otros.is_empty(): return Vector3.ZERO
	
	var steer = Vector3.ZERO
	
	for n in otros:
		var repulsive_force = agent.global_position - n.global_position
		repulsive_force = repulsive_force.normalized() / radius
		steer += repulsive_force
		
	return steer
