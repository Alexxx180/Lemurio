extends Node

signal on_changed(value: int)

@export var _value: int = 0

var value: int: get = _get_value, set = _set_value

func _get_value() -> int:
	return _value

func _set_value(next: int) -> void:
	_value = next
	update()

func update() -> void:
	on_changed.emit(_value)
