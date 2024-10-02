extends Node2D

const MARK_INITIAL_POS_Y = Vector2(0,0)
const MARK_FINAL_POS_Y = Vector2(0,-3240)
const TWEEN_TIME = 0.3
const VISIBLE_RATIO = 1.0
const TIME_BETWEEN_TEXT = 4.0
const TIME_BETWEEN_TEXT_ON_OFFICE_VISIBLE = 6.5
const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const SKIP_ENGLISH = "Skip"
const SKIP_SPANISH = "Omitir"
const SKIP_CHINESE = "跳过场景"
const BUTTONS_OUTLINE_COLOR_BLACK = Color(0,0,0,1)
const BUTTONS_OUTLINE_COLOR_GREY = Color(0.5,0.5,0.5,1)
const LOADING_DIR = "res://Scenes/Loading_screen.tscn"
const OFFICE_SCENE = 7
const CHAR_READ_RATE = 0.03
const MOVIE_ROLL_FINAL_POS_Y = Vector2(0,-800)
const MOVIE_ROLL_R_FINAL_POS_Y = Vector2(1845,-800)
const TEXT_LINE_01_ENGLISH = "The following short film is a production of D.D.D. to promote mental health."
const TEXT_LINE_01_SPANISH = "El siguiente cortometraje es una producción del D.D.D. para promover la salud mental."
const TEXT_LINE_01_CHINESE = "以下短片是由 D.D.D. 制作的，旨在促进心理健康。"
const TEXT_LINE_02_ENGLISH = "Hello.\nIf you are watching this short film, it is because we care about your mental health."
const TEXT_LINE_02_SPANISH = "Hola.\nSi está viendo este cortometraje es porque nos preocupamos por su salud mental." 
const TEXT_LINE_02_CHINESE = "你好。\n如果您正在观看这部短片，那是因为我们关心您的心理健康。"
const TEXT_LINE_03_ENGLISH = "It's common for our employees to have recurring nightmares due to the psychological burden that comes with the doorman position."
const TEXT_LINE_03_SPANISH = "Es común que nuestros empleados tengan pesadillas recurrentes debido a la carga psicológica que deja el puesto de portero."
const TEXT_LINE_03_CHINESE = "我们的员工经常因门卫职位带来的心理负担而频繁做噩梦是很常见的。"
const TEXT_LINE_04_ENGLISH = "That's why we recommend that you use the service provided by the psychology department."
const TEXT_LINE_04_SPANISH = "Es por eso que recomendamos que utilice el servicio que presta el departamento de psicología."
const TEXT_LINE_04_CHINESE = "因此，我们建议您使用心理学部门提供的服务。"
const TEXT_LINE_05_ENGLISH = "Our medical staff is trained to help you cope with the nightmare."
const TEXT_LINE_05_SPANISH = "Nuestro personal médico está capacitado para ayudarte a sobrellevar la pesadilla."
const TEXT_LINE_05_CHINESE = "我们的医务人员接受过培训，可以帮助您应对噩梦。"
const TEXT_LINE_07_ENGLISH = "Our star employee Henry strongly recommends this service."
const TEXT_LINE_07_SPANISH = "Nuestro empleado estrella Henry recomienda encarecidamente este servicio."
const TEXT_LINE_07_CHINESE = "我们的员工亨利强烈推荐这项服务。"
const TEXT_LINE_08_ENGLISH = "He uses it all the time, even when his nightmares haven't stopped after the sessions."
const TEXT_LINE_08_SPANISH = "Lo usa todo el tiempo incluso cuando sus pesadillas no han cesado luego de las sesiones."
const TEXT_LINE_08_CHINESE = "他一直使用，即使他的噩梦还没有停止。"
const TEXT_LINE_06_ENGLISH = "Remember that sleeping well is important for better performance at work."
const TEXT_LINE_06_SPANISH = "Recuerde que dormir bien es importante para dar un mejor rendimiento en el trabajo."
const TEXT_LINE_06_CHINESE = "记住，睡眠充足对工作表现更好很重要。"
const HUMAN_LINE_3_POS = Vector2(970,500) 
const HUMAN_LINE_3_FINAL_POS = Vector2(970,400) 
const LOGO_TWEEN_TIME = 0.5
const HUMAN_LINE_4_POS = Vector2(570,400) 
const HUMAN2_LINE_4_POS = Vector2(1370,400) 
const HUMAN2_LINE_5_SCALE = Vector2(1.2,1.2)
const DOPPEL_LINE_8_POS = Vector2(570,390)
const HUMAN_WINDOW_POS = Vector2(940,250)

