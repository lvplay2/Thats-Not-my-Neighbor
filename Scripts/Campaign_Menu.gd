extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const MENU_SCENE = 2
const RECORD_SCENE = 6
const OFFICE_SCENE = 12
const FINAL_SCENE = 14
const LOADING_DIR = "res://Scenes/Loading_screen.tscn"
const DAY_TEXT_SPANISH = "Día: "
const TITLE_TEXT_SPANISH = "Últimas noticias"
const INFO_01_SPANISH = "Los Doppelgangers siguen viniendo.\n\nPero el D.D.D. está \naquí para detenerlos\nde una vez por todas."




const INFO_02_SPANISH = "¡Nueva oferta de trabajo!\nPortero en complejo de apartamentos ubicado en el centro de la ciudad.\n\nRequisitos: Ninguno.\nSalario: Mínimo.  \nPara más información contacte al D.D.D."





const CONTINUE_TEXT_SPANISH = "Continuar"
const NEW_TEXT_SPANISH = "Nueva Campaña"
const RECORD_TEXT_SPANISH = "Registro"
const MENU_TEXT_SPANISH = "Menú"
const QUIT_TEXT_SPANISH = "Salir"
const DAY_TEXT_ENGLISH = "Day: "
const TITLE_TEXT_ENGLISH = "Latest News"
const INFO_01_ENGLISH = "The Doppelgangers keep coming.\n\nBut the D.D.D. is\nhere to stop them\nonce and for all."




const INFO_02_ENGLISH = "New job offer!\nDoorman at an apartment complex located in the downtown.\n\nRequirements: None.\nSalary: Minimum.\nFor more information, contact the D.D.D."





const CONTINUE_TEXT_ENGLISH = "Continue"
const NEW_TEXT_ENGLISH = "New Campaign"
const RECORD_TEXT_ENGLISH = "Record"
const MENU_TEXT_ENGLISH = "Menu"
const QUIT_TEXT_ENGLISH = "Quit"
const DAY_TEXT_CHINESE = "日: "
const TITLE_TEXT_CHINESE = "最新消息"
const INFO_01_CHINESE = "伪人还在继续出现。\n\n但 D.D.D. 已经来了，\n要彻底阻止他们。"



const INFO_02_CHINESE = "新的工作机会！\n市中心公寓楼门卫。\n\n要求：无。\n工资：最低。\n想了解更多信息，请联系 D.D.D."





const CONTINUE_TEXT_CHINESE = "继续"
const NEW_TEXT_CHINESE = "新活动"
const RECORD_TEXT_CHINESE = "记录"
const MENU_TEXT_CHINESE = "主菜单"
const QUIT_TEXT_CHINESE = "退出游戏"
const TITLE_DOPPEL_INFO_ENGLISH = "Details:"
const TITLE_DOPPEL_INFO_SPANISH = "Detalles:"
const TITLE_DOPPEL_INFO_CHINESE = "细节:"
const DETAILS_BUTTON_ENGLISH = "Doppels you let in"
const DETAILS_BUTTON_SPANISH = "Doppels que ingresaron"
const DETAILS_BUTTON_CHINESE = "你让进来的伪人"
const DETAILS_BUTTON_NEIGHBOR_ENGLISH = "Neighbors killed"
const DETAILS_BUTTON_NEIGHBOR_SPANISH = "Vecinos eliminados"
const DETAILS_BUTTON_NEIGHBOR_CHINESE = "邻居被杀"
const BUTTONS_OUTLINE_COLOR_BLACK = Color(0, 0, 0, 1)
const BUTTONS_OUTLINE_COLOR_SELECT = Color(1, 0, 0, 1)
const BUTTONS_OUTLINE_COLOR_GREY = Color(0.5, 0.5, 0.5, 1)
const TROPHIE_FINAL_SCALE = Vector2(0.3, 0.3)
const TROPHIE_INITINAL_SCALE = Vector2(0.01, 0.01)
const TWEEN_FAST_TIME = 0.5
const TWEEN_TIME = 1.0
const FINAL_POS_DETAILS = Vector2(800, 0)
const INITIAL_POS_DETAILS = Vector2(0, 0)
const INFO_01_DAY2_SPANISH = "Granjero local \nChester Titor \nse enfrenta a \nextraterrestres\ncon su vieja\nescopeta."





