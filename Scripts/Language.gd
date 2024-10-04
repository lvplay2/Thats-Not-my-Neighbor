extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const WARNING_SCENE = 1
const BUTTONS_OUTLINE_COLOR_BLACK = Color(0, 0, 0, 1)
const BUTTONS_OUTLINE_COLOR_GREY = Color(0.5, 0.5, 0.5, 1)
const LOADING_DIR = "res://Scenes/Loading_screen.tscn"

@onready var english_button = $English
@onready var spanish_button = $Spanish
@onready var s_chinese_button = $S_Chinese
@onready var sfx_select = $Select
@onready var sfx_accept = $Accept

func _ready()->void :
	_set_sound_music_level()

func _set_sound_music_level()->void :
	sfx_accept.volume_db = Global.sound_level
	sfx_select.volume_db = Global.sound_level

func _on_english_pressed()->void :
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	Global.language = ENGLISH_VALUE
	Global.save_settings()
	_change_scene()

func _on_spanish_pressed()->void :
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	Global.language = SPANISH_VALUE
	Global.save_settings()
	_change_scene()

func _change_scene()->void :
	Global.scene = WARNING_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_english_mouse_entered()->void :
	_play_sfx(0)
	english_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_english_mouse_exited()->void :
	english_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_spanish_mouse_entered()->void :
	_play_sfx(0)
	spanish_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_spanish_mouse_exited()->void :
	spanish_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _play_sfx(n: int)->void :
	match n:
		0:
			sfx_select.play()
		1:
			sfx_accept.play()
		_:
			pass

func _on_s_chinese_pressed():
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	Global.language = CHINESE_VALUE
	Global.save_settings()
	_change_scene()

func _on_s_chinese_mouse_entered():
	_play_sfx(0)
	s_chinese_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_s_chinese_mouse_exited():
	s_chinese_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)
