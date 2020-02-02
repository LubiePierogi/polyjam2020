extends Node

const Rzymianin = preload("res://Rzymianin.tscn")

var rng = RandomNumberGenerator.new()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lewy = true

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
	create_unit(Rzymianin).get_node("ZiomekBase").position = Vector2(100,100)
	var haha = create_unit(Rzymianin).get_node("ZiomekBase")
	haha.position = Vector2(400,100)
	#haha.zycko = 0
	create_unit(Rzymianin).get_node("ZiomekBase").position = Vector2(700,100)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func delete_unit(unit):
	remove_child(unit)
	for i in range(len(units)):
		if units[i] == unit:
			units.erase(i)
			break


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func plan_next_turn():
	var i = 0
	while i < len(units):
		next_targets[i] = Vector2(\
			rng.randf_range(100.0, 800.0),\
			rng.randf_range(100.0, 400.0) \
		)
		i += 1
	

func on_signal_start_turn():
	plan_next_turn()
	var i = 0
	while i < len(units):
		var ziomek = units[i].get_node("ZiomekBase")
		ziomek.set_target(next_targets[i])
		ziomek.set_animated(true)
		next_targets[i] = null
		i += 1
	
func on_signal_finish_turn():
	var i = 0
	while i < len(units):
		var ziomek = units[i].get_node("ZiomekBase")
		ziomek.set_target(null)
		ziomek.set_animated(false)
		i += 1


func _on_Timer_CallEnemy():
	var ziomek = create_unit(Rzymianin).get_node("ZiomekBase")
	if lewy:
		ziomek.position = Vector2(300,100)
		lewy = false
	else:
		ziomek.position = Vector2(700,100)
		lewy = true
	pass # Replace with function body.
