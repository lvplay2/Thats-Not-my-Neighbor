extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const MENU_SCENE = 2
const RECORD_SCENE = 6
const OFFICE_SCENE = 10
const LOADING_DIR = "res://Scenes/Loading_screen.tscn"
const CONTINUE_BUTTON_ENGLISH = "Continue"
const CONTINUE_BUTTON_SPANISH = "Continuar"
const CONTINUE_BUTTON_CHINESE = "继续"
const NEW_BUTTON_ENGLISH = "Play again"
const NEW_BUTTON_SPANISH = "Otra vez"
const NEW_BUTTON_CHINESE = "再玩一次"
const RECORD_BUTTON_SPANISH = "Registro"
const RECORD_BUTTON_ENGLISH = "Record"
const RECORD_BUTTON_CHINESE = "记录"
const MENU_SPANISH = "Menú"
const MENU_ENGLISH = "Menu"
const MENU_CHINESE = "主菜单"
const QUIT_SPANISH = "Salir"
const QUIT_ENGLISH = "Quit"
const QUIT_CHINESE = "退出游戏"
const LEVEL_RECORD_SPANISH = "Resumen del Día"
const LEVEL_RECORD_ENGLISH = "Day Summary"
const LEVEL_RECORD_CHINESE = "当天总结"
const TITLE_DOPPEL_INFO_ENGLISH = "Details:"
const TITLE_DOPPEL_INFO_SPANISH = "Detalles:"
const TITLE_DOPPEL_INFO_CHINESE = "细节:"
const DETAILS_BUTTON_ENGLISH = "Doppels you let in"
const DETAILS_BUTTON_SPANISH = "Doppels que ingresaron"
const DETAILS_BUTTON_CHINESE = "你让进来的伪人"
const DETAILS_BUTTON_NEIGHBOR_ENGLISH = "Neighbors you killed"
const DETAILS_BUTTON_NEIGHBOR_SPANISH = "Vecinos que eliminaste"
const DETAILS_BUTTON_NEIGHBOR_CHINESE = "你杀死的邻居"
const SCORE_SPANISH = "Puntuación"
const SCORE_ENGLISH = "Score"
const SCORE_CHINESE = "成绩表"
const BEST_SCORE_SPANISH = "Mejor: "
const BEST_SCORE_ENGLISH = "Best: "
const BEST_SCORE_CHINESE = "最好成绩： "
const CURRENT_SCORE_SPANISH = "Actual: "
const CURRENT_SCORE_ENGLISH = "Current: "
const CURRENT_SCORE_CHINESE = "目前成绩："
const BUTTONS_OUTLINE_COLOR_BLACK = Color(0, 0, 0, 1)
const BUTTONS_OUTLINE_COLOR_SELECT = Color(1, 0, 0, 1)
const BUTTONS_OUTLINE_COLOR_GREY = Color(0.5, 0.5, 0.5, 1)
const TROPHIE_FINAL_SCALE = Vector2(0.3, 0.3)
const TROPHIE_INITINAL_SCALE = Vector2(0.01, 0.01)
const TWEEN_FAST_TIME = 0.5
const TWEEN_TIME = 1.0
const FINAL_POS_DETAILS = Vector2(800, 0)
const INITIAL_POS_DETAILS = Vector2(0, 0)

@onready var blood: Node2D = $Blood
@onready var continue_button: Button = $Buttons / Continue
@onready var record_button: Button = $Buttons / Record
@onready var menu_button: Button = $Buttons / Menu2
@onready var quit_button: Button = $Buttons / Quit
@onready var day_title: Label = $Texts / Day_Title
@onready var score_text: Label = $Texts / Day_Title2
@onready var best_day_text: Label = $Texts / Text
@onready var current_day_text: Label = $Texts / Text2
@onready var doppel_info: Button = $Buttons / Doppel_info
@onready var details: Node2D = $Details
@onready var title: Label = $Details / Title
@onready var info: Label = $Details / Info
@onready var ok_button: Button = $Details / Ok
@onready var sfx_select: AudioStreamPlayer = $Select
@onready var sfx_accept: AudioStreamPlayer = $Accept
@onready var sfx_check_write: AudioStreamPlayer = $Check_Write
@onready var sfx_pick_up_folder: AudioStreamPlayer = $Pick_Up_Folder
@onready var music: AudioStreamPlayer = $Music
@onready var sfx_magic_dust: AudioStreamPlayer = $Magic_Dust
@onready var title_details: Label = $Details / Title
@onready var trophie: Node2D = $Trophie
@onready var neighbor_info: Button = $Buttons / Neighbor_info

var achieve_unlock = false
var info_text = ""
var info_text_2 = ""

func _ready()->void :
	achieve_unlock = false
	_set_sound_music_level()
	_set_language()
	_set_doppel_info()
	_set_summary()
	music.play()
	_play_sfx(2)
	await get_tree().create_timer(1).timeout
	if achieve_unlock:
		_show_unlock_achievement()

