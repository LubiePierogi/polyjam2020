extends Node

const Level = preload("res://Level.tscn")
const MainMenu = preload("res://MainMenu.tscn")
const HUD = preload("res://HUD.tscn")

var czasik_xd = 0.0



var main_menu
var hud
var level_xd


# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu = get_node("MainMenu")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	


func on_signal_quit():
	get_tree().quit(0)
	
func on_signal_play():
	get_node("UI").remove_child(get_node("UI/MainMenu"))
	level_xd = Level.instance()
	add_child(level_xd)
	hud = HUD.instance()
	get_node("UI").add_child(hud)