const INFO_02_DAY2_SPANISH = "Chester Titor afirma haber disparado a seres\nextraterrestres que invadían sus terrenos.\n\n\"Tenían ojos grandes y oscuros\" dijo Chester."



const INFO_01_DAY3_SPANISH = "Inédida fotografía de un platillo volador.\n\nCortesía de Chester Titor."


const INFO_02_DAY3_SPANISH = "Chester Titor afirma haber visto y capturado en fotografía un objeto volador que proviene de otro planeta.\n\nSegún Chester desde el día de ayer este objeto vuela por el perímetro de su terreno."


const INFO_01_DAY4_SPANISH = "Granjero local denuncia que seres de otro planeta están robando sus vacas."
const INFO_02_DAY4_SPANISH = "Chester Titor denuncia una serie de abducciones de sus terneras y vacas.\n\nEl granjero afirma haber presenciado como Lulú su vaca favorita era raptada por un platillo volador."


const INFO_01_DAY5_SPANISH = "Granjero local Chester Titor se ha reportado como desaparecido."
const INFO_02_DAY5_SPANISH = "Cualquier información sobre Chester o su paradero puede notificarlo a los números de emergencias.\n\nCualquier información por pequeña que sea será de mucha ayuda, sus familiares están muy preocupados."


const INFO_01_DAY6_SPANISH = "Chester Titor apareció y está sano y salvo."
const INFO_02_DAY6_SPANISH = "Todo parece estar bien a nivel de salud con Chester, pero sus familiares afirman que parece bastante desorientado y balbucea cosas sin sentido.\n\nChester será tratado por médicos profesionales para descartar cualquier daño cerebral."


const INFO_01_DAY7_SPANISH = "Chester Titor afirma haber sido abducido por extraterrestres."
const INFO_02_DAY7_SPANISH = "El ex-granjero local afirma que los extraterrestres los enviaron al futuro donde aprendió mucho de la sociedad del siglo XXI\n\nSus familiares comentan que todo parece indicar a un trauma provocado por se desaparición días atrás."


const INFO_01_DAY2_ENGLISH = "Local farmer Chester Titor faces aliens with his old tractor."
const INFO_02_DAY2_ENGLISH = "Chester Titor claims to have shot at extraterrestrial beings that were invading his land.\n\n\"They had large, dark eyes\" said Chester."


const INFO_01_DAY3_ENGLISH = "Unreleased photograph of a flying saucer.\n\nCourtesy of Chester Titor."


const INFO_02_DAY3_ENGLISH = "Chester Titor claims to have seen and photographed a flying object that comes from another planet.\n\nAccording to Chester, since yesterday, this object has been flying around the perimeter of his land."


const INFO_01_DAY4_ENGLISH = "Local farmer reports that beings from another planet are stealing his cows."
const INFO_02_DAY4_ENGLISH = "Chester Titor reports a series of abductions of his calves and cows.\n\nThe farmer claims to have witnessed his favorite cow, Lulu, being abducted by a flying saucer."


const INFO_01_DAY5_ENGLISH = "Local farmer Chester Titor has been reported missing."
const INFO_02_DAY5_ENGLISH = "Any information about Chester or his whereabouts can be reported to emergency numbers.\n\nAny information, no matter how small, will be of great help, as his family is very worried."


const INFO_01_DAY6_ENGLISH = "Chester Titor has appeared and is safe and sound."
const INFO_02_DAY6_ENGLISH = "Everything seems fine with Chester's health, but his family claims he appears quite disoriented and is babbling nonsense.\n\nChester will be treated by professional doctors to rule out any brain damage."


