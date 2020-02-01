extends Node

const Ziomek = preload("res://Ziomek.tscn")
const Rzymianin = preload("res://Rzymianin.tscn")

var rng = RandomNumberGenerator.new()

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
	rng.randomize() # Replace with function body.
	create_unit(Ziomek).position = Vector2(100,100)
	create_unit(Ziomek).position = Vector2(400,100)
	create_unit(Ziomek).position = Vector2(700,100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _on_Timer_timeout():
	var i = 0
	while i < len(units):
		units[i].target_point = Vector2(\
			rng.randf_range(100, 800) ,rng.randf_range(100, 800))
		next_targets[i] = null
		i = i + 1
	return




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
