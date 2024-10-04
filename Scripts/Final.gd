extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const CAMERA_POS_X = 960
const CAMERA_POS_Y = 540
const CAMERA_MAX_X = 1148
const CAMERA_MIN_X = 780
const CAMERA_MAX_Y = 595
const CAMERA_MIN_Y = 480
const BACKGROUND_POS_X = 950
const BACKGROUND_POS_Y = 560
const BACKGROUND_MAX_POS_X = 1100
const BACKGROUND_MIN_POS_X = 800
const BACKGROUND_MAX_POS_Y = 590
const BACKGROUND_MIN_POS_Y = 510
const SECURE_WINDOW_INITIAL_POS_Y = Vector2(982, -400)
const SECURE_WINDOW_FINAL_POS_Y = Vector2(982, 400)
const TWEEN_FAST_TIME = 0.5
const TWEEN_TIME = 1.0
const LOADING_DIR = "res://Scenes/Loading_screen.tscn"
const ADJUST_SFX_TWEEN_TIME = 0.25
const UNDISABLE_SFX_TWEEN_TIME = 0.9
const VISIBLE_RATIO = 1.0
const TIME_BETWEEN_TEXT = 2
const CHAR_READ_RATE = 0.03
const TROPHIE_FINAL_SCALE = Vector2(0.3, 0.3)
const TROPHIE_INITINAL_SCALE = Vector2(0.01, 0.01)
const CHAR_DOPPEL = preload("res://Scenes/Doppelganger.tscn")
const LEFT_HAND_INITIAL_POS = Vector2(-3580, 1680)
const LEFT_HAND_FINAL_POS = Vector2(-1138, 282)
const RIGHT_HAND_INITIAL_POS = Vector2(3580, 1680)
const RIGHT_HAND_FINAL_POS = Vector2(1204, 394)
const SCALE_HANDS = Vector2(2.5, 2.5)
const BUTTONS_OUTLINE_COLOR_BLACK = Color(0, 0, 0, 1)
const BUTTONS_OUTLINE_COLOR_SELECT = Color(1, 0, 0, 1)
const BUTTONS_OUTLINE_COLOR_GREY = Color(0.5, 0.5, 0.5, 1)
const MENU_SCENE = 2
const RECORD_SCENE = 6
const CHAR_DDD = preload("res://Scenes/DDD_Agent_Final.tscn")
const AFTON = preload("res://Scenes/Afton_Final.tscn")
const TITLE_CHECK_SPANISH = "Cheque de pago"
const TITLE_CHECK_ENGLISH = "Payout check"
const TITLE_CHECK_CHINESE = "支付支票"
const MAIN_CHECK_SPANISH = "El D.D.D. le agradece por su servicio como portero de su edificio durante la semana pasada.\n\nPor el cual se le paga un total de\nEsperamos que"



const MAIN_CHECK_ENGLISH = "The D.D.D. thanks you for your service as the building's doorman over the past week.\n\nFor which you are paid a total of\nWe hope you\nnext week."




const MAIN_CHECK_CHINESE = "D.D.D. 感谢您在过去一周担任大楼门卫的服务。\n\n您获得的是最低工资。\n我们希望下周见到您。"



