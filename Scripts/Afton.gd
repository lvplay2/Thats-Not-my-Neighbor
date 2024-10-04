extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100, 240)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(990, 240)
const CHAR_AT_DELETE_POS = Vector2(1900, 240)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10
const FAKE_NAME_01 = "CP3O"
const FAKE_NAME_02 = "R2D2"
const FAKE_NAME_03 = "XLR8"
const FAKE_LAST_NAME_01 = "Aftton"
const FAKE_LAST_NAME_02 = "Stone"
const FAKE_LAST_NAME_03 = "Affton"
const ENTRY_REASON_ENGLISH = "I'm a resident of the building.\nMy apartment is the 01 \non the third floor."
const ENTRY_REASON_SPANISH = "Soy residente del edificio.\nMi apartamento es el 01 del \ntercer piso."
const ENTRY_REASON_CHINESE = "我是这栋楼的居民。\n我的公寓在三楼，是01号。"
const ENTRY_REASON_02_ENGLISH = "I'm a resident of the building.\nI come from my job as a physicist."
const ENTRY_REASON_02_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como físico."
const ENTRY_REASON_02_CHINESE = "我是这栋大楼的居民。\n我从我的物理学工作地方来。"
const ENTRY_REASON_DOPPEL_01_ENGLISH = "I'm a resident of the building.\nI went out to do human activities."
const ENTRY_REASON_DOPPEL_01_SPANISH = "Soy residente del edificio.\nSalí hacer mis actividades de humano."
const ENTRY_REASON_DOPPEL_01_CHINESE = "我是这栋大楼的居民。\n我出去进行人类活动。"
const ENTRY_REASON_DOPPEL_01_SECOND_ENGLISH = "I'm your neighbor.\nSo you'll let me in and you won't question anything."
const ENTRY_REASON_DOPPEL_01_SECOND_SPANISH = "Soy tu vecino.\nAsí que me dejarás entrar y no cuestionarás nada."
const ENTRY_REASON_DOPPEL_01_SECOND_CHINESE = "我是你的邻居。\n所以你会让我进来，不会问任何问题。"
const ENTRY_REASON_DOPPEL_02_ENGLISH = "I'm not here to eat anyone. \nI only eat human food \nlike everyone else. \nLet me in, to make my normal \n human meals."
const ENTRY_REASON_DOPPEL_02_SPANISH = "No vengo a comerme a nadie. \nSolo consumo comida \nde humano como todos. \nDéjame entrar, para hacer \nmis comidas de humano normal."
const ENTRY_REASON_DOPPEL_02_CHINESE = "我不是来吃任何人的。\n我只吃像其他人一样的人类食物。\n让我进来，做我正常的人类餐。"
const ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH = "I'm a resident of the building.\nI come from my job as a chef."
const ENTRY_REASON_DOPPEL_02_SECOND_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como chef."
const ENTRY_REASON_DOPPEL_02_SECOND_CHINESE = "我是这栋大楼的居民。\n我从我作为厨师的工作地方来。"
const FAKE_ID_01 = "789564525115"
const FAKE_ID_02 = "250489656244"
const FAKE_ID_03 = "250489956214"
const FAKE_APARTMENT_ENGLISH_01 = "F05-01"
const FAKE_APARTMENT_ENGLISH_02 = "F03-02"
const FAKE_APARTMENT_ENGLISH_03 = "F03-10"
const FAKE_APARTMENT_SPANISH_01 = "P05-01"
const FAKE_APARTMENT_SPANISH_02 = "P03-02"
const FAKE_APARTMENT_SPANISH_03 = "P03-10"
const FAKE_DATE_01 = "23/1971"
const FAKE_DATE_02 = "03/1951"
const FAKE_DATE_03 = "03/2971"

