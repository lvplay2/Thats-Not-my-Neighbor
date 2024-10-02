extends Node2D

const CAMERA_POS_X = 960
const CAMERA_POS_Y = 540
const CAMERA_MAX_X = 1150
const CAMERA_MIN_X = 780
const CAMERA_MAX_Y = 590
const CAMERA_MIN_Y = 480
const PLAY_BUTTON_ENGLISH = "Play"
const PLAY_BUTTON_SPANISH = "Jugar"
const PLAY_BUTTON_CHINESE = "玩"
const RECORD_BUTTON_ENGLISH = "Record"
const RECORD_BUTTON_SPANISH = "Registro"
const RECORD_BUTTON_CHINESE = "记录"
const OPTIONS_BUTTON_ENGLISH = "Options"
const OPTIONS_BUTTON_SPANISH = "Opciones"
const OPTIONS_BUTTON_CHINESE = "设置"
const QUIT_BUTTON_ENGLISH = "Quit"
const QUIT_BUTTON_SPANISH = "Salir"
const QUIT_BUTTON_CHINESE = "退出游戏"
const CLICK_TEXT_ENGLISH = "   Click to continue"
const CLICK_TEXT_SPANISH = "Click para continuar"
const ClICK_TEXT_CHINESE = "        点击继续"
const OPTIONS_SOUND_ENGLISH = "Sound"
const OPTIONS_SOUND_SPANISH = "Sonido"
const OPTIONS_SOUND_CHINESE = "声音"
const OPTIONS_MUSIC_ENGLISH = "Music"
const OPTIONS_MUSIC_SPANISH = "Música"
const OPTIONS_MUSIC_CHINESE = "音乐"
const OPTIONS_SIZE_ENGLISH = "Fullscreen"
const OPTIONS_SIZE_SPANISH = "Pantalla completa"
const OPTIONS_SIZE_CHINESE = "全屏"
const ENGLISH_VALUE = 0
const TEXT_TRANSPARENCY = Color(1,1,1,0)
const BUTTONS_TRANSPARENCY = Color(1,1,1,1)
const TIME_ON_TWEEN = 1.0
const BUTTONS_OUTLINE_COLOR_BLACK = Color(0,0,0,1)
const BUTTONS_OUTLINE_COLOR_SELECT = Color(1,0,0,1)
const BUTTONS_OUTLINE_COLOR_GREY = Color(0.5,0.5,0.5,1)
const LOADING_DIR = "res://Scenes/Loading_screen.tscn"
const TUTORIAL_SCENE = 3
const NIGHTMARE_MODE = 9
const RECORD_SCENE = 6
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const CIRCLE_SLIDER_01_POS_Y = 255
const CIRCLE_SLIDER_02_POS_Y = 560
const OPTIONS_FOLDER_INITIAL_POS = Vector2.ZERO
const OPTIONS_FOLDER_FINAL_POS = Vector2(-850,0)
const SIZE_960X540 = Vector2i(960, 540)
const SIZE_1280X720 = Vector2i(1280, 720)
const SIZE_1920X1080 = Vector2i(1920, 1080)
const CREDITS_ENGLISH = "Developed by Ignacio Alvarado

Engine: Godot 4

Tutorial music:

Music from #Uppbeat (free for Creators!):
 https://uppbeat.io/t/albert-behar/
dixieland-strut
 License code: 2LNDEW2CZF12MRAY

Menu music:

szegvari
Experimental Abstract Ethno Latin style 
Guitar Slow Cinematic World Modern Music - 
Mastered
89bpm" 
const CREDITS_SPANISH = "Desarrollado por Ignacio Alvarado

Motor: Godot 4

Música del tutorial:

Music from #Uppbeat (free for Creators!):
 https://uppbeat.io/t/albert-behar/
dixieland-strut
 License code: 2LNDEW2CZF12MRAY

Música del menú:

szegvari
Experimental Abstract Ethno Latin style 
Guitar Slow Cinematic World Modern Music - 
Mastered
89bpm" 
const CREDITS_CHINESE = "由Ignacio Alvarado开发

引擎： Godot 4

教程音乐：

Music from #Uppbeat (free for Creators!):
 https://uppbeat.io/t/albert-behar/
dixieland-strut
 License code: 2LNDEW2CZF12MRAY

菜单音乐：

szegvari
Experimental Abstract Ethno Latin style 
Guitar Slow Cinematic World Modern Music - 
Mastered
89bpm" 
const MIN_SLIDER_POS_X = 2290
const MAX_SLIDER_POS_X = 2716
const TEXT_FOR_SOUNDS_ENGLISH = "Text for 
sounds"
const TEXT_FOR_SOUNDS_SPANISH = "Texto para
sonidos "
const TEXT_FOR_SOUNDS_CHINESE = "重要音效的文字"
const TEXT_FOR_COLORS_ENGLISH = "Text for
colors"
const TEXT_FOR_COLORS_SPANISH = "Texto para
colores "
const TEXT_FOR_COLORS_CHINESE = "显示重要颜色的文本"
const TEXT_COLOR_HOW_TO_SPANISH = "Apagar luces
intermitentes"
const TEXT_COLOR_HOW_TO_ENGLISH = "Turn off flashing
lights"
const TEXT_COLOR_HOW_TO_CHINESE = "关闭闪烁灯"
const CREDITS_CHAR_ENGLISH = "Original characters design

By Isaac Alvarado:
*Robertsky and Albertsky Peachman

By Erick Vargas
*Mia Stone

By Jeison Abarca
*Dr. W. Afton - *Angus Ciprianni
*Francis Mosses - *Chester

By Jurgen Vargas
* Steven and Mclooy Rudboys

By Gabriela Quesada
* Anastacha Mikaelys

