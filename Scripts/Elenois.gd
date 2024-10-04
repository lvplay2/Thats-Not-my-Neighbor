extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100, 270)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(995, 270)
const CHAR_AT_DELETE_POS = Vector2(1900, 270)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10
const FAKE_NAME_01 = "Selenne"
const FAKE_NAME_02 = "Elenoiis"
const FAKE_NAME_03 = "Elenoiss"
const FAKE_LAST_NAME_01 = "Svercht"
const FAKE_LAST_NAME_02 = "Svechzt"
const FAKE_LAST_NAME_03 = "Sverchst"
const ENTRY_REASON_ENGLISH = "I'm a resident of the building.\nMy apartment is the 04 \non the first floor."
const ENTRY_REASON_SPANISH = "Soy residente del edificio.\nMi apartamento es el 04 del \nprimer piso."
const ENTRY_REASON_CHINESE = "我是这栋楼的居民。\n我的公寓在一楼，门牌号是04。"
const ENTRY_REASON_02_ENGLISH = "I'm a resident of the building.\nI come from my job as a model."
const ENTRY_REASON_02_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como modelo."
const ENTRY_REASON_02_CHINESE = "我是这栋楼的居民。\n我外出工作，我是一名模特。"
const ENTRY_REASON_DOPPEL_01_ENGLISH = "I'm a resident of the building.\nI went out to do human activities."
const ENTRY_REASON_DOPPEL_01_SPANISH = "Soy residente del edificio.\nSalí hacer mis actividades de humano."
const ENTRY_REASON_DOPPEL_01_CHINESE = "我是这栋楼的居民。\n我出去进行人类活动。"
const ENTRY_REASON_DOPPEL_01_SECOND_ENGLISH = "I'm your neighbor.\nSo you'll let me in and you won't question anything.."
const ENTRY_REASON_DOPPEL_01_SECOND_SPANISH = "Soy tu vecina.\nAsí que me dejarás entrar y no cuestionarás nada."
const ENTRY_REASON_DOPPEL_01_SECOND_CHINESE = "我是你的邻居。\n那么你会让我进来，并且不问任何问题。"
const ENTRY_REASON_DOPPEL_02_ENGLISH = "I'm not here to eat anyone. \nI only eat human food \nlike everyone else. \nLet me in, to make my normal \n human meals."
const ENTRY_REASON_DOPPEL_02_SPANISH = "No vengo a comerme a nadie. \nSolo consumo comida \nde humano como todos. \nDéjame entrar, para hacer \nmis comidas de humano normal."
const ENTRY_REASON_DOPPEL_02_CHINESE = "我不是来吃掉任何人的。\n我只是像所有人一样消耗人类食物。\n让我进来，做我平常的人类食物。"
const ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH = "I'm a resident of the building.\nI come from my job as a receptionist."
const ENTRY_REASON_DOPPEL_02_SECOND_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como recepcionista."
const ENTRY_REASON_DOPPEL_02_SECOND_CHINESE = "我是这栋楼的居民。\n我外出工作，我是一名接待员。"
const FAKE_ID_01 = "785613269514"
const FAKE_ID_02 = "84532314956"
const FAKE_ID_03 = "845823014956"
const FAKE_APARTMENT_ENGLISH_01 = "F10-40"
const FAKE_APARTMENT_ENGLISH_02 = "F02-04"
const FAKE_APARTMENT_ENGLISH_03 = "F01-03"
const FAKE_APARTMENT_SPANISH_01 = "P10-40"
const FAKE_APARTMENT_SPANISH_02 = "P02-04"
const FAKE_APARTMENT_SPANISH_03 = "P01-03"
const FAKE_DATE_01 = "03/1908"
const FAKE_DATE_02 = "13/1980"
const FAKE_DATE_03 = "03/1945"