@onready var animation = $Animation
@onready var talking = $Talk
@onready var mouth = $Head / Mouth
@onready var nose = $Head / Nose
@onready var nose_doppel = $Head / Doppel_Nose
@onready var head = $Head / Head
@onready var doppel_head = $Head / Doppel_Head
@onready var glasses = $Head / Glasses
@onready var eyebrows = $Head / Eyebrows
@onready var doppel_eyebrows = $Head / Doppel_Eyebrows
@onready var doppel_scar = $Head / Doppel_Scar
@onready var tripo = $Head / Tripo
@onready var third_eye = $Head / third_Eye
@onready var fourth_eye = $Head / fourth_Eye
@onready var third_eye_animation = $Head / third_Eye / Animation
@onready var fourth_eye_animation = $Head / fourth_Eye / Animation
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps
@onready var head_doppel: Sprite2D = $Head / Head_Doppel
@onready var mole: Sprite2D = $Head / Mole

var current_text = []
var is_doppelganger = false
var checklist_values = []
var question_answers_spanish = {"id_ok": ["¿Mi identificación?", "No veo ningún problema con mi identificación."], "appearance_ok": ["¿Qué hay de raro con mi apariencia?", "Me parece que todo está perfecto con mi apariencia."], "entry_request_ok": ["¿Mi solicitud de ingreso?", "No veo ningún problema con mi solicitud."], "today_list_ok": ["¿No estoy en la lista de hoy?", "Debe haber un error, si debo estar en la lista.", "Mire la lista nuevamente."]}
var question_answers_english = {"id_ok": ["My ID?", "I don't see anything wrong with my ID."], "appearance_ok": ["What's wrong with my appearance?", "I think everything it's fine with my appearance."], "entry_request_ok": ["My entry request?", "I don't see anything wrong with my entry request."], "today_list_ok": ["Am I not on today's list?", "There must be a mistake, I should be on the list.", "Look at the list again."]}
var question_answers_chinese = {"id_ok": ["我的身份证？", "我觉得我的身份证没什么问题。"], "appearance_ok": ["我的外貌有什么问题吗？", "我觉得我的外貌一切都很好。"], "entry_request_ok": ["我的入场请求？", "我觉得我的入场请求没有任何问题。"], "today_list_ok": ["我不是在今天的名单上吗？", "一定是个错误，我应该在名单上。", "再看一下名单。"]}
var entry_request_reason = ""
var hello_text_english = ["Hello."]
var hello_text_spanish = ["Hola."]
var hello_text_chinese = ["你好。"]
var id_photo = load("res://Assets/Graphics/Char_Afton_Small_Photo.png")
var entry_photo = load("res://Assets/Graphics/Char_Afton_Long_Photo.png")
var id_photo_doppel_01 = load("res://Assets/Graphics/Char_Afton_Small_Photo_Doppel_01.png")
var entry_photo_doppel_01 = load("res://Assets/Graphics/Char_Afton_Long_Photo_Doppel_01.png")
var no_photo = load("res://Assets/Graphics/Button_pressed.png")
var id_photo_doppel_02 = load("res://Assets/Graphics/Char_Afton_Small_Photo_Doppel_02.png")
var entry_photo_doppel_02 = load("res://Assets/Graphics/Char_Afton_Long_Photo_Doppel_02.png")
var id_photo_doppel_03 = load("res://Assets/Graphics/Char_Afton_Small_Photo_Doppel_03.png")
var entry_photo_doppel_03 = load("res://Assets/Graphics/Char_Afton_Long_Photo_Doppel_03.png")
var speak_flag = true
var name_char = Global.DR_W_AFTON_DATA["NAME"]
var last_name_char = Global.DR_W_AFTON_DATA["LAST_NAME"]
var number_id = Global.DR_W_AFTON_DATA["ID_NUMBER"]
var id_exp_date = Global.DR_W_AFTON_DATA["ID_EXPIRATION"]
var apart_number_spanish = Global.DR_W_AFTON_DATA["APARTMENT_NUMBER_SPANISH"]
var apart_number_english = Global.DR_W_AFTON_DATA["APARTMENT_NUMBER_ENGLISH"]
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
		mouth.play("Doppel_Talking")
	else :
		mouth.play("Talking")

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
							current_text += ["¿Mi solicitud de entrada?", "Me parece que todo está perfecto con mi solicitud."]
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
					current_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					current_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					current_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
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
						if doppel_number in [1, 5, 6, 7, 8, 9]:
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
						if doppel_number in [1, 5, 6, 7, 8, 9]:
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
					if !Global.CHAR_LIST[13] in Global.today_list:
						current_text += doppel_not_today_list_text
						if doppel_number in [6]:
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
			mouth.play("Close_Doppel")
			if !texts_changed:
				texts_changed = true
				change_texts()
		else :
			mouth.play("Close")

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
		if Global.tripo:
			doppel_random = randi_range(0, 3)
		else :
			doppel_random = randi_range(0, 4)
		doppel_number = doppel_random
		match doppel_random:
			0:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Mi identificación?", "Me la comí."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi cara?", "Es una cara normal de humano promedio."]
					doppel_dont_show_entry_text = ["¿Solicitud de entrada?", "¿Qué es eso?"]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["My ID?", "I ate it."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My face?", "It's a normal face of an average human."]
					doppel_dont_show_entry_text = ["Entry request?", "What's that?"]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我的身份证？", "我吃了它。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的脸？", "这是一个普通人的普通脸。"]
					doppel_dont_show_entry_text = ["什么是入场请求？"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				glasses.visible = false
				nose.visible = false
				eyebrows.visible = false
				third_eye.visible = true
				fourth_eye.visible = true
				third_eye_animation.play("Moving")
				fourth_eye_animation.play("Moving")
			1:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				nose.visible = false
				nose_doppel.visible = true
				id_photo = id_photo_doppel_01
				entry_photo = entry_photo_doppel_01
			2:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Qué es una identificación?"]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi frente?", "No es nada, solo ignóralo."]
					doppel_dont_show_entry_text = ["¿Qué es una solicitud de ingreso?"]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["What is an ID?"]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My forehead?", "It's nothing, just ignore it."]
					doppel_dont_show_entry_text = ["What is an entry request?"]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["什么是身份证？"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的额头？", "没什么，不用理会。"]
					doppel_dont_show_entry_text = ["什么是入场请求？"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				doppel_scar.visible = true
				var random = randi_range(0, 2)
				match random:
					0:
						name_char = FAKE_NAME_01
					1:
						name_char = FAKE_NAME_02
					_:
						name_char = FAKE_NAME_03
			3:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Identificación?", "¿Qué es eso?", "Eso no lo estudié."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi nariz?", "Me la quité para no olerte."]
					doppel_dont_show_entry_text = ["¿Mi solicitud de ingreso?", "La perdí."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["ID?", "What is that?", "I didn't study that."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My nose?", "I took it off so I wouldn't smell you."]
					doppel_dont_show_entry_text = ["My entry request?", "I lost it."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["身份证？", "那是什么？", "我没有学过那个。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的鼻子？", "我把它拿下来，这样我就闻不到你的味道了。"]
					doppel_dont_show_entry_text = ["My entry request?", "I lost it."]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				nose.visible = false
			4:
				sfx_voice_01 = $Voice_05
				sfx_voice_02 = $Voice_06
				sfx_voice_03 = $Voice_07
				sfx_voice_04 = $Voice_08
				hello_text_english = ["....."]
				hello_text_spanish = ["....."]
				hello_text_chinese = ["....."]
				doppel_dont_show_id_text = ["....."]
				doppel_id_text = ["....."]
				doppel_appearance_text = ["....."]
				doppel_dont_show_entry_text = ["....."]
				doppel_entry_text = ["....."]
				doppel_not_today_list_text = ["....."]
				doppel_today_list_text = ["....."]
				doppel_its_all_ok_text = ["....."]
				tripo.visible = true
				eyebrows.visible = false
				glasses.visible = false
				nose.visible = false
				mouth.visible = false
				dont_show_id = true
				dont_show_entry_request = true
	else :
		doppel_random = randi_range(5, 9)
		doppel_number = doppel_random
		match doppel_random:
			5:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
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
			6:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?", "Bueno no contaba con eso, me atrapaste.", "¿Qué harás al respecto? Adelante, llama a tus amiguitos del D.D.D.", "Nunca podrán acabar con nosotros, al final lograremos nuestro objetivo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today’s list?", "Well I didn't count on that, you caught me.", "What are you going to do about it? Go ahead, call your D.D.D. friends.", "They will never be able to finish us off, In the end we will achieve our goal."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["今天的名单？", "嗯，我没料到会这样，你抓住了我。", "你打算怎么办？继续，叫你的 D.D.D. 朋友来吧。", "他们永远无法消灭我们，最终我们会实现我们的目标。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				eyebrows.visible = false
				doppel_eyebrows.visible = true
				id_photo = id_photo_doppel_02
				entry_photo = entry_photo_doppel_02
			7:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				head.visible = false
				doppel_head.visible = true
				id_photo = id_photo_doppel_03
				entry_photo = entry_photo_doppel_03
			8:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				get_parent().get_parent().hide_ddd_logo_entry(false)
			9:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Aquí está mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Here is my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Here is my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["这是我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["这是我的入场请求。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
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
			Global.neighbors_killed_info += "*Dr. W. Afton"
			if Global.is_campaign:
				Global.neighbors_killed_level_list_3F += 100000
				Global.neighbors_kill_count_aux += 1
	else :
		if !"Dr_W_Afton" in Global.char_at_home_list:
			Global.char_at_home_list.append("Dr_W_Afton")
			Global.char_out_home_list.erase("Dr_W_Afton")
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Afton: "
			if Global.is_campaign:
				Global.neighbors_killed_level_list_3F += 1100000
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong Eyes"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眼睛"
				1:
					Global.doppels_info += "* Afton: "
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cicatriz"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Scar"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "疤痕"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin nariz"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Without nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有鼻子"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Agujeros"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "holes"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "孔洞"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Documentos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake documents"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假文件"
				6:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cejas falsas"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong eyebrows"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眉毛"
				7:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cabeza falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong head"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假头"
				8:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin logo D.D.D."
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No D.D.D. Logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有D.D.D.标志"
				9:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin fecha en id"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No date on ID"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "身份证上没有日期"
				10:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Logo DDD falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake DDD logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "伪造的DDD标志"
				11:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cabeza falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong head"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假头"
				12:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Lunar"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Mole"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "痣"
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
	var random_doppel = randi_range(10, 13)
	doppel_number = random_doppel
	if Global.language == SPANISH_VALUE:
		doppel_dont_show_id_text = ["Aquí está mi identificación."]
		doppel_id_text = question_answers_spanish["id_ok"]
		doppel_appearance_text = question_answers_spanish["appearance_ok"]
		doppel_dont_show_entry_text = ["Aquí está mi solicitud de ingreso."]
		doppel_entry_text = question_answers_spanish["entry_request_ok"]
		doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
		doppel_today_list_text = question_answers_spanish["today_list_ok"]
		doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
	elif Global.language == ENGLISH_VALUE:
		doppel_dont_show_id_text = ["Here is my ID."]
		doppel_id_text = question_answers_english["id_ok"]
		doppel_appearance_text = question_answers_english["appearance_ok"]
		doppel_dont_show_entry_text = ["Here is my entry request."]
		doppel_entry_text = question_answers_english["entry_request_ok"]
		doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
		doppel_today_list_text = question_answers_english["today_list_ok"]
		doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
	elif Global.language == CHINESE_VALUE:
		doppel_dont_show_id_text = ["这是我的身份证。"]
		doppel_id_text = question_answers_chinese["id_ok"]
		doppel_appearance_text = question_answers_chinese["appearance_ok"]
		doppel_dont_show_entry_text = ["这是我的入场请求。"]
		doppel_entry_text = question_answers_chinese["entry_request_ok"]
		doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
		doppel_today_list_text = question_answers_chinese["today_list_ok"]
		doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
	match random_doppel:
		10:
			get_parent().get_parent().change_ddd_logo(randi_range(0, 2), randi_range(0, 1))
		11:
			head.visible = false
			head_doppel.visible = true
		12:
			mole.visible = true
		_:
			mouth.scale = Vector2(0.85, 0.85)
