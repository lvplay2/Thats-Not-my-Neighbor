extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100,270)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(990,270)
const CHAR_AT_DELETE_POS = Vector2(1900,270)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10

@onready var animation = $Animation
@onready var talking = $Talk
@onready var sfx_footsteps = $Footsteps
@onready var sfx_voice_01 = $Voice_05
@onready var sfx_voice_02 = $Voice_06
@onready var sfx_voice_03 = $Voice_07
@onready var sfx_voice_04 = $Voice_08
@onready var mouth_doppel = $Head/Mouth_doppel
@onready var mouth = $Head/Mouth
@onready var scar = $Head/Scar
@onready var scar_2 = $Head/Scar2
@onready var eyes = $Head/Eyes
@onready var eyes_2 = $Head/Eyes2

var current_text = []
var is_doppelganger = false
var checklist_values = []
var id_photo
var entry_photo
var speak_flag = true
var name_char = "God"
var last_name_char
var number_id
var id_exp_date
var entry_request_reason
var hello_text
var id_text
var id_not_show_text
var entry_text
var entry_not_show_text
var appearance_text
var today_list_text
var not_today_list_text
var exit_text
var repeat_question
var apart_number
var dont_show_id = false
var dont_show_entry_request = false
var doppel_number
var name_alter = "Angus_Ciprianni"

func _ready() -> void:
	randomize()
	set_sfx_volume()
	abducius()
	if randi_range(0,5) == 0:
		dont_show_id = true
	if randi_range(0,5) == 0:
		dont_show_entry_request = true
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

func abducius() -> void:
	id_photo = load("res://Assets/Graphics/Char_Abducius_Small_Photo.png")
	entry_photo = load("res://Assets/Graphics/Char_Abducius_Long_Photo.png")
	name_char = "Abducius"
	last_name_char = "Morail"
	number_id = "763764748675"
	id_exp_date = "12/1968"
	if Global.language == SPANISH_VALUE:
		apart_number = "P01-03"
		if randi_range(0,1) == 0:
			entry_request_reason = "Soy residente de este círculo astral, salí a mutilar."
		else:
			entry_request_reason = "Soy residente de este círculo astral, mi apartamento es el 03 del primer piso."
		hello_text = ["Saludos, humano."]
		id_text = ["Podría mutilar tus ojos en este momento, parece que no te funcionan bien o es que no ves que mi identificación está perfecta."]
		id_not_show_text = ["Aquí está mi identificación."]  
		entry_text = ["Mi solicitud está perfecta."]
		entry_not_show_text = ["Aquí está mi solicitud de entrada."]
		appearance_text = ["¿Mi apariencia? Todo está perfecto con mi apariencia."]
		today_list_text = ["No me hagas perder el tiempo, humano, por supuesto que estoy en la lista."]
		if randi_range(0,1) == 0:
			not_today_list_text = ["No estoy en la lista porque tuve que hacer una mutilación de emergencia."]
		else:
			not_today_list_text = ["Debe haber un error porque sí debería estar en la lista, creo que alguien será mutilado por esto."]
		exit_text = ["Ya era hora."]
		repeat_question = ["Ya respondí tu pregunta, humano."]
	elif Global.language == ENGLISH_VALUE:
		apart_number = "F01-03"
		if randi_range(0,1) == 0:
			entry_request_reason = "I am a resident of this astral circle, I went out to mutilate."
		else:
			entry_request_reason = "I am a resident of this astral circle, my apartment is number 03 on the first floor."
		hello_text = ["Greetings, human."]
		id_text = ["I could mutilate your eyes right now, it seems like they're not working well or you can't see that my ID is correct."]
		id_not_show_text = ["Here is my ID."]  
		entry_text = ["My entry request is perfect."]
		entry_not_show_text = ["Here is my entry request."]
		appearance_text = ["My appearance? Everything is perfect with my appearance."]
		today_list_text = ["Don't waste my time, human. Of course I'm on the list."]
		if randi_range(0,1) == 0:
			not_today_list_text = ["I'm not on the list because I had to do an emergency mutilation."]
		else:
			not_today_list_text = ["There must be a mistake because I should indeed be on the list. I believe someone will be mutilate for this."]
		exit_text = ["Finally."]
		repeat_question = ["I've already answered your question, human."]
	else:
		apart_number = "F01-03"
		if randi_range(0,1) == 0:
			entry_request_reason = "我是这个星体圈的居民，我出去残害了。"
		else:
			entry_request_reason = "我是这个星体圈的居民，我的公寓位于一楼的03号。"
		hello_text = ["问候，人类。"]
		id_text = ["我现在可以拔掉你的眼睛，看起来它们工作得不太好，或者你看不到我的身份证是正确的。"]
		id_not_show_text = ["这是我的身份证。"]  
		entry_text = ["我的请求是完美的。"]
		entry_not_show_text = ["这是我的入境申请。"]
		appearance_text = ["我的外貌？我的外貌一切都很完美。"]
		today_list_text = ["不要浪费我的时间，凡人。你知道我在名单上。"]
		if randi_range(0,1) == 0:
			not_today_list_text = ["它不在名单上，因为我不得不在紧急情况下致残某人。"]
		else:
			not_today_list_text = ["肯定是有错误的，因为我确实应该在名单上。我相信某人会以鲜血偿还这个错误。"]
		exit_text = ["最后。"]
		repeat_question = ["我已经回答了你的问题，人类。"]

