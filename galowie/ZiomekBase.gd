extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const DISTANCE_PRECISION = 0.5

var target_point = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_speed():
	return 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if target_point:
		if (target_point - position).length() < DISTANCE_PRECISION:
			target_point = null
		else:
			move_and_slide(calculate_move(target_point, position, get_speed(),\
				delta))

func calculate_move(target, position, speed, delta):
	var res = (target_point - position).normalized() * get_speed()
	var res2 = (target_point - position) / delta
	return res if res.length() < res2.length() else res2
