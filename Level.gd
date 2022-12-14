extends Node2D


onready var sv : Viewport = get_node("ShadowViewport")

func _ready():
	for s in get_tree().get_nodes_in_group("shadow"):
		var loc = s.global_position
		s.get_parent().remove_child(s)
		sv.add_child(s)
		s.global_position = loc
