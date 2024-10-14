extends Node

func _restart(hero: CharacterBody2D) -> void:
	var lives: Node = hero.stats.lives
	lives.value -= 1
	hero.rollback()
