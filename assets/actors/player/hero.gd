extends CharacterBody2D

enum { SPEED = 1000, JUMP = 2600, GRAVITY = 7750 } # JUMP = 1300, GRAVITY = 3875 }

const highscore: int = 1000
const safezone: Vector2 = Vector2(32, 0)

@onready var detectors: Node2D = $detectors
@onready var camera: Camera2D = $camera
@onready var stats: Node = $stats
@onready var animation: Node = $animation
@onready var _memory: Vector2 = position

func _high(value: int) -> int:
	return value / highscore % 10

func _ready() -> void:
	stats.bind(camera.main)
	stats.score.on_changed.connect(_life)
	stats.lives.on_changed.connect(restart)
	stats.time.on_changed.connect(time_up)
	stats.lives.on_changed.connect(Global.lives)
	stats.score.on_changed.connect(Global.score)
	detectors.set_control_entity(self)

var _score: int = 0

func _life(value: int) -> void:
	if _high(_score) != _high(value):
		stats.lives.value += 1
	_score = value

func _reload(tree: SceneTree) -> void:
	tree.call_deferred("reload_current_scene")

func _reset() -> void:
	var tree: SceneTree = get_tree()
	var first: String = Finisher.entry()
	if tree.current_scene.scene_file_path == first:
		_reload(tree)
	else:
		tree.call_deferred("change_scene_to_file", first)

func restart(lives: int) -> void: if lives < 0: _reset()
func time_up(time: int) -> void: if time <= 0: _reload(get_tree())

func _time_tick() -> void: stats.time.value -= 1
func rollback() -> void: position = _memory

func remember(direction: Vector2) -> void:
	_memory = position - safezone * direction

func jump(force: float) -> void: velocity.y -= force * JUMP

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
