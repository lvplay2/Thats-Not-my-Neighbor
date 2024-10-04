extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100, 260)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(990, 260)
const CHAR_AT_DELETE_POS = Vector2(1900, 260)
const TIME_ON_TWEEN = 1.5
const TEXT_SPANISH = ["Tres veces. Tres veces. Tres veces."]
const TEXT_ENGLISH = ["Three times. Three times. Three times."]
const TEXT_CHINESE = ["三次。三次。三次。"]

@onready var idle = $IDLE
@onready var talking = $TALK
@onready var sfx_voice_05 = $Voice_05
@onready var sfx_voice_06 = $Voice_06
@onready var sfx_voice_07 = $Voice_07
@onready var sfx_voice_08 = $Voice_08
@onready var footsteps = $Footsteps

var current_text = [""]
var speak_flag = true
var name_char = "Ghost"

func _ready():
	idle.play("IDLE")
	randomize()
	set_sfx_volume()
	var tween = create_tween()
	tween.tween_property(self, "position", CHAR_AT_CENTER_WINDOW_POS, TIME_ON_TWEEN)
	_play_sfx(4)

func _process(_delta)->void :
	if self.position == CHAR_AT_CENTER_WINDOW_POS:
		if !Global.is_door_locked:
			delete()
		elif speak_flag:
			_first_words()

func set_sfx_volume()->void :
	sfx_voice_05.volume_db = Global.sound_level
	sfx_voice_06.volume_db = Global.sound_level
	sfx_voice_07.volume_db = Global.sound_level
	sfx_voice_08.volume_db = Global.sound_level
	footsteps.volume_db = Global.sound_level

func _first_words()->void :
	speak_flag = false
	await get_tree().create_timer(0.5).timeout
	change_current_text(0)
	get_parent().get_parent().text_selection()
	get_parent().get_parent().ghost_appear()

func _on_voice_finished():
	play_random_sfx()

func change_current_text(_n: int)->void :
	if Global.language == SPANISH_VALUE:
		current_text = TEXT_SPANISH
	elif Global.language == ENGLISH_VALUE:
		current_text = TEXT_ENGLISH
	else :
		current_text = TEXT_CHINESE

func talk()->void :
	talking.play("TALK")

func get_text():
	return current_text.duplicate()

func _play_sfx(n: int)->void :
	match n:
		0:
			sfx_voice_05.play()
			sfx_voice_06.play()
			sfx_voice_08.play()
		1:
			sfx_voice_05.play()
			sfx_voice_06.play()
		2:
			sfx_voice_05.play()
			sfx_voice_07.play()
			sfx_voice_06.play()
		3:
			sfx_voice_05.play()
			sfx_voice_08.play()
			sfx_voice_07.play()
		4:
			footsteps.play()

func play_random_sfx()->void :
	var check = get_parent().get_parent().text_label.visible_ratio
	if check != VISIBLE_RATIO:
		_play_sfx(randi_range(0, 3))
		talk()
	else :
		talking.stop()

func delete()->void :
	var tween = create_tween()
	tween.tween_property(self, "position", CHAR_AT_DELETE_POS, TIME_ON_TWEEN)
	_play_sfx(4)
	get_parent().get_parent().on_neighbor_gone()
	await get_tree().create_timer(3).timeout
	get_parent().get_parent().start_time_between_char()
	delete_free()

func delete_free()->void :
	if !Global.is_3312_active:
		Global.ghost_count += 1
	call_deferred("queue_free")
