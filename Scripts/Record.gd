extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const MENU_SCENE = 2
const LOADING_DIR = "res://Scenes/Loading_screen.tscn"
const BUTTONS_OUTLINE_COLOR_BLACK = Color(0, 0, 0, 1)
const BUTTONS_OUTLINE_COLOR_SELECT = Color(1, 0, 0, 1)
const BUTTONS_OUTLINE_COLOR_GREY = Color(0.5, 0.5, 0.5, 1)
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
const FOLDER_INTIAL_POS = Vector2(40, 1060)
const FOLDER_FINIAL_POS = Vector2(40, -20)
const RANK_S_TEXT_SPANISH = "MEJOR QUE HENRY\nConsigue rango S en una partida."

const RANK_S_TEXT_ENGLISH = "BETTER THAN HENRY\nGet S rank on one playthrough."

const RANK_S_TEXT_CHINESE = "比亨利更好\n在一局比赛中获得S级别。"

const KILL_TEXT_SPANISH = "ACCIDENTE LABORAL\nElimina a un vecino."

const KILL_TEXT_ENGLISH = "WORK ACCIDENT\nKill one neighbor."

const KILL_TEXT_CHINESE = "工伤\n杀死邻居。"

const BE_KILL_TEXT_SPANISH = "COMIDA DE DOPPELGANGERS\nSe asesinado."

const BE_KILL_TEXT_ENGLISH = "DOPPELGANGERS FOOD\nBe murdered."

const BE_KILL_TEXT_CHINESE = "假人的食物\n被假人杀死了。"

const CATCH_TEXT_SPANISH = "CAZADOR\nCaptura 100 doppelgangers."

const CATCH_TEXT_ENGLISH = "HUNTER\nCapture 100 doppelgangers."

const CATCH_TEXT_CHINESE = "猎人\n捕获100个假人。"

const ALIVE_TEXT_SPANISH = "¡ESTOY VIVO!\nTermina una partida vivo."

const ALIVE_TEXT_ENGLISH = "I'M ALIVE!\nFinish one playthrough alive."

const ALIVE_TEXT_CHINESE = "我还活着！\n在游戏结束时活着。"

const NO_FOLDER_TEXT_SPANISH = "MEMORIA DE ACERO\nSobrevive sin abrir ninguna carpeta."

const NO_FOLDER_TEXT_ENGLISH = "STEEL MEMORY\nSurvive without opening any folder."

const NO_FOLDER_TEXT_CHINESE = "钢铁记忆\n在不打开任何文件夹的情况下生存。"

const CHESTER_TEXT_SPANISH = "EL MEJOR DE LA CLASE\nCompleta el cuestionario de Chester."

const CHESTER_TEXT_ENGLISH = "THE BEST IN THE CLASS\nComplete Chester's quiz."

const CHESTER_TEXT_CHINESE = "班里最好的\n完成切斯特的问卷。"

const UNLIKELY_TEXT_SPANISH = "UNLIKELY\nConoce al payaso."

const UNLIKELY_TEXT_ENGLISH = "UNLIKELY\nMeet the clown."

const UNLIKELY_TEXT_CHINESE = "UNLIKELY\n见到小丑。"

const DAYS_40_TEXT_SPANISH = "CUARENTENA\nSobrevive 40 partidas."

const DAYS_40_TEXT_ENGLISH = "QUARANTINE\nSurvive 40 playthroughs."

const DAYS_40_TEXT_CHINESE = "隔离\n生存40场比赛。"

const F_RANK_TEXT_SPANISH = "PEOR QUE HENRY\nConsigue rango F en una partida."

const F_RANK_TEXT_ENGLISH = "WORSE THAN HENRY\nGet F rank on one playthrough."

const F_RANK_TEXT_CHINESE = "比亨利更糟\n在一场比赛中获得F级别。"

const DAY_100_TEXT_SPANISH = "EMPLEADO DEL MES\nCompleta 100 partidas."

const DAY_100_TEXT_ENGLISH = "EMPLOYEE OF THE MONTH\nComplete 100 playthroughs."

const DAY_100_TEXT_CHINESE = "月度员工\n完成100场比赛。"

const DOPPEL_TEXT_SPANISH = "¡TE ATRAPÉ!\nDescrube a un doppelganger en el acto."

const DOPPEL_TEXT_ENGLISH = "CATCH YOU!\nCatch a doppelganger red-handed."

