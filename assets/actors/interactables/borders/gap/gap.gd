extends Node

func _restart(_hero: CharacterBody2D):
	#const level: String = "res://assets/levels/1/1/level.tscn"
	_hero.rollback()
	#get_tree().call_deferred("reload_current_scene")
