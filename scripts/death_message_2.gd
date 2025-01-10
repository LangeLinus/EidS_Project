extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.text = str(get_parent().get_parent().score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.text = "score " +str(get_parent().get_parent().score)
