extends CharacterBody2D

@onready var sunshine: AnimatedSprite2D = $sunshine
@onready var lollipop: AnimatedSprite2D = $lollipop

@onready var duckie: AnimatedSprite2D = sunshine

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	change_skin("lollipop")
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
	

	var horiz := Input.get_axis("left", "right")
	if horiz:
		velocity.x = horiz * SPEED
		duckie.play("walk")
		duckie.flip_h = horiz < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		duckie.play("idle")

	var vert := Input.get_axis("up", "down")
	if vert:
		velocity.y = vert * SPEED
		duckie.play("walk")
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
