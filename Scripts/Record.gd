extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const MENU_SCENE = 2
const LOADING_DIR = "res://Scenes/Loading_screen.tscn"
const BUTTONS_OUTLINE_COLOR_BLACK = Color(0,0,0,1)
const BUTTONS_OUTLINE_COLOR_SELECT = Color(1,0,0,1)
const BUTTONS_OUTLINE_COLOR_GREY = Color(0.5,0.5,0.5,1)
const RECORD_TITLE_SPANISH = "Registro"
const RECORD_TITLE_ENGLISH = "Record"
const RECORD_TITLE_CHINESE = "记录"
const DOPPELS_CAPTURED_SPANISH = "Doppels capturados: "
const DOPPELS_CAPTURED_ENGLISH = "Captured doppels: "
const DOPPELS_CAPTURED_CHINESE = "捕获的假人:"
const DOPPELS_lET_IN_SPANISH = "Doppels que ingresaron: "
const DOPPELS_lET_IN_ENGLISH = "Doppels you allow in: "
const DOPPELS_lET_IN_CHINESE = "你允许的假人:"
const NEIGHBORS_KILLED_SPANISH = "Vecinos eliminados: "
const NEIGHBORS_KILLED_ENGLISH = "Neighbors killed: "
const NEIGHBORS_KILLED_CHINESE = "邻居被杀:"
const TIMES_KILLED_SPANISH = "Veces asesinado: "
const TIMES_KILLED_ENGLISH = "Times killed: "
const TIMES_KILLED_CHINESE = "被杀次数"
const TIMES_SURVIVED_SPANISH = "Veces que sobreviviste: "
const TIMES_SURVIVED_ENGLISH = "Times you survived: "
const TIMES_SURVIVED_CHINESE = "你幸存的次数:"
const MENU_BUTTON_SPANISH = "Menú"
const MENU_BUTTON_ENGLISH = "Menu"
const MENU_BUTTON_CHINESE = "主菜单"
const QUIT_BUTTON_SPANISH = "Salir"
const QUIT_BUTTON_ENGLISH = "Quit"
const QUIT_BUTTON_CHINESE = "退出游戏"
const ACHIEVEMENTS_BUITTON_SPANISH = "Logros"
const ACHIEVEMENTS_BUITTON_ENGLISH = "Achievements"
const ACHIEVEMENTS_BUITTON_CHINESE = "成就"
const RANKS_SPANISH = "Rangos"
const RANKS_ENGLISH = "Ranks"
const RANKS_CHINESE = "等级"
const TIME_ON_TWEEN = 1.0
const FOLDER_INTIAL_POS = Vector2(40,1060)
const FOLDER_FINIAL_POS = Vector2(40,-20)
const RANK_S_TEXT_SPANISH = "MEJOR QUE HENRY
Consigue rango S en una partida."
const RANK_S_TEXT_ENGLISH = "BETTER THAN HENRY
Get S rank on one playthrough."
const RANK_S_TEXT_CHINESE = "比亨利更好
在一局比赛中获得S级别。"
const KILL_TEXT_SPANISH = "ACCIDENTE LABORAL
Elimina a un vecino."
const KILL_TEXT_ENGLISH = "WORK ACCIDENT
Kill one neighbor."
const KILL_TEXT_CHINESE = "工伤
杀死邻居。"
const BE_KILL_TEXT_SPANISH = "COMIDA DE DOPPELGANGERS
Se asesinado."
const BE_KILL_TEXT_ENGLISH = "DOPPELGANGERS FOOD
Be murdered." 
const BE_KILL_TEXT_CHINESE = "假人的食物
被假人杀死了。"
const CATCH_TEXT_SPANISH = "CAZADOR
Captura 100 doppelgangers."
const CATCH_TEXT_ENGLISH = "HUNTER
Capture 100 doppelgangers." 
const CATCH_TEXT_CHINESE = "猎人
捕获100个假人。"
const ALIVE_TEXT_SPANISH = "¡ESTOY VIVO!
Termina una partida vivo."
const ALIVE_TEXT_ENGLISH = "I'M ALIVE!
Finish one playthrough alive." 
const ALIVE_TEXT_CHINESE = "我还活着！
在游戏结束时活着。" 
const NO_FOLDER_TEXT_SPANISH = "MEMORIA DE ACERO
Sobrevive sin abrir ninguna carpeta."
const NO_FOLDER_TEXT_ENGLISH = "STEEL MEMORY
Survive without opening any folder."
const NO_FOLDER_TEXT_CHINESE = "钢铁记忆
在不打开任何文件夹的情况下生存。"
const CHESTER_TEXT_SPANISH = "EL MEJOR DE LA CLASE
Completa el cuestionario de Chester."
const CHESTER_TEXT_ENGLISH = "THE BEST IN THE CLASS
Complete Chester's quiz."
const CHESTER_TEXT_CHINESE = "班里最好的
完成切斯特的问卷。"
const UNLIKELY_TEXT_SPANISH = "UNLIKELY
Conoce al payaso."
const UNLIKELY_TEXT_ENGLISH = "UNLIKELY
Meet the clown."
const UNLIKELY_TEXT_CHINESE = "UNLIKELY
见到小丑。"
const DAYS_40_TEXT_SPANISH = "CUARENTENA
Sobrevive 40 partidas."
const DAYS_40_TEXT_ENGLISH = "QUARANTINE
Survive 40 playthroughs."
const DAYS_40_TEXT_CHINESE = "隔离
生存40场比赛。"
const F_RANK_TEXT_SPANISH = "PEOR QUE HENRY
Consigue rango F en una partida."
const F_RANK_TEXT_ENGLISH = "WORSE THAN HENRY
Get F rank on one playthrough."
const F_RANK_TEXT_CHINESE = "比亨利更糟
在一场比赛中获得F级别。"
const DAY_100_TEXT_SPANISH = "EMPLEADO DEL MES
Completa 100 partidas."
const DAY_100_TEXT_ENGLISH = "EMPLOYEE OF THE MONTH
Complete 100 playthroughs." 
const DAY_100_TEXT_CHINESE = "月度员工
完成100场比赛。"
const DOPPEL_TEXT_SPANISH = "¡TE ATRAPÉ!
Descrube a un doppelganger en el acto."
const DOPPEL_TEXT_ENGLISH = "CATCH YOU!
Catch a doppelganger red-handed."
const DOPPEL_TEXT_CHINESE = "我抓到你了！
当场抓住一个假人。"
const SECRET_TEXT_SPANISH = "MENTE ABIERTA
Descubre el secreto del universo."
const SECRET_TEXT_ENGLISH = "OPEN MIND
Discover the secret of the universe."
const SECRET_TEXT_CHINESE = "开放的心态
发现宇宙的秘密。"
const PEACH_TEXT_SPANISH = "PEACHES PEACHES
Conoce al doppelganger peach."
const PEACH_TEXT_ENGLISH = "PEACHES PEACHES
Meet the (peach) doppelganger."
const PEACH_TEXT_CHINESE = "PEACHES PEACHES
来认识一下假人（Peach）。"
const ALL_TEXT_SPANISH = "COLECCIONISTA
Desbloquea todos los logros."
const ALL_TEXT_ENGLISH = "COLLECTOR
Unlock all the achievements."
const ALL_TEXT_CHINESE = "收藏家
解锁所有成就。"
const DDD_SECRET_SPANISH = "ABRE TUS OJOS
Descubre un secreto del D.D.D.
"
const DDD_SECRET_ENGLISH = "OPEN YOUR EYES
Discover a secret of the D.D.D."
const DDD_SECRET_CHINESE= "睁开你的眼睛
发现 D.D.D. 的一个秘密"
const SHARE_TEXT_SPANISH = "COMPARTE EL SECRETO
Recibe a \"42\" como VIP."
const SHARE_TEXT_ENGLISH = "SHARE THE SECRET
Welcome \"42\" as a VIP."
const SHARE_TEXT_CHINESE = "分享这个秘密
欢迎 \"42\" 贵宾。"
const PEACH_VISITOR_TEXT_SPANISH = "PEACHING
Recibe a peach como VIP."
const PEACH_VISITOR_TEXT_ENGLISH = "PEACHING
Welcome peach as VIP."
const PEACH_VISITOR_TEXT_CHINESE = "PEACHING
欢迎peach贵宾。"
const IN_MY_RESTLESS_DREAMS_SPANISH = "EN MIS SUEÑOS MÁS INQUIETOS
Recibe a la enfermera como VIP."
const IN_MY_RESTLESS_DREAMS_ENGLISH = "IN MY RESTLESS DREAMS
Welcome the nurse as a VIP."
const IN_MY_RESTLESS_DREAMS_CHINESE = "在我最不安的梦中
欢迎护士作为贵宾。"
const NIGHMARE_TEXT_SPANISH = "¡DESPIERTA!
Sobrevive el modo pesadilla."
const NIGHMARE_TEXT_ENGLISH = "WAKE UP!
Survive the nightmare mode."
const NIGHMARE_TEXT_CHINESE = "醒来
完成噩梦模式。"
const EVIL_CHESTER_SPANISH = "MENTE PRODIGIOSA
Completa el quiz de Chester malvado."
const EVIL_CHESTER_ENGLISH = "PRODIGIOUS MIND
Complete the Evil Chester's quiz."
const EVIL_CHESTER_CHINESE = "天才的头脑
完成邪恶的切斯特问卷。"
const HAUNTED_SPANISH = "¡BOO!
Conoce al fantasma de la máscara."
const HAUNTED_ENGLISH = "BOO!
Get haunted by the mask ghost."
const HAUNTED_CHINESE = "咻！
被面具鬼缠身。"
const ENTITY_SPANISH = "DOLOR DE CABEZA
Se asesinado por la entidad."
const ENTITY_ENGLISH = "HEADACHE
Be murdered by the entity."
const ENTITY_CHINESE = "头痛
被实体谋杀。"
const TOTAL_ACHIEVEMENTS = 22
const FIX_POS_PANEL = Vector2(-300,80)
const QUIT_BUTTON_POS = Vector2(1483,720)
const QUIT_BUTTON_CHINESE_POS = Vector2(1370,720)
const QUIT_BUTTON_SIZE = Vector2(436,177)
const MENU_BUTTON_POS = Vector2(1482,539)
const MENU_BUTTON_CHINESE_POS = Vector2(1445,539)
const MENU_BUTTON_SIZE = Vector2(436,177)
const PAGE_1_TEXT_SPANISH = "Pág. 1"
const PAGE_1_TEXT_ENGLISH = "Page 1"
const PAGE_1_TEXT_CHINESE = "页面 1"
const PAGE_2_TEXT_SPANISH = "Pág. 2"
const PAGE_2_TEXT_ENGLISH = "Page 2"
const PAGE_2_TEXT_CHINESE = "页面 2"