const INFO_01_DAY7_ENGLISH = "Chester Titor claims to have been abducted by aliens."
const INFO_02_DAY7_ENGLISH = "The former local farmer claims that the aliens sent him to the future, where he learned a lot about 21st-century society.\n\nhis family members comment that everything seems to indicate trauma caused by his disappearance days earlier."


const INFO_01_DAY2_CHINESE = "當地農民切斯特·提托用他的舊拖拉機對抗外星人。"
const INFO_02_DAY2_CHINESE = "切斯特·提托声称向入侵他土地的外星生物开枪。\n\n\"他们有大而黑的眼睛\" 切斯特说。"


const INFO_01_DAY3_CHINESE = "切斯特·提托提供的飞碟未公开照片。"
const INFO_02_DAY3_CHINESE = "切斯特·提托声称看到并拍摄了一架来自另一个星球的飞行物。\n\n据切斯特称，自昨天以来，这个物体一直在他的土地周围飞行。"


const INFO_01_DAY4_CHINESE = "当地农民举报来自另一个星球的生物正在偷他的牛。"
const INFO_02_DAY4_CHINESE = "切斯特·提托举报他的几头小牛和奶牛被绑架。\n\n这位农民声称亲眼目睹了他最喜欢的奶牛露露被飞碟绑架。"


const INFO_01_DAY5_CHINESE = "当地农民切斯特·提托被报告失踪。"
const INFO_02_DAY5_CHINESE = "任何关于切斯特或他下落的信息都可以通知紧急号码。\n\n任何哪怕是很小的信息都会有很大帮助，他的家人非常担心。"


const INFO_01_DAY6_CHINESE = "切斯特·提托已经出现，安全无恙。"
const INFO_02_DAY6_CHINESE = "切斯特的健康状况似乎一切正常，但他的家人表示他看起来相当迷茫，并且在胡言乱语。\n\n切斯特将由专业医生进行治疗，以排除任何脑部损伤。"


const INFO_01_DAY7_CHINESE = "切斯特·提托声称自己被外星人绑架。"
const INFO_02_DAY7_CHINESE = "这位前当地农民声称外星人把他送到了未来，他在那里学到了很多关于21世纪社会的知识。\n\n他的家人评论说，一切似乎都表明这是由于他几天前的失踪所造成的创伤。"


const WARNING_NEW_CAMPAIGN_SPANISH = "Iniciar una nueva campaña \neliminará los datos de la \ncampaña actual.\n\n¿Desea comenzar una nueva \ncampaña?"





const WARNING_NEW_CAMPAIGN_ENGLISH = "Start a new campaign will\ndelete the current campaign\ndata.\n\nDo you want to start a new\ncampaign?"





const WARNING_NEW_CAMPAIGN_CHINESE = "开始新活动将删除当前活动数据。\n\n您确定要开始新活动吗？"


