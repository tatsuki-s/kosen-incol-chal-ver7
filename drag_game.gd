extends Node2D

var partsScene = preload("res://parts.tscn")

var ans = Vector2(-192.0, 280.0)


func _ready() -> void:
	spawn(Vector2(0, 0))
	
func spawn(pos):
	var p = partsScene.instantiate()
	add_child(p)
	p.global_position = pos
	
	p.dropped.connect(_partDropped)
	
func _partDropped(partNode):
	print(partNode.name)
	if partNode.global_position.distance_to(ans) < 10:
		partNode.global_position = ans
		print("正解")
