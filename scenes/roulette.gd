extends Node2D
@onready var shop_area: Area2D = $Area2D

@onready var button: Button = $Button

var near_table = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().current_scene.scene_file_path == "res://scenes/casino.tscn":
		button.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("select"):
		if data.in_roul:
			data.in_roul = false
			print("leaving...")
			get_tree().change_scene_to_file("res://scenes/casino.tscn")
			
		elif near_table:
			data.in_roul = true
			get_tree().change_scene_to_file("res://scenes/roulette.tscn")
			

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "duckie":
		button.visible = true
		near_table = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "duckie":
		button.visible = false
		near_table = false
