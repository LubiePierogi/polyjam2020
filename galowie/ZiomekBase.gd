extends KinematicBody2D

const WywalenieWKosmos = preload("res://WywalenieWKosmos.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const DISTANCE_PRECISION = 0.5

var target_point = null


var animated_xd = false
var wywalenie_w_kosmos = null

var kosmos_czas = 0.0

var base_speed = 600

var max_zycko = 100
var zycko = max_zycko

var team = "no" # "galia", "rzym"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("area_entered", self, "contact")
	
	pass # Replace with function body.

func get_speed():
	return base_speed

func set_full_hp():
	zycko = max_zycko
	

func is_alive():
	return zycko > 0.0

func zrob_damage(ile):
	zycko -= ile
	if zycko < 0.0:
		
		return true
	return false

func set_target(point):
	target_point = point

func is_animated():
	return animated_xd && !wywalenie_w_kosmos

func is_wywalony_w_kosmos():
	return wywalenie_w_kosmos

func get_kosmos_powiekszenie():
	if wywalenie_w_kosmos:
		return wywalenie_w_kosmos.get_powiekszenie()
	else:
		return 1.0

func set_animated(q:bool):
	animated_xd = q

func wywal_w_kosmos(where:Vector2, jak_bardzo_w_gore:float):
	wywalenie_w_kosmos = WywalenieWKosmos.instance()
	wywalenie_w_kosmos.sila = jak_bardzo_w_gore
	wywalenie_w_kosmos.where = where
	get_node("CollisionShape2D").disabled = true
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if is_animated() and is_alive():
		if target_point:
			if (target_point - position).length() < DISTANCE_PRECISION:
				target_point = null
			else:
				move_and_slide(calculate_move(target_point, position, get_speed(),\
					delta))
	elif is_wywalony_w_kosmos():
		scale = wywalenie_w_kosmos.get_powiekszenie()
		move_and_slide(wywalenie_w_kosmos.sila)
		if wywalenie_w_kosmos.czas > 30:
			znikanko()
			
			


func znikanko():
	if get_node("../..").get_script().get_path() == "res://Player.gd" ||\
			get_node("../..").get_script().get_path() == "res://Computer.gd":
		get_node("../..").remove_unit(self)
	else:
		get_node("../..").remove_child(self)

func calculate_move(target, position, speed, delta):
	var res = (target_point - position).normalized() * get_speed()
	var res2 = (target_point - position) / delta
	return res if res.length() < res2.length() else res2

func contact(object):
	if ((object.get_owner()).team == "rzym") && team == "galia":
		print ("RZYMIANIE!")
	elif ((object.get_owner()).team== "galia") &&  team == "rzym":
		print ("SQUAD 7 MOVE OUT!")
