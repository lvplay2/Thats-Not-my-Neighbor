extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100, 300)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(985, 300)
const CHAR_AT_DELETE_POS = Vector2(1900, 300)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10
const FAKE_NAME_01 = "Alff"
const FAKE_NAME_02 = "Allf"
const FAKE_NAME_03 = "Alfo"
const FAKE_LAST_NAME_01 = "Capuccin"
const FAKE_LAST_NAME_02 = "Cappucin"
const FAKE_LAST_NAME_03 = "Capuciin"
const ENTRY_REASON_ENGLISH = "I'm a resident of the building.\nMy apartment is the 04 \non the third floor."
const ENTRY_REASON_SPANISH = "Soy residente del edificio.\nMi apartamento es el 04 del \ntercer piso."
const ENTRY_REASON_CHINESE = "我是这栋楼的居民。\n我的公寓是三楼的04号。"
const ENTRY_REASON_02_ENGLISH = "I'm a resident of the building.\nI come from my job as a lawyer."
const ENTRY_REASON_02_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como abogado."
const ENTRY_REASON_02_CHINESE = "我是这栋大楼的居民。\n我来自我的律师工作。"
const ENTRY_REASON_DOPPEL_01_ENGLISH = "I'm a resident of the building.\nMy apartment is the 04 \non the first floor."
const ENTRY_REASON_DOPPEL_01_SPANISH = "Soy residente del edificio.\nMi apartamento es el 04 del \nprimer piso."
const ENTRY_REASON_DOPPEL_01_CHINESE = "我是这栋大楼的居民。\n我的公寓是一楼的04号。"
const ENTRY_REASON_DOPPEL_02_ENGLISH = "I'm not a doppelganger. \nI'm a normal human with \nnormal behavior. \nJust let me in, to do my normal \nhuman activities."
const ENTRY_REASON_DOPPEL_02_SPANISH = "No soy un doppelganger. \nSoy un humano normal con \ncomportamiento normal. \nSolo déjame entrar, para hacer \nmis actividades de humano normal."
const ENTRY_REASON_DOPPEL_02_CHINESE = "我不是假人。\n我是一个正常的人类，有着正常的行为。\n请让我进去，进行我的正常人类活动。"
const ENTRY_REASON_DOPPEL_02_SECOND_ENGLISH = "I'm a resident of the building.\nI come from my job as a public accountant."
const ENTRY_REASON_DOPPEL_02_SECOND_SPANISH = "Soy residente del edificio.\nVengo de mi trabajo como contador público."
const ENTRY_REASON_DOPPEL_02_SECOND_CHINESE = "我是这栋大楼的居民。\n我从我的会计师公共工作回来。"
const FAKE_ID_01 = "120548896347"
const FAKE_ID_02 = "12054809647"
const FAKE_ID_03 = "12058096347"
const FAKE_APARTMENT_ENGLISH_01 = "F01-04"
const FAKE_APARTMENT_ENGLISH_02 = "F04-03"
const FAKE_APARTMENT_ENGLISH_03 = "F02-04"
const FAKE_APARTMENT_SPANISH_01 = "P01-04"
const FAKE_APARTMENT_SPANISH_02 = "P04-03"
const FAKE_APARTMENT_SPANISH_03 = "P02-04"
const FAKE_DATE_01 = "08/1950"
const FAKE_DATE_02 = "80/1960"
const FAKE_DATE_03 = "08/1855"

