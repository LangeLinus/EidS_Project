extends CharacterBody2D


@export var speed = 400 # wie schnell wir sind
@export var rotation_speed = 2.5 # das ist in so wikeldingern angegeben ka nicht groß verändern 
var score =0
var rotation_direction = 0


	
	
func _physics_process(delta: float) -> void:
	get_input()
	rotation += rotation_direction * rotation_speed * delta #drehen
	is_moving()
	move_and_slide()
	if is_on_wall() or is_on_ceiling() or is_on_floor():
		var load_kram = load("res://scenes/respawn.tscn")
		
		get_tree().change_scene_to_packed(load_kram)
	
func get_input():
	rotation_direction = Input.get_axis("ui_left", "ui_right") #drehrichtung
	if Input.is_action_pressed("ui_up"):
		velocity = transform.x *  speed #während w oder pfeil oben gedrückt gas geben 
		
	else :
		velocity = velocity *0.98 #geschwindigkeit langsam veringern
func is_moving():
	if velocity.length() > 16:
		score+=1
