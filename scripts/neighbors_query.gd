extends Object
class_name NeighborsQuery

var query: PhysicsShapeQueryParameters3D

func _init(radius: float = 2.0):
	var shape_rid = PhysicsServer3D.sphere_shape_create()
	PhysicsServer3D.shape_set_data(shape_rid, radius)
	
	query = PhysicsShapeQueryParameters3D.new()
	query.shape_rid = shape_rid
	#query.collide_with_bodies = true

func get_neighbors(agent: CharacterBody3D) -> Array:
	query.collision_mask = agent.collision_mask
	query.transform = agent.global_transform
	 
	var direct_space_state = agent.get_world_3d().direct_space_state
	var result := direct_space_state.intersect_shape(query)
	
	# return result.filter(func(c): return c["collider"] != agent).map(func(c): return c["collider"])
	return result.map(func(c): return c["collider"])
