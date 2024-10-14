extends Label

const form: String = "%03d"

func update(value: int) -> void:
	text = form % value