func make_doppelganger() -> void:
	is_doppelganger = true
	doppel_number = randi_range(0,6)
	var random
	match doppel_number:
		0: #Name/Lastname
			random = randi_range(0,3)
			match random:
				0:
					name_char = "Adbucius"
				1:
					last_name_char = "Morait"
				2:
					name_char = "Abduicius"
				_:
					last_name_char = "Monail"
		1: #ID
			random = randi_range(0,3)
			match random:
				0:
					number_id = "763746748675"
				1:
					number_id = "763767448675"
				2:
					number_id = "763764784675"
				_:
					number_id = "763674748675"
		2: # Date
			id_exp_date = "14/1968"
		3: #Scar
			scar.visible = false
			scar_2.visible = true
			id_photo = load("res://Assets/Graphics/Char_Abducius_Small_Photo_doppel_01.png")
			entry_photo = load("res://Assets/Graphics/Char_Abducius_Long_Photo_doppel_01.png")
		4: # Mouth
			mouth.visible = false
			mouth_doppel.visible = true
			id_photo = load("res://Assets/Graphics/Char_Abducius_Small_Photo_doppel_03.png")
			entry_photo = load("res://Assets/Graphics/Char_Abducius_Long_Photo_doppel_03.png")
		5: # Eyes
			eyes.visible = false
			eyes_2.visible = true
			id_photo = load("res://Assets/Graphics/Char_Abducius_Small_Photo_doppel_02.png")
			entry_photo = load("res://Assets/Graphics/Char_Abducius_Long_Photo_doppel_02.png")
		_: # DDD logo
			get_parent().get_parent().change_ddd_logo(randi_range(0,2),randi_range(0,1))

func _first_words() -> void:
	speak_flag = false
	if !dont_show_id:
		get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
	if !dont_show_entry_request:
		get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number,entry_request_reason,entry_photo)
	await get_tree().create_timer(0.5).timeout
	change_current_text(0)
	get_parent().get_parent().text_selection()

func change_current_text(n:int) -> void:
	match n:
		0:
			current_text = hello_text
		1:
			if Global.is_id_wrong_answer:
				current_text = repeat_question
			else:
				if dont_show_id:
					dont_show_id = false
					current_text += id_not_show_text
					get_parent().get_parent().set_id(name_char,last_name_char,number_id,id_exp_date,id_photo)
				else:
					current_text += id_text
			Global.is_id_wrong_answer = true
		2:
			if Global.is_appearance_wrong_answer:
				current_text = repeat_question
			else:
				current_text += appearance_text
			Global.is_appearance_wrong_answer = true
		3:
			if Global.is_entry_request_wrong_answer:
				current_text = repeat_question
			else:
				if dont_show_entry_request:
					dont_show_entry_request = false
					current_text += entry_not_show_text
					get_parent().get_parent().set_entry_request(name_char,last_name_char,apart_number,entry_request_reason,entry_photo)
				else:
					current_text += entry_text
			Global.is_entry_request_wrong_answer = true
		4:
			if Global.is_today_list_wrong_answer:
				current_text = repeat_question
			else:
				current_text += today_list_text
			Global.is_today_list_wrong_answer = true
		5:
			current_text = exit_text
		-1:
			current_text = repeat_question
		_:
			current_text = []

func set_sfx_volume() -> void:
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func talk() -> void:
	talking.play("TALK")
	if doppel_number == 4:
		mouth_doppel.play("TALK")
	else:
		mouth.play("TALK")

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
		if doppel_number == 4:
			mouth_doppel.play("CLOSE")
		else:
			mouth.play("CLOSE")

func _on_voice_finished() -> void:
	play_random_sfx()

func _record_update() -> void:
	get_parent().get_parent().restart_ddd_logo()
	if Global.is_3312_active:
		if is_doppelganger:
			Global.doppel_captured_level += 1
		else:
			Global.chars_killed_level += 1
			Global.neighbors_killed_info += "*Abducius"
			get_parent().get_parent().set_entity(true)
	else:
		if is_doppelganger:
			Global.doppel_entered_level += 1
			Global.doppels_info += "*Abducius: "
			match doppel_number:
				0:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Nombre falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong name"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的名字"
				1:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Número de id falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong ID number"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的身份证号码"
				2:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Fecha de expiración"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Expiration date"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "过期日期"
				3:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Cicatriz falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong scar"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的疤痕"
				4:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Boca falsa"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong mouth"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的嘴巴"
				5:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Ojos falsos"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Wrong eyes"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "错误的眼睛"
				_:
					if Global.language == SPANISH_VALUE:
						Global.doppels_info += "Logo DDD falso"
					elif Global.language == ENGLISH_VALUE:
						Global.doppels_info += "Fake DDD logo"
					elif  Global.language == CHINESE_VALUE:
						Global.doppels_info += "伪造的DDD标志"
			get_parent().get_parent().set_game_over(true)
		else:
			if !"Angus_Ciprianni" in Global.char_at_home_list:
				Global.char_at_home_list.append("Angus_Ciprianni")
				Global.char_out_home_list.erase("Angus_Ciprianni")

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
