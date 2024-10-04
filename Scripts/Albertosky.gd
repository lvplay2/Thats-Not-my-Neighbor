extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100, 280)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(988, 280)
const CHAR_AT_DELETE_POS = Vector2(1900, 280)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10
const FAKE_NAME_01 = "Robertsky"
const FAKE_NAME_02 = "Alberrtsky"
const FAKE_NAME_03 = "Allbertsky"
const FAKE_LAST_NAME_01 = "Stilnsky"
const FAKE_LAST_NAME_02 = "Peachmann"
const FAKE_LAST_NAME_03 = "Pecchman"
const ENTRY_REASON_ENGLISH = "I'm a resident of the building.\nMy apartment is the 02 \non the first floor."
const ENTRY_REASON_SPANISH = "Soy residente del edificio.\nMi apartamento es el 02 del \nprimer piso."
const ENTRY_REASON_CHINESE = "我是这栋楼的居民。\n我的公寓是一楼的02号。"
const ENTRY_REASON_02_ENGLISH = "I'm a resident of the building.\nI come from my job as a shoemaker."
const ENTRY_REASON_02_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como zapatero."
const ENTRY_REASON_02_CHINESE = "我是这栋大楼的居民。\n我从鞋匠的工作回来。"
const ENTRY_REASON_DOPPEL_01_ENGLISH = "I'm a resident of the building.\nI went out to eat humans."
const ENTRY_REASON_DOPPEL_01_SPANISH = "Soy residente del edificio.\nSalí a comer humanos."
const ENTRY_REASON_DOPPEL_01_CHINESE = "我是这栋大楼的居民。\n我出去吃人了。"
const ENTRY_REASON_DOPPEL_01_SECOND_ENGLISH = "I resident of da beelding.\nI lif on two flor apatment wuan."
const ENTRY_REASON_DOPPEL_01_SECOND_SPANISH = "Yo recidemte de el edifisio.\nVivir en dos pizo apatamento uN0."
const ENTRY_REASON_DOPPEL_01_SECOND_CHINESE = "我家一楼的住户。\n我的公寓位于人类大楼的04号。"
const ENTRY_REASON_DOPPEL_02_ENGLISH = "I'm not a doppelganger. \nI'm a normal human with \nnormal behavior. \nJust let me in, to do my normal \nhuman activities."
const ENTRY_REASON_DOPPEL_02_SPANISH = "No soy un doppelganger. \nSoy un humano normal con \ncomportamiento normal. \nSolo déjame entrar, para hacer \nmis actividades de humano normal."
const ENTRY_REASON_DOPPEL_02_CHINESE = "我不是假人。\n我是一个正常的人类，有着正常的行为。\n请让我进去，进行我的正常人类活动。"
const ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH = "I'm a resident of the building.\nI come from my job as a banker."
const ENTRY_REASON_DOPPEL_02_SECOND_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como banquero."
const ENTRY_REASON_DOPPEL_02_SECOND_CHINESE = "我是这栋大楼的居民。\n我从银行家的工作回来。"
const FAKE_ID_01 = "114652289730"
const FAKE_ID_02 = "1146512986354"
const FAKE_ID_03 = "1465129863354"
const FAKE_APARTMENT_ENGLISH_01 = "F10-02"
const FAKE_APARTMENT_ENGLISH_02 = "F03-02"
const FAKE_APARTMENT_ENGLISH_03 = "F01-01"
const FAKE_APARTMENT_SPANISH_01 = "P10-02"
const FAKE_APARTMENT_SPANISH_02 = "P03-02"
const FAKE_APARTMENT_SPANISH_03 = "P01-01"
const FAKE_DATE_01 = "16/1974"
const FAKE_DATE_02 = "10/1944"
const FAKE_DATE_03 = "10/1894"

