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
const OFFICE_SCENE = 4
const CHAR_READ_RATE = 0.03
const MOVIE_ROLL_FINAL_POS_Y = Vector2(0,-800)
const MOVIE_ROLL_R_FINAL_POS_Y = Vector2(1845,-800)
const TEXT_LINE_01_ENGLISH = "The following short film is a production of D.D.D. with educational purposes."
const TEXT_LINE_01_SPANISH = "El siguiente cortometraje es una producción del D.D.D. con fines educativos."
const TEXT_LINE_01_CHINESE = "是由D.D.D.制作的，用于教育目的。"
const TEXT_LINE_02_ENGLISH = "Hello.\nIf you're watching this film it's because you're the new doorman in your building."
const TEXT_LINE_02_SPANISH = "Hola.\nSi está viendo este cortometraje es porque eres el nuevo portero de tu edificio." 
const TEXT_LINE_02_CHINESE = "你好。\n如果您正在观看这部短片，那是因为您是您大楼的新门卫。"
const TEXT_LINE_03_ENGLISH = "Your job is to determine whether the person who wants to enter the building is a doppelganger."
const TEXT_LINE_03_SPANISH = "Su trabajo consiste en determinar si la persona que desea entrar al edificio es o no un doppelganger."
const TEXT_LINE_03_CHINESE = "您的工作是确定想要进入大楼的人是否是伪人。"
const TEXT_LINE_04_ENGLISH = "As everyone knows, doppelgangers have the ability to transform into another person and impersonate them."
const TEXT_LINE_04_SPANISH = "Como todos sabemos, los doppelganger tienen la capacidad de transformarse en alguien más y hacerse pasar por ellos."
const TEXT_LINE_04_CHINESE = "众所周知，伪人具有变形和冒充另一个人的能力。"
const TEXT_LINE_05_ENGLISH = "But some are not too good at it and could generate imperfections."
const TEXT_LINE_05_SPANISH = "Pero algunos no son tan buenos en ello y pueden generar imperfecciones."
const TEXT_LINE_05_CHINESE = "但是一些伪人可能并不擅长，可能会出现瑕疵。"
const TEXT_LINE_06_ENGLISH = "You have to pay close attention to the appearance of your neighbors."
const TEXT_LINE_06_SPANISH = "Debe prestar mucha atención a la apariencia física de sus vecinos."
const TEXT_LINE_06_CHINESE = "您应该非常注意您邻居的外貌。"
const TEXT_LINE_07_ENGLISH = "Also, remember to fill out the checklist for each neighbor."
const TEXT_LINE_07_SPANISH = "Además, recuerde completar la lista de verificación de cada vecino."
const TEXT_LINE_07_CHINESE = "另外，请记得完成每位邻居的检查清单。"
const TEXT_LINE_08_ENGLISH = "You can't miss any detail because it could mean death for you and your neighbors."
const TEXT_LINE_08_SPANISH = "No puede dejar pasar ningún detalle porque eso significará la muerte para usted y sus vecinos."
const TEXT_LINE_08_CHINESE = "您不能放过任何细节，因为这对您和您的邻居意味着死亡。"
const TEXT_LINE_09_ENGLISH = "This is the structure of your office. Now we are going to explain how it works."
const TEXT_LINE_09_SPANISH = "Esta es la estructura de su oficina. Ahora vamos a explicar como funciona."
const TEXT_LINE_09_CHINESE = "这是您办公室的结构。现在我们来解释它是如何运作的。"
const TEXT_LINE_10_ENGLISH = "Here is the security window, don't forget to observe very well each individual who approaches."
const TEXT_LINE_10_SPANISH = "Aquí está la ventana de seguridad, recuerde observar bien a cada individuo que se aproxime."
const TEXT_LINE_10_CHINESE = "这是安全窗口，请记住仔细观察每个接近的人。"
const TEXT_LINE_11_ENGLISH = "On the right you have the folders with all the data of each neighbor according to the respective floor."
const TEXT_LINE_11_SPANISH = "A la derecha tiene las carpetas con los datos respectivos de cada vecino según su número de piso."
const TEXT_LINE_11_CHINESE = "在右边，有按照每位邻居的楼层编号排列的文件夹，其中包含了各位邻居的相关资料。"
const TEXT_LINE_12_ENGLISH = "To fill out the checklist take one of the lists in front of you."
const TEXT_LINE_12_SPANISH = "Para completar la lista de verificación tome una de las que hay delante suyo."
const TEXT_LINE_12_CHINESE = "要完成检查清单，请拿起您面前的其中一份。"
const TEXT_LINE_13_ENGLISH = "Receive documents from this hatch."
const TEXT_LINE_13_SPANISH = "Reciba documentos por esta ventanilla."
const TEXT_LINE_13_CHINESE = "通过该窗口接收文件。"
const TEXT_LINE_14_ENGLISH = "If you determine that the individual isn't a doppelganger then allow them into the building with these buttons."
const TEXT_LINE_14_SPANISH = "Si determina que el individuo no es un doppelganger entonces permítale el ingreso al edificio con estos botones."
const TEXT_LINE_14_CHINESE = "如果确定此人不是伪人，请使用这些按钮允许他进入大楼。"
const TEXT_LINE_15_ENGLISH = "Otherwise if you determine that it is in fact a doppelganger press the emergency button and call 3312."
const TEXT_LINE_15_SPANISH = "Si al contrario determina que se trata de un doppelganger presione el botón de emergencia y llame al 3312."
const TEXT_LINE_15_CHINESE = "如果相反地确定是伪人，请按下紧急按钮并拨打3312。"
const TEXT_LINE_16_ENGLISH = "To communicate with the D.D.D. or any apartment in your building, use the telephone in front of you."
const TEXT_LINE_16_SPANISH = "Para comunicarse con el D.D.D. o cualquier apartamento de su edificio, use el teléfono frente a usted."
const TEXT_LINE_16_CHINESE = "要与 D.D.D. 或大楼内的任何公寓通话，请使用您面前的电话。"
const TEXT_LINE_17_ENGLISH = "Your job is really important, so make sure you do it right."
const TEXT_LINE_17_SPANISH = "Su trabajo es muy importante, así que asegúrese de hacerlo bien."
const TEXT_LINE_17_CHINESE = "您的工作非常重要，请确保做得好。"
const TEXT_LINE_18_ENGLISH = "Finally, we congratulate the doorman of the month, Henry."
const TEXT_LINE_18_SPANISH = "Por último, felicitamos al portero del mes, Henry."
const TEXT_LINE_18_CHINESE = "最后，恭喜本月的门卫亨利。"
const TEXT_LINE_19_ENGLISH = "It wasn't that he did an excellent job, but he was the only doorman in the area who didn't get killed by doppelgangers."
const TEXT_LINE_19_SPANISH = "No es que hiciera un excelente trabajo, pero fue el único portero de la zona que no fue asesinado por doppelgangers."
const TEXT_LINE_19_CHINESE = "并不是他做得很出色，但他是该地区唯一一个没有被分身杀死的门卫。"
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
@onready var tripo = $Trypo
@onready var tripo_eye_01 = $Trypo/Eye
@onready var tripo_eye_02 = $Trypo/Eye2
@onready var tripo_eye_03 = $Trypo/Eye3
@onready var tripo_eye_04 = $Trypo/Eye4
@onready var tripo_eye_05 = $Trypo/Eye5
@onready var tripo_eye_06 = $Trypo/Eye6
@onready var tripo_eye_07 = $Trypo/Eye7
@onready var tripo_eye_08 = $Trypo/Eye8
@onready var tripo_eye_09 = $Trypo/Eye9
@onready var tripo_eye_10 = $Trypo/Eye10
@onready var tripo_eye_11 = $Trypo/Eye11
@onready var tripo_eye_12 = $Trypo/Eye12
@onready var tripo_eye_13 = $Trypo/Eye13
@onready var tripo_eye_14 = $Trypo/Eye14
@onready var tripo_eye_15 = $Trypo/Eye15
@onready var tripo_noise = $Trypo/Noise3
@onready var timer_tripo = $Timer_Tripo
@onready var timer_tripo_off = $Timer_Tripo_Noise
@onready var timer_tripo_on = $Timer_Tripo_Noise_ON
@onready var henry_text_01 = $Be_like_Henry
@onready var henry_text_02 = $But_Better
@onready var human_logo = $Logos/Human
@onready var arrow_logo = $Logos/Arrow
@onready var human_2_logo = $Logos/Human2
@onready var doppelganger_logo = $Logos/Doppelganger
@onready var building_logo = $Logos/Building
@onready var blood_logo = $Logos/Blood
@onready var henry_photo = $Logos/Henry
@onready var office_logo = $Logos/Office
@onready var window_logo = $Logos/Window
@onready var folders_logo = $Logos/Folders
@onready var emergency_logo = $Logos/Emergency
@onready var hatch_logo = $Logos/Hatch
@onready var phone_logo = $Logos/Phone
@onready var microphone_logo = $Logos/Micro
@onready var buttons_logo = $Logos/Buttons
@onready var human_on_window = $Logos/Human_window
@onready var sfx_select = $Select
@onready var sfx_accept = $Accept
@onready var sfx_interference = $Interference
@onready var sfx_film_noise = $Film_noise
@onready var sfx_countdown = $Countdown_Pip
@onready var sfx_trypophobia = $Trypophobia
@onready var music = $Music
@onready var sfx_voice_DDD = $Voice_05
@onready var sfx_voice_01 = $Voice_01 
@onready var sfx_voice_02 = $Voice_02
@onready var sfx_voice_03 = $Voice_03 
@onready var sfx_voice_04 = $Voice_04 
@onready var sfx_voice_05 = $Voice_05 

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
	sfx_trypophobia.volume_db  = Global.sound_level
	music.volume_db = Global.music_level
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
		if office_logo.is_visible_in_tree():
			timer_between_text.start(time_tween * 1.8 + TIME_BETWEEN_TEXT_ON_OFFICE_VISIBLE)
		else:
			timer_between_text.start(time_tween * 2 + TIME_BETWEEN_TEXT)
	elif Global.language == ENGLISH_VALUE:
		if office_logo.is_visible_in_tree():
			timer_between_text.start(time_tween + TIME_BETWEEN_TEXT_ON_OFFICE_VISIBLE)
		else:
			timer_between_text.start(time_tween * 1.15 + TIME_BETWEEN_TEXT)
	else:
		if office_logo.is_visible_in_tree():
			timer_between_text.start(time_tween + TIME_BETWEEN_TEXT_ON_OFFICE_VISIBLE)
		else:
			timer_between_text.start(time_tween * 1.1 + TIME_BETWEEN_TEXT)

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
			_tripo_show()
		2:
			music.play()
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_02_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_02_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_02_CHINESE 
			_play_sfx(randi_range(6,9))
		3:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_03_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_03_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_03_CHINESE 
			_play_sfx(randi_range(6,9))
			var tween = create_tween()
			tween.tween_property(human_logo,"position",HUMAN_LINE_3_POS,LOGO_TWEEN_TIME)
			tween.tween_property(human_logo,"position",HUMAN_LINE_3_FINAL_POS,LOGO_TWEEN_TIME/2)
		4:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_04_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_04_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_04_CHINESE 
			_play_sfx(randi_range(6,9))
			var tween = create_tween()
			tween.tween_property(human_logo,"position",HUMAN_LINE_4_POS,TWEEN_TIME)
			await get_tree().create_timer(TWEEN_TIME).timeout
			human_2_logo.visible = true
			await get_tree().create_timer(1).timeout
			var tween2 = create_tween()
			tween2.tween_property(human_2_logo,"position",HUMAN2_LINE_4_POS,TWEEN_TIME*2)
		5:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_05_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_05_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_05_CHINESE 
			_play_sfx(randi_range(6,9))
			var tween = create_tween()
			tween.tween_property(human_2_logo,"scale",HUMAN2_LINE_5_SCALE,LOGO_TWEEN_TIME/2)
			await get_tree().create_timer(LOGO_TWEEN_TIME/2).timeout
			human_2_logo.visible = false
			doppelganger_logo.visible = true
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
		8:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_08_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_08_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_08_CHINESE 
			_play_sfx(randi_range(6,9))
			human_logo.visible = false
			var tween = create_tween()
			tween.tween_property(doppelganger_logo,"position",DOPPEL_LINE_8_POS,TWEEN_TIME)
			await get_tree().create_timer(1).timeout
			arrow_logo.visible = true
			await get_tree().create_timer(1).timeout
			building_logo.visible = true
			await get_tree().create_timer(3).timeout
			blood_logo.visible = true
		9:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_09_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_09_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_09_CHINESE 
			_play_sfx(randi_range(6,9))
			arrow_logo.visible = false
			building_logo.visible = false
			doppelganger_logo.visible = false
			blood_logo.visible = false
			office_logo.visible = true
		10:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_10_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_10_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_10_CHINESE 
			_play_sfx(randi_range(6,9))
			window_logo.visible = true
			window_logo.play("default")
			human_on_window.visible = true
			var tween = create_tween()
			tween.tween_property(human_on_window,"position",HUMAN_WINDOW_POS,TWEEN_TIME*2)
			
		11:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_11_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_11_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_11_CHINESE 
			_play_sfx(randi_range(6,9))
			window_logo.visible = false
			folders_logo.visible = true
			folders_logo.play("default")
		12:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_12_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_12_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_12_CHINESE 
			_play_sfx(randi_range(6,9))
			folders_logo.visible = false
			microphone_logo.visible = true
			microphone_logo.play("default")
		13:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_13_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_13_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_13_CHINESE 
			_play_sfx(randi_range(6,9))
			microphone_logo.visible = false
			hatch_logo.visible = true
			hatch_logo.play("default")
		14:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_14_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_14_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_14_CHINESE 
			_play_sfx(randi_range(6,9))
			hatch_logo.visible = false
			buttons_logo.visible = true
			buttons_logo.play("default")
		15:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_15_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_15_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_15_CHINESE 
			_play_sfx(randi_range(6,9))
			buttons_logo.visible = false
			emergency_logo.visible = true
			emergency_logo.play("default")
		16:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_16_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_16_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_16_CHINESE 
			_play_sfx(randi_range(6,9))
			emergency_logo.visible = false
			phone_logo.visible = true
			phone_logo.play("default")
		17:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_17_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_17_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_17_CHINESE 
			_play_sfx(randi_range(6,9))
			phone_logo.visible = false
		18:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_18_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_18_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_18_CHINESE 
			_play_sfx(randi_range(6,9))
			office_logo.visible = false
			human_on_window.visible = false
			henry_photo.visible = true
		19:
			if Global.language == ENGLISH_VALUE:
				text = TEXT_LINE_19_ENGLISH
			elif Global.language == SPANISH_VALUE:
				text = TEXT_LINE_19_SPANISH 
			elif Global.language == CHINESE_VALUE:
				text = TEXT_LINE_19_CHINESE 
			_play_sfx(randi_range(6,9))
		20:
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
		21:
			if Global.language == SPANISH_VALUE:
				henry_text_02.play("Spanish")
			elif Global.language == ENGLISH_VALUE:
				henry_text_02.play("English")
			elif Global.language == CHINESE_VALUE:
				henry_text_02.play("Chinese")
			henry_text_02.visible = true
			_play_sfx(randi_range(6,9))
		22:
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
	if n_text != 1 and n_text != 22:
		if n_text < 20:
			text_panel.visible = true
		add_text()

func _on_timer_white_noise_timeout() -> void:
	white_noise.visible = false

func _tripo_show() -> void:
	timer_tripo_on.start()
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property(tripo_eye_01,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_02,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_03,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_04,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_05,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_06,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_07,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_08,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_09,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_10,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_11,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_12,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_13,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_14,"rotation",randi()%360+-360,TWEEN_TIME)
	tween.tween_property(tripo_eye_15,"rotation",randi()%360+-360,TWEEN_TIME)
	text_panel.visible = false
	_play_sfx(5)
	if !Global.tripo and !Global.epilepsy:
		tripo.visible = true
	timer_tripo.start()

func _on_timer_tripo_timeout() -> void:
	tripo.visible = false
	_on_timer_between_text_timeout()
	timer_tripo.stop()

func _on_timer_tripo_noise_timeout():
	tripo_noise.visible = false
	timer_tripo_on.start()

func _on_timer_tripo_noise_on_timeout():
	tripo_noise.visible = true
	timer_tripo_off.start()

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
