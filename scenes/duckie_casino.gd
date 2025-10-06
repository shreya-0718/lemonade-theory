extends CharacterBody2D

@onready var sunshine: AnimatedSprite2D = $sunshine
@onready var lollipop: AnimatedSprite2D = $lollipop

@onready var duckie: AnimatedSprite2D = lollipop

const SPEED = 300.0

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

func _physics_process(delta: float) -> void:
	change_skin(data.skin)

	var horiz := Input.get_axis("left", "right")
	var vert := Input.get_axis("up", "down")

	velocity.x = horiz * SPEED if horiz else move_toward(velocity.x, 0, SPEED)
	velocity.y = vert * SPEED if vert else move_toward(velocity.y, 0, SPEED)

	if horiz or vert:
		duckie.play("walk")
		if horiz:
			duckie.flip_h = horiz < 0
	else:
		duckie.play("idle")
		
	move_and_slide()	
