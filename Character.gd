extends KinematicBody2D

export var move_speed := 5000.0

var shear := 0.5

onready var poly = get_node("Polygon2D")

func _physics_process(delta):
	var input := Vector2(Input.get_axis("move_left", "move_right"), Input.get_axis("move_up", "move_down"))
	if input.length() > 1.0:
		input = input.normalized()
	
	move_and_slide(input * move_speed * delta)

#func _process(delta):
#	var t = poly.transform
#	t.y = Vector2(shear, 1.0)
#	poly.transform = t