const TITLE_SUMMARY_SPANISH = "Resumen"
const TITLE_SUMMARY_ENGLISH = "Campaign Summary"
const TITLE_SUMMARY_CHINESE = "活动总结"
const DOPPEL_LABEL_SPANISH = "Doppels capturados: "
const DOPPEL_LABEL_ENGLISH = "Doppels captured: "
const DOPPELS_LABEL_CHINESE = "捕获的假人:"
const DOPPEL_LABEL_2_SPANISH = "Doppels que ingresaron: "
const DOPPEL_LABEL_2_ENGLISH = "Doppels you allow in: "
const DOPPELS_LABEL_2_CHINESE = "你允许的假人:"
const NEIGHBORS_LABEL_SPANISH = "Vecinos eliminados: "
const NEIGHBORS_LABEL_ENGLISH = "Neighbors killed: "
const NEIGHBORS_LABEL_CHINESE = "邻居被杀:"
const RECORD_BUTTON_SPANISH = "Registro"
const RECORD_BUTTON_ENGLISH = "Record"
const RECORD_BUTTON_CHINESE = "记录"
const MENU_SPANISH = "Menú"
const MENU_ENGLISH = "Menu"
const MENU_BUTTON_CHINESE = "主菜单"
const QUIT_SPANISH = "Salir"
const QUIT_ENGLISH = "Quit"
const QUIT_BUTTON_CHINESE = "退出游戏"
const TITLE_FRAME_SPANISH = "Empleado honorable"
const TITLE_FRAME_ENGLISH = "honorable Employee"
const TITLE_FRAME_CHINESE = "荣誉员工"
const MAIN_FRAME_SPANISH = "Este documento certifica que usted es el mejor portero que su edificio ha tenido.\nFelicidades."

const MAIN_FRAME_ENGLISH = "This document certifies that you are the best doorman your building has ever had.\nCongratulations."

const MAIN_FRAME_CHINESE = "本文件证明您是该大楼有史以来最好的门卫。\n恭喜您。"


@onready var camera: Camera2D = $Camera
@onready var text_label = $Camera / Text / Label
@onready var text_panel: Control = $Camera / Text
@onready var game_over: Node2D = $Camera / Game_Over
@onready var left_hand: Sprite2D = $Camera / Game_Over / Left_Hand
@onready var right_hand: Sprite2D = $Camera / Game_Over / Right_Hand
@onready var black: Sprite2D = $Camera / Game_Over / Black
@onready var trophie: Node2D = $Camera / Trophie
@onready var office: Node2D = $Office
@onready var window: Sprite2D = $Office / Window
@onready var folder_a_sprite: Sprite2D = $Office / Folder_A_Sprite
@onready var folder_a_sprite_spanish: Sprite2D = $Office / Folder_A_Sprite_Spanish
@onready var folder_b_sprite: Sprite2D = $Office / Folder_B_Sprite
@onready var folder_b_sprite_spanish: Sprite2D = $Office / Folder_B_Sprite_Spanish
@onready var folder_c_sprite: Sprite2D = $Office / Folder_C_Sprite
@onready var folder_c_sprite_spanish: Sprite2D = $Office / Folder_C_Sprite_Spanish
@onready var window_sfx: AudioStreamPlayer = $Window_SFX
@onready var background_sfx: AudioStreamPlayer = $Background_SFX
@onready var voice_05: AudioStreamPlayer = $Voice_05
@onready var bite: AudioStreamPlayer = $Bite
@onready var back: Sprite2D = $Office / Back
@onready var characters: Node2D = $Characters
@onready var time_between_text: Timer = $Camera / Text / Time_Between_Text
@onready var magic_dust: AudioStreamPlayer = $Magic_Dust
@onready var hands: Sprite2D = $Camera / Game_Over / Hands
@onready var jail_sfx: AudioStreamPlayer = $Jail
@onready var chains_sfx: AudioStreamPlayer = $Chains
@onready var title_check: Label = $Table / Paper_01 / All / Text / Title
@onready var main_check: Label = $Table / Paper_01 / All / Text / Main
@onready var title_summary: Label = $Table / Paper_03 / Text / Title
@onready var doppel_label: Label = $Table / Paper_03 / Text / Doppel_Label
@onready var doppel_label_2: Label = $Table / Paper_03 / Text / Doppel_Label2
@onready var neighbor_label: Label = $Table / Paper_03 / Text / Doppel_Label3
@onready var menu_button: Button = $Table / Paper_03 / Text / Menu
@onready var record_button: Button = $Table / Paper_03 / Text / Record
@onready var quit_button: Button = $Table / Paper_03 / Text / Quit
@onready var frame: Node2D = $Table / Frame
@onready var title_frame: Label = $Table / Frame / Paper / All / Text / Title
@onready var main_frame: Label = $Table / Frame / Paper / All / Text / Main
@onready var trophie_2: Node2D = $Trophie
@onready var music: AudioStreamPlayer = $Music
@onready var table: Node2D = $Table
@onready var accept: AudioStreamPlayer = $Accept
@onready var select: AudioStreamPlayer = $Select
@onready var bag: Node2D = $Bag
@onready var zipper: AudioStreamPlayer = $Zipper
@onready var black_2: Sprite2D = $Bag / Black
@onready var switch: AudioStreamPlayer = $Switch
@onready var x: Sprite2D = $Office / Wall / x
@onready var x_2: Sprite2D = $Office / Wall / x2
@onready var x_3: Sprite2D = $Office / Wall / x3
@onready var x_4: Sprite2D = $Office / Wall / x4
@onready var x_5: Sprite2D = $Office / Wall / x5
@onready var x_6: Sprite2D = $Office / Wall / x6