@onready var sfx_select = $Select
@onready var sfx_accept = $Accept
@onready var music = $Music
@onready var menu = $Menu
@onready var quit = $Quit
@onready var achievements = $Achievements
@onready var record = $Record
@onready var doppels_captured = $Record2
@onready var doppels_you_let_in = $Record3
@onready var neighbors_killed = $Record4
@onready var times_killed = $Record5
@onready var times_survived = $Record6
@onready var ranks = $Record7
@onready var s_number = $Record9
@onready var a_number = $Record11
@onready var b_number = $Record13
@onready var c_number = $Record15
@onready var d_number = $Record17
@onready var e_number = $Record19
@onready var f_number = $Record21
@onready var exit = $Achievements_Folder/Exit
@onready var achievements_folder = $Achievements_Folder
@onready var locked_01 = $Achievements_Folder/S_Rank/locked
@onready var unlocked_01 = $Achievements_Folder/S_Rank/Unlocked
@onready var locked_02 = $Achievements_Folder/KILL/locked
@onready var unlocked_02 = $Achievements_Folder/KILL/Unlocked
@onready var locked_03 = $Achievements_Folder/BE_KILL/locked
@onready var unlocked_03 = $Achievements_Folder/BE_KILL/Unlocked
@onready var locked_04 = $Achievements_Folder/CATCH/locked
@onready var unlocked_04 = $Achievements_Folder/CATCH/Unlocked
@onready var locked_05 = $Achievements_Folder/ALIVE/locked
@onready var unlocked_05 = $Achievements_Folder/ALIVE/Unlocked
@onready var locked_06 = $Achievements_Folder/NO_FOLDER/locked
@onready var unlocked_06 = $Achievements_Folder/NO_FOLDER/Unlocked
@onready var locked_07 = $Achievements_Folder/CHESTER/locked
@onready var unlocked_07 = $Achievements_Folder/CHESTER/Unlocked
@onready var locked_08 = $Achievements_Folder/UNLIKELY/locked
@onready var unlocked_08 = $Achievements_Folder/UNLIKELY/Unlocked
@onready var locked_09 = $Achievements_Folder/DAYS_40/locked
@onready var unlocked_09 = $Achievements_Folder/DAYS_40/Unlocked
@onready var locked_10 = $Achievements_Folder/F_Rank/locked
@onready var unlocked_10 = $Achievements_Folder/F_Rank/Unlocked
@onready var locked_11 = $Achievements_Folder/DAYS_100/locked
@onready var unlocked_11 = $Achievements_Folder/DAYS_100/Unlocked
@onready var locked_12 = $Achievements_Folder/DOPPEL/locked
@onready var unlocked_12 = $Achievements_Folder/DOPPEL/Unlocked
@onready var locked_13 = $Achievements_Folder/SECRET_42/locked
@onready var unlocked_13 = $Achievements_Folder/SECRET_42/Unlocked
@onready var locked_14 = $Achievements_Folder/PEACH/locked
@onready var unlocked_14 = $Achievements_Folder/PEACH/Unlocked
@onready var locked_23 = $Achievements_Folder2/ALL/locked
@onready var unlocked_23 = $Achievements_Folder2/ALL/Unlocked
@onready var sfx_pick_up_folder = $Pick_Up_Folder
@onready var panel = $Achievements_Folder/Panel
@onready var label = $Achievements_Folder/Panel/Label
@onready var s_rank = $Achievements_Folder/S_Rank
@onready var kill = $Achievements_Folder/KILL
@onready var be_kill = $Achievements_Folder/BE_KILL
@onready var catch = $Achievements_Folder/CATCH
@onready var alive = $Achievements_Folder/ALIVE
@onready var no_folder = $Achievements_Folder/NO_FOLDER
@onready var chester = $Achievements_Folder/CHESTER
@onready var unlikely = $Achievements_Folder/UNLIKELY
@onready var days_40 = $Achievements_Folder/DAYS_40
@onready var f_rank = $Achievements_Folder/F_Rank
@onready var days_100 = $Achievements_Folder/DAYS_100
@onready var doppel = $Achievements_Folder/DOPPEL
@onready var secret_42 = $Achievements_Folder/SECRET_42
@onready var peach = $Achievements_Folder/PEACH
@onready var secret = $Achievements_Folder/SECRET
@onready var all = $Achievements_Folder2/ALL
@onready var visitor_42 = $Achievements_Folder2/VISITOR_42
@onready var visitor_peach = $Achievements_Folder2/VISITOR_PEACH
@onready var visitor_nurse = $Achievements_Folder2/VISITOR_NURSE
@onready var nightmare = $Achievements_Folder2/NIGHTMARE
@onready var evil_chester = $Achievements_Folder2/EVIL_CHESTER
@onready var ghost = $Achievements_Folder2/GHOST
@onready var entity = $Achievements_Folder2/ENTITY
@onready var page_01 = $Achievements_Folder/Page01
@onready var achievements_folder_2 = $Achievements_Folder2
@onready var page_02 = $Achievements_Folder2/Page02
@onready var locked_15 = $Achievements_Folder/SECRET/locked
@onready var unlocked_15 = $Achievements_Folder/SECRET/Unlocked
@onready var locked_16 = $Achievements_Folder2/VISITOR_42/locked
@onready var unlocked_16 = $Achievements_Folder2/VISITOR_42/Unlocked
@onready var locked_17 = $Achievements_Folder2/VISITOR_PEACH/locked
@onready var unlocked_17 = $Achievements_Folder2/VISITOR_PEACH/Unlocked
@onready var locked_18 = $Achievements_Folder2/VISITOR_NURSE/locked
@onready var unlocked_18 = $Achievements_Folder2/VISITOR_NURSE/Unlocked
@onready var locked_19 = $Achievements_Folder2/NIGHTMARE/locked
@onready var unlocked_19 = $Achievements_Folder2/NIGHTMARE/Unlocked
@onready var locked_20 = $Achievements_Folder2/EVIL_CHESTER/locked
@onready var unlocked_20 = $Achievements_Folder2/EVIL_CHESTER/Unlocked
@onready var locked_21 = $Achievements_Folder2/GHOST/locked
@onready var unlocked_21 = $Achievements_Folder2/GHOST/Unlocked
@onready var locked_22 = $Achievements_Folder2/ENTITY/locked
@onready var unlocked_22 = $Achievements_Folder2/ENTITY/Unlocked
@onready var panel2 = $Achievements_Folder2/Panel
@onready var label2 = $Achievements_Folder2/Panel/Label

