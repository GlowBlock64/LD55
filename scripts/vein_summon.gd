extends Node2D

@export var segments = 20

@onready var vein_resource = preload("res://scenes/vein.tscn")

var local_mouse_position : Vector2 = Vector2.ZERO

func _ready():
	pass

func _physics_process(_delta):
	pass


func _on_summon_handler_vein_summon(endpoints, amount, spread_range):
	for _i in range(amount):
		var all_points = []
		# var dx1 = spread_range * (2 * randf() - 1)
		# var dy1 = spread_range * (2 * randf() - 1)
		# var dx2 = spread_range * (2 * randf() - 1)
		# var dy2 = spread_range * (2 * randf() - 1)
		
		# endpoints[0] += Vector2(dx1, dy1)
		# endpoints[1] += Vector2(dx2, dy2)
		all_points.append(endpoints[0])
		for j in range(segments):
			all_points.append((endpoints[1] - endpoints[0]) * (j+1) / segments + endpoints[0] + Vector2(randi() % 21 - 10, randi() % 21 - 10))
		all_points.append(endpoints[1])
		
		
		var vein = vein_resource.instantiate()
		vein.points = all_points
		
		get_parent().get_parent().get_node("veins").add_child(vein)
