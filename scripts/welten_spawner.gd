extends Node2D

var world_parts = []
var current_position = Vector2(0, 0)
var segment_height = 200  # Passe diesen Wert an die tatsächliche Segmenthöhe an

# Lade die Weltsegmente
var test_1 = preload("res://scenes/world_parts/testwelt1.tscn")
var test_2 = preload("res://scenes/world_parts/testwelt2.tscn")

func _ready():
	if not test_1 is PackedScene or not test_2 is PackedScene:
		push_error("Ein oder mehrere Welt-Teile sind keine gültigen PackedScenes.")
		return
	
	world_parts = [test_1, test_2]
	
	# Initiale Segmente generieren
	for i in range(5):
		generate_next_part()

func _process(delta):
	check_and_generate_segments()
	remove_offscreen_segments()

func check_and_generate_segments():
	# Position der Kamera holen
	var camera_y = get_viewport().get_camera_2d().global_position.y
	var viewport_height = get_viewport_rect().size.y
	
	# Neues Segment oberhalb erstellen, wenn nötig
	if current_position.y > camera_y - viewport_height - segment_height:
		generate_next_part()

func generate_next_part():
	var random_part = world_parts[randi() % world_parts.size()]
	var part_instance = random_part.instantiate()
	
	current_position.y -= segment_height  # Nach oben versetzen
	part_instance.position = current_position
	add_child(part_instance)

func remove_offscreen_segments():
	# Lösche Segmente, die unterhalb des sichtbaren Bereichs sind
	var camera_y = get_viewport().get_camera_2d().global_position.y
	var viewport_height = get_viewport_rect().size.y
	
	for child in get_children():
		if child is Node2D and child.position.y > camera_y + viewport_height:
			child.queue_free()