func _ready():
	if Global.achievements["ALL"] == 0:
		var total = 0
		for achieve in Global.achievements:
			total += Global.achievements[achieve]
		for achieve in Global.achievements_2:
			total += Global.achievements_2[achieve]
		if total == TOTAL_ACHIEVEMENTS:
			Global.achievements["ALL"] = 1
		else:
			Global.achievements["ALL"] = 0
	_set_sound_music_level()
	_set_language()
	_set_values()
	_set_achievements()
	music.play()

func _set_sound_music_level() -> void:
	sfx_select.volume_db = Global.sound_level
	sfx_accept.volume_db = Global.sound_level
	sfx_pick_up_folder.volume_db = Global.sound_level
	music.volume_db = Global.music_level

func _set_language() -> void:
	if Global.language == SPANISH_VALUE:
		label.add_theme_font_size_override("font_size",40)
		label2.add_theme_font_size_override("font_size",40)
		menu.text = MENU_BUTTON_SPANISH
		quit.text = QUIT_BUTTON_SPANISH
		menu.position = MENU_BUTTON_POS
		menu.size = MENU_BUTTON_SIZE
		quit.position = QUIT_BUTTON_POS
		quit.size = QUIT_BUTTON_SIZE
		achievements.text = ACHIEVEMENTS_BUITTON_SPANISH
		record.text = RECORD_TITLE_SPANISH
		doppels_captured.text = DOPPELS_CAPTURED_SPANISH
		doppels_you_let_in.text = DOPPELS_lET_IN_SPANISH
		neighbors_killed.text = NEIGHBORS_KILLED_SPANISH
		times_killed.text = TIMES_KILLED_SPANISH
		times_survived.text = TIMES_SURVIVED_SPANISH
		ranks.text = RANKS_SPANISH
		page_01.text = PAGE_1_TEXT_SPANISH
		page_02.text = PAGE_2_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.add_theme_font_size_override("font_size",40)
		label2.add_theme_font_size_override("font_size",40)
		menu.text = MENU_BUTTON_ENGLISH
		quit.text = QUIT_BUTTON_ENGLISH
		menu.position = MENU_BUTTON_POS
		menu.size = MENU_BUTTON_SIZE
		quit.position = QUIT_BUTTON_POS
		quit.size = QUIT_BUTTON_SIZE
		achievements.text = ACHIEVEMENTS_BUITTON_ENGLISH
		record.text = RECORD_TITLE_ENGLISH
		doppels_captured.text = DOPPELS_CAPTURED_ENGLISH
		doppels_you_let_in.text = DOPPELS_lET_IN_ENGLISH
		neighbors_killed.text = NEIGHBORS_KILLED_ENGLISH
		times_killed.text = TIMES_KILLED_ENGLISH
		times_survived.text = TIMES_SURVIVED_ENGLISH
		ranks.text = RANKS_ENGLISH
		page_01.text = PAGE_1_TEXT_ENGLISH
		page_02.text = PAGE_2_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.add_theme_font_size_override("font_size",30)
		label2.add_theme_font_size_override("font_size",30)
		menu.text = MENU_BUTTON_CHINESE
		quit.text = QUIT_BUTTON_CHINESE
		menu.position = MENU_BUTTON_CHINESE_POS
		quit.position = QUIT_BUTTON_CHINESE_POS
		achievements.text = ACHIEVEMENTS_BUITTON_CHINESE
		record.text = RECORD_TITLE_CHINESE
		doppels_captured.text = DOPPELS_CAPTURED_CHINESE
		doppels_you_let_in.text = DOPPELS_lET_IN_CHINESE
		neighbors_killed.text = NEIGHBORS_KILLED_CHINESE
		times_killed.text = TIMES_KILLED_CHINESE
		times_survived.text = TIMES_SURVIVED_CHINESE
		ranks.text = RANKS_CHINESE
		page_01.text = PAGE_1_TEXT_CHINESE
		page_02.text = PAGE_2_TEXT_CHINESE

