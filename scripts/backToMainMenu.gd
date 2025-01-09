extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.connect("pressed", Callable(self, "on_button_pressed"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func on_button_pressed():
	# Lade die Spielszene
	var load_kram = load("res://scenes/MainScreen.tscn")
	get_tree().change_scene_to_packed(load_kram)
