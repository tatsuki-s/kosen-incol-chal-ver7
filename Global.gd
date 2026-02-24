extends Node

var post = [
	{
		"name": "新人",
		"dialogs" : [
			["先輩", "うす"],
			["自分", "ども"]
			],
		"ans": [
			Vector2(512.0, 512.0)
			],
		"textures": [
			"res://icon.svg"
		]
	},
	{
		"name":"職員",
		"dialogs" : [
			["先輩", "usu"],
			["自分", "dmo"]
			],
		"ans": [
			Vector2(512.0, 512.0)
			],
		"textures": [
			"res://icon.svg"
		]
	},
	{
		"name":"副課長"
	},
	{
		"name":"課長"
	},
	{
		"name":"所長"
	},
	{
		"name":"副理事長"
	},
	{
		"name":"理事長"
	}
]
var nowLv = 0

func toTitle():
	Global.nowLv = 0
	get_tree().change_scene_to_file.call_deferred("res://title.tscn")

func toGame():
	get_tree().change_scene_to_file.call_deferred("res://drag_game.tscn")
