extends Node2D

@onready var msg = $Message
@onready var spkr = $Speaker
@onready var spkrImage = $SpeakerImage
@onready var nextButton = $NextButton

var duration:float = 0.05

var dialogs = Global.post[Global.nowLv]["dialogs"]

func _ready() -> void:
	msg.text = ""
	spkr.text = ""
	nextButton.hide()
	startConversation()

# 1文字ずつ表示させる関数
func msg_show(speaker, message) -> void:
	if not is_inside_tree():
		return

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
	nextButton.hide()
	
	var tree = get_tree()
	if tree == null:
		return
	
	#msg_play()
	var tween = get_tree().create_tween()
	# visible_ratioを0から1まで、(文字数 * duration)秒かけて変化させる
	tween.tween_property(msg, "visible_ratio", 1.0, message.length() * duration)
	
	# 文字表示が終わるのを待つ
	await tween.finished
	nextButton.show()
	await nextButton.pressed
	msg.text = ""
	msg.hide()
	spkr.text = ""
	spkr.hide()
	spkrImage.hide()
	nextButton.hide()

func startConversation():
	if Global.nowLv == Global.post.size() -1:
		await msg_show("先輩", Global.post[Global.nowLv]+"就任おめでとう")
		Common.updateLv()
		Global.toTitle() 
		return
	else:
		for i in dialogs:
			await msg_show(i[0], i[1])
		Global.toGame()
		return
