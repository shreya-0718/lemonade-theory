extends CharacterBody2D

@onready var sunshine: AnimatedSprite2D = $sunshine
@onready var lollipop: AnimatedSprite2D = $lollipop

@onready var duckie: AnimatedSprite2D = lollipop

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_skin(data.skin)
	duckie.play("idle")


func change_skin(new_skin: String):
	sunshine.visible = false
	lollipop.visible = false
	
	if new_skin == "lollipop":
		duckie = lollipop
	else:
		duckie = sunshine
	
	duckie.visible = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