By Deily Quesada
* Nacha Mikaelys"
const CREDITS_CHAR_SPANISH = "Diseño original de personajes:

Por Isaac Alvarado:
*Robertsky y Albertsky Peachman

Por Erick Vargas
*Mia Stone

Por Jeison Abarca
*Dr. W. Afton - *Angus Ciprianni
*Francis Mosses - *Chester

Por Jurgen Vargas
* Steven y Mclooy Rudboys

Por Gabriela Quesada
* Anastacha Mikaelys

Por Deily Quesada
* Nacha Mikaelys"
const CREDITS_CHAR_CHINESE = "原创人物设计

Isaac Alvarado负责:
*Robertsky and Albertsky Peachman
Erick Vargas负责
*Mia Stone
Jeison Abarca负责
*Dr. W. Afton - *Angus Ciprianni
*Francis Mosses - *Chester
Jurgen Vargas负责
* Steven and Mclooy Rudboys
Gabriela Quesada负责
* Anastacha Mikaelys
Deily Quesada负责
* Nacha Mikaelys"
const LABEL_COLOR_TEXT_POS = Vector2(2434,200)
const LABEL_COLOR_TEXT_CHINESE_POS = Vector2(2500,200)
const QUIT_BUTTON_POS = Vector2(1752,599)
const QUIT_BUTTON_CHINESE_POS = Vector2(1645,569)
const QUIT_BUTTON_SIZE = Vector2(170,153)
const PLAY_BUTTON_POS = Vector2(1738,75)
const RECORD_BUTTON_POS = Vector2(1677,257)
const OPTIONS_BUTTON_POS = Vector2(1670,436)
const PLAY_BUTTON_CHINESE_POS = Vector2(1738,45)
const RECORD_BUTTON_CHINESE_POS = Vector2(1677,227)
const OPTIONS_BUTTON_CHINESE_POS = Vector2(1670,406)
const ARCADE_TITLE_SPANISH = "Modo Arcade"
const ARCADE_TITLE_ENGLISH = "Arcade Mode"
const ARCADE_TITLE_CHINESE = "街机模式"
const ARCADE_TEXT_SPANISH = "* Los doppelgangers que dejas 
entrar no te asesinan inmediatamente 
sino hasta el final de la partida.

* Obtén un rango al final de la partida 
de acuerdo a tu desempeño.

* Posibilidad de encontrar y completar el
cuestionario de Chester."
const ARCADE_TEXT_ENGLISH = "* The doppelgangers you let in don't
kill you immediately but at the end
of the run.

* Get a score rank at the end of the 
run according to your performance.

* Possibility to find and complete the
chester's quiz."
const ARCADE_TEXT_CHINESE = "* 你允许进入建筑物的伪人不会立即杀死你
但会在游戏结束时。

* 在游戏结束时
根据你的表现获得一个得分排名。

* 有可能找到并完成切斯特的问答。"
const COMING_SOON_TITLE_SPANISH = "¡El D.D.D. está trabajando 
en ello!"
const COMING_SOON_TITLE_ENGLISH = "The D.D.D. is working 
on it!"
const COMING_SOON_TITLE_CHINESE = "D.D.D. 正在努力中！"
const CONTEXT_SPANISH = "Próximamente habrá más modos 
de juego, pero puede llevar algún 
tiempo así que porfavor se paciente.

Gracias por su comprensión."
const CONTEXT_ENGLISH = "Coming soon there will be 
more game modes, but it may take 
some time so please be patient. 

Thank you for your understanding."
const CONTEXT_CHINESE = "即将推出更多游戏模式
但可能需要一些时间，请耐心等待。

感谢您的理解。"
const MENU_BUTTON_SPANISH = "Menú"
const MENU_BUTTON_ENGLISH = "Menu"
const MENU_BUTTON_CHINESE = "主菜单"
const GAME_MODES_FOLDER_INITIAL_POS = Vector2(0,-50)
const GAME_MODES_FOLDER_FINAL_POS = Vector2(-850,-50)
const FIXED_CAMERA_TEXT_SPANISH = "Cámara fija"
const FIXED_CAMERA_TEXT_ENGLISH = "Fixed camera"
const FIXED_CAMERA_TEXT_CHINESE = "固定摄像头"
const SMALL_TEXT_SPANISH = "Diálogo pequeño"
const SMALL_TEXT_ENGLISH = "Small dialog text"
const SMALL_TEXT_CHINESE = "小对话文字"
const TRIPO_TEXT_ENGLISH = "Trypophobia"
const TRIPO_TEXT_SPANISH = "Tripofobia"
const TRIPO_TEXT_CHINESE = "密集恐惧症"
const NIGHTMARE_TITLE_SPANISH = "Modo Pesadilla"
const NIGHTMARE_TITLE_ENGLISH = "Nightmare Mode"
const NIGHTMARE_TITLE_CHINESE = "噩梦模式"
const NIGHTMARE_TEXT_ENGLISH = "* Not recommended for new
players.

* The doppelgangers kill you 
immediately after you let them in.

* Wait, something if wrong with
the neighbors.

* Chester is back and it's evil."
const NIGHTMARE_TEXT_SPANISH = "* No recomendado para jugadores
nuevos.

* Los doppelgangers te
asesinan inmediatamente después de
dejarlos entrar.

* Espera, hay algo raro con los vecinos.

* Chester ha vuelto y es malvado."
const NIGHTMARE_TEXT_CHINESE = "* 不推荐给新手玩家。

* 让伪人进来后
他们立即杀死你。

* 等等，邻居们出了些问题。

