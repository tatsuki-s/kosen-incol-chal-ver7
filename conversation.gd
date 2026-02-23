extends Node2D

@onready var msg = $Message
@onready var spkr = $Speaker
@onready var spkrImage = $SpeakerImage
@onready var nextButton = $NextButton

var duration:float = 0.05

var dialogs = [
	["先輩", "やあ"],
	["自分", "どうも"]
]

func _ready() -> void:
	msg.text = ""
	spkr.text = ""
	nextButton.hide()
	startConversation()
	
# 1文字ずつ表示する処理
func msg_play():
	msg.visible_ratio += 1.0 / msg.text.length() 
	await get_tree().create_timer(duration).timeout
	if msg.visible_ratio < 1: 
		msg_play()
	else:
		nextButton.show()
# 1文字ずつ表示させる関数
func msg_show(speaker, message) -> void:
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

func startConversation():
	for i in dialogs:
		await msg_show(i[0], i[1])
	get_tree().change_scene_to_file("res://drag_game.tscn")
