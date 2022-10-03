extends KinematicBody2D

export var move_speed := 5000.0

var shear := 0.5

onready var spr = get_node("Sprite")
onready var sv : Viewport = get_node("/root/Level/ShadowViewport")

func _ready():
	var svt = sv.get_texture()
	svt.viewport_path = sv.get_path()
	spr.material.set_shader_param("shadow_texture", svt)

func _physics_process(delta):
	var input := Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	if input.length() > 1.0:
		input = input.normalized()
	
	move_and_slide(input * move_speed * delta)
