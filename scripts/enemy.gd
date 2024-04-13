extends CharacterBody2D

const SPEED = 5

var speed_multiplier : float = 1.0

var input_vector : Vector2 = Vector2.ZERO
var velocity_vector : Vector2 = Vector2.ZERO

func _physics_process(_delta):
	input_vector = position.direction_to(get_parent().get_parent().get_node("player").position)
	velocity_vector = SPEED * clamp(speed_multiplier, 0, INF) * input_vector.normalized()
	
	move_and_collide(velocity_vector)
