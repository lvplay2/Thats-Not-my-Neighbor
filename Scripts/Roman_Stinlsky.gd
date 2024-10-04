extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100, 280)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(985, 280)
const CHAR_AT_DELETE_POS = Vector2(1900, 280)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10
const FAKE_NAME_01 = "Romar"
const FAKE_NAME_02 = "Ronnan"
const FAKE_NAME_03 = "Raman"
const FAKE_LAST_NAME_01 = "Stinsky"
const FAKE_LAST_NAME_02 = "Stinlsky"
const FAKE_LAST_NAME_03 = "Stiilnsky"
const ENTRY_REASON_ENGLISH = "I'm a resident of the building.\nMy apartment is the 01 \non the first floor."
const ENTRY_REASON_SPANISH = "Soy residente del edificio.\nMi apartamento es el 01 del \nprimer piso."
const ENTRY_REASON_CHINESE = "我是这栋楼的居民。\n我的公寓在一楼，门牌号是01。"
const ENTRY_REASON_02_ENGLISH = "I'm a resident of the building.\nI come from my job as a public accountant."
const ENTRY_REASON_02_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como contador público."
const ENTRY_REASON_02_CHINESE = "我是这栋大楼的居民。\n我出门去上班，我是一会计师。"
const ENTRY_REASON_DOPPEL_01_ENGLISH = "I'm a resident of the building.\nI went out to renew my ID."
const ENTRY_REASON_DOPPEL_01_SPANISH = "Soy residente del edificio.\nSalí a renovar mi identificación."
const ENTRY_REASON_DOPPEL_01_CHINESE = "我是这栋楼的居民。\n我出去换身份证了"
const ENTRY_REASON_DOPPEL_01_SECOND_ENGLISH = "I resident of da beelding.\nI lif on firzt flor apatment 1."
const ENTRY_REASON_DOPPEL_01_SECOND_SPANISH = "Yo recidemte de el edifisio.\nVivir en primer pizo apatamento 01."
const ENTRY_REASON_DOPPEL_01_SECOND_CHINESE = "我家一楼的住户。\n我的公寓位于人类大楼的14号。"
const ENTRY_REASON_DOPPEL_02_ENGLISH = "I'm not a doppelganger. \nI'm a normal human with \nnormal behavior. \nJust let me in, to do my normal \nhuman activities."
const ENTRY_REASON_DOPPEL_02_SPANISH = "No soy un doppelganger. \nSoy un humano normal con \ncomportamiento normal. \nSolo déjame entrar, para hacer \nmis actividades de humano normal."
const ENTRY_REASON_DOPPEL_02_CHINESE = "我不是假人。\n我是一个正常的人类，有着正常的行为。\n请让我进去，进行我的正常人类活动。"
const ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH = "I'm a resident of the building.\nI come from my job as a writer."
const ENTRY_REASON_DOPPEL_02_SECOND_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como escritor."
const ENTRY_REASON_DOPPEL_02_SECOND_CHINESE = "我是这栋大楼的居民。\n我出门去上班，我是一名作家。"
const FAKE_ID_01 = "483924049684"
const FAKE_ID_02 = "483924056984"
const FAKE_ID_03 = "483920459684"
const FAKE_APARTMENT_ENGLISH_01 = "F10-01"
const FAKE_APARTMENT_ENGLISH_02 = "F01-03"
const FAKE_APARTMENT_ENGLISH_03 = "F02-01"
const FAKE_APARTMENT_SPANISH_01 = "P10-01"
const FAKE_APARTMENT_SPANISH_02 = "P01-03"
const FAKE_APARTMENT_SPANISH_03 = "P02-01"
const FAKE_DATE_01 = "05/1948"
const FAKE_DATE_02 = "05/1954"
const FAKE_DATE_03 = "35/1955"

