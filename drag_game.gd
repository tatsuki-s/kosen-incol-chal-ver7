extends Node2D

@onready var parts = $Parts
@onready var posi = $position


var dragIdx = [0, 0]
var isDraging = false
var target = [0, 0]

func _ready() -> void:
	var screen = get_parent().screen
	print(parts.position)

func _input(event):
	if event is InputEventScreenDrag:
		var localPos = get_local_mouse_position()
		
		posi = event.position
		print(int(posi[0])," ", int(posi[1]))
		parts.position.x = int(localPos.x)
		parts.position.y = int(localPos.y)
		
