extends Button

func _ready():
	# Signal "pressed" mit der Funktion "_on_button_pressed" verbinden
	self.connect("pressed", Callable(self, "on_button_pressed"))

func on_button_pressed():
	# Lade die Spielszene
	var load_kram = load("res://scenes/game.tscn")
	get_tree().change_scene_to_packed(load_kram)