const YES_BUTTON_TEXT_SPANISH = "Sí"
const YES_BUTTON_TEXT_ENGLISH = "Yes"
const NO_BUTTON_TEXT_ENGLISH = "No"
const YES_BUTTON_TEXT_CHINESE = "是"
const NO_BUTTON_TEXT_CHINESE = "不"
@onready var newspaper: Node2D = $Newspaper
@onready var continue_button: Button = $Newspaper / Buttons / Continue
@onready var new_campaign_button: Button = $"Newspaper/Buttons/New Campaign"
@onready var record_button: Button = $Newspaper / Buttons / Record
@onready var menu_button: Button = $Newspaper / Buttons / Menu
@onready var quit_button: Button = $Newspaper / Buttons / Quit
@onready var sfx_select: AudioStreamPlayer = $Newspaper / Select
@onready var sfx_accept: AudioStreamPlayer = $Newspaper / Accept
@onready var sfx_check_write: AudioStreamPlayer = $Newspaper / Check_Write
@onready var sfx_pick_up_folder: AudioStreamPlayer = $Newspaper / Pick_Up_Folder
@onready var sfx_spin: AudioStreamPlayer = $Newspaper / Newspaper
@onready var sfx_magic_dust: AudioStreamPlayer = $Newspaper / Magic_Dust
@onready var trophie: Node2D = $Newspaper / Trophie
@onready var level_record: Label = $"Newspaper/Level record"
@onready var day_count: Label = $"Newspaper/Day count"
@onready var info_01: Label = $Newspaper / Info_01
@onready var info_02: Label = $Newspaper / Info_02
@onready var pictures: AnimatedSprite2D = $Newspaper / Pictures / Pictures
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var details: Node2D = $Details
@onready var title: Label = $Details / Title
@onready var info: Label = $Details / Info
@onready var ok_button: Button = $Details / Ok
@onready var doppel_info_button: Button = $Newspaper / Buttons / Doppel_info
@onready var neighbor_info_button: Button = $Newspaper / Buttons / Neighbor_info
@onready var question: Node2D = $Question
@onready var yes_button: Button = $Question / Yes
@onready var no_button: Button = $Question / No
@onready var music: AudioStreamPlayer = $Music
@onready var title_new_campaign: Label = $Question / Paper / Title
@onready var yes: Button = $Question / Yes
@onready var no: Button = $Question / No

var achieve_unlock: bool = false
var info_top: String = ""
var info_bottom: String = ""
var info_text: String = ""
var info_text_2: String = ""

func _ready()->void :
	randomize()
	if Global.current_campaign_day > 0:
		continue_button.disabled = false
	else :
		continue_button.disabled = true
	achieve_unlock = false
	_set_sound_music_level()
	music.play()
	pictures.play("DDD")
	if Global.just_complete_level:
		_set_info()
		_set_summary()
		continue_button.disabled = false
	elif Global.current_campaign_day != 0:
		chester_text()
	_set_language()
	await get_tree().create_timer(1).timeout
	sfx_spin.play()
	animation_player.play("SPIN")
	await get_tree().create_timer(0.1).timeout
	newspaper.visible = true
	await get_tree().create_timer(1).timeout
	if achieve_unlock:
		_show_unlock_achievement()

func _set_sound_music_level()->void :
	sfx_accept.volume_db = Global.sound_level
	sfx_select.volume_db = Global.sound_level
	sfx_check_write.volume_db = Global.sound_level
	sfx_pick_up_folder.volume_db = Global.sound_level
	sfx_magic_dust.volume_db = Global.sound_level
	sfx_spin.volume_db = Global.sound_level
	music.volume_db = Global.music_level

