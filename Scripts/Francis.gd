extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100,265)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(975,265)
const CHAR_AT_DELETE_POS = Vector2(1900,265)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10
const FAKE_NAME_01 = "Froncis"
const FAKE_NAME_02 = "Franncis"
const FAKE_NAME_03 = "Frankis"
const FAKE_LAST_NAME_01 = "Mosss"
const FAKE_LAST_NAME_02 = "Nosses"
const FAKE_LAST_NAME_03 = "Masses"
const ENTRY_REASON_ENGLISH = "I'm a resident of the building.\nMy apartment is the 02 \non the third floor."
const ENTRY_REASON_SPANISH = "Soy residente del edificio.\nMi apartamento es el 02 del \ntercer piso."
const ENTRY_REASON_CHINESE = "我是这栋楼的居民。\n我的公寓在三楼的02号。"
const ENTRY_REASON_02_ENGLISH = "I'm a resident of the building.\nI come from my job as a milkman."
const ENTRY_REASON_02_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como lechero."
const ENTRY_REASON_02_CHINESE = "我是这栋楼的居民。\n我外出工作，我是牛奶配送员。"
const ENTRY_REASON_DOPPEL_01_ENGLISH = "I'm a resident of the building.\nI went out to eat humans."
const ENTRY_REASON_DOPPEL_01_SPANISH = "Soy residente del edificio.\nSalí a comer humanos."
const ENTRY_REASON_DOPPEL_01_CHINESE = "我是这栋楼的居民。\n我出去吃人了。"
const ENTRY_REASON_DOPPEL_01_SECOND_ENGLISH = "I resident of da beelding.\nI lif on three flor apatment too."
const ENTRY_REASON_DOPPEL_01_SECOND_SPANISH = "Yo recidemte de el edifisio.\nVivir en tres pizo apatamento d0."
const ENTRY_REASON_DOPPEL_01_SECOND_CHINESE = "我家一楼的住户。\n我的公寓位于人类大楼的52号。"
const ENTRY_REASON_DOPPEL_02_ENGLISH = "I'm not a doppelganger. \nI'm a normal human with \nnormal behavior. \nJust let me in, to do my normal \nhuman activities."
const ENTRY_REASON_DOPPEL_02_SPANISH = "No soy un doppelganger. \nSoy un humano normal con \ncomportamiento normal. \nSolo déjame entrar, para hacer \nmis actividades de humano normal."
const ENTRY_REASON_DOPPEL_02_CHINESE = "我不是假人。\n我是一个正常的人类，有着正常的行为。\n请让我进去，进行我的正常人类活动。"
const ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH = "I'm a resident of the building.\nI come from my job as a teacher."
const ENTRY_REASON_DOPPEL_02_SECOND_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como profesor."
const ENTRY_REASON_DOPPEL_02_SECOND_CHINESE = "我是这栋楼的居民。\n我外出工作，我是老师。"
const FAKE_ID_01 = "235569418995"
const FAKE_ID_02 = "235694189995"
const FAKE_ID_03 = "235569411895"
const FAKE_APARTMENT_ENGLISH_01 = "F03-20"
const FAKE_APARTMENT_ENGLISH_02 = "F04-02"
const FAKE_APARTMENT_ENGLISH_03 = "F03-05"
const FAKE_APARTMENT_SPANISH_01 = "P03-20"
const FAKE_APARTMENT_SPANISH_02 = "P04-02"
const FAKE_APARTMENT_SPANISH_03 = "P03-05"
const FAKE_DATE_01 = "09/1944"
const FAKE_DATE_02 = "19/1964"
const FAKE_DATE_03 = "09/1864"

