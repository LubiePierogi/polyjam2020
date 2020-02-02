extends StaticBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

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
		(object.get_owner()).zycko = (object.get_owner()).max_zycko


func _on_Kociolek_mouse_entered():
	get_node("..").mouse_entered(self)
