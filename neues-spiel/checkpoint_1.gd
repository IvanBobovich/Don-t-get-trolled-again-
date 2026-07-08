extends Area2D

@onready var respawn_sound = $"../respawn_sound"

func _on_body_entered(body: Node2D) -> void:
	respawn_sound.play()
	body.einstiegspunkt = position
