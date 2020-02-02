extends Node

const Mur = preload("res://Mur.tscn")
const Murmini = preload("res://Murmini.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var units = []
var next_targets = []

func add_unit(unit):
	units.push_back(unit)
	next_targets.push_back(null)
	
func create_unit(scene):
	var unit = scene.instance()
	add_child(unit)
	add_unit(unit)
	return unit
# Called when the node enters the scene tree for the first time.
func _ready():
	create_unit(Mur).position = Vector2 (250,600)
	create_unit(Mur).position = Vector2 (350,500)
	create_unit(Mur).position = Vector2 (450,400)
	create_unit(Mur).position = Vector2 (550,400)
	create_unit(Mur).position = Vector2 (650,500)
	create_unit(Mur).position = Vector2 (750,600)
	create_unit(Murmini).position = Vector2 (100,600)
	create_unit(Murmini).position = Vector2 (150,550)
	create_unit(Murmini).position = Vector2 (200,500)
	create_unit(Murmini).position = Vector2 (250,450)
	create_unit(Murmini).position = Vector2 (300,400)
	create_unit(Murmini).position = Vector2 (350,350)
	create_unit(Murmini).position = Vector2 (400,300)
	create_unit(Murmini).position = Vector2 (450,300)
	create_unit(Murmini).position = Vector2 (500,300)
	create_unit(Murmini).position = Vector2 (550,300)
	create_unit(Murmini).position = Vector2 (600,350)
	create_unit(Murmini).position = Vector2 (650,400)
	create_unit(Murmini).position = Vector2 (700,450)
	create_unit(Murmini).position = Vector2 (750,500)
	create_unit(Murmini).position = Vector2 (800,550)
	create_unit(Murmini).position = Vector2 (850,600)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