@onready var animation = $Animation
@onready var talking = $Talk
@onready var mouth = $Head / Mouth
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps
@onready var scar_sprite = $Head / Scar
@onready var eyes_sprite = $Head / Eyes
@onready var hat = $Head / Hat
@onready var third_eye = $"Head/third_Eye2"
@onready var third_eye_animation = $Head / third_Eye2 / Animation
@onready var fake_nose = $Head / Fake_Nose
@onready var scar_left = $Head / Scar_Left
@onready var uzumaki = $Head / Uzumaki
@onready var nose_sprite = $Head / Nose
@onready var head = $Head / Head
@onready var extra_arms = $Body / Extra_Arms
@onready var eyes = $Head / Lot_of_Eyes
@onready var eye_01_animation = $Head / Lot_of_Eyes / third_Eye2 / Animation
@onready var eye_02_animation = $Head / Lot_of_Eyes / third_Eye3 / Animation
@onready var eye_03_animation = $Head / Lot_of_Eyes / third_Eye6 / Animation
@onready var eye_04_animation = $Head / Lot_of_Eyes / third_Eye4 / Animation
@onready var eye_05_animation = $Head / Lot_of_Eyes / third_Eye5 / Animation
@onready var mole: Sprite2D = $Head / Mole

var current_text = []
var is_doppelganger = false
var checklist_values = []
var question_answers_spanish = {"id_ok": ["¿Mi identificación?", "No veo ningún problema con mi identificación."], "appearance_ok": ["¿Qué hay de raro con mi apariencia?", "Me veo igual que siempre."], "entry_request_ok": ["¿Mi solicitud de ingreso?", "Me parece que todo está perfecto con mi solicitud."], "today_list_ok": ["¿No estoy en la lista de hoy?", "Me parece que debe haber un error, si debo estar en la lista.", "Mire la lista nuevamente."]}
var question_answers_english = {"id_ok": ["My ID?", "I don't see anything wrong with my ID."], "appearance_ok": ["What's wrong with my appearance?", "I look like I always do."], "entry_request_ok": ["My entry request?", "I think everything it's fine with my entry request."], "today_list_ok": ["Am I not on today's list?", "I think there is an error, I should be on the list.", "Look at the list again."]}
var question_answers_chinese = {"id_ok": ["我的身份证？", "我觉得我的身份证没什么问题。"], "appearance_ok": ["我的外貌有什么问题？", "我看起来和往常一样。"], "entry_request_ok": ["我的入场请求？", "我觉得我的入场请求没有任何问题。"], "today_list_ok": ["我不是在今天的名单上吗？", "一定是个错误，我应该在名单上。", "再看一下名单。"]}
var entry_request_reason = ""
var hello_text_english = ["Good afternoon."]
var hello_text_spanish = ["Buenas tardes."]
var hello_text_chinese = ["下午好。"]
var id_photo = load("res://Assets/Graphics/Char_Roman_Small_Photo.png")
var entry_photo = load("res://Assets/Graphics/Char_Roman_Long_Photo.png")
var eyes_doppel_01 = load("res://Assets/Graphics/Char_Roman_Doppel_01_Eyes.png")
var id_photo_doppel_01 = load("res://Assets/Graphics/Char_Roman_Doppel_01_Small_Photo.png")
var entry_photo_doppel_01 = load("res://Assets/Graphics/Char_Roman_Doppel_01_Long_Photo.png")
var eyes_doppel_02 = load("res://Assets/Graphics/Char_Roman_Doppel_02_Eyes.png")
var wear_head = load("res://Assets/Graphics/Char_Roman_Doppel_Wear_Head.png")
var entry_photo_doppel_02 = load("res://Assets/Graphics/Char_Roman_Doppel_02_Long_Photo.png")
var entry_photo_doppel_03 = load("res://Assets/Graphics/Char_Roman_Doppel_03_Long_Photo.png")
var id_photo_doppel_02 = load("res://Assets/Graphics/Char_Roman_Doppel_02_Small_Photo.png")
var id_photo_doppel_03 = load("res://Assets/Graphics/Char_Roman_Doppel_03_Small_Photo.png")
var no_photo = load("res://Assets/Graphics/Button_pressed.png")
var id_42_photo = load("res://Assets/Graphics/Char_Roman_Doppel_42_Small_Photo.png")
var id_42_long_photo = load("res://Assets/Graphics/Char_Roman_Doppel_42_Long_Photo.png")
var id_photo_doppel_04 = load("res://Assets/Graphics/Char_Roman_Doppel_04_Small_Photo.png")
var entry_photo_doppel_04 = load("res://Assets/Graphics/Char_Roman_Doppel_04_Long_Photo.png")
var speak_flag = true
var name_char = Global.ROMAN_STINLSKY_DATA["NAME"]
var last_name_char = Global.ROMAN_STINLSKY_DATA["LAST_NAME"]
var number_id = Global.ROMAN_STINLSKY_DATA["ID_NUMBER"]
var id_exp_date = Global.ROMAN_STINLSKY_DATA["ID_EXPIRATION"]
var apart_number_spanish = Global.ROMAN_STINLSKY_DATA["APARTMENT_NUMBER_SPANISH"]
var apart_number_english = Global.ROMAN_STINLSKY_DATA["APARTMENT_NUMBER_ENGLISH"]
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
	if randi_range(0, 4) == 0:
		hat.visible = false
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
	if doppel_number == 7:
		if Global.achievements["42"] == 0:
			Global.achievements["42"] = 1
			get_parent().get_parent()._show_unlock_achievement()
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
					if hat.visible:
						if Global.language == SPANISH_VALUE:
							current_text += question_answers_spanish["appearance_ok"]
						elif Global.language == ENGLISH_VALUE:
							current_text += question_answers_english["appearance_ok"]
						elif Global.language == CHINESE_VALUE:
							current_text += question_answers_chinese["appearance_ok"]
					elif Global.CHAR_LIST[1] in Global.char_at_home_list:
						if Global.language == SPANISH_VALUE:
							current_text += ["Sobre mi apariencia, ¿es por mi sombrero?", "Lo olvidé en casa, puedes llamar a mi apartamento y preguntarle a mi esposa."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["About my appearance, Is it because of my hat?", "I forgot it at home, you can call my apartment and ask my wife."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["关于我的外表，是因为我的帽子吗？", "我把它忘在家里了，你可以打电话给我公寓，问问我的妻子。"]
					else :
						if Global.language == SPANISH_VALUE:
							current_text += ["Sobre mi apariencia, ¿es por mi sombrero?", "Lo olvidé en casa, pero no hay nadie en el apartamento en este momento.", "Debes confiar en mi."]
						elif Global.language == ENGLISH_VALUE:
							current_text += ["About my appearance, Is it because of my hat?", "I forgot it at home, but there's no one at the apartment at this moment.", "You have to trust me."]
						elif Global.language == CHINESE_VALUE:
							current_text += ["关于我的外表，是因为我的帽子吗？", "我把它忘在家里了，但此刻公寓里没有人。", "你必须相信我。"]
					Global.is_appearance_wrong_answer = true
			3:
				if Global.is_entry_request_wrong_answer:
					_repeat_answer()
				else :
					if dont_show_entry_request:
						dont_show_entry_request = false
						if Global.language == SPANISH_VALUE:
							current_text += ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
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
						if doppel_number in [1, 2, 3, 4, 5, 8, 9]:
							get_parent().get_parent().set_id(name_char, last_name_char, number_id, id_exp_date, id_photo)
					else :
						current_text += doppel_id_text
					Global.is_id_wrong_answer = true
			2:
				if Global.is_appearance_wrong_answer:
					_repeat_answer()
				else :
					if hat.visible:
						current_text += doppel_appearance_text
					else :
						current_text += doppel_appearance_no_hat_text
				Global.is_appearance_wrong_answer = true
			3:
				if Global.is_entry_request_wrong_answer:
					_repeat_answer()
				else :
					if dont_show_entry_request:
						current_text += doppel_dont_show_entry_text
						if doppel_number in [2, 3, 5, 9]:
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
					if !Global.CHAR_LIST[0] in Global.today_list:
						current_text += doppel_not_today_list_text
						if doppel_number in [1, 4, 8]:
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
		eyes_sprite.set_texture(eyes_doppel_02)
		eyes_sprite.position.y -= 18
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

func _on_voice_02_finished()->void :
	play_random_sfx()

func _on_voice_03_finished()->void :
	play_random_sfx()

func _on_voice_04_finished()->void :
	play_random_sfx()

func make_doppelganger()->void :
	is_doppelganger = true
	var easy_doppel = randi_range(0, 1)
	var doppel_random
	if easy_doppel == 0:
		var random_hard = randi_range(0, 1)
		if random_hard == 0:
			doppel_random = 7
		else :
			doppel_random = randi_range(4, 10)
		doppel_number = doppel_random
		match doppel_random:
			4:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?", "Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["¿Es necesario la solicitud de entrada?", "Somos vecinos, me conoces.", "No necesito una solicitud para entrar a mi hogar."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?", "Bueno no contaba con eso, me atrapaste.", "¿Qué harás al respecto? Adelante, llama a tus amiguitos del D.D.D.", "Nunca podrán acabar con nosotros, al final lograremos nuestro objetivo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
					doppel_appearance_no_hat_text = ["Sobre mi apariencia, ¿es por mi sombrero?", "Me lo comí porque tenía hambre."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?", "Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["Is it necesary the entry request?", "We are neighbors, you know me.", "I don't need an entry request to get to my home."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?", "Well I didn't count on that, you caught me.", "What are you going to do about it? Go ahead, call your D.D.D. friends.", "They will never be able to finish us off, In the end we will achieve our goal."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
					doppel_appearance_no_hat_text = ["About my appearance, Is it because of my hat?", "I ate it because I was hungry."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["是否需要入境请求？", "我们是邻居，你认识我的。", "我不需要入场申请来回家。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["今天的名单？", "嗯，我没料到会这样，你抓住了我。", "你打算怎么办？继续，叫你的 D.D.D. 朋友来吧。", "他们永远无法消灭我们，最终我们会实现我们的目标。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
					doppel_appearance_no_hat_text = ["关于我的外貌，是因为我的帽子吗？", "我吃了它因为我饿了。"]
				id_photo = id_photo_doppel_04
				entry_photo = entry_photo_doppel_04
				nose_sprite.scale = Vector2(0.7, 0.7)
				nose_sprite.position.y = -10
				var random = randi_range(0, 4)
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
					_:
						pass
			5:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				nose_sprite.visible = false
				fake_nose.visible = true
				id_photo = id_photo_doppel_02
				entry_photo = entry_photo_doppel_02
				var random = randi_range(0, 6)
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
					_:
						pass
			6:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Mi identificación?", "La perdí."]
					doppel_id_text = ["¿Mi identificación?", "Es nueva, la perdí y tuve que sacar otra."]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["¿Es necesario la solicitud de entrada?", "Somos vecinos, me conoces.", "No necesito una solicitud para entrar a mi hogar."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que renovar mi identificación.", "Entonces no pudieron agregarme a la lista."]
					doppel_today_list_text = ["¿No estoy en la lista de hoy?", "Me parece que debe haber un error, si debo estar en la lista.", "Mire la lista nuevamente."]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["My ID?", "I lost it."]
					doppel_id_text = ["My ID?", "It's new, I lost it and had to get another one."]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Is it necesary the entry request?", "We are neighbors, you know me.", "I don't need an entry request to get to my home."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to make a new ID.", "So they couldn't add me to the list."]
					doppel_today_list_text = ["Am I not on today's list?", "I think there is an error, I should be on the list.", "Look at the list again."]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我的身份证？", "我弄丢了。"]
					doppel_id_text = ["我的身份证？", "这是新的，我把它弄丢了，不得不再买一个。"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["是否需要入境请求？", "我们是邻居，你认识我的。", "我不需要入场申请来回家。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我要申请新的身份证。", "所以他们无法把我加入名单。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				third_eye.visible = true
				third_eye_animation.play("Moving")
				var random = randi_range(0, 2)
				match random:
					0:
						number_id = FAKE_ID_01
					1:
						number_id = FAKE_ID_02
					2:
						number_id = FAKE_ID_03
					3:
						pass
				if Global.language == SPANISH_VALUE:
					if dont_show_id:
						entry_request_reason = ENTRY_REASON_SPANISH
					else :
						entry_request_reason = ENTRY_REASON_DOPPEL_01_SPANISH
				elif Global.language == ENGLISH_VALUE:
					if dont_show_id:
						entry_request_reason = ENTRY_REASON_ENGLISH
					else :
						entry_request_reason = ENTRY_REASON_DOPPEL_01_ENGLISH
				elif Global.language == CHINESE_VALUE:
					if dont_show_id:
						entry_request_reason = ENTRY_REASON_CHINESE
					else :
						entry_request_reason = ENTRY_REASON_DOPPEL_01_CHINESE
			7:
				sfx_voice_01 = $Voice_05
				sfx_voice_02 = $Voice_06
				sfx_voice_03 = $Voice_07
				sfx_voice_04 = $Voice_08
				id_photo = id_42_photo
				entry_photo = id_42_long_photo
				scar_sprite.visible = false
				dont_show_entry_request = false
				dont_show_id = false
				eyes_sprite.visible = false
				nose_sprite.visible = false
				mouth.visible = false
				uzumaki.visible = true
				hello_text_english = ["42 ....."]
				hello_text_spanish = ["42 ....."]
				hello_text_chinese = ["42 ....."]
				doppel_dont_show_id_text = ["42 ....."]
				doppel_id_text = ["42 ....."]
				doppel_appearance_text = ["42 ....."]
				doppel_dont_show_entry_text = ["42 ....."]
				doppel_entry_text = ["42 ....."]
				doppel_not_today_list_text = ["42 ....."]
				doppel_today_list_text = ["42 ....."]
				doppel_its_all_ok_text = ["42 ....."]
				repeat_answer_english = ["42 ....."]
				repeat_answer_spanish = ["42 ....."]
				doppel_appearance_no_hat_text = ["42 ....."]
				name_char = "42"
				last_name_char = "42"
				number_id = "42"
				apart_number_english = "42"
				apart_number_spanish = "42"
				id_exp_date = "42"
				entry_request_reason = "1+1+1+1+1+1+1+1+1+1+1+1+\n1+1+1+1+1+1+1+1+1+1+1+1+\n1+1+1+1+1+1+1+1+1+1+1+1+\n1+1+1+1+1+1."
			8:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["¿Es necesario la solicitud de entrada?", "Somos vecinos, me conoces.", "No necesito una solicitud para entrar a mi hogar."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?", "Bueno no contaba con eso, me atrapaste.", "¿Qué harás al respecto? Adelante, llama a tus amiguitos del D.D.D.", "Nunca podrán acabar con nosotros, al final lograremos nuestro objetivo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
					doppel_appearance_no_hat_text = question_answers_spanish["id_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Is it necesary the entry request?", "We are neighbors, you know me.", "I don't need an entry request to get to my home."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?", "Well I didn't count on that, you caught me.", "What are you going to do about it? Go ahead, call your D.D.D. friends.", "They will never be able to finish us off, In the end we will achieve our goal."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["是否需要入境请求？", "我们是邻居，你认识我的。", "我不需要入场申请来回家。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["今天的名单？", "嗯，我没料到会这样，你抓住了我。", "你打算怎么办？继续，叫你的 D.D.D. 朋友来吧。", "他们永远无法消灭我们，最终我们会实现我们的目标。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				scar_sprite.visible = false
				head.set_texture(wear_head)
				head.position += Vector2(-20, -5)
			9:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
					doppel_appearance_no_hat_text = question_answers_spanish["id_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
					doppel_appearance_no_hat_text = question_answers_english["id_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				extra_arms.visible = true
				var random = randi_range(0, 6)
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
					_:
						pass
			10:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Mi identificación?", "La perdí."]
					doppel_id_text = ["¿Mi identificación?", "Es nueva, la perdí y tuve que sacar otra."]
					doppel_appearance_text = ["¿Mis ojos?", "¿Qué tienen de malo mis ojos?"]
					doppel_dont_show_entry_text = ["¿Es necesario la solicitud de entrada?", "Somos vecinos, me conoces.", "No necesito una solicitud para entrar a mi hogar."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que renovar mi identificación.", "Entonces no pudieron agregarme a la lista."]
					doppel_today_list_text = ["¿No estoy en la lista de hoy?", "Me parece que debe haber un error, si debo estar en la lista.", "Mire la lista nuevamente."]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
					doppel_appearance_no_hat_text = ["¿Mi sombrero?", "¿Qué es un sombrero?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["My ID?", "I lost it."]
					doppel_id_text = ["My ID?", "It's new, I lost it and had to get another one."]
					doppel_appearance_text = ["My eyes?", "What's wrong with my eyes?"]
					doppel_dont_show_entry_text = ["Is it necesary the entry request?", "We are neighbors, you know me.", "I don't need an entry request to get to my home."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to make a new ID.", "So they couldn't add me to the list."]
					doppel_today_list_text = ["Am I not on today's list?", "I think there is an error, I should be on the list.", "Look at the list again."]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我的身份证？", "我弄丢了。"]
					doppel_id_text = ["我的身份证？", "这是新的，我把它弄丢了，不得不再买一个。"]
					doppel_appearance_text = ["我的眼睛？", "我的眼睛怎么了？"]
					doppel_dont_show_entry_text = ["是否需要入境请求？", "我们是邻居，你认识我的。", "我不需要入场申请来回家。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我要申请新的身份证。", "所以他们无法把我加入名单。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				third_eye.visible = true
				eyes.visible = true
				nose_sprite.visible = false
				eyes_sprite.visible = false
				id_photo = no_photo
				entry_photo = no_photo
				await get_tree().create_timer(0.1).timeout
				eye_01_animation.play("Moving")
				await get_tree().create_timer(0.1).timeout
				eye_02_animation.play("Moving")
				await get_tree().create_timer(0.1).timeout
				eye_03_animation.play("Moving")
				await get_tree().create_timer(0.1).timeout
				eye_04_animation.play("Moving")
				await get_tree().create_timer(0.1).timeout
				eye_05_animation.play("Moving")
				third_eye_animation.play("Moving")
				var random = randi_range(0, 2)
				match random:
					0:
						number_id = FAKE_ID_01
					1:
						number_id = FAKE_ID_02
					2:
						number_id = FAKE_ID_03
					3:
						pass
				if Global.language == SPANISH_VALUE:
					if dont_show_id:
						entry_request_reason = ENTRY_REASON_SPANISH
					else :
						entry_request_reason = ENTRY_REASON_DOPPEL_01_SPANISH
				elif Global.language == ENGLISH_VALUE:
					if dont_show_id:
						entry_request_reason = ENTRY_REASON_ENGLISH
					else :
						entry_request_reason = ENTRY_REASON_DOPPEL_01_ENGLISH
				elif Global.language == CHINESE_VALUE:
					if dont_show_id:
						entry_request_reason = ENTRY_REASON_CHINESE
					else :
						entry_request_reason = ENTRY_REASON_DOPPEL_01_CHINESE
	else :
		doppel_random = randi_range(0, 3)
		doppel_number = doppel_random
		match doppel_random:
			0:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Mi identificación?", "La perdí."]
					doppel_id_text = ["¿Mi identificación?", "Es nueva, la perdí y tuve que sacar otra."]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["¿Es necesario la solicitud de entrada?", "Somos vecinos, me conoces.", "No necesito una solicitud para entrar a mi hogar."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que renovar mi identificación.", "Entonces no pudieron agregarme a la lista."]
					doppel_today_list_text = ["¿No estoy en la lista de hoy?", "Me parece que debe haber un error, si debo estar en la lista.", "Mire la lista nuevamente."]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
					doppel_appearance_no_hat_text = ["¿Mi sombrero?", "¿Qué es un sombrero?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["My ID?", "I lost it."]
					doppel_id_text = ["My ID?", "It's new, I lost it and had to get another one."]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["Is it necesary the entry request?", "We are neighbors, you know me.", "I don't need an entry request to get to my home."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to make a new ID.", "So they couldn't add me to the list."]
					doppel_today_list_text = ["Am I not on today's list?", "I think there is an error, I should be on the list.", "Look at the list again."]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
					doppel_appearance_no_hat_text = ["My hat?", "What's a hat?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我的身份证？", "我弄丢了。"]
					doppel_id_text = ["我的身份证？", "这是新的，我把它弄丢了，不得不再买一个。"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["是否需要入境请求？", "我们是邻居，你认识我的。", "我不需要入场申请来回家。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我要申请新的身份证。", "所以他们无法把我加入名单。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
					doppel_appearance_no_hat_text = ["我的帽子？", "什么是帽子？"]
				scar_sprite.visible = false
				eyes_sprite.set_texture(eyes_doppel_01)
				id_photo = id_photo_doppel_01
				entry_photo = entry_photo_doppel_01
				var random = randi_range(0, 2)
				match random:
					0:
						number_id = FAKE_ID_01
					1:
						number_id = FAKE_ID_02
					2:
						number_id = FAKE_ID_03
				if Global.language == SPANISH_VALUE:
					if dont_show_id:
						entry_request_reason = ENTRY_REASON_SPANISH
					else :
						entry_request_reason = ENTRY_REASON_DOPPEL_01_SPANISH
				elif Global.language == ENGLISH_VALUE:
					if dont_show_id:
						entry_request_reason = ENTRY_REASON_ENGLISH
					else :
						entry_request_reason = ENTRY_REASON_DOPPEL_01_ENGLISH
				elif Global.language == CHINESE_VALUE:
					if dont_show_id:
						entry_request_reason = ENTRY_REASON_CHINESE
					else :
						entry_request_reason = ENTRY_REASON_DOPPEL_01_CHINESE
			1:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Qué hay de raro con mi apariencia?", "Mira bien las fotos de mis papeles y compáralas bien conmigo."]
					doppel_dont_show_entry_text = ["¿Es necesario la solicitud de entrada?", "Somos vecinos, me conoces.", "No necesito una solicitud para entrar a mi hogar."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["¿Lista de hoy?", "¡Maldición!", "Bueno no contaba con eso, me atrapaste.", "¿Qué harás al respecto? Adelante, llama a tus amiguitos del D.D.D.", "Nunca podrán acabar con nosotros, al final lograremos nuestro objetivo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
					doppel_appearance_no_hat_text = ["Sobre mi apariencia, ¿es por mi sombrero?", "Me lo comí porque tenía hambre."]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["What's wrong with my appearance?", "Look carefully at the photos of my papers and compare them well with me."]
					doppel_dont_show_entry_text = ["Is it necesary the entry request?", "We are neighbors, you know me.", "I don't need an entry request to get to my home."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["Today's list?", "Fuck!", "Well I didn't count on that, you caught me.", "What are you going to do about it? Go ahead, call your D.D.D. friends.", "They will never be able to finish us off, In the end we will achieve our goal."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
					doppel_appearance_no_hat_text = ["About my appearance, Is it because of my hat?", "I ate it because I was hungry."]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌有什么问题？", "仔细看看我文件上的照片，然后将其与我好好比较一下。"]
					doppel_dont_show_entry_text = ["是否需要入境请求？", "我们是邻居，你认识我的。", "我不需要入场申请来回家。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["今天的名单？", "肏!", "嗯，我没料到会这样，你抓住了我。", "你打算怎么办？继续，叫你的 D.D.D. 朋友来吧。", "他们永远无法消灭我们，最终我们会实现我们的目标。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
					doppel_appearance_no_hat_text = ["关于我的外貌，是因为我的帽子吗？", "我吃了它因为我饿了。"]
				eyes_sprite.set_texture(eyes_doppel_01)
				var random = randi_range(0, 4)
				var random_02 = randi_range(0, 5)
				match random_02:
					0:
						id_exp_date = FAKE_DATE_01
					1:
						id_exp_date = FAKE_DATE_02
					2:
						id_exp_date = FAKE_DATE_03
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
			2:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
					doppel_appearance_no_hat_text = question_answers_spanish["id_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
					doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
				scar_left.visible = true
				scar_sprite.visible = false
				id_photo = id_photo_doppel_03
				entry_photo = entry_photo_doppel_03
			_:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de entrada."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["Entonces, ¿Todo está en orden?", "¿Puede abrirme la puerta?"]
					doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
					doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
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
						random = randi_range(0, 2)
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

func _record_update()->void :
	if Global.is_campaign:
		get_parent().get_parent().restart_ddd_logo()
	if Global.is_3312_active:
		if is_doppelganger:
			Global.doppel_captured_level += 1
		else :
			Global.chars_killed_level += 1
			Global.neighbors_killed_info += "*Roman Stilnsky"
			if Global.is_campaign:
				Global.neighbors_killed_level_list_1F += 1000000
				Global.neighbors_kill_count_aux += 1
	else :
		if !"Roman_Stilnsky" in Global.char_at_home_list:
			Global.char_at_home_list.append("Roman_Stilnsky")
			Global.char_out_home_list.erase("Roman_Stilnsky")
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Roman: "
			if Global.is_campaign:
				Global.neighbors_killed_level_list_1F += 1100000
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin cicatriz"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No scar"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有疤痕"
				1:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Dos cejas"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Two eyebrows"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "两只眉毛"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cicatriz"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Scar"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "疤痕"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Documentos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake documents"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假文件"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz pequeña"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Small nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "小鼻子"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				6:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Tercer ojo"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Third eye"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "第三只眼睛"
				7:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "42"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "42"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "42"
				8:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cabeza falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong head"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假头"
				9:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Brazos extras"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Extra arms"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "额外的手臂"
				10:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Muchos ojos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Many eyes"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "许多眼睛"
				11:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Logo DDD falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake DDD logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "伪造的DDD标志"
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
	var random_doppel = randi_range(11, 13)
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
		doppel_appearance_no_hat_text = question_answers_spanish["appearance_ok"]
	elif Global.language == ENGLISH_VALUE:
		doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
		doppel_id_text = question_answers_english["id_ok"]
		doppel_appearance_text = question_answers_english["appearance_ok"]
		doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
		doppel_entry_text = question_answers_english["entry_request_ok"]
		doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
		doppel_today_list_text = question_answers_english["today_list_ok"]
		doppel_its_all_ok_text = ["So, is everything in order?", "Can you open the door for me?"]
		doppel_appearance_no_hat_text = question_answers_english["appearance_ok"]
	elif Global.language == CHINESE_VALUE:
		doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
		doppel_id_text = question_answers_chinese["id_ok"]
		doppel_appearance_text = question_answers_chinese["appearance_ok"]
		doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
		doppel_entry_text = question_answers_chinese["entry_request_ok"]
		doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
		doppel_today_list_text = question_answers_chinese["today_list_ok"]
		doppel_its_all_ok_text = ["那么，一切都正常吗？", "你能为我开门吗？"]
		doppel_appearance_no_hat_text = question_answers_chinese["appearance_ok"]
	match random_doppel:
		11:
			get_parent().get_parent().change_ddd_logo(randi_range(0, 2), randi_range(0, 1))
		12:
			mole.visible = true
		_:
			mouth.scale = Vector2(0.85, 0.85)