const DOPPEL_TEXT_CHINESE = "我抓到你了！\n当场抓住一个假人。"

const SECRET_TEXT_SPANISH = "MENTE ABIERTA\nDescubre el secreto del universo."

const SECRET_TEXT_ENGLISH = "OPEN MIND\nDiscover the secret of the universe."

const SECRET_TEXT_CHINESE = "开放的心态\n发现宇宙的秘密。"

const PEACH_TEXT_SPANISH = "PEACHES PEACHES\nConoce al doppelganger peach."

const PEACH_TEXT_ENGLISH = "PEACHES PEACHES\nMeet the (peach) doppelganger."

const PEACH_TEXT_CHINESE = "PEACHES PEACHES\n来认识一下假人（Peach）。"

const ALL_TEXT_SPANISH = "COLECCIONISTA\nDesbloquea todos los logros."

const ALL_TEXT_ENGLISH = "COLLECTOR\nUnlock all the achievements."

const ALL_TEXT_CHINESE = "收藏家\n解锁所有成就。"

const DDD_SECRET_SPANISH = "ABRE TUS OJOS\nDescubre un secreto del D.D.D.\n"


const DDD_SECRET_ENGLISH = "OPEN YOUR EYES\nDiscover a secret of the D.D.D."

const DDD_SECRET_CHINESE = "睁开你的眼睛\n发现 D.D.D. 的一个秘密"

const SHARE_TEXT_SPANISH = "COMPARTE EL SECRETO\nRecibe a \"42\" como VIP."

const SHARE_TEXT_ENGLISH = "SHARE THE SECRET\nWelcome \"42\" as a VIP."

const SHARE_TEXT_CHINESE = "分享这个秘密\n欢迎 \"42\" 贵宾。"

const PEACH_VISITOR_TEXT_SPANISH = "PEACHING\nRecibe a peach como VIP."

const PEACH_VISITOR_TEXT_ENGLISH = "PEACHING\nWelcome peach as VIP."

const PEACH_VISITOR_TEXT_CHINESE = "PEACHING\n欢迎peach贵宾。"

const IN_MY_RESTLESS_DREAMS_SPANISH = "EN MIS SUEÑOS MÁS INQUIETOS\nRecibe a la enfermera como VIP."

const IN_MY_RESTLESS_DREAMS_ENGLISH = "IN MY RESTLESS DREAMS\nWelcome the nurse as a VIP."

const IN_MY_RESTLESS_DREAMS_CHINESE = "在我最不安的梦中\n欢迎护士作为贵宾。"

const NIGHMARE_TEXT_SPANISH = "¡DESPIERTA!\nSobrevive el modo pesadilla."

const NIGHMARE_TEXT_ENGLISH = "WAKE UP!\nSurvive the nightmare mode."

const NIGHMARE_TEXT_CHINESE = "醒来\n完成噩梦模式。"

const EVIL_CHESTER_SPANISH = "MENTE PRODIGIOSA\nCompleta el quiz de Chester malvado."

const EVIL_CHESTER_ENGLISH = "PRODIGIOUS MIND\nComplete the Evil Chester's quiz."

const EVIL_CHESTER_CHINESE = "天才的头脑\n完成邪恶的切斯特问卷。"

const HAUNTED_SPANISH = "¡BOO!\nConoce al fantasma de la máscara."

const HAUNTED_ENGLISH = "BOO!\nGet haunted by the mask ghost."

const HAUNTED_CHINESE = "咻！\n被面具鬼缠身。"

const ENTITY_SPANISH = "DOLOR DE CABEZA\nSe asesinado por la entidad."

const ENTITY_ENGLISH = "HEADACHE\nBe murdered by the entity."

const ENTITY_CHINESE = "头痛\n被实体谋杀。"

const TOTAL_ACHIEVEMENTS = 29
const FIX_POS_PANEL = Vector2(-300, 80)
const QUIT_BUTTON_POS = Vector2(1483, 720)
const QUIT_BUTTON_CHINESE_POS = Vector2(1370, 720)
const QUIT_BUTTON_SIZE = Vector2(436, 177)
const MENU_BUTTON_POS = Vector2(1482, 539)
const MENU_BUTTON_CHINESE_POS = Vector2(1445, 539)
const MENU_BUTTON_SIZE = Vector2(436, 177)
const PAGE_1_TEXT_SPANISH = "Pág. 1"
const PAGE_1_TEXT_ENGLISH = "Page 1"
const PAGE_1_TEXT_CHINESE = "页面 1"
const PAGE_2_TEXT_SPANISH = "Pág. 2"
const PAGE_2_TEXT_ENGLISH = "Page 2"
const PAGE_2_TEXT_CHINESE = "页面 2"
const ENDLESS_7_SPANISH = "LA PEOR SEMANA\nSobrevive 7 días en el modo infinito."

