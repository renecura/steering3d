extends Behavior
class_name ArriveBehavior

@export var slow_radius: float = 1.0

@export var target: Node3D

func steer(agent: CharacterBody3D) -> Vector3:
	var desired_velocity = target.global_position - agent.global_position
	var distance = desired_velocity.length()
	
	desired_velocity = desired_velocity.normalized() * group.max_velocity * (min(distance,slow_radius) / slow_radius)
	
	return desired_velocity - agent.velocity
	
