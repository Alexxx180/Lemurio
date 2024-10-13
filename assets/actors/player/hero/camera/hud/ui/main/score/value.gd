extends Label

const form: String = "%06d"

func update(value: int) -> void:
	text = form % value
