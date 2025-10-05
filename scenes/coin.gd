extends Button

var score = 0

func _ready():
	# Connect the button's pressed signal to the _on_button_pressed function
	pass


func _on_pressed() -> void:
	data.coins += 1
