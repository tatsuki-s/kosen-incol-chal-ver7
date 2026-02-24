extends Node

var post = [
	["新人"],
	["職員"],
	#["副課長"],
	#["課長"],
	#["所長"],
	#["副理事長"],
	["理事長"]
	]
var nowLv = 0

func toTitle():
	Global.nowLv = 0
	get_tree().change_scene_to_file.call_deferred("res://title.tscn")

func toGame():
	get_tree().change_scene_to_file.call_deferred("res://drag_game.tscn")
