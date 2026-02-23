extends Node2D

func _ready() -> void:
	var startButton = $StartButton
	Common.updateLv()
	startButton.connect("pressed", Callable(self, "gameStart"))
	
func gameStart() -> void:
	get_tree().change_scene_to_file("res://conversation.tscn")
