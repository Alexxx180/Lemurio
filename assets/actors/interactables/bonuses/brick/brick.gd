extends StaticBody2D

@onready var touch: Node = $touch
@onready var animation: AnimationPlayer = $animation

func _ready() -> void:
	touch.feedback.connect(_start)

func _release() -> void:
	touch.feedback.disconnect(_start)

func _start() -> void:
	_release()
	animation.play("blocks/bonus")

func _bonus() -> void:
	call_deferred("queue_free")