func _play_sfx(n:int) -> void:
	match n:
		0:
			sfx_select.play()
		1:
			sfx_accept.play()
		2:
			sfx_pick_up_folder.play()
		_:
			pass

func _set_values() -> void:
	doppels_captured.text += str(Global.doppel_captured_record)
	doppels_you_let_in.text += str(Global.doppel_entered_record)
	neighbors_killed.text += str(Global.chars_killed_record)
	times_killed.text += str(Global.days_killed_record)
	times_survived.text += str(Global.days_successfully_complete_record)
	s_number.text = str(Global.S_rank_record)
	a_number.text = str(Global.A_rank_record)
	b_number.text = str(Global.B_rank_record) 
	c_number.text = str(Global.C_rank_record) 
	d_number.text = str(Global.D_rank_record) 
	e_number.text = str(Global.E_rank_record) 
	f_number.text = str(Global.F_rank_record)  

func _on_menu_mouse_entered() -> void:
	if !menu.disabled:
		_play_sfx(0)
	menu.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_menu_mouse_exited() -> void:
	menu.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_quit_mouse_entered() -> void:
	if !quit.disabled:
		_play_sfx(0)
		quit.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_quit_mouse_exited() -> void:
	quit.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_menu_pressed() -> void:
	_play_sfx(1)
	get_tree().paused = false
	await get_tree().create_timer(0.5).timeout
	Global.scene = MENU_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_quit_pressed() -> void:
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_exit_pressed() -> void:
	_play_sfx(2)
	var tween = create_tween()
	var tween2 = create_tween()
	tween.tween_property(achievements_folder,"position",FOLDER_INTIAL_POS,TIME_ON_TWEEN)
	tween2.tween_property(achievements_folder_2,"position",FOLDER_INTIAL_POS,TIME_ON_TWEEN)
	tween.tween_callback(_set_ui_false)

