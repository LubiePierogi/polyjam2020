extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var czas = 0.0
var where = Vector2(0,0)
var w_gore = 0.0
var powiekszenie = 1.0


func _ready():
	pass

func _physics_process(delta):
	czas += delta
	var wysokosc = 0.0 + czas * w_gore - (czas * czas)
	powiekszenie = min(exp(wysokosc), 300.0)


func get_powiekszenie():
	return powiekszenie

func should_usunac():
	return czas > 8 || powiekszenie < 1.0