* 切斯特回来了，而且是邪恶的。"
@onready var camera = $Camera
@onready var play_button = $Play
@onready var record_button = $Record
@onready var options_button = $Options
@onready var quit_button = $Quit
@onready var click_text = $Click
@onready var sfx_select = $Select
@onready var sfx_accept = $Accept
@onready var music = $Music
@onready var english_button = $Options_Folder/English
@onready var spanish_button = $Options_Folder/Spanish
@onready var sound_text = $Options_Folder/Label_Sound
@onready var music_text = $Options_Folder/Label_Music
@onready var options_postick_01 = $Options_Folder/Postick_01
@onready var options_postick_02 = $Options_Folder/Postick_02
@onready var options_postick_03 = $Options_Folder/Postick_03
@onready var options_divider_01 = $Options_Folder/Divider_01
@onready var options_divider_02 = $Options_Folder/Divider_02
@onready var options_divider_03 = $Options_Folder/Divider_03
@onready var options_divider_04 = $Options_Folder/Divider_04
@onready var options_divider_05 = $Options_Folder/Divider_05
@onready var options_slider_01 = $Options_Folder/Slider_01
@onready var options_slider_02 = $Options_Folder/Slider_02
@onready var options_circle_slider_01 = $Options_Folder/Circle_Slider_01
@onready var options_circle_slider_02 = $Options_Folder/Circle_Slider_02
@onready var options_checkboxes = $Options_Folder/Checkboxes
@onready var options_check_01 = $Options_Folder/Check_01
@onready var options_check_02 = $Options_Folder/Check_02
@onready var options_check_03 = $Options_Folder/Check_03
@onready var options_check_04 = $Options_Folder/Check_04
@onready var options_check_05 = $Options_Folder/Check_05
@onready var options_960x540 = $Options_Folder/Label_960X540
@onready var options_1280x720 = $Options_Folder/Label_1280X720
@onready var options_1920x1080 = $Options_Folder/Label_1920X1080
@onready var options_fullscreen_text = $Options_Folder/Label_Fullscreen
@onready var options_folder = $Options_Folder
@onready var options_ok = $Options_Folder/Ok
@onready var sfx_pick_up_folder = $Pick_Up_Folder
@onready var check_button_01 = $Options_Folder/Check_Button_01
@onready var check_button_02 = $Options_Folder/Check_Button_02
@onready var check_button_03 = $Options_Folder/Check_Button_03
@onready var check_button_04 = $Options_Folder/Check_Button_04
@onready var check_button_05 = $Options_Folder/Check_Button_05
@onready var sfx_check_write = $Check_Write
@onready var label_credits = $Options_Folder/Label_Credits
@onready var label_text_for_sounds = $Options_Folder/Label_Sound_Text
@onready var accessibility_checkbox = $Options_Folder/Checkbox_Accessibility
@onready var language_button = $Options_Folder/Language
@onready var sound_music_button = $Options_Folder/Sound_Music
@onready var size_button = $Options_Folder/Size
@onready var credits_button = $Options_Folder/Credits
@onready var accessibility_button = $Options_Folder/Accessibility
@onready var label_credits_2 = $Options_Folder/Label_Credits2
@onready var next = $Options_Folder/Next
@onready var next_2 = $Options_Folder/Next2
@onready var checkbox_accessibility_2 = $Options_Folder/Checkbox_Accessibility2
@onready var options_check_06 = $Options_Folder/Check_06
@onready var label_color_text = $Options_Folder/Label_Color_Text
@onready var check_button_06 = $Options_Folder/Check_Button_06
@onready var label_epilepsy = $Options_Folder/Label_epilepsy
@onready var postick_04 = $Options_Folder/Postick_04
@onready var s_chinese_button = $Options_Folder/S_Chinese
@onready var game_mode_folder = $Game_mode
@onready var game_mode_divider_01 = $Game_mode/Divider_01
@onready var game_mode_divider_02 = $Game_mode/Divider_02
@onready var game_mode_divider_03 = $Game_mode/Divider_03
@onready var game_mode_divider_04 = $Game_mode/Divider_04
@onready var game_mode_divider_05 = $Game_mode/Divider_05
@onready var arcade_button = $Game_mode/Arcade
@onready var game_mode_02_button = $Game_mode/Game_mode_02
@onready var game_mode_03_button = $Game_mode/Game_mode_03
@onready var game_mode_04_button = $Game_mode/Game_mode_04
@onready var game_mode_05_button = $Game_mode/Game_mode_05
@onready var arcade_mode = $Game_mode/Arcade_mode
@onready var arcade_mode_title = $Game_mode/Arcade_mode/Title
@onready var arcade_mode_context = $Game_mode/Arcade_mode/Context
@onready var arcade_mode_play_button = $Game_mode/Arcade_mode/Play
@onready var game_mode_02_title = $Game_mode/Next_modes/Title
@onready var game_mode_02_context = $Game_mode/Next_modes/Context
@onready var next_modes = $Game_mode/Next_modes
@onready var arcade_menu_button = $Game_mode/Arcade_mode/Menu
@onready var checkbox_fixed_camera = $Options_Folder/Checkbox_Accessibility3
@onready var checkbox_small_text = $Options_Folder/Checkbox_Accessibility4
@onready var check_button_07 = $Options_Folder/Check_Button_07
@onready var check_button_08 = $Options_Folder/Check_Button_08
@onready var options_check_07 = $Options_Folder/Check_07
@onready var options_check_08 = $Options_Folder/Check_08
@onready var label_camera_text = $Options_Folder/Label_Camera_Text
@onready var label_small_text = $Options_Folder/Label_Small_Text
@onready var checkbox_accessibility_5 = $Options_Folder/Checkbox_Accessibility5
@onready var check_button_09 = $Options_Folder/Check_Button_09
@onready var options_check_09 = $Options_Folder/Check_09
@onready var label_tripo_text = $Options_Folder/Label_Tripo_Text
@onready var nightmare_mode = $Game_mode/Nightmare_mode
@onready var nightmare_mode_title = $Game_mode/Nightmare_mode/Title
@onready var nightmare_mode_context = $Game_mode/Nightmare_mode/Context
@onready var nightmare_mode_play = $Game_mode/Nightmare_mode/Play
@onready var nightmare_mode_menu = $Game_mode/Nightmare_mode/Menu
@onready var checkbox_accessibility_6 = $Options_Folder/Checkbox_Accessibility6
@onready var check_button_10 = $Options_Folder/Check_Button_10
@onready var options_check_10 = $Options_Folder/Check_10

