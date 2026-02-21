extends Node2D

@onready var parts = $Parts
@onready var posi = $position


var dragIdx = [0, 0]
var isDraging = false
var target = [0, 0]
var dragSpace = 32
var area = Rect2(32, 32, 1216, 656)

func _ready() -> void:
	var screen = get_parent().screen
	print(parts.position)

func _input(event):
	if event is InputEventScreenDrag:
		var localPos = get_local_mouse_position()
		
		var pos = event.position
		print(int(pos[0])," ", int(pos[1]))
		if area.has_point(Vector2(pos[0], pos[1])):
			parts.position.x = int(localPos.x/dragSpace)*dragSpace
			parts.position.y = int(localPos.y/dragSpace)*dragSpace
		
