extends Behavior
class_name FleeBehavior

var seek := SeekBehavior.new()

func steer(agent: CharacterBody3D) -> Vector3:
	return seek.steer(agent) * -1