@onready var animation = $Animation
@onready var talking = $Talk
@onready var mouth = $Head / Mouth
@onready var doppel_mouth = $Head / Doppel_Mouth
@onready var mole_doppel = $Head / Mole_Doppel
@onready var mole = $Head / Mole
@onready var doppel_head = $Head / Doppel_Head
@onready var head = $Head / Head
@onready var eyes = $Head / Eyes
@onready var doppel_eyes = $Head / Doppel_Eyes
@onready var nose = $Head / Nose
@onready var nose_doppel = $Head / Nose_Doppel
@onready var arms = $Body / Arms
@onready var arms_doppel = $Body / Arms_Doppel
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps
@onready var doppel_mouth_animation = $Doppel_Mouth
@onready var nose_doppel_02: Sprite2D = $Head / Nose_Doppel_02

var current_text = []
var is_doppelganger = false
var checklist_values = []
var question_answers_spanish = {"id_ok": ["¿Mi identificación?", "No veo ningún problema con mi identificación."], "appearance_ok": ["¿Qué hay de raro con mi apariencia?", "Me parece que todo está perfecto con mi apariencia."], "entry_request_ok": ["¿Mi solicitud de ingreso?", "No veo ningún problema con mi solicitud."], "today_list_ok": ["¿No estoy en la lista de hoy?", "Debe haber un error, si debo estar en la lista.", "Mire la lista nuevamente."]}
var question_answers_english = {"id_ok": ["My ID?", "I don't see anything wrong with my ID."], "appearance_ok": ["What's wrong with my appearance?", "I think everything it's fine with my appearance."], "entry_request_ok": ["My entry request?", "I don't see anything wrong with my entry request."], "today_list_ok": ["Am I not on today's list?", "There must be a mistake, I should be on the list.", "Look at the list again."]}
var question_answers_chinese = {"id_ok": ["我的身份证？", "我觉得我的身份证没什么问题。"], "appearance_ok": ["我的外貌有什么问题？ ", "我觉得我的外貌一切都很好。"], "entry_request_ok": ["我不是在今天的名单上吗？", "我觉得我的入场申请没有任何问题。"], "today_list_ok": ["我不是在今天的名单上吗？", "一定是有错误，我应该在名单上。", "再看一次名单。"]}
var entry_request_reason = ""
var hello_text_english = ["Hello."]
var hello_text_spanish = ["Hola."]
var hello_text_chinese = ["你好。"]
var id_photo = load("res://Assets/Graphics/Char_Elenois_Small_Photo.png")
var entry_photo = load("res://Assets/Graphics/Char_Elenois_Long_Photo.png")
var id_photo_doppel_01 = load("res://Assets/Graphics/Char_Elenois_Small_Photo_Doppel_01.png")
var entry_photo_doppel_01 = load("res://Assets/Graphics/Char_Elenois_Long_Photo_Doppel_01.png")
var no_photo = load("res://Assets/Graphics/Button_pressed.png")
var id_photo_doppel_02 = load("res://Assets/Graphics/Char_Elenois_Small_Photo_Doppel_02.png")
var entry_photo_doppel_02 = load("res://Assets/Graphics/Char_Elenois_Long_Photo_Doppel_02.png")
var id_photo_doppel_03 = load("res://Assets/Graphics/Char_Elenois_Small_Photo_Doppel_03.png")
var entry_photo_doppel_03 = load("res://Assets/Graphics/Char_Elenois_Long_Photo_Doppel_03.png")
var speak_flag = true
var name_char = Global.ELENOIS_SVERCHZT_DATA["NAME"]
var last_name_char = Global.ELENOIS_SVERCHZT_DATA["LAST_NAME"]
var number_id = Global.ELENOIS_SVERCHZT_DATA["ID_NUMBER"]
var id_exp_date = Global.ELENOIS_SVERCHZT_DATA["ID_EXPIRATION"]
var apart_number_spanish = Global.ELENOIS_SVERCHZT_DATA["APARTMENT_NUMBER_SPANISH"]
var apart_number_english = Global.ELENOIS_SVERCHZT_DATA["APARTMENT_NUMBER_ENGLISH"]
var today_list_doppel_answer = []
var dont_show_id = false
var dont_show_entry_request = false
var random_value = 0
var doppel_dont_show_id_text = [""]
var doppel_id_text = [""]
var doppel_appearance_text = [""]
var doppel_dont_show_entry_text = [""]
var doppel_entry_text = [""]
var doppel_not_today_list_text = [""]
var doppel_today_list_text = [""]
var doppel_its_all_ok_text = [""]
var doppel_appearance_no_hat_text = [""]
var doppel_number
var doppel_reveal_flag = false
var repeat_answer_spanish = ["Ya respondí su pregunta."]
var repeat_answer_english = ["I already answered your question."]
var repeat_answer_chinese = ["我已经回答了你的问题。"]
var texts_changed = false

