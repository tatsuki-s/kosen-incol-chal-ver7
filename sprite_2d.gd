extends Node2D

@onready var startButton = $Title/StartButton
@onready var lv = Common.get_node("Level")

@export var screen: int = 0 

var speaking = false 

func _ready() -> void:
	startButton.disabled = false
	startButton.connect("pressed", Callable(self, "gameStart"))
	lv.text = Global.post[Global.nowLv]

func gameStart() -> void:
	startButton.disabled = true
	# ここで会話
	pass
	get_tree().change_scene_to_file("res://conversation.tscn")
	
