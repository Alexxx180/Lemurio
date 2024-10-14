extends CharacterBody2D

const jump: float = 0.5

@export var score: int = 100

@onready var touch: Node = $touch

func _ready() -> void:
	touch.feedback.connect(_start)

func _release() -> void:
	touch.feedback.disconnect(_start)

func _start(hero: CharacterBody2D) -> void:
	_release()
	hero.stats.score.value += score
	hero.jump(jump)
	call_deferred("queue_free")
