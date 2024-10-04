extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100, 265)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(990, 265)
const CHAR_AT_DELETE_POS = Vector2(1900, 265)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10

@onready var animation = $Animation
@onready var talking = $Talk
@onready var sfx_voice_01 = $Voice_05
@onready var sfx_voice_02 = $Voice_06
@onready var sfx_voice_03 = $Voice_07
@onready var sfx_voice_04 = $Voice_08
@onready var sfx_footsteps = $Footsteps
@onready var roman_42_body = $Body / Roman42
@onready var peach_body = $Body / Robertsky
@onready var nurse_body = $Body / Nurse
@onready var roman_42_head = $Head / Roman42
@onready var peach_head = $Head / Robertsky
@onready var nurse_head = $Head / Nurse
@onready var mouth_nurse = $Head / Nurse / Mouth
@onready var mouth_peach = $Head / Robertsky / Mouth

var current_text = []
var checklist_values = []
var is_42 = false
var is_peach = false
var id_photo
var entry_photo
var speak_flag = true
var name_char = "Visitor"
var last_name_char
var number_id
var id_exp_date
var entry_request_reason
var hello_text
var id_text
var entry_text
var appearance_text
var today_list_text
var exit_text
var repeat_question
var apart_number
var dont_show_id
var dont_show_entry_request

func _ready()->void :
	randomize()
	set_sfx_volume()
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

func select_visitor()->void :
	if is_42:
		roman_42_head.visible = true
		roman_42_body.visible = true
		id_photo = load("res://Assets/Graphics/Char_Roman_Doppel_42_Small_Photo.png")
		entry_photo = load("res://Assets/Graphics/Char_Roman_Doppel_42_Long_Photo.png")
		name_char = "42"
		last_name_char = "42"
		number_id = "42"
		id_exp_date = "42"
		entry_request_reason = "1+1+1+1+1+1+1+1+1+1+1+1+\n1+1+1+1+1+1+1+1+1+1+1+1+\n1+1+1+1+1+1+1+1+1+1+1+1+\n1+1+1+1+1+1."
		hello_text = ["42 ....."]
		id_text = ["42 ....."]
		entry_text = ["42 ....."]
		appearance_text = ["42 ....."]
		today_list_text = ["42 ....."]
		exit_text = ["42 ....."]
		repeat_question = ["42 ....."]
		apart_number = "42"
	elif is_peach:
		peach_head.visible = true
		peach_body.visible = true
		id_photo = load("res://Assets/Graphics/Char_Robertsky_Doppel_peach_Small_Photo.png")
		entry_photo = load("res://Assets/Graphics/Char_Robertsky_Doppel_peach_Long_Photo.png")
		name_char = "Peach"
		last_name_char = "Peach"
		number_id = "Peeeeaaach"
		id_exp_date = "Peach"
		entry_request_reason = "Peach pe pe peach peach pe peach.\nPe pe pe peach peach peach peach.\nPeach pe pe peach peach peach pe peach."
		hello_text = ["Peach peach."]
		id_text = ["Peach pe pe peach peach pe peach."]
		entry_text = ["Peach pe pe peach peach pe peach."]
		appearance_text = ["Pe pe pe peach peach peach peach."]
		today_list_text = ["Pe pe pe peach peach peach peach."]
		exit_text = ["Pe pe pe peach peach peach peach."]
		repeat_question = ["Peach pe pe peach peach pe peach."]
		apart_number = "Peach"
	else :
		nurse_head.visible = true
		nurse_body.visible = true
		id_photo = load("res://Assets/Graphics/Char_nurse_Small_Photo.png")
		entry_photo = load("res://Assets/Graphics/Char_nurse_Long_Photo.png")
		name_char = "Xuchilbara"
		last_name_char = "Lobsel Vith"
		number_id = "XIVIILCIIVXI"
		id_exp_date = "XLCIVI"
		entry_request_reason = "Vir serpentem Sole obtulit et salutem deprecatus est.\nMulier arundinem Sole obtulit et gaudium petivit.\nCompassione motus tristitia quae terram domabat, Deus ex illis duabus personis natus est."
		hello_text = ["Salve, mortalis."]
		id_text = ["Initio, homines nihil habebant.", "Corpora eorum dolebant, et corda eorum odio plena erant."]
		entry_text = ["Certabant incessanter, sed mors numquam adveniebat.", "Desperati sunt, immobiliter in aeternum incedentes."]
		appearance_text = ["Vir serpentem Sole obtulit et salutem deprecatus est.", "Mulier arundinem Sole obtulit et gaudium petivit."]
		today_list_text = ["Compassione motus tristitia quae terram domabat, Deus ex illis duabus personis natus est."]
		exit_text = ["Sed tunc Deo defecerunt vires, et Ipsa concidit.", "Ipsa rediit ad pulverem, promittens iterum revenire."]
		repeat_question = ["Ea redibit."]
		apart_number = "DCLXVI"

func _first_words()->void :
	speak_flag = false
	get_parent().get_parent().set_id(name_char, last_name_char, number_id, id_exp_date, id_photo)
	get_parent().get_parent().set_entry_request(name_char, last_name_char, apart_number, entry_request_reason, entry_photo)
	if is_42 and Global.achievements_2["42"] == 0:
		Global.achievements_2["42"] = 1
		get_parent().get_parent()._show_unlock_achievement()
	elif is_peach and Global.achievements_2["PEACH"] == 0:
		Global.achievements_2["PEACH"] = 1
		get_parent().get_parent()._show_unlock_achievement()
	elif Global.achievements_2["NURSE"] == 0:
		Global.achievements_2["NURSE"] = 1
		get_parent().get_parent()._show_unlock_achievement()
	await get_tree().create_timer(0.5).timeout
	change_current_text(0)
	get_parent().get_parent().text_selection()

func change_current_text(n: int)->void :
	match n:
		0:
			current_text = hello_text
		1:
			if Global.is_id_wrong_answer:
				current_text = repeat_question
			else :
				current_text += id_text
			Global.is_id_wrong_answer = true
		2:
			if Global.is_appearance_wrong_answer:
				current_text = repeat_question
			else :
				current_text += appearance_text
			Global.is_appearance_wrong_answer = true
		3:
			if Global.is_entry_request_wrong_answer:
				current_text = repeat_question
			else :
				current_text += entry_text
			Global.is_entry_request_wrong_answer = true
		4:
			if Global.is_today_list_wrong_answer:
				current_text = repeat_question
			else :
				current_text += today_list_text
			Global.is_today_list_wrong_answer = true
		5:
			current_text = exit_text
		-1:
			current_text = repeat_question
		_:
			current_text = []

func set_sfx_volume()->void :
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func talk()->void :
	talking.play("TALK")
	if is_peach:
		mouth_peach.play("TALK")
	elif !is_42:
		mouth_nurse.play("TALK")

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
		if is_peach:
			mouth_peach.play("CLOSE")
		elif !is_42:
			mouth_nurse.play("CLOSE")

func _on_voice_finished()->void :
	play_random_sfx()

func _record_update()->void :
	if Global.is_3312_active:
		Global.chars_killed_level += 1
		if is_42:
			Global.neighbors_killed_info += "*42"
		elif is_peach:
			Global.neighbors_killed_info += "*Peach"
		else :
			Global.neighbors_killed_info += "*Nurse"
		Global.entity_spawn = true

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
