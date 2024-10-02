extends Node2D

const CHAR_AT_SPAWN_POS = Vector2(100,280)
const CHAR_AT_CENTER_WINDOW_POS = Vector2(980,280)
const TIME_ON_TWEEN = 1.5
const SFX_ADJUTS_LEVEL = 10

@onready var animation = $Animation
@onready var sfx_footsteps = $Footsteps
@onready var mask = $Head/Mask
@onready var tunica = $Head/Tunica
@onready var rope = $Body/Rope

var name_char = "Clown"

func _ready() -> void:
	set_sfx_volume()
	var tween = create_tween()
	tween.tween_property(self,"position",CHAR_AT_CENTER_WINDOW_POS,TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(0)
	await get_tree().create_timer(TIME_ON_TWEEN).timeout
	animation.play("IDLE")
	get_parent().get_parent().show_unlikely()

func set_sfx_volume() -> void:
	sfx_footsteps.volume_db = Global.sound_level - SFX_ADJUTS_LEVEL

func _play_sfx(n:int) -> void:
	match n:
		0: 
			sfx_footsteps.play()

func delete() -> void:
	var tween = create_tween()
	tween.tween_property(self,"position",CHAR_AT_SPAWN_POS,TIME_ON_TWEEN)
	animation.play("WALK")
	_play_sfx(0)
	get_parent().get_parent().on_neighbor_gone()
	await get_tree().create_timer(3).timeout
	get_parent().get_parent().start_time_between_char()
	call_deferred("queue_free")

func nightmare_mode() -> void:
	mask.visible = false
	tunica.visible = true
	rope.visible = true