var mouse_position
var secure_window_pos_y
var text_on_talk = ""
var n_texts = 0
var final_number

func _ready()->void :
	camera.position = Vector2(CAMERA_POS_X, CAMERA_POS_Y)
	back.position = Vector2(BACKGROUND_POS_X, BACKGROUND_POS_Y)
	match Global.current_campaign_day:
		1:
			x.visible = true
		2:
			x.visible = true
			x_2.visible = true
		3:
			x.visible = true
			x_2.visible = true
			x_3.visible = true
		4:
			x.visible = true
			x_2.visible = true
			x_3.visible = true
			x_4.visible = true
		5:
			x.visible = true
			x_2.visible = true
			x_3.visible = true
			x_4.visible = true
			x_5.visible = true
		6:
			x.visible = true
			x_2.visible = true
			x_3.visible = true
			x_4.visible = true
			x_5.visible = true
			x_6.visible = true
	_set_language_settings()
	_set_sound_music_level()
	fixed_camera()
	small_text()
	play_final()

func _process(_delta)->void :
	_camera_movement()

func _camera_movement()->void :
	if !Global.fixed_camera:
		mouse_position = get_viewport().get_mouse_position()
		camera.position.x = clamp(mouse_position.x, CAMERA_MIN_X, CAMERA_MAX_X)
		camera.position.y = clamp(mouse_position.y, CAMERA_MIN_Y, CAMERA_MAX_Y)
		back.position.x = clamp(mouse_position.x, BACKGROUND_MIN_POS_X, BACKGROUND_MAX_POS_X)
		back.position.y = clamp(mouse_position.y, BACKGROUND_MIN_POS_Y, BACKGROUND_MAX_POS_Y)

func fixed_camera()->void :
	if Global.fixed_camera:
		self.scale = Vector2(0.84, 0.9)
		camera.position = Vector2(960, 540)
		if text_panel.position != Vector2(-15, 393):
			text_panel.position = Vector2(-15, 393)
	else :
		self.scale = Vector2(1, 1)
		if text_panel.position != Vector2(-15, 333):
			text_panel.position = Vector2(-15, 333)

func small_text()->void :
	if Global.small_textbox:
		text_panel.scale = Vector2(0.8, 0.8)
	else :
		text_panel.scale = Vector2(1, 1)

