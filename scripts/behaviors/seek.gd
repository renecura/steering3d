extends Behavior
class_name SeekBehavior

@export var target: Node3D

func steer(agent: CharacterBody3D) -> Vector3:
	var desired_velocity = target.global_position - agent.global_position
	desired_velocity = desired_velocity.normalized() * group.max_velocity
	
	var steering = desired_velocity - agent.velocity
	return steering.limit_length(group.max_steering)
