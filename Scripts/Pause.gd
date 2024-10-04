extends Control

const MENU_SCENE = 2
const LOADING_DIR = "res://Scenes/Loading_screen.tscn"
const SIZE_960X540 = Vector2i(960, 540)
const SIZE_1280X720 = Vector2i(1280, 720)
const SIZE_1920X1080 = Vector2i(1920, 1080)
const CONTIUE_BUTTON_ENGLISH = "Continue"
const CONTIUE_BUTTON_SPANISH = "Continuar"
const CONTIUE_BUTTON_CHINESE = "继续"
const PAUSE_LABEL_ENGLISH = "Pause"
const PAUSE_LABEL_SPANISH = "Pausa"
const PAUSE_LABEL_CHINESE = "暂停"
const MENU_BUTTON_ENGLISH = "Menu"
const MENU_BUTTON_SPANISH = "Menú"
const MENU_BUTTON_CHINESE = "主菜单"
const QUIT_BUTTON_ENGLISH = "Quit"
const QUIT_BUTTON_SPANISH = "Salir"
const QUIT_BUTTON_CHINESE = "退出游戏"
const OPTIONS_SOUND_ENGLISH = "Sound"
const OPTIONS_SOUND_SPANISH = "Sonido"
const OPTIONS_SOUND_CHINESE = "声音"
const OPTIONS_MUSIC_ENGLISH = "Music"
const OPTIONS_MUSIC_SPANISH = "Música"
const OPTIONS_MUSIC_CHINESE = "音乐"
const OPTIONS_SIZE_ENGLISH = "Fullscreen"
const OPTIONS_SIZE_SPANISH = "Pantalla completa"
const OPTIONS_SIZE_CHINESE = "全屏"
const TITLE_LABEL_ENGLISH = "Pause Menu"
const TITLE_LABEL_SPANISH = "Menú de Pausa"
const TITLE_LABEL_CHINESE = "暂停菜单"
const MIN_SLIDER_POS_X = 2290
const MAX_SLIDER_POS_X = 2716
const TEXT_FOR_SOUNDS_ENGLISH = "Text for\nimportant \nsounds"


const TEXT_FOR_SOUNDS_SPANISH = "Texto para\nsonidos \nimportantes"


const TEXT_FOR_SOUNDS_CHINESE = "重要音效的文字"
const TEXT_FOR_COLORS_ENGLISH = "Text for\nimportant \ncolors"


const TEXT_FOR_COLORS_SPANISH = "Texto para\ncolores \nimportantes"


const TEXT_FOR_COLORS_CHINESE = "显示重要颜色的文本"
const BUTTONS_OUTLINE_COLOR_BLACK = Color(0, 0, 0, 1)
const BUTTONS_OUTLINE_COLOR_GREY = Color(0.5, 0.5, 0.5, 1)
const BUTTONS_OUTLINE_COLOR_SELECT = Color(1, 0, 0, 1)
const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const PAUSE_FOLDER_INITIAL_POS = Vector2(-1350, -970)
const PAUSE_FOLDER_FINAL_POS = Vector2(0, 0)
const TWEEN_TIME = 0.6
const TWEEN_TIME_UNPAUSED = 0.75
const PAUSE_FOLDER_INITIAL_ROT = 180
const PAUSE_FOLDER_FINAL_ROT = 0
const FIXED_CAMERA_TEXT_SPANISH = "Cámara fija"
const FIXED_CAMERA_TEXT_ENGLISH = "Fixed camera"
const FIXED_CAMERA_TEXT_CHINESE = "固定摄像头"
const SMALL_TEXT_SPANISH = "Diálogo pequeño"
const SMALL_TEXT_ENGLISH = "Small dialog text"
const SMALL_TEXT_CHINESE = "小对话文字"

