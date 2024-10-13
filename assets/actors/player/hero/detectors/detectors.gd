extends Node2D

@onready var head: Area2D = $head
@onready var feet: Area2D = $feet

func set_control_entity(hero: CharacterBody2D) -> void:
	head.hero = hero
	feet.hero = hero
