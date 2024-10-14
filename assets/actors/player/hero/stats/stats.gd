extends Node

@onready var lives: Node = $lives
@onready var score: Node = $score
@onready var time: Node = $time

func bind(ui: MarginContainer) -> void:
	lives.on_changed.connect(ui.lives.update)
	score.on_changed.connect(ui.score.update)
	time.on_changed.connect(ui.time.update)
	lives.value = Global.stats.x
	score.value = Global.stats.y