@onready var sfx_accept = $Accept
@onready var sfx_select = $Select
@onready var sfx_check = $Check_Write
@onready var sfx_folder = $Pick_Up_Folder
@onready var continue_button = $Menu / Folder_Content / Continue
@onready var menu_button = $Menu / Folder_Content / Menu
@onready var quit_button = $Menu / Folder_Content / Quit
@onready var pause_label = $Menu / Label
@onready var title_label = $Menu / Folder_Content / Title
@onready var sound_label = $Menu / Folder_Content / Label_Sound
@onready var music_label = $Menu / Folder_Content / Label_Music
@onready var fullscreen_label = $Menu / Folder_Content / Label_Fullscreen
@onready var accesibility_label = $Menu / Folder_Content / Label_Sound_Text
@onready var sprite_check_01 = $Menu / Folder_Content / Check_01
@onready var sprite_check_02 = $Menu / Folder_Content / Check_02
@onready var sprite_check_03 = $Menu / Folder_Content / Check_03
@onready var sprite_check_04 = $Menu / Folder_Content / Check_04
@onready var sprite_check_05 = $Menu / Folder_Content / Check_05
@onready var check_button_01 = $Menu / Folder_Content / Check_Button_01
@onready var check_button_02 = $Menu / Folder_Content / Check_Button_02
@onready var check_button_03 = $Menu / Folder_Content / Check_Button_03
@onready var check_button_04 = $Menu / Folder_Content / Check_Button_04
@onready var check_button_05 = $Menu / Folder_Content / Check_Button_05
@onready var options_circle_slider_01 = $Menu / Folder_Content / Circle_Slider_01
@onready var options_circle_slider_02 = $Menu / Folder_Content / Circle_Slider_02
@onready var pause_menu = $Menu
@onready var sprite_check_06 = $Menu / Folder_Content / Check_06
@onready var check_button_06 = $Menu / Folder_Content / Check_Button_06
@onready var label_color_text = $Menu / Folder_Content / Label_Sound_Text2
@onready var check_button_07 = $Menu / Folder_Content / Check_Button_07
@onready var check_button_08 = $Menu / Folder_Content / Check_Button_08
@onready var sprite_check_07 = $Menu / Folder_Content / Check_07
@onready var sprite_check_08 = $Menu / Folder_Content / Check_08
@onready var label_camera_text = $Menu / Folder_Content / Label_Camera_Text
@onready var label_dialog_text = $Menu / Folder_Content / Label_Dialog_Text

var screen_size
var current_screen
var flag_slider_01_moving = false
var flag_slider_02_moving = false

func _ready()->void :
	current_screen = DisplayServer.window_get_current_screen()
	screen_size = DisplayServer.screen_get_size()
	options_circle_slider_01.value = _lineal_inverse_slider_value(Global.sound_level)
	options_circle_slider_02.value = _lineal_inverse_slider_value(Global.music_level)
	_check_buttons_state()
	_disabled_buttons(true)

func set_language()->void :
	if Global.language == ENGLISH_VALUE:
		continue_button.text = CONTIUE_BUTTON_ENGLISH
		menu_button.text = MENU_BUTTON_ENGLISH
		quit_button.text = QUIT_BUTTON_ENGLISH
		pause_label.text = PAUSE_LABEL_ENGLISH
		title_label.text = TITLE_LABEL_ENGLISH
		sound_label.text = OPTIONS_SOUND_ENGLISH
		music_label.text = OPTIONS_MUSIC_ENGLISH
		fullscreen_label.text = OPTIONS_SIZE_ENGLISH
		accesibility_label.text = TEXT_FOR_SOUNDS_ENGLISH
		label_color_text.text = TEXT_FOR_COLORS_ENGLISH
		label_camera_text.text = FIXED_CAMERA_TEXT_ENGLISH
		label_dialog_text.text = SMALL_TEXT_ENGLISH
	elif Global.language == SPANISH_VALUE:
		continue_button.text = CONTIUE_BUTTON_SPANISH
		menu_button.text = MENU_BUTTON_SPANISH
		quit_button.text = QUIT_BUTTON_SPANISH
		pause_label.text = PAUSE_LABEL_SPANISH
		title_label.text = TITLE_LABEL_SPANISH
		sound_label.text = OPTIONS_SOUND_SPANISH
		music_label.text = OPTIONS_MUSIC_SPANISH
		fullscreen_label.text = OPTIONS_SIZE_SPANISH
		accesibility_label.text = TEXT_FOR_SOUNDS_SPANISH
		label_color_text.text = TEXT_FOR_COLORS_SPANISH
		label_camera_text.text = FIXED_CAMERA_TEXT_SPANISH
		label_dialog_text.text = SMALL_TEXT_SPANISH
	elif Global.language == CHINESE_VALUE:
		continue_button.text = CONTIUE_BUTTON_CHINESE
		continue_button.position -= Vector2(0, 30)
		menu_button.text = MENU_BUTTON_CHINESE
		menu_button.position -= Vector2(0, 25)
		quit_button.text = QUIT_BUTTON_CHINESE
		quit_button.position -= Vector2(110, 20)
		pause_label.text = PAUSE_LABEL_CHINESE
		title_label.text = TITLE_LABEL_CHINESE
		sound_label.text = OPTIONS_SOUND_CHINESE
		music_label.text = OPTIONS_MUSIC_CHINESE
		fullscreen_label.text = OPTIONS_SIZE_CHINESE
		accesibility_label.text = TEXT_FOR_SOUNDS_CHINESE
		label_color_text.text = TEXT_FOR_COLORS_CHINESE
		label_camera_text.text = FIXED_CAMERA_TEXT_CHINESE
		label_dialog_text.text = SMALL_TEXT_CHINESE
		label_color_text.position += Vector2(35, -10)

