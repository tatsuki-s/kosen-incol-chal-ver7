extends Node2D

var partsScene = preload("res://parts.tscn")
var space = 96
var correct = 0

var ans = Global.post[Global.nowLv]["ans"]
var textures = Global.post[Global.nowLv]["textures"]

func _ready() -> void:
	var backGround = $BackGround
	backGround.texture = load(Global.post[Global.nowLv]["backGround"])
	var defaultX = 60
	for i in range(len(ans)):
		spawn(Vector2(defaultX, 60), i)
		defaultX += space

func spawn(pos, name):
	var p = partsScene.instantiate()
	add_child(p)
	p.global_position = pos
	p.name = str(name)
	p.texture = load(textures[name])
	p.dropped.connect(_partDropped)
	
func _partDropped(partNode):
	print(partNode.name)
	if partNode.global_position.distance_to(ans[int(partNode.name)]) < 10:
		partNode.global_position = ans[int(partNode.name)]
		print("正解")
		correct += 1
		if correct >= len(ans):
			Global.nowLv += 1
			Common.updateLv()
			get_tree().call_deferred("change_scene_to_file", "res://conversation.tscn")
			
		# 正解したらドラッグ不可に
		partNode.set_process_input(false)
	else:
		print(partNode.global_position)
		partNode.global_position = partNode.defaultIdx
