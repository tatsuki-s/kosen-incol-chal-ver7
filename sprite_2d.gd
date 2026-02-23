extends Node2D

@onready var startButton = $Title/StartButton
@onready var lv = Common.get_node("Level")
@onready var msg = Common.get_node("Message")
@onready var spkr = Common.get_node("Speaker")
@onready var spkrImage = Common.get_node("SpeakerImage")
@onready var nextButton = Common.get_node("NextButton")

@export var screen: int = 0 

#var screen = 0
var duration:float = 0.05
var speaking = false 

func _ready() -> void:
	startButton.disabled = false
	startButton.connect("pressed", Callable(self, "gameStart"))
	lv.text = Global.post[Global.nowLv]
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
	spkrImage.show()
	msg.show()
	spkr.show()
	if speaker == "先輩":
		spkrImage.texture = load("res://assets/theman.png")
	elif speaker == "自分":
		spkrImage.texture = load("res://assets/hideyo.png")
	msg.text = message
	spkr.text = speaker
	msg.visible_ratio = 0
	msg_play()
	await nextButton.pressed
	msg.text = ""
	msg.hide()
	spkr.text = ""
	spkr.hide()
	spkrImage.hide()
	nextButton.hide()
	
func gameStart() -> void:
	startButton.disabled = true
	await msg_show("ゲームが始まったよ", "先輩")
	await msg_show("そうみたいだね", "自分")
	get_tree().change_scene_to_file("res://drag_game.tscn")
	
