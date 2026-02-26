extends Node

var post = [
	{
		"name": "新人",
		"dialogs" : [
			["先輩", "JRTT体験へようこそ！"],
			#["先輩", "まずは，鉄道ができるまでの様子を見てもらうよ"],
			#["自分", "さっそく現場仕事をするんですか？"],
			#["先輩", "いや，最初は地元説明会をやるよ"],
			#["先輩", "工事をするためには近隣の住民に迷惑をかけるから，ご協力いただくために説明をする必要があるんだ。"],
			#["自分", "そうなんですね！がんばります！"],
			["先輩", "じゃあ，とりあえず資料を配ってくれ。"],
		],
		"backGround": "res://assets/backgrounds/game1.png",
		"ans": [
			Vector2(864.0, 384.0)
		],
		"textures": [
				"res://assets/game/envelop_paper.png"
		]
	},
	{
		"name":"職員",
		"dialogs" : [
			["先輩", "usu"],
			["自分", "dmo"]
		],
		"ans": [
			Vector2(1024.0, 384.0)

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
