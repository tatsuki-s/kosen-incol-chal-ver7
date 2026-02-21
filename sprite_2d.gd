extends Node2D

@onready var startButton = $StartButton
@onready var cam = $Camera2D
@onready var lv = $Camera2D/Level
@onready var msg = $Camera2D/Message
@onready var spkr = $Camera2D/Speaker
@onready var spkrImage = $Camera2D/SpeakerImage
@onready var nextButton = $Camera2D/NextButton

var post = {0: "新人",1: "職員",2: "副課長",3: "課長",
				4: "所長",5:"副理事長",6: "理事長"}
var nowLv = 0
var screen = 0
var duration:float = 0.05
var speaking = false 

func _ready() -> void:
	startButton.connect("pressed", Callable(self, "gameStart"))
	lv.text = post[nowLv]
	msg.text = ""
	spkr.text = ""
	nextButton.hide()

# 1文字ずつ表示する処理
func msg_play():
	msg.visible_ratio += 1.0 / msg.text.length() 
	await get_tree().create_timer(duration).timeout
	if msg.visible_ratio < 1: 
		msg_play()
	else:
		nextButton.show()
# 1文字ずつ表示させる関数
func msg_show(message, speaker) -> void:
	if speaker == "先輩":
		spkrImage.texture = load("res://assets/theman.png")
	elif speaker == "自分":
		spkrImage.texture = load("res://assets/hideyo.png")
	msg.text = message
	spkr.text = speaker
	msg.visible_ratio = 0
	await msg_play()
	#nextButton.show()
	await nextButton.pressed
	nextButton.hide()
	
func gameStart() -> void:
	cam.position = Vector2(0,-720)
	await msg_show("ゲームが始まったよ", "先輩")
	await msg_show("そうみたいだね", "自分")