var mouse_position
var click_flag = true
var screen_size 
var current_screen
var flag_slider_01_moving = false
var flag_slider_02_moving = false
var already_load = false

func _ready() -> void:
	Global.reset_values()
	if !already_load:
		Global.load_record()
		Global.load_achievements()
		already_load = true
	_fixed_camera()
	click_flag = true
	flag_slider_01_moving = false
	flag_slider_02_moving = false
	current_screen = DisplayServer.window_get_current_screen()
	screen_size = DisplayServer.screen_get_size()
	camera.position = Vector2(CAMERA_POS_X,CAMERA_POS_Y) 
	options_circle_slider_01.value = _lineal_inverse_slider_value(Global.sound_level)
	options_circle_slider_02.value = _lineal_inverse_slider_value(Global.music_level)
	_set_language()
	_set_sound_music_level()
	music.play()

func _set_sound_music_level() -> void:
	sfx_accept.volume_db = Global.sound_level
	sfx_select.volume_db = Global.sound_level
	sfx_check_write.volume_db = Global.sound_level
	sfx_pick_up_folder.volume_db = Global.sound_level
	music.volume_db = Global.music_level

func _process(_delta) -> void:
	music.volume_db = Global.music_level
	_camera_movement()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and click_flag:
		click_flag = false
		sfx_accept.play()
		play_button.disabled = false
		record_button.disabled = false
		options_button.disabled = false
		quit_button.disabled = false
		var tween = create_tween()
		tween.set_parallel(true) # Para que ocurra al mismo tiempo
		tween.tween_property(click_text,"modulate",TEXT_TRANSPARENCY,TIME_ON_TWEEN)
		tween.tween_property(play_button,"modulate",BUTTONS_TRANSPARENCY,TIME_ON_TWEEN)
		tween.tween_property(record_button,"modulate",BUTTONS_TRANSPARENCY,TIME_ON_TWEEN)
		tween.tween_property(options_button,"modulate",BUTTONS_TRANSPARENCY,TIME_ON_TWEEN)
		tween.tween_property(quit_button,"modulate",BUTTONS_TRANSPARENCY,TIME_ON_TWEEN)
		tween.tween_callback(_set_click_text_visible).set_delay(TIME_ON_TWEEN) # Ejecutar luego de 1 segundo

func _camera_movement() -> void:
	if !Global.fixed_camera:
		mouse_position = get_viewport().get_mouse_position()
		camera.position.x = clamp(mouse_position.x,CAMERA_MIN_X,CAMERA_MAX_X)
		camera.position.y = clamp(mouse_position.y,CAMERA_MIN_Y,CAMERA_MAX_Y)