@onready var animation = $Animation
@onready var talking = $Talk
@onready var mouth = $Head/Mouth
@onready var mouth_doppel = $Head/Mouth_Doppel
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps
@onready var eyes_sprite = $Head/Eyes
@onready var nose = $Head/Nose
@onready var doppel_nose = $Head/Doppel_Nose
@onready var eyebrows = $Head/Eyebrows
@onready var doppel_eyebrows = $Head/Doppel_Eyebrows
@onready var doppel_eyes = $Head/Doppel_Eyes
@onready var ears = $Head/Ears
@onready var eyes_doppel_01 = $Head/Eyes_Doppel_01
@onready var eyes_doppel_02 = $Head/Eyes_Doppel_02
@onready var doppel_arms = $Head/Doppel_Arms
@onready var blood_head = $Head/Hat/Blood
@onready var blood_hat = $Head/Head/Blood
@onready var blood_body = $Body/Blood

var current_text = []
var is_doppelganger = false
var checklist_values = []
var question_answers_spanish = {"id_ok": ["Mmmm ¿Mi identificación?","No veo ningún problema con mi identificación."], "appearance_ok": ["Mmmm ¿Qué hay de raro con mi apariencia?","Mira bien las fotos de mis papeles y compáralas bien conmigo."], "entry_request_ok": ["Mmmm ¿Mi solicitud de ingreso?","Me parece que todo está perfecto con mi solicitud."], "today_list_ok": ["Mmmm ¿No estoy en la lista de hoy?","Me parece que debe haber un error, si debo estar en la lista.","Mire la lista nuevamente."]}
var question_answers_english = {"id_ok": ["Mmmm. My ID?","I don't see anything wrong with my ID."], "appearance_ok": ["Mmmm. What's wrong with my appearance?","Look carefully at the photos of my papers and compare them well with me."], "entry_request_ok": ["Mmmm. My entry request?","I think everything it's fine with my entry request."], "today_list_ok": ["Mmmm. Am I not on today's list?","I think there is an error, I should be on the list.","Look at the list again."]}
var question_answers_chinese = {"id_ok": ["嗯嗯。我的身份证？","我觉得我的身份证没什么问题。"], "appearance_ok": ["嗯嗯。我的外貌有什么问题？","仔细看看我文件上的照片，然后将其与我好好比较一下。"], "entry_request_ok": ["嗯嗯。我的入场请求？","我觉得我的入场请求没有任何问题。"], "today_list_ok": ["嗯嗯。我不是在今天的名单上吗？","一定是个错误，我应该在名单上。","再看一下名单。"]}
var entry_request_reason = ""
var hello_text_english = ["Mmm Hello ..."]
var hello_text_spanish = ["Mmm Hola ..."]
var hello_text_chinese = ["嗯嗯。你好"]
var id_photo = load("res://Assets/Graphics/Char_Francis_Small_Photo.png")
var entry_photo = load("res://Assets/Graphics/Char_Francis_Long_Photo.png")
var id_photo_doppel_01 = load("res://Assets/Graphics/Char_Francis_Small_Photo_Doppel_01.png")
var entry_photo_doppel_01 = load("res://Assets/Graphics/Char_Francis_Long_Photo_Doppel_01.png")
var entry_photo_doppel_02 = load("res://Assets/Graphics/Char_Francis_Long_Photo_Doppel_02.png")
var entry_photo_doppel_03 = load("res://Assets/Graphics/Char_Francis_Long_Photo_Doppel_03.png")
var id_photo_doppel_02 = load("res://Assets/Graphics/Char_Francis_Small_Photo_Doppel_02.png")
var id_photo_doppel_03 = load("res://Assets/Graphics/Char_Francis_Small_Photo_Doppel_03.png")
var no_photo = load("res://Assets/Graphics/Button_pressed.png")
var speak_flag = true
var name_char = Global.FRANCIS_MOSSES_DATA["NAME"]
var last_name_char = Global.FRANCIS_MOSSES_DATA["LAST_NAME"]
var number_id = Global.FRANCIS_MOSSES_DATA["ID_NUMBER"]
var id_exp_date = Global.FRANCIS_MOSSES_DATA["ID_EXPIRATION"]
var apart_number_spanish = Global.FRANCIS_MOSSES_DATA["APARTMENT_NUMBER_SPANISH"]
var apart_number_english = Global.FRANCIS_MOSSES_DATA["APARTMENT_NUMBER_ENGLISH"]
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
var repeat_answer_spanish= ["Mmmm. Ya respondí su pregunta."]
var repeat_answer_english = ["Mmmm. I already answered your question."]
var repeat_answer_chinese = ["嗯嗯。我已经回答了你的问题。"]
var texts_changed = false