func _on_achievements_mouse_entered() -> void:
	if !achievements.disabled:
		_play_sfx(0)
		achievements.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_achievements_mouse_exited() -> void:
	achievements.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_achievements_pressed() -> void:
	_ui_disabled(true)
	_play_sfx(2)
	var tween = create_tween()
	var tween2 = create_tween()
	tween.tween_property(achievements_folder,"position",FOLDER_FINIAL_POS,TIME_ON_TWEEN)
	tween2.tween_property(achievements_folder_2,"position",FOLDER_FINIAL_POS,TIME_ON_TWEEN)
	tween.tween_callback(_call_visible_buttons)

func _set_ui_false() -> void:
	_ui_disabled(false)
	_show_buttons(true)

func _call_visible_buttons() -> void:
	_show_buttons(false)

func _show_buttons(value:bool) -> void:
	achievements.visible = value
	quit.visible = value
	menu.visible = value

func _ui_disabled(value:bool) -> void:
	achievements.disabled = value
	quit.disabled = value
	menu.disabled = value

func _set_achievements() -> void:
	if Global.achievements["S_RANK"] != 0:
		unlocked_01.visible = true
		locked_01.visible = false
	if Global.achievements["KILL_NEIGHBOR"] != 0:
		unlocked_02.visible = true
		locked_02.visible = false
	if Global.achievements["BE_KILLED"] != 0:
		unlocked_03.visible = true
		locked_03.visible = false
	if Global.achievements["100_DOPPELS"] != 0:
		unlocked_04.visible = true
		locked_04.visible = false
	if Global.achievements["ALIVE"] != 0:
		unlocked_05.visible = true
		locked_05.visible = false
	if Global.achievements["NO_FOLDER"] != 0:
		unlocked_06.visible = true
		locked_06.visible = false
	if Global.achievements["CHESTER_QUIZ"] != 0:
		unlocked_07.visible = true
		locked_07.visible = false
	if Global.achievements["UNLIKELY"] != 0:
		unlocked_08.visible = true
		locked_08.visible = false
	if Global.achievements["40_DAYS"] != 0:
		unlocked_09.visible = true
		locked_09.visible = false
	if Global.achievements["F_RANK"] != 0:
		unlocked_10.visible = true
		locked_10.visible = false
	if Global.achievements["100_DAYS"] != 0:
		unlocked_11.visible = true
		locked_11.visible = false
	if Global.achievements["CATCH_DOPPEL"] != 0:
		unlocked_12.visible = true
		locked_12.visible = false
	if Global.achievements["42"] != 0:
		unlocked_13.visible = true
		locked_13.visible = false
	if Global.achievements["PEACH"] != 0:
		unlocked_14.visible = true
		locked_14.visible = false
	if Global.achievements["ALL"] != 0:
		unlocked_23.visible = true
		locked_23.visible = false
	if Global.achievements_2["SECRET"] != 0:
		unlocked_15.visible = true
		locked_15.visible = false
	if Global.achievements_2["42"] != 0:
		unlocked_16.visible = true
		locked_16.visible = false
	if Global.achievements_2["PEACH"] != 0:
		unlocked_17.visible = true
		locked_17.visible = false
	if Global.achievements_2["NURSE"] != 0:
		unlocked_18.visible = true
		locked_18.visible = false
	if Global.achievements_2["NIGHTMARE"] != 0:
		unlocked_19.visible = true
		locked_19.visible = false
	if Global.achievements_2["EVIL_CHESTER"] != 0:
		unlocked_20.visible = true
		locked_20.visible = false
	if Global.achievements_2["HAUNTED"] != 0:
		unlocked_21.visible = true
		locked_21.visible = false
	if Global.achievements_2["ENTITY"] != 0:
		unlocked_22.visible = true
		locked_22.visible = false

