extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"1Normal".visible = true
	$"2Jug".visible = false
	$"3Mint".visible = false
	$"4Strawberry".visible = false
	$"5Orange".visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