func _set_language_settings()->void :
	if Global.language == SPANISH_VALUE:
		folder_a_sprite_spanish.visible = true
		folder_a_sprite.visible = false
		folder_b_sprite_spanish.visible = true
		folder_b_sprite.visible = false
		folder_c_sprite_spanish.visible = true
		folder_c_sprite.visible = false
		title_check.text = TITLE_CHECK_SPANISH
		main_check.text = MAIN_CHECK_SPANISH
		title_summary.text = TITLE_SUMMARY_SPANISH
		doppel_label.text = DOPPEL_LABEL_SPANISH + str(Global.total_doppels_captured)
		doppel_label_2.text = DOPPEL_LABEL_2_SPANISH + str(Global.total_doppels_got_in)
		neighbor_label.text = NEIGHBORS_LABEL_SPANISH + str(20 - len(Global.neighbors_alive_list))
		menu_button.text = MENU_SPANISH
		record_button.text = RECORD_BUTTON_SPANISH
		quit_button.text = QUIT_SPANISH
		title_frame.text = TITLE_FRAME_SPANISH
		main_frame.text = MAIN_FRAME_SPANISH
	elif Global.language == ENGLISH_VALUE:
		folder_a_sprite_spanish.visible = false
		folder_a_sprite.visible = true
		folder_b_sprite_spanish.visible = false
		folder_b_sprite.visible = true
		folder_c_sprite_spanish.visible = false
		folder_c_sprite.visible = true
		title_check.text = TITLE_CHECK_ENGLISH
		main_check.text = MAIN_CHECK_ENGLISH
		title_summary.text = TITLE_SUMMARY_ENGLISH
		doppel_label.text = DOPPEL_LABEL_ENGLISH + str(Global.total_doppels_captured)
		doppel_label_2.text = DOPPEL_LABEL_2_ENGLISH + str(Global.total_doppels_got_in)
		neighbor_label.text = NEIGHBORS_LABEL_ENGLISH + str(20 - len(Global.neighbors_alive_list))
		menu_button.text = MENU_ENGLISH
		record_button.text = RECORD_BUTTON_ENGLISH
		quit_button.text = QUIT_ENGLISH
		title_frame.text = TITLE_FRAME_ENGLISH
		main_frame.text = MAIN_FRAME_ENGLISH
	elif Global.language == CHINESE_VALUE:
		folder_a_sprite_spanish.visible = false
		folder_a_sprite.visible = true
		folder_b_sprite_spanish.visible = false
		folder_b_sprite.visible = true
		folder_c_sprite_spanish.visible = false
		folder_c_sprite.visible = true
		title_check.text = TITLE_CHECK_CHINESE
		main_check.text = MAIN_CHECK_CHINESE
		title_summary.text = TITLE_SUMMARY_CHINESE
		doppel_label.text = DOPPELS_LABEL_CHINESE + str(Global.total_doppels_captured)
		doppel_label_2.text = DOPPELS_LABEL_2_CHINESE + str(Global.total_doppels_got_in)
		neighbor_label.text = NEIGHBORS_LABEL_CHINESE + str(20 - len(Global.neighbors_alive_list))
		menu_button.text = MENU_BUTTON_CHINESE
		record_button.text = RECORD_BUTTON_CHINESE
		quit_button.text = QUIT_BUTTON_CHINESE
		title_frame.text = TITLE_FRAME_CHINESE
		main_frame.text = MAIN_FRAME_CHINESE

func _set_sound_music_level()->void :
	window_sfx.volume_db = Global.sound_level
	background_sfx.volume_db = Global.music_level
	voice_05.volume_db = Global.sound_level
	bite.volume_db = Global.sound_level
	jail_sfx.volume_db = Global.sound_level
	chains_sfx.volume_db = Global.sound_level
	music.volume_db = Global.music_level
	accept.volume_db = Global.sound_level
	select.volume_db = Global.sound_level
	zipper.volume_db = Global.sound_level
	switch.volume_db = Global.sound_level