func _on_s_rank_mouse_entered() -> void:
	panel.position = s_rank.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = RANK_S_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = RANK_S_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = RANK_S_TEXT_CHINESE
	panel.visible = true

func _on_area_mouse_exited() -> void:
	panel.visible = false
	panel2.visible = false

func _on_kill_mouse_entered() -> void:
	panel.position = kill.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = KILL_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = KILL_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = KILL_TEXT_CHINESE
	panel.visible = true

func _on_be_kill_mouse_entered() -> void:
	panel.position = be_kill.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = BE_KILL_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = BE_KILL_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = BE_KILL_TEXT_CHINESE
	panel.visible = true

func _on_catch_mouse_entered() -> void:
	panel.position = catch.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = CATCH_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = CATCH_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = CATCH_TEXT_CHINESE
	panel.visible = true

func _on_alive_mouse_entered() -> void:
	panel.position = alive.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = ALIVE_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = ALIVE_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = ALIVE_TEXT_CHINESE
	panel.visible = true

func _on_no_folder_mouse_entered() -> void:
	panel.position = no_folder.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = NO_FOLDER_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = NO_FOLDER_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = NO_FOLDER_TEXT_CHINESE
	panel.visible = true

func _on_chester_mouse_entered() -> void:
	panel.position = chester.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = CHESTER_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = CHESTER_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = CHESTER_TEXT_CHINESE
	panel.visible = true

