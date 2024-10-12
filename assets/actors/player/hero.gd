extends CharacterBody2D

enum { SPEED = 1000, JUMP = 1300, GRAVITY = 3875 }

func _input(_event: InputEvent) -> void:
	velocity.x = Input.get_axis("move_left", "move_right") * SPEED
	if is_on_floor():
		velocity.y -= Input.get_action_strength("jump") * JUMP

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += delta * GRAVITY
	move_and_slide()
