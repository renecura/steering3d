extends Node3D

@export var target: Node3D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var bichos = $Bichos.get_children()
	bichos.map(func(b): b.get_node("BehaviorGroup/ArriveBehavior").target = target)
	bichos.map(func(b): b.position += Vector3(randf_range(-3,3), randf_range(-3,3), randf_range(-3,3)))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
