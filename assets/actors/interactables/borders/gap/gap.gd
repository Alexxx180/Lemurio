extends Node

func _restart(hero: CharacterBody2D) -> void:
	var lives: Node = hero.stats.lives
	if lives.value > 0:
		lives.value -= 1
		hero.rollback()
