extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if (Input.is_action_just_pressed("gurda")):
		DataManager.guardar_partida(1)
		pass
	elif (Input.is_action_just_pressed("capma")):
		DataManager.cargar_partida(1)
		pass


func _on_guardarp_pressed():
	DataManager.guardar_partida(1)
	pass # Replace with function body.


func _on_cargarp_pressed():
	DataManager.cargar_partida(1)
	pass # Replace with function body.
