extends Area2D

@onready var leiter = $"."
@onready var collision_shape_2d = $CollisionShape2D
@onready var spieler = $"../CharacterBody2D"


func _ready():
	leiter. visible = false
	collision_shape_2d.disabled = true

func _process (delta: float) -> void:
	if spieler.punkte >= 7:
		leiter.visible = true
		collision_shape_2d.disabled = false
