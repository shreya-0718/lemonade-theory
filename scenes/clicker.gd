extends Node2D
@onready var shop_area: Area2D = $Area2D

@onready var button: Button = $Button

var near_coin = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().current_scene.scene_file_path == "res://scenes/casino.tscn":
		button.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("select"):
		if data.in_clicker:
			data.in_clicker = false
			print("leaving...")
			get_tree().change_scene_to_file("res://scenes/casino.tscn")
			
		elif near_coin:
			data.in_clicker = true
			get_tree().change_scene_to_file("res://scenes/clicker.tscn")
			

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "duckie":
		button.visible = true
		near_coin = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "duckie":
		button.visible = false
		near_coin = false
