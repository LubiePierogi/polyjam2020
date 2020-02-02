extends Control

#signal button_play
#signal ButtonOptions
#signal button_quit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func on_signal_button_play_pressed():
	#emit_signal("button_play")
	get_node("../..").start_game()

func on_signal_button_options_pressed():
	pass
func on_signal_button_quit_pressed():
	#emit_signal("button_quit")
	get_node("../..").quit_game()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
