extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100,240)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(988,240)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10
const LAST_TEXT = 8
const ANSWER_01_ENG = ["42","FORTYTWO","FORTY-TWO"]
const ANSWER_01_ESP = ["42","CUARENTAYDOS"]
const ANSWER_01_CHI = ["42","FORTYTWO","FORTY-TWO","四十二"]
const ANSWER_02_ENG = ["PSYCHROLUTESMARCIDUS"]
const ANSWER_02_ESP = ["PSYCHROLUTESMARCIDUS"]
const ANSWER_02_CHI = ["PSYCHROLUTESMARCIDUS","深海鱼","海底鱼","BLOBFISH","球蛋白鱼","泡沫鱼"]
const ANSWER_03_ENG = ["CHESSBOXING"]
const ANSWER_03_ESP = ["CHESSBOXING","BOXEODEAJEDREZ","BOXEOAJEDREZ","AJEDREZBOXEO","AJEDREZDEBOXEO"]
const ANSWER_03_CHI = ["CHESSBOXING","国际象棋拳击"]
const ANSWER_04_ENG = ["38","THIRTYEIGHT","THIRTY-EIGHT"] 
const ANSWER_04_ESP = ["38","TREINTAYOCHO"]
const ANSWER_04_CHI = ["38","THIRTYEIGHT","THIRTY-EIGHT","三十八"]
const ANSWER_05_ENG = ["CAESCB","URANUS"]
const ANSWER_05_ESP = ["KUVYJ","URANO"]
const ANSWER_05_CHI = ["CAESCB","URANUS","天王星"]
const ANSWER_06_ENG = ["PIRATES"]
const ANSWER_06_ESP = ["PIRATAS"]
const ANSWER_06_CHI = ["PIRATES","海盗"]
const ANSWER_EVIL_01 = ["FAWKES"]
const ANSWER_EVIL_02 = ["MMMDCCCLXXXVIII"]
const ANSWER_EVIL_03 = ["WOJTEK"]
const ANSWER_EVIL_04 = ["ZUL'GURUB"]
const ANSWER_EVIL_05 = ["SCP-038","SCP038"]
const ANSWER_EVIL_06 = ["45360"]

@onready var animation = $Animation
@onready var talking = $Talk
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_footsteps = $Footsteps
@onready var mouth = $Head/Mouth
@onready var head_2 = $Head/Head2
@onready var body = $Body/Body
@onready var head = $Head/Head
@onready var sfx_voice_05 = $Voice_05
@onready var sfx_voice_06 = $Voice_06
@onready var sfx_voice_07 = $Voice_07
@onready var sfx_voice_08 = $Voice_08

