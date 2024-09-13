extends Behavior
class_name SeparationBehavior

@export var radius = 10.0

@onready var query := NeighborsQuery.new(radius)

func steer(agent: CharacterBody3D) -> Vector3:
	var otros = query.get_neighbors(agent)
	
	
	
	return Vector3.ZERO
