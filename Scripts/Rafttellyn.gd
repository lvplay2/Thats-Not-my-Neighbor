extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100, 270)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(980, 270)
const CHAR_AT_DELETE_POS = Vector2(1900, 270)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10
const FAKE_NAME_01 = "Raftelyn"
const FAKE_NAME_02 = "Rafttelyn"
const FAKE_NAME_03 = "Raftellyn"
const FAKE_LAST_NAME_01 = "Capucin"
const FAKE_LAST_NAME_02 = "Cappucin"
const FAKE_LAST_NAME_03 = "Capuccin"
const ENTRY_REASON_ENGLISH = "I'm a resident of the building.\nMy apartment is the 04 \non the third floor."
const ENTRY_REASON_SPANISH = "Soy residente del edificio.\nMi apartamento es el 04 del \ntercer piso."
const ENTRY_REASON_CHINESE = "我是这栋楼的居民。\n我的公寓是三楼的04号。"
const ENTRY_REASON_02_ENGLISH = "I'm a resident of the building.\nI went out to visit my parents."
const ENTRY_REASON_02_SPANISH = "Soy residente del edificio.\nSalí a visitar a mis padres."
const ENTRY_REASON_02_CHINESE = "我是这栋楼的居民。\n我出去拜访我的父母。"
const ENTRY_REASON_DOPPEL_01_ENGLISH = "I'm a resident of the building.\nI went out to do normal human activities."
const ENTRY_REASON_DOPPEL_01_SPANISH = "Soy residente del edificio.\nSalí hacer mis actividades de humano normal."
const ENTRY_REASON_DOPPEL_01_CHINESE = "我是这栋楼的居民。\n我出去进行人类活动。喜欢吃人。"
const ENTRY_REASON_DOPPEL_01_SECOND_ENGLISH = "I'm your neighbor.\nSo you'll let me in and you won't question anything.."
const ENTRY_REASON_DOPPEL_01_SECOND_SPANISH = "Soy tu vecina.\nAsí que me dejarás entrar y no cuestionarás nada."
const ENTRY_REASON_DOPPEL_01_SECOND_CHINESE = "我是你的邻居。\n那么你会让我进来，并且不问任何问题。"
const ENTRY_REASON_DOPPEL_02_ENGLISH = "I'm not here to eat anyone. \nI only eat human food \nlike everyone else. \nLet me in, to make my normal \n human meals."
const ENTRY_REASON_DOPPEL_02_SPANISH = "No vengo a comerme a nadie. \nSolo consumo comida \nde humano como todos. \nDéjame entrar, para hacer \nmis comidas de humano normal."
const ENTRY_REASON_DOPPEL_02_CHINESE = "我不是来吃掉任何人的。\n我只是像所有人一样消耗人类食物。\n让我进来，做我平常的人类食物。"
const ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH = "I'm a resident of the building.\nI come from my job as a receptionist."
const ENTRY_REASON_DOPPEL_02_SECOND_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como recepcionista."
const ENTRY_REASON_DOPPEL_02_SECOND_CHINESE = "我是这栋楼的居民。\n我外出工作，我是一名接待员。"
const FAKE_ID_01 = "120548096347"
const FAKE_ID_02 = "568545596329"
const FAKE_ID_03 = "568554596339"
const FAKE_APARTMENT_ENGLISH_01 = "F03-05"
const FAKE_APARTMENT_ENGLISH_02 = "F04-04"
const FAKE_APARTMENT_ENGLISH_03 = "F03-01"
const FAKE_APARTMENT_SPANISH_01 = "P03-05"
const FAKE_APARTMENT_SPANISH_02 = "P04-04"
const FAKE_APARTMENT_SPANISH_03 = "P03-01"
const FAKE_DATE_01 = "06/1945"
const FAKE_DATE_02 = "16/1962"
const FAKE_DATE_03 = "06/1862"

