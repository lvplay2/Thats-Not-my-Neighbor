extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const WARNING_SCENE = 1
const TEXT_ENGLISH = "   Loading ..."
const TEXT_SPANISH = "Cargando ..."
const TEXT_CHINESE = "加载中 ..."
const LANGUAGE_SCENE_DIR = "res://Scenes/Language.tscn"
const MENU_SCENE_DIR = "res://Scenes/Menu.tscn"
const OFFICE_SCENE_DIR = "res://Scenes/Office.tscn"
const TUTORIAL_SCENE_DIR = "res://Scenes/Tutorial.tscn"
const WARNING_SCENE_DIR = "res://Scenes/Warning.tscn"
const GAME_OVER_SCENE_DIR = "res://Scenes/Game_Over.tscn"
const RECORD_SCENE_DIR = "res://Scenes/Record.tscn"
const SAVE_SETTINGS_PATH = "user://data_settings.save"
const NIGTHMARE_SCENE_DIR = "res://Scenes/Office_Nightmare.tscn"
const GAME_OVER_NIGHTMARE = "res://Scenes/Game_Over_Nightmare.tscn"
const TUTORIAL_NIGHTMARE = "res://Scenes/Tutorial_Nightmare.tscn"
const ENDLESS_SCENE_DIR = "res://Scenes/Office_Endless.tscn"
const ENDLESS_SUMMARY_SCENE = "res://Scenes/Endless_Summary.tscn"
const CAMPAIGN_SCENE = "res://Scenes/Office_Campaign.tscn"
const CAMPAIGN_MENU = "res://Scenes/Campaign_Menu.tscn"
const FINAL_SCENE = "res://Scenes/Final.tscn"

@onready var text = $Text
@onready var timer = $Timer

var already_load = false

func _ready()->void :
	if !already_load:
		Global.load_settings()
		already_load = true
	_set_text()
	timer.start()

func _change_scene(scene: int)->void :
	match scene:
		0:
			get_tree().change_scene_to_file(LANGUAGE_SCENE_DIR)
		1:
			get_tree().change_scene_to_file(WARNING_SCENE_DIR)
		2:
			get_tree().change_scene_to_file(MENU_SCENE_DIR)
		3:
			get_tree().change_scene_to_file(TUTORIAL_SCENE_DIR)
		4:
			get_tree().change_scene_to_file(OFFICE_SCENE_DIR)
		5:
			get_tree().change_scene_to_file(GAME_OVER_SCENE_DIR)
		6:
			get_tree().change_scene_to_file(RECORD_SCENE_DIR)
		7:
			get_tree().change_scene_to_file(NIGTHMARE_SCENE_DIR)
		8:
			get_tree().change_scene_to_file(GAME_OVER_NIGHTMARE)
		9:
			get_tree().change_scene_to_file(TUTORIAL_NIGHTMARE)
		10:
			get_tree().change_scene_to_file(ENDLESS_SCENE_DIR)
		11:
			get_tree().change_scene_to_file(ENDLESS_SUMMARY_SCENE)
		12:
			get_tree().change_scene_to_file(CAMPAIGN_SCENE)
		13:
			get_tree().change_scene_to_file(CAMPAIGN_MENU)
		14:
			get_tree().change_scene_to_file(FINAL_SCENE)
		_:
			pass

func _on_timer_timeout()->void :
	if Global.save_file_exist and Global.is_first_load:
		Global.scene = WARNING_SCENE
		Global.is_first_load = false
	_change_scene(Global.scene)

func _set_text()->void :
	if Global.language == ENGLISH_VALUE:
		text.text = TEXT_ENGLISH
	elif Global.language == SPANISH_VALUE:
		text.text = TEXT_SPANISH
	elif Global.language == CHINESE_VALUE:
		text.text = TEXT_CHINESE
