extends Node

#const level: String = "res://assets/levels/1/1/level.tscn"

func _reload() -> void:
	get_tree().call_deferred("reload_current_scene")

func _restart(hero: CharacterBody2D) -> void:
	var lives: int = hero.stats.lives.value
	if lives > 0:
		hero.stats.lives.value = lives - 1
		hero.rollback()
	else:
		_reload()