func _on_unlikely_mouse_entered() -> void:
	panel.position = unlikely.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = UNLIKELY_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = UNLIKELY_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = UNLIKELY_TEXT_CHINESE
	panel.visible = true

func _on_days_40_mouse_entered() -> void:
	panel.position = days_40.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = DAYS_40_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = DAYS_40_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = DAYS_40_TEXT_CHINESE
	panel.visible = true

func _on_f_rank_mouse_entered() -> void:
	panel.position = f_rank.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = F_RANK_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = F_RANK_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = F_RANK_TEXT_CHINESE
	panel.visible = true

func _on_days_100_mouse_entered() -> void:
	panel.position = days_100.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = DAY_100_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = DAY_100_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = DAY_100_TEXT_CHINESE
	panel.visible = true

func _on_doppel_mouse_entered() -> void:
	panel.position = doppel.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = DOPPEL_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = DOPPEL_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = DOPPEL_TEXT_CHINESE
	panel.visible = true

func _on_secret_42_mouse_entered() -> void:
	panel.position = secret_42.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = SECRET_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = SECRET_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = SECRET_TEXT_CHINESE
	panel.visible = true

func _on_peach_mouse_entered() -> void:
	panel.position = peach.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = PEACH_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = PEACH_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = PEACH_TEXT_CHINESE
	panel.visible = true

