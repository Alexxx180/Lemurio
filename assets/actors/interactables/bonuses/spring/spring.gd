extends StaticBody2D

const multiplier: float = 1.5

@onready var touch: Node = $touch
@onready var animation: AnimationPlayer = $animation

func _ready() -> void:
	touch.feedback.connect(_start)

func _start(hero: CharacterBody2D) -> void:
	hero.jump(multiplier)
