extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var units = []
 # false - niezaznaczone, true - zaznaczone

var selection_circle = null

func add_selection_circle():
	pass

func refresh_selection_circle():
	for unit in units:
		if units[unit]:
			if true:#circles_iter >= circles_count:
				add_selection_circle()
				#selection_circles[circles_iter].position = unit.position
				
		#++circles_iter

# Called when the node enters the scene tree for the first time.
func _ready():
	units.push_back("xddddd")
	units.push_back("12321")
	units.push_back(10000)
	print("jabłuszka xd")
	print(units)
	units.clear()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