@onready var animation = $Animation
@onready var talking = $Talk
@onready var doppel_veins = $Doppel_veins
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps
@onready var eyes_sprite = $Head / Eyes
@onready var hat = $Head / Hat
@onready var nose_sprite = $Head / Nose
@onready var head = $Head / Head
@onready var monocle = $Head / Monocle
@onready var eyebrows = $Head / Eyebrows
@onready var moustache = $Head / Moustache
@onready var doppel_eyes = $Head / Doppel_Eyes
@onready var blood_body = $Body / Blood
@onready var blood_head = $Head / Head / Blood
@onready var blood_hat = $Head / Hat / Blood
@onready var wear_head = $Head / Wear_Head
@onready var doppel_nose = $Head / Doppel_Nose
@onready var draw_eyes = $Head / Draw_Eyes
@onready var doppel_eyebrows = $Head / Doppel_Eyebrows
@onready var mole = $Head / Mole
@onready var mouth = $Head / Mouth
@onready var veins = $Head / Veins
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
var id_photo = load("res://Assets/Graphics/Char_Alf_Small_Photo.png")
var entry_photo = load("res://Assets/Graphics/Char_Alf_Long_Photo.png")
var id_photo_doppel_01 = load("res://Assets/Graphics/Char_Alf_Small_Photo_Doppel_01.png")
var entry_photo_doppel_01 = load("res://Assets/Graphics/Char_Alf_Long_Photo_Doppel_01.png")
var entry_photo_doppel_02 = load("res://Assets/Graphics/Char_Alf_Long_Photo_Doppel_02.png")
var entry_photo_doppel_03 = load("res://Assets/Graphics/Char_Alf_Long_Photo_Doppel_03.png")
var entry_photo_doppel_04 = load("res://Assets/Graphics/Char_Alf_Long_Photo_Doppel_04.png")
var entry_photo_doppel_05 = load("res://Assets/Graphics/Char_Alf_Long_Photo_Doppel_05.png")
var id_photo_doppel_02 = load("res://Assets/Graphics/Char_Alf_Small_Photo_Doppel_02.png")
var id_photo_doppel_03 = load("res://Assets/Graphics/Char_Alf_Small_Photo_Doppel_03.png")
var id_photo_doppel_04 = load("res://Assets/Graphics/Char_Alf_Small_Photo_Doppel_04.png")
var id_photo_doppel_05 = load("res://Assets/Graphics/Char_Alf_Small_Photo_Doppel_05.png")
var no_photo = load("res://Assets/Graphics/Button_pressed.png")
var speak_flag = true
var name_char = Global.ALF_CAPPUCCIN_DATA["NAME"]
var last_name_char = Global.ALF_CAPPUCCIN_DATA["LAST_NAME"]
var number_id = Global.ALF_CAPPUCCIN_DATA["ID_NUMBER"]
var id_exp_date = Global.ALF_CAPPUCCIN_DATA["ID_EXPIRATION"]
var apart_number_spanish = Global.ALF_CAPPUCCIN_DATA["APARTMENT_NUMBER_SPANISH"]
var apart_number_english = Global.ALF_CAPPUCCIN_DATA["APARTMENT_NUMBER_ENGLISH"]
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
var doppel_appearance_no_monocle_text = [""]
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
		mouth.play("Talk_Doppel")
	else :
		mouth.play("Talk")

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
					elif Global.CHAR_LIST[7] in Global.char_at_home_list:
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
							current_text += ["¿Mi solicitud de ingreso?", "Me parece que todo está perfecto con mi solicitud."]
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
						if doppel_number in [0, 1, 2, 3, 4, 5, 6, 7, 10, 11]:
							get_parent().get_parent().set_id(name_char, last_name_char, number_id, id_exp_date, id_photo)
					else :
						current_text += doppel_id_text
					Global.is_id_wrong_answer = true
			2:
				if Global.is_appearance_wrong_answer:
					_repeat_answer()
				else :
					if doppel_number in [3, 7]:
						change_voice()
					elif hat.visible:
						current_text += doppel_appearance_text
					else :
						current_text += doppel_appearance_no_hat_text
					if !monocle.visible:
						current_text = doppel_appearance_no_monocle_text
					elif mouth.visible:
						current_text = doppel_appearance_text
				Global.is_appearance_wrong_answer = true
			3:
				if Global.is_entry_request_wrong_answer:
					_repeat_answer()
				else :
					if dont_show_entry_request:
						current_text += doppel_dont_show_entry_text
						if doppel_number in [0, 1, 2, 3, 4, 5, 6, 7, 10, 11]:
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
		eyes_sprite.visible = false
		doppel_eyes.visible = true
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
		doppel_random = randi_range(7, 11)
		doppel_number = doppel_random
		match doppel_random:
			7:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¡Olvidé el bigote!", "Sabía que algo olvidaba.", "Me atrapaste."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["I forgot the mustache!", "I knew I was forgetting something.", "You caught me."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我忘了胡子！", "我知道我忘了什么东西。", "你抓住我了。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
				hat.visible = true
				moustache.visible = false
				mouth.visible = true
				id_photo = id_photo_doppel_05
				entry_photo = id_photo_doppel_05
			8:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Identificación?", "¿Qué es eso?", "Eso no lo estudié."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mis ojos?", "Son ojos de humano por supuesto.", "Igual que todos los humanos."]
					doppel_dont_show_entry_text = ["¿Mi solicitud de ingreso?", "La perdí."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["ID?", "What is that?", "I didn't study that."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My eyes?", "They are human eyes of course.", "Just like all humans."]
					doppel_dont_show_entry_text = ["My entry request?", "I lost it."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["身份证？", "那是什么？", "我没有学过那个。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的眼睛？", "它们当然是人类的眼睛。", "就像所有人类一样。"]
					doppel_dont_show_entry_text = ["我的入场申请？", "我想我把它弄丢了。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
				hat.visible = true
				eyes_sprite.visible = false
				draw_eyes.visible = true
				id_photo = id_photo_doppel_03
				entry_photo = entry_photo_doppel_03
			9:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["¿Mi identificación?", "La perdí."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi apariencia?", "¿Sangre?", "Ah es salsa de tomate.", "Sí, es eso."]
					doppel_dont_show_entry_text = ["My entry request?", "I already gave it to you.", "You must have lost it."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["My ID?", "I lost it."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My appearance?", "Blood?", "Oh it's ketchup.", "Yes, that's it."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["我的身份证？", "我弄丢了。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的外貌？", "血液？", "哦，那是番茄酱。", "是的，就是那样。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
				hat.visible = true
				blood_body.visible = true
				blood_hat.visible = true
				blood_head.visible = true
			10:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
				hat.visible = true
				veins.visible = true
				doppel_veins.play("Veins")
			11:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = ["¿Mi cabeza?", "Es que dormí mal anoche."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = ["My head?", "I just slept badly last night."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = ["我的头？", "我昨晚睡得不好。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
				hat.visible = true
				head.visible = false
				wear_head.visible = true
	else :
		doppel_random = randi_range(0, 6)
		doppel_number = doppel_random
		match doppel_random:
			0:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_appearance_no_hat_text = ["Sobre mi apariencia, ¿es por mi sombrero?", "Lo olvidé en casa.", "Debes confiar en mi."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_appearance_no_hat_text = ["About my appearance, Is it because of my hat?", "I forgot it at home.", "You have to trust me."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_appearance_no_hat_text = ["关于我的外表，是因为我的帽子吗？", "我把它忘在家里了。", "你必须相信我。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
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
									entry_request_reason = ENTRY_REASON_DOPPEL_01_SPANISH
								elif Global.language == ENGLISH_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_ENGLISH
								elif Global.language == CHINESE_VALUE:
									entry_request_reason = ENTRY_REASON_DOPPEL_01_CHINESE
			1:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
				hat.visible = true
				eyebrows.visible = false
				doppel_eyebrows.visible = true
				id_photo = id_photo_doppel_01
				entry_photo = entry_photo_doppel_01
				var random = randi_range(0, 2)
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
					_:
						if Global.language == SPANISH_VALUE:
							entry_request_reason = ENTRY_REASON_DOPPEL_01_SPANISH
						elif Global.language == ENGLISH_VALUE:
							entry_request_reason = ENTRY_REASON_DOPPEL_01_ENGLISH
						elif Global.language == CHINESE_VALUE:
							entry_request_reason = ENTRY_REASON_DOPPEL_01_CHINESE
			2:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
				hat.visible = true
				mole.visible = true
				id_photo = id_photo_doppel_02
				entry_photo = entry_photo_doppel_02
			3:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_appearance_no_monocle_text = ["¿Alf tiene un monóculo?", "Bueno eso no lo tuve en cuenta.", "Casi lo consigo.", "Casi pude saborear tu carne."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_appearance_no_monocle_text = ["Does Alf have a monocle?", "Well I didn't take that into account.", "I almost got it.", "I could almost taste your flesh."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_appearance_no_monocle_text = ["艾尔夫有单片眼镜吗？", "嗯，我没有考虑到这一点。", "我差点就搞定了。", "我差点就能尝到你的肉了。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
				monocle.visible = false
				hat.visible = true
			4:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_appearance_no_hat_text = ["Sobre mi apariencia, ¿es por mi sombrero?", "Lo olvidé en casa.", "Debes confiar en mi."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_appearance_no_hat_text = ["About my appearance, Is it because of my hat?", "I forgot it at home.", "You have to trust me."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = question_answers_english["today_list_ok"]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_appearance_no_hat_text = ["关于我的外表，是因为我的帽子吗？", "我把它忘在家里了。", "你必须相信我。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
				nose_sprite.visible = false
				doppel_nose.visible = true
				id_photo = id_photo_doppel_04
				entry_photo = entry_photo_doppel_04
			5:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_appearance_no_hat_text = ["Sobre mi apariencia, ¿es por mi sombrero?", "Lo olvidé en casa.", "Debes confiar en mi."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_appearance_no_hat_text = ["About my appearance, Is it because of my hat?", "I forgot it at home.", "You have to trust me."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_appearance_no_hat_text = ["关于我的外表，是因为我的帽子吗？", "我把它忘在家里了。", "你必须相信我。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
				get_parent().get_parent().hide_ddd_logo_entry(false)
			6:
				if Global.language == SPANISH_VALUE:
					doppel_dont_show_id_text = ["Lo siento, sí, olvidé mostrar mi identificación."]
					doppel_id_text = question_answers_spanish["id_ok"]
					doppel_appearance_text = question_answers_spanish["appearance_ok"]
					doppel_appearance_no_hat_text = ["Sobre mi apariencia, ¿es por mi sombrero?", "Lo olvidé en casa.", "Debes confiar en mi."]
					doppel_dont_show_entry_text = ["Lo siento, sí, olvidé mostrar mi solicitud de ingreso."]
					doppel_entry_text = question_answers_spanish["entry_request_ok"]
					doppel_not_today_list_text = ["No estoy en la lista de hoy porque tuve que salir por una emergencia del trabajo."]
					doppel_today_list_text = question_answers_spanish["today_list_ok"]
					doppel_its_all_ok_text = ["¡Perfecto!", "¿Puede abrirme la puerta?"]
				elif Global.language == ENGLISH_VALUE:
					doppel_dont_show_id_text = ["I'm sorry, yes, I forgot to show my ID."]
					doppel_id_text = question_answers_english["id_ok"]
					doppel_appearance_text = question_answers_english["appearance_ok"]
					doppel_appearance_no_hat_text = ["About my appearance, Is it because of my hat?", "I forgot it at home.", "You have to trust me."]
					doppel_dont_show_entry_text = ["I'm sorry, yes, I forgot to show my entry request."]
					doppel_entry_text = question_answers_english["entry_request_ok"]
					doppel_not_today_list_text = ["I'm not on today's list because I had to leave due to an emergency at work."]
					doppel_today_list_text = question_answers_english["today_list_ok"]
					doppel_its_all_ok_text = ["Perfect!", "Can you open the door for me?"]
				elif Global.language == CHINESE_VALUE:
					doppel_dont_show_id_text = ["对不起，是的，我忘了出示我的身份证。"]
					doppel_id_text = question_answers_chinese["id_ok"]
					doppel_appearance_text = question_answers_chinese["appearance_ok"]
					doppel_appearance_no_hat_text = ["关于我的外表，是因为我的帽子吗？", "我把它忘在家里了。", "你必须相信我。"]
					doppel_dont_show_entry_text = ["对不起，是的，我忘了出示我的入场申请。"]
					doppel_entry_text = question_answers_chinese["entry_request_ok"]
					doppel_not_today_list_text = ["我今天不在名单上，因为我因工作紧急情况不得不离开。"]
					doppel_today_list_text = question_answers_chinese["today_list_ok"]
					doppel_its_all_ok_text = ["完美！", "你能帮我开门吗？"]
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
			Global.neighbors_killed_info += "*Alf Cappuccin"
			if Global.is_campaign:
				Global.neighbors_killed_level_list_3F += 10
				Global.neighbors_kill_count_aux += 1
	else :
		if !"Alf_Cappuccin" in Global.char_at_home_list:
			Global.char_at_home_list.append("Alf_Cappuccin")
			Global.char_out_home_list.erase("Alf_Cappuccin")
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Alf: "
			if Global.is_campaign:
				Global.neighbors_killed_level_list_3F += 11
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Documentos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake documents"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假文件"
				1:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cejas falsas"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong eyebrows"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眉毛"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Lunar"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Mole"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "痣"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin monóculo"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No monocle"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有单片眼镜"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin logo D.D.D."
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No D.D.D. Logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有D.D.D.标志"
				6:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin fecha en id"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No date on ID"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "身份证上没有日期"
				7:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sin bigote"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "No mustache"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "没有胡子"
				8:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos dibujados"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Painted eyes"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "画上的眼睛"
				9:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Sangre"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Blood"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "血液"
				10:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Venas"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Veins"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "静脉"
				11:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cabeza falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong head"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "假头"
				12:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Logo DDD falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake DDD logo"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "伪造的DDD标志"
				13:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nariz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong nose"
					elif Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的鼻子"
				14:
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
	hat.visible = true
	var random_doppel = randi_range(12, 14)
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
		12:
			get_parent().get_parent().change_ddd_logo(randi_range(0, 2), randi_range(0, 1))
		13:
			nose_sprite.scale = Vector2(0.89, 0.89)
			nose_sprite.position.y -= 10
		_:
			scar.visible = true
