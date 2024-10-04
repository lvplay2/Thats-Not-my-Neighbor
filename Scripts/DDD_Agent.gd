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


var name_char = "DDD_Angent"
var current_text = [""]
var text_3312_spanish = ["Protocolo de limpieza completado.", "Puede continuar con su trabajo."]
var text_3312_english = ["Cleaning protocol completed.", "You can continue your job."]
var text_3312_chinese = ["清洁程序已完成。", "您可以继续您的工作了。"]
var text_tutorial_spanish = ["Bienvenido y felicidades por su nuevo empleo.", "Como pudo observar en el vídeo introductorio, su trabajo consiste en verificar el ingreso de los vecinos de su edificio.", "Cada día habrá una lista de individuos que solicitarán ingreso al edificio.", "Es posible que existan individuos que soliciten ingreso y no estén en la lista.", "En cuyo caso marcará en la lista de verificación que no se encuentran en la lista y procederá a interrogar al individuo.", "También debe verificar que la identificación y la solicitud de entrada sean correctos y con el respectivo logo del D.D.D.", "No olvide también revisar el vencimiento en las identificaciones (mm/aaaa).", "Recuerde que es febrero de 1955.", "Le deseo mucha suerte."]
var text_tutorial_english = ["Welcome and congratulations on your new job.", "As you could see on the introductory film, your job is to verify the entry of the neighbors of your building.", "Each day there will be a list of individuals who will request entry to the building.", "It is possible that there are individuals who request entry and aren't on the list.", "In which case you will mark on the checklist that they are not on the list and proceed to question the individual.", "Also, you must verify that the ID and the entry request are correct and have the respective D.D.D. logo.", "Don't forget to also check the expiration on the IDs (mm/yyyy).", "Remember it's February 1955.", "I wish you good luck."]
var text_tutorial_chinese = ["欢迎并祝贺您新工作就职。", "如您在介绍视频中所见，您的工作是验证您大楼的居民入住情况。", "每天都会有一个申请进入大楼的个人名单。", "有可能会有一些人申请进入但并不在名单上。", "在这种情况下，您将在检查清单上标注他们不在名单上，并继续询问该个体。", "此外，您还必须验证身份证明文件和入学申请是否正确，并附有相应的D.D.D。标识。", "不要忘记检查邻居身份证上的有效期。\n(月,年)", "请记住，现在是1955年2月。", "祝你好运。"]
var is_nightmare = false
var text_tutorial_nigthmare_spanish = ["Ya sabe que hacer."]
var text_tutorial_nigthmare_english = ["You know the drill."]
var text_tutorial_nigthmare_chinese = ["你知道该怎么做了。"]
var text_endless = []
var text_campaign_spanish_01 = ["Bienvenido y felicidades por su nuevo empleo.", "Su trabajo consiste en verificar el ingreso de los vecinos de su edificio.", "No olvide revisar el vencimiento en las identificaciones (mm/aaaa).", "Recuerde que es febrero de 1955.", "Aquí está la lista de hoy. Le deseo mucha suerte."]
var text_campaign_english_01 = ["Welcome and congratulations on your new job.", "Your job is to verify the entry of the residents of your building.", "Don't forget to check the expiration date on the IDs (mm/yyyy).", "Remember that it is February 1955.", "Here is today's list. I wish you the best of luck."]
var text_campaign_chinese_01 = ["欢迎并祝贺您获得新工作。", "您的工作是核实您所在大楼的居民出入。", "别忘了检查身份证上的到期日期（mm/yyyy）。", "请记住，现在是1955年2月。", "这是今天的名单。祝您好运。"]
var text_campaign_spanish_02 = ["Buenas tardes.", "Empezamos el segundo día laboral.", "Aunque parezca ser un trabajo sencillo no baje la guardia.", "Le hago entrega de la lista de hoy. Buena suerte."]
var text_campaign_english_02 = ["Good afternoon.", "We begin the second workday.", "Although it may seem like an easy job, don't let your guard down.", "I am handing you today's list. Good luck."]
var text_campaign_chinese_02 = ["下午好。", "我们开始第二个工作日。", "尽管这看起来像一份简单的工作，也不要掉以轻心。", "我把今天的名单交给您。祝您好运。"]
var text_campaign_spanish_03 = ["Se acerca la mitad de la semana.", "¿Cómo ha ido todo? \nEspero que bien.", "Bueno, hora de trabajar, aquí está la lista de hoy. Hasta mañana."]
var text_campaign_english_03 = ["The middle of the week is approaching.", "How has everything been? \nI hope well.", "Well, time to work, here is today's list. See you tomorrow."]
var text_campaign_chinese_03 = ["一周过了一半了。", "一切怎么样？ \n希望一切顺利。", "好了，开始工作吧，这是今天的名单。明天见。"]
var text_campaign_spanish_04 = ["Otro día más.", "Se le ve agotado.", "Si tiene problemas para dormir recuerde que puede hacer uso de los servicios de piscología.", "Aquí está la lista de hoy. Hasta mañana."]
var text_campaign_english_04 = ["Another day.", "You look exhausted.", "If you're having trouble sleeping, remember you can use the psychology services.", "Here is today's list. See you tomorrow."]
var text_campaign_chinese_04 = ["又是新的一天。", "您看起来很疲惫。", "如果您有睡眠问题，记得可以使用心理服务。", "这是今天的名单。明天见。"]
var text_campaign_spanish_05 = ["Ya mañana es fin de semana.", "Aunque igual hay que trabajar.", "Esos monstruos no descansan y el D.D.D. tampoco.", "Está es la lista de hoy. Buena suerte."]
var text_campaign_english_05 = ["Tomorrow is the weekend.", "But we still have to work.", "Those monsters don't rest, and neither does the D.D.D.", "Here is today's list. Good luck."]
var text_campaign_chinese_05 = ["明天就是周末了。", "不过我们仍然得工作。", "那些怪物不休息，D.D.D.也不休息。", "这是今天的名单。祝您好运。"]
var text_campaign_spanish_06 = ["Hola, mucho gusto. \nSoy el oficial del turno de los fines de semana.", "Ya conoce el protocolo.", "Le hago entrega de la lista de hoy. Le deseo buena suerte."]
var text_campaign_english_06 = ["Hello, nice to meet you. \nI am the weekend shift officer.", "You already know the protocol.", "I am handing you today's list. I wish you good luck."]
var text_campaign_chinese_06 = ["你好，很高兴见到你。 \n我是周末班的值班官。", "您已经了解了流程。", "我把今天的名单交给您。祝您好运。"]
var text_campaign_spanish_07 = ["Buenas tardes.", "Último día de la semana.", "Aquí está la lista de hoy. Buena suerte."]
var text_campaign_english_07 = ["Good afternoon.", "Last day of the week.", "Here is today's list. Good luck."]
var text_campaign_chinese_07 = ["下午好。", "这一周的最后一天。", "这是今天的名单。祝您好运。"]

