extends StaticBody2D

var team = "galia"

var max_zycko = 200
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
			zycko += 50
		else:
			zycko += 20
	if (object.get_owner()).team == "rzym":
		zycko -= 40
		if (zycko <0):
			queue_free()