const ENDLESS_7_ENGLISH = "THE WORST WEEK\nSurvive 7 days in infinite mode."

const ENDLESS_7_CHINESE = "最糟糕的一周\n在无限模式下生存7天。"

const ENDLESS_15_SPANISH = "NO LLEGO A LA QUINCENA\nSobrevive 15 días en el modo infinito."

const ENDLESS_15_ENGLISH = "CAN'T MAKE IT TO PAYDAY\nSurvive 15 days in infinite mode."

const ENDLESS_15_CHINESE = "撑不到发薪日\n在无限模式下生存15天。"

const FINAL_A_SPANISH = "3 METROS BAJO SUELO\nConsigue este final en el modo campaña."

const FINAL_A_ENGLISH = "6 FEET UNDER\nAchieve this ending in campaign mode."

const FINAL_A_CHINESE = "入土三米\n在战役模式中达成此结局。"

const FINAL_B_SPANISH = "CON DERECHO A UNA LLAMADA\nConsigue este final en el modo campaña."

const FINAL_B_ENGLISH = "ENTITLED TO ONE CALL\nAchieve this ending in campaign mode."

const FINAL_B_CHINESE = "有权打一个电话\n在战役模式中达成此结局。"

const FINAL_C_SPANISH = "TAL COMO HENRY\nConsigue este final en el modo campaña."

const FINAL_C_ENGLISH = "JUST LIKE HENRY\nAchieve this ending in campaign mode."

const FINAL_C_CHINESE = "就像亨利\n在战役模式中达成此结局。"

const FINAL_D_SPANISH = "CONSPIRANOICO\nConsigue este final en el modo campaña."

const FINAL_D_ENGLISH = "CONSPIRACY THEORIST\nAchieve this ending in campaign mode."

const FINAL_D_CHINESE = "阴谋论者\n在战役模式中达成此结局。"

const FINAL_E_SPANISH = "EMPLEADO EJEMPLAR\nConsigue este final en el modo campaña."

const FINAL_E_ENGLISH = "MODEL EMPLOYEE\nAchieve this ending in campaign mode."

