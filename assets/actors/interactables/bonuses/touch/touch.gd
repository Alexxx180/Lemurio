extends Node

signal feedback()

func action(hero: CharacterBody2D) -> void:
	feedback.emit(hero)
