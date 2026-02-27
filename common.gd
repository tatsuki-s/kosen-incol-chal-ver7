extends CanvasLayer

@onready var lv = Common.get_node("Level")

func _ready() -> void:
	updateLv()
	
func updateLv():
	lv.text = Global.post[Global.nowLv]["name"]
