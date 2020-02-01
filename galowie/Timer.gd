extends Timer

var turn = -1
signal PlayerTurn
signal EnemyTurn

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Timer_timeout():
	turn += 1
	turn %= 2
	if (turn == 0):
		emit_signal("PlayerTurn")
	else:
		emit_signal("EnemyTurn")
	pass # Replace with function body.
