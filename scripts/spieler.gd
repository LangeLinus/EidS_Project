extends CharacterBody2D


const SPEED = 300.0
@export var speed = 400
@export var rotation_speed = 2.5

var rotation_direction = 0

func _physics_process(delta: float) -> void:
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	move_and_slide()
	
func get_input():
	rotation_direction = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_pressed("ui_up"):
		velocity = transform.x *  speed
	else:
		velocity = velocity * 0.97 # sorgt dafür das man slidet wenn man vom gas geht
