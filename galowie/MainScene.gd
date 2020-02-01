extends Node

const Level = preload("res://Level.tscn")
const MainMenu = preload("res://MainMenu.tscn")

var main_menu

var czasik_xd = 0.0


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
	level_xd = Level.instance()
	add_child(level_xd)
	get_node("UI").remove_child(get_node("UI/MainMenu"))
