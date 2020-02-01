extends Node2D

var vec1 = Vector2(0,0)
var vec2 = Vector2(0,0)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	vec1 = get_node("Reperix").get_position()
	vec2 = Vector2(1300,900) - vec1
	get_node("Reperix").target_point = vec2
	vec1=get_node("Almostherix").get_position()
	vec2 = Vector2(200,300) - vec1
	get_node("Almostherix").target_point = vec2
	pass # Replace with function body.
