extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var target_point = null


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_speed():
	return 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (target_point):
		move_and_slide((target_point - position).normalized() * get_speed())