const FINAL_E_CHINESE = "模范员工\n在战役模式中达成此结局。"


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
@onready var exit = $Achievements_Folder / Exit
@onready var achievements_folder = $Achievements_Folder
@onready var locked_01 = $Achievements_Folder / S_Rank / locked
@onready var unlocked_01 = $Achievements_Folder / S_Rank / Unlocked
@onready var locked_02 = $Achievements_Folder / KILL / locked
@onready var unlocked_02 = $Achievements_Folder / KILL / Unlocked
@onready var locked_03 = $Achievements_Folder / BE_KILL / locked
@onready var unlocked_03 = $Achievements_Folder / BE_KILL / Unlocked
@onready var locked_04 = $Achievements_Folder / CATCH / locked
@onready var unlocked_04 = $Achievements_Folder / CATCH / Unlocked
@onready var locked_05 = $Achievements_Folder / ALIVE / locked
@onready var unlocked_05 = $Achievements_Folder / ALIVE / Unlocked
@onready var locked_06 = $Achievements_Folder / NO_FOLDER / locked
@onready var unlocked_06 = $Achievements_Folder / NO_FOLDER / Unlocked
@onready var locked_07 = $Achievements_Folder / CHESTER / locked
@onready var unlocked_07 = $Achievements_Folder / CHESTER / Unlocked
@onready var locked_08 = $Achievements_Folder / UNLIKELY / locked
@onready var unlocked_08 = $Achievements_Folder / UNLIKELY / Unlocked
@onready var locked_09 = $Achievements_Folder / DAYS_40 / locked
@onready var unlocked_09 = $Achievements_Folder / DAYS_40 / Unlocked
@onready var locked_10 = $Achievements_Folder / F_Rank / locked
@onready var unlocked_10 = $Achievements_Folder / F_Rank / Unlocked
@onready var locked_11 = $Achievements_Folder / DAYS_100 / locked
@onready var unlocked_11 = $Achievements_Folder / DAYS_100 / Unlocked
@onready var locked_12 = $Achievements_Folder / DOPPEL / locked
@onready var unlocked_12 = $Achievements_Folder / DOPPEL / Unlocked
@onready var locked_13 = $Achievements_Folder / SECRET_42 / locked
@onready var unlocked_13 = $Achievements_Folder / SECRET_42 / Unlocked
@onready var locked_14 = $Achievements_Folder / PEACH / locked
@onready var unlocked_14 = $Achievements_Folder / PEACH / Unlocked
@onready var locked_30 = $Achievements_Folder2 / ALL / locked
@onready var unlocked_30 = $Achievements_Folder2 / ALL / Unlocked
@onready var sfx_pick_up_folder = $Pick_Up_Folder
@onready var panel = $Achievements_Folder / Panel
@onready var label = $Achievements_Folder / Panel / Label
@onready var s_rank = $Achievements_Folder / S_Rank
@onready var kill = $Achievements_Folder / KILL
@onready var be_kill = $Achievements_Folder / BE_KILL
@onready var catch = $Achievements_Folder / CATCH
@onready var alive = $Achievements_Folder / ALIVE
@onready var no_folder = $Achievements_Folder / NO_FOLDER
@onready var chester = $Achievements_Folder / CHESTER
@onready var unlikely = $Achievements_Folder / UNLIKELY
@onready var days_40 = $Achievements_Folder / DAYS_40
@onready var f_rank = $Achievements_Folder / F_Rank
@onready var days_100 = $Achievements_Folder / DAYS_100
@onready var doppel = $Achievements_Folder / DOPPEL
@onready var secret_42 = $Achievements_Folder / SECRET_42
@onready var peach = $Achievements_Folder / PEACH
@onready var secret = $Achievements_Folder / SECRET
@onready var all = $Achievements_Folder2 / ALL
@onready var visitor_42 = $Achievements_Folder2 / VISITOR_42
@onready var visitor_peach = $Achievements_Folder2 / VISITOR_PEACH
@onready var visitor_nurse = $Achievements_Folder2 / VISITOR_NURSE
@onready var nightmare = $Achievements_Folder2 / NIGHTMARE
@onready var evil_chester = $Achievements_Folder2 / EVIL_CHESTER
@onready var ghost = $Achievements_Folder2 / GHOST
@onready var entity = $Achievements_Folder2 / ENTITY
@onready var page_01 = $Achievements_Folder / Page01
@onready var achievements_folder_2 = $Achievements_Folder2
@onready var page_02 = $Achievements_Folder2 / Page02
@onready var locked_15 = $Achievements_Folder / SECRET / locked
@onready var unlocked_15 = $Achievements_Folder / SECRET / Unlocked
@onready var locked_16 = $Achievements_Folder2 / VISITOR_42 / locked
@onready var unlocked_16 = $Achievements_Folder2 / VISITOR_42 / Unlocked
@onready var locked_17 = $Achievements_Folder2 / VISITOR_PEACH / locked
@onready var unlocked_17 = $Achievements_Folder2 / VISITOR_PEACH / Unlocked
@onready var locked_18 = $Achievements_Folder2 / VISITOR_NURSE / locked
@onready var unlocked_18 = $Achievements_Folder2 / VISITOR_NURSE / Unlocked
@onready var locked_19 = $Achievements_Folder2 / NIGHTMARE / locked
@onready var unlocked_19 = $Achievements_Folder2 / NIGHTMARE / Unlocked
@onready var locked_20 = $Achievements_Folder2 / EVIL_CHESTER / locked
@onready var unlocked_20 = $Achievements_Folder2 / EVIL_CHESTER / Unlocked
@onready var locked_21 = $Achievements_Folder2 / GHOST / locked
@onready var unlocked_21 = $Achievements_Folder2 / GHOST / Unlocked
@onready var locked_22 = $Achievements_Folder2 / ENTITY / locked
@onready var unlocked_22 = $Achievements_Folder2 / ENTITY / Unlocked
@onready var panel2 = $Achievements_Folder2 / Panel
@onready var label2 = $Achievements_Folder2 / Panel / Label
@onready var endless_7: Node2D = $Achievements_Folder2 / ENDLESS_7
@onready var endless_15: Node2D = $Achievements_Folder2 / ENDLESS_15
@onready var final_a: Node2D = $Achievements_Folder2 / FINAL_A
@onready var final_b: Node2D = $Achievements_Folder2 / FINAL_B
@onready var final_c: Node2D = $Achievements_Folder2 / FINAL_C
@onready var final_d: Node2D = $Achievements_Folder2 / FINAL_D
@onready var final_e: Node2D = $Achievements_Folder2 / FINAL_E
@onready var locked_23: Sprite2D = $Achievements_Folder2 / ENDLESS_7 / locked
@onready var unlocked_23: Sprite2D = $Achievements_Folder2 / ENDLESS_7 / Unlocked
@onready var locked_24: Sprite2D = $Achievements_Folder2 / ENDLESS_15 / locked
@onready var unlocked_24: Sprite2D = $Achievements_Folder2 / ENDLESS_15 / Unlocked
@onready var locked_25: Sprite2D = $Achievements_Folder2 / FINAL_A / locked
@onready var unlocked_25: Sprite2D = $Achievements_Folder2 / FINAL_A / Unlocked
@onready var locked_26: Sprite2D = $Achievements_Folder2 / FINAL_B / locked
@onready var unlocked_26: Sprite2D = $Achievements_Folder2 / FINAL_B / Unlocked
@onready var locked_27: Sprite2D = $Achievements_Folder2 / FINAL_C / locked
@onready var unlocked_27: Sprite2D = $Achievements_Folder2 / FINAL_C / Unlocked
@onready var locked_28: Sprite2D = $Achievements_Folder2 / FINAL_D / locked
@onready var unlocked_28: Sprite2D = $Achievements_Folder2 / FINAL_D / Unlocked
@onready var locked_29: Sprite2D = $Achievements_Folder2 / FINAL_E / locked
@onready var unlocked_29: Sprite2D = $Achievements_Folder2 / FINAL_E / Unlocked

