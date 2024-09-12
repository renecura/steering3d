extends Behavior
class_name WanderBehavior

@export var circle_distance: float = 1.0
@export var circle_radius: float = 0.5

func steer(agent: CharacterBody3D) -> Vector3:
	var desired_velocity = agent.transform.basis.z * -circle_distance
	var displacement = agent.transform.basis.y * circle_radius
	
	displacement = displacement.rotated(agent.transform.basis.z, randf_range(-PI,PI))
	
	return desired_velocity + displacement
