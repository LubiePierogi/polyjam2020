extends Node

const Level = preload("res://Level.tscn")
const MainMenu = preload("res://MainMenu.tscn")
const HUD = preload("res://HUD.tscn")
const PauseMenu = preload("res://PauseMenu.tscn")

var czasik_xd = 0.0



var main_menu
var hud
var level_xd
var pause_menu
var ui


# Called when the node enters the scene tree for the first time.
func _ready():
	ui = get_node("UI")
	main_menu = get_node("UI/MainMenu")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	


func quit_game():
	get_tree().quit(0)
	
func start_game():
	delete_main_menu()
	create_level()
	create_hud()

func request_pause_menu():
	if not pause_menu:
		pause_menu = PauseMenu.instance()
		ui.add_child(pause_menu)
	else:
		ui.remove_child(pause_menu)
		pause_menu = null
		


func return_to_main_menu():
	if pause_menu:
		ui.remove_child(pause_menu)
		pause_menu = null
	delete_hud()
	delete_level()
	create_main_menu()


func restart_game():
	delete_level()
	create_level()
	if pause_menu:
		request_pause_menu()


func create_level():
	if !level_xd:
		level_xd = Level.instance()
		add_child(level_xd)

func delete_level():
	if level_xd:
		remove_child(level_xd)
		level_xd = null

func create_main_menu():
	if !main_menu:
		main_menu = MainMenu.instance()
		ui.add_child(main_menu)

func delete_main_menu():
	if main_menu:
		ui.remove_child(main_menu)
		main_menu = null


func create_hud():
	if !hud:
		hud = HUD.instance()
		ui.add_child(hud)

func delete_hud():
	if hud:
		ui.remove_child(hud)
		hud = null

func mouse_entered_unit(unit):
	var unit_bar = get_node("UI/HUD/TopBar/UnitBar")
	unit_bar.set_name("")
	unit_bar.set_health(unit.zycko, unit.max_zycko)
	
