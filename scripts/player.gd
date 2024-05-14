extends CharacterBody2D


const SPEED: int = 130.0
const UNDERWATER_SPEED: int = 65.0
const UNDERWATER_VELOCITY: int = 10.0
const JUMP_VELOCITY: int = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var isInWater: bool = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() && !isInWater:
		velocity.y += gravity * delta
	
	if isInWater:
		velocity.y = UNDERWATER_VELOCITY

	# Handle jump
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var upDownDirection := Input.get_axis("jump", "move_down")
	# Handle water jump
	if Input.is_action_pressed("jump") and isInWater:
		velocity.y = upDownDirection * UNDERWATER_SPEED

	# Handle water dive
	if Input.is_action_pressed("move_down") and isInWater:
		velocity.y = upDownDirection * UNDERWATER_SPEED

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_waterzone_entered_water() -> void:
	if !isInWater:
		isInWater = !isInWater


func _on_waterzone_exited_water() -> void:
	if isInWater:
		isInWater = !isInWater
