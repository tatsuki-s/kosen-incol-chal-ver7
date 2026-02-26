extends Node

var post = [
	{
		# 地元説明会
		"name": "新人",
		"dialogs" : [
			["先輩", "JRTT体験へようこそ！"],
			#["先輩", "まずは，鉄道ができるまでの様子を見てもらうよ"],
			#["自分", "さっそく現場仕事をするんですか？"],
			#["先輩", "いや，最初は地元説明会をやるよ"],
			#["先輩", "測量などをする必要があるから，立ち入りについてのご協力をお願いしないといけないんだ。"],
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
		# 中心線測量
		"name":"職員",
		"dialogs" : [
			["先輩", "usu"],
			["自分", "dmo"]
		],
		"backGround": "res://assets/backgrounds/game1.png",
		"ans": [
			Vector2(1024.0, 384.0)
		],
		"textures": [
			"res://icon.svg"
		]
	},
	{
		# 設計協議・設計
		"name":"副課長"
	},
	{
		# 用地取得
		"name":"課長"
	},
	{
		# 工事
		"name":"所長"
	},
	{
		# 走行試験
		"name":"副理事長"
	},
	{
		# 貸付・譲渡して終了
		"name":"理事長"
	}
]
var nowLv = 0

func toTitle():
	Global.nowLv = 0
	get_tree().change_scene_to_file.call_deferred("res://title.tscn")

func toGame():
	get_tree().change_scene_to_file.call_deferred("res://drag_game.tscn")