func _set_info()->void :
	Global.total_doppels_captured += Global.doppel_captured_level
	if Global.doppel_entered_level > 0 or Global.chars_killed_level > 0:
		if not Global.red_handed:
			Global.current_campaign_day += 1
			Global.neighbors_kill_count += Global.neighbors_kill_count_aux
			_set_doppel_info()
			doppel_info_button.visible = true
			neighbor_info_button.visible = true
			Global.total_doppels_got_in += Global.doppel_entered_level

			Global.neighbors_killed_list_1F += Global.neighbors_killed_level_list_1F
			Global.neighbors_killed_list_2F += Global.neighbors_killed_level_list_2F
			Global.neighbors_killed_list_3F += Global.neighbors_killed_level_list_3F

			var string_aux_1 = str(Global.neighbors_killed_list_1F)
			var string_aux_2 = str(Global.neighbors_killed_list_2F)
			var string_aux_3 = str(Global.neighbors_killed_list_3F)
			var result = ""
			for digit in string_aux_1:
				if digit != "0":
					digit = "1"
				result += digit
			Global.neighbors_killed_list_1F = int(result)
			result = ""
			for digit in string_aux_2:
				if digit != "0":
					digit = "1"
				result += digit
			Global.neighbors_killed_list_2F = int(result)
			result = ""
			for digit in string_aux_3:
				if digit != "0":
					digit = "1"
				result += digit
			Global.neighbors_killed_list_3F = int(result)

			var list = Global.update_neighbors_dead()
			var random_idx = randi_range(0, len(list) - 1)
			if len(list) != 0:
				if list[random_idx] == "Roman_Stilnsky":
					pictures.play("Roman")
				elif list[random_idx] == "Lois_Stilnsky":
					pictures.play("Lois")
				elif list[random_idx] == "Margarette_Bubbles":
					pictures.play("Margarette")
				elif list[random_idx] == "Alf_Cappuccin":
					pictures.play("Alf")
				elif list[random_idx] == "Elenois_Sverchzt":
					pictures.play("Elenois")
				elif list[random_idx] == "Selenne_Sverchzt":
					pictures.play("Selenne")
				elif list[random_idx] == "Izaack_Gauss":
					pictures.play("Izaack")
				elif list[random_idx] == "Rafttelyn_Cappuccin":
					pictures.play("Rafttellyn")
				elif list[random_idx] == "Arnold_Schmicht":
					pictures.play("Arnold")
				elif list[random_idx] == "Gloria_Schmicht":
					pictures.play("Gloria")
				elif list[random_idx] == "Robertosky_Peachman":
					pictures.play("Robertsky")
				elif list[random_idx] == "Albertosky_Peachman":
					pictures.play("Albertsky")
				elif list[random_idx] == "Mia_Stone":
					pictures.play("Mia")
				elif list[random_idx] == "Dr_W_Afton":
					pictures.play("Afton")
				elif list[random_idx] == "Angus_Ciprianni":
					pictures.play("Angus")
				elif list[random_idx] == "Francis_Mosses":
					pictures.play("Francis")
				elif list[random_idx] == "Anastacha_Mikaelys":
					pictures.play("Anastacha")
				elif list[random_idx] == "Nacha_Mikaelys":
					pictures.play("Nacha")
				elif list[random_idx] == "Steven_Rudboys":
					pictures.play("Steven")
				elif list[random_idx] == "Mclooy_Rudboys":
					pictures.play("Mclooy")
				else :
					pictures.play("DDD")

				if Global.language == SPANISH_VALUE:
					info_top = "Amados vecinos de\n		la ciudad perdieron \n		su vida el día de\n		ayer por culpa de\n		los doppelgangers."




					info_bottom = "Resumen del día:"
				elif Global.language == ENGLISH_VALUE:
					info_top = "Beloved neighbors of\n		the city lost their\n		lives yesterday because\n		of the doppelgangers."



					info_bottom = "Summary of the day:"
				elif Global.language == CHINESE_VALUE:
						info_top = "我们城市的亲爱的邻居们昨天因为替身失去了他们的生命。"
						info_bottom = "今日总结："
			else :
				chester_text()
				doppel_info_button.visible = false
				neighbor_info_button.visible = false
		else :
			chester_text()
	else :
		if not Global.red_handed:
			Global.current_campaign_day += 1
		chester_text()

