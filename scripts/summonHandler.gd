extends Area2D

@export var default_amount = 3
@export var default_spread_range = 20

var endpoints : PackedVector2Array = []

signal vein_summon(endpoints:PackedVector2Array, amount:int, spread_range:int)

func _process(_delta):
	global_position = get_global_mouse_position()

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		
		if event.pressed and len(get_overlapping_bodies()) > 0 and len(endpoints) == 0:
			endpoints.append(global_position)
			
		elif !event.pressed:
			if len(get_overlapping_bodies()) > 0 and len(endpoints) == 1:
				endpoints.append(global_position)
				emit_signal("vein_summon", endpoints, default_amount, default_spread_range)
				
			endpoints = []
			
			
