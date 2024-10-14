extends CharacterBody2D

enum { SPEED = 1000, JUMP = 2600, GRAVITY = 7750 } # JUMP = 1300, GRAVITY = 3875 }

const safezone: Vector2 = Vector2(16, 0)

@onready var detectors: Node2D = $detectors
@onready var camera: Camera2D = $camera
@onready var stats: Node = $stats
@onready var animation: Node = $animation
@onready var _memory: Vector2 = position

func _ready() -> void:
	stats.bind(camera.main)
	stats.lives.on_changed.connect(restart)
	stats.time.on_changed.connect(time_up)
	stats.lives.on_changed.connect(Global.lives)
	stats.score.on_changed.connect(Global.score)
	detectors.set_control_entity(self)

func _reload() -> void:
	get_tree().call_deferred("reload_current_scene")

func restart(lives: int) -> void:
	if lives < 0: _reload()

func time_up(time: int) -> void:
	if time <= 0: _reload()

func _time_tick() -> void:
	stats.time.value -= 1

func rollback() -> void:
	position = _memory

func remember(direction: Vector2) -> void:
	_memory = position - safezone * direction

func jump(force: float) -> void:
	velocity.y -= force * JUMP

func _input(_event: InputEvent) -> void:
	velocity.x = Input.get_axis("move_left", "move_right") * SPEED
	if is_on_floor() and velocity.y >= 0:
		jump(Input.get_action_strength("jump"))

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += delta * GRAVITY
	else:
		remember(velocity.normalized())
	move_and_slide()