func _ready() -> void:
	randomize()
	set_sfx_volume()
	random_value = randi_range(0,5)
	if random_value == 0:
		dont_show_id = true
	random_value = randi_range(0,5)
	if random_value == 0:
		dont_show_entry_request = true
	_set_entry_reason()
	random_value = randi_range(0,1)
	if random_value == 0:
		if Global.language == SPANISH_VALUE:
			entry_request_reason = ENTRY_REASON_02_SPANISH
		elif Global.language == ENGLISH_VALUE:
			entry_request_reason = ENTRY_REASON_02_ENGLISH
		elif Global.language == CHINESE_VALUE:
			entry_request_reason = ENTRY_REASON_02_CHINESE
	var tween = create_tween()
	tween.tween_property(self,"position",CHAR_AT_CENTER_WINDOW_POS,TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(4)
	await get_tree().create_timer(TIME_ON_TWEEN).timeout
	if Global.is_door_locked:
		animation.play("IDLE")

func _process(_delta) -> void:
	if self.position == CHAR_AT_CENTER_WINDOW_POS:
		if !Global.is_door_locked:
			delete()
		elif speak_flag:
			_first_words()

func set_sfx_volume() -> void:
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func _first_words() -> void:
	speak_flag = false
	if !dont_show_id:
		get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
	if !dont_show_entry_request:
		if Global.language == SPANISH_VALUE:
			get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_spanish,entry_request_reason,entry_photo)
		else:
			get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_english,entry_request_reason,entry_photo)
	await get_tree().create_timer(0.5).timeout
	change_current_text(0)
	get_parent().get_parent().text_selection()

func _set_entry_reason() -> void:
	var n_random = randi_range(0,1)
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

func talk() -> void:
	talking.play("TALK")
	if doppel_reveal_flag:
		mouth.play("Doppel_Talking")
	elif doppel_number == 3:
		mouth_doppel.play("Talk")
	else:
		mouth.play("Talking")

