extends Area2D

@onready var animation: AnimationPlayer = $animation

func appear() -> void:
	animation.play("appear/shroom")

func _collect(hero: CharacterBody2D) -> void:
	hero.stats.lives.value += 1
	call_deferred("queue_free")
