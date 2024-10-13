extends Area2D

var hero: CharacterBody2D

func _break(block: StaticBody2D) -> void:
	block.touch.action(hero)