@onready var animation = $Animation
@onready var talking = $Talk
@onready var head = $Head / Head
@onready var head_doppel = $Head / Head_Doppel
@onready var nose = $Head / Nose
@onready var nose_doppel = $Head / Nose_Doppel
@onready var eyes = $Head / Eyes
@onready var doppel_eyes = $Head / Doppel_Eyes
@onready var doppel_eyes_01 = $Head / Doppel_Eyes_01
@onready var doppel_eyes_02 = $Head / Doppel_Eyes_02
@onready var mouth = $Head / Mouth
@onready var ghost = $Head / Ghost
@onready var mole = $Head / Mole
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps
@onready var eyes_doppel: Sprite2D = $Head / Eyes_Doppel

var current_text = []
var is_doppelganger = false
var checklist_values = []
var question_answers_spanish = {"id_ok": ["¿Mi identificación?", "No veo ningún problema con mi identificación."], "appearance_ok": ["¿Qué hay de raro con mi apariencia?", "Mira bien las fotos de mis papeles y compáralas bien conmigo."], "entry_request_ok": ["¿Mi solicitud de ingreso?", "No veo ningún problema con mi solicitud."], "today_list_ok": ["¿No estoy en la lista de hoy?", "Debe haber un error, si debo estar en la lista.", "Mire la lista nuevamente."]}
var question_answers_english = {"id_ok": ["My ID?", "I don't see anything wrong with my ID."], "appearance_ok": ["What's wrong with my appearance?", "Look carefully at the photos of my papers and compare them well with me."], "entry_request_ok": ["My entry request?", "I don't see anything wrong with my entry request."], "today_list_ok": ["Am I not on today's list?", "There must be a mistake, I should be on the list.", "Look at the list again."]}
var question_answers_chinese = {"id_ok": ["我的身份证？", "我觉得我的身份证没什么问题。"], "appearance_ok": ["我的外貌有什么问题？", "仔细看看我文件上的照片，然后将其与我好好比较一下。"], "entry_request_ok": ["我的入场请求？", "我觉得我的入场请求没有任何问题。"], "today_list_ok": ["我不是在今天的名单上吗？", "一定是个错误，我应该在名单上。", "再看一下名单。"]}
var entry_request_reason = ""
var hello_text_english = ["Hello, good day."]
var hello_text_spanish = ["Hola, buen día."]
var hello_text_chinese = ["你好！美好的一天。"]
var id_photo = load("res://Assets/Graphics/Char_Rafttellyn_Small_Photo.png")
var entry_photo = load("res://Assets/Graphics/Char_Rafttellyn_Long_Photo.png")
var id_photo_doppel_01 = load("res://Assets/Graphics/Char_Rafttellyn_Small_Photo_Doppel_01.png")
var entry_photo_doppel_01 = load("res://Assets/Graphics/Char_Rafttellyn_Long_Photo_Doppel_01.png")
var no_photo = load("res://Assets/Graphics/Button_pressed.png")
var id_photo_doppel_02 = load("res://Assets/Graphics/Char_Rafttellyn_Doppel_02_Small_Photo.png")
var entry_photo_doppel_02 = load("res://Assets/Graphics/Char_Rafttellyn_Doppel_02_Long_Photo.png")
var id_photo_doppel_03 = load("res://Assets/Graphics/Char_Rafttellyn_Doppel_03_Small_Photo.png")
var entry_photo_doppel_03 = load("res://Assets/Graphics/Char_Rafttellyn_Doppel_03_Long_Photo.png")
var id_photo_doppel_04 = load("res://Assets/Graphics/Char_Rafttellyn_Doppel_04_Small_Photo.png")
var entry_photo_doppel_04 = load("res://Assets/Graphics/Char_Rafttellyn_Doppel_04_Long_Photo.png")
var id_photo_doppel_05 = load("res://Assets/Graphics/Char_Rafttellyn_Doppel_05_Small_Photo.png")
var entry_photo_doppel_05 = load("res://Assets/Graphics/Char_Rafttellyn_Doppel_05_Long_Photo.png")
var speak_flag = true
var name_char = Global.RAFTTELLYN_CAPPUCCIN_DATA["NAME"]
var last_name_char = Global.RAFTTELLYN_CAPPUCCIN_DATA["LAST_NAME"]
var number_id = Global.RAFTTELLYN_CAPPUCCIN_DATA["ID_NUMBER"]
var id_exp_date = Global.RAFTTELLYN_CAPPUCCIN_DATA["ID_EXPIRATION"]
var apart_number_spanish = Global.RAFTTELLYN_CAPPUCCIN_DATA["APARTMENT_NUMBER_SPANISH"]
var apart_number_english = Global.RAFTTELLYN_CAPPUCCIN_DATA["APARTMENT_NUMBER_ENGLISH"]
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
							current_text += ["Perdón, aquí está mi identificación."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["Sorry, here is my ID."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["对不起，这是我的身份证。"]
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
							current_text += ["Perdón, aquí está mi solicitud de ingreso."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["Sorry, here is my entry request."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["对不起，这是我的入场请求。"]
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
						if doppel_number in [1, 4, 5, 6, 7, 8, 9]:
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
						if doppel_number in [1, 4, 5, 6, 7, 8, 9]:
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
					if !Global.CHAR_LIST[7] in Global.today_list:
						current_text += doppel_not_today_list_text
						if doppel_number in [7, 8]:
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
		doppel_random = randi_range(0, 5)
		if Global.tripo and doppel_random == 3:
			doppel_random = 2
		doppel_number = doppel_random
		match doppel_random:
			0:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Qué es una identificación?"]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi apariencia?", "¿Qué tienen de mal mis orejas?", "Son orejas de humano normal."]
					doppel_dont_show_entry_text = ["¿Qué es una solicitud de ingreso?"]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "Me abré la puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["What is an ID?"]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My appearance?", "What's wrong with my ears?", "They are normal human ears."]
					doppel_dont_show_entry_text = ["What is an entry request?"]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "Please open the door for me."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["什么是身份证？"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌？", "我的耳朵有什么问题？", "这是普通人的耳朵。"]
					doppel_dont_show_entry_text = ["什么是入场请求？"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				head.visible = false
				head_doppel.visible = true
			1:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Perdón, aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi apariencia?", "¿Qué tienen de mal mis ojos?", "¿Te burlas de mis ojos?"]
					doppel_dont_show_entry_text = ["Perdón, aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "Me abré la puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Sorry, here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My appearance?", "What's wrong with my eyes?", "Do you laugh at my eyes?"]
					doppel_dont_show_entry_text = ["Sorry, here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "Please open the door for me."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌？", "我的眼睛有什么问题？", "你嘲笑我的眼睛吗？"]
					doppel_dont_show_entry_text = ["对不起，这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				eyes.position.y += 70
				id_photo = id_photo_doppel_05
				entry_photo = entry_photo_doppel_05
			2:
				sfx_voice_01 = $Voice_05
				sfx_voice_02 = $Voice_06
				sfx_voice_03 = $Voice_07
				sfx_voice_04 = $Voice_08
				dont_show_entry_request = true
				dont_show_id = true
				hello_text_english = ["Hooooonn ..."]
				hello_text_spanish = ["Hooooonn ..."]
				hello_text_chinese = ["Hooooonn ..."]
				doppel_dont_show_id_text = ["Hooooonn ..."]
				doppel_id_text = ["Hooooonn ..."]
				doppel_appearance_text = ["Hooooonn ... Hooooonn ... Hooooonn ..."]
				doppel_dont_show_entry_text = ["Hooooonn ..."]
				doppel_entry_text = ["Hooooonn ..."]
				doppel_not_today_list_text = ["Hooooonn ..."]
				doppel_today_list_text = ["Hooooonn ..."]
				doppel_its_all_ok_text = ["Hooooonn ..."]
				doppel_appearance_no_hat_text = ["Hooooonn ... Hooooonn ..."]
				repeat_answer_english = ["Hooooonn ... Hooooonn ..."]
				repeat_answer_spanish = ["Hooooonn ... Hooooonn ..."]
				eyes.visible = false
				nose.visible = false
				mouth.visible = false
				ghost.visible = true
			3:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Qué es una identificación?"]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["No te preocupes por mi ojo.", "Visitaré a un médico humano más tarde."]
					doppel_dont_show_entry_text = ["¿Qué es una solicitud de ingreso?"]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "Me abré la puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["What is an ID?"]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["Don't worry about my eye.", "I'll visit a human doctor later."]
					doppel_dont_show_entry_text = ["What is an entry request?"]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "Please open the door for me."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["什么是身份证？"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["不要担心我的眼睛。", "我以后会去看人类医生。"]
					doppel_dont_show_entry_text = ["什么是入场请求？"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				eyes.visible = false
				doppel_eyes_02.visible = true
			4:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Perdón, aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Perdón, aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "Me abré la puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Sorry, here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Sorry, here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "Please open the door for me."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				eyes.visible = false
				doppel_eyes_01.visible = true
				id_photo = id_photo_doppel_03
				entry_photo = entry_photo_doppel_03
			5:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Perdón, aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Perdón, aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "Me abré la puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Sorry, here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Sorry, here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "Please open the door for me."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				mouth.position.y += 50
				id_photo = id_photo_doppel_04
				entry_photo = entry_photo_doppel_04
	else :
		doppel_random = randi_range(6, 9)
		doppel_number = doppel_random
		match doppel_random:
			6:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Perdón, aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Perdón, aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "Me abré la puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Sorry, here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Sorry, here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = ["I'm not on today's list because I had to leave due to an emergency."]
					doppel_its_all_ok_text = ["Excellent!", "Please open the door for me."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
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
			7:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Perdón, aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?", "Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["Perdón, aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?", "Bueno no contaba con eso, me atrapaste.", "¿Qué harás al respecto? Adelante, llama a tus amiguitos del D.D.D.", "Nunca podrán acabar con nosotros, al final lograremos nuestro objetivo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "Me abré la puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Sorry, here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?", "Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["Sorry, here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?", "Well I didn't count on that, you caught me.", "What are you going to do about it? Go ahead, call your D.D.D. friends.", "They will never be able to finish us off, In the end we will achieve our goal."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "Please open the door for me."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？", "仔细看看我文件上的照片，然后将其与我好好比较一下。"]
					doppel_dont_show_entry_text = ["对不起，这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = ["今天的名单？", "嗯，我没料到会这样，你抓住了我。", "你打算怎么办？继续，叫你的 D.D.D. 朋友来吧。", "他们永远无法消灭我们，最终我们会实现我们的目标。"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				mole.visible = true
				id_photo = id_photo_doppel_01
				entry_photo = entry_photo_doppel_01
			8:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Perdón, aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?", "Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["Perdón, aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?", "Bueno no contaba con eso, me atrapaste.", "¿Qué harás al respecto? Adelante, llama a tus amiguitos del D.D.D.", "Nunca podrán acabar con nosotros, al final lograremos nuestro objetivo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "Me abré la puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Sorry, here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?", "Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["Sorry, here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?", "Well I didn't count on that, you caught me.", "What are you going to do about it? Go ahead, call your D.D.D. friends.", "They will never be able to finish us off, In the end we will achieve our goal."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Excellent!", "Please open the door for me."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？", "仔细看看我文件上的照片，然后将其与我好好比较一下。"]
					doppel_dont_show_entry_text = ["对不起，这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = ["今天的名单？", "嗯，我没料到会这样，你抓住了我。", "你打算怎么办？继续，叫你的 D.D.D. 朋友来吧。", "他们永远无法消灭我们，最终我们会实现我们的目标。"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				nose.visible = false
				nose_doppel.visible = true
				id_photo = id_photo_doppel_02
				entry_photo = entry_photo_doppel_02
			9:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Perdón, aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Perdón, aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Excelente!", "Me abré la puerta por favor."]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Sorry, here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Sorry, here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = ["I'm not on today's list because I had to leave due to an emergency."]
					doppel_its_all_ok_text = ["Excellent!", "Please open the door for me."]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_its_all_ok_text = ["优秀！", "请开门。"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				get_parent().get_parent().hide_ddd_logo_entry(false)

func _record_update()->void :
	get_parent().get_parent().hide_ddd_logo_entry(true)
	if Global.is_campaign:
		get_parent().get_parent().restart_ddd_logo()
	if Global.is_3312_active:
		if is_doppelganger:
			Global.doppel_captured_level += 1
		else :
			Global.chars_killed_level += 1
			Global.neighbors_killed_info += "*Rafttelyn Cappuccin"
			if Global.is_campaign:
				Global.neighbors_killed_level_list_3F += 1
				Global.neighbors_kill_count_aux += 1
	else :
		if !"Rafttelyn_Cappuccin" in Global.char_at_home_list:
			Global.char_at_home_list.append("Rafttelyn_Cappuccin")
			Global.char_out_home_list.erase("Rafttelyn_Cappuccin")
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Rafttelyn: "
			if Global.is_campaign:
				Global.neighbors_killed_level_list_3F += 11
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Orejas"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Ears"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "耳朵"
				1:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Eyes"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "眼睛"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cara fantasma"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Ghost face"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "鬼脸"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojo caído"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Eye out"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "眼睛"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Eyes"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "眼睛"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Boca"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Mouth"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "嘴巴"
				6:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Documentos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake documents"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假文件"
				7:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Lunar"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Mole"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "痣"
				8:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				9:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin logo D.D.D."
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No D.D.D. Logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有D.D.D.标志"
				10:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Logo DDD falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake DDD logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "伪造的DDD标志"
				11:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong Eyes"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眼睛"
				_:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"

func make_doppelganger_campaign()->void :
	is_doppelganger = true
	dont_show_entry_request = false
	dont_show_id = false
	var random_doppel = randi_range(10, 12)
	doppel_number = random_doppel
	if Global.language == SPANISH_VALUE:
		doppel_dont_show_id_text = ["Perdón, aquí está mi identificación."]
		doppel_id_text = question_answers_spanish["id_ok"]
		doppel_appearance_text = question_answers_spanish["appearance_ok"]
		doppel_dont_show_entry_text = ["Perdón, aquí está mi solicitud de ingreso."]
		doppel_entry_text = question_answers_spanish["entry_request_ok"]
		doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia."]
		doppel_today_list_text = question_answers_spanish["today_list_ok"]
		doppel_its_all_ok_text = ["¡Excelente!", "Me abré la puerta por favor."]
		doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
	elif Global.language == ENGLISH_VALUE:
		doppel_dont_show_id_text = ["Sorry, here is my ID."]
		doppel_id_text = question_answers_english["id_ok"]
		doppel_appearance_text = question_answers_english["appearance_ok"]
		doppel_dont_show_entry_text = ["Sorry, here is my entry request."]
		doppel_entry_text = question_answers_english["entry_request_ok"]
		doppel_not_today_list_text = question_answers_english["today_list_ok"]
		doppel_today_list_text = ["I'm not on today's list because I had to leave due to an emergency."]
		doppel_its_all_ok_text = ["Excellent!", "Please open the door for me."]
		doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
	elif Global.language == CHINESE_VALUE:
		doppel_dont_show_id_text = ["对不起，这是我的身份证。"]
		doppel_id_text = question_answers_chinese["id_ok"]
		doppel_appearance_text = question_answers_chinese["appearance_ok"]
		doppel_dont_show_entry_text = ["对不起，这是我的入场请求。"]
		doppel_entry_text = question_answers_chinese["entry_request_ok"]
		doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
		doppel_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
		doppel_its_all_ok_text = ["优秀！", "请开门。"]
		doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
	match random_doppel:
		10:
			get_parent().get_parent().change_ddd_logo(randi_range(0, 2), randi_range(0, 1))
		11:
			eyes.visible = false
			eyes_doppel.visible = true
		_:
			nose.position.y += 15
