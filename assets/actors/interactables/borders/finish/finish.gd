extends Node

class_name Finisher

const score: int = 50
const assets: String = "res://assets/levels/%d/%d/level.tscn"

static func entry() -> String: return assets % [1, 1]

func _level(no: int) -> Vector2i: return Vector2i(no / 10 % 10, no % 10)

func _finish(hero: CharacterBody2D) -> void:
	var current: String = get_tree().current_scene.scene_file_path
	var level: Vector2i = _level(current.to_int() + 1)
	var path: String = assets % [level.x, level.y]
	
	hero.stats.score.value = hero.stats.time.value * score
	if ResourceLoader.exists(path):
		get_tree().call_deferred("change_scene_to_file", path)
	else:
		hero.stats.lives.value = -1
