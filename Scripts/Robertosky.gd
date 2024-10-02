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
const FAKE_NAME_01 = "Albertsky"
const FAKE_NAME_02 = "Roberttsky"
const FAKE_NAME_03 = "Robertskyn"
const FAKE_LAST_NAME_01 = "Peach"
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
const ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH = "I'm a resident of the building.\nI come from my job as a model."
const ENTRY_REASON_DOPPEL_02_SECOND_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como modelo."
const ENTRY_REASON_DOPPEL_02_SECOND_CHINESE = "我是这栋楼的居民。\n我外出工作，我是一名模特。"
const FAKE_ID_01 = "146512986354"
const FAKE_ID_02 = "111465289730"
const FAKE_ID_03 = "114655289730"
const FAKE_APARTMENT_ENGLISH_01 = "F10-02"
const FAKE_APARTMENT_ENGLISH_02 = "F03-02"
const FAKE_APARTMENT_ENGLISH_03 = "F01-01"
const FAKE_APARTMENT_SPANISH_01 = "P10-02"
const FAKE_APARTMENT_SPANISH_02 = "P03-02"
const FAKE_APARTMENT_SPANISH_03 = "P01-01"
const FAKE_DATE_01 = "22/1973"
const FAKE_DATE_02 = "12/1943"
const FAKE_DATE_03 = "12/115"

@onready var animation = $Animation
@onready var talking = $Talk
@onready var mouth = $Head/Mouth
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps
@onready var eyes_sprite = $Head/Eyes
@onready var nose = $Head/Nose
@onready var head = $Head/Head
@onready var hair = $Head/Hair
@onready var doppel_head = $Head/Doppel_Head
@onready var doppel_nose = $Head/Doppel_Nose
@onready var beard = $Head/Beard
@onready var eyebrows = $Head/Eyebrows
@onready var mole = $Head/Mole
@onready var peach = $Head/Peach
@onready var tripo = $Head/Tripo
@onready var doppel_eyes = $Head/Doppel_Eyes
@onready var peach_mouth = $Head/Peach/Mouth

