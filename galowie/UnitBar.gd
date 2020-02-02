extends Control


var name_label : Label
var health_progress : ProgressBar
var drink_progress : ProgressBar


# Called when the node enters the scene tree for the first time.
func _ready():
	name_label = get_node("Label")
	name_label.text = ""
	add_child(name_label)
	health_progress = get_node("ProgressBar")
	#health_progress.set_size(Vector2(200.0, 40.0))
	health_progress.min_value = 0.0
	health_progress.max_value = 1.0
	health_progress.step = 0.01
	health_progress.value = 0.5
	add_child(health_progress)
	
func set_drink_show(val : bool):
	if val && !drink_progress:
		drink_progress = ProgressBar.new()
		drink_progress.value = 0.5
		add_child(drink_progress)
	elif !val && drink_progress:
		remove_child(drink_progress)
		drink_progress = null
		
func set_name(text):
	name_label.text = text

func set_health(cur_val, max_val):
	health_progress.value = cur_val / max_val

func set_drink(cur_val, max_val):
	if drink_progress:
		drink_progress.value = cur_val / max_val




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