@onready var mark = $Mark
@onready var letters = $Countdown/Letters
@onready var count_animation = $Countdown/Count
@onready var number_5 = $Countdown/Number_5
@onready var number_4 = $Countdown/Number_4
@onready var number_3 = $Countdown/Number_3
@onready var number_2 = $Countdown/Number_2
@onready var noise_animation = $Noise
@onready var timer = $Timer
@onready var countdown_sprites = $Countdown
@onready var white_background = $White_Background
@onready var skip_button = $Skip
@onready var ddd_logo_spanish = $DDD/DDD_logo_Spanish
@onready var ddd_logo_english = $DDD/DDD_logo_English
@onready var ddd_logo = $DDD
@onready var label = $Text/Label
@onready var text_panel = $Text
@onready var timer_between_text = $Timer_between_text
@onready var white_noise = $White_Noise
@onready var timer_white_noise = $Timer_white_noise
@onready var henry_text_01 = $Be_like_Henry
@onready var henry_text_02 = $But_Better
@onready var human_logo = $Logos/Human
@onready var henry_photo = $Logos/Henry
@onready var dr = $Logos/Dr
@onready var z = $Logos/Z
@onready var sfx_select = $Select
@onready var sfx_accept = $Accept
@onready var sfx_interference = $Interference
@onready var sfx_film_noise = $Film_noise
@onready var sfx_countdown = $Countdown_Pip
@onready var music = $Music
@onready var sfx_voice_DDD = $Voice_05
@onready var sfx_voice_01 = $Voice_01 
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03 
@onready var sfx_voice_04 = $Voice_04 
@onready var sfx_voice_05 = $Voice_05 
@onready var face = $Logos/Human/Face
@onready var contact = $Contact
@onready var sfx_trypophobia = $Trypophobia
@onready var timer_tripo = $Timer_Tripo

var number_show = 5
var text = " "
var n_text = 0

func _ready() -> void:
	_play_sfx(3)
	count_animation.play("default")
	if !Global.epilepsy:
		noise_animation.play("default")
	_set_text()
	randomize()
	_set_sound_music_level()
	if Global.small_textbox:
		text_panel.scale = Vector2(0.8,0.8)

func _set_sound_music_level() -> void:
	sfx_accept.volume_db = Global.sound_level
	sfx_select.volume_db = Global.sound_level
	sfx_interference.volume_db  = Global.sound_level
	sfx_film_noise.volume_db  = Global.sound_level
	sfx_countdown.volume_db  = Global.sound_level
	music.volume_db = Global.music_level
	sfx_trypophobia.volume_db  = Global.sound_level
	sfx_voice_01.volume_db = Global.sound_level 
	sfx_voice_02.volume_db = Global.sound_level 
	sfx_voice_03.volume_db = Global.sound_level 
	sfx_voice_04.volume_db = Global.sound_level 
	sfx_voice_05.volume_db = Global.sound_level 

func _process(_delta) -> void:
	if !Global.epilepsy:
		_mark_animation()

func _mark_animation() -> void:
	if !Global.epilepsy and randi()%100+1 == 2:
		white_noise.visible = true
		timer_white_noise.start()
	if mark.position == MARK_INITIAL_POS_Y:
		var tween = create_tween()
		tween.tween_property(mark,"position",MARK_FINAL_POS_Y,TWEEN_TIME)
	elif mark.position == MARK_FINAL_POS_Y:
		mark.position = MARK_INITIAL_POS_Y

func _on_count_animation_looped() -> void:
	match number_show:
		5:
			_play_sfx(4)
			number_5.visible = false
			number_4.visible = true
			letters.visible = true
			timer.start()
		4:
			_play_sfx(4)
			number_4.visible = false
			number_3.visible = true
		3:
			_play_sfx(4)
			number_3.visible = false
			number_2.visible = true
			letters.visible = true
			timer.start()
		2:
			_play_sfx(2)
			number_2.visible = false
			countdown_sprites.visible = false
			white_background.visible = false
		1:
			count_animation.stop()
			white_background.visible = true
			_ddd_logo()
	number_show -= 1

func _on_timer_timeout() -> void:
	letters.visible = false

func _set_text() -> void:
	if Global.language == ENGLISH_VALUE:
		skip_button.text = SKIP_ENGLISH
	elif Global.language == SPANISH_VALUE:
		skip_button.text = SKIP_SPANISH
	elif Global.language == CHINESE_VALUE:
		label.add_theme_font_size_override("font_size",60)
		skip_button.position.x -= 170
		skip_button.text = SKIP_CHINESE

func _on_skip_mouse_entered() -> void:
	_play_sfx(0)
	skip_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_GREY)

func _on_skip_mouse_exited() -> void:
	skip_button.add_theme_color_override("font_outline_color",BUTTONS_OUTLINE_COLOR_BLACK)

func _on_skip_pressed() -> void:
	_play_sfx(1)
	await get_tree().create_timer(0.5).timeout
	_change_scene()

func _change_scene() -> void:
	Global.scene = OFFICE_SCENE
	get_tree().change_scene_to_file(LOADING_DIR)

func _ddd_logo() -> void:
	if Global.language == SPANISH_VALUE:
		ddd_logo_spanish.visible = true
	else:
		ddd_logo_english.visible = true
	text_panel.visible = true
	_text_selection(n_text)
	add_text()

