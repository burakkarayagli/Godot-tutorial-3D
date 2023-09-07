extends KinematicBody


# How fast the player moves in meters per second.
export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
export var fall_acceleration = 75

var velocity = Vector3.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	# We create a local variable to store the input direction.
	var direction = Vector3.ZERO
	
	# We set the direction based on the input keys.
	if Input.is_action_pressed("move_left"):
		direction.x += -1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_forward"):
		direction.z += -1
	if Input.is_action_pressed("move_back"):	
		direction.z += 1

	# We normalize the vector so that diagonal movement isn't faster.
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$Pivot.look_at($Pivot.translation + direction, Vector3.UP)

	#Ground velocity
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	#Vertical velocity
	velocity.y -= fall_acceleration * delta
	
	#Moving the character
	velocity = move_and_slide(velocity, Vector3.UP)

		#deneme	