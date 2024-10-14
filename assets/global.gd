extends Node

const defaults: Vector2i = Vector2i(3, 0)

var stats: Vector2i = defaults

func reset() -> void: stats = defaults

func score(value: int):
	stats.y = value

func lives(value: int) -> void:
	if value < 0:
		reset()
	else:
		stats.x = value
