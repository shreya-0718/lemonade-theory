extends Node2D
@onready var shop_area: Area2D = $Area2D

@onready var button: Button = $Button
@onready var buy: Node2D = $"buy?"

@onready var inven_lem: Sprite2D = $"Inventory/1Normal"
@onready var lem_label: Label = $"Inventory/1Normal/Label"

var near_stand = false
var transaction = false
var bought = false


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
		
		elif data.in_shop and transaction:
			transaction = false
			
	if Input.is_action_just_pressed("select"):
		if !data.in_shop and near_stand:
			data.in_shop = true
			get_tree().change_scene_to_file("res://scenes/lemon_shop.tscn")
		
		elif data.in_shop and !transaction:
			transaction = true
			await get_tree().create_timer(0.5).timeout
			
		
		elif data.in_shop and transaction:
			bought = true
			transaction = false
		
	if buy != null:
		buy.visible = transaction
		$"not enough".visible = false
		
	if bought:
		if data.coins >= int($"buy?/Label".text):
			data.coins -= int($"buy?/Label".text)
			data.lemonades += 1
		else:
			$"not enough".visible = true
			await get_tree().create_timer(1.0).timeout # Waits for 2 seconds
			$"not enough".visible = false
		transaction = false
		bought = false
	
	if inven_lem != null :
		if data.lemonades > 0:
			inven_lem.visible = true
			lem_label.visible = true
			lem_label.set_text(str(data.lemonades))
		else:
			inven_lem.visible = false
			lem_label.visible = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "duckie":
		button.visible = true
		near_stand = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "duckie":
		button.visible = false
		near_stand = false
