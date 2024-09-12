extends Behavior
class_name SeparationBehavior

@export var radius = 10.0

var shape_rid

func _ready() -> void:
	shape_rid = PhysicsServer3D.sphere_shape_create()
	PhysicsServer3D.shape_set_data(shape_rid, radius)

func steer(agent: CharacterBody3D) -> Vector3:
	var query := PhysicsShapeQueryParameters3D.new()
	var direct_space_state = agent.get_world_3d().direct_space_state
	query.shape_rid = shape_rid
	#query.collide_with_areas = true
	query.collision_mask = agent.collision_mask
	query.transform = agent.global_transform
	var result := direct_space_state.intersect_shape(query)
	
	var otros = []
	for c in result:
		if c["collider"] != agent:
			otros.append(c["collider"])
	
	
	print(otros)
	return Vector3.ZERO