var name_char = "Chester"
var speak_flag = true
var is_last_text = false
var is_question = false
var flag_wrong_answer = false
var current_text_number = 0
var current_text = []
var hello_text_spanish = ["Hola."]
var hello_text_english = ["Hello."]
var hello_text_chinese = ["你好。"]
var question_01_spanish = ["¿Cuál es el sentido de la vida, el universo y todo lo demás?"]
var question_01_english = ["What is the meaning of life, the universe and everything else?"]
var question_01_chinese = ["生命、宇宙及其他一切的意义是什么？"]
var question_02_spanish = ["¿Cuál es el nombre científico del animal de Australia que cambia drásticamente de aspecto al sacarlo de su hábitat natural?"]
var question_02_english = ["What is the scientific name of the Australian animal that drastically changes its appearance when removed from its natural habitat?"]
var question_02_chinese = ["一种澳大利亚动物在离开自然栖息地后会发生巨大变化，它叫什么名字？"]
var question_03_spanish = ["¿Cuál es el nombre del único deporte que te permite golpear en la cara a tu oponente por capturar a tu caballo?"]
var question_03_english = ["What is the name of the only sport that allows you to punch your opponent in the face because they capture a piece?"]
var question_03_chinese = ["这项唯一一项允许你击打对手的运动名称是什么，因为他们夺取了一块？"]
var question_04_spanish = ["¿Al menos cuántas veces hay que doblar una hoja de 0,01 mm de grosor para cubrir la distancia entre la Comarca y Mordor?"]
var question_04_english = ["At least how many times do you have to fold a 0.01 mm thick sheet of paper to cover the distance between the Shire and Mordor?"]
var question_04_chinese = ["一张0.01毫米厚的纸至少要折叠多少次才能覆盖夏尔和魔多之间的距离？"]
var question_05_spanish = ["La llave es oculta
¿RXVWYT TÑÑPKU XOKBFB CHOMXF AVDEÑF BDÑAFB H?"]
var question_05_english = ["The key is hide
EQEY QBXM MBIA MWXM XUES MCMS BQIX WUEW AHWY MV?"]
var question_05_chinese = ["钥匙是hide
EQEY QBXM MBIA MWXM XUES MCMS BQIX WUEW AHWY MV?"]
var question_06_spanish = ["Según el M.E.V. el calentamiento global es consecuencia de que a partir del siglo XIX ha disminuido el número de _______"]
var question_06_english = ["According to F.S.M. global warming is a consequence of the fact that since the 19th century the number of _______ decrease"]
var question_06_chinese = ["根据F.S.M.，全球变暖是因为自19世纪以来，__的数量减少所导致的。"]
var question_evil_01_spanish = ["Apellido del hombre detrás del verdadero rostro de la máscara más conocida por los internautas."]
var question_evil_01_english = ["Lastname of the man behind the true face of the mask most known to internet users."]
var question_evil_01_chinese = ["网友熟知的面具背后男子的姓氏。"]
var question_evil_02_spanish = ["¿Cuál número te daría la victoria en un concurso de escribir el número más grande según las reglas convencionales del sistema romano?"]
var question_evil_02_english = ["Which number would give you the victory in a contest of writing the largest number with the conventional rules of the Roman numeral system?"]
var question_evil_02_chinese = ["在罗马数字系统的传统规则下，哪个数字将使你在写出最大的数字比赛中获胜？"]
var question_evil_03_spanish = ["Nombre del teniente más peludo de la segunda guerra mundial."]
var question_evil_03_english = ["Name of the hairiest lieutenant of World War II."]
var question_evil_03_chinese = ["第二次世界大战中最毛茸茸的中尉的名字。"]
var question_evil_04_spanish = ["Templo donde una vez un dios provocó la pandemia más grande jamás vista en toda la gran oscuridad del más allá."]
var question_evil_04_english = ["Temple where once a god caused the largest pandemic ever seen in all the great darkn beyond."]
var question_evil_04_chinese = ["曾经一位神在大暗黑之境引发了有史以来最大的瘟疫的寺庙。"]
var question_evil_05_spanish = ["Nombre clave del organismo multicelular con la capacidad de clonar cualquier cosa que toque su ritidoma."]
var question_evil_05_english = ["Clave name of the multicellular organism with the ability to clone anything it touches its rhizome."]
var question_evil_05_chinese = ["多细胞生物的关键名称，具有克隆其根茎触碰的任何物体的能力。"]
var question_evil_06_spanish = ["¿Cuántos números se forman con los dígitos de la cardinalidad de las partes de un conjunto con el primer número perfecto y feliz de elementos?"]
var question_evil_06_english = ["How many numbers are formed with the digits of the cardinality of the parts of a set with the first perfect and happy number of elements?"]
var question_evil_06_chinese = ["用集合的部分的基数的数字能组成多少个数字，其中包含了第一个完美且快乐的数字元素？"]
var all_correct_spanish = ["Lograste responder correctamente todas mis preguntas. ¡Felicidades!, Has ganado mi insignia."]
var all_correct_english = ["You managed to answer all my questions correctly. Congratulations! You have earned my badge."]
var all_correct_chinese = ["你成功地正确回答了我所有的问题。恭喜！你赢得了我的徽章。"]
var bye_text_spanish = ["Hasta luego."]
var bye_text_engish = ["Good bye."]
var bye_text_chinese = ["再见。"]
var correct_answer_spanish = ["Correcto."]
var correct_answer_english = ["That's correct."]
var correct_answer_chinese = ["正确。"]
var incorrect_answer_spanish = ["Incorrecto."]
var incorrect_answer_english = ["That's incorrect."]
var incorrect_answer_chinese = ["不正确。"]
var is_evil = false

func _ready():
	set_sfx_volume()
	var tween = create_tween()
	tween.tween_property(self,"position",CHAR_AT_CENTER_WINDOW_POS,TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(4)
	await get_tree().create_timer(TIME_ON_TWEEN).timeout
	animation.play("IDLE")

func _process(_delta) -> void:
	if self.position == CHAR_AT_CENTER_WINDOW_POS:
		if speak_flag:
			_first_words()

func _first_words() -> void:
	speak_flag = false
	await get_tree().create_timer(0.5).timeout
	change_current_text(0)
	get_parent().get_parent().text_selection()

func set_sfx_volume() -> void:
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func _play_sfx(n:int) -> void:
	match n:
		0: 
			if is_evil:
				sfx_voice_05.play()
			else:
				sfx_voice_01.play()
		1: 
			if is_evil:
				sfx_voice_06.play()
			else:
				sfx_voice_02.play()
		2: 
			if is_evil:
				sfx_voice_07.play()
			else:
				sfx_voice_03.play()
		3: 
			if is_evil:
				sfx_voice_08.play()
			else:
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
		if is_evil:
			mouth.play("Close_evil")
		else:
			mouth.play("Close")
		if !is_last_text and !is_question:
			await get_tree().create_timer(3).timeout
			next_question()
		elif is_last_text:
			delete()

func delete() -> void:
	get_parent().get_parent().reset_var_is_chester_question(false)
	get_parent().get_parent().reset_var_answer(false)
	var tween = create_tween()
	tween.tween_property(self,"position",CHAR_AT_SPAWN_POS,TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(4)
	get_parent().get_parent().on_neighbor_gone()
	await get_tree().create_timer(3).timeout
	get_parent().get_parent().start_time_between_char()
	call_deferred("queue_free")

func talk() -> void:
	talking.play("TALK")
	if is_evil:
		mouth.play("Talking_evil")
	else:
		mouth.play("Talking")

func next_question() -> void:
	get_parent().get_parent().reset_var_answer(false)
	current_text_number += 1
	if flag_wrong_answer:
		current_text_number = LAST_TEXT
	change_current_text(current_text_number)
	get_parent().get_parent().text_selection()

func test_answer(answer:String,question:int) -> void:
	if question != 7:
		answer = _convert_string(answer)
		match question:
			1:
				if is_evil:
					_answer_for(answer,ANSWER_EVIL_01)
				else:
					if Global.language == SPANISH_VALUE:
						_answer_for(answer,ANSWER_01_ESP)
					elif Global.language == ENGLISH_VALUE:
						_answer_for(answer,ANSWER_01_ENG)
					elif Global.language == CHINESE_VALUE:
						_answer_for(answer,ANSWER_01_CHI)
			2:
				if is_evil:
					_answer_for(answer,ANSWER_EVIL_02)
				else:
					if Global.language == SPANISH_VALUE:
						_answer_for(answer,ANSWER_02_ESP)
					elif Global.language == ENGLISH_VALUE:
						_answer_for(answer,ANSWER_02_ENG)
					elif Global.language == CHINESE_VALUE:
						_answer_for(answer,ANSWER_02_CHI)
			3:
				if is_evil:
					_answer_for(answer,ANSWER_EVIL_03)
				else:
					if Global.language == SPANISH_VALUE:
						_answer_for(answer,ANSWER_03_ESP)
					elif Global.language == ENGLISH_VALUE:
						_answer_for(answer,ANSWER_03_ENG)
					elif Global.language == CHINESE_VALUE:
						_answer_for(answer,ANSWER_03_CHI)
			4:
				if is_evil:
					_answer_for(answer,ANSWER_EVIL_04)
				else:
					if Global.language == SPANISH_VALUE:
						_answer_for(answer,ANSWER_04_ESP)
					elif Global.language == ENGLISH_VALUE:
						_answer_for(answer,ANSWER_04_ENG)
					elif Global.language == CHINESE_VALUE:
						_answer_for(answer,ANSWER_04_CHI)
			5:
				if is_evil:
					_answer_for(answer,ANSWER_EVIL_05)
				else:
					if Global.language == SPANISH_VALUE:
						_answer_for(answer,ANSWER_05_ESP)
					elif Global.language == ENGLISH_VALUE:
						_answer_for(answer,ANSWER_05_ENG)
					elif Global.language == CHINESE_VALUE:
						_answer_for(answer,ANSWER_05_CHI)
			6:
				if is_evil:
					_answer_for(answer,ANSWER_EVIL_06)
				else:
					if Global.language == SPANISH_VALUE:
						_answer_for(answer,ANSWER_06_ESP)
					elif Global.language == ENGLISH_VALUE:
						_answer_for(answer,ANSWER_06_ENG)
					elif Global.language == CHINESE_VALUE:
						_answer_for(answer,ANSWER_06_CHI)
		get_parent().get_parent().reset_var_answer(true)
		get_parent().get_parent().text_selection()

func _answer_for(answer,list) -> void:
	if answer in list:
		if Global.language == SPANISH_VALUE:
			current_text = correct_answer_spanish
		elif Global.language == ENGLISH_VALUE:
			current_text = correct_answer_english
		elif Global.language == CHINESE_VALUE:
			current_text = correct_answer_chinese
	else:
		if Global.language == SPANISH_VALUE:
			current_text = incorrect_answer_spanish
		elif Global.language == ENGLISH_VALUE:
			current_text = incorrect_answer_english
		elif Global.language == CHINESE_VALUE:
			current_text = incorrect_answer_chinese
		flag_wrong_answer = true

func _convert_string(string:String):
	string = string.to_upper()
	var resultado = ""
	for i in string:
		if i != " ":
			resultado += i
	return resultado

func change_current_text(n:int) -> void:
	match n:
		0:
			if Global.language == SPANISH_VALUE:
				current_text = hello_text_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = hello_text_english
			elif Global.language == CHINESE_VALUE:
				current_text = hello_text_chinese
		1:
			if is_evil:
				if Global.language == SPANISH_VALUE:
					current_text = question_evil_01_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_evil_01_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_evil_01_chinese
			else:
				if Global.language == SPANISH_VALUE:
					current_text = question_01_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_01_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_01_chinese
			is_question = true
		2:
			if is_evil:
				if Global.language == SPANISH_VALUE:
					current_text = question_evil_02_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_evil_02_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_evil_02_chinese
			else:
				if Global.language == SPANISH_VALUE:
					current_text = question_02_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_02_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_02_chinese
			is_question = true
		3:
			if is_evil:
				if Global.language == SPANISH_VALUE:
					current_text = question_evil_03_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_evil_03_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_evil_03_chinese
			else:
				if Global.language == SPANISH_VALUE:
					current_text = question_03_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_03_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_03_chinese
			is_question = true
		4:
			if is_evil:
				if Global.language == SPANISH_VALUE:
					current_text = question_evil_04_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_evil_04_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_evil_04_chinese
			else:
				if Global.language == SPANISH_VALUE:
					current_text = question_04_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_04_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_04_chinese
			is_question = true
		5:
			if is_evil:
				if Global.language == SPANISH_VALUE:
					current_text = question_evil_05_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_evil_05_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_evil_05_chinese
			else:
				if Global.language == SPANISH_VALUE:
					current_text = question_05_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_05_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_05_chinese
			is_question = true
		6:
			if is_evil:
				if Global.language == SPANISH_VALUE:
					current_text = question_evil_06_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_evil_06_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_evil_06_chinese
			else:
				if Global.language == SPANISH_VALUE:
					current_text = question_06_spanish
				elif Global.language == ENGLISH_VALUE:
					current_text = question_06_english
				elif Global.language == CHINESE_VALUE:
					current_text = question_06_chinese
			is_question = true
		7:
			if Global.language == SPANISH_VALUE:
				current_text = all_correct_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = all_correct_english
			elif Global.language == CHINESE_VALUE:
				current_text = all_correct_chinese
			is_question = false
			get_parent().get_parent().reset_var_is_all_question_ok(true)
		_:
			if Global.language == SPANISH_VALUE:
				current_text = bye_text_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = bye_text_engish
			elif Global.language == CHINESE_VALUE:
				current_text = bye_text_chinese
			is_last_text = true
			is_question = false

func get_text():
	if is_question:
		get_parent().get_parent().reset_var_is_chester_question(true)
	else:
		get_parent().get_parent().reset_var_is_chester_question(false)
	return current_text.duplicate()

func get_if_is_last_text():
	return is_last_text

func get_current_text_number():
	return current_text_number

func _on_voice_01_finished() -> void:
	play_random_sfx()

func nightmare_mode() -> void:
	is_evil = true
	head.visible = false
	head_2.visible = true
	body.visible = true
	mouth.play("Close_evil")
