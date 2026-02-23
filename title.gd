extends Node2D

#@onready 

func _ready() -> void:
	var startButton = $StartButton
	startButton.connect("pressed", Callable(self, "gameStart"))
	
func gameStart() -> void:
	print("aaaaa")
	get_tree().change_scene_to_file("res://conversation.tscn")