func change_current_text(n:int) -> void:
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
				else:
					if dont_show_id:
						dont_show_id = false
						if Global.language == SPANISH_VALUE:
							current_text += ["Mmmm. Olvidé mostrar mi identificación."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["Mmmm. I forgot to show my ID."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["嗯嗯。我忘记了出示我的身份证。"]
						get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
					else:
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
				else:
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
				else:
					if dont_show_entry_request:
						dont_show_entry_request = false
						if Global.language == SPANISH_VALUE:
							current_text += ["Mmm. Olvidé mostrar mi solicitud de ingreso."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["Mmm. I forgot to show my entry request."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["嗯嗯。我忘记出示我的入境申请。"]
						if Global.language == SPANISH_VALUE:
							get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_spanish,entry_request_reason,entry_photo)
						else:
							get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_english,entry_request_reason,entry_photo)
					else:
						if Global.language == SPANISH_VALUE:
							current_text += ["Mmm ¿Mi solicitud de entrada?","Me parece que todo está perfecto con mi solicitud."]
						elif Global.language == ENGLISH_VALUE:
							current_text += question_answers_english["entry_request_ok"]
						elif Global.language == CHINESE_VALUE:
							current_text += question_answers_chinese["entry_request_ok"]
					Global.is_entry_request_wrong_answer = true
			4:
				if Global.is_today_list_wrong_answer:
					_repeat_answer()
				else:
					if Global.language == SPANISH_VALUE:
						current_text += question_answers_spanish["today_list_ok"]
					elif Global.language == ENGLISH_VALUE:
						current_text += question_answers_english["today_list_ok"]
					elif Global.language == CHINESE_VALUE:
						current_text += question_answers_chinese["today_list_ok"]
				Global.is_today_list_wrong_answer = true
			5:
				if Global.language == SPANISH_VALUE:
					current_text = ["Perfecto.","Mmmm. La puerta."]
				elif Global.language == ENGLISH_VALUE:
					current_text = ["Perfect.","Mmmm. The door."]
				elif Global.language == CHINESE_VALUE:
					current_text = ["完美。","嗯嗯。请开门。"]
			-1:
				_repeat_answer()
			_:
				current_text = []
	else:
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
				else:
					if dont_show_id:
						current_text += doppel_dont_show_id_text
						if doppel_number in [0,4,5,6,7,8]:
							get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
					else:
						current_text += doppel_id_text
					Global.is_id_wrong_answer = true
			2:
				if Global.is_appearance_wrong_answer:
					_repeat_answer()
				else:
					current_text += doppel_appearance_text 
					Global.is_appearance_wrong_answer = true
			3:
				if Global.is_entry_request_wrong_answer:
					_repeat_answer()
				else:
					if dont_show_entry_request:
						current_text += doppel_dont_show_entry_text 
						if doppel_number in [0,4,5,6,7,8]:
							if Global.language == SPANISH_VALUE:
								get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_spanish,entry_request_reason,entry_photo)
							else:
								get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_english,entry_request_reason,entry_photo)
					else:
						current_text += doppel_entry_text
					Global.is_entry_request_wrong_answer = true
			4:
				if Global.is_today_list_wrong_answer:
					_repeat_answer()
				else:
					if !Global.CHAR_LIST[15] in Global.today_list:
						current_text += doppel_not_today_list_text 
						if doppel_number in [5,7]:
							change_voice()
							current_text = doppel_not_today_list_text 
					else:
						current_text += doppel_today_list_text
					Global.is_today_list_wrong_answer = true
			5:
				current_text = doppel_its_all_ok_text
			-1:
				_repeat_answer()
			_:
				current_text = []

func _repeat_answer() -> void:
	if Global.language == SPANISH_VALUE:
		current_text = repeat_answer_spanish
	elif Global.language == ENGLISH_VALUE:
		current_text = repeat_answer_english
	elif Global.language == CHINESE_VALUE:
		current_text = repeat_answer_chinese

func get_text():
	return current_text.duplicate()

func _play_sfx(n:int) -> void:
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

func play_random_sfx() -> void:
	var check = get_parent().get_parent().text_label.visible_ratio
	if check != VISIBLE_RATIO:
		_play_sfx(randi_range(0,3))
		talk()
	else:
		talking.stop()
		if doppel_reveal_flag:
			mouth.play("Close_Doppel")
			if !texts_changed:
				texts_changed = true
				change_texts()
		elif doppel_number == 3:
			mouth_doppel.play("Close")
		else:
			mouth.play("Close")