func play_final()->void :
	var neighbors_dead = 20 - len(Global.neighbors_alive_list)
	var spawnChar
	if neighbors_dead == 0:

		final_number = 5
		set_process(false)
		self.scale = Vector2(0.84, 0.9)
		camera.position = Vector2(960, 540)
		music.play()
		table.visible = true
		frame.visible = true
		await get_tree().create_timer(TWEEN_FAST_TIME).timeout
		if Global.achievements_3["FINAL_5"] == 0:
				Global.achievements_3["FINAL_5"] = 1
				_show_unlock_achievement()
	elif neighbors_dead == 1 and "Dr_W_Afton" not in Global.neighbors_alive_list:

		final_number = 4
		background_sfx.play()
		bag.visible = true
		var spawnChar1 = AFTON.instantiate()
		var spawnChar2 = CHAR_DDD.instantiate()
		var spawnChar3 = CHAR_DDD.instantiate()
		characters.add_child(spawnChar1)
		characters.add_child(spawnChar2)
		characters.add_child(spawnChar3)
		characters.get_child(1).position = Vector2(150, 450)
		characters.get_child(2).position = Vector2(1800, 450)
		await get_tree().create_timer(2).timeout
		switch.play()
		black_2.visible = false
		await get_tree().create_timer(TWEEN_TIME).timeout
		if characters.get_child_count() > 0:
			characters.get_child(0).change_current_text(1)
		else :
			return 
		text_selection()
	elif neighbors_dead > 14:
		if Global.neighbors_kill_count > 14:

			final_number = 2
			spawnChar = CHAR_DDD.instantiate()
		else :

			final_number = 1
			spawnChar = CHAR_DOPPEL.instantiate()
		background_sfx.play()
		characters.add_child(spawnChar)
		office.visible = true
		_start_final()
	else :

		final_number = 3
		set_process(false)
		self.scale = Vector2(0.84, 0.9)
		camera.position = Vector2(960, 540)
		music.play()
		table.visible = true
		await get_tree().create_timer(TWEEN_FAST_TIME).timeout
		if Global.achievements_3["FINAL_3"] == 0:
			Global.achievements_3["FINAL_3"] = 1
			_show_unlock_achievement()

func _start_final()->void :
	await get_tree().create_timer(3).timeout
	var tween = create_tween()
	window_sfx.play()
	tween.tween_property(window, "position", SECURE_WINDOW_INITIAL_POS_Y, TWEEN_FAST_TIME)
	await get_tree().create_timer(1).timeout
	if characters.get_child_count() > 0:
		characters.get_child(0).change_current_text(1)
	else :
		return 
	text_selection()

func text_selection()->void :
	text_on_talk = characters.get_child(0).get_text()
	if characters.get_child_count() > 0:
		characters.get_child(0).set_sfx_volume()
	else :
		return 
	text_panel.visible = true
	add_text()

func _on_time_between_text_timeout()->void :
	if n_texts > 0:
		add_text()
	else :
		time_between_text.stop()
		text_panel.visible = false
		match final_number:
			1:
				game_over_dead()
			2:
				game_over_jail()
			4:
				game_over_afton()

func add_text()->void :
	text_label.visible_ratio = 0.0
	if len(text_on_talk) > 0:
		text_label.text = text_on_talk[0]
		text_on_talk.remove_at(0)
	n_texts = len(text_on_talk)
	text_label.visible = true
	if characters.get_child_count() > 0:
		characters.get_child(0).play_random_sfx()
	else :
		return 
	var tween = create_tween()
	var time_tween = len(text_label.text) * CHAR_READ_RATE
	if Global.language == CHINESE_VALUE:
		time_tween = time_tween * 2
	tween.tween_property(text_label, "visible_ratio", VISIBLE_RATIO, time_tween)
	time_between_text.start(time_tween + TIME_BETWEEN_TEXT + 1)

func game_over_dead()->void :
	await get_tree().create_timer(TWEEN_FAST_TIME).timeout
	game_over.visible = true
	voice_05.play()
	var tween = create_tween()
	var tween2 = create_tween()
	tween.tween_property(left_hand, "position", LEFT_HAND_FINAL_POS, TWEEN_TIME)
	tween2.tween_property(right_hand, "position", RIGHT_HAND_FINAL_POS, TWEEN_TIME)
	tween.tween_callback(_scale_hands)

func game_over_jail()->void :
	await get_tree().create_timer(TWEEN_TIME).timeout
	game_over.visible = true
	chains_sfx.play()
	hands.visible = true
	var tween = create_tween()
	if Global.fixed_camera:
		tween.tween_property(hands, "position", Vector2(0, 300), TWEEN_TIME)
	else :
		tween.tween_property(hands, "position", Vector2(0, 180), TWEEN_TIME)
	tween.tween_callback(_to_game_over)

func game_over_afton()->void :
	characters.get_child(1).start_walk()
	characters.get_child(2).start_walk()
	await get_tree().create_timer(TWEEN_TIME * 2.2).timeout
	game_over.visible = true
	zipper.play()
	_to_game_over()

