extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func on_signal_button_resume():
	get_node("../..").request_pause_menu()

func on_signal_button_restart():
	get_node("../..").restart_game()
	
func on_signal_button_return_to_menu():
	get_node("../..").return_to_main_menu()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
