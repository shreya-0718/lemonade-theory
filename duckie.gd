extends CharacterBody2D

@onready var sunshine: AnimatedSprite2D = $sunshine
@onready var lollipop: AnimatedSprite2D = $lollipop

@onready var duckie: AnimatedSprite2D = lollipop

@onready var water: Area2D = $"../water"

const SPEED = 300.0
var in_water := false

func _ready():
	change_skin("sunshine")
	
	sunshine = $sunshine
	lollipop = $lollipop
	
	water.connect("body_entered", _on_water_entered)
	water.connect("body_exited", _on_water_exited)


func change_skin(new_skin: String):
	data.skin = new_skin
	
	sunshine.visible = false
	lollipop.visible = false
	
	if new_skin == "lollipop":
		duckie = lollipop
	else:
		duckie = sunshine
	
	duckie.visible = true

func _physics_process(delta: float) -> void:
	var horiz := Input.get_axis("left", "right")
	var vert := Input.get_axis("up", "down")

	velocity.x = horiz * SPEED if horiz else move_toward(velocity.x, 0, SPEED)
	velocity.y = vert * SPEED if vert else move_toward(velocity.y, 0, SPEED)

	if horiz or vert:
		duckie.play("swim_move" if in_water else "walk")
		if horiz:
			duckie.flip_h = horiz < 0
	else:
		duckie.play("swim_idle" if in_water else "idle")
		
	move_and_slide()	

func _on_water_entered(body):
	if body == self:
		in_water = true

func _on_water_exited(body):
	if body == self:
		in_water = false