func _ready()->void :
	randomize()
	set_sfx_volume()
	random_value = randi_range(0, 5)
	if random_value == 0:
		dont_show_id = true
	random_value = randi_range(0, 5)
	if random_value == 0:
		dont_show_entry_request = true
	_set_entry_reason()
	random_value = randi_range(0, 1)
	if random_value == 0:
		if Global.language == SPANISH_VALUE:
			entry_request_reason = ENTRY_REASON_02_SPANISH
		elif Global.language == ENGLISH_VALUE:
			entry_request_reason = ENTRY_REASON_02_ENGLISH
		elif Global.language == CHINESE_VALUE:
			entry_request_reason = ENTRY_REASON_02_CHINESE
	var tween = create_tween()
	tween.tween_property(self, "position", CHAR_AT_CENTER_WINDOW_POS, TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(4)
	await get_tree().create_timer(TIME_ON_TWEEN).timeout
	if Global.is_door_locked:
		animation.play("IDLE")

func _process(_delta)->void :
	if self.position == CHAR_AT_CENTER_WINDOW_POS:
		if !Global.is_door_locked:
			delete()
		elif speak_flag:
			_first_words()

func set_sfx_volume()->void :
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func _first_words()->void :
	speak_flag = false
	if !dont_show_id:
		get_parent().get_parent().set_id(name_char, last_name_char, number_id, id_exp_date, id_photo)
	if !dont_show_entry_request:
		if Global.language == SPANISH_VALUE:
			get_parent().get_parent().set_entry_request(name_char, last_name_char, apart_number_spanish, entry_request_reason, entry_photo)
		else :
			get_parent().get_parent().set_entry_request(name_char, last_name_char, apart_number_english, entry_request_reason, entry_photo)
	await get_tree().create_timer(0.5).timeout
	change_current_text(0)
	get_parent().get_parent().text_selection()

func _set_entry_reason()->void :
	var n_random = randi_range(0, 1)
	match n_random:
		0:
			if Global.language == SPANISH_VALUE:
				entry_request_reason = ENTRY_REASON_SPANISH
			elif Global.language == ENGLISH_VALUE:
				entry_request_reason = ENTRY_REASON_ENGLISH
			elif Global.language == CHINESE_VALUE:
				entry_request_reason = ENTRY_REASON_CHINESE
		1:
			if Global.language == SPANISH_VALUE:
				entry_request_reason = ENTRY_REASON_02_SPANISH
			elif Global.language == ENGLISH_VALUE:
				entry_request_reason = ENTRY_REASON_02_ENGLISH
			elif Global.language == CHINESE_VALUE:
				entry_request_reason = ENTRY_REASON_02_CHINESE
		_:
			entry_request_reason = " "

func talk()->void :
	talking.play("TALK")
	if doppel_reveal_flag:
		mouth.play("DOPPEL_TALK")
	else :
		mouth.play("TALK")

func change_current_text(n: int)->void :
	if !is_doppelganger:
		match n:
			0:
				if Global.language == SPANISH_VALUE:
					current_text = hello_text_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = hello_text_english
				elif Global.language == CHINESE_VALUE:
					current_text = hello_text_chinese
			1:
				if Global.is_id_wrong_answer:
					_repeat_answer()
				else :
					if dont_show_id:
						dont_show_id = false
						if Global.language == SPANISH_VALUE:
							current_text += ["Aquí está mi identificación."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["Here is my ID."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["这是我的身份证。"]
						get_parent().get_parent().set_id(name_char, last_name_char, number_id, id_exp_date, id_photo)
					else :
						if Global.language == SPANISH_VALUE:
							current_text += question_answers_spanish["id_ok"]
						elif Global.language == ENGLISH_VALUE:
							current_text += question_answers_english["id_ok"]
						elif Global.language == CHINESE_VALUE:
							current_text += question_answers_chinese["id_ok"]
					Global.is_id_wrong_answer = true
			2:
				if Global.is_appearance_wrong_answer:
					_repeat_answer()
				else :
					if Global.language == SPANISH_VALUE:
						current_text += question_answers_spanish["appearance_ok"]
					elif Global.language == ENGLISH_VALUE:
						current_text += question_answers_english["appearance_ok"]
					elif Global.language == CHINESE_VALUE:
						current_text += question_answers_chinese["appearance_ok"]
					Global.is_appearance_wrong_answer = true
			3:
				if Global.is_entry_request_wrong_answer:
					_repeat_answer()
				else :
					if dont_show_entry_request:
						dont_show_entry_request = false
						if Global.language == SPANISH_VALUE:
							current_text += ["Aquí está mi solicitud de ingreso."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["Here is my entry request."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["这是我的入场请求。"]
						if Global.language == SPANISH_VALUE:
							get_parent().get_parent().set_entry_request(name_char, last_name_char, apart_number_spanish, entry_request_reason, entry_photo)
						else :
							get_parent().get_parent().set_entry_request(name_char, last_name_char, apart_number_english, entry_request_reason, entry_photo)
					else :
						if Global.language == SPANISH_VALUE:
							current_text += question_answers_spanish["entry_request_ok"]
						elif Global.language == ENGLISH_VALUE:
							current_text += question_answers_english["entry_request_ok"]
						elif Global.language == CHINESE_VALUE:
							current_text += question_answers_chinese["entry_request_ok"]
					Global.is_entry_request_wrong_answer = true
			4:
				if Global.is_today_list_wrong_answer:
					_repeat_answer()
				else :
					if Global.language == SPANISH_VALUE:
						current_text += question_answers_spanish["today_list_ok"]
					elif Global.language == ENGLISH_VALUE:
						current_text += question_answers_english["today_list_ok"]
					elif Global.language == CHINESE_VALUE:
						current_text += question_answers_chinese["today_list_ok"]
				Global.is_today_list_wrong_answer = true
			5:
				if Global.language == SPANISH_VALUE:
					current_text = ["¡Excelente!", "La puerta por favor."]
				elif Global.language == ENGLISH_VALUE:
					current_text = ["Excellent!", "The door please."]
				elif Global.language == CHINESE_VALUE:
					current_text = ["优秀！", "请开门。"]
			-1:
				_repeat_answer()
			_:
				current_text = []
	else :
		match n:
			0:
				if Global.language == SPANISH_VALUE:
					current_text = hello_text_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = hello_text_english
				elif Global.language == CHINESE_VALUE:
					current_text = hello_text_chinese
			1:
				if Global.is_id_wrong_answer:
					_repeat_answer()
				else :
					if dont_show_id:
						current_text += doppel_dont_show_id_text
						if doppel_number in [0, 2, 3, 4, 5, 6, 7, 8]:
							get_parent().get_parent().set_id(name_char, last_name_char, number_id, id_exp_date, id_photo)
					else :
						current_text += doppel_id_text
					Global.is_id_wrong_answer = true
			2:
				if Global.is_appearance_wrong_answer:
					_repeat_answer()
				else :
					current_text += doppel_appearance_text
				Global.is_appearance_wrong_answer = true
			3:
				if Global.is_entry_request_wrong_answer:
					_repeat_answer()
				else :
					if dont_show_entry_request:
						current_text += doppel_dont_show_entry_text
						if doppel_number in [0, 2, 3, 4, 5, 6, 7, 8]:
							if Global.language == SPANISH_VALUE:
								get_parent().get_parent().set_entry_request(name_char, last_name_char, apart_number_spanish, entry_request_reason, entry_photo)
							else :
								get_parent().get_parent().set_entry_request(name_char, last_name_char, apart_number_english, entry_request_reason, entry_photo)
					else :
						current_text += doppel_entry_text
					Global.is_entry_request_wrong_answer = true
			4:
				if Global.is_today_list_wrong_answer:
					_repeat_answer()
				else :
					if !Global.CHAR_LIST[4] in Global.today_list:
						current_text += doppel_not_today_list_text
						if doppel_number in [4, 6]:
							change_voice()
							current_text = doppel_not_today_list_text
					else :
						current_text += doppel_today_list_text
					Global.is_today_list_wrong_answer = true
			5:
				current_text = doppel_its_all_ok_text
			-1:
				_repeat_answer()
			_:
				current_text = []

func _repeat_answer()->void :
	if Global.language == SPANISH_VALUE:
		current_text = repeat_answer_spanish
	elif Global.language == ENGLISH_VALUE:
		current_text = repeat_answer_english
	elif Global.language == CHINESE_VALUE:
		current_text = repeat_answer_chinese

func get_text():
	return current_text.duplicate()

func _play_sfx(n: int)->void :
	match n:
		0:
			sfx_voice_01.play()
		1:
			sfx_voice_02.play()
		2:
			sfx_voice_03.play()
		3:
			sfx_voice_04.play()
		4:
			sfx_footsteps.play()

func play_random_sfx()->void :
	var check = get_parent().get_parent().text_label.visible_ratio
	if check != VISIBLE_RATIO:
		_play_sfx(randi_range(0, 3))
		talk()
	else :
		talking.stop()
		if doppel_reveal_flag:
			mouth.play("CLOSE_DOPPEL")
			if !texts_changed:
				texts_changed = true
				change_texts()
		else :
			mouth.play("CLOSE")

func delete()->void :
	var tween = create_tween()
	tween.tween_property(self, "position", CHAR_AT_DELETE_POS, TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(4)
	get_parent().get_parent().on_neighbor_gone()
	await get_tree().create_timer(3).timeout
	get_parent().get_parent().start_time_between_char()
	delete_free()

func delete_free()->void :
	_record_update()
	call_deferred("queue_free")

func change_voice()->void :
	if !doppel_reveal_flag:
		sfx_voice_01 = $Voice_05
		sfx_voice_02 = $Voice_06
		sfx_voice_03 = $Voice_07
		sfx_voice_04 = $Voice_08
		doppel_eyes.visible = true
		eyes.visible = false
		mouth.scale = Vector2(0.65, 0.85)
		if Global.achievements["CATCH_DOPPEL"] == 0:
			Global.achievements["CATCH_DOPPEL"] = 1
			get_parent().get_parent()._show_unlock_achievement()
	doppel_reveal_flag = true
	Global.red_handed = true

func change_texts()->void :
	if Global.language == SPANISH_VALUE:
		doppel_dont_show_id_text = ["¿Qué tanto le importan sus vecinos?", "Seguro ni saben su nombre, y usted arriesga su vida por ellos todos los días.", "Permítame ingresar.", "Usted quiere eso."]
		doppel_id_text = ["¿Qué tanto le importan sus vecinos?", "Seguro ni saben su nombre, y usted arriesga su vida por ellos todos los días.", "Permítame ingresar.", "Usted quiere eso."]
		doppel_appearance_text = ["¿Quiere ver mi forma real?", "Abra la puerta y se la mostraré."]
		doppel_entry_text = ["Papeles, papeles y más papeles.", "Yo puedo acabar con eso, solo debe abrir la puerta."]
		doppel_dont_show_entry_text = ["¿Quiere ver mi forma real?", "Abra la puerta y se la mostraré."]
		doppel_not_today_list_text = ["¿Tiene miedo?", "¿Puedo hacerle una visita en la noche mientras duerme?"]
		doppel_today_list_text = ["¿Qué tanto le importan sus vecinos?", "Seguro ni saben su nombre, y usted arriesga su vida por ellos todos los días.", "Permítame ingresar.", "Usted quiere eso."]
		doppel_its_all_ok_text = ["Esa es la decisión correcta."]
		repeat_answer_spanish = ["¿Quiere ver mi forma real?", "Abra la puerta y se la mostraré."]
	elif Global.language == ENGLISH_VALUE:
		doppel_dont_show_id_text = ["How much do you care about your neighbors?", "They probably don't even know your name, and you risk your life for them every day.", "Allow me in.", "You want that."]
		doppel_id_text = ["How much do you care about your neighbors?", "They probably don't even know your name, and you risk your life for them every day.", "Allow me in.", "You want that."]
		doppel_appearance_text = ["Do you want to see my real form?", "Open the door and I'll show it to you."]
		doppel_dont_show_entry_text = ["Papers, papers and more papers.", "I can put an end to that, you just have to open the door."]
		doppel_entry_text = ["Are you scared?", "Can I visit you at night while you sleep?"]
		doppel_not_today_list_text = ["Do you want to see my real form?", "Open the door and I'll show it to you."]
		doppel_today_list_text = ["How much do you care about your neighbors?", "They probably don't even know your name, and you risk your life for them every day.", "Allow me in.", "You want that."]
		doppel_its_all_ok_text = ["That's the right decision."]
		repeat_answer_english = ["Do you want to see my real form?", "Open the door and I'll show it to you."]
	elif Global.language == CHINESE_VALUE:
		doppel_dont_show_id_text = ["你有多在意你的邻居？", "他们可能甚至不知道你的名字，而你每天都冒着生命危险为他们工作。", "让我进去。", "你想要那个。"]
		doppel_id_text = ["你有多在意你的邻居？", "他们可能甚至不知道你的名字，而你每天都冒着生命危险为他们工作。", "让我进去。", "你想要那个。"]
		doppel_appearance_text = ["你想看我的真实形态吗？", "打开门，我会给你看的。"]
		doppel_dont_show_entry_text = ["文件，文件，还有更多文件。", "我可以结束这一切，你只需打开门。"]
		doppel_entry_text = ["你害怕吗？", "我能在你睡觉的时候晚上拜访你吗？"]
		doppel_not_today_list_text = ["你想看我的真实形态吗？", "打开门，我会给你看的。"]
		doppel_today_list_text = ["你有多在意你的邻居？", "他们可能甚至不知道你的名字，而你每天都冒着生命危险为他们工作。", "让我进去。", "你想要那个。"]
		doppel_its_all_ok_text = ["那是正确的决定。"]
		repeat_answer_english = ["你想看我的真实形态吗？", "打开门，我会给你看的。"]

func _on_voice_01_finished()->void :
	play_random_sfx()

func make_doppelganger()->void :
	is_doppelganger = true
	var easy_doppel = randi_range(0, 1)
	var doppel_random
	if easy_doppel == 0:
		doppel_random = randi_range(0, 2)
		doppel_number = doppel_random
		match doppel_random:
			0:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mis brazos?", "Ah mmm, es que, mmm ...", "¡Hice mucho ejercicio ayer!", "Eso fue lo que pasó."]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "La puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My arms?", "Ah mmm, it was, mmm...", "I exercised a lot yesterday!", "That's what happened."]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "The door please."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的手臂？", "啊，嗯，是的，嗯...", "昨天我锻炼了很多！", "就是发生了这件事。"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				arms_doppel.visible = true
				arms.visible = false
			1:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Mi identificación?", "Me la comí."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["¿Solicitud de entrada?", "¿Qué es eso?"]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "La puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["My ID?", "I ate it."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Entry request?", "What's that?"]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "The door please."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我的眼睛？", "我吃了它。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["什么是入场请求？"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				doppel_mouth.visible = true
				doppel_mouth_animation.play("MOVE")
			2:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "La puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "The door please."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				doppel_head.visible = true
				head.visible = false
	else :
		doppel_random = randi_range(3, 8)
		doppel_number = doppel_random
		match doppel_random:
			3:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "La puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "The door please."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				var random = randi_range(0, 5)
				match random:
					0:
						random = randi_range(0, 2)
						match random:
							0:
								number_id = FAKE_ID_01
							1:
								number_id = FAKE_ID_02
							2:
								number_id = FAKE_ID_03
					1:
						random = randi_range(0, 2)
						match random:
							0:
								name_char = FAKE_NAME_01
							1:
								name_char = FAKE_NAME_02
							2:
								name_char = FAKE_NAME_03
					2:
						random = randi_range(0, 2)
						match random:
							0:
								last_name_char = FAKE_LAST_NAME_01
							1:
								last_name_char = FAKE_LAST_NAME_02
							2:
								last_name_char = FAKE_LAST_NAME_03
					3:
						random = randi_range(0, 2)
						match random:
							0:
								id_exp_date = FAKE_DATE_01
							1:
								id_exp_date = FAKE_DATE_02
							2:
								id_exp_date = FAKE_DATE_03
					4:
						random = randi_range(0, 2)
						match random:
							0:
								apart_number_english = FAKE_APARTMENT_ENGLISH_01
								apart_number_spanish = FAKE_APARTMENT_SPANISH_01
							1:
								apart_number_english = FAKE_APARTMENT_ENGLISH_02
								apart_number_spanish = FAKE_APARTMENT_SPANISH_02
							2:
								apart_number_english = FAKE_APARTMENT_ENGLISH_03
								apart_number_spanish = FAKE_APARTMENT_SPANISH_03
					5:
						random = randi_range(0, 3)
						match random:
							0:
								if Global.language == SPANISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_SECOND_SPANISH
								elif Global.language == ENGLISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH
								elif Global.language == CHINESE_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_SECOND_CHINESE
							1:
								if Global.language == SPANISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_SPANISH
								elif Global.language == ENGLISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_ENGLISH
								elif Global.language == CHINESE_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_02_CHINESE
							2:
								if Global.language == SPANISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_SECOND_SPANISH
								elif Global.language == ENGLISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_SECOND_ENGLISH
								elif Global.language == CHINESE_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_SECOND_CHINESE
							3:
								if Global.language == SPANISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_SPANISH
								elif Global.language == ENGLISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_ENGLISH
								elif Global.language == CHINESE_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_CHINESE
			4:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?", "Sabía que tenía que revisar eso, me atrapaste."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "La puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["¿Today's list?", "I knew I had to check that, you caught me."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "The door please."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我知道我应该检查的，你抓住了我。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				mole.visible = false
				mole_doppel.visible = true
				id_photo = id_photo_doppel_01
				entry_photo = entry_photo_doppel_01
			5:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "La puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "The door please."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				mole.visible = false
				id_photo = id_photo_doppel_02
				entry_photo = entry_photo_doppel_02
			6:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?", "Sabía que tenía que revisar eso, me atrapaste."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "La puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["¿Today's list?", "I knew I had to check that, you caught me."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "The door please."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我知道我应该检查的，你抓住了我。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				nose.visible = false
				nose_doppel.visible = true
				id_photo = id_photo_doppel_03
				entry_photo = entry_photo_doppel_03
			7:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "La puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "The door please."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				get_parent().get_parent().hide_ddd_logo_entry(false)
			8:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "La puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "The door please."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				get_parent().get_parent().hide_date_id(false)

func _record_update()->void :
	get_parent().get_parent().hide_ddd_logo_entry(true)
	get_parent().get_parent().hide_date_id(true)
	if Global.is_campaign:
		get_parent().get_parent().restart_ddd_logo()
	if Global.is_3312_active:
		if is_doppelganger:
			Global.doppel_captured_level += 1
		else :
			Global.chars_killed_level += 1
			Global.neighbors_killed_info += "*Elenois Sverchzt"
			if Global.is_campaign:
				Global.neighbors_killed_level_list_1F += 10
				Global.neighbors_kill_count_aux += 1
	else :
		if !"Elenois_Sverchzt" in Global.char_at_home_list:
			Global.char_at_home_list.append("Elenois_Sverchzt")
			Global.char_out_home_list.erase("Elenois_Sverchzt")
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Elenois: "
			if Global.is_campaign:
				Global.neighbors_killed_level_list_1F += 11
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Brazos raros"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Weird arms"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "奇怪的手臂"
				1:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Boca extra"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Extra mouth"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "额外的嘴巴"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cabeza falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong head"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假头"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Documentos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake documents"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假文件"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Lunar"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Mole"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "痣"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin lunar"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No Mole"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有痣"
				6:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				7:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin logo D.D.D."
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No D.D.D. Logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有D.D.D.标志"
				8:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin fecha en id"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No date on ID"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "身份证上没有日期"
				9:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Logo DDD falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake DDD logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "伪造的DDD标志"
				10:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				11:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong Eyes"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眼睛"
				_:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Boca falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong mouth"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的嘴巴"

func make_doppelganger_campaign()->void :
	is_doppelganger = true
	dont_show_entry_request = false
	dont_show_id = false
	var random_doppel = randi_range(9, 12)
	doppel_number = random_doppel
	if Global.language == SPANISH_VALUE:
		doppel_dont_show_id_text = ["Aquí está mi identificación."]
		doppel_id_text = question_answers_spanish["id_ok"]
		doppel_appearance_text = question_answers_spanish["appearance_ok"]
		doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
		doppel_entry_text = question_answers_spanish["entry_request_ok"]
		doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
		doppel_today_list_text = question_answers_spanish["today_list_ok"]
		doppel_its_all_ok_text = ["¡Excelente!", "La puerta por favor."]
		doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
	elif Global.language == ENGLISH_VALUE:
		doppel_dont_show_id_text = ["Here is my ID."]
		doppel_id_text = question_answers_english["id_ok"]
		doppel_appearance_text = question_answers_english["appearance_ok"]
		doppel_dont_show_entry_text = ["Here is my entry request."]
		doppel_entry_text = question_answers_english["entry_request_ok"]
		doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
		doppel_today_list_text = question_answers_english["today_list_ok"]
		doppel_its_all_ok_text = ["Excellent!", "The door please."]
		doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
	elif Global.language == CHINESE_VALUE:
		doppel_dont_show_id_text = ["这是我的身份证。"]
		doppel_id_text = question_answers_chinese["id_ok"]
		doppel_appearance_text = question_answers_chinese["appearance_ok"]
		doppel_dont_show_entry_text = ["这是我的入场请求。"]
		doppel_entry_text = question_answers_chinese["entry_request_ok"]
		doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
		doppel_today_list_text = question_answers_chinese["today_list_ok"]
		doppel_its_all_ok_text = ["优秀！", "请开门。"]
		doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
	match random_doppel:
		9:
			get_parent().get_parent().change_ddd_logo(randi_range(0, 2), randi_range(0, 1))
		10:
			nose.visible = false
			nose_doppel_02.visible = true
		11:
			eyes.position.y += 10
		_:
			mouth.scale = Vector2(0.85, 0.85)
