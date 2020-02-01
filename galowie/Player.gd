extends Node

const Zaznaczenie = preload("res://Zaznaczenie.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var units = []

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
		

# Called when the node enters the scene tree for the first time.
func _ready():
	units.push_back("xddddd")
	units.push_back("12321")
	units.push_back(10000)
	print("jabłuszka xd")
	print(units)
	units.clear()
	units.push_back(get_node("../Reperix"))
	units.push_back(get_node("../Almostherix"))
	print(units)


func ogarnij_input():
	if (Input.is_action_just_pressed("ui_iteration")):
		iterate_selection()

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
