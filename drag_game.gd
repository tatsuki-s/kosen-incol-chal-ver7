extends Node2D

@onready var parts = $Parts
@onready var posi = $position


var dragIdx = [0, 0]
var isDraging = false
var target = [0, 0]
var dragSpace = 64
var area = Rect2(64, 64, 1152, 576)

func _ready() -> void:
	var screen = get_parent().screen
	print(parts.position)

func _input(event):
	if event is InputEventScreenDrag:
		var localPos = get_viewport().get_mouse_position()
		var posX = snapped(localPos.x, dragSpace)
		var posY = snapped(localPos.y, dragSpace)
		
		posX = clamp(posX, area.position.x, area.end.x)
		posY = clamp(posY, area.position.y, area.end.y)
		
		var camPos = get_viewport().get_canvas_transform().affine_inverse() * Vector2(posX, posY)
		
		parts.global_position = camPos
		print(camPos)
		
