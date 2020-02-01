extends Node

const Zaznaczenie = preload("res://Zaznaczenie.tscn")
const Iks = preload("res://Iks.tscn")
const Iks2 = preload("res://Iks2.tscn")
const Gal = preload("res://Gal.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var units = []
var next_targets = []
var vec1 = Vector2(0,0)
var vecklik = Vector2(500,500)


var selected_unit = -1 # numer jednostki w tablicy 'units'
var selection_circle = null
var target_iks = null
var target_iks2 = null

func create_selection_circle():
	selection_circle = Zaznaczenie.instance()

func refresh_selection_circle():
	if selected_unit > -1 and selection_circle:
		selection_circle.position = units[selected_unit].get_node("ZiomekBase").position
	elif selected_unit > -1 and not selected_unit:
		selection_circle = Zaznaczenie.instance()
		add_child(selection_circle)
		selection_circle.position = units[selected_unit].get_node("ZiomekBase").position
	elif selection_circle:
		remove_child(selection_circle)
		selection_circle = null



func set_iks(first, second):
	if first:
		if !target_iks:
			target_iks = Iks.instance()
			add_child(target_iks)
		target_iks.position = first
	else:
		if target_iks:
			remove_child(target_iks)
			target_iks = null
	if second:
		if !target_iks2:
			target_iks2 = Iks2.instance()
			add_child(target_iks2)
		target_iks2.position = second
	else:
		if target_iks2:
			remove_child(target_iks2)
			target_iks2 = null
			
	

func refresh_iks():
	if selected_unit > -1:
		set_iks(units[selected_unit].get_node("ZiomekBase").target_point,\
			next_targets[selected_unit])
	else:
		set_iks(null, null)
	

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
	create_unit(Gal).get_node("ZiomekBase").position = Vector2(400,600)
	create_unit(Gal).get_node("ZiomekBase").position = Vector2(500,600)
	var haha = create_unit(Gal).get_node("ZiomekBase")
	haha.position = Vector2(600,600)
	#haha.zycko = -3
	create_unit(Gal).get_node("ZiomekBase").position = Vector2(700,600)
	#add_unit(get_node("../Reperix"))
	#add_unit(get_node("../Almostherix"))


func ogarnij_input():
	if (Input.is_action_just_pressed("ui_iteration")):
		iterate_selection()
	if (Input.is_mouse_button_pressed(BUTTON_RIGHT)):
		if selected_unit > -1 && selected_unit < len(units):
			next_targets[selected_unit] = get_viewport().get_mouse_position()

func iterate_selection():
	var old_selection = selected_unit
	if len(units) > 0:
		while 1:
			selected_unit = (selected_unit + 1) % len(units)
			if units[selected_unit].get_node("ZiomekBase").is_alive():
				return
			if old_selection == selected_unit:
				selected_unit = -1
				return
			if old_selection == -1:
				old_selection = 0 # żeby jak nic nie było zaznaczony to na zerze już wywalało
	else:
		selected_unit = -1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ogarnij_input()
	refresh_selection_circle()
	refresh_iks()
	
func _on_Timer_timeout():
	var i = 0
	while i < len(units):
		units[i].get_node("ZiomekBase").target_point = next_targets[i]
		next_targets[i] = null
		i = i + 1
	return
	
func on_signal_start_turn():
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
	