func _ready():
	if Global.achievements["ALL"] == 0:
		var total = 0
		for achieve in Global.achievements:
			total += Global.achievements[achieve]
		for achieve in Global.achievements_2:
			total += Global.achievements_2[achieve]
		for achieve in Global.achievements_3:
			total += Global.achievements_3[achieve]
		if total == TOTAL_ACHIEVEMENTS:
			Global.achievements["ALL"] = 1
		else :
			Global.achievements["ALL"] = 0
	_set_sound_music_level()
	_set_language()
	_set_values()
	_set_achievements()
	music.play()

func _set_sound_music_level()->void :
	sfx_select.volume_db = Global.sound_level
	sfx_accept.volume_db = Global.sound_level
	sfx_pick_up_folder.volume_db = Global.sound_level
	music.volume_db = Global.music_level

func _set_language()->void :
	if Global.language == SPANISH_VALUE:
		label.add_theme_font_size_override("font_size", 40)
		label2.add_theme_font_size_override("font_size", 40)
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
		label.add_theme_font_size_override("font_size", 40)
		label2.add_theme_font_size_override("font_size", 40)
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
		label.add_theme_font_size_override("font_size", 30)
		label2.add_theme_font_size_override("font_size", 30)
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

func _play_sfx(n: int)->void :
	match n:
		0:
			sfx_select.play()
		1:
			sfx_accept.play()
		2:
			sfx_pick_up_folder.play()
		_:
			pass

func _set_values()->void :
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

func _on_menu_mouse_entered()->void :
	if !menu.disabled:
		_play_sfx(0)
	menu.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_menu_mouse_exited()->void :
	menu.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_quit_mouse_entered()->void :
	if !quit.disabled:
		_play_sfx(0)
		quit.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_quit_mouse_exited()->void :
	quit.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

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

func _on_exit_pressed()->void :
	_play_sfx(2)
	var tween = create_tween()
	var tween2 = create_tween()
	tween.tween_property(achievements_folder, "position", FOLDER_INTIAL_POS, TIME_ON_TWEEN)
	tween2.tween_property(achievements_folder_2, "position", FOLDER_INTIAL_POS, TIME_ON_TWEEN)
	tween.tween_callback(_set_ui_false)

func _on_achievements_mouse_entered()->void :
	if !achievements.disabled:
		_play_sfx(0)
		achievements.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_achievements_mouse_exited()->void :
	achievements.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_achievements_pressed()->void :
	_ui_disabled(true)
	_play_sfx(2)
	var tween = create_tween()
	var tween2 = create_tween()
	tween.tween_property(achievements_folder, "position", FOLDER_FINIAL_POS, TIME_ON_TWEEN)
	tween2.tween_property(achievements_folder_2, "position", FOLDER_FINIAL_POS, TIME_ON_TWEEN)
	tween.tween_callback(_call_visible_buttons)

