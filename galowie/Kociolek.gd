extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal heal

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("area_entered", self, "healing")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func healing(object):
	if (object.get_owner()).team == "galia" :
		print("HULK!")
		emit_signal("heal")
