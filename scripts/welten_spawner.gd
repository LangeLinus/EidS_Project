extends Node2D

var world_parts = []
var current_position = Vector2(0, 3200) #position wo das nächste teil andocken wird
var segment_height = 3200  #Segmentlänge
# Lade die Weltsegmente
var test_1 = preload("res://scenes/world_parts/testwelt1.tscn")
var test_2 = preload("res://scenes/world_parts/testwelt2.tscn")

func _ready():
	world_parts = [test_1, test_2]
	current_position.y #+=300
	# Initiale Segmente generieren
	for i in range(5):
		generate_next_part()

func _process(delta):
	check_and_generate_segments()
	remove_offscreen_segments()

func check_and_generate_segments():
	# Position der Kamera holen
	var camera_y = get_viewport().get_camera_2d().global_position.y #kamera pos holen
	var viewport_height = get_viewport_rect().size.y #fenstergröße holen
	
	# Neues Segment oberhalb erstellen, wenn nötig
	if current_position.y > camera_y - viewport_height - segment_height: 
		generate_next_part()

func generate_next_part():
	var random_part = world_parts[randi() % world_parts.size()] #zufällige Szene aus dem welten array holen
	var part_instance = random_part.instantiate() #teil instanziiern
	
	current_position.y -= segment_height  # Nach oben versetzen muss mit minus gemacht werden weil wir nach oben fahren
	part_instance.position = current_position # das teil wird an die aktuelle position angehängt
	add_child(part_instance) #welt teil tatsächlich hinzufügen

func remove_offscreen_segments():
	# Lösche Segmente, die unterhalb des sichtbaren Bereichs sind
	var camera_y = get_viewport().get_camera_2d().global_position.y
	var viewport_height = get_viewport_rect().size.y
	
	for child in get_children():
		if child is Node2D and child.position.y > camera_y + viewport_height+segment_height: #teil wird gelöscht wenn jeder pixel des childs vom screen sind
			child.queue_free()
