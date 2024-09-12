class_name SteeringAgent
extends CharacterBody3D

@export var max_velocity: float = 10
@export var max_steering: float = 1
@export var max_speed: float = 10

@export var target: Node3D

func _physics_process(delta: float) -> void:
	
	# seek
	var desired_velocity = target.global_position - global_position
	desired_velocity = desired_velocity.normalized() * max_velocity
	
	var steering = desired_velocity - velocity
	steering = steering.limit_length(max_steering)
	
	# velocity es determinada por los behaviours
	velocity += steering
	velocity.limit_length(max_speed)
	
	# TODO: Reemplazar Vector3.UP por un arriba calculado así rollea
	look_at(velocity, Vector3.UP)
	
	move_and_slide()