func chester_text()->void :
	match Global.current_campaign_day:
			1:
				pictures.play("Chester_01")
				if Global.language == SPANISH_VALUE:
					info_top = INFO_01_DAY2_SPANISH
					info_bottom = INFO_02_DAY2_SPANISH
				elif Global.language == ENGLISH_VALUE:
					info_top = INFO_01_DAY2_ENGLISH
					info_bottom = INFO_02_DAY2_ENGLISH
				elif Global.language == CHINESE_VALUE:
					info_top = INFO_01_DAY2_CHINESE
					info_bottom = INFO_02_DAY2_CHINESE
			2:
				pictures.play("Chester_02")
				if Global.language == SPANISH_VALUE:
					info_top = INFO_01_DAY3_SPANISH
					info_bottom = INFO_02_DAY3_SPANISH
				elif Global.language == ENGLISH_VALUE:
					info_top = INFO_01_DAY3_ENGLISH
					info_bottom = INFO_02_DAY3_ENGLISH
				elif Global.language == CHINESE_VALUE:
					info_top = INFO_01_DAY3_CHINESE
					info_bottom = INFO_02_DAY3_CHINESE
			3:
				pictures.play("Chester_03")
				if Global.language == SPANISH_VALUE:
					info_top = INFO_01_DAY4_SPANISH
					info_bottom = INFO_02_DAY4_SPANISH
				elif Global.language == ENGLISH_VALUE:
					info_top = INFO_01_DAY4_ENGLISH
					info_bottom = INFO_02_DAY4_ENGLISH
				elif Global.language == CHINESE_VALUE:
					info_top = INFO_01_DAY4_CHINESE
					info_bottom = INFO_02_DAY4_CHINESE
			4:
				pictures.play("Chester_04")
				if Global.language == SPANISH_VALUE:
					info_top = INFO_01_DAY5_SPANISH
					info_bottom = INFO_02_DAY5_SPANISH
				elif Global.language == ENGLISH_VALUE:
					info_top = INFO_01_DAY5_ENGLISH
					info_bottom = INFO_02_DAY5_ENGLISH
				elif Global.language == CHINESE_VALUE:
					info_top = INFO_01_DAY5_CHINESE
					info_bottom = INFO_02_DAY5_CHINESE
			5:
				pictures.play("Chester_05")
				if Global.language == SPANISH_VALUE:
					info_top = INFO_01_DAY6_SPANISH
					info_bottom = INFO_02_DAY6_SPANISH
				elif Global.language == ENGLISH_VALUE:
					info_top = INFO_01_DAY6_ENGLISH
					info_bottom = INFO_02_DAY6_ENGLISH
				elif Global.language == CHINESE_VALUE:
					info_top = INFO_01_DAY6_CHINESE
					info_bottom = INFO_02_DAY6_CHINESE
			_:
				pictures.play("Chester_06")
				if Global.language == SPANISH_VALUE:
					info_top = INFO_01_DAY7_SPANISH
					info_bottom = INFO_02_DAY7_SPANISH
				elif Global.language == ENGLISH_VALUE:
					info_top = INFO_01_DAY7_ENGLISH
					info_bottom = INFO_02_DAY7_ENGLISH
				elif Global.language == CHINESE_VALUE:
					info_top = INFO_01_DAY7_CHINESE
					info_bottom = INFO_02_DAY7_CHINESE

