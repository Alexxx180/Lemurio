extends Node

signal feedback()

func action() -> void:
	feedback.emit()
