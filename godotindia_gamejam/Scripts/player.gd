extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump: AudioStreamPlayer2D = $jump


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.play()

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("Move_left", "Move_right")
	
	#Flip the sprite
	if direction>0:
		animated_sprite_2d.flip_h = false
	elif direction<0:
		animated_sprite_2d.flip_h = true
		
	#Play animations
	if GlobalVals.player_hit:
		animated_sprite_2d.play("hit")
	else:
		if is_on_floor():
			if direction == 0:
				animated_sprite_2d.play("Idle")
			else:
				animated_sprite_2d.play("Run")
		else:
			if velocity.y < 0:
				animated_sprite_2d.play("Jump")
			else:
				animated_sprite_2d.play("Fall")
	
		#Apply movement
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
	
