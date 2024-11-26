extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -200.0
@export var speed = 400
@export var rotation_speed = 2.5

var rotation_direction = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	
	# Handle jump.
	#if Input.is_action_pressed("ui_accept"):
	#	velocity.y = JUMP_VELOCITY
	#else:
	#	velocity.y = velocity.y * 0.99
		

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
	#	velocity.x = direction * SPEED
	#else:
	#	velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
func get_input():
	rotation_direction = Input.get_axis("ui_left", "ui_right")
	if Input.is_action_pressed("ui_up"):
		velocity = transform.x *  speed
	else:
		velocity = velocity * 0.97
