extends Node2D

var world_parts = []
var current_position = Vector2(0, 0)

# Lade die Weltsegmente
var test_1 = preload("res://scenes/world_parts/testwelt1.tscn")
var test_2 = preload("res://scenes/world_parts/testwelt2.tscn")

func _ready():
	# Überprüfe, ob die geladenen Variablen PackedScenes sind
	if not test_1 is PackedScene or not test_2 is PackedScene:
		push_error("Ein oder mehrere Welt-Teile sind keine gültigen PackedScenes.")
		return
	
	# Wenn die Überprüfung bestanden ist, füge sie zum Array hinzu
	world_parts = [test_1, test_2]

	print("World parts loaded: ", world_parts.size())

	# Generiere 5 Segmente
	for i in range(5):
		generate_next_part()

func generate_next_part():
	var random_part = world_parts[randi() % world_parts.size()]
	var part_instance = random_part.instantiate()
	
	part_instance.position = current_position
	add_child(part_instance)
	
	# Aktualisiere die Position für das nächste Segment
	current_position.y += 250