func delete() -> void:
	var tween = create_tween()
	tween.tween_property(self,"position",CHAR_AT_DELETE_POS,TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(4)
	get_parent().get_parent().on_neighbor_gone()
	await get_tree().create_timer(3).timeout
	get_parent().get_parent().start_time_between_char()
	delete_free()

func delete_free() -> void:
	_record_update()
	call_deferred("queue_free")

func change_voice() -> void:
	if !doppel_reveal_flag:
		sfx_voice_01 = $Voice_05
		sfx_voice_02 = $Voice_06
		sfx_voice_03 = $Voice_07
		sfx_voice_04 = $Voice_08
		doppel_eyes.visible = true
		eyes_sprite.visible = false
		eyes_doppel_01.visible = false
		if Global.achievements["CATCH_DOPPEL"] == 0:
			Global.achievements["CATCH_DOPPEL"] = 1
			get_parent().get_parent()._show_unlock_achievement()
	doppel_reveal_flag = true

func change_texts() -> void:
	if Global.language == SPANISH_VALUE:
		doppel_dont_show_id_text = ["¿Qué tanto le importan sus vecinos?","Seguro ni saben su nombre, y usted arriesga su vida por ellos todos los días.","Permítame ingresar.","Usted quiere eso."]
		doppel_id_text = ["¿Qué tanto le importan sus vecinos?","Seguro ni saben su nombre, y usted arriesga su vida por ellos todos los días.","Permítame ingresar.","Usted quiere eso."]
		doppel_appearance_text = ["¿Quiere ver mi forma real?","Abra la puerta y se la mostraré."]
		doppel_entry_text = ["Papeles, papeles y más papeles.","Yo puedo acabar con eso, solo debe abrir la puerta."]
		doppel_dont_show_entry_text = ["¿Quiere ver mi forma real?","Abra la puerta y se la mostraré."]
		doppel_not_today_list_text = ["¿Tiene miedo?","¿Puedo hacerle una visita en la noche mientras duerme?"]
		doppel_today_list_text = ["¿Qué tanto le importan sus vecinos?","Seguro ni saben su nombre, y usted arriesga su vida por ellos todos los días.","Permítame ingresar.","Usted quiere eso."]
		doppel_its_all_ok_text = ["Esa es la decisión correcta."]
		repeat_answer_spanish = ["¿Quiere ver mi forma real?","Abra la puerta y se la mostraré."]
	elif Global.language == ENGLISH_VALUE:
		doppel_dont_show_id_text = ["How much do you care about your neighbors?","They probably don't even know your name, and you risk your life for them every day.","Allow me in.","You want that."]
		doppel_id_text = ["How much do you care about your neighbors?","They probably don't even know your name, and you risk your life for them every day.","Allow me in.","You want that."]
		doppel_appearance_text = ["Do you want to see my real form?","Open the door and I'll show it to you."]
		doppel_dont_show_entry_text = ["Papers, papers and more papers.","I can put an end to that, you just have to open the door."]
		doppel_entry_text = ["Are you scared?","Can I visit you at night while you sleep?"]
		doppel_not_today_list_text = ["Do you want to see my real form?","Open the door and I'll show it to you."]
		doppel_today_list_text = ["How much do you care about your neighbors?","They probably don't even know your name, and you risk your life for them every day.","Allow me in.","You want that."]
		doppel_its_all_ok_text = ["That's the right decision."]
		repeat_answer_english = ["Do you want to see my real form?","Open the door and I'll show it to you."]
	elif Global.language == CHINESE_VALUE:
		doppel_dont_show_id_text = ["你有多在意你的邻居？","他们可能甚至不知道你的名字，而你每天都冒着生命危险为他们工作。","让我进去。","你想要那个。"]
		doppel_id_text = ["你有多在意你的邻居？","他们可能甚至不知道你的名字，而你每天都冒着生命危险为他们工作。","让我进去。","你想要那个。"]
		doppel_appearance_text = ["你想看我的真实形态吗？","打开门，我会给你看的。"]
		doppel_dont_show_entry_text = ["文件，文件，还有更多文件。","我可以结束这一切，你只需打开门。"]
		doppel_entry_text = ["你害怕吗？","我能在你睡觉的时候晚上拜访你吗？"]
		doppel_not_today_list_text = ["你想看我的真实形态吗？","打开门，我会给你看的。"]
		doppel_today_list_text = ["你有多在意你的邻居？","他们可能甚至不知道你的名字，而你每天都冒着生命危险为他们工作。","让我进去。","你想要那个。"]
		doppel_its_all_ok_text = ["那是正确的决定。"]
		repeat_answer_english = ["你想看我的真实形态吗？","打开门，我会给你看的。"]

func _on_voice_01_finished() -> void:
	play_random_sfx()

func make_doppelganger() -> void:
	is_doppelganger = true
	var easy_doppel = randi_range(0,1)
	var doppel_random
	if easy_doppel == 0:
		doppel_random = randi_range(0,3)
		doppel_number = doppel_random
		match doppel_random:
			0: # Blood
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["Mmmm ¿Sangre?","No es sangre.","Es un nuevo tipo de leche.","Leche escarlata."]
					doppel_dont_show_entry_text = ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. Entonces, ¿Todo está en orden?","¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["Mmmm, blood?","It's not blood.","It's a new kind of milk.","Scarlet milk."]
					doppel_dont_show_entry_text = ["Mmmm. I forgot to show my entry request, here it is."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. So, is everything in order?","Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。我忘记了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["嗯嗯，血液？","这不是血","这是一种新型的牛奶。","绯红色牛奶。"]
					doppel_dont_show_entry_text = ["嗯嗯。我忘记出示我的入境申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","嗯嗯。请开门。"]
				blood_body.visible = true
				blood_hat.visible = true
				blood_head.visible = true
			1: # Arms
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm ¿Mi identificación?","La perdí."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["Mmmm ¿Mi apariencia?","¿Manos?","No son manos, es un nuevo peinado."]
					doppel_dont_show_entry_text = ["Mmmm ¿Qué es una solicitud de ingreso?"]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. Entonces, ¿Todo está en orden?","¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. My ID?","I lost it."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["Mmmm, my appearance?","Hands?","They are not hands, it's a new hairstyle."]
					doppel_dont_show_entry_text = ["Mmmm. What is an entry request?"]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. So, is everything in order?","Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。身份证？","我弄丢了。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["嗯嗯，我的外表？","手？","它们不是手，这是一个新发型。"]
					doppel_dont_show_entry_text = ["嗯嗯。什么是入场请求？"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","嗯嗯。请开门。"]
				doppel_arms.visible = true
			2: # Dumbo
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm ¿Mi identificación?","La perdí."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["Mmmm ¿Mis orejas?","Las extendí para escuchar mejor."]
					doppel_dont_show_entry_text = ["Mmmm ¿Qué es una solicitud de ingreso?"]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. Entonces, ¿Todo está en orden?","¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. My ID?","I lost it."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["Mmmm, my ears?","I spread them out to hear better."]
					doppel_dont_show_entry_text = ["Mmmm. What is an entry request?"]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. So, is everything in order?","Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。身份证？","我弄丢了。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["嗯嗯，我的耳朵？","我张开它们以听得更清楚。"]
					doppel_dont_show_entry_text = ["嗯嗯。什么是入场请求？"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","嗯嗯。请开门。"]
				ears.visible = true
			3: # Ghost
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
				eyes_sprite.visible = false
				eyebrows.visible = false
				nose.visible = false
				mouth.visible = false
				eyes_doppel_02.visible = true
				mouth_doppel.visible = true
	else:
		doppel_random = randi_range(4,8)
		doppel_number = doppel_random
		match doppel_random:
			4: # All ok visually
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. Entonces, ¿Todo está en orden?","¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. I forgot to show my entry request, here it is."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. So, is everything in order?","Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。我忘记了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["嗯嗯。我忘记出示我的入境申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","嗯嗯。请开门。"]
				var random = randi_range(0,5) 
				match random:
					0: # ID
						random = randi_range(0,2)
						match random:
							0:
								number_id = FAKE_ID_01
							1:
								number_id = FAKE_ID_02
							2:
								number_id = FAKE_ID_03
					1: # Name
						random = randi_range(0,2)
						match random:
							0:
								name_char = FAKE_NAME_01
							1:
								name_char = FAKE_NAME_02
							2:
								name_char = FAKE_NAME_03
					2: # Last name
						random = randi_range(0,2)
						match random:
							0:
								last_name_char = FAKE_LAST_NAME_01
							1:
								last_name_char = FAKE_LAST_NAME_02
							2:
								last_name_char = FAKE_LAST_NAME_03
					3: # Expiration
						random = randi_range(0,2)
						match random:
							0:
								id_exp_date = FAKE_DATE_01
							1:
								id_exp_date = FAKE_DATE_02
							2:
								id_exp_date = FAKE_DATE_03
					4: # Apartment
						random = randi_range(0,2)
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
					5: # Entry request
						random = randi_range(0,3)
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
			5: # Other eyes
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?","No tomé eso en cuenta.","No eres fácil de engañar.","Eso me hace querer devorarte aún más."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. Entonces, ¿Todo está en orden?","¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. I forgot to show my entry request, here it is."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?","I didn't take that into account.","You're not easy to fool.","That makes me want to devour you even more."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. So, is everything in order?","Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。我忘记了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["嗯嗯。我忘记出示我的入境申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我没有考虑到那一点。","你不容易被欺骗。","这让我更想要吞噬你。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","嗯嗯。请开门。"]
				eyes_sprite.visible = false
				eyes_doppel_01.visible = true
				id_photo = id_photo_doppel_01
				entry_photo = entry_photo_doppel_01
			6: # Other nose
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. Entonces, ¿Todo está en orden?","¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. I forgot to show my entry request, here it is."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. So, is everything in order?","Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。我忘记了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["嗯嗯。我忘记出示我的入境申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","嗯嗯。请开门。"]
				nose.visible = false
				doppel_nose.visible = true
				id_photo = id_photo_doppel_02
				entry_photo = entry_photo_doppel_02
			7: # Other eyebrows
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?","Bueno no contaba con eso, me atrapaste.","¿Qué harás al respecto? Adelante, llama a tus amiguitos del D.D.D.","Nunca podrán acabar con nosotros, al final lograremos nuestro objetivo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. Entonces, ¿Todo está en orden?","¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. I forgot to show my entry request, here it is."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?","Well I didn't count on that, you caught me.","What are you going to do about it? Go ahead, call your D.D.D. friends.","They will never be able to finish us off, In the end we will achieve our goal."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. So, is everything in order?","Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。我忘记了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["嗯嗯。我忘记出示我的入境申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["今天的名单？","嗯，我没料到会这样，你抓住了我。","你打算怎么办？继续，叫你的 D.D.D. 朋友来吧。","他们永远无法消灭我们，最终我们会实现我们的目标。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","嗯嗯。请开门。"]
				eyebrows.visible = false
				doppel_eyebrows.visible = true
				id_photo = id_photo_doppel_03
				entry_photo = entry_photo_doppel_03
			8: # no ddd
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. Olvidé mostrar mi solicitud de ingreso, aquí está."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. Entonces, ¿Todo está en orden?","¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["Mmmm. I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Mmmm. I forgot to show my entry request, here it is."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Mmmm. I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Mmmm. So, is everything in order?","Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["嗯嗯。我忘记了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["嗯嗯。我忘记出示我的入境申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["嗯嗯。我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","嗯嗯。请开门。"]
				get_parent().get_parent().hide_ddd_logo_entry(false)

func _record_update() -> void:
	get_parent().get_parent().hide_ddd_logo_entry(true)
	if Global.is_3312_active:
		if is_doppelganger:
			Global.doppel_captured_level += 1
		else:
			Global.chars_killed_level += 1
			Global.neighbors_killed_info += "*Francis Mosses"
	else:
		if !"Francis_Mosses" in Global.char_at_home_list:
			Global.char_at_home_list.append("Francis_Mosses")
			Global.char_out_home_list.erase("Francis_Mosses")
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Francis: "
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sangre"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Blood"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "血液"
				1:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Brazos extras"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Extra arms"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "额外的手臂"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Orejas largas"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Long ears"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "长耳朵"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cara fantasma"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Ghost face"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "鬼脸"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Documentos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake documents"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "假文件"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong Eyes"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眼睛"
				6:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				7:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cejas falsas"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong eyebrows"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眉毛"
				8:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin logo D.D.D."
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No D.D.D. Logo"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有D.D.D.标志"