func _on_all_mouse_entered() -> void:
	panel2.position = all.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = ALL_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = ALL_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = ALL_TEXT_CHINESE
	panel2.visible = true

func _on_secret_mouse_entered() -> void:
	panel.position = secret.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = DDD_SECRET_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = DDD_SECRET_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = DDD_SECRET_CHINESE
	panel.visible = true

func _on_visitor_42_mouse_entered() -> void:
	panel2.position = visitor_42.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text =  SHARE_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = SHARE_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = SHARE_TEXT_CHINESE
	panel2.visible = true

func _on_visitor_peach_mouse_entered() -> void:
	panel2.position = visitor_peach.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = PEACH_VISITOR_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = PEACH_VISITOR_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = PEACH_VISITOR_TEXT_CHINESE
	panel2.visible = true

func _on_visitor_nurse_mouse_entered() -> void:
	panel2.position = visitor_nurse.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = IN_MY_RESTLESS_DREAMS_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = IN_MY_RESTLESS_DREAMS_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = IN_MY_RESTLESS_DREAMS_CHINESE
	panel2.visible = true

func _on_nightmare_mouse_entered() -> void:
	panel2.position = nightmare.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = NIGHMARE_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = NIGHMARE_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = NIGHMARE_TEXT_CHINESE
	panel2.visible = true

func _on_evil_chester_mouse_entered() -> void:
	panel2.position = evil_chester.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = EVIL_CHESTER_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = EVIL_CHESTER_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = EVIL_CHESTER_CHINESE
	panel2.visible = true

func _on_ghost_mouse_entered() -> void:
	panel2.position = ghost.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = HAUNTED_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = HAUNTED_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = HAUNTED_CHINESE
	panel2.visible = true

func _on_entity_mouse_entered() -> void:
	panel2.position = entity.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = ENTITY_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = ENTITY_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = ENTITY_CHINESE
	panel2.visible = true

func _on_page_01_pressed() -> void:
	_play_sfx(2)
	achievements_folder.z_index = 2
	achievements_folder_2.z_index = 1
	set_visible_achievements(true)

func set_visible_achievements(value:bool) -> void:
	s_rank.visible = value
	kill.visible = value
	be_kill.visible = value
	catch.visible = value
	alive.visible = value
	no_folder.visible = value
	chester.visible = value
	unlikely.visible = value
	days_40.visible = value
	f_rank.visible = value
	days_100.visible = value
	doppel.visible = value
	secret_42.visible = value
	secret.visible = value
	visitor_42.visible = !value
	visitor_peach.visible = !value
	visitor_nurse.visible = !value
	nightmare.visible = !value
	evil_chester.visible = !value
	ghost.visible = !value
	entity.visible = !value
	all.visible = !value

func _on_page_01_mouse_entered() -> void:
	if !page_01.disabled:
		_play_sfx(0)
		page_01.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_page_01_mouse_exited() -> void:
	page_01.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_page_02_pressed() -> void:
	_play_sfx(2)
	achievements_folder.z_index = 1
	achievements_folder_2.z_index = 2
	set_visible_achievements(false)

func _on_page_02_mouse_entered() -> void:
	if !page_02.disabled:
		_play_sfx(0)
		page_02.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_page_02_mouse_exited() -> void:
	page_02.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)