func _scale_hands()->void :
	await get_tree().create_timer(TWEEN_FAST_TIME).timeout
	var tween = create_tween()
	var tween2 = create_tween()
	tween.tween_property(left_hand, "scale", SCALE_HANDS, TWEEN_FAST_TIME / 5)
	tween2.tween_property(right_hand, "scale", SCALE_HANDS, TWEEN_FAST_TIME / 5)
	tween.tween_callback(_to_game_over)

func _to_game_over()->void :
	if final_number == 2:
		await get_tree().create_timer(TWEEN_TIME * 2).timeout
	background_sfx.stop()
	black.visible = true
	match final_number:
		1:
			bite.play()
			if Global.achievements_3["FINAL_1"] == 0:
				Global.achievements_3["FINAL_1"] = 1
				_show_unlock_achievement()
		2:
			jail_sfx.play()
			if Global.achievements_3["FINAL_2"] == 0:
				Global.achievements_3["FINAL_2"] = 1
				_show_unlock_achievement()
		4:
			if Global.achievements_3["FINAL_4"] == 0:
				Global.achievements_3["FINAL_4"] = 1
				_show_unlock_achievement()
	await get_tree().create_timer(TWEEN_TIME * 2).timeout
	Global.reset_campaign()
	Global.save_record()
	Global.save_achievements()
	Global.reset_values()
	await get_tree().create_timer(TWEEN_TIME).timeout
	Global.scene = MENU_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _show_unlock_achievement()->void :
	Global.save_achievements()
	if final_number in [3, 5]:
		trophie_2.visible = true
	else :
		trophie.visible = true
	magic_dust.play()
	var tween = create_tween()
	if final_number in [3, 5]:
		tween.tween_property(trophie_2, "scale", TROPHIE_FINAL_SCALE, TWEEN_FAST_TIME)
	else :
		tween.tween_property(trophie, "scale", TROPHIE_FINAL_SCALE, TWEEN_FAST_TIME)
	tween.tween_callback(_hide_trophie)
	if final_number in [3, 5]:
		trophie_2.particles()
	else :
		trophie.particles()

func _hide_trophie()->void :
	await get_tree().create_timer(TWEEN_TIME * 3).timeout
	var tween = create_tween()
	if final_number in [3, 5]:
		tween.tween_property(trophie_2, "modulate", Color(1, 1, 1, 0), TWEEN_FAST_TIME)
	else :
		tween.tween_property(trophie, "modulate", Color(1, 1, 1, 0), TWEEN_FAST_TIME)
	tween.tween_callback(_reset_trophie)

func _reset_trophie()->void :
	trophie.visible = false
	trophie.scale = TROPHIE_INITINAL_SCALE
	trophie.modulate = Color(1, 1, 1, 1)
	trophie_2.visible = false
	trophie_2.scale = TROPHIE_INITINAL_SCALE
	trophie_2.modulate = Color(1, 1, 1, 1)


func _on_menu_pressed()->void :
	accept.play()
	Global.reset_campaign()
	Global.save_record()
	Global.save_achievements()
	Global.reset_values()
	await get_tree().create_timer(0.5).timeout
	Global.scene = MENU_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_menu_mouse_entered()->void :
	if !menu_button.disabled:
		select.play()
	menu_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_menu_mouse_exited()->void :
	menu_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_record_pressed()->void :
	accept.play()
	Global.reset_campaign()
	Global.save_record()
	Global.save_achievements()
	Global.reset_values()
	await get_tree().create_timer(0.5).timeout
	Global.scene = RECORD_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_record_mouse_entered()->void :
	if !record_button.disabled:
		select.play()
	record_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_record_mouse_exited()->void :
	record_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_quit_pressed()->void :
	accept.play()
	Global.reset_campaign()
	Global.save_record()
	Global.save_achievements()
	Global.reset_values()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_quit_mouse_entered()->void :
	if !quit_button.disabled:
		select.play()
	quit_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_quit_mouse_exited()->void :
	quit_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)