func _set_ui_false()->void :
	_ui_disabled(false)
	_show_buttons(true)

func _call_visible_buttons()->void :
	_show_buttons(false)

func _show_buttons(value: bool)->void :
	achievements.visible = value
	quit.visible = value
	menu.visible = value

func _ui_disabled(value: bool)->void :
	achievements.disabled = value
	quit.disabled = value
	menu.disabled = value

func _set_achievements()->void :
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
	if Global.achievements_3["7_DAYS"] != 0:
		unlocked_23.visible = true
		locked_23.visible = false
	if Global.achievements_3["15_DAYS"] != 0:
		unlocked_24.visible = true
		locked_24.visible = false
	if Global.achievements_3["FINAL_1"] != 0:
		unlocked_25.visible = true
		locked_25.visible = false
	if Global.achievements_3["FINAL_2"] != 0:
		unlocked_26.visible = true
		locked_26.visible = false
	if Global.achievements_3["FINAL_3"] != 0:
		unlocked_27.visible = true
		locked_27.visible = false
	if Global.achievements_3["FINAL_4"] != 0:
		unlocked_28.visible = true
		locked_28.visible = false
	if Global.achievements_3["FINAL_5"] != 0:
		unlocked_29.visible = true
		locked_29.visible = false
	if Global.achievements["ALL"] != 0:
		unlocked_30.visible = true
		locked_30.visible = false

func _on_s_rank_mouse_entered()->void :
	panel.position = s_rank.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = RANK_S_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = RANK_S_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = RANK_S_TEXT_CHINESE
	panel.visible = true

func _on_area_mouse_exited()->void :
	panel.visible = false
	panel2.visible = false

func _on_kill_mouse_entered()->void :
	panel.position = kill.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = KILL_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = KILL_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = KILL_TEXT_CHINESE
	panel.visible = true

func _on_be_kill_mouse_entered()->void :
	panel.position = be_kill.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = BE_KILL_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = BE_KILL_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = BE_KILL_TEXT_CHINESE
	panel.visible = true

func _on_catch_mouse_entered()->void :
	panel.position = catch.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = CATCH_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = CATCH_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = CATCH_TEXT_CHINESE
	panel.visible = true

func _on_alive_mouse_entered()->void :
	panel.position = alive.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = ALIVE_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = ALIVE_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = ALIVE_TEXT_CHINESE
	panel.visible = true

func _on_no_folder_mouse_entered()->void :
	panel.position = no_folder.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = NO_FOLDER_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = NO_FOLDER_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = NO_FOLDER_TEXT_CHINESE
	panel.visible = true

func _on_chester_mouse_entered()->void :
	panel.position = chester.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = CHESTER_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = CHESTER_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = CHESTER_TEXT_CHINESE
	panel.visible = true

func _on_unlikely_mouse_entered()->void :
	panel.position = unlikely.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = UNLIKELY_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = UNLIKELY_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = UNLIKELY_TEXT_CHINESE
	panel.visible = true

func _on_days_40_mouse_entered()->void :
	panel.position = days_40.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = DAYS_40_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = DAYS_40_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = DAYS_40_TEXT_CHINESE
	panel.visible = true

func _on_f_rank_mouse_entered()->void :
	panel.position = f_rank.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = F_RANK_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = F_RANK_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = F_RANK_TEXT_CHINESE
	panel.visible = true

func _on_days_100_mouse_entered()->void :
	panel.position = days_100.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = DAY_100_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = DAY_100_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = DAY_100_TEXT_CHINESE
	panel.visible = true

func _on_doppel_mouse_entered()->void :
	panel.position = doppel.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = DOPPEL_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = DOPPEL_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = DOPPEL_TEXT_CHINESE
	panel.visible = true

func _on_secret_42_mouse_entered()->void :
	panel.position = secret_42.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = SECRET_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = SECRET_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = SECRET_TEXT_CHINESE
	panel.visible = true

func _on_peach_mouse_entered()->void :
	panel.position = peach.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = PEACH_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = PEACH_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = PEACH_TEXT_CHINESE
	panel.visible = true

