extends Area2D

var hero: CharacterBody2D

@onready var mercy: Timer = $mercy

@export var _invincible: bool = false

func _hit(_enemy: CharacterBody2D) -> void:
	if _invincible: return
	_invincible = true
	hero.stats.lives.value -= 1
	hero.animation.play("blink")
	mercy.start()

func _stop_mercy() -> void:
	mercy.stop()
	hero.animation.stop()
	_invincible = false
