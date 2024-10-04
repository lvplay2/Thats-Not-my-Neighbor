extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0
const CHAR_AT_SPAWN_POS = Vector2(100, 280)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(980, 280)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10

@onready var animation = $Animation
@onready var talking = $Talk
@onready var sfx_footsteps = $Footsteps
@onready var sfx_voice_01 = $Voice_01
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03
@onready var sfx_voice_04 = $Voice_04
@onready var sfx_voice_sad = $Voice_Sad
@onready var sfx_laughter = $Laughter
@onready var sfx_honk = $Honk
@onready var eyes_normal = $Head / Eyes_Normal
@onready var eyes_sad = $Head / Eyes_Sad
@onready var eyes_angry = $Head / Eyes_Angry
@onready var nose = $Head / Nose
@onready var arms = $Body / Arms
@onready var arms_open = $Body / Arms_Open
@onready var mouth = $Head / Mouth
@onready var cards = $Body / Cards
@onready var card_04 = $Body / Cards / Card04
@onready var card_03 = $Body / Cards / Card03
@onready var card_02 = $Body / Cards / Card02
@onready var card_01 = $Body / Cards / Card01
@onready var card_05 = $Body / Cards / Card05
@onready var card_06 = $Body / Cards / Card06
@onready var sfx_voice_angry = $Voice_angry

var name_char = "Clownba"
var current_text = [" "]
var is_question = false
var is_impaled_text = false
var speak_flag = true
var speak_flag_2 = false
var is_last_text = false
var is_table_empty = false
var almost_last_text = false
var cards_left = 4
var current_text_number = 0
var hello_text_spanish = ["¿Quieres jugar un juego?"]
var hello_text_english = ["Do you want to play a game?"]
var hello_text_chinese = ["你想玩游戏吗？"]
var impaled_text_spanish = ["Protocolo de limpieza completado. \nBla bla bla ..."]
var impaled_text_english = ["Cleaning protocol completed. \nBla bla bla ..."]
var impaled_text_chinese = ["清洁程序已完成。\n布拉布拉布拉..."]
var text_01_spanish = ["¡Muy bien! Vamos a jugar.            \nPrimero permíteme limpiar la mesa."]
var text_01_english = ["Very well! Let's play.           \nFirst let me clean the table."]
var text_01_chinese = ["很好！ 我们来玩吧。         \n首先让我清理一下桌子。"]
var text_02_spanish = ["Listo.\nAhora presta mucha atención que solo explicaré las reglas una vez.", "Jugaremos con cartas, gana quien se quede sin cartas.", "Tomaremos turnos y solo podremos usar una carta por turno.", "Solo se puede usar una carta mayor o igual a la que está en juego.", "O bien alguna de las cartas comodín J,Q,K,A.\nEstás cartas siempre pueden jugarse.", "Cualquier carta le gana a un comodín.", "Si no puedes usar una carta deberás tomar una de la baraja.", "Si puedes jugar la nueva carta, entonces úsala.", "De lo contrario, tu turno termina hasta que tengas 6 cartas.", "Jugaremos el mejor de 3.\nBuena suerte."]
var text_02_english = ["All right.\nNow pay close attention because I will only explain the rules once.", "We will play with cards, the winner is the one who runs out of cards.", "We will take turns and can only use one card per turn.", "Only a card greater than or equal to the one in play can be used.", "Or any of the wildcard cards J, Q, K, A.\nThese cards can always be played.", "Any card beats a wildcard.", "If you can't use a card, you must draw one from the deck.", "If you can play the new card, then use it.", "Otherwise, your turn ends until you have 6 cards.", "We will play the best of 3.\nGood luck."]
var text_02_chinese = ["准备好。\n现在请仔细听，因为我只会解释一次规则。", "我们会用纸牌来玩，赢家是先把手中的牌打完的人。", "我们会轮流进行，每回合只能使用一张牌。", "只能使用比当前牌大或相等的牌。", "或者使用任意一张癞子牌 J、Q、K、A。\n这些牌总是可以打的。", "任何牌都能胜过癞子牌。", "如果你无法使用一张牌，你必须从牌堆中抽一张。", "如果你可以使用新抽的牌，则使用它。", "否则，你的回合直到你有6张卡牌为止。", "我们将进行三局两胜制。\n祝你好运。"]
var text_03_spanish = ["Siguiente ronda. En esta ronda empiezo yo."]
var text_03_english = ["Next round. I start this round."]
var text_03_chinese = ["下一轮。在这一回合我先开始。"]
var text_04_spanish = ["Fin del juego."]
var text_04_english = ["Game over."]
var text_04_chinese = ["游戏结束。"]
var text_05_spanish = ["Hasta luego."]
var text_05_english = ["See you later."]
var text_05_chinese = ["再见。"]
var text_06_spanish = ["Siguiente ronda."]
var text_06_english = ["Next round."]
var text_06_chinese = ["下一轮。"]
var text_07_spanish = ["Puede que hayas ganado esta vez. \nPero ya habrá otra oportunidad.", "Nos volveremos a ver, estoy seguro de eso.", "Y puede que la próxima vez no tengas la misma suerte."]
var text_07_english = ["You may have won this time. \nBut there will be another opportunity.", "We will meet again, I'm sure of it.", "And you may not have the same luck next time."]
var text_07_chinese = ["这次也许你赢了。 \n但会有另一个机会。", "我们会再见面的，我有信心。", "而且下次可能你不会有同样的运气。"]