func _on_all_mouse_entered()->void :
	panel2.position = all.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = ALL_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = ALL_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = ALL_TEXT_CHINESE
	panel2.visible = true

func _on_secret_mouse_entered()->void :
	panel.position = secret.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label.text = DDD_SECRET_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label.text = DDD_SECRET_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label.text = DDD_SECRET_CHINESE
	panel.visible = true

func _on_visitor_42_mouse_entered()->void :
	panel2.position = visitor_42.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = SHARE_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = SHARE_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = SHARE_TEXT_CHINESE
	panel2.visible = true

func _on_visitor_peach_mouse_entered()->void :
	panel2.position = visitor_peach.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = PEACH_VISITOR_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = PEACH_VISITOR_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = PEACH_VISITOR_TEXT_CHINESE
	panel2.visible = true

func _on_visitor_nurse_mouse_entered()->void :
	panel2.position = visitor_nurse.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = IN_MY_RESTLESS_DREAMS_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = IN_MY_RESTLESS_DREAMS_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = IN_MY_RESTLESS_DREAMS_CHINESE
	panel2.visible = true

func _on_nightmare_mouse_entered()->void :
	panel2.position = nightmare.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = NIGHMARE_TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = NIGHMARE_TEXT_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = NIGHMARE_TEXT_CHINESE
	panel2.visible = true

func _on_evil_chester_mouse_entered()->void :
	panel2.position = evil_chester.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = EVIL_CHESTER_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = EVIL_CHESTER_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = EVIL_CHESTER_CHINESE
	panel2.visible = true

func _on_ghost_mouse_entered()->void :
	panel2.position = ghost.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = HAUNTED_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = HAUNTED_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = HAUNTED_CHINESE
	panel2.visible = true

func _on_entity_mouse_entered()->void :
	panel2.position = entity.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = ENTITY_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = ENTITY_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = ENTITY_CHINESE
	panel2.visible = true

func _on_page_01_pressed()->void :
	_play_sfx(2)
	achievements_folder.z_index = 2
	achievements_folder_2.z_index = 1
	set_visible_achievements(true)

func set_visible_achievements(value: bool)->void :
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
	endless_7.visible = !value
	endless_15.visible = !value
	final_a.visible = !value
	final_b.visible = !value
	final_c.visible = !value
	final_d.visible = !value
	final_e.visible = !value
	all.visible = !value

func _on_page_01_mouse_entered()->void :
	if !page_01.disabled:
		_play_sfx(0)
		page_01.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_page_01_mouse_exited()->void :
	page_01.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_page_02_pressed()->void :
	_play_sfx(2)
	achievements_folder.z_index = 1
	achievements_folder_2.z_index = 2
	set_visible_achievements(false)

func _on_page_02_mouse_entered()->void :
	if !page_02.disabled:
		_play_sfx(0)
		page_02.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_page_02_mouse_exited()->void :
	page_02.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_endless_7_mouse_entered()->void :
	panel2.position = endless_7.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = ENDLESS_7_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = ENDLESS_7_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = ENDLESS_7_CHINESE
	panel2.visible = true

func _on_endless_15_mouse_entered()->void :
	panel2.position = endless_15.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = ENDLESS_15_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = ENDLESS_15_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = ENDLESS_15_CHINESE
	panel2.visible = true

func _on_final_a_mouse_entered()->void :
	panel2.position = final_a.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = FINAL_A_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = FINAL_A_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = FINAL_A_CHINESE
	panel2.visible = true

func _on_final_b_mouse_entered()->void :
	panel2.position = final_b.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = FINAL_B_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = FINAL_B_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = FINAL_B_CHINESE
	panel2.visible = true

func _on_final_c_mouse_entered()->void :
	panel2.position = final_c.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = FINAL_C_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = FINAL_C_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = FINAL_C_CHINESE
	panel2.visible = true

func _on_final_d_mouse_entered()->void :
	panel2.position = final_d.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = FINAL_D_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = FINAL_D_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = FINAL_D_CHINESE
	panel2.visible = true

func _on_final_e_mouse_entered()->void :
	panel2.position = final_e.position + FIX_POS_PANEL
	if Global.language == SPANISH_VALUE:
		label2.text = FINAL_E_SPANISH
	elif Global.language == ENGLISH_VALUE:
		label2.text = FINAL_E_ENGLISH
	elif Global.language == CHINESE_VALUE:
		label2.text = FINAL_E_CHINESE
	panel2.visible = true
