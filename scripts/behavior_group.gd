class_name BehaviorGroup
extends Node

@export var max_velocity: float = 10
@export var max_steering: float = 1
@export var max_speed: float = 10

@onready var agent: CharacterBody3D = get_parent()
@onready var behaviors = get_children()

func _physics_process(delta: float) -> void:
	var steering := Vector3.ZERO
	
	for b: Behavior in behaviors:
		steering += b.steer(agent).limit_length(max_steering) * b.influence
	
	agent.velocity += steering * delta
	agent.velocity.limit_length(max_speed)
	
	# TODO: Reemplazar Vector3.UP por un arriba calculado así rollea
	if agent.velocity.length_squared() > 0:
		agent.look_at(agent.velocity, agent.transform.basis.y)
	
	agent.move_and_slide()