func _set_language() -> void:
	if Global.language == ENGLISH_VALUE:
		label_color_text.position = LABEL_COLOR_TEXT_POS
		play_button.position = PLAY_BUTTON_POS
		record_button.position = RECORD_BUTTON_POS
		options_button.position = OPTIONS_BUTTON_POS
		play_button.text = PLAY_BUTTON_ENGLISH
		record_button.text = RECORD_BUTTON_ENGLISH
		options_button.text = OPTIONS_BUTTON_ENGLISH
		quit_button.text = ""
		quit_button.text = QUIT_BUTTON_ENGLISH
		quit_button.position = QUIT_BUTTON_POS
		quit_button.size = QUIT_BUTTON_SIZE
		click_text.text = CLICK_TEXT_ENGLISH
		sound_text.text = OPTIONS_SOUND_ENGLISH
		music_text.text = OPTIONS_MUSIC_ENGLISH
		options_fullscreen_text.text = OPTIONS_SIZE_ENGLISH
		label_credits.text = CREDITS_ENGLISH
		label_text_for_sounds.text = TEXT_FOR_SOUNDS_ENGLISH
		english_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_SELECT)
		spanish_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
		s_chinese_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
		label_credits_2.text = CREDITS_CHAR_ENGLISH
		label_color_text.text = TEXT_FOR_COLORS_ENGLISH
		label_epilepsy.text = TEXT_COLOR_HOW_TO_ENGLISH
		arcade_mode_title.text = ARCADE_TITLE_ENGLISH
		arcade_mode_context.text = ARCADE_TEXT_ENGLISH
		game_mode_02_title.text = COMING_SOON_TITLE_ENGLISH
		game_mode_02_context.text = CONTEXT_ENGLISH
		arcade_mode_play_button.text = PLAY_BUTTON_ENGLISH
		arcade_menu_button.text = MENU_BUTTON_ENGLISH
		label_camera_text.text = FIXED_CAMERA_TEXT_ENGLISH
		label_small_text.text = SMALL_TEXT_ENGLISH
		label_tripo_text.text = TRIPO_TEXT_ENGLISH
		nightmare_mode_context.text = NIGHTMARE_TEXT_ENGLISH
		nightmare_mode_title.text = NIGHTMARE_TITLE_ENGLISH
		nightmare_mode_menu.text = MENU_BUTTON_ENGLISH
		nightmare_mode_play.text = PLAY_BUTTON_ENGLISH
	elif Global.language == SPANISH_VALUE:
		label_color_text.position = LABEL_COLOR_TEXT_POS
		play_button.position = PLAY_BUTTON_POS
		record_button.position = RECORD_BUTTON_POS
		options_button.position = OPTIONS_BUTTON_POS
		play_button.text = PLAY_BUTTON_SPANISH
		record_button.text = RECORD_BUTTON_SPANISH
		options_button.text = OPTIONS_BUTTON_SPANISH
		quit_button.text = QUIT_BUTTON_SPANISH
		quit_button.position = QUIT_BUTTON_POS
		quit_button.size = QUIT_BUTTON_SIZE
		click_text.text = CLICK_TEXT_SPANISH
		sound_text.text = OPTIONS_SOUND_SPANISH
		music_text.text = OPTIONS_MUSIC_SPANISH
		options_fullscreen_text.text = OPTIONS_SIZE_SPANISH
		label_credits.text = CREDITS_SPANISH
		label_text_for_sounds.text = TEXT_FOR_SOUNDS_SPANISH
		spanish_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_SELECT)
		english_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
		s_chinese_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
		label_credits_2.text = CREDITS_CHAR_SPANISH
		label_color_text.text = TEXT_FOR_COLORS_SPANISH
		label_epilepsy.text = TEXT_COLOR_HOW_TO_SPANISH
		arcade_mode_title.text = ARCADE_TITLE_SPANISH
		arcade_mode_context.text = ARCADE_TEXT_SPANISH
		game_mode_02_title.text = COMING_SOON_TITLE_SPANISH
		game_mode_02_context.text = CONTEXT_SPANISH
		arcade_mode_play_button.text = PLAY_BUTTON_SPANISH
		arcade_menu_button.text = MENU_BUTTON_SPANISH
		label_camera_text.text = FIXED_CAMERA_TEXT_SPANISH
		label_small_text.text = SMALL_TEXT_SPANISH
		label_tripo_text.text = TRIPO_TEXT_SPANISH
		nightmare_mode_context.text = NIGHTMARE_TEXT_SPANISH
		nightmare_mode_title.text = NIGHTMARE_TITLE_SPANISH
		nightmare_mode_menu.text = MENU_BUTTON_SPANISH
		nightmare_mode_play.text = PLAY_BUTTON_SPANISH
	elif Global.language == CHINESE_VALUE:
		label_color_text.position = LABEL_COLOR_TEXT_CHINESE_POS
		play_button.position = PLAY_BUTTON_CHINESE_POS
		record_button.position = RECORD_BUTTON_CHINESE_POS
		options_button.position = OPTIONS_BUTTON_CHINESE_POS
		play_button.text = PLAY_BUTTON_CHINESE
		record_button.text = RECORD_BUTTON_CHINESE
		options_button.text = OPTIONS_BUTTON_CHINESE
		quit_button.text = QUIT_BUTTON_CHINESE
		quit_button.position = QUIT_BUTTON_CHINESE_POS
		click_text.text = ClICK_TEXT_CHINESE
		sound_text.text = OPTIONS_SOUND_CHINESE
		music_text.text = OPTIONS_MUSIC_CHINESE
		options_fullscreen_text.text = OPTIONS_SIZE_CHINESE
		label_credits.text = CREDITS_CHINESE
		label_text_for_sounds.text = TEXT_FOR_SOUNDS_CHINESE
		s_chinese_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_SELECT)
		english_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
		spanish_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
		label_credits_2.text = CREDITS_CHAR_CHINESE
		label_color_text.text = TEXT_FOR_COLORS_CHINESE
		label_epilepsy.text = TEXT_COLOR_HOW_TO_CHINESE
		arcade_mode_title.text = ARCADE_TITLE_CHINESE
		arcade_mode_context.text = ARCADE_TEXT_CHINESE
		game_mode_02_title.text = COMING_SOON_TITLE_CHINESE
		game_mode_02_context.text = CONTEXT_CHINESE
		arcade_mode_play_button.text = PLAY_BUTTON_CHINESE
		arcade_menu_button.text = MENU_BUTTON_CHINESE
		label_camera_text.text = FIXED_CAMERA_TEXT_CHINESE
		label_small_text.text = SMALL_TEXT_CHINESE
		label_tripo_text.text = TRIPO_TEXT_CHINESE
		nightmare_mode_context.text = NIGHTMARE_TEXT_CHINESE
		nightmare_mode_title.text = NIGHTMARE_TITLE_CHINESE
		nightmare_mode_menu.text = MENU_BUTTON_CHINESE
		nightmare_mode_play.text = PLAY_BUTTON_CHINESE

func _set_click_text_visible() -> void:
	click_text.visible = false

func _on_play_mouse_entered() -> void:
	if !play_button.disabled:
		_play_sfx(0)
	play_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_play_mouse_exited() -> void:
	play_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_record_mouse_entered() -> void:
	if !record_button.disabled:
		_play_sfx(0)
	record_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_record_mouse_exited() -> void:
	record_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_options_mouse_entered() -> void:
	if !options_button.disabled:
		_play_sfx(0)
	options_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_options_mouse_exited() -> void:
	options_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_quit_mouse_entered() -> void:
	if !quit_button.disabled:
		_play_sfx(0)
	quit_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_quit_mouse_exited() -> void:
	quit_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_quit_pressed() -> void:
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_play_pressed() -> void:
	_play_sfx(1)
	_disable_menu(true)
	_play_sfx(2)
	var tween = create_tween()
	tween.tween_property(game_mode_folder,"position",GAME_MODES_FOLDER_FINAL_POS,TIME_ON_TWEEN)
	tween.tween_callback(_game_mode_open)