func _play_sfx(n: int)->void :
	match n:
		1:
			sfx_accept.play()
		2:
			sfx_select.play()
		3:
			sfx_check.play()
		4:
			sfx_folder.play()
		_:
			pass

func on_pause_button_pressed()->void :
	_play_sfx(4)
	get_parent().get_parent().pause_button_action(false)
	pause_label.visible = false
	_pause_animation(true)
	await get_tree().create_timer(TWEEN_TIME_UNPAUSED).timeout
	_disabled_buttons(false)
	_check_buttons_state()

func _on_continue_pressed()->void :
	_play_sfx(4)
	Global.save_settings()
	_disabled_buttons(true)
	if !Global.fixed_camera:
		self.position = Vector2(0, 0)
	get_parent().get_parent().pause_button_action(true)
	_pause_animation(false)

func _on_continue_mouse_entered()->void :
	if !continue_button.disabled:
		_play_sfx(2)
		continue_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_continue_mouse_exited()->void :
	continue_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_menu_pressed()->void :
	_play_sfx(1)
	Global.save_settings()
	get_tree().paused = false
	await get_tree().create_timer(0.5).timeout
	Global.scene = MENU_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_menu_mouse_entered()->void :
	if !menu_button.disabled:
		_play_sfx(2)
		menu_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_menu_mouse_exited()->void :
	menu_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_quit_pressed()->void :
	_play_sfx(1)
	Global.save_settings()
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_quit_mouse_entered()->void :
	if !quit_button.disabled:
		_play_sfx(2)
		quit_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_quit_mouse_exited()->void :
	quit_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _lineal_value_slider(value):
	if value == 0:
		return -80
	else :
		return 2 * value / 5 - 20

func _lineal_inverse_slider_value(value):
	if value == -80:
		return 0
	else :
		return 5 * (value + 20) / 2

@warning_ignore("unused_parameter")
func _on_circle_slider_01_drag_ended(value_changed)->void :
	_set_sound_music_level()
	_play_sfx(1)

func _on_circle_slider_01_value_changed(value)->void :
	Global.sound_level = _lineal_value_slider(value)

func _on_circle_slider_02_value_changed(value)->void :
	Global.music_level = _lineal_value_slider(value)

func _on_check_button_01_pressed()->void :
	current_screen = DisplayServer.window_get_current_screen()
	screen_size = DisplayServer.screen_get_size()
	_play_sfx(3)
	Global.window_size = 0
	_check_buttons_state()
	@warning_ignore("int_as_enum_without_cast")
	DisplayServer.window_set_mode(0, 0)
	DisplayServer.window_set_size(SIZE_960X540)
	if screen_size != Vector2i(960, 540):
		DisplayServer.window_set_position(Vector2i(screen_size.x / 2 - 480, screen_size.y / 2 - 270), 0)
	else :
		DisplayServer.window_set_position(Vector2i(0, 0), 0)
	DisplayServer.window_set_current_screen(current_screen)
	screen_size = DisplayServer.screen_get_size()

func _on_check_button_02_pressed()->void :
	current_screen = DisplayServer.window_get_current_screen()
	screen_size = DisplayServer.screen_get_size()
	_play_sfx(3)
	Global.window_size = 1
	_check_buttons_state()
	@warning_ignore("int_as_enum_without_cast")
	DisplayServer.window_set_mode(0, 0)
	DisplayServer.window_set_size(SIZE_1280X720)
	if screen_size != Vector2i(1280, 720):
		DisplayServer.window_set_position(Vector2i(screen_size.x / 2 - 640, screen_size.y / 2 - 360), 0)
	else :
		DisplayServer.window_set_position(Vector2i(0, 0), 0)
	DisplayServer.window_set_current_screen(current_screen)
	screen_size = DisplayServer.screen_get_size()

