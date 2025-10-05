extends Node2D
@onready var shop_area: Area2D = $Area2D

@onready var button: Button = $Button
@onready var buy: Node2D = $"buy?"

var near_stand = false
var transaction = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().current_scene.scene_file_path == "res://scenes/main.tscn":
		button.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:	
	if Input.is_action_just_pressed("left"):
		if data.in_shop and !transaction:
			data.in_shop = false
			get_tree().change_scene_to_file("res://scenes/main.tscn")
			
		if data.in_shop and transaction:
			transaction = false
			
	if Input.is_action_just_pressed("select"):
		if !data.in_shop and near_stand:
			data.in_shop = true
			get_tree().change_scene_to_file("res://scenes/lemon_shop.tscn")
		
		elif data.in_shop and !transaction:
			transaction = true
		
		elif data.in_shop and transaction:
			transaction = false
		
	if buy != null:
		buy.visible = transaction

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "duckie":
		button.visible = true
		near_stand = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "duckie":
		button.visible = false
		near_stand = false