func _set_sound_music_level()->void :
	sfx_accept.volume_db = Global.sound_level
	sfx_select.volume_db = Global.sound_level
	sfx_check_write.volume_db = Global.sound_level
	sfx_pick_up_folder.volume_db = Global.sound_level
	sfx_magic_dust.volume_db = Global.sound_level
	music.volume_db = Global.music_level

func _set_language()->void :
	if Global.language == SPANISH_VALUE:
		if Global.current_day_count > 0:
			continue_button.text = CONTINUE_BUTTON_SPANISH
		else :
			continue_button.text = NEW_BUTTON_SPANISH
		record_button.text = RECORD_BUTTON_SPANISH
		menu_button.text = MENU_SPANISH
		quit_button.text = QUIT_SPANISH
		doppel_info.text = DETAILS_BUTTON_SPANISH
		day_title.text = LEVEL_RECORD_SPANISH
		score_text.text = SCORE_SPANISH
		best_day_text.text = BEST_SCORE_SPANISH
		current_day_text.text = CURRENT_SCORE_SPANISH
		title_details.text = TITLE_DOPPEL_INFO_SPANISH
		doppel_info.text = DETAILS_BUTTON_SPANISH
		neighbor_info.text = DETAILS_BUTTON_NEIGHBOR_SPANISH
	elif Global.language == ENGLISH_VALUE:
		if Global.current_day_count > 0:
			continue_button.text = CONTINUE_BUTTON_ENGLISH
		else :
			continue_button.text = NEW_BUTTON_ENGLISH
		record_button.text = RECORD_BUTTON_ENGLISH
		menu_button.text = MENU_ENGLISH
		quit_button.text = QUIT_ENGLISH
		doppel_info.text = DETAILS_BUTTON_ENGLISH
		day_title.text = LEVEL_RECORD_ENGLISH
		score_text.text = SCORE_ENGLISH
		best_day_text.text = BEST_SCORE_ENGLISH
		current_day_text.text = CURRENT_SCORE_ENGLISH
		title_details.text = TITLE_DOPPEL_INFO_ENGLISH
		doppel_info.text = DETAILS_BUTTON_ENGLISH
		neighbor_info.text = DETAILS_BUTTON_NEIGHBOR_ENGLISH
	elif Global.language == CHINESE_VALUE:
		if Global.current_day_count > 0:
			continue_button.text = CONTINUE_BUTTON_CHINESE
		else :
			continue_button.text = NEW_BUTTON_CHINESE
		record_button.text = RECORD_BUTTON_CHINESE
		menu_button.text = MENU_CHINESE
		quit_button.text = QUIT_CHINESE
		doppel_info.text = DETAILS_BUTTON_CHINESE
		day_title.text = LEVEL_RECORD_CHINESE
		score_text.text = SCORE_CHINESE
		best_day_text.text = BEST_SCORE_CHINESE
		current_day_text.text = CURRENT_SCORE_CHINESE
		title_details.text = TITLE_DOPPEL_INFO_CHINESE
		doppel_info.text = DETAILS_BUTTON_CHINESE
		neighbor_info.text = DETAILS_BUTTON_NEIGHBOR_CHINESE
		menu_button.position -= Vector2(30, 25)
		quit_button.position -= Vector2(90, 20)
		continue_button.position -= Vector2(0, 20)
		record_button.position -= Vector2(0, 25)

func _play_sfx(n: int)->void :
	match n:
		0:
			sfx_select.play()
		1:
			sfx_accept.play()
		2:
			sfx_pick_up_folder.play()
		3:
			sfx_check_write.play()
		4:
			sfx_magic_dust.play()
		_:
			pass

func _set_summary()->void :
	if Global.doppel_entered_level > 0 or Global.chars_killed_level == 2:
		Global.days_killed_record += 1
		blood.visible = true
		if Global.achievements["BE_KILLED"] == 0:
			Global.achievements["BE_KILLED"] = 1
			achieve_unlock = true
	else :
		Global.days_successfully_complete_record += 1
		if Global.achievements["ALIVE"] == 0:
			Global.achievements["ALIVE"] = 1
			achieve_unlock = true
		if Global.days_successfully_complete_record >= 40:
			if Global.achievements["40_DAYS"] == 0:
				Global.achievements["40_DAYS"] = 1
				achieve_unlock = true
	if Global.chars_killed_level > 0:
		if Global.achievements["KILL_NEIGHBOR"] == 0:
			Global.achievements["KILL_NEIGHBOR"] = 1
			achieve_unlock = true
	Global.doppel_captured_record += Global.doppel_captured_level
	Global.doppel_entered_record += Global.doppel_entered_level
	Global.chars_killed_record += Global.chars_killed_level
	if Global.doppel_captured_record >= 100:
		if Global.achievements["100_DOPPELS"] == 0:
			Global.achievements["100_DOPPELS"] = 1
			achieve_unlock = true
	if Global.days_successfully_complete_record + Global.days_killed_record >= 100:
		if Global.achievements["100_DAYS"] == 0:
			Global.achievements["100_DAYS"] = 1
			achieve_unlock = true
	if !Global.did_folder_opened and !blood.visible and Global.achievements["NO_FOLDER"] == 0:
		achieve_unlock = true
		Global.achievements["NO_FOLDER"] = 1
	best_day_text.text += str(Global.record_day_count)
	current_day_text.text += str(Global.current_day_count)
	if Global.record_day_count == 7 and Global.achievements_3["7_DAYS"] == 0:
		achieve_unlock = true
		Global.achievements_3["7_DAYS"] = 1
	elif Global.record_day_count == 15 and Global.achievements_3["15_DAYS"] == 0:
		achieve_unlock = true
		Global.achievements_3["15_DAYS"] = 1
	Global.save_record()
	Global.save_achievements()
	Global.reset_values()