func _game_mode_open() -> void:
	await get_tree().create_timer(0.1).timeout
	arcade_mode_play_button.disabled = false
	arcade_menu_button.disabled = false
	nightmare_mode_play.disabled = false
	nightmare_mode_menu.disabled = false
	arcade_button.disabled = false
	game_mode_02_button.disabled = false
	game_mode_03_button.disabled = false
	game_mode_04_button.disabled = false
	game_mode_05_button.disabled = false

func _play_sfx(n:int) -> void:
	match n:
		0:
			sfx_select.play()
		1:
			sfx_accept.play()
		2:
			sfx_pick_up_folder.play()
		3:
			sfx_check_write.play()
		_:
			pass

func _on_english_pressed() -> void:
	_play_sfx(1)
	Global.language = ENGLISH_VALUE
	english_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_SELECT)
	spanish_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
	s_chinese_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
	_set_language()

func _on_english_mouse_entered() -> void:
	if !english_button.disabled:
		_play_sfx(0)
		english_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_english_mouse_exited() -> void:
	if Global.language == ENGLISH_VALUE:
		english_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_SELECT)
	else:
		english_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_spanish_pressed() -> void:
	_play_sfx(1)
	Global.language = SPANISH_VALUE 
	spanish_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_SELECT)
	english_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
	s_chinese_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
	_set_language()

func _on_spanish_mouse_entered() -> void:
	if !spanish_button.disabled:
		_play_sfx(0)
		spanish_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_spanish_mouse_exited() -> void:
	if Global.language == SPANISH_VALUE:
		spanish_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_SELECT)
	else:
		spanish_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_options_pressed() -> void:
	_play_sfx(1)
	_disable_menu(true)
	_play_sfx(2)
	var tween = create_tween()
	tween.tween_property(options_folder,"position",OPTIONS_FOLDER_FINAL_POS,TIME_ON_TWEEN)
	await get_tree().create_timer(TIME_ON_TWEEN+0.1).timeout
	english_button.disabled = false
	spanish_button.disabled = false
	s_chinese_button.disabled = false
	_disable_options(false)

func _disable_menu(value:bool) -> void:
	play_button.disabled = value
	record_button.disabled = value 
	options_button.disabled = value
	quit_button.disabled = value

func _disable_options(value:bool) -> void:
	options_circle_slider_01.editable = value
	options_circle_slider_02.editable = value
	check_button_01.disabled = value
	check_button_02.disabled = value
	check_button_03.disabled = value
	check_button_04.disabled = value
	check_button_05.disabled = value
	check_button_06.disabled = value
	check_button_07.disabled = value
	check_button_08.disabled = value
	check_button_09.disabled = value
	options_ok.disabled = value
	language_button.disabled = value
	sound_music_button.disabled = value
	size_button.disabled = value
	credits_button.disabled = value
	accessibility_button.disabled = value
	next.disabled = value
	next_2.disabled =value

func _on_ok_mouse_entered() -> void:
	_play_sfx(0)
	options_ok.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_ok_mouse_exited() -> void:
	options_ok.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_ok_pressed() -> void:
	_play_sfx(1)
	Global.save_settings()
	english_button.disabled = true
	spanish_button.disabled = true
	s_chinese_button.disabled = true
	next.disabled = true
	next_2.disabled = true
	_disable_options(true)
	_play_sfx(2)
	var tween = create_tween()
	tween.tween_property(options_folder,"position",OPTIONS_FOLDER_INITIAL_POS,TIME_ON_TWEEN)
	await get_tree().create_timer(TIME_ON_TWEEN+0.1).timeout
	_disable_menu(false)

func _set_language_options(value:bool) -> void:
	options_postick_01.visible = value
	postick_04.visible = value
	options_divider_01.visible = !value
	english_button.visible = value
	english_button.disabled = !value
	spanish_button.visible = value
	spanish_button.disabled = !value
	s_chinese_button.visible = value
	s_chinese_button.disabled = !value

func _set_sounds_options(value:bool) -> void:
	options_postick_02.visible = value
	options_divider_02.visible = !value
	options_slider_01.visible = value
	options_slider_02.visible = value
	options_circle_slider_01.visible = value
	options_circle_slider_01.editable = value
	options_circle_slider_02.visible = value
	options_circle_slider_02.editable = value
	sound_text.visible = value
	music_text.visible = value

func _set_size_options(value:bool) -> void:
	options_divider_03.visible = !value
	options_checkboxes.visible = value
	check_button_01.visible = value
	check_button_02.visible = value
	check_button_03.visible = value
	check_button_04.visible = value
	options_960x540.visible = value
	options_1280x720.visible = value
	options_1920x1080.visible = value
	options_fullscreen_text.visible = value

func _set_accessibility_options(value:bool) -> void:
	options_divider_05.visible = !value
	accessibility_checkbox.visible = value
	label_text_for_sounds.visible = value
	label_tripo_text.visible = value
	check_button_05.visible = value
	check_button_05.disabled = !value
	checkbox_accessibility_2.visible = value
	checkbox_accessibility_5.visible = value
	label_color_text.visible = value
	label_epilepsy.visible = value
	label_camera_text.visible = value
	label_small_text.visible = value
	check_button_06.visible = value
	check_button_06.disabled = !value
	check_button_07.visible = value
	check_button_07.disabled = !value
	check_button_08.visible = value
	check_button_08.disabled = !value
	check_button_09.visible = value
	check_button_09.disabled = !value
	check_button_10.visible = value
	check_button_10.disabled = !value
	checkbox_fixed_camera.visible = value
	checkbox_small_text.visible = value
	checkbox_accessibility_6.visible = value

func _set_credits_options(value:bool) -> void:
	options_postick_03.visible = value
	options_divider_04.visible = !value
	label_credits.visible = value
	next.visible = value
	if value:
		label_credits_2.visible = !value
		next_2.visible = !value
	else:
		label_credits_2.visible = value
		next_2.visible = value

