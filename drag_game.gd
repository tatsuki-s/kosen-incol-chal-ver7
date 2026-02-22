extends Node2D

@onready var parts = $Parts
@onready var posi = $position
@onready var area2D = $Parts/Area2D

var dragIdx = [0, 0]
var isDraging = false
var target = [0, 0]
var dragSpace = 64
var area = Rect2(64, 64, 1152, 576)

func _ready() -> void:
	var screen = get_parent().screen
	area2D.input_event.connect(_onArea2dInput)
	print(parts.position)

func _onArea2dInput(_viewport, event, _shape_idx):
	if event is InputEventMouseButton or event is InputEventScreenTouch:
		if event.pressed:
			isDraging = true
	

func _input(event):
	if isDraging and ( event is InputEventMouseButton or event is InputEventScreenTouch):
		if not event.pressed:
			isDraging = false
	
	if isDraging and event is InputEventScreenDrag:
		var localPos = get_viewport().get_mouse_position()
		var posX = snapped(localPos.x, dragSpace)
		var posY = snapped(localPos.y, dragSpace)
		
		posX = clamp(posX, area.position.x, area.end.x)
		posY = clamp(posY, area.position.y, area.end.y)
		
		var camPos = get_viewport().get_canvas_transform().affine_inverse() * Vector2(posX, posY)
		
		parts.global_position = camPos
		print(camPos)
		
