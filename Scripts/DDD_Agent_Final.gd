extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100, 280)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(988, 280)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10

@onready var animation = $Animation
@onready var talking = $Talk
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps

var current_text = []

func _ready()->void :
	animation.play("IDLE")
	set_sfx_volume()

func set_sfx_volume()->void :
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func talk()->void :
	talking.play("TALK")

func change_current_text(_n: int)->void :
	if Global.language == SPANISH_VALUE:
		current_text = ["Debido al desempeño de la última semana el D.D.D. le comunica que se le ha destituído de su puesto.", "Además con el derecho que se me ha otorgado por el gobierno de nuestro país queda arrestado por el asesinato indirecto de sus vecinos."]
	elif Global.language == ENGLISH_VALUE:
		current_text = ["Due to the performance of the past week, the D.D.D. informs you that you have been removed from your position.", "Moreover, with the right granted to me by the government of our country, you are under arrest for the indirect murder of your neighbors."]
	elif Global.language == CHINESE_VALUE:
		current_text = ["由于上周的表现，D.D.D. 通知您已被免职。", "此外，凭借我国政府授予我的权利，您因间接谋杀邻居而被逮捕。"]

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

func _on_voice_finished()->void :
	play_random_sfx()

func start_walk()->void :
	_play_sfx(4)
	animation.play("WALK")
	var tween = create_tween()
	if position.x == 150:
		tween.tween_property(self, "position", Vector2(600, 450), TIME_ON_TWEEN)
	else :
		tween.tween_property(self, "position", Vector2(1200, 450), TIME_ON_TWEEN)
	tween.tween_callback(start_idle)

func start_idle()->void :
	animation.play("IDLE")
