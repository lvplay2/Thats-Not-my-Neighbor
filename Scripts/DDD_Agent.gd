extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100,280)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(988,280)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10

@onready var animation = $Animation
@onready var talking = $Talk
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps

var name_char = "DDD_Angent"
var current_text = [""]
var text_3312_spanish = ["Protocolo de limpieza completado.", "Puede continuar con su trabajo."]
var text_3312_english = ["Cleaning protocol completed.", "You can continue your job."]
var text_3312_chinese = ["清洁程序已完成。","您可以继续您的工作了。"]
var text_tutorial_spanish = ["Bienvenido y felicidades por su nuevo empleo.", "Como pudo observar en el vídeo introductorio, su trabajo consiste en verificar el ingreso de los vecinos de su edificio.", "Cada día habrá una lista de individuos que solicitarán ingreso al edificio.", "Es posible que existan individuos que soliciten ingreso y no estén en la lista.", "En cuyo caso marcará en la lista de verificación que no se encuentran en la lista y procederá a interrogar al individuo.", "También debe verificar que la identificación y la solicitud de entrada sean correctos y con el respectivo logo del D.D.D.", "No olvide también revisar el vencimiento en las identificaciones (mm/aaaa).","Recuerde que es febrero de 1955.","Le deseo mucha suerte."]
var text_tutorial_english = ["Welcome and congratulations on your new job.", "As you could see on the introductory film, your job is to verify the entry of the neighbors of your building.", "Each day there will be a list of individuals who will request entry to the building.", "It is possible that there are individuals who request entry and aren't on the list.", "In which case you will mark on the checklist that they are not on the list and proceed to question the individual.", "Also, you must verify that the ID and the entry request are correct and have the respective D.D.D. logo.", "Don't forget to also check the expiration on the IDs (mm/yyyy).","Remember it's February 1955.","I wish you good luck."]
var text_tutorial_chinese = ["欢迎并祝贺您新工作就职。","如您在介绍视频中所见，您的工作是验证您大楼的居民入住情况。","每天都会有一个申请进入大楼的个人名单。","有可能会有一些人申请进入但并不在名单上。","在这种情况下，您将在检查清单上标注他们不在名单上，并继续询问该个体。","此外，您还必须验证身份证明文件和入学申请是否正确，并附有相应的D.D.D。标识。","不要忘记检查邻居身份证上的有效期。\n(月,年)","请记住，现在是1955年2月。","祝你好运。"]
var is_nightmare = false
var text_tutorial_nigthmare_spanish = ["Ya sabe que hacer."]
var text_tutorial_nigthmare_english = ["You know the drill."]
var text_tutorial_nigthmare_chinese = ["你知道该怎么做了。"]

func _ready() -> void:
	animation.play("IDLE")
	set_sfx_volume()

func set_sfx_volume() -> void:
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func talk() -> void:
	talking.play("TALK")

func change_current_text(n:int) -> void:
	match n:
		0:
			if Global.language == SPANISH_VALUE:
				current_text = text_3312_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = text_3312_english
			elif Global.language == CHINESE_VALUE:
				current_text = text_3312_chinese
		1:
			if !is_nightmare:
				if Global.language == SPANISH_VALUE:
					current_text = text_tutorial_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = text_tutorial_english
				elif Global.language == CHINESE_VALUE:
					current_text = text_tutorial_chinese
			else:
				if Global.language == SPANISH_VALUE:
					current_text = text_tutorial_nigthmare_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = text_tutorial_nigthmare_english
				elif Global.language == CHINESE_VALUE:
					current_text = text_tutorial_nigthmare_chinese

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

func _on_voice_01_finished() -> void:
	play_random_sfx()

func _on_voice_02_finished() -> void:
	play_random_sfx()

func _on_voice_03_finished() -> void:
	play_random_sfx()

func _on_voice_04_finished() -> void:
	play_random_sfx()

func delete() -> void:
	var tween = create_tween()
	tween.tween_property(self,"position",CHAR_AT_SPAWN_POS,TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(4)
	if Global.is_nightmare:
		get_parent().get_parent().entity()
	await get_tree().create_timer(1.5).timeout
	get_parent().get_parent().start_time_between_char()
	call_deferred("queue_free")
