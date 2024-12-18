extends Button

func _ready():
	# Signal "pressed" mit der Funktion "_on_button_pressed" verbinden
	self.connect("pressed", Callable(self, "on_button_pressed"))

func on_button_pressed():
	# Lade die Spielszene
	get_tree().change_scene("res://scenes/game.tscn")
