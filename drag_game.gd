extends Node2D

var partsScene = preload("res://parts.tscn")
var space = 96

var ans = [
	Vector2(-192.0, 280.0),
	Vector2(-192.0, 280.0),
	Vector2(-192.0, 280.0),
	Vector2(-192.0, 280.0),
	Vector2(-192.0, 280.0)
	]


func _ready() -> void:
	#spawn(Vector2(0, 0))
	var defaultX = -600
	for i in range(len(ans)):
		spawn(Vector2(defaultX, -300), i)
		defaultX += space

func spawn(pos, name):
	var p = partsScene.instantiate()
	add_child(p)
	p.global_position = pos
	p.name = str(name)
	p.dropped.connect(_partDropped)
	
func _partDropped(partNode):
	print(partNode.name)
	if partNode.global_position.distance_to(ans[int(partNode.name)]) < 10:
		partNode.global_position = ans[int(partNode.name)]
		print("正解")
		# 正解したらドラッグ不可に
		partNode.set_process_input(false)
	else:
		partNode.global_position = partNode.defaultIdx
