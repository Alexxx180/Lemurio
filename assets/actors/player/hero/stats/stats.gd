extends Node

@onready var lives: Node = $lives
@onready var score: Node = $score

func bind(ui: MarginContainer) -> void:
	lives.on_changed.connect(ui.lives.update)
	score.on_changed.connect(ui.score.update)
	lives.update()
