extends Node2D

@onready var startButton = $Title/StartButton

@export var screen: int = 0 

var speaking = false 

func _ready() -> void:
	startButton.disabled = false
	startButton.connect("pressed", Callable(self, "gameStart"))
	
func gameStart() -> void:
	startButton.disabled = true
	get_tree().change_scene_to_file("res://conversation.tscn")
	
