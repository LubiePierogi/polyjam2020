extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var czas = 0.0
var where = Vector2(0,0)
var w_gore = 0.0


func _physics_process(delta):
	czas += delta


func get_powiekszenie():
	var wysokosc = 0.0 + czas * w_gore - czas * czas * -10
	return exp(wysokosc)
