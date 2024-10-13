extends Area2D

func _break(block: StaticBody2D) -> void:
	print("TOUCHED")
	block.touch.action()
