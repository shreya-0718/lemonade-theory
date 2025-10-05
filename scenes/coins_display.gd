extends Node2D

@onready var label: Label = $Label

var label_settings := preload("res://assets/label_settings.tres") 

func _ready() -> void:
	label.set_text("0")

func _process(delta):
	label.set_text(str(data.coins))
	
	label.text = str(data.coins)

	if data.coins < 1000:
		label_settings.font_size = 93
		label.position = Vector2(803, 55)
	elif data.coins < 1000000:
		label.position = Vector2(803, 55)	
		label_settings.font_size = 60
	elif data.coins < 10000000000000:
		label.position = Vector2(803, 81)	
		label_settings.font_size = 50
	elif data.coins < 10000000000000000:
			label.position = Vector2(803, 81)	
			label_settings.font_size = 30
	else:
		label.set_text("too much!")
		label.position = Vector2(803, 55)	
		label_settings.font_size = 40
