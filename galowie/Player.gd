extends Node

const Zaznaczenie = preload("res://Zaznaczenie.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var units = []
var next_targets = []
var vec1 = Vector2(0,0)
var vecklik = Vector2(500,500)


var selected_unit = -1 # numer jednostki w tablicy 'units'
var selection_circle = null

func create_selection_circle():
	selection_circle = Zaznaczenie.instance()

func refresh_selection_circle():
	if selected_unit > -1 and selection_circle:
		selection_circle.position = units[selected_unit].position
	elif selected_unit > -1 and not selected_unit:
		selection_circle = Zaznaczenie.instance()
		add_child(selection_circle)
		selection_circle.position = units[selected_unit].position
	elif selection_circle:
		remove_child(selection_circle)
		selection_circle = null
		

func add_unit(unit):
	units.push_back(unit)
	next_targets.push_back(null)

# Called when the node enters the scene tree for the first time.
func _ready():
	units.push_back("xddddd")
	units.push_back("12321")
	units.push_back(10000)
	print("jabłuszka xd")
	print(units)
	units.clear()
	add_unit(get_node("../Reperix"))
	add_unit(get_node("../Almostherix"))
	print(units)


func ogarnij_input():
	if (Input.is_action_just_pressed("ui_iteration")):
		iterate_selection()
	if (Input.is_mouse_button_pressed(BUTTON_RIGHT)):
		print("xd")
		if selected_unit > -1 && selected_unit < len(units):
			print("xdd")
			next_targets[selected_unit] = get_viewport().get_mouse_position()

func iterate_selection():
	if len(units) > 0:
		selected_unit = (selected_unit + 1) % len(units)
	else:
		selected_unit = -1
	print(selected_unit)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ogarnij_input()
	refresh_selection_circle()
	
func _on_Timer_timeout():
	var i = 0
	print("ewriopoewrpiorwe")
	while i < len(units):
		units[i].target_point = next_targets[i]
		next_targets[i] = null
		print("hahahahahahaha")
		i = i + 1
	return
	
	vec1 = get_node("../Reperix").get_position()
	vec1 = vecklik - vec1
	get_node("../Reperix").target_point = vec1
	vec1=get_node("../Almostherix").get_position()
	vec1= vecklik - vec1
	get_node("../Almostherix").target_point = vec1
	pass # Replace with function body.
