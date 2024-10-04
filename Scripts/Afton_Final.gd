extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10

@onready var animation: AnimationPlayer = $Animation
@onready var talk_animation: AnimationPlayer = $Talk
@onready var voice_01: AudioStreamPlayer = $Voice_01
@onready var voice_02: AudioStreamPlayer = $Voice_02
@onready var voice_03: AudioStreamPlayer = $Voice_03
@onready var voice_04: AudioStreamPlayer = $Voice_04
@onready var talking: AnimatedSprite2D = $Head / Mouth

var current_text = []

func _ready()->void :
	animation.play("IDLE")
	set_sfx_volume()

func set_sfx_volume()->void :
	voice_01.volume_db = Global.sound_level
	voice_02.volume_db = Global.sound_level
	voice_03.volume_db = Global.sound_level
	voice_04.volume_db = Global.sound_level

func talk()->void :
	talking.play("Talking")

func change_current_text(_n: int)->void :
	if Global.language == SPANISH_VALUE:
		current_text = ["Mira lo que ha tenido que pasar.", "Solo debía hacer su trabajo. \nPero no, tuvo que meter la nariz donde no debía.", "¿Creyó que podía cambiar algo?", "Usted no es nadie. Solo es un simple portero de su edificio.", "Correción, \nera \nel portero de su edificio.", "Ya saben que hacer muchachos."]
	elif Global.language == ENGLISH_VALUE:
		current_text = ["Look at what had to happen.", "You just had to do your job. \nBut no, you had to stick your nose where it didn't belong.", "Did you think you could change something?", "You're nobody. You're just a simple doorman of your building.", "Correction, \nyou were \nthe doorman of your building.", "You know what to do, boys."]
	elif Global.language == CHINESE_VALUE:
		current_text = ["看看发生了什么。", "你只需要做好你的工作。 \n但不，你非得把鼻子插到不该插的地方。", "你以为自己能改变什么吗？", "你什么都不是。你只是你那栋楼的一个普通门卫。", "更正，\n你曾是\n你那栋楼的门卫。", "你们知道该怎么做，伙计们。"]

func get_text():
	return current_text.duplicate()

func _play_sfx(n: int)->void :
	match n:
		0:
			voice_01.play()
		1:
			voice_02.play()
		2:
			voice_03.play()
		3:
			voice_04.play()

func play_random_sfx()->void :
	var check = get_parent().get_parent().text_label.visible_ratio
	if check != VISIBLE_RATIO:
		_play_sfx(randi_range(0, 3))
		talk()
		talk_animation.play("TALK")
	else :
		talking.play("Close")
		talk_animation.stop()

func _on_voice_finished()->void :
	play_random_sfx()
