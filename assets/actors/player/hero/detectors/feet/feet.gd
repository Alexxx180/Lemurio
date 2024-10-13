extends Area2D

var hero: CharacterBody2D

func _touch(block: PhysicsBody2D) -> void:
	block.touch.action(hero)
