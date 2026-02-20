extends Node2D

@onready var startButton = $StartButton
@onready var cam = $Camera2D
@onready var lv = $Camera2D/Level
@onready var msg = $Camera2D/Message

var post = {0: "新人",1: "職員",2: "副課長",3: "課長",
				4: "所長",5:"副理事長",6: "理事長"}
var nowLv = 0
var screen = 0
var duration:float = 0.05

func _ready() -> void:
	startButton.connect("pressed", Callable(self, "gameStart"))
	lv.text = post[nowLv]
	msg.text = ""

# 1文字ずつ表示する処理
func msg_play():
	msg.visible_ratio += 1.0 / msg.text.length() 
	await get_tree().create_timer(duration).timeout
	if msg.visible_ratio < 1: 
		msg_play()
# 1文字ずつ表示させる関数
func msg_show(message) -> void:
	msg.text = message
	msg.visible_ratio = 0
	msg_play()
	
func gameStart() -> void:
	cam.position = Vector2(1280,0)
	msg_show("ゲームが始まったよ")