func add_text() -> void:
	label.visible_ratio = 0.0
	label.text = text
	label.visible = true
	var tween = create_tween()
	var time_tween = len(text) * CHAR_READ_RATE
	if Global.language == CHINESE_VALUE:
		time_tween = time_tween * 2
	tween.tween_property(label, "visible_ratio", VISIBLE_RATIO, time_tween)
	if Global.language == CHINESE_VALUE:
		timer_between_text.start(time_tween * 1.8 + TIME_BETWEEN_TEXT)
	elif Global.language == ENGLISH_VALUE:
		timer_between_text.start(time_tween + TIME_BETWEEN_TEXT)
	else:
		timer_between_text.start(time_tween + TIME_BETWEEN_TEXT)

func show_contact() -> void:
	contact.visible = true
	text_panel.visible = false
	_play_sfx(5)
	timer_tripo.start()

func _text_selection(n:int) -> void:
	match n:
		0:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_01_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_01_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_01_CHINESE 
			_play_sfx(10)
		1:
			text = " "
			label.text = text
			ddd_logo.visible = false
			face.play("Happy")
			show_contact()
		2:
			music.play()
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_02_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_02_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_02_CHINESE 
			_play_sfx(randi_range(6,9))
			var tween = create_tween()
			tween.tween_property(human_logo,"position",HUMAN_LINE_3_POS,LOGO_TWEEN_TIME)
			tween.tween_property(human_logo,"position",HUMAN_LINE_3_FINAL_POS,LOGO_TWEEN_TIME/2)
		3:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_03_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_03_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_03_CHINESE 
			_play_sfx(randi_range(6,9))
			face.play("Sad")
			z.visible = true
			z.play("IDLE")
		4:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_04_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_04_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_04_CHINESE 
			_play_sfx(randi_range(6,9))
		5:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_05_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_05_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_05_CHINESE 
			_play_sfx(randi_range(6,9))
			z.visible = false
			human_logo.visible = false
			var tween = create_tween()
			tween.tween_property(dr,"position",HUMAN_LINE_3_POS,LOGO_TWEEN_TIME)
			tween.tween_property(dr,"position",HUMAN_LINE_3_FINAL_POS,LOGO_TWEEN_TIME/2)
		6:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_06_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_06_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_06_CHINESE 
			_play_sfx(randi_range(6,9))
		7:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_07_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_07_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_07_CHINESE 
			_play_sfx(randi_range(6,9))
			dr.visible = false
			henry_photo.visible = true
		8:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_08_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_08_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_08_CHINESE 
			_play_sfx(randi_range(6,9))
		9:
			text = " "
			label.text = text
			text_panel.visible = false
			if Global.language == SPANISH_VALUE:
				henry_text_01.play("Spanish")
			elif Global.language == ENGLISH_VALUE:
				henry_text_01.play("English")
			elif Global.language == CHINESE_VALUE:
				henry_text_01.play("Chinese")
			henry_text_01.visible = true
			_play_sfx(randi_range(6,9))
		10:
			if Global.language == SPANISH_VALUE:
				henry_text_02.play("Spanish")
			elif Global.language == ENGLISH_VALUE:
				henry_text_02.play("English")
			elif Global.language == CHINESE_VALUE:
				henry_text_02.play("Chinese")
			henry_text_02.visible = true
			_play_sfx(randi_range(6,9))
		11:
			_play_sfx(2)
			henry_photo.visible = false
			henry_text_01.visible = false
			henry_text_02.visible = false
			white_background.visible = false
			_change_scene()
		_:
			_change_scene()

func _on_timer_between_text_timeout() -> void:
	n_text += 1
	_text_selection(n_text)
	if n_text != 1 and n_text != 11:
		if n_text < 9:
			text_panel.visible = true
		add_text()

func _on_timer_white_noise_timeout() -> void:
	white_noise.visible = false

func _play_sfx(n:int) -> void:
	match n:
		0:
			sfx_select.play()
		1:
			sfx_accept.play()
		2:
			sfx_interference.play()
		3:
			sfx_film_noise.play()
		4:
			sfx_countdown.play()
		5:
			sfx_trypophobia.play()
		6:
			sfx_voice_01.play()
		7:
			sfx_voice_02.play()
		8:
			sfx_voice_03.play()
		9:
			sfx_voice_04.play()
		10:
			sfx_voice_DDD.play()
		_:
			pass

func _play_random_sfx() -> void:
	if label.visible_ratio != VISIBLE_RATIO:
		_play_sfx(randi_range(6,9))

func _on_voice_01_finished() -> void:
	_play_random_sfx()

func _on_voice_02_finished() -> void:
	_play_random_sfx()

func _on_voice_03_finished() -> void:
	_play_random_sfx()

func _on_voice_04_finished() -> void:
	_play_random_sfx()

func _on_timer_tripo_timeout() -> void:
	contact.visible = false
	_on_timer_between_text_timeout()
	timer_tripo.stop()
