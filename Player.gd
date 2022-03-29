extends KinematicBody

# How fast the player moves in meters per second.
export var speed = 10

var velocity = Vector3.ZERO

func _physics_process(_delta):
	# Input direction
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
		
	# Normalize the speed when moving diagonal direction
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$CharacterPivot.look_at(translation + direction, Vector3.UP)
		
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
		velocity = move_and_slide(velocity, Vector3.UP)