func _on_language_pressed() -> void:
	_play_sfx(2)
	_set_checks_off()
	_set_language_options(true)
	_set_sounds_options(false)
	_set_size_options(false)
	_set_accessibility_options(false)
	_set_credits_options(false)

func _on_sound_music_pressed() -> void:
	_play_sfx(2)
	_set_checks_off()
	_set_language_options(false)
	_set_sounds_options(true)
	_set_size_options(false)
	_set_accessibility_options(false)
	_set_credits_options(false)

func _on_size_pressed() -> void:
	_play_sfx(2)
	_set_checks_off()
	_check_buttons_state()
	_set_language_options(false)
	_set_sounds_options(false)
	_set_size_options(true)
	_set_accessibility_options(false)
	_set_credits_options(false)

func _on_accessibility_pressed():
	_play_sfx(2)
	_set_checks_off()
	options_check_05.visible = Global.accessibility_option
	options_check_06.visible = Global.accessibility_option_2
	options_check_07.visible = Global.fixed_camera
	options_check_08.visible = Global.small_textbox
	options_check_09.visible = Global.tripo
	options_check_10.visible = Global.epilepsy
	_set_language_options(false)
	_set_sounds_options(false)
	_set_size_options(false)
	_set_accessibility_options(true)
	_set_credits_options(false)

func _on_credits_pressed():
	_play_sfx(2)
	_set_checks_off()
	_set_language_options(false)
	_set_sounds_options(false)
	_set_size_options(false)
	_set_accessibility_options(false)
	_set_credits_options(true)

func _set_checks_off() -> void:
	options_check_01.visible = false
	options_check_02.visible = false
	options_check_03.visible = false
	options_check_04.visible = false
	options_check_05.visible = false
	options_check_06.visible = false
	options_check_07.visible = false
	options_check_08.visible = false
	options_check_09.visible = false
	options_check_10.visible = false

func _on_check_button_04_pressed() -> void:
	current_screen = DisplayServer.window_get_current_screen()
	screen_size = DisplayServer.screen_get_size()
	_play_sfx(3)
	Global.window_size = 3
	_check_buttons_state()
	@warning_ignore("int_as_enum_without_cast")
	DisplayServer.window_set_mode(3,0)
	DisplayServer.window_set_current_screen(current_screen)
	screen_size = DisplayServer.screen_get_size()

func _on_check_button_03_pressed() -> void:
	current_screen = DisplayServer.window_get_current_screen()
	screen_size = DisplayServer.screen_get_size()
	_play_sfx(3)
	Global.window_size = 2
	_check_buttons_state()
	@warning_ignore("int_as_enum_without_cast")
	DisplayServer.window_set_mode(0,0)
	DisplayServer.window_set_size(SIZE_1920X1080)
	if screen_size != Vector2i(1920,1080):
		DisplayServer.window_set_position(Vector2i(screen_size.x/2-810,screen_size.y/2-540),0)
	else:
		DisplayServer.window_set_position(Vector2i(0,0),0)
	DisplayServer.window_set_current_screen(current_screen)
	screen_size = DisplayServer.screen_get_size()

func _on_check_button_02_pressed() -> void:
	current_screen = DisplayServer.window_get_current_screen()
	screen_size = DisplayServer.screen_get_size()
	_play_sfx(3)
	Global.window_size = 1
	_check_buttons_state()
	@warning_ignore("int_as_enum_without_cast")
	DisplayServer.window_set_mode(0,0)
	DisplayServer.window_set_size(SIZE_1280X720)
	if screen_size != Vector2i(1280,720):
		DisplayServer.window_set_position(Vector2i(screen_size.x/2-640,screen_size.y/2-360),0)
	else:
		DisplayServer.window_set_position(Vector2i(0,0),0)
	DisplayServer.window_set_current_screen(current_screen)
	screen_size = DisplayServer.screen_get_size()

func _on_check_button_01_pressed() -> void:
	current_screen = DisplayServer.window_get_current_screen()
	screen_size = DisplayServer.screen_get_size()
	_play_sfx(3)
	Global.window_size = 0
	_check_buttons_state()
	@warning_ignore("int_as_enum_without_cast")
	DisplayServer.window_set_mode(0,0)
	DisplayServer.window_set_size(SIZE_960X540)
	if screen_size != Vector2i(960,540):
		DisplayServer.window_set_position(Vector2i(screen_size.x/2-480,screen_size.y/2-270),0)
	else:
		DisplayServer.window_set_position(Vector2i(0,0),0)
	DisplayServer.window_set_current_screen(current_screen)
	screen_size = DisplayServer.screen_get_size()

func _check_buttons_state() -> void:
	check_button_01.disabled = Global.window_size == 0
	check_button_02.disabled = Global.window_size == 1
	check_button_03.disabled = Global.window_size == 2
	check_button_04.disabled = Global.window_size == 3
	options_check_01.visible = Global.window_size == 0
	options_check_02.visible = Global.window_size == 1
	options_check_03.visible = Global.window_size == 2
	options_check_04.visible = Global.window_size == 3

func _on_circle_slider_02_value_changed(value) -> void:
	Global.music_level = _lineal_value_slider(value)

@warning_ignore("unused_parameter")
func _on_circle_slider_01_drag_ended(value_changed) -> void:
	_set_sound_music_level()
	_play_sfx(1)

func _on_circle_slider_01_value_changed(value) -> void:
	Global.sound_level = _lineal_value_slider(value)

func _on_check_button_05_pressed() -> void:
	_play_sfx(3)
	Global.accessibility_option = !Global.accessibility_option
	options_check_05.visible = Global.accessibility_option