func _on_check_button_03_pressed()->void :
	current_screen = DisplayServer.window_get_current_screen()
	screen_size = DisplayServer.screen_get_size()
	_play_sfx(3)
	Global.window_size = 2
	_check_buttons_state()
	@warning_ignore("int_as_enum_without_cast")
	DisplayServer.window_set_mode(0, 0)
	DisplayServer.window_set_size(SIZE_1920X1080)
	if screen_size != Vector2i(1920, 1080):
		DisplayServer.window_set_position(Vector2i(screen_size.x / 2 - 810, screen_size.y / 2 - 540), 0)
	else :
		DisplayServer.window_set_position(Vector2i(0, 0), 0)
	DisplayServer.window_set_current_screen(current_screen)
	screen_size = DisplayServer.screen_get_size()

func _on_check_button_04_pressed()->void :
	current_screen = DisplayServer.window_get_current_screen()
	screen_size = DisplayServer.screen_get_size()
	_play_sfx(3)
	Global.window_size = 3
	_check_buttons_state()
	@warning_ignore("int_as_enum_without_cast")
	DisplayServer.window_set_mode(3, 0)
	DisplayServer.window_set_current_screen(current_screen)
	screen_size = DisplayServer.screen_get_size()

func _on_check_button_05_pressed()->void :
	_play_sfx(3)
	Global.accessibility_option = !Global.accessibility_option
	sprite_check_01.visible = Global.accessibility_option

func _check_buttons_state()->void :
	check_button_01.disabled = Global.window_size == 0
	check_button_02.disabled = Global.window_size == 1
	check_button_03.disabled = Global.window_size == 2
	check_button_04.disabled = Global.window_size == 3
	sprite_check_02.visible = Global.window_size == 0
	sprite_check_03.visible = Global.window_size == 1
	sprite_check_04.visible = Global.window_size == 2
	sprite_check_05.visible = Global.window_size == 3
	sprite_check_01.visible = Global.accessibility_option
	sprite_check_06.visible = Global.accessibility_option_2
	sprite_check_07.visible = Global.fixed_camera
	sprite_check_08.visible = Global.small_textbox

func _set_sound_music_level()->void :
	get_parent().get_parent()._set_sound_music_level()

func set_sounds_pause()->void :
	sfx_accept.volume_db = Global.sound_level
	sfx_select.volume_db = Global.sound_level
	sfx_check.volume_db = Global.sound_level
	sfx_folder.volume_db = Global.sound_level

func _pause_animation(value: bool)->void :
	var tween = create_tween()
	tween.set_parallel(true)
	if value:
		tween.tween_property(pause_menu, "rotation_degrees", PAUSE_FOLDER_FINAL_ROT, TWEEN_TIME)
		tween.tween_property(pause_menu, "position", PAUSE_FOLDER_FINAL_POS, TWEEN_TIME)
	else :
		tween.tween_property(pause_menu, "rotation_degrees", PAUSE_FOLDER_INITIAL_ROT, TWEEN_TIME)
		tween.tween_property(pause_menu, "position", PAUSE_FOLDER_INITIAL_POS, TWEEN_TIME)
		await get_tree().create_timer(TWEEN_TIME).timeout
		pause_label.visible = true
		pause_menu.rotation_degrees = PAUSE_FOLDER_INITIAL_ROT
		pause_menu.position = PAUSE_FOLDER_INITIAL_POS
	get_tree().paused = value

@warning_ignore("unused_parameter")
func _on_circle_slider_02_drag_ended(value_changed):
	_set_sound_music_level()

func _disabled_buttons(value: bool)->void :
	continue_button.disabled = value
	menu_button.disabled = value
	quit_button.disabled = value
	check_button_01.disabled = value
	check_button_02.disabled = value
	check_button_03.disabled = value
	check_button_04.disabled = value
	check_button_05.disabled = value
	check_button_06.disabled = value
	check_button_07.disabled = value
	check_button_08.disabled = value
	options_circle_slider_01.editable = !value
	options_circle_slider_02.editable = !value

func _on_check_button_06_pressed():
	_play_sfx(3)
	Global.accessibility_option_2 = !Global.accessibility_option_2
	sprite_check_06.visible = Global.accessibility_option_2

func _on_check_button_07_pressed():
	_play_sfx(3)
	Global.fixed_camera = !Global.fixed_camera
	sprite_check_07.visible = Global.fixed_camera
	get_parent().get_parent().fixed_camera()
	if !Global.fixed_camera:
		self.position = Vector2(-100, -100)

func _on_check_button_08_pressed():
	_play_sfx(3)
	Global.small_textbox = !Global.small_textbox
	sprite_check_08.visible = Global.small_textbox
	get_parent().get_parent().small_text()