func _set_language()->void :
	if Global.language == SPANISH_VALUE:
		continue_button.text = CONTINUE_TEXT_SPANISH
		new_campaign_button.text = NEW_TEXT_SPANISH
		record_button.text = RECORD_TEXT_SPANISH
		menu_button.text = MENU_TEXT_SPANISH
		quit_button.text = QUIT_TEXT_SPANISH
		level_record.text = TITLE_TEXT_SPANISH
		day_count.text = DAY_TEXT_SPANISH + str(Global.current_campaign_day + 1)
		title.text = TITLE_DOPPEL_INFO_SPANISH
		doppel_info_button.text = DETAILS_BUTTON_SPANISH
		neighbor_info_button.text = DETAILS_BUTTON_NEIGHBOR_SPANISH
		title_new_campaign.text = WARNING_NEW_CAMPAIGN_SPANISH
		yes.text = YES_BUTTON_TEXT_SPANISH
		no.text = NO_BUTTON_TEXT_ENGLISH
		match Global.current_campaign_day:
			0:
				info_01.text = INFO_01_SPANISH
				info_02.text = INFO_02_SPANISH
			_:
				info_01.text = info_top
				info_02.text = info_bottom
	elif Global.language == ENGLISH_VALUE:
		continue_button.text = CONTINUE_TEXT_ENGLISH
		new_campaign_button.text = NEW_TEXT_ENGLISH
		record_button.text = RECORD_TEXT_ENGLISH
		menu_button.text = MENU_TEXT_ENGLISH
		quit_button.text = QUIT_TEXT_ENGLISH
		level_record.text = TITLE_TEXT_ENGLISH
		day_count.text = DAY_TEXT_ENGLISH + str(Global.current_campaign_day + 1)
		title.text = TITLE_DOPPEL_INFO_ENGLISH
		doppel_info_button.text = DETAILS_BUTTON_ENGLISH
		neighbor_info_button.text = DETAILS_BUTTON_NEIGHBOR_ENGLISH
		title_new_campaign.text = WARNING_NEW_CAMPAIGN_ENGLISH
		yes.text = YES_BUTTON_TEXT_ENGLISH
		no.text = NO_BUTTON_TEXT_ENGLISH
		match Global.current_campaign_day:
			0:
				info_01.text = INFO_01_ENGLISH
				info_02.text = INFO_02_ENGLISH
			_:
				info_01.text = info_top
				info_02.text = info_bottom
	elif Global.language == CHINESE_VALUE:
		continue_button.text = CONTINUE_TEXT_CHINESE
		new_campaign_button.text = NEW_TEXT_CHINESE
		record_button.text = RECORD_TEXT_CHINESE
		menu_button.text = MENU_TEXT_CHINESE
		quit_button.text = QUIT_TEXT_CHINESE
		level_record.text = TITLE_TEXT_CHINESE
		day_count.text = DAY_TEXT_CHINESE + str(Global.current_campaign_day + 1)
		title.text = TITLE_DOPPEL_INFO_CHINESE
		doppel_info_button.text = DETAILS_BUTTON_CHINESE
		neighbor_info_button.text = DETAILS_BUTTON_NEIGHBOR_CHINESE
		title_new_campaign.text = WARNING_NEW_CAMPAIGN_CHINESE
		yes.text = YES_BUTTON_TEXT_CHINESE
		no.text = NO_BUTTON_TEXT_CHINESE
		match Global.current_campaign_day:
			0:
				info_01.text = INFO_01_CHINESE
				info_02.text = INFO_02_CHINESE
			_:
				info_01.text = info_top
				info_02.text = info_bottom

func _set_summary()->void :
	if Global.doppel_entered_level > 0:
		if Global.red_handed:
			Global.days_killed_record += 1
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
	if !Global.did_folder_opened and Global.doppel_entered_level == 0 and Global.achievements["NO_FOLDER"] == 0:
		achieve_unlock = true
		Global.achievements["NO_FOLDER"] = 1
	Global.save_record()
	Global.save_achievements()
	Global.reset_values()

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

func _on_continue_mouse_entered()->void :
	if !continue_button.disabled:
		_play_sfx(0)
	continue_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_continue_mouse_exited()->void :
	continue_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_continue_pressed()->void :
	Global.just_complete_level = false
	Global.update_neighbors_alive()
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	if Global.current_campaign_day != 7:
		if len(Global.neighbors_alive_list) == 0:
			Global.scene = FINAL_SCENE
		else :
			Global.scene = OFFICE_SCENE
	else :
		Global.scene = FINAL_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_new_campaign_mouse_entered()->void :
	if !new_campaign_button.disabled:
		_play_sfx(0)
	new_campaign_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_new_campaign_mouse_exited()->void :
	new_campaign_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_new_campaign_pressed()->void :
	_play_sfx(1)
	doppel_info_button.disabled = true
	neighbor_info_button.disabled = true
	menu_button.disabled = true
	continue_button.disabled = true
	new_campaign_button.disabled = true
	record_button.disabled = true
	quit_button.disabled = true
	Global.update_neighbors_alive()
	_play_sfx(2)
	question.visible = true

