extends Node2D

const ENGLISH_VALUE = 0
const SPANISH_VALUE = 1
const CHINESE_VALUE = 2
const VISIBLE_RATIO = 1.0

@onready var mouth: AnimatedSprite2D = $Head / Mouth
@onready var animation: AnimationPlayer = $Animation
@onready var talk: AnimationPlayer = $TALK
@onready var voice_05: AudioStreamPlayer = $Voice_05
@onready var voice_06: AudioStreamPlayer = $Voice_06
@onready var voice_07: AudioStreamPlayer = $Voice_07
@onready var voice_08: AudioStreamPlayer = $Voice_08

var current_text = []

func _ready()->void :
	set_sfx_volume()
	animation.play("IDLE")

func set_sfx_volume()->void :
	voice_05.volume_db = Global.sound_level
	voice_06.volume_db = Global.sound_level
	voice_07.volume_db = Global.sound_level
	voice_08.volume_db = Global.sound_level

func change_current_text(_n: int)->void :
	if Global.language == SPANISH_VALUE:
		current_text = ["Debería darte las gracias.", "Gracias a ti pudimos tomar completo control de este edificio.", "Lo siguiente será la ciudad, luego el estado, el país ... ", "Ahora únete con tus compañeros humanos."]
	elif Global.language == ENGLISH_VALUE:
		current_text = ["I should thank you.", "Thanks to you, we were able to take full control of this building.", "Next will be the city, then the state, the country ... ", "Now join with your fellow humans."]
	elif Global.language == CHINESE_VALUE:
		current_text = ["我应该感谢你。", "多亏了你，我们才能完全控制这栋建筑。", "接下来是城市，然后是州，国家......", "现在和你的同伴人类一起加入。"]

func get_text():
	return current_text.duplicate()

func _play_sfx(n: int)->void :
	match n:
		0:
			voice_05.play()
		1:
			voice_06.play()
		2:
			voice_07.play()
		_:
			voice_08.play()

func play_random_sfx()->void :
	var check = get_parent().get_parent().text_label.visible_ratio
	if check != VISIBLE_RATIO:
		_play_sfx(randi_range(0, 3))
		talk.play("TALK")
		mouth.play("TALK")
	else :
		talk.stop()
		mouth.play("CLOSE")

func _on_voice_finished()->void :
	play_random_sfx()
