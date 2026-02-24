extends CanvasLayer

@onready var lv = Common.get_node("Level")

func _ready() -> void:
	updateLv()
	
func updateLv():
	if Global.nowLv <= Global.post.size() -2:
		lv.text = Global.post[Global.nowLv]["name"]
	else:
		get_tree().change_scene_to_file("res://conversation.tscn")