func _ready()->void :
	animation.play("IDLE")
	set_sfx_volume()
	if Global.language == SPANISH_VALUE:
		text_endless = "Día número: " + str(Global.current_day_count) + "\nMeta a superar: " + str(Global.record_day_count)
	elif Global.language == ENGLISH_VALUE:
		text_endless = "Day number: " + str(Global.current_day_count) + "\nGoal to overcome: " + str(Global.record_day_count)
	elif Global.language == CHINESE_VALUE:
		text_endless = "第" + str(Global.current_day_count) + "天" + "\n克服的目标：" + str(Global.record_day_count)

func set_sfx_volume()->void :
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func talk()->void :
	talking.play("TALK")

func change_current_text(n: int)->void :
	match n:
		0:
			if Global.language == SPANISH_VALUE:
				current_text = text_3312_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = text_3312_english
			elif Global.language == CHINESE_VALUE:
				current_text = text_3312_chinese
		1:
			if is_nightmare:
				if Global.language == SPANISH_VALUE:
					current_text = text_tutorial_nigthmare_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = text_tutorial_nigthmare_english
				elif Global.language == CHINESE_VALUE:
					current_text = text_tutorial_nigthmare_chinese
			elif Global.is_endless:
				current_text = text_endless
			elif Global.is_campaign:
				match Global.current_campaign_day:
					0:
						if Global.language == SPANISH_VALUE:
							current_text = text_campaign_spanish_01
						elif Global.language == ENGLISH_VALUE:
							current_text = text_campaign_english_01
						elif Global.language == CHINESE_VALUE:
							current_text = text_campaign_chinese_01
					1:
						if Global.language == SPANISH_VALUE:
							current_text = text_campaign_spanish_02
						elif Global.language == ENGLISH_VALUE:
							current_text = text_campaign_english_02
						elif Global.language == CHINESE_VALUE:
							current_text = text_campaign_chinese_02
					2:
						if Global.language == SPANISH_VALUE:
							current_text = text_campaign_spanish_03
						elif Global.language == ENGLISH_VALUE:
							current_text = text_campaign_english_03
						elif Global.language == CHINESE_VALUE:
							current_text = text_campaign_chinese_03
					3:
						if Global.language == SPANISH_VALUE:
							current_text = text_campaign_spanish_04
						elif Global.language == ENGLISH_VALUE:
							current_text = text_campaign_english_04
						elif Global.language == CHINESE_VALUE:
							current_text = text_campaign_chinese_04
					4:
						if Global.language == SPANISH_VALUE:
							current_text = text_campaign_spanish_05
						elif Global.language == ENGLISH_VALUE:
							current_text = text_campaign_english_05
						elif Global.language == CHINESE_VALUE:
							current_text = text_campaign_chinese_05
					5:
						if Global.language == SPANISH_VALUE:
							current_text = text_campaign_spanish_06
						elif Global.language == ENGLISH_VALUE:
							current_text = text_campaign_english_06
						elif Global.language == CHINESE_VALUE:
							current_text = text_campaign_chinese_06
					6:
						if Global.language == SPANISH_VALUE:
							current_text = text_campaign_spanish_07
						elif Global.language == ENGLISH_VALUE:
							current_text = text_campaign_english_07
						elif Global.language == CHINESE_VALUE:
							current_text = text_campaign_chinese_07
					_:
						if Global.language == SPANISH_VALUE:
							current_text = text_tutorial_nigthmare_spanish
						elif Global.language == ENGLISH_VALUE:
							current_text = text_tutorial_nigthmare_english
						elif Global.language == CHINESE_VALUE:
							current_text = text_tutorial_nigthmare_chinese
			else :
				if Global.language == SPANISH_VALUE:
					current_text = text_tutorial_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = text_tutorial_english
				elif Global.language == CHINESE_VALUE:
					current_text = text_tutorial_chinese

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

func _on_voice_01_finished()->void :
	play_random_sfx()

func _on_voice_02_finished()->void :
	play_random_sfx()

func _on_voice_03_finished()->void :
	play_random_sfx()

func _on_voice_04_finished()->void :
	play_random_sfx()

func delete()->void :
	var tween = create_tween()
	tween.tween_property(self, "position", CHAR_AT_SPAWN_POS, TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(4)
	if Global.is_nightmare:
		get_parent().get_parent().entity()
	await get_tree().create_timer(1.5).timeout
	get_parent().get_parent().start_time_between_char()
	call_deferred("queue_free")
