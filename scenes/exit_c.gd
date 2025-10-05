extends Area2D

var can_leave = false
@onready var button: Button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_leave and Input.is_action_just_pressed("select"):
		get_tree().change_scene_to_file("res://scenes/main.tscn")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "duckie":
		button.visible = true
		can_leave = true

func _on_body_exited(body: Node2D) -> void:
	if body.name == "duckie":
		button.visible = false
		can_leave = false