func _ready()->void :
	set_sfx_volume()
	walk()

func _process(_delta)->void :
	if self.position == CHAR_AT_CENTER_WINDOW_POS:
		if speak_flag:
			_first_words()
		elif speak_flag_2:
			next_text(2)
			get_parent().get_parent().text_selection()

func walk()->void :
	if !speak_flag:
		_play_sfx(7)
		await get_tree().create_timer(0.5).timeout
		_play_sfx(7)
		speak_flag_2 = true
		await get_tree().create_timer(1).timeout
	var tween = create_tween()
	tween.tween_property(self, "position", CHAR_AT_CENTER_WINDOW_POS, TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(0)
	await get_tree().create_timer(TIME_ON_TWEEN).timeout
	animation.play("IDLE")

func set_sfx_volume()->void :
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL
	sfx_voice_01.volume_db = Global.sound_level
	sfx_voice_02.volume_db = Global.sound_level
	sfx_voice_03.volume_db = Global.sound_level
	sfx_voice_04.volume_db = Global.sound_level
	sfx_voice_sad.volume_db = Global.sound_level
	sfx_laughter.volume_db = Global.sound_level
	sfx_honk.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func _first_words()->void :
	speak_flag = false
	change_current_text(0)
	await get_tree().create_timer(0.5).timeout
	get_parent().get_parent().text_selection()

func change_current_text(n: int)->void :
	match n:
		0:
			if Global.language == SPANISH_VALUE:
				current_text = hello_text_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = hello_text_english
			elif Global.language == CHINESE_VALUE:
				current_text = hello_text_chinese
			is_question = true
		1:
			if Global.language == SPANISH_VALUE:
				current_text = impaled_text_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = impaled_text_english
			elif Global.language == CHINESE_VALUE:
				current_text = impaled_text_chinese
			is_question = false
			is_impaled_text = true
		2:
			if Global.language == SPANISH_VALUE:
				current_text = text_01_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = text_01_english
			elif Global.language == CHINESE_VALUE:
				current_text = text_01_chinese
			is_question = false
			is_impaled_text = false
			Global.start_tutorial = true
		3:
			if Global.language == SPANISH_VALUE:
				current_text = text_02_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = text_02_english
			elif Global.language == CHINESE_VALUE:
				current_text = text_02_chinese
		4:
			if Global.language == SPANISH_VALUE:
				current_text = text_03_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = text_03_english
			elif Global.language == CHINESE_VALUE:
				current_text = text_03_chinese
		5:
			if Global.language == SPANISH_VALUE:
				current_text = text_04_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = text_04_english
			elif Global.language == CHINESE_VALUE:
				current_text = text_04_chinese
		6:
			if Global.language == SPANISH_VALUE:
				current_text = text_06_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = text_06_english
			elif Global.language == CHINESE_VALUE:
				current_text = text_06_chinese
		7:
			if Global.language == SPANISH_VALUE:
				current_text = text_07_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = text_07_english
			elif Global.language == CHINESE_VALUE:
				current_text = text_07_chinese
			almost_last_text = true
		_:
			if Global.language == SPANISH_VALUE:
				current_text = text_05_spanish
			elif Global.language == ENGLISH_VALUE:
				current_text = text_05_english
			elif Global.language == CHINESE_VALUE:
				current_text = text_05_chinese
			is_last_text = true

func talk()->void :
	talking.play("TALKING")
	mouth.play("TALK")

func play_random_sfx()->void :
	var check = get_parent().get_parent().text_label.visible_ratio
	if check != VISIBLE_RATIO:
		if Global.killed_by_clown:
			_play_sfx(8)
		else :
			_play_sfx(randi_range(1, 4))
			talk()
	else :
		talking.stop()
		mouth.play("CLOSE")
		if !is_table_empty and !is_question and !is_impaled_text:
			is_table_empty = true
			get_parent().get_parent().clean_table()
		if is_last_text:
			delete()

func next_text(n: int)->void :
	speak_flag_2 = false
	change_current_text(n)

func get_text():
	if is_question:
		get_parent().get_parent().reset_var_is_clownba_question(true)
	else :
		get_parent().get_parent().reset_var_is_clownba_question(false)
	return current_text.duplicate()

func _play_sfx(n: int)->void :
	match n:
		0:
			sfx_footsteps.play()
		1:
			sfx_voice_01.play()
		2:
			sfx_voice_02.play()
		3:
			sfx_voice_03.play()
		4:
			sfx_voice_04.play()
		5:
			sfx_voice_sad.play()
		6:
			sfx_laughter.play()
		7:
			sfx_honk.play()
		_:
			sfx_voice_angry.play()

func get_if_is_last_text():
	return is_last_text

func yes_option()->void :
	next_text(2)
	get_parent().get_parent().text_selection()

func no_option()->void :
	_play_sfx(5)
	eyes_normal.visible = false
	eyes_sad.visible = true
	mouth.play("SAD")

func restart_face()->void :
	await get_tree().create_timer(1).timeout
	eyes_normal.visible = true
	eyes_sad.visible = false
	eyes_angry.visible = false
	mouth.play("CLOSE")

func sad()->void :
	_play_sfx(5)
	eyes_normal.visible = false
	eyes_sad.visible = true
	mouth.play("SAD")
	restart_face()

func angry()->void :
	eyes_normal.visible = false
	eyes_angry.visible = true
	mouth.play("ANGRY")
	_play_sfx(8)
	restart_face()

func laugh()->void :
	_play_sfx(6)
	talking.play("LAUGH")

func card_check(n: int)->void :
	var new_cards_left = cards_left + n
	if cards_left > new_cards_left:
		if card_06.visible:
			card_06.visible = false
		elif card_05.visible:
			card_05.visible = false
		elif card_04.visible:
			card_04.visible = false
		elif card_01.visible:
			card_01.visible = false
		elif card_02.visible:
			card_02.visible = false
		else :
			card_03.visible = false
	else :
		if !card_03.visible:
			card_03.visible = true
		elif !card_02.visible:
			card_02.visible = true
		elif !card_01.visible:
			card_01.visible = true
		elif !card_04.visible:
			card_04.visible = true
		elif !card_05.visible:
			card_05.visible = true
		else :
			card_06.visible = true

func defeat()->void :
	sad()
	await get_tree().create_timer(1).timeout
	eyes_normal.visible = false
	eyes_sad.visible = true
	await get_tree().create_timer(1).timeout
	change_current_text(7)
	get_parent().get_parent().text_selection()

func last_words()->void :
	change_current_text(8)
	get_parent().get_parent().text_selection()

func show_cards()->void :
	cards.visible = true

func winner()->void :
	laugh()
	await get_tree().create_timer(2.5).timeout
	arms.visible = false
	arms_open.visible = true
	eyes_normal.visible = false
	eyes_angry.visible = true
	Global.killed_by_clown = true
	change_current_text(5)
	get_parent().get_parent().text_selection()
	await get_tree().create_timer(3).timeout
	get_parent().get_parent().kill_by_clown()

func impaled_text()->void :
	change_current_text(1)

func _on_voice_finished()->void :
	play_random_sfx()

func new_game(value: bool, emotion: bool)->void :
	if value:
		change_current_text(4)
	else :
		change_current_text(6)
	if emotion:
		sad()
	else :
		laugh()
	await get_tree().create_timer(2.5).timeout
	get_parent().get_parent().text_selection()

func delete()->void :
	var tween = create_tween()
	tween.tween_property(self, "position", CHAR_AT_SPAWN_POS, TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(0)
	get_parent().get_parent().on_neighbor_gone()
	await get_tree().create_timer(3).timeout
	get_parent().get_parent().start_time_between_char()
	call_deferred("queue_free")

func _on_laughter_finished():
	animation.play("IDLE")
	talking.stop()
