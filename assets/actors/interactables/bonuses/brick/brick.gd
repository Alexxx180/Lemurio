extends StaticBody2D

@export var score: int = 50

@onready var touch: Node = $touch
@onready var animation: AnimationPlayer = $animation

func _ready() -> void:
	touch.feedback.connect(_start)

func _release() -> void:
	touch.feedback.disconnect(_start)

func _start(hero: CharacterBody2D) -> void:
	_release()
	hero.stats.score.value += score
	animation.play("blocks/bonus")

func _bonus() -> void:
	call_deferred("queue_free")