func _lineal_value_slider(value):
	if value == 0:
		return -80
	else:
		return 2*value/5 - 20

func _lineal_inverse_slider_value(value):
	if value == -80:
		return 0
	else:
		return 5*(value + 20)/2

func _on_next_pressed() -> void:
	_play_sfx(2)
	next.visible = false
	next_2.visible = true
	label_credits.visible = false
	label_credits_2.visible = true

func _on_next_2_pressed() -> void:
	_play_sfx(2)
	next.visible = true
	next_2.visible = false
	label_credits.visible = true
	label_credits_2.visible = false

func _on_record_pressed() -> void:
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	Global.scene = RECORD_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_check_button_06_pressed() -> void:
	_play_sfx(3)
	Global.accessibility_option_2 = !Global.accessibility_option_2
	options_check_06.visible = Global.accessibility_option_2

func _on_s_chinese_pressed() -> void:
	_play_sfx(1)
	Global.language = CHINESE_VALUE
	s_chinese_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_SELECT)
	english_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
	spanish_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
	_set_language()

func _on_s_chinese_mouse_entered() -> void:
	if !s_chinese_button.disabled:
		_play_sfx(0)
		s_chinese_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_s_chinese_mouse_exited() -> void:
	if Global.language == CHINESE_VALUE:
		s_chinese_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_SELECT)
	else:
		s_chinese_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_arcade_pressed() -> void:
	_play_sfx(2)
	arcade_mode.visible = true
	next_modes.visible = false
	nightmare_mode.visible = false
	game_mode_divider_01.visible = false
	game_mode_divider_02.visible = true
	game_mode_divider_03.visible = true
	game_mode_divider_04.visible = true
	game_mode_divider_05.visible = true

func _on_game_mode_02_pressed() -> void:
	_play_sfx(2)
	arcade_mode.visible = false
	nightmare_mode.visible = true
	next_modes.visible = false
	game_mode_divider_01.visible = true
	game_mode_divider_02.visible = false
	game_mode_divider_03.visible = true
	game_mode_divider_04.visible = true
	game_mode_divider_05.visible = true

func _on_game_mode_03_pressed() -> void:
	_play_sfx(2)
	arcade_mode.visible = false
	nightmare_mode.visible = false
	next_modes.visible = true
	game_mode_divider_01.visible = true
	game_mode_divider_02.visible = true
	game_mode_divider_03.visible = false
	game_mode_divider_04.visible = true
	game_mode_divider_05.visible = true

func _on_game_mode_04_pressed() -> void:
	_play_sfx(2)
	arcade_mode.visible = false
	nightmare_mode.visible = false
	next_modes.visible = true
	game_mode_divider_01.visible = true
	game_mode_divider_02.visible = true
	game_mode_divider_03.visible = true
	game_mode_divider_04.visible = false
	game_mode_divider_05.visible = true

func _on_game_mode_05_pressed() -> void:
	_play_sfx(2)
	arcade_mode.visible = false
	nightmare_mode.visible = false
	next_modes.visible = true
	game_mode_divider_01.visible = true
	game_mode_divider_02.visible = true
	game_mode_divider_03.visible = true
	game_mode_divider_04.visible = true
	game_mode_divider_05.visible = false

func _on_play_arcade_pressed() -> void:
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	Global.scene = TUTORIAL_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_play_arcade_mouse_entered() -> void:
	if !arcade_mode_play_button.disabled:
		_play_sfx(0)
	arcade_mode_play_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_play_arcade_mouse_exited() -> void:
	arcade_mode_play_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_menu_arcade_pressed() -> void:
	_play_sfx(1)
	arcade_mode_play_button.disabled = true
	arcade_menu_button.disabled = true
	arcade_button.disabled = true
	nightmare_mode_play.disabled = true
	nightmare_mode_menu.disabled = true
	game_mode_02_button.disabled = true
	game_mode_03_button.disabled = true
	game_mode_04_button.disabled = true
	game_mode_05_button.disabled = true
	_play_sfx(2)
	var tween = create_tween()
	tween.tween_property(game_mode_folder,"position",GAME_MODES_FOLDER_INITIAL_POS,TIME_ON_TWEEN)
	await get_tree().create_timer(TIME_ON_TWEEN+0.1).timeout
	_disable_menu(false)

func _on_menu_aracde_mouse_entered() -> void:
	if !arcade_menu_button.disabled or !nightmare_mode_menu.disabled:
		_play_sfx(0)
	arcade_menu_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)
	nightmare_mode_menu.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_menu_arcade_mouse_exited() -> void:
	arcade_menu_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
	nightmare_mode_menu.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_check_button_07_pressed() -> void:
	_play_sfx(3)
	Global.fixed_camera = !Global.fixed_camera
	options_check_07.visible = Global.fixed_camera
	_fixed_camera()

func _on_check_button_08_pressed() -> void:
	_play_sfx(3)
	Global.small_textbox = !Global.small_textbox
	options_check_08.visible = Global.small_textbox

func _fixed_camera() -> void:
	if Global.fixed_camera:
		self.scale = Vector2(0.84,0.9)
		camera.position = Vector2(960,540)
	else:
		self.scale = Vector2(1,1)

func _on_check_button_09_pressed():
	_play_sfx(3)
	Global.tripo = !Global.tripo
	options_check_09.visible = Global.tripo

func _on_nightmare_play_pressed():
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	Global.scene = NIGHTMARE_MODE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_nightmare_play_mouse_entered():
	if !nightmare_mode_play.disabled:
		_play_sfx(0)
	nightmare_mode_play.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_nightmare_play_mouse_exited():
	nightmare_mode_play.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_check_button_10_pressed():
	_play_sfx(3)
	Global.epilepsy = !Global.epilepsy
	options_check_10.visible = Global.epilepsy
