extends Node

var datos_partida = {
	posicion_x = 0,
	posicion_y = 0
} 

func _ready():
	var path = Directory.new()
	if (!path.dir_exists("user://pin_saves")):
		path.open("user://")
		path.make_dir("user://pin_saves")
	pass

func guardar_partida(var numero):
	var save = File.new()
	save.open("user://pin_saves"+ String(numero) + ".sav", File.WRITE)
	
	var datos_guardar = datos_partida
	datos_guardar.posicion_x = get_tree().get_nodes_in_group("persona")[0].global_position.x  
	datos_guardar.posicion_y = get_tree().get_nodes_in_group("persona")[0].global_position.y
	
	save.store_line(to_json(datos_guardar))
	
	save.close()
	
	pass

func cargar_partida(var numero):
	
	var cargar = File.new()
	if (!cargar.file_exists("user://pin_saves"+ String(numero) + ".sav")):
		print ("No hay partida guardadas")
		return
	cargar.open("user://pin_saves"+ String(numero) + ".sav", File.READ)
	
	var datos_cargar = datos_partida
	
	if(!cargar.eof_reached()):
		var datos_provis = parse_json(cargar.get_line())
		if (datos_provis != null):
			datos_cargar = datos_provis
			
		cargar.close()
		
		get_tree().get_nodes_in_group("persona")[0].global_position.x = datos_cargar.posicion_x
		get_tree().get_nodes_in_group("persona")[0].global_position.y = datos_cargar.posicion_y
		
	pass