func _on_record_pressed()->void :
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	Global.scene = RECORD_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_menu_pressed()->void :
	_play_sfx(1)
	get_tree().paused = false
	await get_tree().create_timer(0.5).timeout
	Global.scene = MENU_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_quit_pressed()->void :
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_record_mouse_entered()->void :
	if !record_button.disabled:
		_play_sfx(0)
	record_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_record_mouse_exited()->void :
	record_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_menu_mouse_entered()->void :
	if !menu_button.disabled:
		_play_sfx(0)
	menu_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_menu_mouse_exited()->void :
	menu_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_quit_mouse_entered()->void :
	if !quit_button.disabled:
		_play_sfx(0)
	quit_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_quit_mouse_exited()->void :
	quit_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _show_unlock_achievement()->void :
	trophie.visible = true
	_play_sfx(4)
	var tween = create_tween()
	tween.tween_property(trophie, "scale", TROPHIE_FINAL_SCALE, TWEEN_FAST_TIME)
	tween.tween_callback(_hide_trophie)
	trophie.particles()

func _hide_trophie()->void :
	await get_tree().create_timer(TWEEN_TIME * 3).timeout
	var tween = create_tween()
	tween.tween_property(trophie, "modulate", Color(1, 1, 1, 0), TWEEN_FAST_TIME)
	tween.tween_callback(_reset_trophie)

func _reset_trophie()->void :
	trophie.visible = false
	trophie.scale = TROPHIE_INITINAL_SCALE
	trophie.modulate = Color(1, 1, 1, 1)

func _on_continue_button_pressed()->void :
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	Global.scene = OFFICE_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_continue_button_mouse_entered()->void :
	if !continue_button.disabled:
		_play_sfx(0)
	continue_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_continue_button_mouse_exited()->void :
	continue_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_doppel_info_pressed()->void :
	info.text = info_text
	_play_sfx(1)
	_play_sfx(2)
	doppel_info.disabled = true
	neighbor_info.disabled = true
	menu_button.disabled = true
	continue_button.disabled = true
	record_button.disabled = true
	quit_button.disabled = true
	var tween = create_tween()
	tween.tween_property(details, "position", FINAL_POS_DETAILS, TWEEN_TIME)
	tween.tween_callback(_folder_open)

func _folder_open()->void :
	ok_button.disabled = false

func _on_doppel_info_mouse_entered()->void :
	if !doppel_info.disabled:
		_play_sfx(0)
	doppel_info.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_doppel_info_mouse_exited()->void :
	doppel_info.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_ok_pressed()->void :
	_play_sfx(1)
	_play_sfx(2)
	ok_button.disabled = true
	var tween = create_tween()
	tween.tween_property(details, "position", INITIAL_POS_DETAILS, TWEEN_TIME)
	tween.tween_callback(_folder_close)

func _folder_close()->void :
	doppel_info.disabled = false
	neighbor_info.disabled = false
	menu_button.disabled = false
	continue_button.disabled = false
	record_button.disabled = false
	quit_button.disabled = false

func _on_ok_mouse_entered()->void :
	_play_sfx(0)
	ok_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_ok_mouse_exited()->void :
	ok_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_neighbor_info_pressed():
	info.text = info_text_2
	_play_sfx(1)
	_play_sfx(2)
	doppel_info.disabled = true
	neighbor_info.disabled = true
	menu_button.disabled = true
	continue_button.disabled = true
	record_button.disabled = true
	quit_button.disabled = true
	var tween = create_tween()
	tween.tween_property(details, "position", FINAL_POS_DETAILS, TWEEN_TIME)
	tween.tween_callback(_folder_open)

func _on_neighbor_info_mouse_entered():
	if !neighbor_info.disabled:
		_play_sfx(0)
	neighbor_info.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_neighbor_info_mouse_exited():
	neighbor_info.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _set_doppel_info()->void :
	var next_info = "a"
	for letter in Global.doppels_info:
		if letter == "*":
			if next_info != "a":
				info_text = info_text + "* " + next_info + "\n" + "\n"
			next_info = ""
		else :
			next_info += letter
	if next_info == "a":
		info_text = " "
	else :
		info_text = info_text + "* " + next_info + "\n" + "\n"
	next_info = "a"
	for letter in Global.neighbors_killed_info:
		if letter == "*":
			if next_info != "a":
				info_text_2 = info_text_2 + "* " + next_info + "\n" + "\n"
			next_info = ""
		else :
			next_info += letter
	if next_info == "a":
		info_text_2 = " "
	else :
		info_text_2 = info_text_2 + "* " + next_info + "\n" + "\n"
