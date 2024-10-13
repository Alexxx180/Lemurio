extends StaticBody2D

@export var entity: Area2D = null

const score: int = 100

@onready var touch: Node = $touch
@onready var animation: AnimationPlayer = $animation

func _ready() -> void:
	touch.feedback.connect(_start)

func _release() -> void:
	touch.feedback.disconnect(_start)

func _start(hero: CharacterBody2D) -> void:
	_release()
	if entity == null:
		hero.stats.score.value += score
	animation.play("blocks/bonus")

func _bonus() -> void:
	pass