var current_text = []
var is_doppelganger = false
var checklist_values = []
var question_answers_spanish = {"id_ok": ["¿Mi identificación?","No veo ningún problema con mi identificación."], "appearance_ok": ["¿Qué hay de raro con mi apariencia?","Me veo igual de guapo que siempre."], "entry_request_ok": ["¿Mi solicitud de ingreso?","Me parece que todo está perfecto con mi solicitud."], "today_list_ok": ["¿No estoy en la lista de hoy?","Me parece que debe haber un error, si debo estar en la lista.","Mire la lista nuevamente."]}
var question_answers_english = {"id_ok": ["My ID?","I don't see anything wrong with my ID."], "appearance_ok": ["What's wrong with my appearance?","I look as handsome as ever."], "entry_request_ok": ["My entry request?","I think everything it's fine with my entry request."], "today_list_ok": ["Am I not on today's list?","I think there is an error, I should be on the list.","Look at the list again."]}
var question_answers_chinese = {"id_ok": ["我的身份证？","我觉得我的身份证没什么问题。"], "appearance_ok": ["我的外貌有什么问题吗？","我看起来一如既往地帅气。"], "entry_request_ok": ["我的入场请求？","我觉得我的入场请求没有任何问题。"], "today_list_ok": ["我不是在今天的名单上吗？","一定是个错误，我应该在名单上。","再看一下名单。"]}
var entry_request_reason = ""
var hello_text_english = ["Hi."]
var hello_text_spanish = ["Hola."]
var hello_text_chinese = ["你好。"]
var id_photo = load("res://Assets/Graphics/Char_Robertosky_Small_Photo.png")
var entry_photo = load("res://Assets/Graphics/Char_Robertosky_Long_Photo.png")
var id_photo_doppel_01 = load("res://Assets/Graphics/Char_Robertosky_Small_Photo_Doppel_01.png")
var entry_photo_doppel_01 = load("res://Assets/Graphics/Char_Robertosky_Long_Photo_Doppel_01.png")
var entry_photo_doppel_02 = load("res://Assets/Graphics/Char_Robertosky_Long_Photo_Doppel_02.png")
var entry_photo_doppel_03 = load("res://Assets/Graphics/Char_Robertosky_Long_Photo_Doppel_03.png")
var id_photo_doppel_02 = load("res://Assets/Graphics/Char_Robertosky_Small_Photo_Doppel_02.png")
var id_photo_doppel_03 = load("res://Assets/Graphics/Char_Robertosky_Small_Photo_Doppel_03.png")
var no_photo = load("res://Assets/Graphics/Button_pressed.png")
var id_photo_doppel_04 = load("res://Assets/Graphics/Char_Robertosky_Small_Photo_Doppel_04.png")
var entry_photo_doppel_04 = load("res://Assets/Graphics/Char_Robertosky_Long_Photo_Doppel_04.png")
var peach_photo = load("res://Assets/Graphics/Char_Robertsky_Doppel_peach_Small_Photo.png")
var peach_long_photo = load("res://Assets/Graphics/Char_Robertsky_Doppel_peach_Long_Photo.png")
var speak_flag = true
var name_char = Global.ROBERTOSKY_PEACHMAN_DATA["NAME"]
var last_name_char = Global.ROBERTOSKY_PEACHMAN_DATA["LAST_NAME"]
var number_id = Global.ROBERTOSKY_PEACHMAN_DATA["ID_NUMBER"]
var id_exp_date = Global.ROBERTOSKY_PEACHMAN_DATA["ID_EXPIRATION"]
var apart_number_spanish = Global.ROBERTOSKY_PEACHMAN_DATA["APARTMENT_NUMBER_SPANISH"]
var apart_number_english = Global.ROBERTOSKY_PEACHMAN_DATA["APARTMENT_NUMBER_ENGLISH"]
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
var repeat_answer_spanish= ["Ya respondí su pregunta."]
var repeat_answer_english = ["I already answered your question."]
var repeat_answer_chinese = ["我已经回答了你的问题。"]
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
	if doppel_number == 3:
		if Global.achievements["PEACH"] == 0:
			Global.achievements["PEACH"] = 1
			get_parent().get_parent()._show_unlock_achievement()
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
		peach_mouth.play("Talking")
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
							current_text += ["Olvidé mostrar mi identificación."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["I forgot to show my ID."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["我忘了出示我的身份证。"]
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
							current_text += ["Olvidé mostrar mi solicitud de ingreso."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["I forgot to show my entry request."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["我忘了出示我的入场申请。"]
						if Global.language == SPANISH_VALUE:
							get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_spanish,entry_request_reason,entry_photo)
						else:
							get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number_english,entry_request_reason,entry_photo)
					else:
						if Global.language == SPANISH_VALUE:
							current_text += ["¿Mi solicitud de entrada?","Me parece que todo está perfecto con mi solicitud."]
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
					current_text = ["Perfecto.","La puerta."]
				elif Global.language == ENGLISH_VALUE:
					current_text = ["Perfect.","The door."]
				elif Global.language == CHINESE_VALUE:
					current_text = ["完美。","请开门。"]
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
						if doppel_number in [4,5,6,7,8,9]:
							get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
					else:
						current_text += doppel_id_text
					Global.is_id_wrong_answer = true
			2:
				if Global.is_appearance_wrong_answer:
					_repeat_answer()
				else:
					current_text += doppel_appearance_text 
					if doppel_number in [7]:
						change_voice()
						current_text = doppel_appearance_text 
					Global.is_appearance_wrong_answer = true
			3:
				if Global.is_entry_request_wrong_answer:
					_repeat_answer()
				else:
					if dont_show_entry_request:
						current_text += doppel_dont_show_entry_text 
						if doppel_number in [4,5,6,7,8,9]:
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
					if !Global.CHAR_LIST[10] in Global.today_list:
						current_text += doppel_not_today_list_text 
						if doppel_number in [4,6,7,8]:
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
			peach_mouth.play("Close")
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
		var random_hard = randi_range(0,1)
		if random_hard == 0:
			doppel_random = 3
		else:
			doppel_random = randi_range(0,4)
			if Global.tripo and doppel_random == 2:
				doppel_random = 4
		doppel_number = doppel_random
		match doppel_random:
			0: # No nose
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Identificación?","¿Qué es eso?","No estudié eso."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi apariencia?","¿Nariz?","Nací sin nariz.","Es normal en humanos."]
					doppel_dont_show_entry_text = ["¿Mi solicitud de entrada?","No tengo."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?","La puerta."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["ID?","What is that?","I didn't study that."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My appearance?","Nose?","I was born without a nose.","It's normal for humans."]
					doppel_dont_show_entry_text = ["¿My entry request?","I don't have it."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?","The door."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["身份证？","那是什么？","我没有学过那个。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌？","鼻子？","我生来没有鼻子。","这对人类来说很正常。"]
					doppel_dont_show_entry_text = ["我的入场申请？", "我想我把它弄丢了。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","请开门。"]
				nose.visible = false
			1: # Wear head
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Identificación?","No la tengo."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi cabeza?","Dormí mal anoche."]
					doppel_dont_show_entry_text = ["¿Es necesario la solicitud de ingreso?","Somos vecinos, me conoces.","No necesito una solicitud para entrar a mi hogar."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?","La puerta."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["ID?","I don't have it."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My head?","I slept badly last night."]
					doppel_dont_show_entry_text = ["Is it necesary the entry request?","We are neighbors, you know me.","I don't need an entry request to get to my home."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?","The door."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["身份证？","我没有。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["是否需要入境请求？","我们是邻居，你认识我的。","我不需要入场申请来回家。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","请开门。"]
				head.visible = false
				doppel_head.visible = true
			2: # Tripo
				sfx_voice_01 = $Voice_05
				sfx_voice_02 = $Voice_06
				sfx_voice_03 = $Voice_07
				sfx_voice_04 = $Voice_08
				dont_show_entry_request = true
				dont_show_id = true
				mouth.visible = false
				beard.visible = false
				tripo.visible = true
				hello_text_english = ["..... ..."]
				hello_text_spanish = ["..... ..."]
				hello_text_chinese = ["..... ..."]
				doppel_dont_show_id_text = ["..... ... ..... ..."]
				doppel_id_text = ["..... ... ..... ..."]
				doppel_appearance_text = ["..... ... ..... ..."]
				doppel_dont_show_id_text = ["..... ... ..... ..."]
				doppel_entry_text = ["..... ... ..... ..."]
				doppel_dont_show_entry_text = ["..... ... ..... ..."]
				doppel_not_today_list_text = ["..... ... ..... ..."]
				doppel_today_list_text = ["..... ... ..... ..."]
				doppel_its_all_ok_text = ["..... ... ..... ..."]
				repeat_answer_english = ["..... ... ..... ..."]
				repeat_answer_spanish = ["..... ... ..... ..."]
			3: # Peach
				sfx_voice_01 = $Voice_05
				sfx_voice_02 = $Voice_06
				sfx_voice_03 = $Voice_07
				sfx_voice_04 = $Voice_08
				id_photo = peach_photo
				entry_photo = peach_long_photo
				dont_show_entry_request = false
				dont_show_id = false
				mouth.visible = false
				eyes_sprite.visible = false
				beard.visible = false
				peach.visible = true
				hello_text_english = ["Peach peach."]
				hello_text_spanish = ["Peach peach."]
				hello_text_chinese = ["Peach peach."]
				doppel_dont_show_id_text = ["Peach pe pe peach peach pe peach."]
				doppel_id_text = ["Pe pe pe peach peach peach peach."]
				doppel_appearance_text = ["Peach pe pe peach peach pe peach."]
				doppel_dont_show_id_text = ["Pe pe pe peach peach peach peach."]
				doppel_entry_text = ["Pe pe pe peach peach peach peach."]
				doppel_dont_show_entry_text = ["Peach pe pe peach peach pe peach."]
				doppel_not_today_list_text = ["Peach pe pe peach peach pe peach."]
				doppel_today_list_text = ["Pe pe pe peach peach peach peach."]
				doppel_its_all_ok_text = ["Pe pe pe peach peach peach peach."]
				repeat_answer_english = ["Peach pe pe peach peach pe peach."]
				repeat_answer_spanish = ["Pe pe pe peach peach peach peach."]
				name_char = "Peach"
				last_name_char = "Peach"
				number_id = "Peeeeaaach"
				apart_number_english = "Peach"
				apart_number_spanish = "Peach"
				id_exp_date = "Peach"
				entry_request_reason = "Peach pe pe peach peach pe peach.\nPe pe pe peach peach peach peach.\nPeach pe pe peach peach peach pe peach."
			4: # Other nose
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?","Sabía que tenía que revisar eso, me atrapaste."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?","La puerta."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?","I knew I had to check that, you caught me."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?","The door."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我知道我应该检查的，你抓住了我。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","请开门。"]
				nose.visible = false
				doppel_nose.visible = true
				id_photo = id_photo_doppel_04
				entry_photo = entry_photo_doppel_04
	else:
		doppel_random = randi_range(5,9)
		doppel_number = doppel_random
		match doppel_random:
			5: # All ok visually
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?","La puerta."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?","The door."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","请开门。"]
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
			6: # Eyebrows
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?","Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["Olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?","Sabía que tenía que revisar eso, me atrapaste."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?","La puerta."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?","Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?","I knew I had to check that, you caught me."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?","The door."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？","仔细看看我文件上的照片，然后将其与我好好比较一下。"]
					doppel_dont_show_entry_text = ["我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我知道我应该检查的，你抓住了我。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","请开门。"]
				eyebrows.visible = true
				id_photo = id_photo_doppel_01
				entry_photo = entry_photo_doppel_01
			7: # No beard
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¡Olvidé el chivo!","Sabía que algo olvidaba.","Me atrapaste."]
					doppel_dont_show_entry_text = ["Olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?","Sabía que tenía que revisar eso, me atrapaste."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?","La puerta."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["I forgot the goatee!","I knew I was forgetting something.","You caught me."]
					doppel_dont_show_entry_text = ["I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?","I knew I had to check that, you caught me."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?","The door."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我忘了胡须!","我知道我忘了某件事情。","你抓住我了。"]
					doppel_dont_show_entry_text = ["我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我知道我应该检查的，你抓住了我。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","请开门。"]
				beard.visible = false
				id_photo = id_photo_doppel_02
				entry_photo = entry_photo_doppel_02
			8: # Mole
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?","Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["Olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?","Sabía que tenía que revisar eso, me atrapaste."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?","La puerta."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?","Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?","I knew I had to check that, you caught me."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?","The door."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？","仔细看看我文件上的照片，然后将其与我好好比较一下。"]
					doppel_dont_show_entry_text = ["我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我知道我应该检查的，你抓住了我。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","请开门。"]
				mole.visible = true
				id_photo = id_photo_doppel_03
				entry_photo = entry_photo_doppel_03
			9: # no ddd
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?","La puerta."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?","The door."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美。","请开门。"]
				get_parent().get_parent().hide_ddd_logo_entry(false)

func _record_update() -> void:
	get_parent().get_parent().hide_ddd_logo_entry(true)
	if Global.is_3312_active:
		if is_doppelganger:
			Global.doppel_captured_level += 1
		else:
			Global.chars_killed_level += 1
			Global.neighbors_killed_info += "*Robertsky Peachman"
	else:
		if !"Robertosky_Peachman" in Global.char_at_home_list:
			Global.char_at_home_list.append("Robertosky_Peachman")
			Global.char_out_home_list.erase("Robertosky_Peachman")
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Robertsky: "
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin nariz"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Without nose"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有鼻子"
				1:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cabeza falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong head"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "假头"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Agujeros"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "holes"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "孔洞"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Peach"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Peach"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "Peach"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Documentos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake documents"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "假文件"
				6:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cejas falsas"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong eyebrows"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眉毛"
				7:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin chivo"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No goatee"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有山羊胡子"
				8:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Lunar"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Mole"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "痣"
				9:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin logo D.D.D."
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No D.D.D. Logo"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有D.D.D.标志"
