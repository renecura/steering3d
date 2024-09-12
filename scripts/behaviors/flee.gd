extends Behavior
class_name FleeBehavior

@export var target: Node3D

func steer(agent: CharacterBody3D) -> Vector3:
	var desired_velocity = target.global_position - agent.global_position
	desired_velocity = desired_velocity.normalized() * group.max_velocity * -1.0
	
	return desired_velocity - agent.velocity
