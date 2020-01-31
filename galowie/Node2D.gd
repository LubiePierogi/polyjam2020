extends Node2D


var Turn = -1
var Pauza = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
 # Replace with function body.


func _on_Timer_timeout():
	
	Turn += 1
	Turn %= 2
	
	if (Turn==0):
		get_node("Wynik").text += "\nGracz"
	else:
		get_node("Wynik").text += "\nPrzeciwnik"
	pass # Replace with function body.


func _on_Button_pressed():
	if (Pauza==false):
		get_node("Timer").stop()
		Pauza=true
	else:
		get_node("Timer").start()
		Pauza=false
	pass # Replace with function body.
