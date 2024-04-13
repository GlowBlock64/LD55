extends CharacterBody2D

const SPEED = 6

var speed_multiplier : float = 1.0

var input_vector : Vector2 = Vector2.ZERO
var velocity_vector : Vector2 = Vector2.ZERO

func _ready():
	pass

func _physics_process(_delta):
	input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity_vector = SPEED * clamp(speed_multiplier, 0, INF) * input_vector.normalized()
	
	move_and_collide(velocity_vector)
