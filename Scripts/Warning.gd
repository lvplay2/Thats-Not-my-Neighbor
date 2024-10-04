extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const LOADING_DIR = "res://Scenes/Loading_screen.tscn"
const TEXT_ENGLISH = "This videogame contains flashing lights.\nThe characters and entities present are fictitious and any resemblance to reality is just coincidence."

const TEXT_SPANISH = "Este juego contiene luces intermitentes.\nLos personajes y entidades presentes son ficticios y cualquier parecido con la realidad es pura coincidencia."

const TEXT_S_CHINESE = "该视频游戏包含闪烁的灯光。\n所出现的人物和实体都是虚构的，与现实的任何相似之处纯属巧合。"

const WARNING_TEXT_ENGLISH = "     WARNING"
const WARNING_TEXT_SPANISH = "ADVERTENCIA"
const WARNING_TEXT_CHINESE = "           警告"
const MENU_SCENE = 2
const TRANSPARENCY_OFF_TEXT = Color(1, 1, 1, 1)
const TRANSPARENCY_ON_TEXT = Color(1, 1, 1, 0)
const TWEEN_TIME = 1.0

@onready var warning_text = $Warning
@onready var text = $Text
@onready var timer = $Timer
@onready var sfx_accept = $Accept

var click_flag = true

func _ready()->void :
	if Global.language == ENGLISH_VALUE:
		text.text = TEXT_ENGLISH
		warning_text.text = WARNING_TEXT_ENGLISH
	elif Global.language == SPANISH_VALUE:
		text.text = TEXT_SPANISH
		warning_text.text = WARNING_TEXT_SPANISH
	elif Global.language == CHINESE_VALUE:
		text.text = TEXT_S_CHINESE
		warning_text.text = WARNING_TEXT_CHINESE
	_first_tween()
	_set_sound_music_level()

func _set_sound_music_level()->void :
	sfx_accept.volume_db = Global.sound_level

func _process(_delta)->void :
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and click_flag:
		click_flag = false
		sfx_accept.play()
		await get_tree().create_timer(0.5).timeout
		_change_scene()

func _first_tween()->void :
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(warning_text, "modulate", TRANSPARENCY_OFF_TEXT, TWEEN_TIME)
	tween.tween_property(text, "modulate", TRANSPARENCY_OFF_TEXT, TWEEN_TIME)
	tween.tween_callback(_tween_finish).set_delay(TWEEN_TIME)

func _on_timer_timeout()->void :
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(warning_text, "modulate", TRANSPARENCY_ON_TEXT, TWEEN_TIME)
	tween.tween_property(text, "modulate", TRANSPARENCY_ON_TEXT, TWEEN_TIME)
	tween.tween_callback(_change_scene).set_delay(TWEEN_TIME)

func _tween_finish()->void :
	timer.start()

func _change_scene()->void :
	Global.scene = MENU_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)
