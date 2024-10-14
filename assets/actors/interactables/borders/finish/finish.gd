extends Node

const assets: String = "res://assets/levels/%d/%d/level.tscn"

func _level(no: int) -> Vector2i:
	return Vector2i(no / 10 % 10, no % 10)

func _finish(hero: CharacterBody2D) -> void:
	var current: String = get_tree().current_scene.scene_file_path
	var level: Vector2i = _level(current.to_int() + 1)
	var path: String = assets % [level.x, level.y]
	
	if ResourceLoader.exists(path):
		get_tree().call_deferred("change_scene_to_file", path)
		#print("IT IS WORKING: ", hero.name)
