extends Node2D

@onready var gold = $Gold
@onready var animation = $Animation

func _ready():
	animation.play("IDLE")

func particles():
	gold.emitting = true
