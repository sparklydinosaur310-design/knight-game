extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -270.0
const COYOTE_TIME = 0.1
const JUMP_BUFFER = 0.1

var coyote_timer := 0.0
var buffer_timer := 0.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Timers
	if is_on_floor():
		coyote_timer = COYOTE_TIME
	else:
		coyote_timer -= delta
	buffer_timer -= delta
	if Input.is_action_just_pressed("jump"):
		buffer_timer = JUMP_BUFFER

	# Jump
	if buffer_timer > 0.0 and coyote_timer > 0.0:
		velocity.y = JUMP_VELOCITY
		buffer_timer = 0.0
		coyote_timer = 0.0
	# Shorter jump if jump is let go earlier
	if Input.is_action_just_released("jump") and velocity.y < 0.0:
		velocity.y *= 0.5
	
		# Horizontal movement
		var direction := Input.get_axis("move_left", "move_right")
		if direction > 0:
			animated_sprite.flip_h = false
		elif direction < 0:
			animated_sprite.flip_h = true
			
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			
		# Animations
		if is_on_floor():
			animated_sprite.play("idle" if direction == 0 else "run")
		else:
			animated_sprite.play("jump")
			
		move_and_slide()