func _on_record_mouse_entered()->void :
	if !record_button.disabled:
		_play_sfx(0)
	record_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_record_mouse_exited()->void :
	record_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_record_pressed()->void :
	Global.just_complete_level = false
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	Global.scene = RECORD_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_menu_mouse_entered()->void :
	if !menu_button.disabled:
		_play_sfx(0)
	menu_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_menu_mouse_exited()->void :
	menu_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_menu_pressed()->void :
	Global.just_complete_level = false
	_play_sfx(1)
	get_tree().paused = false
	await get_tree().create_timer(0.5).timeout
	Global.scene = MENU_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_quit_mouse_entered()->void :
	if !quit_button.disabled:
		_play_sfx(0)
	quit_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_quit_mouse_exited()->void :
	quit_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_quit_pressed()->void :
	Global.just_complete_level = false
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

func _on_doppel_info_mouse_entered()->void :
	if !doppel_info_button.disabled:
		_play_sfx(0)
	doppel_info_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_doppel_info_mouse_exited()->void :
	doppel_info_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_doppel_info_pressed()->void :
	info.text = info_text
	_play_sfx(1)
	_play_sfx(2)
	doppel_info_button.disabled = true
	neighbor_info_button.disabled = true
	menu_button.disabled = true
	continue_button.disabled = true
	new_campaign_button.disabled = true
	record_button.disabled = true
	quit_button.disabled = true
	var tween = create_tween()
	tween.tween_property(details, "position", FINAL_POS_DETAILS, TWEEN_TIME)
	tween.tween_callback(_folder_open)

func _on_neighbor_info_mouse_entered()->void :
	if !neighbor_info_button.disabled:
		_play_sfx(0)
	neighbor_info_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_neighbor_info_mouse_exited()->void :
	neighbor_info_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_neighbor_info_pressed()->void :
	info.text = info_text_2
	_play_sfx(1)
	_play_sfx(2)
	doppel_info_button.disabled = true
	neighbor_info_button.disabled = true
	menu_button.disabled = true
	continue_button.disabled = true
	new_campaign_button.disabled = true
	record_button.disabled = true
	quit_button.disabled = true
	var tween = create_tween()
	tween.tween_property(details, "position", FINAL_POS_DETAILS, TWEEN_TIME)
	tween.tween_callback(_folder_open)

func _on_ok_mouse_entered()->void :
	_play_sfx(0)
	ok_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_ok_mouse_exited()->void :
	ok_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_ok_pressed()->void :
	_play_sfx(1)
	_play_sfx(2)
	ok_button.disabled = true
	var tween = create_tween()
	tween.tween_property(details, "position", INITIAL_POS_DETAILS, TWEEN_TIME)
	tween.tween_callback(_folder_close)

func _folder_close()->void :
	doppel_info_button.disabled = false
	neighbor_info_button.disabled = false
	menu_button.disabled = false
	if Global.current_campaign_day > 0:
		continue_button.disabled = false
	new_campaign_button.disabled = false
	record_button.disabled = false
	quit_button.disabled = false

func _folder_open()->void :
	ok_button.disabled = false

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

func _reset_trophie()->void :
	trophie.visible = false
	trophie.scale = TROPHIE_INITINAL_SCALE
	trophie.modulate = Color(1, 1, 1, 1)

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

func _on_yes_mouse_entered()->void :
	_play_sfx(0)
	yes_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_yes_mouse_exited()->void :
	yes_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_yes_pressed()->void :
	Global.just_complete_level = false
	_play_sfx(1)
	Global.reset_campaign()
	await get_tree().create_timer(0.5).timeout
	Global.scene = OFFICE_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _on_no_mouse_entered()->void :
	_play_sfx(0)
	no_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_GREY)

func _on_no_mouse_exited()->void :
	no_button.add_theme_color_override("font_outline_color", BUTTONS_OUTLINE_COLOR_BLACK)

func _on_no_pressed()->void :
	_play_sfx(1)
	_play_sfx(2)
	question.visible = false
	_folder_close()
