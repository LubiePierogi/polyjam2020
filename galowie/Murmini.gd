extends StaticBody2D

var team = "galia"

var max_zycko = 50
var zycko = max_zycko

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("area_entered", self, "dotyk")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func dotyk(object):
	if (object.get_owner()).team == "galia" && zycko < max_zycko && object.get_owner().get_script().get_path() == "res://ZiomekBase.gd":
		if (object.get_owner()).pil_napoj == true:
			zycko += max_zycko
		else:
			zycko += 20
	if (object.get_owner()).team == "rzym":
		zycko -= 40
		if (zycko <0):
			queue_free()


func _on_Murmini_mouse_entered():
	print("b")
	get_node("../..").mouse_entered(self)
