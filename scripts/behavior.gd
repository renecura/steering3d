class_name Behavior
extends Node

@export_range(0.0, 1.0) var influence: float = 1.0

@onready var group: BehaviorGroup = get_parent()

func steer(agent: CharacterBody3D) -> Vector3:
	return Vector3.ZERO
