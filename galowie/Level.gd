extends Node2D



func _ready():
	pass # Replace with function body.


func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_node("..").request_pause_menu()
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
