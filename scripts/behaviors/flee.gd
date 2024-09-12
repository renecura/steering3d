extends SeekBehavior
class_name FleeBehavior

func steer(agent: CharacterBody3D) -> Vector3:
	return super.steer(agent) * -1
