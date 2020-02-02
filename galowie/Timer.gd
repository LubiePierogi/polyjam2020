extends Timer

var turn = -1
signal PlayerTurn
signal EnemyTurn
signal CallBoss
signal CallEnemy

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Timer_timeout():
	turn += 1
	if (turn % 2 == 0):
		emit_signal("PlayerTurn")
	else:
		emit_signal("EnemyTurn")
	if turn == 40:
		emit_signal ("CallBoss")
	if turn % 6 == 0:
		emit_signal("CallEnemy")
	pass # Replace with function body.
