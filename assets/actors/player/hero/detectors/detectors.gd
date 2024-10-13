extends Node2D

@onready var head: Area2D = $head

func set_control_entity(hero: CharacterBody2D) -> void:
	head.hero = hero