@onready var animation = $Animation
@onready var talking = $Talk
@onready var mouth = $Head / Mouth
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps
@onready var eyes_sprite = $Head / Eyes
@onready var nose = $Head / Nose
@onready var head = $Head / Head
@onready var hair = $Head / Hair
@onready var doppel_head = $Head / Doppel_Head
@onready var doppel_nose = $Head / Doppel_Nose
@onready var eyebrows = $Head / Eyebrows
@onready var mole = $Head / Mole
@onready var doppel_eyes = $Head / Doppel_Eyes
@onready var brain = $Head / Brain
@onready var doppel_eyebrows = $Head / Doppel_Eyebrows
@onready var mustache = $Head / Mustache
@onready var worms = $Head / Worms
@onready var worm1 = $Head / Worms / Worm_Hole / Worm
@onready var worm2 = $Head / Worms / Worm_Hole2 / Worm
@onready var worm3 = $Head / Worms / Worm_Hole3 / Worm
@onready var worm4 = $Head / Worms / Worm_Hole4 / Worm
@onready var worm5 = $Head / Worms / Worm_Hole5 / Worm
@onready var worm6 = $Head / Worms / Worm_Hole6 / Worm
@onready var worm7 = $Head / Worms / Worm_Hole7 / Worm
@onready var one_eye = $Head / One_Eye
@onready var one_eye_animation = $Head / One_Eye / Animation
@onready var nose_doppel: Sprite2D = $Head / Nose_Doppel
@onready var scar: Sprite2D = $Head / Scar

