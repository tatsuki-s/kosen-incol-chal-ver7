extends Sprite2D

# グリッドのサイズ（JRTTの設計図の細かさに合わせる）
var grid_size = 64
var dragging = false

func _process(_delta):
	if dragging:
		# マウス位置を取得
		var mouse_pos = get_global_mouse_position()
		
		# 【重要】グリッド吸着の計算
		# マウス位置をgrid_sizeで割って四捨五入し、再びgrid_sizeを掛ける
		var snapped_pos = (mouse_pos / grid_size).round() * grid_size
		
		# 滑らかに動かしたい場合は mouse_pos、カチカチ動かしたい場合は snapped_pos
		global_position = snapped_pos

# マウスイベントの処理
func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			dragging = event.pressed
			
			# ドロップした瞬間に「正解判定」を行うならここ
			if not dragging:
				check_alignment()

func check_alignment():
	# 例：特定の座標（128, 128）が正解の場合
	var target_pos = Vector2(128, 128)
	if global_position.distance_to(target_pos) < 10:
		print("正確な位置に配置されました！施工完了！")
		modulate = Color.GREEN # 成功したら色を変える
	else:
		print("位置がズレています。再設置してください。")
		modulate = Color.WHITE