var current_text = []
var is_doppelganger = false
var checklist_values = []
var question_answers_spanish = {"id_ok": ["¿Mi identificación?", "No veo ningún problema con mi identificación."], "appearance_ok": ["¿Qué hay de raro con mi apariencia?", "Todo está en regla con mi apariencia."], "entry_request_ok": ["¿Mi solicitud de ingreso?", "Me parece que todo está perfecto con mi solicitud."], "today_list_ok": ["¿No estoy en la lista de hoy?", "Me parece que debe haber un error, si debo estar en la lista.", "Mire la lista nuevamente."]}
var question_answers_english = {"id_ok": ["My ID?", "I don't see anything wrong with my ID."], "appearance_ok": ["What's wrong with my appearance?", "Everything is in order with my appearance."], "entry_request_ok": ["My entry request?", "I think everything it's fine with my entry request."], "today_list_ok": ["Am I not on today's list?", "I think there is an error, I should be on the list.", "Look at the list again."]}
var question_answers_chinese = {"id_ok": ["我的身份证？", "我觉得我的身份证没什么问题。"], "appearance_ok": ["我的外貌有什么问题吗？", "我觉得我的外貌一切都很好。"], "entry_request_ok": ["我的入场请求？", "我觉得我的入场请求没有任何问题。"], "today_list_ok": ["我不是在今天的名单上吗？", "一定是个错误，我应该在名单上。", "再看一下名单。"]}
var entry_request_reason = ""
var hello_text_english = ["Good afternoon."]
var hello_text_spanish = ["Buenas tardes."]
var hello_text_chinese = ["下午好。"]
var id_photo = load("res://Assets/Graphics/Char_Albertosky_Small_Photo.png")
var entry_photo = load("res://Assets/Graphics/Char_Albertosky_Long_Photo.png")
var id_photo_doppel_01 = load("res://Assets/Graphics/Char_Albertosky_Small_Photo_Doppel_01.png")
var entry_photo_doppel_01 = load("res://Assets/Graphics/Char_Albertosky_Long_Photo_Doppel_01.png")
var entry_photo_doppel_02 = load("res://Assets/Graphics/Char_Albertosky_Long_Photo_Doppel_02.png")
var entry_photo_doppel_03 = load("res://Assets/Graphics/Char_Albertosky_Long_Photo_Doppel_03.png")
var id_photo_doppel_02 = load("res://Assets/Graphics/Char_Albertosky_Small_Photo_Doppel_02.png")
var id_photo_doppel_03 = load("res://Assets/Graphics/Char_Albertosky_Small_Photo_Doppel_03.png")
var no_photo = load("res://Assets/Graphics/Button_pressed.png")
var id_photo_doppel_04 = load("res://Assets/Graphics/Char_Albertosky_Small_Photo_Doppel_04.png")
var entry_photo_doppel_04 = load("res://Assets/Graphics/Char_Albertosky_Long_Photo_Doppel_04.png")
var id_photo_doppel_05 = load("res://Assets/Graphics/Char_Albertosky_Small_Photo_Doppel_05.png")
var entry_photo_doppel_05 = load("res://Assets/Graphics/Char_Albertosky_Long_Photo_Doppel_05.png")
var speak_flag = true
var name_char = Global.ALBERTOSKY_PEACHMAN_DATA["NAME"]
var last_name_char = Global.ALBERTOSKY_PEACHMAN_DATA["LAST_NAME"]
var number_id = Global.ALBERTOSKY_PEACHMAN_DATA["ID_NUMBER"]
var id_exp_date = Global.ALBERTOSKY_PEACHMAN_DATA["ID_EXPIRATION"]
var apart_number_spanish = Global.ALBERTOSKY_PEACHMAN_DATA["APARTMENT_NUMBER_SPANISH"]
var apart_number_english = Global.ALBERTOSKY_PEACHMAN_DATA["APARTMENT_NUMBER_ENGLISH"]
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
							current_text += ["Lo siento, sí, olvidé mostrar mi identificación."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["I'm sorry, yes, I forgot to show my ID."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["对不起，是的，我忘了出示我的身份证。"]
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
							current_text += ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["I'm sorry, yes, I forgot to show my entry request."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["对不起，是的，我忘了出示我的入场申请。"]
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
						if doppel_number in [3, 4, 5, 6, 7, 8, 9, 10]:
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
						if doppel_number in [3, 4, 5, 6, 7, 8, 9, 10]:
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
					if !Global.CHAR_LIST[11] in Global.today_list:
						current_text += doppel_not_today_list_text
						if doppel_number in [3, 6]:
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
		doppel_eyes.visible = true
		eyes_sprite.visible = false
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
		doppel_random = randi_range(0, 3)
		if Global.tripo and doppel_random == 1:
			doppel_random = 2
		doppel_number = doppel_random
		match doppel_random:
			0:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Mi identificación?", "La perdí."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi cabeza?", "Es que me corte el pelo."]
					doppel_dont_show_entry_text = ["¿Es necesario la solicitud de ingreso?", "Somos vecinos, me conoces.", "No necesito una solicitud para entrar a mi hogar."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["My ID?", "I lost it."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My head?", "It's because I cut my hair."]
					doppel_dont_show_entry_text = ["Is it necesary the entry request?", "We are neighbors, you know me.", "I don't need an entry request to get to my home."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我的身份证？", "我弄丢了。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的头？", "是因为我剪了头发。"]
					doppel_dont_show_entry_text = ["是否需要入境请求？", "我们是邻居，你认识我的。", "我不需要入场申请来回家。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				hair.visible = false
				brain.visible = true
			1:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Mi identificación?", "Creo que la perdí."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Gusanos?", "No, no son gusanos.", "Son espinillas."]
					doppel_dont_show_entry_text = ["¿Mi solicitud de ingreso?", "Creo que la perdí."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["My ID?", "I think I lost it."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["Worms?", "No, they're not worms.", "They're pimples."]
					doppel_dont_show_entry_text = ["My entry request?", "I think I lost it."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我的身份证？", "我弄丢了。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["虫子？", "不，它们不是虫子。", "它们是痘痘。"]
					doppel_dont_show_entry_text = ["我的入场申请？", "我想我把它弄丢了。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				worms.visible = true
				worm1.play("IDLE")
				worm2.play("IDLE")
				worm3.play("IDLE")
				worm4.play("IDLE")
				worm5.play("IDLE")
				worm6.play("IDLE")
				worm7.play("IDLE")
			2:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Mi identificación?", "¿Qué es eso?"]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi apariencia?", "¿No veo nada raro con mi apariencia.", "Lo puedo ver bien con mi único ojo."]
					doppel_dont_show_entry_text = ["¿Mi solicitud de ingreso?", "Creo que la perdí."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["My ID?", "What is that?."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My appearance?", "I don't see anything strange with my appearance.", "I can see it well with my one eye."]
					doppel_dont_show_entry_text = ["My entry request?", "I thing I lost it."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["什么是身份证？"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌？", "我觉得我的外貌没有任何奇怪的地方。", "我可以用一只眼睛看得很清楚。"]
					doppel_dont_show_entry_text = ["我的入场申请？", "我想我把它弄丢了。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				eyes_sprite.visible = false
				eyebrows.visible = false
				one_eye.visible = true
				one_eye_animation.play("Moving")
			3:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?", "Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?", "No tomé eso en cuenta.", "No eres fácil de engañar.", "Eso me hace querer devorarte aún más."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?", "Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?", "I didn't take that into account.", "You're not easy to fool.", "That makes me want to devour you even more."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？", "仔细看看我文件上的照片，然后将其与我好好比较一下。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我没有考虑到那一点。", "你不容易被欺骗。", "这让我更想要吞噬你。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				mustache.visible = false
				id_photo = id_photo_doppel_01
				entry_photo = entry_photo_doppel_01
				var random = randi_range(0, 2)
				match random:
					0:
						number_id = FAKE_ID_01
					1:
						number_id = FAKE_ID_02
					_:
						number_id = FAKE_ID_03
	else :
		doppel_random = randi_range(4, 10)
		doppel_number = doppel_random
		match doppel_random:
			4:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
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
			5:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?", "Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?", "Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？", "仔细看看我文件上的照片，然后好好与我比较一下。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				head.visible = false
				doppel_head.visible = true
				id_photo = id_photo_doppel_04
				entry_photo = entry_photo_doppel_04
			6:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?", "Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?", "No tomé eso en cuenta.", "No eres fácil de engañar.", "Eso me hace querer devorarte aún más."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?", "Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?", "I didn't take that into account.", "You're not easy to fool.", "That makes me want to devour you even more."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？", "仔细看看我文件上的照片，然后好好与我比较一下。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我没有考虑到那一点。", "你不容易被欺骗。", "这让我更想要吞噬你。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				nose.visible = false
				doppel_nose.visible = true
				id_photo = id_photo_doppel_02
				entry_photo = entry_photo_doppel_02
			7:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?", "Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?", "Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？", "仔细看看我文件上的照片，然后好好与我比较一下。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				mole.visible = true
				id_photo = id_photo_doppel_03
				entry_photo = entry_photo_doppel_03
			8:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?", "Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?", "Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？", "仔细看看我文件上的照片，然后好好与我比较一下。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				eyebrows.visible = false
				doppel_eyebrows.visible = true
				id_photo = id_photo_doppel_05
				entry_photo = entry_photo_doppel_05
			9:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？", "仔细看看我文件上的照片，然后好好与我比较一下。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
				get_parent().get_parent().hide_ddd_logo_entry(false)
			10:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
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
			Global.neighbors_killed_info += "*Albertsky Peachman"
			if Global.is_campaign:
				Global.neighbors_killed_level_list_1F += 1000
				Global.neighbors_kill_count_aux += 1
	else :
		if !"Albertosky_Peachman" in Global.char_at_home_list:
			Global.char_at_home_list.append("Albertosky_Peachman")
			Global.char_out_home_list.erase("Albertosky_Peachman")
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Albertsky: "
			if Global.is_campaign:
				Global.neighbors_killed_level_list_1F += 11000
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cerebro"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Brain"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "大脑"
				1:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Gusanos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Worms"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "蠕虫"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cíclope"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Cyclops"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "独眼巨人"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin bigote"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No mustache"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有胡子"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Documentos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake documents"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假文件"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cabeza falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong head"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假头"
				6:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				7:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Lunar"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Mole"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "痣"
				8:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cejas falsas"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong eyebrows"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眉毛"
				9:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin logo D.D.D."
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No D.D.D. Logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有D.D.D.标志"
				10:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin fecha en id"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No date on ID"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "身份证上没有日期"
				11:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Logo DDD falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake DDD logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "伪造的DDD标志"
				12:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				13:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong eyes"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眼睛"
				_:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cicatriz"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Scar"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "疤痕"

func make_doppelganger_campaign()->void :
	is_doppelganger = true
	dont_show_entry_request = false
	dont_show_id = false
	var random_doppel = randi_range(11, 14)
	doppel_number = random_doppel
	if Global.language == SPANISH_VALUE:
		doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
		doppel_id_text = question_answers_spanish["id_ok"]
		doppel_appearance_text = question_answers_spanish["appearance_ok"]
		doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
		doppel_entry_text = question_answers_spanish["entry_request_ok"]
		doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
		doppel_today_list_text = question_answers_spanish["today_list_ok"]
		doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
	elif Global.language == ENGLISH_VALUE:
		doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
		doppel_id_text = question_answers_english["id_ok"]
		doppel_appearance_text = question_answers_english["appearance_ok"]
		doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
		doppel_entry_text = question_answers_english["entry_request_ok"]
		doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
		doppel_today_list_text = question_answers_english["today_list_ok"]
		doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
	elif Global.language == CHINESE_VALUE:
		doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
		doppel_id_text = question_answers_chinese["id_ok"]
		doppel_appearance_text = question_answers_chinese["appearance_ok"]
		doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
		doppel_entry_text = question_answers_chinese["entry_request_ok"]
		doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
		doppel_today_list_text = question_answers_chinese["today_list_ok"]
		doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
	match random_doppel:
		11:
			get_parent().get_parent().change_ddd_logo(randi_range(0, 2), randi_range(0, 1))
		12:
			nose_doppel.visible = true
			nose.visible = false
		13:
			eyes_sprite.scale = Vector2(0.9, 0.9)
		_:
			scar.visible = true
